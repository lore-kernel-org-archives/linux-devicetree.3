Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6DC3939CE
	for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 09:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782554132; cv=none; b=qZhvZpWGJEpn/hM6F2LMsu1sBybvq0b13ZJw4Svt00SLCzyx1yTbOL1uVmLSusKDppf+Ht3RVRKLKMtAzt3LvIurzukZuTBYY0QyGYWLvfQxRcTrw1h95gTBqeoyBfShdiVHcrPuQMK8Q5mM8D/AZ+4P+SgWGPsFA5+2li2uZjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782554132; c=relaxed/simple;
	bh=JYEB2GGzGuVGn3ZHt1Esr5e6a6hYBrKtQb9w6zIphMY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=mDdPJDpr/fGgXGMaGIMPGrz4NADg4PnDToRWllffaw9ExGy5eax6P8p9fZIX+VUilCsVUeNOfuZVTVOOEsQQv2xKcLFWGvxz7xPWfMRdmbj1k8nZmUz7J8ztYEm45QQ2OpPfZmsEyMX5/Rim1FYITXtCoHdEf3XaemXbDxTkWh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOfYp6sH; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOfYp6sH"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-139a5f4ca15so2061807c88.1
        for <devicetree@vger.kernel.org>; Sat, 27 Jun 2026 02:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782554130; x=1783158930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VUCiXf3YY6LMy+qULWgTh3NgENkEQgjFeYqpd4gaR3M=;
        b=eOfYp6sHFVu7hT7nlbISn7oDnFEu6x+lNBSu7ZqKKgvtsYgbIo1YYzfC7Vv8/lW0gt
         WA1f6oMKfBngfOm8Ta66/guJMswgfZGp2eATrSEs5B2rWj5pnenzk44RrhMxqNCPAI4m
         wSVY/QK3OCaSSzPEJdp2zb1wg6QXAtQ7ALxZgJa5H7nYx0kPfIZ1TA+2fGz7NVg++FGZ
         5BO8vQyOaa2eDNJY3h0JnWTzCLGHXQJABG1kZ8LgaU8/RlrnNhWK/G958CmaF8mLQopA
         51wOnTyLZUFj2I+pPvXwCsLrOuvhtDIolx8o3QUkDkSjngYNv3+ruZZJw50hNDrAJPZp
         YIPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782554130; x=1783158930;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUCiXf3YY6LMy+qULWgTh3NgENkEQgjFeYqpd4gaR3M=;
        b=BCaS0Bw9y7Q1CMtXunUDdOPgidoS4U1ruheRTAL6tq6H9/dbr+QqAqMm4tYSo5BJbZ
         QmD1dFBaEG4NsxKXQ7Z2lupccxl8hUB5TIljwgY9YwMvYXAAtC6DpM+jxo7izJ7OAx+R
         OxgVCdEQwcQnXroPWscM0xDIAy2bLmjFee3/K7f9iA+jgpZjdB1xN9f8bui/onzPrBfh
         ZzQr9cx26Q5UblpwlD+C9MdHvLuXVI/1Ck8gYkW9CXOSkCzE0RaCGwcjaoLFP/rkNT9x
         74+pIgpkN0qxY8r8Tuu5+vMLxoOBattjCFT0QO9t3a8iWpkfQotfzk6Cuzz7UAaIjzcb
         LmJg==
X-Forwarded-Encrypted: i=1; AFNElJ9O4Jbf+JFhfxiwwXSxZNztdlZtfhCqvSl4AY/wZhCdSNcTQp2Cnnj7MVAbuev7tYKLct1MYljXxPJV@vger.kernel.org
X-Gm-Message-State: AOJu0YzDDUoXgSpg6JVm5dvhrgzmxvrm8d801RDbMxYsMHqlyeBNQkQg
	zZJ/eW+/R90Lh5vKS47JLdDEocCtFHFrJlwop3Wjwl/rCCNdyAs3+3w=
X-Gm-Gg: AfdE7cky5i33mDEqcDO6OuUcSYelwYwdw/YP7q0IXTZzxDfserWM3ZLUJLYkz/0iK6W
	03Kdx7LYiRlM234v1V7qjDQtat863l3zYC5gGNhq5tpCoxonlWf4nqainMul1Eek6ErdiDnSbtf
	3jApNW1XzuN2aF09dXL9n4h0nNnrFHH9D4fVHD5UhsehVehCm7Iho0jVoAeKT1IERchhaCMNRi0
	uSO0yaSoTdSC8qk/+fIMVYumP9qdcpLwLHf29c6iIAfn8QpkB2HRi3UUVZvc1Y8d1Is5PML1hp+
	stetN7P2jqnQEhOSA8p+Udl9qHq6/ppNpR7NhVs/6eFe2G1nb4livzyywrK3QwOA9niGVqyfXM1
	qyuJGiJHcq9ibgfgHXBil0ic1vyPUnaheOg+fn9JuT83IR6K5Fi5QcAVVP5Najn1bgHPxvYMwp3
	MO/fMchuhrww7I8ZFQBJUIS6EqF2nNA17Gsog7NgwaAe5pEggow29x
X-Received: by 2002:a05:7022:6b9f:b0:137:4061:8cc2 with SMTP id a92af1059eb24-139dbb134d9mr7904228c88.35.1782554129383;
        Sat, 27 Jun 2026 02:55:29 -0700 (PDT)
