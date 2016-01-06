<?php
require '../vendor/autoload.php';

// Prepare app
$app = new \Slim\Slim(array(
    'templates.path' => '../templates',
));

/*initialize activerecord*/
ActiveRecord\Config::initialize(function($cfg) {
 $cfg->set_model_directory('models');
 $cfg->set_connections(array(
 'development' => 'mysql:root:karakter2372@localhost/uas-web' //sesuaikan username, password dan database Anda
 ));
});

//## Read
$app->get('/', function () use ($app) {
 $data['tasks'] = Task::find('all');
 $app->view()->setData(array());
 $app->render('task/read.tpl', $data);
 
})->name('tasks');

// Create monolog logger and store logger in container as singleton 
// (Singleton resources retrieve the same log resource definition each time)
$app->container->singleton('log', function () {
    $log = new \Monolog\Logger('slim-skeleton');
    $log->pushHandler(new \Monolog\Handler\StreamHandler('../logs/app.log', \Monolog\Logger::DEBUG));
    return $log;
});

// Prepare view
$app->view(new \Slim\Views\Twig());
$app->view->parserOptions = array(
    'charset' => 'utf-8',
    'cache' => realpath('../templates/cache'),
    'auto_reload' => true,
    'strict_variables' => false,
    'autoescape' => true
);
$app->view->parserExtensions = array(new \Slim\Views\TwigExtension());

// Define routes
$app->get('/', function () use ($app) {
    // Sample log message
    $app->log->info("Slim-Skeleton '/' route");
    // Render index view
    $app->render('index.html');
});

// Run app
$app->run();
