CREATE TABLE eventos (
    id_evento INT PRIMARY KEY,
    nombre_evento VARCHAR(255) NOT NULL,
    organizacion VARCHAR(100) NOT NULL,
    fecha_evento DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    lugar VARCHAR(255) NOT NULL,
    tipo_evento VARCHAR(100) NOT NULL,
    tema_principal VARCHAR(100) NOT NULL,
    es_gratuito BOOLEAN NOT NULL,
    url_registro VARCHAR(255)
);

# Carga datos de ejemplo en la tabla de eventos
INSERT INTO eventos (id_evento, nombre_evento, organizacion, fecha_evento, hora_inicio, lugar, tipo_evento, tema_principal, es_gratuito, url_registro) VALUES
(1, 'Cloud Study Jam: Google Cloud Basics', 'GDG Open Lima', '2025-07-15', '18:00:00', 'Auditorio UNI', 'Taller', 'Cloud Computing', TRUE, 'https://gdgopenlima.com'),
(2, 'Machine Learning Summit', 'DSC UNI', '2025-08-22', '09:00:00', 'Centro de Convenciones de Lima', 'Conferencia', 'Inteligencia Artificial', TRUE, 'https://developerstudentclubuni.com'),
(3, 'DevFest Lima 2025', 'GDG Open Lima', '2025-11-30', '08:30:00', 'Open PUCP', 'Conferencia', 'Desarrollo de Software', TRUE, 'https://gdgopenlima.com'),
(4, 'Workshop: Desarrollo Web con Flutter', 'DSC UNI', '2025-09-10', '17:30:00', 'Plataforma Virtual', 'Taller', 'Mobile Development', TRUE, 'https://developerstudentclubuni.com'),
(5, 'Meetup AI: TensorFlow y Keras', 'GDG Open Lima', '2025-07-28', '19:00:00', 'Google Campus Lima', 'Meetup', 'Inteligencia Artificial', TRUE, 'https://gdgopenlima.com'),
(6, 'Conferencia Cloud: Serverless en GCP', 'DSC UNI', '2025-10-05', '10:00:00', 'Auditorio UNI', 'Conferencia', 'Cloud Computing', FALSE, 'https://developerstudentclubuni.com'),
(7, 'Hackathon: Soluciones para Ciudades', 'GDG Open Lima', '2025-10-20', '09:00:00', 'Incubadora StartUP', 'Hackathon', 'Desarrollo de Software', TRUE, 'https://gdgopenlima.com');

SELECT * FROM eventos;