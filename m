Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110611;
	b=QENT2vD2gr9TiTdc1drGKsIFmSB3WM1pehZtXMr3cbuFusQE2rViAhXSImknW0uOZD2D
	 gsI6Oywxx2A5HjV96zDut8Pgr08x4u5KFd7xeAlcvu540LV68VHJ+OznwGww4o9lfzZXK
	 k7r7OXsgsawFXP43z8pvzvujHt72hkiMANgYZkGJ6B/tMU1UhhNk9L2tXtq2ms9rFUbGO
	 9aZZ6KYug0Fp8Own6nAjDalSHXhJLqMvf76UxnXKOXVJAwu2wW9tVfMXhhF5EAhjxLI0H
	 a/aR2tr5fYmmUqqYBQI5F8VT7iP4aJrosRiKQckweCOp4U04DumewUsGWaocCnKjx/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110611;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=mnejhq/H/SZQPdPa/LlelAnqIjEaiLVH9BdFcNoAYWY=;
	b=VM7QkspqgX7XkgW6/Z70o/p/7vvqorhFqBPzB8AdyFObEN3rSnPvw+Wd20XmlD+L0Z2b
	 zbXI4Iq/32C387AOEZUOtMUqmn3AUJIHhlii2v/dEBbFMrkEdXpwYROou3o7bwaPXSV6g
	 +BVFjzOa6uDZ5NkvQ1ssU/5DvjliVXRrO8/sbxI/BwoHHwzf6zT7LAFY7ft/HP2ymEXNR
	 2XtLryLo5hoQEbq1MYcFL9KG4X4Z2Q8kp68HPWhY8KIGG9Q9kgJScA2avMBfSaq5dQdQu
	 k4f4C6vMRBgQudwzWsrXqel2TRl7O93qtbG2MpgTC75fuiA8FY/ze89oSMz52Wb8phQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aheymans.xyz;
	spf=pass smtp.mailfrom=aheymans.xyz;
	dkim=pass header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=huRUedH5;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57BD606A336
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B57BD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aheymans.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aheymans-xyz.20260707.gappssmtp.com header.i=@aheymans-xyz.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=huRUedH5
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so2296642f8f.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aheymans-xyz.20260707.gappssmtp.com; s=20260707; t=1795110609; x=1795715409; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mnejhq/H/SZQPdPa/LlelAnqIjEaiLVH9BdFcNoAYWY=;
        b=huRUedH5MibOxkehNlG9X86upNwlh2yY054K0zSCkbHorUAG1/sTdpr0DFiqI2bMeA
         GB85882arLtlgYsCzGXGg+K7fCb8FQdr8p+4VNWkQc7RvCTdcbIzYp4+YipQ9DKf4efs
         i3HefOUdJe5i+wbBv/dQzxFY8Hdq/q+6fbRIyiKgckOsdV6slVrrSlSTdUkTILjCkjgr
         BCfZm4ULxdHCewa70HX2FyQRANBvX8+lJqCy/o3X5pJqHQQ71Ede7f92O9B/q2M0hall
         e0TmmXuJwtKezdFTLl73iAaGv1canePJ1JW0TNpYKCGkexisWiqehwaqD8qyAxOwrM2L
         nr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110609; x=1795715409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mnejhq/H/SZQPdPa/LlelAnqIjEaiLVH9BdFcNoAYWY=;
        b=tZEMdWP8KycjpXjwUXRTLg/NzQdrrfejmRAfi3wAhY1VA8D2LVko6vS4xpQ6FUSHmr
         w51HyvD7VrPwly9ariwyL3ZMenpDxaLWtBmhQL58hdEy8HPhkVROSB4pax7lzcsNeLbS
         v8NjhT1bR1RxVi+7jgEbZR82LHf7wh73hNDdeX/UVUokiGUPlzoymgV2XZeKT4FpKE0b
         7h28NHukwj2W0TG7jtAvdpoj8Z/QxXva4ucrew8zn/rYYQWoxVBo/+UiaEHxzM56rXYg
         /B3Au5stkn6HHxPDd5dI/z9oAq9qWa3zd6KNoQCK0Z2N3McL3CTUya1r0nL8Iqs/rGXB
         DXLw==
