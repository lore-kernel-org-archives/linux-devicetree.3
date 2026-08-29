Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3A319B5A3
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 06:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787985490; cv=none; b=D0nzGLhcb3yjlxKGEusIYfsON8uTBPH6ulszU5qNoj7URXBwxzvOEJbl6ugZfJ2T6aylE04dtDPBTAk/fCphL5LnE9sYwrBsF2zXTRLjm+CKyUxydCJTmsswY1HbgR9i6AF4uzImAoSMSmFXoFvkKNPZIAUSQsXBLipNGpGucxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787985490; c=relaxed/simple;
	bh=r8bYo07SpGbBBI7dnVtYCZIooDNABB+5RG6MHH6OO1s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Rr2lmbk2s9DZPanQ22BtA6VhagZdQOez5IF4IbuGhzrpXFUcDW9409f8sgZrrMGOwvaOGMBlK+D9myDhPlw/qDq7frphHGJYCBUMOpNusXmiF9AhdrnHIS3xJuotdivuI3ONxgrLPQ8xw36gZNc/xJ7upyOqp1LLPERytYLcNgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nk7bmGkp; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nk7bmGkp"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so1805657a91.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 23:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787985489; x=1788590289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9gUDHNOKmIoQbqe9mzJt0j0l2zbHlvksIrYcKhCoTP4=;
        b=nk7bmGkpOL0RrH8PMw2ZVT2dWr/c9K/FtOSqnOnNGlOnlTZ+IvgSU1y6xRqdk2RFgY
         Nf++jc3ul/8/U/dyYXRGxiuRETxFydD2wj+KnyTl7TdoZqO4euOCmtdUUm26TgQ3u2g3
         moIYHITpwuUJ/ZmVryBm+v/zpaqutp5HIipMGSK0o6ve/jfNkhTFy5qUjjJqlW0s6+Tk
         sa8esu8++3NkchacyzayLq4Ltg0riPyfZLxlTvjrYGIto2WpzyCvxdPBq1sVf4r4nUOB
         V9CovCPx88OQX3fdCXy0VIK93IHzIRz5I+zY2LAlGUH1ZYbxn9+n3ttOYg/IiO1c0Cvo
         qX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787985489; x=1788590289;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9gUDHNOKmIoQbqe9mzJt0j0l2zbHlvksIrYcKhCoTP4=;
        b=Y720ZhJATG+OuhqD+hzMTMCF9NLKlpxmz/Ho8sP1ODp9KOPJmPT7VGUNhxsMN5H7uL
         Jm3BaAHw/j8m9YGMss+QaXwRQ84oLLxs7xUcByk9Mjj4QrBikeM7Nz/PJdCtwCHmJqOz
         lJUqJ5qReFConUJiXvX1wfSh8YImOIFxFbIXsQ7fbT5syUtc2Iuj6U4tE8Jqetn8IwPN
         lq/GpdSL/KDgSnHhT1aL8ze1FpOBjstsuceKJM4bww4Nq1D0tmPCETI2kQz7f7w9oXqX
         m4M2SkyiQxs2DHAslDMXtkukMeZZ6hPUsE/kJyZbtvCzFR7WVXbGvYLgfBwq0A6HChC+
         q1JA==
X-Forwarded-Encrypted: i=1; AKwUvBybsqoSBs1qdrSxmLCvv3jh7dvcSpTENdQ3QXFvKYLUlYMMKEZSv9nH81MhI1d3hHX0DVwedObg7yp3@vger.kernel.org
X-Gm-Message-State: AFuF++kbQUoM5NBSljuqiJTxDMtzJfpODRbhY2pg48WkEc8IlIuPeblW
	iPkNs4Cph1a0SoGJ07bumeNUh54nqexD2kyElkAcWorWycLDczixGLU=
