Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793696341;
	b=SF37nFIpmT4QRtsYIbL84DrP+P/QBSA/GHS21I5rASpQtPm/Re60tMHJUAn6ljYsQGWv
	 GIWasWAzvP6GF5MDYmY7+AnDn0x1snocGLSUJ7V++tB18CZJW5FNjKCxUyOsik4QYmOil
	 0nBNqdj4MNUPqjCYboTCnLU0axrACkqJkf3n4Id78RVZaTkcWj0QxbvUxOV5w6BMoHaD1
	 3Q5QbHvkFmqL4tvdJbJNH93B+WYuo7zqB8SS5Gqwoh383ww/GVhN3h62lrhp9bwGNn1wx
	 pZxk1FdhpJjrj5ai45QE6an1l79BeiBs7/ygqFJJHVcbRVV5DVaoA5dIu18R+aDjS8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793696341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QJ9UD3j1pW2fYURqdT7DSwvvSglFpr3UgftmmRZbYoI=;
	b=GabvpYwuOZKt5VvS6T5eK7koDx5HEOJr06gZhRWnJee4GAWkmWvCRgMkrrs9ijXlAc9d
	 zMQsZUtAVxxvkb/uC9dGyoSdbSDcR+eoAHcDwVNMSauPI22kBxwead5uIEVMfakTQV4Ij
	 sVRnai8/uyJeUkhx3mmNdAlmJ+t2FKLRwEzLAwNTwc5sQwvIraVqwn9SNrQ36SI/6BHdV
	 CuSR/1et9behKkdCOzkD+79dimKL2QYY5l97YI3jsW7YzmqBTkp6al6TI8z4ChPLlkzbU
	 8ZoUUb0JzwkSL0WaVB5HuuemUJx7ZfLxGfwWZsnXl820EsrwUkePsac2Iv/9E+0uK8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpe2h8g8;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EA0606A326
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 08:59:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4EA0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bpe2h8g8
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e8ad5b2f61so8160775ad.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 00:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696340; x=1794301140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QJ9UD3j1pW2fYURqdT7DSwvvSglFpr3UgftmmRZbYoI=;
        b=bpe2h8g86nOiHBcro9Ih8i+RodoxuZxwg3cSZSur2eOr1X9Ya7gBdgad936dNdue9p
         H9GSjKdGDIV2CC/MEF+GpBMrzRRLaf5ZvxJmfwxUuKBrlojmyPrKwNWETBkT+nlhZcF5
         nqo/jR+5+Dsv3Sr2H2/FTh4Kk7uzWRHgNHl/G3mHehiQgcS/7tUeuPAVbmmUQVhjNOzN
         PRFtPJ0V+nXMOjOzk+L6HEIqEls8lDb6tifeJZveHIg2BdOz9kh+OZrq9fLIQSRUWNTe
         LafRZqzvv1QYW1jJt6FBKN+6Fg7TvDYLngI6DDtF2wy3CbtMV36zijdQ1OmeDmbmPunb
         hwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696340; x=1794301140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QJ9UD3j1pW2fYURqdT7DSwvvSglFpr3UgftmmRZbYoI=;
        b=MVVtg0lUwvbIUyqORHZrUD+ulgRJ23yVAKt3hDPviVdGcUqdlM0vvI3Q7HBI0YwRb3
         /kQ1Qyr/tmOds6pVhIDAqwptsrGpZogjKxCci8Gzy1l6X365eC2lFuPY++3wYoEpvlLb
         +lfPmcNu7tzBJXjFhrs3bWIPDt4ng9luqTJ7+DsVK01Kgmk1pGSyNMMeEOBJOlov+LaB
         qRspgwtFOdyCETGSDLvfnSCgelPC66cdCAg1PR7ofzb/1FssRNa87RsHtYGHB25QTjp7
         AUgWfeKlUSPO+MOLU98Uka+OFEiIFul7TqziUwCpTjqmhkWRVwYeNCdEXrr/DAiUjv3K
         wNVw==
