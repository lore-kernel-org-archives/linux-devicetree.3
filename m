Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174622;
	b=pXJI9IW3Be5ae9GHDM29IkjkeDHjtDPSs7x3hbasSNqh1G0bxIfPbtFbsHmaCZsHRHjh
	 sgveIa/qKqhXydbS8durEOCsUmVrmDmlv47IkvRldb7wTYtjwbBvwx8RCXWsxHT66798v
	 CCWq5NDNlT3s6EMVyxULK1NAk9ctKWm8U0bg4ZEuB0YGlK3fxYVmXQSWlTvlG5lY2QudF
	 pzI9plxG+d1RK6nlJIYw/a2pO9GzVQCr5IysyhbrCPIh34o4imXY/tr53wo9JE9Xr2KDc
	 IYq+XLt++pU39xcv6vXDVGF5ol6hvdHKPojJ/lH/KekwUSg7qLV6jOikNDzg84IyeVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=YTSxjFXKckoe7BQVg2xBxOJM8UYR0Yr3mMiLFLwfLDM=;
	b=lC2qdheWa/7rK1/+iiGMCtxyz3HeiyDUbQiyPpi17IALJrvtvWteTbed/20oCgtqWGpf
	 dY0uzRpoL2DLrYFpwN911cZstLi9hXDevCZys2W9UOj3Zsld57rOIv7cnQVz0xqdEjATS
	 ziROR0Kc24mAkyyhD21e1cOzg8c5rZl3fVshEITDVQGXd7IwjIEjyHfoxFICheg2rT9VG
	 ucf8xDlGDkWeEKqJzyXyJwaLIeBUDzWngDrfgBH4CSa5ffSDu5YbluwcJvpBDNm2PGPcX
	 5tA6VR5yfLcW39i+BxvgENdZ4tdeqiq3lQjLh6RB8e9bxMju+retNJMlsFKA9DezYCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n2UGqasD;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CE1606A326
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 21:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06CE1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n2UGqasD
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso315695eec.0
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 13:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174621; x=1794779421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTSxjFXKckoe7BQVg2xBxOJM8UYR0Yr3mMiLFLwfLDM=;
        b=n2UGqasDhZ+vV1pQ63v1KOT1+82ALSTQe1W42WhQ0kCjIbXGT2mx7tr/xDZLOpjI7C
         y03gBoZN+e0Ib0Dkj1XcBrwObXQlPjlIfqbbxmFvgPAmVTurOfsTToOac0omjDwAfPVY
         fARs3AMp2qm+0/kgVBFhbtCWwR4A9nHDgojGvTuOQ3OCs68l7pakpqGVa8CDrn4mJBLI
         Q7giub/BRl/R8464YF877d/sTXRfsISarHqoya43uIJXCoPXrVHwA2Xfwp2Y9iG4qMk7
         YMSTxc5ym/fz0MYhS+sdRVqVgOQ3ycsLWshXKZbE5W57Ck8RniIqdD+qTQ+P2OCeZADy
         w+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174621; x=1794779421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTSxjFXKckoe7BQVg2xBxOJM8UYR0Yr3mMiLFLwfLDM=;
        b=PvGFXmzc0PTHuESYw0EkZ12QoiekgMOlyJPVlgDwX4GnbqrDs/FjFVWML5oJC3VuAP
         nVTzwJHqpZytgLvJP/2x6DYzLRulH/q5HUhd8AWtEan5g9wkJ2d5J0hhX5G23a1FChzf
         eMBYsjp35xAf8jm2VQY7Em/2c60eJW/nRawc51Qe/gUyFHEjeoUKixPiLbwgC7DyEYmz
         ebVSj7/iL52yedS2XBEN0FfuwdqlZySHXwjmjy07tTItHhvbPj2shsGSQt1AEaUOGUJj
         VRGojW1s9N5P4GdMdnZmsV7b5UATf16kJo7af+r0v3usx6NCy4E7O9diWgXNz7hrJcLU
         bp2A==
X-Gm-Message-State: APuU4Z8tGjmemP97ROj604x5Ftdfa4jQTiJ7GfuEkg4DnCEEf8HousB3
	fm95nr1Fv5kV7R3KShOmWKA5eRzdIE+Pe4rJLs1ZKqyEMUnEgU1xnNFa
X-Gm-Gg: AYBFou0ymKw4LHkD4zAkhhwtl/yTVaElqBDKAPCw2jSpyWj0d7sJb4S3+DrQyqaV9Yw
	vG4zm6wLV2U1k5HUEphwXGN1WUPS+iW5m7mERtnUi2Md7uPTXTl1Ri4B+4TxiZX8AkimdV7GwbG
	eiwU+iWN6jEpi7BMaZRc34libLAJq6aa1ehAHJeEilR5EsgAMd8Dx7bcZvvQ9iCXn+VASmU5S+v
	I8McgDJ2mPRhX3CMRYuTWycgSAYUYuMcrixdLyQNQorZSVEPbqtEP+qNDum2JuKhCvrnht278cW
	PbDzLec/a5z5siLH8Yl1pJ4/s35pNFJOFmyTo6L/egBXXaSJ6pmgCqS54pqE8SHStxEieo3KHjy
	zXVTLtzqVOqPKUYfCKdvaiyg/eamstBYbqxvOy8l9JUzRxAufbm+c27v+FeV7dJdJ5Cdpzlqrnf
	f67HGWl1LCuuAFDTvJDvllLGqY/Y9Z5S2exN5rHFshVabXYvJOU6ZthiE5+jHqtfSk2FTBWp7db
	eSVB5QXQgqEzZS0jMR/vbRZ2xYurYH9MnoqXb1K3pnihlGjEDgF6jIncdFzIZIbkJpY8Ml8XsnO
	rEwNxu4+eNdDvKLv+6PyEmaBNtkIwwcKUxW+BvDji4xlwqxMtFX5XSeobl/WjaNwuPSMM/E=
X-Received: by 2002:a05:7300:2215:b0:36d:48e:82de with SMTP id 5a478bee46e88-37256615312mr6819539eec.12.1794174620977;
        Sun, 08 Nov 2026 13:50:20 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265efd2dcsm7587575eec.17.2026.11.08.13.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:50:20 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: dts: zynq: Add ALINX AX7Z020B development board
Date: Mon,  9 Nov 2026 05:50:08 +0800
Message-ID: <20261108215010.351256-1-cyan2254650260@gmail.com>
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

Note: the "alinx" vendor prefix is not part of this series, it is already
present as commit 1f06cd374a60 ("dt-bindings: vendor-prefixes: Add ALINX
vendor prefix") in the Xilinx for-next branch.

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

The DTB passes CHECK_DTBS=y and the bindings pass dt_binding_check.

Pufan Jin (2):
  dt-bindings: soc: xilinx: Add ALINX AX7Z020B board
  ARM: dts: zynq: Add ALINX AX7Z020B development board

 .../bindings/soc/xilinx/xilinx.yaml           |   6 +
 arch/arm/boot/dts/xilinx/Makefile             |   1 +
 .../boot/dts/xilinx/zynq-alinx-ac7z020.dtsi   |  72 +++++++++
 .../boot/dts/xilinx/zynq-alinx-ax7z020b.dts   | 137 ++++++++++++++++++
 4 files changed, 216 insertions(+)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ac7z020.dtsi
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-alinx-ax7z020b.dts

-- 
2.56.0
