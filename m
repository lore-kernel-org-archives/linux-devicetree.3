Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B4F3C3F70
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 02:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785896916; cv=none; b=cJyhfsB4rvcZKFVzxHqEe1GbPdUBBz5QnX2ddBWObLAUuwB6q4QHH3TZwm9ytMvVaOvPH6/Nz4MwxPObLpOOPrC9le0AiWR8JfTDTDq8cKdqC8qVk6D5q3qjDY97YT5ktO2/w8QDHvSCLpZEipHkbXWNVkvkSMwHME8aULVxD+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785896916; c=relaxed/simple;
	bh=AgYor1tl4LwK4gNfv9Pb0FXMqBQ2M23h+n+2e5R1FgA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=thOb9vARz4f5CgbIV5ZO6VvC9EWdlZ1tPm9Ja0AprX+BaRnCEIZTcRElcCLOCBO1DOnelhyMsq5tzA9FNjKCrH63h1YESZ8n2uMg3dizscNSY2C4aNtOFV2kVV81vfasy/Jpt+YkG7xW/U1bmeQ/xVIO0/mhEcNWFl5SBcqFl64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrKqZuth; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrKqZuth"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7eb61bbeb25so383334a34.1
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 19:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785896913; x=1786501713; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+1ymEvJrHT6jMKxrOcndPKlvHyWzoiSIEsONq571lkk=;
        b=nrKqZuthxqac/TibDCr6p48+pqrsNOic9pcBp4Gx8i3tmo1pjps99Y1YDpimv1k0qR
         RaZVhAx41/yOBUTgPtZ8nhF8n3hIjOFQRnBDkDcja0wQQGJJwKePvzcB6+Tx66CRsdDB
         r+av8pqkMClMrN6fRfVy8m74gtgMgFjrVgjGG+Xezaa4ju2IK/HBjfgkIqC6P7vQlhpu
         we/b8r1+gPhGZ6D9TTXGxF61y1yzU4rMnYUiQI/WuE+BBFMbGq3AUj7p3stVyCVDjCiB
         OL5BaZgVZ8y5C7Ln+pXyjLLfwKlVLic1XENA/cccOIMckCrbfVUeHMGqdO6ej5k0KBs/
         5vFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785896913; x=1786501713;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+1ymEvJrHT6jMKxrOcndPKlvHyWzoiSIEsONq571lkk=;
        b=VJHMx45PSaQS6+2rlOjVdTas+wgppfZJA8gwuTnt005qA266AuEWXG+W56wQZNKaDW
         Y5zL7i/F8kX39N9w+TlaAfds4mMSP4B4i4U+kp1r7wWWwR03QaYSiRd77dyTE0F9kk34
         mSYJokDkGukmisDcVc1P7BYZ/imKCrVzslPhyCC1eIrtfqNRRqk4y1onY8Kfzhnsh8bI
         yA6+T4o8UYcMqI9XfA+nRzxtluTCIAL3y99jDqlFgYfNv3teYEwRLFnoVlLZkUT3NIqz
         3NQ+epYeu/9En3xIVvWXgDUGhCVXkWJkqYyaimoNpMxO/l0udyhcURkXCl2LyZcRUq/A
         RAhQ==
X-Forwarded-Encrypted: i=1; AHgh+Rra0muxPKcob6j5+RyuI5z1Nm/fB0gfs3kgCinsrlNG3OVHlp4Q9WLhH2sMO/lU9k2THUr4qNZPpyRK@vger.kernel.org
X-Gm-Message-State: AOJu0YyJIr+N4Fc/5G5VhBkfphFgme6wDUxain+NtJb20iYyzUTGkwXi
	mW9ysJyUwPOZCwgtzSD41KGp28UhzVu040HzG45rCGmxEaAEqm/J8TC8