X-Forwarded-Encrypted: i=1; AL+hErGUpDGoAryq0fex8pxk/f97F8I+OUM+UhkLXtaEhmv+qbxaXfawV+wT61am3NubSKkJsLLBzsjbDQh8@vger.kernel.org
X-Gm-Message-State: APuU4Z/LKsHHltmnpHBPN0Kw1zMer6gRKJTDGNizjNAIRBGfVqn5KQ4T
	uZ/mUTjxM2MCxi36uuY3UWn9bKcfgXCKrGDQRvqsRmhmCvdSebbhD0GRwB/TDx/oEsA=
X-Gm-Gg: AYBFou1yXtW6PfGr6+ianyIpeKn/S1vkohA9MJGTNbF4HqsPY5fI5vclPtdylHS7Ya2
	vYEf0aAutzSdbEexVrvB7q7uKMn5782WV4IkS6I/qExK/PKvJxLMN1ixJjhFnRLMeftYwJOKTlI
	998LpmF/S1exlXeUc2L4ApbpFHBgWkKF+yxt5NJAXEU47P0CBW2x8TH5c/uhNNiFD3gLpGIU5C0
	HygnlkGPFdHkGxTMpzg5e+GniV/tsH0yW0iMKm5Ua7SKNZly7sSjYMl57triVcoDfSd+eqcIO4p
	oGMe/Xqh46EpooKdsAIcdbjwjQIMWfTXUiGhy+Vrpxwj1WGAyCbBSwr4G7lsklZ5A1/Q8WREvYQ
	VhLh9RvgmupNf7r++TyOQSHfrE0B7mgG0F84SUom/sZmA0wyaVAQSRJFqKmrgm8SjslISSuxR4V
	MxeacT+IYRAXyHF+kG3MrglY8bUq4VkV8+uL0t5fQWX3Xpja36kYikanL/MYsx0iNMaY40RnlnD
	774PRXkmR+bORyP0kFrWIryDnkDuRUByV4FAbeUkfJ+CWzNDzJNAURVJd5lDxqKAlwvllF/OWeS
	jaV32MxMFoPGSmhJqFEpox4z7i/zMUDgr/o/7KxMQpKWSKrz9+hhtkYSa/PM3K+ecc8kmXpzt3f
	3316rLwFIqxGGff19Bx4zRNrUlXsiQxYjZ5mfRXX2jsgx4+X/tAc9tnNcK/H8hTJn2lLErd6PnI
	PjzaBZmA2j/B09jVeAZydZdeM=
X-Received: by 2002:a05:600c:5246:b0:4a7:9006:b176 with SMTP id 5b1f17b1804b1-4bb887fe892mr6623085e9.7.1795110608655;
        Thu, 19 Nov 2026 09:50:08 -0800 (PST)
Received: from localhost (2a02-1810-b422-d400-611-84c9-252f-74ad.ip6.access.telenet.be. [2a02:1810:b422:d400:611:84c9:252f:74ad])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm19205815e9.11.2026.11.19.09.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:50:08 -0800 (PST)
From: Arthur Heymans <arthur@aheymans.xyz>
To: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-mmc@vger.kernel.org,
	Solomon Peachy <pizza@shaftnet.org>,
	linux-kernel@vger.kernel.org,
	Arthur Heymans <arthur@aheymans.xyz>
Subject: [PATCH wireless-next 00/10] wifi: cw1200: add XRadio XR819 support
Date: Thu, 19 Nov 2026 18:49:52 +0100
Message-ID: <20261119175002.458988-1-arthur@aheymans.xyz>
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

The XRadio XR819 is a 2.4 GHz 802.11b/g/n SDIO chip found on Allwinner
boards such as the Orange Pi Zero. XRadio likely bought the IP from
ST-Ericsson: the XR819's host interface is based on the WSM interface
of the CW1x60, and it reports the CW1x60 hardware revision. This series
therefore adds it to cw1200 rather than adding a new driver.

