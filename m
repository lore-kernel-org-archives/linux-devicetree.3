Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAE0F3128D7
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 22:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782685635; cv=none; b=VY3gv4tqvUcWKocvzHvMd+sKu9fyQrgh5Ry/gThpMbCU8+fkbA/2adIItHcee93QHIolpKRzGLzFPZLL/uq6gyXZ6ntJjsB2DCYnF41ldbDcWEk6ctVZBBPJ26gh+umGR4TJjxe4i5MC+MXlzkoMdrGXWFO0MI6uOdbj3U46JVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782685635; c=relaxed/simple;
	bh=XnpeFFRVO0tjDOoFmUitfP//W/nUOurCQmEvHUHdycg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EA9E/3VOrD5ccGnSo1LHOIHnfZkrBGSW07VOUSstqWV5fXrmPA1yn0WPD+K4be98HbcMJNGZduOQPqdkNkZ3MrYmKnpHU6+QaqM1ufHyuA+eARSa68spYWHgD+qW1A4czEn6VzLzYz+GidQ4EkkZ/akkiEYShdpAIsKPza0FMR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qGbtdkMu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qGbtdkMu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4926bd21aa1so19895625e9.3
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 15:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782685632; x=1783290432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gjl7WES8qENIG4D2sCAdOBhowl2ZPI7VPIfctvhWNJE=;
        b=qGbtdkMuUtpiPn4jYoEgv7CUUVXcgVZ4K8kPLbriFHAJo4N3d4QR++TAN4wOBjoQDm
         ZZWcFNEWhaDGFBLQxnxkPaUHaHNuDYqtxMVjk9TaMzi/gzTj1NgIP8ukiPC+JKcyhJQw
         eBhk5clcuM3T049g1cOwlkC/JIsAF40lb1f+CTm+9PIMXBGmnR4QtYGSAs7JdJxJFFAf
         I1j5w5xNKGloI4YSLtmZPz8YRbRRlkJOJdij7NXh0x7DFR0gEGlMA8HwaIod2DeauUtH
         yUBDr9E1p74ppCWr2zLew9ecQAZACwVz9Pi8q+7l/FfED35o2zq6orfpsOjHwHPp1xV6
         vKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782685632; x=1783290432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gjl7WES8qENIG4D2sCAdOBhowl2ZPI7VPIfctvhWNJE=;
        b=GN0WOtYgdcYPMJ3UOFcKq/Cr3X4XpbGt5MwIh8uVP5f5g8n1lD54QuWezuzXNgHsZL
         nugu55K+k9paE+z+l8gB1pBGze8HSbOihuZAQkDN8cpFAwMgeNsC0kOz8BqFobdecixZ
         /tbZxtIJfxAMG6dN7jFy30dIoIqWurhXkHRR8qV8yPJ+5docNXi3D7s5a3ym8miW1zQ3
         oPdD2Yj9VB7ibwZ5QGFSS5g2FK2VoHJJGB1OmpD3/5nFFs1zxnCWSTOmOx0AYqwxyIuB
         XRG1aTvPk6kLKeOm4Kj7NZoCCEYr+FXvSUwMe7Vv6Yll1+qyAVAAUJIWtrqExPjrpVA8
         U0Cg==
X-Forwarded-Encrypted: i=1; AFNElJ8W6z40jJUeKjJ998LJVytlUG5KQkuW0N2zsYHxRK0isUkVOozhx7GRR20uOKz3QcKqxQsrURKvWiqL@vger.kernel.org
X-Gm-Message-State: AOJu0YyKs48hRQml6V3yQnAiTURw8BxMAm5ApSq40GPPjpJHOeas2kdd
	6O8dA7Jd7Pc5Ewgp22vCkwLl/zBEiXlHw/IFyKVTrC/010HaZiQ6dk8z