X-Forwarded-Encrypted: i=1; AKwUvBxt5h52eXcwYfvvor53ftCO89QMP1ktrDh7wm7CyzyE9HTZi3HeciyLz2w35wwzJmBfWWDMklwWs+qn@vger.kernel.org
X-Gm-Message-State: APuU4Z8uEXcsSC9UUhzu4jegVfP3ELPt4Q/zxENwifQ+u8S27Up9OUAP
	CnSS3rWhTuvEFIKg9VeQFH/hYiieXNiynfYvqgCUmRZnGQ+Deh6AWTZY
X-Gm-Gg: AYBFou17MhE55w4DaNAdOjf+VsRtlF7e8bDSZ7esp27vmaEnA2JFhIfCm5fphbFs1wv
	FVvwjTxOw5vNHwlWV7k381PeQ6Vgzn5P5217waF1iqSTglVMyMpjbk0WzdteVJHwsU2cjmA1AvB
	ltWG2UA6wcEXz7veCSTtkYP6dGhc1nbiGYIoTxwUnsLCxAKK1IJ1OYkzWApoqKbu+QZqydaOyLE
	Z39iDb5JSz3/KJnzmFzTFmhMrw+3sGf4GOygiU/4AgiADf3XMfdf3ThY2uj0zjC1iw9+TPjABXH
	j4xztX+bmf1skozOhy4QOIJiuh5a7eFwcHapZZGeADIIld7dXDs6AKhwASNnOB0wJN/JTBcOXB0
	F9+rAgbw4hy2BHr5jeYQv8wh6yfi+d1lJR94w1xoBMPMke33h0bIpvWAyzNm/tTIIN3MDKxQnp4
	9L3UDN0IW7n36WOHPsw8WmRG6YdkJL5j4ps5eZy58IY6oe8cTq7rlBGC4mEJj4aObFy9TfDoOCS
	x2rEJwnYYJOs2ta31DLb4RLv/ibIvXbutOo9RSXYEDiuCk3pEvO/ZMrJJEflyUaylKaGMQ2g2oY
	76W7jpU+8xHso7S7GM9LOaxhT41flRHb/UCcuUQRdy4BOw0Ld4bekBi9XxQasBcZk4B1DsrlCpv
	3Oq/7wJKjQNkf6AJg9xhceHfbYLv6AQpC2Q==
X-Received: by 2002:a17:90b:1652:b0:3ac:a7ee:6785 with SMTP id 98e67ed59e1d1-3ae895a0406mr17203844a91.1.1793696340127;
        Tue, 03 Nov 2026 00:59:00 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:58:59 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 0/3] phy: sophgo: Add USB role switch for CV18XX/SG200X
Date: Tue,  3 Nov 2026 16:58:44 +0800
Message-ID: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
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

This makes one DTB work as both USB host and USB device on the Milk-V
Duo 256M, following the discussion in the thread "Milk-V Duo 256M: USB
peripheral mode works on mainline, how should dr_mode be handled?" on
the sophgo list. There, Inochi pointed out that a dual-role switch is the
right way and that the default should match the vendor image.

The usb-role-switch support in dwc2 hangs on this SoC. It clears B-valid
through the GOTGCTL session overrides while VBUS is present, and
GOTGINT.SesEndDet then fires back to back. The vendor kernel writes only
the ID override in the top syscon and lets dwc2 follow the Connector ID
change, and this works on mainline too, without any change to dwc2. So
the role switch lives in the PHY driver, which already owns those bits.

Test setup
==========

Milk-V Duo 256M, vendor buildroot rootfs, loaded by hand from U-Boot.
Tree: v7.3-rc5 with these changes, CONFIG_USB_DWC2_DUAL_ROLE=y,
CONFIG_USB_ETH=y. The series itself is based on current master; the files
touched by patches 1 and 2 are the same in both trees.

Tests 1 to 3 ran with CONFIG_USB_DWC2_DEBUG=y and the DT properties
applied through an overlay. Test 4 ran with debug disabled and the
board DTS from patch 3.

In the logs below, 
R=/sys/class/usb_role/3000000.syscon:phy@48-role-switch

1. Default peripheral, bare board on a PC, nothing done after boot
------------------------------------------------------------------

  # ls /sys/class/usb_role/
  3000000.syscon:phy@48-role-switch
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0
  # cat /sys/class/udc/*/state
  configured

  PC$ lsusb | grep 0525
  Bus 003 Device 009: ID 0525:a4a2 Netchip Technology, Inc. Linux-USB Ethernet/RNDIS Gadget

