Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260152;
	b=Ls/jMzp6WHTEawVWKBV0Kqat9EM9npjcrCjyHaqSJC3TXJSYrwZgUigI50awB14PpPo+
	 ZST93vw17IZbc+N2G6QOt3R6xgUSPGPIqx2V65SwQTs3HrXT+mmHHQsGjJ8ProQ87PTFI
	 wQ0IQfChRmTGoaGK5TA+X5UgnqVS4oaiUss0QJTkOEYqUmQVIsRQCACWI2AIvv8avhzde
	 xVWcvvuJJexG1rXV7/qSQYD9+oFm/y9TiSFmd4z7K6ob9DMwsJdplRhsPvUwaKLjgkk9b
	 qML5JylluYBBHscnLyn50YvpPOJl6sDK5jf5YazHiJ2lA7A4MYuz/BzoAA/R6KYDDjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wjBhfqfNAu/i5gAOXlQoqv+CdHzgKo3BKhh2OjwT3ic=;
	b=mYudVfN/k8B1FXfu4pwSl1BtmRKGty3TM4d8sm7u/gJ9UwEL78/C+DrKQh5gc8RoYkMi
	 a57ZUED3ulRFVLC9KLlMdgF+2HdtYgInHYBZzg+KPEpRgV0BsQKynTSt3SSoAgVpUBo+N
	 MlSK7/NJyRNvpdCnTg3VJsF2dmlnVa9niOAAgKWD6AAEzaFs9gbVDa8TFvYJH+6L7RUxW
	 5vBerf61t6wPPYpVJRpsKY/JaxfConZQ/uYa/EQvbYb+4k5pqVHoSoAhuDHWIZhFFmxqx
	 Q1v9t8FHUvuLCvE9M4Zjk4fgDQX6v2hLkLo3GQ/rsTfZZ/SnsaAGgFvPGotS7JsNGrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dzhPO/fQ";
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFB2606A326
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BFB2606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dzhPO/fQ
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-188406bb948so1683479c88.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793260151; x=1793864951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wjBhfqfNAu/i5gAOXlQoqv+CdHzgKo3BKhh2OjwT3ic=;
        b=dzhPO/fQ+cjkXDXTba4hzk3aU4lQNEW609vZ0j9AIO5xatasgpNEIaRGNf35MYcmjq
         578l6fGt7d6VcSXf01SaSR3jDoKd1GnWkojLuuzeDghqGZicrIC2ZduBi/0daspyL8bV
         Ejrqfs9puzM2EqfBCQ2IEct9DJRZ+MPEszMIb9ofj/DGxAfpaQhPidkAK2BY5/Wt0NfD
         b/rb4E81rK1vyPqFoECL8ARH88Pm1HJe6ywpzP3ZNIU/op7Bh9/onO0PnQcyOiEZCtiY
         /Y30AxR1UxyR20z0yNy4S2EdZpAzV1LNNOdZvkzOis9TXbTuVwlOHIxlu2CgiJFZf+20
         ovOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260151; x=1793864951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wjBhfqfNAu/i5gAOXlQoqv+CdHzgKo3BKhh2OjwT3ic=;
        b=kZvCgtQ+cSWcK5/6C9Vn8Pt87YpD+lzyb+03bS6PyJ0j+yc4chGfcNBgnF6v789U6D
         Ug6RjSMO62HBFNOQAKhkASUskb4QyDgxykkOqJczYa3endsT14RlKSYRVsmQaJN6YYne
         dRZmQdvaiDIr5VXFxamQVsIepHgHhyOK+GzbSdWSy4YPVdsZZREScrSLm1o1hIBFdGcq
         LPIIjRK4Op1l2P601f2Cr/spIuiplun4mnx8xz/aYvT8LX5VJlwLmMUU+Heeakrz0zhU
         qAAIYZ3bbvTIOGVijUawfk77jjWWgqQ/BvhMprF7Zf6J5l3Onfeo7EejFblAUNeMq5l3
         rk+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzVotiJJ2pkzhcN6nrQCkkvKqSLvvl2k6ES+h30EdUdsU4QW9Z0sGbSgjZzkj4QpZimPIChPpvkKZFF@vger.kernel.org
X-Gm-Message-State: AFq9FYIYGjQ48rWPPvfn96f9UPJGWMJIUDyTOmG5oz7VMccdrBlMMjnp
	PjYKUQlzQitdV1U0WbPZwm7YZ3ijdLknpqf8AU66WDje5hAdwWSkdi6ktf3OWRmYtus=
