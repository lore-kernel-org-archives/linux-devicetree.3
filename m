Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414567;
	b=fMpa00+yCNY9/zEybW1cDxyptREluQsCRIfH2uHyrdrcma/bDLWX1Vx1tZLVUUJzkqSw
	 8VZfbQYjCVvjguCamxD6PlVuzJRNdB25OEpXCm9rnF6ddqsPvWa1b3IaJHDX5xUD07HDJ
	 YYr9ltiwIWvoSgvcMSD506IAW2NVnKZ2UdIJkXMQA8Go3su8pPWnTNvfPF8QSuy4QY/br
	 1r9bU7kC3OWtJPD1co+x+3NS/Ut2THrnbVqYdM2qBv5KpkyGGaelwEF9xu9uYGaYlAWDs
	 EqioVA0uWdZHPKBSxAhcrlfbjDSANn61E1XEa04D29q6RL5qf7cn/E2dnpY7wLvRyUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=GBpk4qu8pcZYCdUrURfSkvotRI0YOn6Uq9RK99ZjCJA=;
	b=bS9Fuv4H0febM1t1Li3xyHysHQRRcELIQDJBZV5HAvXF3ab4lp6vWajSsYkPWnPHKSAT
	 RhNRyHcsYznAhhYu8F4hVWge+LIXw+Z6oo6R+ykgtGylY/+EU7Y1fNjD9sdUcI3k6S2nQ
	 EkrkZidzA/+Nc3fjEI672f3LE4Dbh+71vPX/rq7HfZ5AvuYnjAwQ9sFtRikKOMmCdiwjW
	 iHAVkOdS6GhHf2R7C6a1Xnryt2qhlpfiSlrrMKqVqGeWElOmuMs1KcvWJrYakRkRzUOdb
	 AtzpzZ1ahYgwM/NztTwez41LsNa17a5dWBD/R10JKtl0Lo+1yvas5/w42u9PBwAXyww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DQgHRv/b";
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE28606A886
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 16:29:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE28606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DQgHRv/b
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f758312e0so1526361eec.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794414566; x=1795019366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GBpk4qu8pcZYCdUrURfSkvotRI0YOn6Uq9RK99ZjCJA=;
        b=DQgHRv/bQhAMcw/SpaJXqNIkV0tujibZANxbS6NdtMHzR/vsznqjUQbNvRcFsLTf5V
         hSzKURnm2mWHjQ07LwRIsYfBBf2ymdqC44cAbliAekS3cKdk20z68uxkCVbYNXwUto2f
         MIr0+n+mZLoKHsTkTtStBLWGDPjWjNGnuDDR4vYn3e1/89M8qoIl8jdmU+6/pCSwXKNh
         9JheSdpJfVIuOJlvQPhJTjnNqv1PGqZvATjfXJ1V/Qg9162nDFt80btC2SEzVQTR28nZ
         uPKVFVR7chu4NoD3pfu0etuxNzbl1Is/XtPKsLXVgLbOQ201WFOoLips6QGjJ1MLb19V
         DRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794414566; x=1795019366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GBpk4qu8pcZYCdUrURfSkvotRI0YOn6Uq9RK99ZjCJA=;
        b=xW2r7qy4bacq7Ynt/zm7eArHVZz1l6J3c4iKJKaK49JU+PFLxJiRlRXM1dMXxIjYks
         NnX88yEdrF+8Nu3xEnbTyRteLxQVOddCqXqj3YOO7Dnnh/q84R4D/b4hfmqbl8kQk0ys
         SBnLaiJFotGKJrK5HfKvHc4uqENC78BZuMGk/+h9mzWJrgHUGJ4o8hOU9OaAWXiuzhVz
         PMvFjVua0m6GCO+MrtiPhzadv+FnG2LIoMH7dVGsu0VtRzhymTX8nLDcJA3oLND1/pC5
         +POI1LLm3RsE/mMcUa/1VoNq8qIvbkEH4Z4ndBVtU58aujRM2/0Pl1OoXbylKvisrOQK
         XcYA==
X-Gm-Message-State: APuU4Z+1EnvRrk3mJeKOpjPdAnw6jZOrOIlB8BXuRbm9ru8RLD+lzE5f
	vosegBFMaja4Yx3gl1gmJtDepiTIWKW0KiwSQGbCHKy3kYJSooLP56Bz
