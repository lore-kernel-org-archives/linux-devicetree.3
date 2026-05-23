Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2A7373C04
	for <devicetree@vger.kernel.org>; Sat, 23 May 2026 08:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779525867; cv=none; b=rdYnB3KZf6Fa1hvYySi4BLzwSdDUVcU7nXT6mN3H3I2UtRn/GPV+vG4EyG2WGJl8pCW9pqj8u3+3PRqcVWQDbmm5ID5qoeETqFVnb3U8O26+z8ujKtJ9xOAxntHiPOeIoM75s877NxouJ78s1wlCrlZMXIQFw8UsaWskMm8Y93c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779525867; c=relaxed/simple;
	bh=LOuv6LBODqsvsKQfWfPMlLqdey26ht+cHZM6a96wiWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hva49wnPF8sbgwPdtwb/ZutiO2R0cUDHr/d6qke2XmqpNp8zop0mZXwyQuo3AGlI6CD2BM7j7oQ50qUfnHLeLpVDofOR4l3QuITtuItol8n7Xh4MmhrEdjpb+qC9DCfDH+Wb5Et9anppWZK70t3vIZluIdbwlVBH4aTsHM3EFJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qFrKywnq; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qFrKywnq"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bcd3c190f71so1323827966b.0
        for <devicetree@vger.kernel.org>; Sat, 23 May 2026 01:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779525865; x=1780130665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AjESINGZXo1FbNpnq3OQ+lE96hLtibEqkNb3ouXLoxs=;
        b=qFrKywnqpoA6uaR+iYUoP7HzrifrDFpwWipmEtWG8Y2Vbwv+2ZLOYRCQXc36tBKPsz
         L6kk1xXEgo6yrif3r0m4Y2GWzjClniGOPtduoTpDVOnpskfb28HlOjYy8gQrgJcap55J
         SXcOZaxEPO+EByuOCGP7u8LAgZnj9MHf8HOYpeGG+Dwtav1jWgStduumtQnFf0i+sTuJ
         qFW85cGA7KcyxmcrPdsf/auV9vxgn6d4O5VrsTYARCT4AQ1+lESb2Qb5LAE80YNxEYL0
         kwTslOWJK1RVZzmtc81HHawpflNHLUwr3Lq4MtKVXxrbVqwEI+rnHkvyA0a+MbvDDgko
         85Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779525865; x=1780130665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjESINGZXo1FbNpnq3OQ+lE96hLtibEqkNb3ouXLoxs=;
        b=KpZG4YbmaZAcasmOFtv27ueZhZofg30NE+lXMNDkG8E3afIb+LzJgx/NIY9Z2Qp8Vx
         EAvsIdciVbgTccJXSC8AhSJhXy8dchp+zceCow/SjBF2yfDsL06F7s6SR8tQvOh2uNrN
         QvUayNkOZfSJSLc5W5jf5DD0Hxklvo3VNACoecby8cFIztpOh5R9nahMo9y059lUmwx8
         XxldQ/Taj2HyPwZQuM1PNl11eDsGL6oX+ywrtpTh2EjWx6On+t+uc/yzt4zrd2Y52Uh3
         CBGH6DyQwekJ/Dh/TFpbroRYaKaoShWM6tcfn/j9p8smbQkjsRgB2vN2OU3l0wLyUaLJ
         2KdQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cEr/nE6L1/AXBkfxlMtr8c7+BDIJ6t4PVusCkQZYXcs6TEDWQXr1ZGMKZLyAKE4z1k1sa/wkvdq7i@vger.kernel.org
X-Gm-Message-State: AOJu0YyqXv6UDdrgodU4LhU/uxpLFo5n969oglGAik9DutyM3X0nQXMU
	EtjFtcrpQl31JUie4GN9lYBHu6gM9qtU1c294witTcUFECcpe5yYaTGO