X-Gm-Gg: AYBFou2Q8qYlWUR+yH5S+SBnIykL8KObzQBJ+eNDK0KkV7YLXf1jZS1J7ePH9JqmIyu
	ZPQhvaJPrHr7Zy5wdUJWZet6c+OzfMPgG4S0Tmt1YLHWr+jlm996tUJMS9KnvPLFJKKwkYFrnSc
	0zimOJqVASOfUhcDLbOPX1lkzAEKQj9emyneXZNHgwK6knypOEZ7495DskMR2sTs9VR9kywKeXs
	EN+AFAOCepXKBGslyBVuxkw9EmaEYo7PXSiElz45NQJTuHOgNzgkBfolyHy6sTdzXCCXBQy9yb5
	I9JregDST6+W7DEFIPNs1tyUeB7E21CyFoollnKcOmjT0WR4lRZsl3GFyUHuBe6n0oviLrCL1Nh
	tCY88fguUn/b/FXS/L2RxzZ4+f9VvybyZQfzksZZvnF5FEMk16uXZxfTsjGcKhdjo/PmlW9XeEM
	ECnRoivdYG6F1nZBIMzhp7ZHEfJ6tpaGEleLPBd7XVsAzSefC1/9JRAUPUvimFQ85MpXFtAid0I
	NWSxz0sWtqchoMf2bWgKmoLDYs39lDEx/Egwrg=
X-Received: by 2002:a17:90b:1644:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-3969ba3c851mr22712524a91.4.1787985488496;
        Fri, 28 Aug 2026 23:38:08 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d1abbdsm10957539c88.2.2026.08.28.23.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:38:08 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v3 0/3] Add support for CH1115 Controller
Date: Sat, 29 Aug 2026 03:32:12 -0300
Message-ID: <cover.1787973729.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series add support for the CH1115 Controller [1].
It is a monochrome dot matrix OLED controller that supports several
interfaces such as SPI and I2C.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

This is the first driver I write. The work is based on the driver
located at:
- drivers/gpu/drm/sitronix/st7571-i2c.c
- drivers/gpu/drm/sitronix/st7571.c

Tested with Raspberry Pi 3b+.

Changelog:

v3:
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Removed "chipwealth,contrast" property (added backlight_device
    support in driver's code)
  - Renamed "chipwealth,invert" -> "chipwealth,inverted"
  - Added default value to "chipwealth,offset"
  - Removed 'status = "okay"' from example
  - Indented example with 4 spaces as stated in the documentation [4]
- In driver code:
  - Added support for backlight_device
  - Replaced drm_dev_unregister with drm_dev_unplug to cover the dt
    overlay unload case
  - Executing drm shutdown operations before turning off the display
  - Checking that the width (panel-timing.hactive) and height
    (panel-timing.vactive) parameters are greater than 0

v2: [3]
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Fixed linter problems
  - Replaced first_page property with offset
- In driver code:
  - Fixed dst_pitch calculation
  - Renamed file from ch1115.c to ch1115-i2c.c
  - Support flip-vertical and flip-horizontal dt properties
  - Fixed several things found by sashiko-ai

v1: [2]

[1] https://datasheet4u.com/download/1576606/CH1115.html
[2] https://lore.kernel.org/all/cover.1786110720.git.nico.antinori.7@gmail.com/
[3] https://lore.kernel.org/all/cover.1787321297.git.nico.antinori.7@gmail.com/
[4] https://docs.kernel.org/devicetree/bindings/writing-schema.html#annotated-example-schema

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  81 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/chipwealth/Kconfig            |  16 +
 drivers/gpu/drm/chipwealth/Makefile           |   3 +
 drivers/gpu/drm/chipwealth/ch1115-i2c.c       | 887 ++++++++++++++++++
 8 files changed, 997 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/chipwealth/Kconfig
 create mode 100644 drivers/gpu/drm/chipwealth/Makefile
 create mode 100644 drivers/gpu/drm/chipwealth/ch1115-i2c.c

--
2.47.3

