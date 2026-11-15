Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762714;
	b=0b2cXh+lAwn6+FG4AXx3YwqmDvMrdxcEnteeP9ytPfKQKhko48YUDKtcYpN8CfuvrtGz
	 2Elcz92oyMfJnOeYeiOb17Fa94j/U+yv4gTvu0R1d1hA6ITAe26woC9TbY8mrnL67Kzi/
	 vB1bBdNzuj61Y2iwbz9IxFSNPr4WApe2ffo08J98Mt7+et8aLhsOxw+nrwhlHWGgT/gQK
	 w+Uv49XXg9wE4iQFZqsYII3h+MIMkH66+B/QOQF/iJkOK5JnmDQj1LJDV0svjnhKbY89J
	 xfmiD9PMSsjvZZ/Xg57FMUbLmZfWv/C2I0rcE8djpI515/LU2MxWoBKI9uYhP8Ya+8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762714;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=boTZDXSN4oprrtS73rntc9EJscLfI/TB1oiEFbCPLbg=;
	b=XgYb0+oGOffiMGG5PrY53si6C1kqejaTIHZnAC8XrlvCLB/XQb9WAGavdQAL1bgkID+g
	 TwzoRoWklmMjnMSH9TEzC3jUVvOrflxdsx4IIpRWPwHBGOTIA0iPW/I+fF4fL+8oDnk0Z
	 lPpez6hhQa4lAGsHzTAtOVz9tR0yF1JQShMlR0CLc3ecu0lYnK+0ZdadyWEjfEiiN32+K
	 CmOijrXn/YcKSFXhuzOGLWNf2ZqoPiB77GxEDoE5kJFYG6DALxqLwEtGfq3CIlFlav0SL
	 6KbWAoE/7BWGiORIoo/XCXIaiDAbBMQbxFrrVVZpoS+nrKVXboqjDUGVJ0itqzT6LeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b="vZd9N/+c";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629BB606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 17:11:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 629BB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=vZd9N/+c
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a210470b49so21083115e9.2
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 09:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762712; x=1795367512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=boTZDXSN4oprrtS73rntc9EJscLfI/TB1oiEFbCPLbg=;
        b=vZd9N/+csfA1Uf1Z+y+SwcV3wyBK3NFN2nZsSmUYc5ug136mMvO813uueXpcqdB4yC
         UC/vqIOjxJ0kBsRIAZqX+oPXfNjx6fBGpz5L88bNIVupAcmL7fpuXKDAG21bQ+cfej/M
         rIFVp9XwVLi5ETiqmjZBbhBOll/xz/rOyliUkwTUTEjRNSl2WICufkBQjoUyKrEN5R6K
         B2jVYvX+M8is0Nj1R+yAR/5vchacxgVUAtYqdFjqLAFRyzbk2uYM/O7J2Gw/Mijmve0o
         mz0zIUo9igN0zPnrQiihwCe9abqqiY2i9nOMj8LmKF6T6I97ijAmrvIP9ZHW0Cs5bVT5
         bIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762712; x=1795367512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boTZDXSN4oprrtS73rntc9EJscLfI/TB1oiEFbCPLbg=;
        b=PILCMYL9PmbCqj+a2L3TCkcsM1jmJZIQCh8FsgGvAEvdONC6/BWa9XTFwdoXUsf0jf
         D3wTmhFhL0610RHJvo2zIteut67XHQR+f4+Dmy3mVkCc3B7vmlGkw1GxfuypUuzfzPag
         46y58M0PK/Od1PtGBvpSxhtCcW/1jKn1lfo08cGVEgd2ZnB8C43CIiSNRWKXpN+LqE8i
         HJKETOx/CvVA1yzW1UDJhOmTtdGcNk9DTZgGN6WbEW/QGG15J0wRj8RLSr7b746BuQtU
         NvDoYSAbTS1fpKNg0hjUdc7OFvv0hXleAHJy9EWwnzWVWcxrMFQ1w1ZpNPgjtXgVfHM0
         4eDA==
X-Forwarded-Encrypted: i=1; AL+hErHbhAyuU18pjKKUNevqMFiLl6EVRdTG8boHLB6C+Zs4MRaJinTsOVEVEedmBvKExkYX/355DzyMr+Xi@vger.kernel.org
X-Gm-Message-State: APuU4Z9ciJ8T999EzAwgBZV3fk4m2mrWQgk0lh8ukF2ye0Hw+D1Fv8Gf
	GGU511uRtZpJUo6g2A8WQDRaWJccBpeBwoyDH1KCm50Ado9IH8Q8zry2Cvvkaxh9bOg=
X-Gm-Gg: AYBFou1R0385g4/q1v7fndtsJy9gE7033lOqazxsOitI8MKDxeItkM29nl+8PRmA5il
	8nH1UTJl5juZcAt3eFyruMPdnQiWg2QiAxaJ00JprhOliwOMfCWRkv2178gGKCeb8Oj5CcDqXKQ
	7NHdYK6ZpBXHvBDPz577+/3b+gxhigNpUVQSTJw5dCVlnrA19s3Wq18FhNS7uDgRCKhHHC9/L3Q
	ozPfaZydbbyquPNwVavL/79W2L3g18XeAXYBafLACTrvJyeUhCSU835AjQc5JZIPvTKs65imsa/
	4TkvFjZUG6tHer2frvq56rpcnHIEDSJjwYfGbN3Kra0gkW+poIj4Ultd7Npibr/eg0FuAxn9DzA
	F6Yjv9Naxki5+Z36x3cDo2/kFNdU2UD/z7ln9b4OKvXinyEYIKvJIRPZnEkHWOQmjFuWMwjQj01
	oaizxB93VfsVWu2YqLfSv4y4wLJFyWbJaoJs/wmCitgfr1odtdh2p2SvdQpfbtfaIImlWzDhKeT
	FUjMV5V8tROmJscZ/lGRcrRQV5QXUDLGu+93wYXFY+ACBPt7YzxMvTgEjpRiovbv/TDa31md4W9
	Px3uH3rtnF2LKQVZrn8aHzHRW9RIaOBpukdJfIphLqlWN19cB8B+aLvA4lMAVb0/bXNTw4eoKSg
	8JIfdego=
