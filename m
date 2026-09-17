Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198E345EA9
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633630; cv=none; b=rO6rIXI7aj3jqehja3y5/bLO2O59T6Gr8kpm1RkDwwwYXzPOIwzuslYlB7w74K/AYTRXhE83BN8cnYHWapC9MvxdD8qaa6olVnj/zT4p0rfXF4F6924rQ/1Ln9g9/dKAzFydDYQoq+FkqouQhaDFQPNO/vj3wxXPGf8Obntn0sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633630; c=relaxed/simple;
	bh=mruE3LgZhq7wOba3b7w+a9IFoAX8feY94ivylDxVyMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lUkHpvzA0JA7ibTfHz1DqMaSn8gU1YqBQkZu96ZH0gS6tsmQ9QAu+H60n3JkJH/MwGIvYXcV+Dt/OhECp72cGZMmYdEN86ZDkXCPJVjDjzxABvv2siR720UyFM4kfCgmwoq5a69E4X/AZYCy9DbDgDPBsjtL9NNSGP0dZtVlduk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za; spf=none smtp.mailfrom=ffroot.co.za; dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b=XOiJ7JzD; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffroot.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ffroot-co-za.20251104.gappssmtp.com header.i=@ffroot-co-za.20251104.gappssmtp.com header.b="XOiJ7JzD"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so179201f8f.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1789633608; x=1790238408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TosaW+EYUtBmpByGJ+HlREE+xeLu7KYT+QjrxLFrU0s=;
        b=XOiJ7JzDtu/cY0/N0E0qTbk2vWAAwlqy3o9RPWYy5apl7gCW6nZ+ThagAElypZv7v/
         q64yTHkLxa42MHPM+pd5H5Qin5D/6iTbhW2f9HCnUHvxG4hVyRaWy9yKFSLHcIMupjlF
         SHfLZB7QuZNb/qw0hV8RTz5CUD9LygQWHTI4NXjPqshhEdndOWns4b0ukMT7COsYM3kG
         CAfIekQPWFbqnTzb8pM2x6+MVSuxikncNnCQPwh9LszNjA0hyuYB3KZ9hsSTC7oJJL9V
         9NKCX5o0wZLqhhEg9G+JzYaMYSXXEqeshjesR0zIbBpSKEk3kjSuy3fQooNAK1hsMvWa
         yL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633608; x=1790238408;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TosaW+EYUtBmpByGJ+HlREE+xeLu7KYT+QjrxLFrU0s=;
        b=Z200g2ashxYMt2nUf8FvBFbRl3t5o3J5W5Q2RH1LWCA/cdjXji7Uy5H80ImgSIaElN
         U7xs1okHe7iBGSv41exULKbPNXwdryZ+VLySW97N6/W7x7s4VX2akr/+LAJNJWr6kYXr
         qmnGdRpuRowtPKdczZwd0zA9XNL+u1Ip4hW6/Y510LvT/pR78uDnzsOgE4hLxkjPVKOs
         YpKcn30EPThVNYj6DqMAtBNKHzge3y3iTUgAq4gIGqR/XbpDBO4wuoHiKufDONWIMi8h
         sYz+ZRDhyl2hRLbj/abm/W3hcJyaZlh0Jw/izZRGKaCyBW0aVnE6k2IpPDBo/aQLUuei
         fe4w==
X-Gm-Message-State: AFuF++mzGLNtUzyqC497wIasAE1cSBBcSOQnB8N83SE0hs/Tg/YMzKt/
	QoHdCCMduHQ/ZvUNvk4U6TT7q1/COnoiH/Z71+1aKSh2D5BoU94nU6CocI9ZUjtZGi0=
X-Gm-Gg: AYBFou2m7fwChM/PNQwoJ+gVGpu7ioVYkfodZPDBsCJ8lX1pjRKog372Iv9xPrThZ0w
	gdtlHwmJS3Tki5dvkzxHwdEg6fIQjMpsDh4a6+QK5YwWPUENRR6FVKIX1Jz3XCNblMGhVpVu/hR
	ddCaF9OYwHEKFNVzi9VpGJAuvDZcnvrWJBqspUgn0TTVCx1IOONVbHR55gD37iz+kz8jcBKLugJ
	9PMgNyQMJ19kB+39XhaHz+n9nwGxtNnKw0ubDQUGXriTmuh07tf+2029k4gg2msxhsnxeD06yL4
	IKMWj8DpNlc+k4d2tGG4NlY135MYXicrGD9DxtO0irH5GKe5lm4Qs8wzUNmaYX+Wd2Z4vD7ye6A
	y9y1fpJjXzRgCE+rtGipLOlDEAW4UhMS1iDtPT16xmolOavYQvkWxv4toI5jCYdcDEE+8JobuV1
	HsN3IZuZezN1LKRBLz9WYdwWpt3NOchLseU2ywHR87Z4Fs+XyKWTNnUQ3tYBLKDvGmhAaSgHiGf
	iur+yA2/XSgvc3/dY7YvZAfcddZNr/MnsGuJw==
X-Received: by 2002:a5d:6f06:0:b0:486:fdd6:2677 with SMTP id ffacd0b85a97d-48713c07bd1mr3459940f8f.21.1789633608002;
        Thu, 17 Sep 2026 01:26:48 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf342a0sm13420395f8f.24.2026.09.17.01.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:26:47 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	qinjian@cqplus1.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@armlinux.org.uk,
	Andrew Gaylard <ag@ffroot.co.za>
Subject: [PATCH v2 0/4] arm: sunplus: add SP7021 LTPP3G2 board support
Date: Thu, 17 Sep 2026 10:26:28 +0200
Message-ID: <20260917082632.626614-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Tibbo LTPP3G2 is a board based on the Sunplus SP7021 SoC:
https://tibbo.com/store/tps/ltpp3g2.html
It is the platform that underpins Tibbo's IoT products.

This series adds board support to linux-next:

 - Patch 1: vendor prefix for Tibbo Technology Inc.
 - Patch 2: device tree nodes for SP7021 peripherals that have upstream
             drivers (PWM, watchdog, eMMC), plus a label on the
             gpio-leds node so board DTS files can override it.
 - Patch 3: board DTS for the LTPP3G2, covering eMMC, SPI, RTC,
             a bit-banged I2C EEPROM, PWM, watchdog, and two GPIO LEDs.
 - Patch 4: sp7021_defconfig updates to enable the drivers used by the
             LTPP3G2 and correct a few defaults.

Tested on a LTPP3G2, booting via eMMC, on linux-next-20260915.

Changes in v2:
 - fix issues spotted by sashiko-bot.

Andrew Gaylard (4):
  dt-bindings: vendor-prefixes: Add Tibbo
  arm: dts: sunplus: add PWM, watchdog and MMC nodes to SP7021 DTSI
  arm: dts: sunplus: add Tibbo LTPP3G2 board
  configs: sp7021: fix defaults and enable existing device drivers

 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 arch/arm/boot/dts/sunplus/Makefile            |   5 +-
 .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 182 ++++++++++++++++++
 arch/arm/boot/dts/sunplus/sunplus-sp7021.dtsi |  37 +++-
 arch/arm/configs/sp7021_defconfig             |  33 +++-
 6 files changed, 260 insertions(+), 5 deletions(-)
 create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts

-- 
2.53.0