2. Switching at runtime, same setup
-----------------------------------

  # echo host > $R/role
  # cat $R/role
  host
  # devmem 0x03000048 32
  0x00000142
  # echo device > $R/role
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0
  # cat /sys/class/udc/*/state
  configured

The switch was repeated without an interrupt storm, then:

  # echo none > $R/role
  # cat $R/role
  device
  # devmem 0x03000048 32
  0x000003C0

3. Default host, on the USB & Ethernet IO board, nothing done after boot
------------------------------------------------------------------------

Only role-switch-default-mode differs from patch 3 here.

  [    3.409672] usb 1-1: new high-speed USB device number 2 using dwc2
  [    3.666655] hub 1-1:1.0: 4 ports detected
  [   72.484979] usb 1-1.1: new high-speed USB device number 3 using dwc2
  [   74.804484]  sda: sda1 sda2 sda3 sda4

The USB stick was plugged in by hand at about 72 s.

  # cat $R/role
  host
  # devmem 0x03000048 32
  0x00000142
  # devmem 0x04340018 32
  0xF300081E
  # devmem 0x04340440 32
  0x00001005
  # echo none > $R/role
  # cat $R/role
  host
  # ls /dev/sd*
  /dev/sda  /dev/sda1  /dev/sda2  /dev/sda3  /dev/sda4

4. Patch 3 as committed, debug disabled
---------------------------------------

Bare board on a PC, nothing done after boot:

  # cat $R/role
  device

  PC: usb 3-9: New USB device found, idVendor=0525, idProduct=a4a2
  PC: usb 3-9: Product: RNDIS/Ethernet Gadget

On the IO board, with a USB stick already plugged in at boot:

  # cat $R/role
  device
  # echo host > $R/role
  # cat $R/role
  host
  # dmesg | grep -E 'usb 1-1'
  [  415.464739] usb 1-1: new high-speed USB device number 2 using dwc2
  [  415.940738] usb 1-1.1: new high-speed USB device number 3 using dwc2

Before this series
==================

With usb-role-switch on the dwc2 node, "echo host" hangs the board in the
SesEndDet storm, and so does boot without role-switch-default-mode.

With dr_mode = "otg" and no role switch, writing the ID override by hand
worked:

  devmem 0x03000048 32 0x3C0  -> high-speed RNDIS gadget on the PC
  devmem 0x03000048 32 0x142  -> disconnects from the PC, host side starts

Three round trips were all correct, and ping over usb0 afterwards was
5/5. On the IO board, the hub and USB stick appeared after one toggle,
but not at boot, because usb_add_hcd() moved the PHY to host after dwc2
had already set up for device:

            at boot       after one toggle
  GINTSTS   0x05000023    0x04200021
  GINTMSK   0xd0bc3cd4    0xf300081e    (PrtInt masked -> unmasked)
  HPRT0     0x00021403    0x00001005    (ConnDet pending -> port enabled)

Test 3 above reaches the right-hand values at boot without a toggle.

Not tested
==========

 - A USB stick already plugged in at boot in the default host case.
 - Running on a master based tree: all tests used the v7.3-rc5 tree.
 - Boards other than the Duo 256M. Nothing changes on them, since the
   role switch is only registered when the PHY node has usb-role-switch.

Question
========

With patch 3, the hub on the IO board needs "echo host" after each boot.
Should the IO board overlay (sg2002-milkv-duo256m-eth.dtso) set
role-switch-default-mode = "host", or should it stay the same as the
vendor image?


Chen-Yu Yeh (3):
  dt-bindings: phy: sophgo,cv1800b-usb2-phy: Add USB role switch
    properties
  phy: sophgo: Add USB role switch support for CV18XX/SG200X
  riscv: dts: sophgo: sg2002-milkv-duo256m: Enable USB role switch

 .../bindings/phy/sophgo,cv1800b-usb2-phy.yaml |  11 ++
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  |   7 +-
 drivers/phy/sophgo/Kconfig                    |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c          | 107 ++++++++++++++++--
 4 files changed, 119 insertions(+), 8 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