Patches 1-5 fix existing cw1200 bugs. They do not depend on the XR819
changes and carry Fixes: tags:

  1  a double debugfs removal on unbind
  2  SDD elements read without length checks or unaligned access
  3  SDIO transfers from stack buffers
  4  GPIO interrupt setup not unwound on error
  5  mac80211 unregistered after the interrupt is freed, so every
     unbind of an associated device ends with "stuck in firmware,
     killing BH"

Patches 6-7 add the vendor prefix and a binding for the SDIO function,
with an optional GPIO interrupt and MAC address. Patches 8-9 add the
XR819: a first-stage loader written to SRAM before the usual firmware
download, the SDIO ID 0020:2281, and a card reset on probe so that the
device can be bound again after an unbind. Patch 10 takes over the
orphaned driver as Odd Fixes, as I presume someone needs to do it?

Firmware
--------
The vendor firmware is not redistributable, and it speaks a dialect of
WSM that cw1200 does not: it reads bits 6-7 of the message ID as an
interface number where cw1200 puts a link ID, and its TX confirmations
carry per-rate retry counts in place of the media and queue delays.
The firmware these patches are tested with therefore comes from a
reverse-engineering project and speaks the WSM that cw1200 expects.
The firmware is written in rust and runs on a ARM966E-S core. It
is licensed MIT OR Apache-2.0 and builds the three files the driver
requests, xr819/boot_xr819.bin, xr819/fw_xr819.bin and
xr819/sdd_xr819.bin (this one is pure calibration data).
Code repo:

  https://github.com/ArthurHeymans/xradio-open-firmware

Documentation on the hardware obtained through reverse engineering and
black box testing.

  https://arthurheymans.github.io/xradio-open-firmware/

I plan to submit them to linux-firmware once the driver side is
settled.

Testing
-------
Tested on an Orange Pi Zero against an Intel peer with WPA2: station,
access point, a 10-minute traffic soak, and repeated unbind and bind
with both the SDIO and a GPIO interrupt. SPI is build-tested only, and
without CW1200 hardware, patches 1-5 are tested on the XR819 only.
Details:
https://arthurheymans.github.io/xradio-open-firmware/orange-pi-zero-smoke.html

Tools
-----
The patches were written with AI coding assistants from my instructions:
OpenAI Codex for patches 1-4 and 6-9, Anthropic Claude for patches 5
and 10. The assistants also ran the board tests above on my hardware.
I have reviewed every patch and take responsibility for them.

Arthur Heymans (10):
  wifi: cw1200: avoid removing the debugfs directory twice
  wifi: cw1200: check SDD element lengths before reading them
  wifi: cw1200: bounce SDIO transfers that use stack buffers
  wifi: cw1200: unwind GPIO interrupt setup on error
  wifi: cw1200: unregister from mac80211 before freeing the interrupt
  dt-bindings: vendor-prefixes: add XRadio
  dt-bindings: net: wireless: add XRadio XR819
  wifi: cw1200: load the XR819 bootloader into SRAM
  wifi: cw1200: add XR819 SDIO support
  MAINTAINERS: add myself for the cw1200 driver

 .../bindings/net/wireless/xradio,xr819.yaml   |  49 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   4 +-
 drivers/net/wireless/st/cw1200/Kconfig        |   6 +-
 drivers/net/wireless/st/cw1200/cw1200.h       |   9 +
 drivers/net/wireless/st/cw1200/cw1200_sdio.c  | 200 ++++++++++++++----
 drivers/net/wireless/st/cw1200/cw1200_spi.c   |   2 +
 drivers/net/wireless/st/cw1200/debug.c        |  19 +-
 drivers/net/wireless/st/cw1200/debug.h        |   1 -
 drivers/net/wireless/st/cw1200/fwio.c         |  67 +++++-
 drivers/net/wireless/st/cw1200/fwio.h         |   3 +
 drivers/net/wireless/st/cw1200/hwio.h         |   1 +
 drivers/net/wireless/st/cw1200/main.c         |  50 ++++-
 drivers/net/wireless/st/cw1200/sta.c          |  26 ++-
 include/linux/mmc/sdio_ids.h                  |   1 +
 15 files changed, 361 insertions(+), 79 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/xradio,xr819.yaml


base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.56.0

