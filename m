Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9897451C04D
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870066; cv=none; b=ZQjsDcFNQfpMbM1dJKMkDmVvlID3nnS0r2tePnDHhr7NrYpTf9fdHVxoOPXbRGJWUHo9t7fth8bgcrJcPafD4f4bywftKTYF0RgkeGWqFoIVFoBD5vMQXxDUj3sOhiQFKyRcLrBBTuV4Kl4ktrAiD9ERLzn2DZDLktBWW8fs3GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870066; c=relaxed/simple;
	bh=vwAxzOlUPI+Z9xgQ5oVMp/LaI/8upX7ZL6k7ABW4RNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Po6zoqg+ac5XrD9VIhL9vZIqE6btVuco7JUV6KmR2+cOgr50i0ExRR4BtJqI1oU1FmmPv/YSYlF7jYyFLuNdfYJA7I35qTK/11rrMeCkX9cD2K9wL5h1mTiYpoJESU4z3Uyl5dguaurwpYUhQiidscvoLCpoBnHs1pNTwX/KIT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KABIOk8q; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KABIOk8q"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso25986305e9.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870063; x=1791474863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ObWleL9TA7UPO+YvdXrGwmMNTs1BuFhMK+d7zLOGlOo=;
        b=KABIOk8qfcAXbYF8dUky1/Sle1EVpi9KV/A6CdCdCxZgLgSXnrJgi/t0KoQh9DS7Xx
         jzBTWRZGtJ3JfTxebvoyzlaPZ6bPFePp5Ui1MMzVysjIVG5ekPYoqPsWsIGneG5/3roQ
         Dkl3AGLeyYaNXgMcglQ/+fnsphfAlJAEsMy2ZXnTWsS/1iVJvx7J1XWwrhlGxrwvr2YU
         SOZ6wdzn4NlRa5hi10SSHtCTSh+9HMj9Qyuib+mit9SnmfKvdOkyly4mXfQ2k6zIgNya
         GigEhwt8nC12JyIuH6ZlWK/IdS/OYyGftcjhwx3JNzDNTRXtnjxPUB+IM2RUmbMRWS+I
         z16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870063; x=1791474863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ObWleL9TA7UPO+YvdXrGwmMNTs1BuFhMK+d7zLOGlOo=;
        b=FKUpp3Dz7J1hkRfHxEz4GDpJj+VmBD0qHPbeC332qn85X3qzGnfdIdpxWBDVm/aDlo
         l9m4IZHj9WxGXS+m8OdiXgfD6cT0sGbMry/tcl1fMRe3QPnzvWR1Oh8TMMhZPD4E/Px8
         8/YutKKosw5Nr2ob2b6iNtQmUBHCH0733isb+oTSZXcwOQ4E5Ee3DczIy2m/8J/vY13g
         A5Ix6Q7NKGnMid5iVLCF8iwCsF8MvzQKxHeX1HDxffBkw555ZXC10UPgu1h2ARI4yddt
         0KghROMQDajHVy3J3xs7DFSzIeN2wQovlNmDJDbymbuvjzch6zhyKHEdV+t7N2JBSWek
         Afmw==
X-Gm-Message-State: AFuF++me1TFIMj9NaPpW8vR4fSsVcQzOmqmSBseUZv6CTgwEnRfIzsEl
	tUxcNSIfCZeaKKpJRNPAG0cTbmAYcRbYw1Gr2cdQq2d1AzvBWveoCFfh
X-Gm-Gg: AYBFou3E/xa4Mxjqj1ZGuWfg7PR8SKI2lYpJJSABJ4Bz3Kxg6JOJEl99PNpBrirkDpK
	FsUm6Rdme64LU885+4+DS7adbgHpTGICuC0HTUG7nfB2fLeqkzRSkA79Trmlyx4LfgR11ncp2Op
	ZSTOze8MbE59LnDk+jLJsSBEw8e8xkBOTqhJYGt535uG9FVeBFg9Q4FF/SRnCjV49c3CQzJSsYf
	QbsQq9ngBZyAwATOHkuQYFnX7J9dQ/RDmKkqJHZqeH0cJnj4BV6wqcyxqgWQEC6GnaRFpFHlLou
	anx5qExv+HNXq8RjpDkwHrWM1ZvRhpDJKZw0DXt5unCdFRnfKB1b43MILFWAvzKLCFkWaHUm5dG
	9zB4nVHSBvK0V/ehEvyQ7XjknzgBx2yR6PTNEfUFkzBpx1+t54ZAGTV4aDAQVjTn2owGmXuFEmm
	NTDFSCfYdQSW8ut1meuf5XSQw1pJcd045mDAoVWUD3pXRY6DDF3lRbfASrk9+Y20HdMzWSFaGhh
	CnVBzOa1hH+CTTFE9mdZJ8lazoUnYuY2Ew9aubioOxbjlPyw+anM9SeaiqH+efAiAWOoPjHIqP+
X-Received: by 2002:a05:600c:4e4b:b0:4a0:263b:1f77 with SMTP id 5b1f17b1804b1-4a0276a1f28mr643585e9.8.1790870062454;
        Thu, 01 Oct 2026 08:54:22 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:22 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] ARM: dts: Add Apalis iMX6 overlays
Date: Thu,  1 Oct 2026 12:52:50 -0300
Message-ID: <20261001155412.3177428-1-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

This series adds device tree overlays for the Apalis iMX6 SoM. The
overlays cover HDMI, parallel and LVDS displays, audio configuration and
OV5640 CSI camera modules.

The series adds support for:

- HDMI Displays
- Toradex Capacitive Touch Display 10.1" LVDS
- Toradex Capacitive and Resistive Touch 7" Parallel Displays
- NAU8822 Bridge Tied Load configuration on the Apalis Evaluation Board V1.2
- Toradex OV5640 CSI camera variants with 27 MHz and 24 MHz oscillators

The Makefile entries build the standalone overlays as DTBOs, and add
ready-to-use composed DTBs for selected carrier boards and accessory
combinations, for build-time coverage.

Leonardo Costa (7):
  ARM: dts: imx6q-apalis: Add HDMI Overlay
  ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
  ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1"
    LVDS
  ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 7"
    Parallel
  ARM: dts: imx6q-apalis: Add Toradex Resistive Touch Display 7"
    Parallel
  ARM: dts: imx6q-apalis: Add NAU8822 Bridge Tied Load
  ARM: dts: imx6q-apalis: Add Toradex OV5640 CSI Cameras

 arch/arm/boot/dts/nxp/imx/Makefile            | 87 +++++++++++++++++++
 .../imx6q-apalis-eval-v1.2-nau8822-btl.dtso   | 15 ++++
 .../boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso   | 13 +++
 .../dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts   |  7 ++
 .../boot/dts/nxp/imx/imx6q-apalis-ixora.dts   |  7 ++
 .../nxp/imx/imx6q-apalis-ov5640-24mhz.dtso    | 17 ++++
 .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi | 68 +++++++++++++++
 .../boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso | 18 ++++
 ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++
 ...apalis-panel-cap-touch-7inch-parallel.dtso | 34 ++++++++
 ...apalis-panel-res-touch-7inch-parallel.dtso | 30 +++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 86 ------------------
 12 files changed, 349 insertions(+), 86 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-eval-v1.2-nau8822-btl.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-hdmi.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640-24mhz.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ov5640.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-res-touch-7inch-parallel.dtso