X-Gm-Gg: AfdE7clgOY5K6bOS6LZwopZnDsCZpz7lHjYbwpxJxFZw+f7CiWLmrW26NgPe9Xpu0xZ
	qB9X/SULLs4sl43lT8wqQlJOEXrRRz3BRcne6knnKL/VGjL/FrAdS1FA8lVO2RnoZBmHjqvR8E5
	WV67O63yKS90H+9u08K5l6fWC1uaopVyf+kexEIPHDDI6ujJ8lOghtxj1rTgZjcb4jO3vCzx+4p
	/9h3wO+jfmCuOH/P0MlDRei0Kj/8CpR5X/IwjNwqkcKMy/oEturbvRsGOLexok2IrLFe2WHP1nM
	BJM0ltQ64FgYpmGsGxHdze1Sw4+7XGR1AH5vhUHL712xnNh27tzFcQj66EcTbHXPojtF1u+YKqR
	e2/hLTUmmMq3kGrzTcf3Nyeq4wnAgWQZINVnr9DP2niWhpB9Qt42DZzW7AYE9k2qvIEimkjC3aD
	/Yn4WMI5QiMExXVb0=
X-Received: by 2002:a05:600c:8b08:b0:490:b473:8f78 with SMTP id 5b1f17b1804b1-4926687e70cmr224768435e9.17.1782685631820;
        Sun, 28 Jun 2026 15:27:11 -0700 (PDT)