X-Received: by 2002:a05:600c:1c17:b0:4ba:4395:56c9 with SMTP id 5b1f17b1804b1-4bb55abc204mr208568095e9.26.1794762711757;
        Sun, 15 Nov 2026 09:11:51 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac0e1esm205418705e9.3.2026.11.15.09.11.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:11:51 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Lee Jones <lee@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Olivier Louvignes <olivier@mgcrea.io>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v2 0/7] Add support for the X-Powers AXP2101 PMIC
Date: Sun, 15 Nov 2026 18:11:43 +0100
Message-ID: <20261115171150.64431-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

This adds the AXP2101 to the axp20x drivers: the MFD core with its
registers and interrupts, the regulators, the USB power supply and the
battery charger. The PMIC is on the HiBy R1, a music player built on an
Ingenic X1600. It follows how the AXP717 was added: the existing
drivers are extended, and the two power supplies get their own
compatibles because their registers differ.

Not handled yet: the PMIC's own fuel gauge (the R1 uses a CW2015, and the
AXP2101's reads 0% without a battery model), the power key, the ADC
channels, the TS pin, and writing the input current limit.

Sources: there is no datasheet behind this. The register map comes from
the GPL-2.0 AXP2101 driver of the hiby-custom-kernel project
(github.com/Jepl4r/hiby-custom-kernel), an open replacement for HiBy's
closed module, and was checked against the chip on a running R1.

Tested on the R1, on v7.3 with out-of-tree board patches:
- The rails the stock firmware turns on (DCDC1-4 at 3.3, 1.1, 1.8 and
  1.2 V, ALDO2 3.3 V, ALDO3 1.1 V, ALDO4 3.3 V, BLDO1 and BLDO2 2.8 V)
  read back at their stock voltages, and the regulator registers
  0x80-0x9a stay byte for byte as the stock firmware left them. No
  voltage was changed from Linux. BLDO1 and BLDO2 (2.8 V, the LCD
  supplies) are switched on and off from Linux by the panel driver, which
  claims them: bits 4 and 5 of register 0x90 clear and set again with
  the screen blanking and unblanking, about 20 cycles over 8 boots, with
  the selectors (0x96 and 0x97) staying at 0x17. That does not change a
  voltage, since the registers already held 2.8 V. DCDC5, ALDO1, DLDO1-2
  and CPUSLDO are off on the R1 and only come from the register map.
- "poweroff -f" turns the R1 off, through COMM_CFG.
- Unplugging and replugging USB gives one VBUS_REMOVAL and one
  VBUS_PLUGIN interrupt, and the USB supply goes online 1, 0, 1.
- The charger registers read back as the stock firmware's values after
  boot, and the battery status is Full on USB, Discharging unplugged and
  Charging after a replug.

The series is on for-mfd-next (c92739a23a80, after v7.4-rc1), builds
with W=1, passes checkpatch --strict, and the three bindings pass
dt_binding_check.

Open questions: whether extending the axp20x drivers is what you want
here (the alternative is a driver of its own), and whether programming
the charger from the monitored battery at probe, read-only afterwards,
is acceptable for the battery supply.

Changes since v1:
- mfd binding: axp2101 placed by the order each allOf list already
  follows (Krzysztof).
- usb-power binding: the AXP2101's input-current-limit-microamp
  constrained to the six values it has (Krzysztof, and the Sashiko
  review).
- mfd: axp2101_cells is const (Sashiko review).
- Acked-by from Mark Brown on the regulator patch and from Krzysztof on
  the battery binding.
- Rebased on for-mfd-next after v7.4-rc1; no change to the code.

v1: https://lore.kernel.org/all/20261023100401.67592-1-olivier@mgcrea.io/


Olivier Louvignes (7):
  dt-bindings: mfd: x-powers,axp152: Add the AXP2101
  mfd: axp20x: Add support for the AXP2101
  regulator: axp20x: Add support for the AXP2101
  dt-bindings: power: supply: axp20x-usb-power: Add the AXP2101
  power: supply: axp20x_usb_power: Add support for the AXP2101
  dt-bindings: power: supply: axp20x-battery: Add the AXP2101
  power: supply: axp20x_battery: Add support for the AXP2101

 .../bindings/mfd/x-powers,axp152.yaml         |   3 +
 .../x-powers,axp20x-battery-power-supply.yaml |   1 +
 .../x-powers,axp20x-usb-power-supply.yaml     |  12 +
 drivers/mfd/axp20x-i2c.c                      |   2 +
 drivers/mfd/axp20x.c                          | 107 ++++++++-
 drivers/power/supply/axp20x_battery.c         | 221 ++++++++++++++++++
 drivers/power/supply/axp20x_usb_power.c       |  86 +++++++
 drivers/regulator/axp20x-regulator.c          |  88 +++++++
 include/linux/mfd/axp20x.h                    | 114 +++++++++
 9 files changed, 632 insertions(+), 2 deletions(-)


base-commit: c92739a23a80f5f0a7c6f3c10aa792102d252ac4
-- 
2.54.0