X-Gm-Gg: AYBFou2/8gwhCZEKJZsrnf6Rc+P1eigjbo5+hxCi7Ls3p3O4AJcv2Mhqi35Xne7iZnz
	n3r+WMjCmIMS2jKTItqQPgrD3pj/H6imYKWvdQR0HQI5cWaJXsDquEbYFx5+yuLlLqQWpmXc640
	VOjMmv/ChElG33t6Waoy4izCgR80hhUi28o9Np33xS/xMG49qPT6Sv9kpzEf7FU82PtUs6DX6kb
	lt+ewEn5kJLvmOMdieAkLkOjjuLOqL6YWYmKuPFygpv/qbHWCuOMIfgWzh1Yg4GQ9vOYl1vvo0P
	sD/R/xgmCkAV/7HCYKZ55t4Nj0qaX0Crbm7WxORSEEdGtkI3t30O4wESdr3xunRvpGQ1LBj7Nz8
	vZ5o8LtVaLvu2vpjcSjfXuq1TTuLctWNYEamYYWIn6Tv0XrNtkmKw/pKBxr1WcR1sg5ySHUKM8Q
	/8nSCW8nzLhTcv5BVMulhMLeyv0zxHh0BosaD+y8/hoY63dpuJEmM7Eya3vK/kxeV94Ipmzm9fp
	ZAthDVySlBPFEV7eewlU9r7pGzWs/bzwiVVIkjHMDGPVgURg0rSuUmDWmo9fiJcLdRqh4MPdLVI
	fVF1LJGS/ha9UJvMkyetLIgWFkIKf4vb4PXj0YSpGLZ2nrM2kA==
X-Received: by 2002:a05:7300:33a7:b0:36c:f88b:caae with SMTP id 5a478bee46e88-37686469c40mr3335801eec.22.1794414565934;
        Wed, 11 Nov 2026 08:29:25 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520bf3e18sm34892599eec.16.2026.11.11.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:29:25 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v2 0/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Wed, 11 Nov 2026 11:29:15 -0500
Message-ID: <20261111162917.97532-1-cyan2254650260@gmail.com>
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

This series adds device tree support for the ALINX AX7Z020B development
board, based on the Xilinx Zynq-7000 SoC (XC7Z020-2CLG400I).

Changes in v2:
- Add an explicit mdio subnode under gem0, placing the PHY as its child
  (suggested by Andrew Lunn).
- Use hexadecimal unit-addresses for the XADC channel nodes
  (channel@a, channel@d), matching their reg values 0xa and 0xd.
- Move the pmu@f8891000 node into the initial root node block instead of
  opening a second one.
- Drop the standalone "alinx,ac7z020" compatible from the board enum: the
  SoM cannot boot on its own and is already documented as part of the
  three-entry board compatible.

Note on the vendor prefix: "alinx" is documented by a separate patch that
is already queued in linux-next, commit 1f06cd374a60 ("dt-bindings:
vendor-prefixes: Add ALINX vendor prefix"), so it is not part of this
series. A checkpatch run against a tree without that patch will report an
undocumented vendor prefix; that report is expected.

The platform consists of two physical layers:

1. ALINX AC7Z020 system on module (SoM), in zynq-alinx-ac7z020.dtsi:
   - Xilinx XC7Z020-2CLG400I SoC (dual ARM Cortex-A9, 33.333333MHz PS_CLK)
   - 1024 MiB DDR3 SDRAM (2x MT41K256M16RE-125, 32-bit bus)
   - 32 MiB QSPI Flash (Winbond W25Q256FVEI) with 4 MTD partitions
   - DevCFG FPGA manager

2. The AX7Z020B board (AC7Z020 SoM plus carrier board), described in
   zynq-alinx-ax7z020b.dts:
   - Serial console via USB-UART bridge (CP2102, MIO 48-49)
   - MicroSD slot on SDHCI0 (MIO 40-45)
   - Gigabit Ethernet via GEM0 (MIO 16-27 RGMII, MIO 52-53 MDIO)
     with JLSemi JL2121 PHY at MDIO address 1 and RJ45 link/activity LEDs
   - USB 2.0 host via USB3320C ULPI PHY (MIO 28-39), reset on MIO 46
   - Dual CAN buses (CAN0 on MIO 10-11, CAN1 on MIO 12-13) with
     SN65HVD232 transceivers
   - I2C bus on MIO 50-51 with 24LC04 EEPROM, DS1338 RTC and LM75 sensor
   - 2x SMA AD inputs and a spare differential pair wired to XADC aux
     channels VAUX1/VAUX9/VAUX12. XADC is a hard macro accessible from the
     PS without PL configuration, the channels are enabled via the
     xlnx,channels property.

Tested on hardware: boot from SD card, UART console, SD card, GbE with
iperf3 (940+ Mbps) and netdev LED trigger hardware offload, USB host,
dual CAN (SocketCAN at 500 kbps), I2C sensors, QSPI flash MTD partitions,
and XADC temperature/voltage plus the external AD aux channels via IIO.

The DTB passes CHECK_DTBS=y with no new warnings compared to the other
Zynq board files, and the bindings pass dt_binding_check.

Pufan Jin (2):
  dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
  ARM: dts: zynq: Add ALINX AX7Z020B development board

 .../bindings/soc/xilinx/xilinx.yaml           |   5 +
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  70 +++++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 142 ++++++++++++++++++
 4 files changed, 218 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

-- 
2.56.0