Received: from localhost.localdomain ([101.0.62.116])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139e4c33af7sm12886141c88.5.2026.06.27.02.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 02:55:28 -0700 (PDT)
From: Nikhil Gautam <nikhilgtr@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	u.kleine-koenig@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikhil Gautam <nikhilgtr@gmail.com>
Subject: [PATCH v4 0/2] iio: magnetometer: add support for Melexis MLX90393
Date: Sat, 27 Jun 2026 15:25:17 +0530
Message-Id: <20260627095519.8377-1-nikhilgtr@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

This series adds initial Industrial I/O subsystem support for the
Melexis MLX90393 3-axis magnetometer and temperature sensor.

The MLX90393 supports both I2C and SPI interfaces. This series
implements support for the I2C interface while keeping the driver
structure transport-independent to simplify future SPI support.

The device uses a command-based communication protocol rather than a
conventional register-addressed interface. A small transport abstraction
layer is therefore used instead of regmap to share the common sensor
logic between the current I2C implementation and future SPI support.

Currently supported features:

* Raw magnetic field measurements for X/Y/Z axes
* Raw temperature measurements
* Configurable gain/scale selection
* Configurable oversampling ratio
* Direct mode operation through the IIO subsystem
* I2C interface support

The driver has been tested on Raspberry Pi 5 hardware using an
MLX90393 sensor connected over I2C. Magnetic field and temperature
measurements were verified through the IIO sysfs interface.

Datasheet:
https://www.melexis.com/en/documents/documentation/datasheets/datasheet-mlx90393

Previous submission:
v3: https://lore.kernel.org/linux-iio/20260627005843.7786-3-nikhilgtr@gmail.com/T/#u
v2: https://lore.kernel.org/linux-iio/20260618160141.11409-1-nikhilgtr@gmail.com/T/#t
v1: https://lore.kernel.org/linux-iio/20260510191010.155380-1-nikhilgtr@gmail.com/

Changes in v4:
[DT]
* Updated the example to include the required vdd-supply and
  vddio-supply properties.
* Added fixed regulator nodes to the example so it passes dt_binding_check.

[IIO]
* No Change

Changes in v3:
[DT]

* Made vdd-supply and vddio-supply required properties.
* Moved the MAINTAINERS entry to the correct alphabetical position.

[IIO]

* Added the publicly available MLX90393 datasheet reference.
* Clarified the motivation for introducing a dedicated MLX90393 driver.
* Added the I2C device ID table and switched to designated initializers.
* Added a forward declaration for struct device to reduce unnecessary
  header dependencies.
* Added symbol namespaces.
* Improved include usage.
* Improved status validation and consistency of conditional checks.
* Added comments documenting protocol encoding, initialization delays,
  and temperature conversion constants derived from the datasheet.
* Improved naming, formatting, indentation and general coding style.
* Addressed all review comments from Andy Shevchenko,
  Uwe Kleine-König and Krzysztof Kozlowski.

Changes in v2:
[DT]

* Extended the DT binding to document power supply regulators and
  optional interrupt and trigger GPIOs.

[IIO]

* Removed the RFC tag based on reviewer feedback.
* Added a MAINTAINERS entry as part of the initial submission and
  expanded it in the driver patch.
* Reworked the scale availability implementation to simplify the
  data layout and eliminate the need for constructing a temporary
  table, avoiding potential race conditions.
* Replaced usleep_range() with fsleep() where appropriate and
  documented initialization delays.
* Simplified helper functions and improved error handling by
  returning directly where appropriate.
* Reduced unnecessary local variables and line wrapping to improve
  readability and align with kernel coding style.
* Added comments for lock protection and command definitions to
  improve code clarity.
* Switched to devm_mutex_init() and cleaned up include usage in
  accordance with the "include what you use" principle.
* Improved consistency across the driver, including conditional
  handling, switch statements, formatting and general code style.
* Addressed all review comments from Jonathan Cameron.

Many thanks to Jonathan Cameron, Andy Shevchenko,
Uwe Kleine-König and Krzysztof Kozlowski for their detailed reviews
and valuable feedback, which significantly improved this series.

Further review and comments are greatly appreciated.

Thanks,
Nikhil Gautam

Nikhil Gautam (2):
  dt-bindings: iio: magnetometer: add Melexis MLX90393
  iio: magnetometer: add support for Melexis MLX90393

 .../iio/magnetometer/melexis,mlx90393.yaml    |  63 ++
 MAINTAINERS                                   |   7 +
 drivers/iio/magnetometer/Kconfig              |  10 +
 drivers/iio/magnetometer/Makefile             |   2 +
 drivers/iio/magnetometer/mlx90393.h           |  73 ++
 drivers/iio/magnetometer/mlx90393_core.c      | 701 ++++++++++++++++++
 drivers/iio/magnetometer/mlx90393_i2c.c       |  76 ++
 7 files changed, 932 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/melexis,mlx90393.yaml
 create mode 100644 drivers/iio/magnetometer/mlx90393.h
 create mode 100644 drivers/iio/magnetometer/mlx90393_core.c
 create mode 100644 drivers/iio/magnetometer/mlx90393_i2c.c

-- 
2.39.5

