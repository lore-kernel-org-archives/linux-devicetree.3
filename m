Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339040;
	b=qkvaxN7EzJhKuuUezwKZ/WDg5zUVhQuSyBXMxtk+gBT+7YV5Ui4b4lb/moux3OgmvuHS
	 CGzYQfRI9J+UON4OIrQVGsoBmRaABrEBzA+y/DmhfftNBjTb7vIyj0S/o8I9vzjTBfXWp
	 OxkyIUs88JbLJWKuhzlcSbbRa+7eokSaDoaMaVCNKdH0shCMV5sm6rGFNn2ae3exyg4c5
	 c8USfWfaQrKOXQ4hwDwiFwHz6kLmG/HiXGTx5+rhPnvk1zHzGR3Meulld4jhm6C5+xenn
	 Y8kTsACJYPS9CfcIQTYYkkaOX92Bhv9npStVFpY9Bkmy6mzuqDUJMRxQuEGJtHttG8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=NUDs1vdfcZBxBx3xJiXUGpUDlEHyuHjTI9fXY3QHrkc=;
	b=1BV+H5RrPpSWg78+GoaW/G2z32FHAajKhUM8aL+V7ZzCJbOC1eVM6e8/os0F7UsQL/jd
	 Z0QRuMdfyP5V7zR/BLwcnKKIgRO6POKwxQfX+fjswLVwzmPltjwUVK1DIH1GI/Aql/IjB
	 3pi/UIx0C/SevA4MbeSNq16crioAPHRebX/m7oFitIbgOUbZyEIbgPMPDzasIDbLbZzXf
	 pPayO6AIQ3Uz/nbI1bim1srAhOcymPREI0iNK4cGx5779D4OFq5OI5524oUqJbCLLI1hq
	 stSWzarXR3fx/mBhdOsf9nyv5Xik1OWaGO0RMKYkakiWdfcMiBqpp3YlVZTmxdoMfPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLFffG5q;
	arc=none smtp.remote-ip=74.125.82.195
Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE3A606A323
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFE3A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kLFffG5q
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-37198ed3727so3111727eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 11:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794339039; x=1794943839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NUDs1vdfcZBxBx3xJiXUGpUDlEHyuHjTI9fXY3QHrkc=;
        b=kLFffG5qAIK2Rx446b61kwv0+kC8xdxvAAfZ6PduQcOfFYgwBTAQwFAiKiVrEEQl8f
         RcPJPWb3KsULfTQHXVbSAfkbeyNxCH5J9yMxozyEBLKU/Op+0EcVDilaVF2V629MwQSb
         QMaZJywCE/eA/LxGn55+r/PdS3coukI5bjwf5TLAtrjkeAZfT2S9fsJYThTa2vuvucGk
         m9z1Q0Ijv53734gUX+kSa05f3nj0wlpWpOA+HHz9J96BGoWxLV9mzSN53vuHYA0Y8BdR
         +pdn7ofarjWNxH1+hY/Q9FkY1aSocSpBQhkQmoB+bd//bn9HNVINrQFvzzYWa74/oJ4a
         BOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794339039; x=1794943839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUDs1vdfcZBxBx3xJiXUGpUDlEHyuHjTI9fXY3QHrkc=;
        b=JQc43zQuhxo+b4NLd+qQY3Yo4rwMJPwDBExhtc8fpq53zh9IAZn4/u7nkhNkX6eKtf
         wjF9jiHuk1FSVmdKLO7WHfV8EU+GzC+95AgrxkOdFPqfCT4xs4hXmhvq+flB+Qv+L9Sw
         GgrJbVitwBJgEIE/+lXld+4kJu8x77CrdVenkS1nfrnSUhfcEmXj0h5NsPCH7BnpP87L
         wlNv1jrGzyB3xutVW40lDxJ4UXNp3u0CImUv5tyyjVlfh0rrGA3czmX/CnV7ZPGAtZBb
         hQcUsaKql8/ryV9zEv3sKp+G7i7vrE4S1bHUzNIBOQ4AD9NRetWbGsRiCPgcxQFDoGFQ
         6otw==
X-Gm-Message-State: APuU4Z9iqsJ8AhoEF0DiQv5jtLXTfQeZinNuTWv23O/cGd15w9pJoKA/
	gv1Pn3D+ARa6LdK2ZucE/gxAdBmgDdkNwgTEkU4Qd2Cd+JvEVIv/ESmd
