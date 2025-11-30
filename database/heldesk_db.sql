-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS helpdesk_db;
USE helpdesk_db;

-- =======================================
-- Tabla: users
-- =======================================
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =======================================
-- Tabla: tickets
-- =======================================
DROP TABLE IF EXISTS tickets;

CREATE TABLE tickets (
    ticket_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    status ENUM('open', 'in_progress', 'resolved', 'closed') DEFAULT 'open',
    priority ENUM('low', 'medium', 'high', 'urgent') DEFAULT 'medium',
    user_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_tickets_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);


-- =======================================
-- Datos de ejemplo (opcional)
-- =======================================
INSERT INTO users (username, email, password, role) VALUES
('admin', 'admin@helpdesk.com', 'admin123', 'admin'),
('juan', 'juan@example.com', 'juan123', 'user'),
('maria', 'maria@example.com', 'maria123', 'user');

INSERT INTO tickets (title, description, status, priority, user_id) VALUES
('Error al iniciar sesión', 'El usuario no puede iniciar sesión con sus credenciales.', 'open', 'high', 2),
('Problema con impresora', 'La impresora no responde al intentar imprimir.', 'in_progress', 'medium', 3),
('Solicitud de acceso', 'Necesito acceso al sistema contable.', 'closed', 'low', 2);

select*FROM tickets;
select*FROM users;
DESCRIBE tickets;
