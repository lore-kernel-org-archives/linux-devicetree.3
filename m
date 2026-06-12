Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA7638D3F1
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268402; cv=none; b=Ho84zcVq3wsePMIPFN/DrVoJ4fZBMuz8MqmzfC0kv4LA5uOAy60S1NE5dhG7VAoH2OC01dJbynPyBjoc+wc3gW0jV+9z7aNrf6p/w3jbjjE/eoVxy6jigRS/AcS6upeFDzoqoCg2TA9qnOYro6J1JhffRhf24hXqoNh/dOYG2QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268402; c=relaxed/simple;
	bh=F7odNu1ja7J6Tec4NNUJr33ZpZFClpcehgSpY+hF7n4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wxo9MlfAmHjs5SkN/+jKAXw7QU7qE2wCfY5x19dcDhKRDw43V3PAioNRaAy8P1r9qvT+dfJAv8JPcgoSVDmsKQUt3K+Fku7jUi5kDq4gdEI2zGDQQwIxzmWNAtW2K6hsXYWthhlcFEu2vjID8Gg2qaZ8zkac0/J2O0ENa69213c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2c132ac5ec2so9408665ad.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 05:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268400; x=1781873200;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tjjr9qakYO64wRYHrlYQ+ZeiGSePqUXQbj+wVa5ikCU=;
        b=AqLHi/hhHPfAz4mugQAB4sJnDPuzg3X1p7gMkKvrARitmZjlxl4FJy/uFsrQe0vJe2
         jINxzwVBhDXfCJyspQ8QeecG47ikS5KaBX/BlJaJz9EUDlTU9RQ3cH8OGCM/7qm3Ayo4
         iGTHS1o6xBbtjvcIigxFIIBcGuQL9nVdf4u+5rc6x4bPpOBqUZPiZo7+H3ktfsGokoXz
         xvIJXECdc//7jiL7ANrOFo4trViKIhcST93FfPUfLARC49j1AP3cDufqJGIX3ifUC1WI
         JvpvAh6mEJwOX7ezSwTo1yYGTPDMh/se0mzK0Gndv8apPGnXgGNuoynOCFHGssBbrfWE
         TD7Q==
X-Forwarded-Encrypted: i=1; AFNElJ8upqQatJTkRY/K/xTEd66v57xePx1JwOVogi+nGiRrnk5WpcVSk5tCENevI+vcNN0ZDwYyq+wvVnjl@vger.kernel.org
X-Gm-Message-State: AOJu0YyRATi/qldiAPVcZPRCxfhR2MT153Chg5RtmD6kCkmVYBDSJzFl
	D83Tli6nQZ4qE0hol6t3VsUrf9g6nw0yswiWQ8CJ5CNoLixHKu+iADRn
X-Gm-Gg: Acq92OHMkCT/kcTDnV7WipgkHbsAeWPUUUWmmiXbFK+I8YG0TOqEEC7fIDlSCPwD0J1
	lukj56kuqvglBwEMyqpfTkI3kdNVXc/8vU6JptERjPa5GYR7IWp7gIvNt9nmARcXeSGqBmnv8gY
	20WTdBDRhCciaR7OzI2PwLhbkeLqABlUzFDmSmdfRovtbZx3n+5cav65xewOjGn09l9UO6luYuj
	leGdDuJB9JCiFTIMRurIZN9UmxLZuB0aVr6p86vmBuX88BsC206Jv+kavbul7OVK5A9LimkIrH+
	cpMznBC3MQU9OpKDsNk+y0BIyHiJbOb58tgeNN5924uMOf2jJV/PiekS5T2CFrZ0VPSvPZKJTvp
	RijUGgwByHrEV0+pVCbKmFV1F8Aho0YQEc8rf90qsVGcoffn3JwjTLMw66Oj+Ugy0JaoGgRASHk
	NpqnI8JqM31FZsdk8roE6L3qziZqmHokkioG7SlHqf2h9w4Kr85zhUsQVS9DChg2HQPO+HhuRlJ
	R20ni/CFFGfjdDhMLwpziikwrCTQBJIEqKFoDNWJKc/dor+Au0HVisBP6rSiKny01NYeFormCwE
	iDjpfet5hZ6EEIoW
X-Received: by 2002:a17:903:384c:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2c410601d53mr32046305ad.15.1781268400144;
        Fri, 12 Jun 2026 05:46:40 -0700 (PDT)
Received: from fedora ([42.0.4.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb5411sm21115625ad.32.2026.06.12.05.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 05:46:39 -0700 (PDT)
From: Siratul Islam <email@sirat.me>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siratul Islam <email@sirat.me>
Subject: [PATCH 0/3] iio: magnetometer: add driver for QST QMC5883L Sensor
Date: Fri, 12 Jun 2026 18:45:24 +0600
Message-ID: <20260612124557.13750-1-email@sirat.me>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces the QST QMC5883L 3-Axis Magnetic Sensor
driver. It is a simple device with minimal magnetometer functionalities.
Commonly used as (software incompatible) replacement for the
Honeywell HMC5883L sensor.

This driver implements the basic functionalities of the QMC5883L sensor,
and intentionally leaves out some features like DRDY interrupt pin support
and power management for simplicity, both of which will be addressed
in future patches.

There was an attempt to introduce this device about an year ago but
the author seems to have abandoned the patch series. Since the device
is simple enough, I decided to start from scratch.

Note: I also noticed a patch for the QMC5883P variant. Despite similar
naming, the sensors are different including different register maps,
so these devices are not compatible with each other.


Siratul Islam (3):
  dt-bindings: add entry for qstcorp
  dt-bindings: iio: magnetometer: add QST QMC5883L Sensor
  iio: magnetometer: add driver for QST QMC5883L Sensor

 .../iio/magnetometer/qstcorp,qmc5883l.yaml    |  48 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/iio/magnetometer/Kconfig              |  11 +
 drivers/iio/magnetometer/Makefile             |   2 +
 drivers/iio/magnetometer/qmc5883l.c           | 512 ++++++++++++++++++
 6 files changed, 582 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/magnetometer/qstcorp,qmc5883l.yaml
 create mode 100644 drivers/iio/magnetometer/qmc5883l.c

--
2.54.0