X-Gm-Gg: AYBFou2/DWq8ClJtYjvoAlrlmzSxt9DIPzwszE2klPuQ2ov1dXHfTMkHgur5/MyGpK+
	9vclenJK+fGeSYNQL1yNAb94xpIhaM2QZ/r1p0ghpyfVvy4Z2VrExtJU/PrZJmbHpdYQzdznw2G
	SXwhEl4wdHwcHxQw1PGHQ8e9dCDnxx9UB3IJnZ7KLkAPUd9IxAKlIfER1iXYLv+0p2vv+6A6Hzo
	4NS/0p0p9tW0C3eKbfwITGZX5/F5WlcLyvvayPKywzH8KT41+YG9taFB8qHqEU/s0LR6lwQh1Zs
	1FafXlzIqquPU85keECrAM5yvJ5Q5pWB13qepD18m9QnjCxdGgfhMU2IGWn3dktWj8pX6VJysja
	iEB1lV3CkSf8NreSLT8ZkX93jo3BUP0J6XMg6m/A1ohzFD6PisOTnTgw714bHy4MBJIsjUVpxHk
	ys3vKIoOdCB6JM1VZGY5lQSlqD4gWie8AnhK+o84cLtya+eoqm0URFMKUeO+zG3db9z9x1MVLEY
	NSvzSR1fGAEdNR2AWbvw/nPwoUBfJFhmTWFZVzloU0C9Y5A2YuKIq6YKA8fbO8wuFoEHf6tLffY
	zM0MIr6cDrXReAqkUQ/rGJ6E+Yo5Ym83vDR/5MF0nAoDWHboTw==
X-Received: by 2002:a05:7301:5f17:b0:375:85ac:d14f with SMTP id 5a478bee46e88-3766a1086f8mr574713eec.14.1794339038382;
        Tue, 10 Nov 2026 11:30:38 -0800 (PST)
Received: from AERO17.taila7786d.ts.net ([45.95.212.224])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm7730435eec.0.2026.11.10.11.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:30:37 -0800 (PST)
From: Pufan Jin <cyan2254650260@gmail.com>
To: Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 0/2] arm64: dts: rockchip: add USB-C PD and DP altmode to LubanCat 4
Date: Wed, 11 Nov 2026 03:30:26 +0800
Message-ID: <20261110193028.512456-1-cyan2254650260@gmail.com>
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

This series enables the front-panel USB Type-C port on the EmbedFire
LubanCat 4 single-board computer, covering USB Power Delivery, dual-role
data/power, and DisplayPort alternate mode.

The port is backed by a Fairchild FUSB302 controller on I2C1 (0x22),
a fixed 5V VBUS regulator enabled by GPIO1_C1 (limited to 2A by an
LPW5209 switch), the RK3588 combo PHY usbdp_phy0, and two DC switches
on GPIO4_B3/B4 for the SBU1/SBU2 lines.

The series is organized into two steps:

1. Basic Type-C and USB PD support:
   Adds the FUSB302 node, VBUS regulator, dual-role power (source 5V/2A,
   sink 5V/1A) and dual-role data connector.  Sets usb_host0_xhci to
   OTG mode with usb-role-switch, wires HS data to the host controller
   and SS data to usbdp_phy0, and adds orientation-switch on the PHY.

2. DisplayPort alternate mode:
   Adds the DisplayPort altmode entry (SVID 0xff01) to the connector,
   wires connector SBU (port@2) to usbdp_phy0 (port@3), and connects
   the display pipeline: VOP2 VP1 -> dp0 -> usbdp_phy0 (port@2).

Validation and hardware test status:
- 'make dtbs' builds cleanly without warnings.
- 'make dtbs_check' against usb-connector, phy-rockchip-usbdp,
  rockchip,dw-dp, and fcs,fusb302 schemas passes with 0 warnings.
- Patch 1 has been verified on a physical LubanCat 4 board:
  * tcpm and fusb302 probe cleanly;
  * Host mode: USB 2.0 and USB 3.0 peripherals enumerate; USB 3.0
    operates at SuperSpeed in normal orientation (reverse-orientation
    SuperSpeed is subject to the known upstream phy-rockchip-usbdp bug);
  * Device mode: ConfigFS CDC ACM serial gadget successfully enumerates
    on a host PC at high-speed with bidirectional data communication;
  * VBUS power switch correctly enables in source mode and remains
    disabled in sink mode with reverse current blocked.
- Patch 2 driver stack registration has been verified on board:
  dw_dp binds to the display subsystem, DRM connector card2-DP-1 is
  registered, usbdp phy-mux and phy-switch are registered, and
  typec_displayport binds to the altmode.  Display output / link
  training is disclosed as pending physical verification due to lack
  of a USB-C to DP monitor/cable at this time.

Pufan Jin (2):
  arm64: dts: rockchip: add USB-C PD support to LubanCat 4
  arm64: dts: rockchip: add USB-C DP altmode support to LubanCat 4

 .../boot/dts/rockchip/rk3588s-lubancat-4.dts  | 172 +++++++++++++++++-
 1 file changed, 171 insertions(+), 1 deletion(-)

-- 
2.56.0