X-Gm-Gg: AR+sD12rddXpB7N6uJMMlsLsKWu4P9CzCxy7HQx1m+WKewdaRq17eZu9rjuX8toouWe
	+e9TDaDdv5P8lCFpO3ujf/XbPeSsEXm0tRQ8vJrnWz1JJzBJhhnQjON3PcCINKnQOOFFvr9PHk0
	55NFz8zcEII4r+P0XSdQdKGI55v60cIPxD5VuqPoby55rHWmwu9AK+LAGnCuAKY3tOO4rM0KhgC
	I+67A3LvsttVZxx1czuuMzCUqX6XS/nHItkOy+Y++iIU75ur0ZR5GXb7xUPWHjJASM843hlkPH5
	1Qi/WNBWPs9ZVGAh1lgRicu/Xm1lUsjBPjHqF5xQ4g75X/BuGSTRP89dQf5O1NHEsBFuUkWCiwN
	ouDk8JdrXRwFiNj/DfCqHr0Xd+FkdiuS3EM7jW4Ipd1ukFooGXb0GrlZfSG8iZvXPkikYzEVJ8l
	SNXh1V3bG1Rqa/QucpKHOhlXCQntr/PXwzQ32CUrU0hXyNhMH4yY4wS2DaT0m5LncM88MLU6sHA
	g+lNNWngkxyG9Sw/+Ct8/KZqpEBI3+NDxDBMmOq/druktwiAWsN5UkOtr0XddoktHll35CGkpS7
	ff8CGwKk38Vye1b1y/wPZGBMp3I2tCAZ4Q8CEctCHpMV2RHtVbKusxkoJqm0jn1q0GBdFs2Y2RN
	WoV+Fk9B5EvWw3fVj
X-Received: by 2002:a05:6830:258c:b0:7e9:e288:2b60 with SMTP id 46e09a7af769-7f1e5c13d31mr2587945a34.1.1785896908242;
        Tue, 04 Aug 2026 19:28:28 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f1df565d37sm2078153a34.16.2026.08.04.19.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 19:28:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH net-next v2 0/8] net: phy: add X-Powers AC200/AC300 EPHY
 support
Date: Tue, 04 Aug 2026 20:26:58 -0600
Message-Id: <20260804-submit-acx00-of-dynamic-v1-v2-0-3eef49ff1d8c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OSw7CMAxEr4K8xigNHwEr7oG6CI4LRiSBJK1aV
 b07oXAApNmMZvw8IySOwgmOixEid5Ik+GL0cgF0M/7KKLZ40Erv1F5pTO3FSUZDvVIYGrSDN04
 IuwoPG6MsVdtG7zUUwDNyI/0MP4PnjJ77DPU3KZw7U/6wf93Ir7b8z9+DT+0mKYc4zOO6asb8s
 6NIoTLbNdkD64rodHVGHisKDuppmt5lRCtG9QAAAA==
X-Change-ID: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

This revision deliberately limits the series to the common PHY and the
two package-specific control paths. It does not contain runtime Device
Tree selection, generic MDIO reconfiguration, LEDs, interrupts,
Wake-on-LAN, statistics, EDPD or PHY-autonomous EEE.

The AC200 and AC300 MDIO link endpoints report the same Clause 22 PHY
identifier and use a compatible link-side paged register layout. Neither
endpoint is accessible until its package-specific control path has
initialized it. AC200 uses registers in its I2C MFD regmap, while AC300
exposes a separate non-PHY Clause 22 control device.

Keep those transport-specific resources in separate control drivers and
share only a small private operations interface with the common PHY
driver. A board described by this series references exactly one enabled
control device. The PHY driver creates a managed device link to that
provider, powers the link block before accessing it, and passes the PHY
address and MAC-selected interface mode to the provider.

This split is independent of CONFIG_OF_DYNAMIC. The initial series uses
only fixed descriptions and has no Dynamic MDIO dependency. A separate
development branch can later use bit 0 of the same configuration field
for runtime selection without changing the binding or provider interface
or duplicating the common PHY code.

The series adds:

  - a minimal AC200 MFD core and AC200 EPHY control child;
  - the AC300 non-PHY MDIO control driver; and
  - the shared AC200/AC300 PHY driver with basic link operation, package
    calibration, power sequencing and vendor analog initialization.

