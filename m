Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46952DC76A
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271006; cv=none; b=bFpjz7ILM7iMwR5WYHh0De5G6ufJ9XSfyEDCD2LIf9hg6UFxD6vsRGWQIbyyJ7Usy2KLoanX7f7KM2Y14V9FPF88m4WdXzbdhITYY0e6TdAtaMvs5shQFsHT8iUA7+G8v7zBDW7p+fxMna8WP8pSNJG2kk5T6XesjV98dCysSGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271006; c=relaxed/simple;
	bh=D55jdz0uIc/qge56hNomD2wxxsVODJGJ5/yGkCrTFx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=minMOrYn2irMorqQsY3a7s+gMe6PQUVGVexlp6ftiak2zMOVU+M5oM6uOTZqGB1n7N2fTr2XqkTJ2yz2cZgoXN5QSzNbhsxKS8RK6Hbw6wsf8IS6X29qrJ3ucWm3F8XtGbaoLqMS8pYtn4suciF5VsDx1t8YMWKtU68AC6h8QrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvCxJbxZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvCxJbxZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so11419365e9.0
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 06:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781271003; x=1781875803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=34xJfHUtfBhzidmrk3neM4lC4vDotCKUYix1d8mNaWM=;
        b=VvCxJbxZyinFjZIbRwAT76Ybm9QNPKuLrCC+sXZHgGQkw52GXTC6qyXq+AtueQpdkD
         F84A/9fijAq3udQ53yR826+XUZFWMIxfnaZUqlsZDHuYQDmylbu/opKYy/mGqXD7SZxA
         YKj9jzEjKhdh1Fe8NdH9ZVR40AtFVLvSGF8lyz0L8KUc2K9Vmy87imF6JRzke5XOz/75
         X96XUbv7jg73tqIvJXA/n2dgo8fAbP8CGJYDmx9DNzfwdSdD3TW6xalN51C+k2mRlpLJ
         FnyV6fz348PRASrk9X6uR3Lvj3SHeZ3Q4v6Y9Q/7PDML622INfieshcpqJhmd5Ja7lCd
         +8fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781271003; x=1781875803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=34xJfHUtfBhzidmrk3neM4lC4vDotCKUYix1d8mNaWM=;
        b=L4g/yKLsWteTMiBs6Am+8zXqloGb2R1/vEfNATItNbCMZvAMVmiAtm+8Gh5ri5gOAe
         sWvkrIPug8ThzLLm/W4veQtGpWdBVViGUhh6VHYt674uNX5FbTno6dztYWK1jQVHc2R8
         GAj5INgjADSbxg0t60xTuRjTtiG1UTeDQNHqgG1jXXOA6vEcPpbGSRDowpIADcRhHL4h
         OfkrWRmJsKbJcynjyIApRCtyq3srWyLajIeUw1QyB8FWBBoS0K5hL6HPNuSB1m3NXBLc
         8A4JYXB4MkquHo9LGQ5P3MSaiD6o1ZW4Fwq+jB9wwOYe/Xv8s7z2xwzMsI1bNUg4XEIo
         KFWg==
X-Forwarded-Encrypted: i=1; AFNElJ80S3OYQKvDSghfjZn1J/ebfV7ScG5LyQqAY9VKwjX1cb4kf0BjI2+rTIbL+C+AzyyZcOF/jthELCzR@vger.kernel.org
X-Gm-Message-State: AOJu0YwKr0uUS/CGWpci4AldmcHwTBV7XpwczevPBWL1kxodQ13xYISM
	lXsA1zWejg7wVgfPpbE6NwbH+X6GHJfhtXEXaWYXS7iqBfIngY6MFUde
X-Gm-Gg: Acq92OFEbg4sdjIOMUaQvbDORbJcPbJaiOBUOk4TZuONhpx7KmAdQlqI1SaypEAqJhu
	wEtZWPtYE+QYPBtZXVT/Fq0nSWyMtSDjSn/QmZ6gky/uGtIg872biVCjvbsG34YRVB9I+YiWW4G
	Xv0i5QclTjw3u8yuNPP4H7bd38nulKpRRzpUJ7sbb5jyPpsj2Ri+wXHV72b0/icGIG42m0QG+Dr
	cpCSMbiCqUAk+JVzyxljyuOpuGFqeuChav0VHgsQj/SGEPF+rZlhCnF5KKGovsYroHmPm2TgwAr
	m37NYs6u/qmDYnuMqyjh7nBZoGMQ2blj6e9+6nDHV6VKpWm30YSZKd6hZtT9pRKpuu5WIekIkWH
	Mhi6gUZPbn1X00VlJj/HfXt0iHL/4UXwl55ajfl3uwf1DsXMFuqR079SYyOB9Bsplj4txCltfp+
	3gQuppb0jKKAEJoZSdthS291XaOQ==
