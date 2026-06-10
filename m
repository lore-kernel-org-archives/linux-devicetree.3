Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08985405C2F
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104431; cv=none; b=QpBPMxJl5uD6hstHeKyhnrOxdMLT9Eb/EyhPTWdbT5G1pJuUz5UGa1tEbu7aCVczZX8Icple1jJeF00M5uuCL0CCLNMta4m35YO//nf5gVlz6FbuMCj/avb7ZowKYA95ffetYiBlOo1e4elOjm8SEuF671Qp7pnPHdjdr7cx25w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104431; c=relaxed/simple;
	bh=ZywlfbF41j2Nded7OQmsl0r2Xwazx+xj+hhYFdpigSM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cQcWYgMresGIwC9KgCcP5QtE6BE4Tf/H0Qhl8iCxYFIOLSfWjTudQY8GcLOKrAqw+ELOSSG5JZUeAKWA3ihopFjwz88AgF4FGkQnT4g1VLFZjKnyvZ3NJJ8X+HoEgQlZCDDmzrui6tGRtdX5AheMyDNlSrP2uTWqSal39JJptbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fdrfmLXd; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdrfmLXd"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c8573e75425so2698481a12.2
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781104429; x=1781709229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SN2WYk0Xb543ogGLjaeUCwmB6Ei9KYDO2yTRMSZaVpY=;
        b=fdrfmLXdLBBmNFgpj9WWZcpjiv2zJ4H4C9+UzMHGJcfN+ItNolsWGwwYzaHjYRH7Ee
         HlSLYKpRFqjupt70WkgSATJiOIn8GTyvD8W5l+AflrxX5cx6ULpCmlZbjPoRamF6fpZ8
         4uxzy15VhwDngIyZKUgNoFDjza/5EzTyAKBckGzeiINSFinAbNoV1GdzTlir6hlBqojj
         yifKHid4vhlffYStiQzMmqOeJdkdQjvzYYO1/tX0WGstUblvTnuNpcrpYbMxxpEDiQ4I
         ByVGft2oIgZTBT8DSYC8KwMRT/eb1cRwRprpAOYQ2wa2TvGd5tnuTR/VQ5ZPp53a18eT
         5kHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781104429; x=1781709229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SN2WYk0Xb543ogGLjaeUCwmB6Ei9KYDO2yTRMSZaVpY=;
        b=l4r5lTI9hiJx92q0yVNhMHCeVPfFDG1I+kk5aFbtXfWeUmltXjkZFVqa225uO3S0o3
         XM3CfBerrGh5QRMZnx4a2TJ48l3kffApwrDedsXNYbybC0+O1GHnL+9tdHCbUJJu6PGe
         rlK9g1bvpbI6Egjgxg370GXXaX5GPe5Upv3pM+BJL5pS/pdl5Lgz6fmW4uUFfKCU40YE
         rvtfeDGNtJsBZw0osjSHB9dKntrQ9MW8AWnydeY0OleyoWdN5HlXv1Zo+g9Q0GVVPnjC
         cyzUumRAPW60CkomUQkxGGN++BzjNaGukMt5tNS/niQ/PKIBZF0L/9WCkbRpKO4FfXUv
         s0Fg==
X-Forwarded-Encrypted: i=1; AFNElJ/D4hTbcJl+YtAUYfrAYLaU5XUGFLljm0a7a6atMMQm4X7TP5dTHuHmSJQ0bZHx3uKQ8X1OtARUAZXn@vger.kernel.org
X-Gm-Message-State: AOJu0YyYxAJaNHNYkLoB2XUzOWUwvrIXin098GYXY1ondZXqEsIo3kcq
	n6y81srz5DOq5wlb9i2Gqj3ghqoXEGpO6JrcX6UfjyvOFIrSJVodRAGh