Received: from builder ([2001:9e8:f10e:1a16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm246811675e9.8.2026.06.28.15.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 15:27:11 -0700 (PDT)
From: Jonas Jelonek <jelonek.jonas@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	Jonas Jelonek <jelonek.jonas@gmail.com>
Subject: [PATCH net-next v3 0/2] net: pse-pd: add Realtek/Broadcom PSE MCU support
Date: Sun, 28 Jun 2026 22:27:02 +0000
Message-ID: <20260628222705.4052815-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a PSE-PD driver for the microcontroller (MCU) that
fronts the PSE silicon on a range of managed switches, together with its
DT binding.

Hardware model
==============

These boards do not expose the PSE chips to the host directly. A small
microcontroller sits on an I2C/SMBus or UART bus and manages one or more
PSE chips behind it; the host CPU only ever talks to that MCU, using a
fixed 12-byte request/response protocol with a trailing checksum. The
PSE silicon never appears on the bus.

The same protocol family is used by MCUs fronting Realtek PSE chips
(RTL8238B, RTL8239, RTL8239C) and Broadcom PSE chips (BCM59111,
BCM59121), diverging in opcode numbering and a few response layouts. The
driver abstracts that behind a per-dialect opcode table and parser hooks,
selected by the compatible. The specific PSE chip behind the MCU is
detected at runtime and only influences per-chip constants (power scaling
and the per-port cap).

Why the compatible names the protocol, not the chip
===================================================

The compatibles are "realtek,pse-mcu-rtk" and "realtek,pse-mcu-brcm".
This is a deliberate choice and the part most likely to raise questions,
so the reasoning up front.

The node names the protocol dialect, not a part:

  - The DT node describes the MCU, not a PSE chip: the PSE chips are
    behind the MCU and never appear on the bus, so naming the node after
    one (e.g. "realtek,rtl8239") would describe hardware that isn't at
    that address.

  - The PSE chips are, in principle, usable without this MCU (host-driven
    directly) - different hardware with a different programming model
    that would warrant its own binding. Claiming the PSE-chip compatibles
    here would collide with that.

  - Naming the MCU silicon is equally wrong: these are ordinary
    general-purpose microcontrollers (GigaDevice, Nuvoton, ...) that vary
    across boards and are not dedicated to this application.

  - What is fixed, and all the driver needs at DT-parse time, is the
    protocol dialect, so the compatible encodes exactly that. The
    "realtek" prefix names the owner of the protocol the MCU runs -
    Realtek documents it and supplies the firmware - following the
    "google,cros-ec-*" pattern (the prefix is the protocol/firmware owner,
    not the varying controller silicon). The "-rtk"/"-brcm" suffix selects
    the Realtek or Broadcom dialect; the specific PSE chip behind the MCU
    is detected at runtime.

One compatible per dialect spans both transports:

  - The 12-byte wire protocol is identical over I2C/SMBus and UART; only
    the plumbing differs (SMBus vs native framing on I2C, baud rate on
    UART), and the transport is already expressed structurally by the
    node's parent bus (i2c@... vs serial@...). A "-i2c"/"-uart" suffix
    would only duplicate that, for a protocol that does not change across
    transports.

  - This is the multi-transport model used by e.g. "bosch,bmi160" (one
    compatible, separate i2c and spi drivers binding it), rather than the
    cros-ec model of per-transport compatibles - cros-ec splits because
    its on-wire framing genuinely differs per bus, which is not the case
    here.

The binding documents both points as well.

Testing
=======

 - Linksys LGS328MPCv2  (RTL8238B, I2C)
 - Zyxel GS1900-10HP A1 (BCM59121, UART)
 - Zyxel GS1900-10HP B1 (RTL8238B, UART)
 - Zyxel GS1920-24HPv2  (BCM59121, SMBus)
 - Zyxel XMG1915-10EP   (RTL8239C, UART)
 - Zyxel XS1930-12HP    (RTL8239, SMBus)

---

v2 -> v3:
 - dt-bindings: using brcm instead of bcm for Broadcom
 - rename the driver files and Kconfig symbols to realtek-pse-mcu-* /
   PSE_REALTEK_MCU* for consistency with the realtek,pse-mcu-* compatibles
 - rename driver-internal prefix from 'rtpse_' to 'rtpse_mcu' to
   emphasize this targets the MCU-centric setup (and leaves room open
   for eventual directly addressable PSE chips)
 - rework the vendor-prefix rationale (binding + commit message): the
   prefix names the protocol/firmware owner (Realtek documents the protocol
   and supplies the firmware), and -rtk/-brcm select the Realtek or Broadcom
   protocol dialect
 - core: reject zeroed/echo-mismatched responses via the echoed seq_num
   (a BCM PORT_ENABLE on port 0 was otherwise accepted from an all-zero
   frame)
 - core: enable the PoE supply before global-enabling the MCU, and roll
   back the global enable on probe failure or driver removal
 - core: drop inline from helpers (flagged by automated check)
 - uart: update the completion under rx_lock too, so a late frame can no
   longer make the next transaction fail spuriously with -EIO
v2: https://lore.kernel.org/netdev/20260612132944.460646-1-jelonek.jonas@gmail.com/

v1 -> v2:
 - all points flagged by Sashiko addressed:
 - uart: drop frame overflow (return count, not the stored length) so
   serdev retains no leftover bytes that would misalign the next response
 - uart: guard rx_buf/rx_len with a spinlock to close a data race between
   the async receive_buf callback and send/recv
 - i2c: return terminal MCU error opcodes (0xfd/0xfe) to the core
   immediately instead of polling to the 1 s timeout
 - core: cap BCM59121 at 30 W (802.3at) — the basic 8-bit set command
   can't program the advertised 60 W (it silently clamped to 51 W)
v1: https://lore.kernel.org/netdev/20260608205758.1830521-1-jelonek.jonas@gmail.com/

---
Jonas Jelonek (2):
  dt-bindings: net: pse-pd: add bindings for Realtek/Broadcom PSE MCU
  net: pse-pd: add Realtek/Broadcom PSE MCU driver

 .../bindings/net/pse-pd/realtek,pse-mcu.yaml  |  154 +++
 MAINTAINERS                                   |    7 +
 drivers/net/pse-pd/Kconfig                    |   28 +
 drivers/net/pse-pd/Makefile                   |    3 +
 drivers/net/pse-pd/realtek-pse-mcu-core.c     | 1017 +++++++++++++++++
 drivers/net/pse-pd/realtek-pse-mcu-i2c.c      |  162 +++
 drivers/net/pse-pd/realtek-pse-mcu-uart.c     |  155 +++
 drivers/net/pse-pd/realtek-pse-mcu.h          |   87 ++
 8 files changed, 1613 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml
 create mode 100644 drivers/net/pse-pd/realtek-pse-mcu-core.c
 create mode 100644 drivers/net/pse-pd/realtek-pse-mcu-i2c.c
 create mode 100644 drivers/net/pse-pd/realtek-pse-mcu-uart.c
 create mode 100644 drivers/net/pse-pd/realtek-pse-mcu.h


base-commit: 805185b7c7a1069e407b6f7b3bc98e44d415f484
-- 
2.51.0