X-Gm-Gg: AYBFou1nS3F1qZ8zbXiBySwsIJ2xEf5nP9GzZmBS7LjrHlBQEtMGn7KzJkORU7MzBUv
	tb0zrR9g8MilG0+dpqY34bUrabC2gUuhlRYVlZxexuykaYW32dIYJWZioc53pRv8Cxpdltsr7Oe
	g/SJOq2juj0wMp3a6P1h9lNuQHhIEYlySq5ocP1zvHFdKsgAA3vP5RgS+v7IycAMM671MhjUcc0
	AQkinb0IVuko/NB4sel4ncJ8vKQtjCyrnXQILKZp2eaey1HxvccQdvyc5hvU2zk2azQ/N+iv1sW
	iLqtGB8xum/8wmfuBrA+Qpd6ZIncU8tdX3YoeY2ThgmU40DWzjLJ94Udz1xLXG1L1oNnJ6/wRKF
	SEYny/UUPloncv11BU+1REZfjzVXVLjndhCS7QLPgDKSNcV+uDBGs04mUMNC696JfJwmwTv7bkv
	lTItEue01XbWEE14ZC0IccmiZS1Oxead7q4r3paPRjqToEMIJmo7BtRvoik9SIqm/9aIhIJ32lp
	/aYwZzyNi0GkLzAAG4fvH2rqJcyeAA1ZrNPSvfARD2fs5diiWffKkgaAsSVKnkEkRx7Z6nVgxaf
	AVS+SNpIf+eg8kRD98IVOnJ2+rYM
X-Received: by 2002:a05:7022:b04e:b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1a9f3d262b8mr1402604c88.36.1793260151194;
        Thu, 29 Oct 2026 00:49:11 -0700 (PDT)
Received: from localhost ([149.28.89.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm18486398c88.21.2026.10.29.00.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:49:10 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Chang Yu <marcus.yu.56@gmail.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joshua Crofts <joshua.crofts1@gmail.com>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Shi Hao <i.shihao.999@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/2] Add support for AS7343 multi-spectral sensor
Date: Thu, 29 Oct 2026 15:48:49 +0800
Message-ID: <20261029074851.216029-1-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the AMS AS7343 14-channel
multi-spectral sensor.

The sensor has 14 optical channels (11 visible + NIR + clear +
flicker) in total. This initial driver supports reading raw counts
from all 12 spectral channels (11 visible + NIR) via sysfs and basic
power management.

Not yet supported:
- Configurable integration time and gain
- Interrupt support
- Clear (VIS) channel and flicker detection

Patch 1 adds device tree bindings.
Patch 2 adds the driver.

Testing was performed on a Raspberry Pi 4.

Datasheet: https://look.ams-osram.com/m/5f2d27fff9a874d2/original/AS7343-14-Channel-Multi-Spectral-Sensor.pdf

Changes in v7:
  - Specify reg as a const.
  - Move additionalProperties after allOf block.
  - Clear/set PON during suspend/resume.
  - Check for digital saturation before reading spectral data.

Changes in v6:
  - Add a ref to leds/common.yaml for the LDR pin in dt bindings.
  - Convert ATIME and ASTEP range checks to runtime checks.
  - Check for digital saturation before reading spectral data.

Changes in v5:
  - Remove the GPIO pin from dt bindings.
  - Add autosuspend.
  - Start measurements before setting up runtime PM.

Changes in v4:
  - Fix led-max-microamp property in dt bindings.
  - Use REGCACHE_MAPLE and add volatile table.
  - Use PM_RUNTIME_ACQUIRE* when resuming.

Changes in v3:
  - Fix gpio description and example in dt.
  - Only start measurements after suspend action has been registered.
  - Add a mutex and pm_runtime_resume_and_get before reading measurements.

Changes in v2:
  - Add the LDR, the interrupt pin, and the GPIO pin to the dt bindings.
  - Adjust the default gain to x256 and integration time to 50.1ms as
  recommended by the datasheet.
  - Use read_label instead of .extend
  - Remove all unused scan_index related constants.

Chang Yu (2):
  dt-bindings: iio: light: add as7343
  iio: light: add AS7343 multi-spectral sensor driver

 .../bindings/iio/light/ams,as7343.yaml        |  64 +++
 MAINTAINERS                                   |   7 +
 drivers/iio/light/Kconfig                     |  11 +
 drivers/iio/light/Makefile                    |   1 +
 drivers/iio/light/as7343.c                    | 491 ++++++++++++++++++
 5 files changed, 574 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/light/ams,as7343.yaml
 create mode 100644 drivers/iio/light/as7343.c

-- 
2.56.0