X-Gm-Gg: Acq92OEeC/16/W9TXrzfgb/3KOla08U5uIrQtNLqEKTy4ewJ1ygTpaErvT94wuGB2OJ
	Wt+d//VzHl3wEwK+UguG3ubpp6/9QZTrtRcozIpY5RuabrvHaJ0vyeEd/wnGhZG6mXWk4oHdoYG
	qG3Y0dqQJaAc8YoJdpzQGCv0rIifVuJ19p9sUsVVqQkPwjPoofQLGKJR80U0b3OdVh52bfLRpD1
	W3cBSaXQyZTSkSWy3Tvpkqmeis1HT+dQcg0hUFDwLcUscVzu/kGuH1Tw0kEYooMiNSmXB/Z+fiY
	yRtsLO4Ndkt3bAlSZ/RVsIjxanpVtTHQbzp5NMHhFIBUwuC1ORVTpgGRODbw2Fbm/l/RNS5pmRB
	a6qomIoX11Tmjuir4O+N+KQq0Gt7BWg5B4Lel5g3El66bY6mc3GvO7zEwYA6Mpl61pIuCCQ9c2p
	AB99gYm/t7yYTB
X-Received: by 2002:a17:907:75dc:b0:bd5:27b7:adaf with SMTP id a640c23a62f3a-bdd272cf2efmr313030066b.33.1779525864367;
        Sat, 23 May 2026 01:44:24 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc62d70a5sm154042966b.48.2026.05.23.01.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:44:22 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v2 0/2] Add support for Infineon/Intel XMM6260 modem
Date: Sat, 23 May 2026 11:44:05 +0300
Message-ID: <20260523084408.50346-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Infineon/Intel XMM6260 is a 3G-focused, slim modem platform designed
for smartphones, data cards, and Machine-to-Machine (M2M) applications.

The modem is typically connected via the application processor's USB line
in HSIC mode. To function correctly, the modem must control this line, as
it requires precise timing to initiate or de-initialize the USB connection.
This control is necessary to successfully enumerate the next stage of the
USB device loader (moving from firmware loading to the actual device
interface for example).

Patchset adds support for the generic portion of the Infineon XMM6260
baseband modem, which was used in many Tegra-, OMAP-, and Exynos-based
devices circa 2012. This driver provides generic power sequences,
manages initial communication with the application processor, handles the
SoC-specific modem powersequence, and verifies that the modem USB device
appears correctly.

While current support is relatively basic, this configuration already
allows the modem device to appear in the dmesg of my device
(LG Optimus Vu (P895)):

[    9.427014] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    9.431488] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
[    9.457197] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    9.460370] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.16
[    9.468470] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    9.475597] usb usb1: Product: EHCI Host Controller
[    9.480508] usb usb1: Manufacturer: Linux 6.16.0+ ehci_hcd
[    9.485913] usb usb1: SerialNumber: ci_hdrc.1
[    9.490862] hub 1-0:1.0: USB hub found
[    9.494005] hub 1-0:1.0: 1 port detected
[    9.657191] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[    9.844726] usb 1-1: New USB device found, idVendor=1519, idProduct=0020, bcdDevice=12.74
[    9.850530] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    9.857594] usb 1-1: Product: HSIC Device
[    9.861606] usb 1-1: Manufacturer: Comneon
[    9.865627] usb 1-1: SerialNumber: 0123456789
[    9.908739] cdc_acm 1-1:1.0: ttyACM0: USB ACM device

This patchset is a part of larger series aiming to bring XMM6260 modem
support for Tegra devices:
https://lore.kernel.org/lkml/20260511135703.62470-1-clamor95@gmail.com/

---
Changes in v2:
- changed phy to pwrseq in schema
- adjusted Kconfig dependencies
- implemented bitmap for modem state tracking
- switched from phy to power sequencing
- in notifier added chech to filter only USB events
- in notifier added USB_DEVICE_REMOVE
- added tracking for regulator, rfkill access, usb device
  presence and poweroff calls using bitops
- moved pseq on call from work to irq handler
- improved rfkill registration logic
---

Svyatoslav Ryhel (2):
  dt-bindings: net: Document Infineon/Intel XMM6260 modem
  net: usb: Add Infineon XMM6260 Baseband modem support

 .../bindings/net/infineon,xmm6260.yaml        |  74 ++++
 drivers/net/usb/Kconfig                       |  15 +
 drivers/net/usb/Makefile                      |   1 +
 drivers/net/usb/baseband-xmm6260.c            | 378 ++++++++++++++++++
 4 files changed, 468 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
 create mode 100644 drivers/net/usb/baseband-xmm6260.c

-- 
2.51.0