X-Received: by 2002:a05:600c:574c:b0:490:d354:bcef with SMTP id 5b1f17b1804b1-490ec504ab0mr30086585e9.33.1781271002915;
        Fri, 12 Jun 2026 06:30:02 -0700 (PDT)
Received: from builder ([2001:9e8:f11c:fd16:be24:11ff:fe30:5d85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2cf582bsm166811555e9.10.2026.06.12.06.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:30:02 -0700 (PDT)
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
Subject: [PATCH net-next v2 0/2] net: pse-pd: add Realtek/Broadcom PSE MCU support
Date: Fri, 12 Jun 2026 13:29:40 +0000
Message-ID: <20260612132944.460646-1-jelonek.jonas@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds a PSE-PD driver for the microcontroller (MCU) that fronts
the PSE silicon on a range of managed switches, together with its DT
binding.

Hardware model
==============

These boards do not expose the PSE chips to the host directly. A small
microcontroller sits on an I2C/SMBus or UART bus and manages one or more PSE
chips behind it; the host CPU only ever talks to that MCU, using a fixed
12-byte request/response protocol with a trailing checksum. The PSE silicon
never appears on the bus.

The same protocol family is used by MCUs fronting Realtek PSE chips
(RTL8238B, RTL8239, RTL8239C) and Broadcom PSE chips (BCM59111, BCM59121),
diverging in opcode numbering and a few response layouts. The driver
abstracts that behind a per-dialect opcode table and parser hooks, selected
by the compatible. The specific PSE chip behind the MCU is detected at
runtime and only influences per-chip constants (power scaling and the
per-port cap).

Why the compatible names the protocol, not the chip
===================================================

The compatibles are "realtek,pse-mcu-rtk" and "realtek,pse-mcu-bcm". This is
a deliberate choice and the part most likely to raise questions, so the
reasoning up front.

The node names the protocol dialect, not a part:

  - The DT node describes the MCU, not a PSE chip: the PSE chips are behind
    the MCU and never appear on the bus, so naming the node after one (e.g.
    "realtek,rtl8239") would describe hardware that isn't at that address.

  - The PSE chips are, in principle, usable without this MCU (host-driven
    directly) - different hardware with a different programming model that
    would warrant its own binding. Claiming the PSE-chip compatibles here
    would collide with that.

  - Naming the MCU silicon is equally wrong: these are ordinary
    general-purpose microcontrollers (GigaDevice, Nuvoton, ...) that vary
    across boards and are not dedicated to this application.

  - What is fixed, and all the driver needs at DT-parse time, is the
    protocol dialect, so the compatible encodes exactly that. The two
    dialects share one protocol family and one binding, kept in a single
    "realtek" vendor namespace because this MCU front-end is found almost
    exclusively on Realtek-based switches; a "-rtk"/"-bcm" suffix selects
    the dialect. This follows the "google,cros-ec-*" pattern: a compatible
    for a firmware/protocol interface implemented by varying
    microcontrollers.

One compatible per dialect spans both transports:

  - The 12-byte wire protocol is identical over I2C/SMBus and UART; only the
    plumbing differs (SMBus vs native framing on I2C, baud rate on UART),
    and the transport is already expressed structurally by the node's parent
    bus (i2c@... vs serial@...). A "-i2c"/"-uart" suffix would only
    duplicate that, for a protocol that does not change across transports.

  - This is the multi-transport model used by e.g. "bosch,bmi160" (one
    compatible, separate i2c and spi drivers binding it), rather than the
    cros-ec model of per-transport compatibles - cros-ec splits because its
    on-wire framing genuinely differs per bus, which is not the case here.

The binding documents both points as well.

Testing
=======

 - Linksys LGS328MPCv2  (RTL8238B, I2C)
 - Zyxel GS1900-10HP A1 (BCM59121, UART)
 - Zyxel GS1900-10HP B1 (RTL8238B, UART)
 - Zyxel XMG1915-10EP   (RTL8239C, UART)
 - Zyxel XS1930-12HP    (RTL8239, SMBus)

---

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
 drivers/net/pse-pd/realtek-pse-core.c         | 1007 +++++++++++++++++
 drivers/net/pse-pd/realtek-pse-i2c.c          |  164 +++
 drivers/net/pse-pd/realtek-pse-uart.c         |  156 +++
 drivers/net/pse-pd/realtek-pse.h              |   87 ++
 8 files changed, 1606 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/pse-pd/realtek,pse-mcu.yaml
 create mode 100644 drivers/net/pse-pd/realtek-pse-core.c
 create mode 100644 drivers/net/pse-pd/realtek-pse-i2c.c
 create mode 100644 drivers/net/pse-pd/realtek-pse-uart.c
 create mode 100644 drivers/net/pse-pd/realtek-pse.h


base-commit: f6033078a9e671e3c8b83d387b91591a6f6a54e7
-- 
2.51.0