The reduced v2 series was built and boot-tested on an H616 system with
an AC300 package. The raw SID bytes at offset 0x2c were 0x06 0x05, making
the packed two-bit configuration field 0b01: AC300 with normal calibration
tuning. The driver validated that value against the fixed AC300 provider,
bound at MDIO address 0, negotiated a 100 Mbps full-duplex link and passed
network traffic.

The H616 EMAC1 support has been split into an independent series. Board
Device Trees and defconfig updates will follow after the driver and
binding interfaces settle. That later H616 integration will use the
Allwinner H616 PWM controller as the companion input clock; this code
series neither applies on nor builds against the PWM series.

The AC200 portions build on earlier work by Jernej Skrabec and Andre
Przywara:

  https://github.com/jernejsk/linux-1/commits/ac200-v4

Public AC200 and AC300 documentation is linked from:

  https://linux-sunxi.org/AC200

The AC200 parent schema references the EPHY-control schema in patch 1.
The AC200 control driver needs the MFD core, so those patches need to be
kept together or placed on an immutable branch. The AC300 control driver
and common PHY driver have no link-time dependency on the AC200 backend.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - split H616 EMAC1, board Device Trees and defconfig into independent
    series
  - remove Dynamic MDIO changes and runtime Device Tree provider
    selection; require exactly one enabled provider
  - remove the PHY-autonomous EEE dependency and keep Intelligent EEE
    disabled
  - defer LEDs, interrupts, Wake-on-LAN, statistics and EDPD to separate
    feature patches
  - make the MAC-provided phydev->interface the sole interface-mode
    source
  - retain separate AC200 and AC300 control drivers behind a minimal
    private operations structure
  - retain the two-bit package-configuration cell, validate its
    variant bit against the fixed provider and use its AC300 tuning bit
  - reduce the initial AC200 MFD core to the common regmap, supplies,
    clock, reset and EPHY child
  - leave package LED pads disabled in the basic control drivers
  - Link to v1:
    https://patch.msgid.link/20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com

To: Andrew Lunn <andrew+netdev@lunn.ch>
To: "David S. Miller" <davem@davemloft.net>
To: Eric Dumazet <edumazet@google.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: James Hilliard <james.hilliard1@gmail.com>
To: Lee Jones <lee@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
To: Russell King <linux@armlinux.org.uk>
To: Heiko Stuebner <heiko@sntech.de>
Cc: netdev@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: mfd@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org

---
James Hilliard (8):
      dt-bindings: net: x-powers: add AC200 EPHY control
      dt-bindings: mfd: x-powers: add AC200
      mfd: add X-Powers AC200 support
      net: phy: add X-Powers AC200 EPHY control driver
      dt-bindings: net: x-powers: add AC300 EPHY control
      net: phy: add X-Powers AC300 EPHY control driver
      dt-bindings: net: x-powers: add AC200/AC300 EPHY
      net: phy: add X-Powers AC200/AC300 EPHY driver

 .../devicetree/bindings/mfd/x-powers,ac200.yaml    |  77 +++
 .../bindings/net/x-powers,ac200-ephy-ctl.yaml      |  39 ++
 .../bindings/net/x-powers,ac300-ephy-ctl.yaml      |  70 +++
 .../bindings/net/x-powers,acx00-ephy.yaml          | 117 +++++
 drivers/mfd/Kconfig                                |  12 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/ac200.c                                | 207 ++++++++
 drivers/net/phy/Kconfig                            |  27 +
 drivers/net/phy/Makefile                           |   3 +
 drivers/net/phy/xpowers-ac200-ctl.c                | 294 +++++++++++
 drivers/net/phy/xpowers-ac300-ctl.c                | 423 ++++++++++++++++
 drivers/net/phy/xpowers-acx00.c                    | 544 +++++++++++++++++++++
 drivers/net/phy/xpowers-acx00.h                    |  17 +
 13 files changed, 1831 insertions(+)
---
base-commit: b16bab325801c7be004222cad0ae296aa5982e79
change-id: 20260802-submit-acx00-of-dynamic-v1-94a0dc15f282

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