X-Gm-Gg: Acq92OGJjdey4Q3P+NWwjmxNbXc0+6WsEabYIpY6JSm3R2yuJQKcTPCDzEzs2RI4/Cb
	WSrFMCFzOAv87tfTmgOi8Y94XjrmWf6oPcGXnXjfhRSiG4cAIy9vZrGWOsF+GMAHkKi0I12Mm8e
	HhkZOvgdec3fz2r6xBqvrJdYMdgsogrg+mmtd2ewB7MqvoXQlnRIbdJwFNdRo8QEqFNrKbgafOO
	vF2Gx1y9Un/9J60dwsAnk/9PV7EtjMWyHc+YQMkyIesoLlaaMaHAqgIEI0lWSrcAtjiV2Nc/E6y
	8yAvQmRWf1twkKETlBj9aKWl1Kn+TvWymTqVF8eBxT886lN1cNLyWcygjJTGSjwm4O41lamb22o
	dvC0unZrcHsoGRlPdLBcjLVvVpl975fsGxU3zQdk88eoXHVD93GLFejbBO5jzFhfgO5K7Xf7mRr
	RALo/o6bRWkgrRi0pgaTGIUHA=
X-Received: by 2002:a17:903:1252:b0:2c0:c625:4010 with SMTP id d9443c01a7336-2c1e8102377mr281161125ad.32.1781104429228;
        Wed, 10 Jun 2026 08:13:49 -0700 (PDT)
Received: from ltu.. ([171.245.6.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm254066195ad.80.2026.06.10.08.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 08:13:48 -0700 (PDT)
From: Nguyen Minh Tien <zizuzacker@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	zizuzacker@gmail.com
Subject: [PATCH 0/2] iio: adc: Add Texas Instruments ADS1220 ADC
Date: Wed, 10 Jun 2026 22:13:40 +0700
Message-Id: <20260610151342.44274-1-zizuzacker@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the Texas Instruments ADS1220, a 24-bit,
2-kSPS, 4-channel delta-sigma ADC with an SPI (mode 1) interface, a
programmable gain amplifier (1 to 128), an internal 2.048V reference and
a dedicated DRDY data-ready output.

The driver supports:
 - single-ended and differential voltage channels described as
   device-tree child nodes;
 - per-channel programmable gain (via _scale) and data rate (via
   _sampling_frequency), with the matching *_available attributes;
 - the internal 2.048V reference, an external reference on REFP0/REFN0
   via a regulator, or the analog supply (AVDD) as a ratiometric
   reference for single-supply measurements;
 - single-shot conversions gated on the DRDY interrupt, or on a
   data-rate-derived delay when no interrupt is wired;
 - a DRDY-interrupt-driven triggered buffer for streaming;
 - runtime PM (power-down between conversions).

I tested this on a Lichee Pi Nano (Allwinner F1C100s) running Linux 7.0:
with a potentiometer on AIN0 (single-ended against AVSS, AVDD as the
reference), in_voltage0_raw tracks the wiper linearly across the full
0..3.3V range (0 to 0x7fffff). Nothing in the driver is board-specific -
it only uses the SPI and IIO frameworks - so it should work on any SPI
host.

This is my first kernel contribution. I modelled the driver on the
existing TI ADS-family IIO drivers - ti-ads1119 for the structure and
ti-ads124s08 for the SPI side - so I'd welcome any feedback on things
I've missed.

Nguyen Minh Tien (2):
  dt-bindings: iio: adc: Add TI ADS1220
  iio: adc: Add TI ADS1220 driver

 .../bindings/iio/adc/ti,ads1220.yaml          | 146 +++
 MAINTAINERS                                   |   7 +
 drivers/iio/adc/Kconfig                       |  12 +
 drivers/iio/adc/Makefile                      |   1 +
 drivers/iio/adc/ti-ads1220.c                  | 835 ++++++++++++++++++
 5 files changed, 1001 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ti,ads1220.yaml
 create mode 100644 drivers/iio/adc/ti-ads1220.c


base-commit: ae696dfa47c30016cd429b9db5e70b259b8f509e
-- 
2.34.1

