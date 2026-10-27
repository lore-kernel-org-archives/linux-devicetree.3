Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793072964;
	b=XVCgdh41LtQEV56Pil9wtDAdJFW3xd4laZaTLncOmzV2JA2DrQXtxmI7vXrrnryzdi2S
	 HBAHFl6CZBW2TnX9FQBDjEH2/ts77lLhIdn2j8bxkrH2fGhFU4kOI2hrut6+1FZj8bVH+
	 wR/IjI+J/+0mgmtdAe6uH4wjM8jmIRnm4US5U6jAflpTWduN2O/LbU1FWue6/b0S9Dmpy
	 HZZ5u8nQUylYeNoFCKNC8+TCRH+FFTS9AEg3Z05PUlIin2XNmovmiNILAYvajNuzngOC0
	 G+p2PNqFJJsedWrM9rZfWbTMMOsoCrDqjOwsDSxicS3hZbVO73i20v/Re1qYI6GaOcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793072964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QYcOxOwG5nt64SzUuyibNRblxh48usRslX5qPY98KUI=;
	b=ucELTN5j5KOJut9lDRl57Qt/7Rm8MA/X/P3oR526Ey/A1iGvx7OXrh8LQaNEq95YWW2w
	 q7GPfI0M23RlSV7uhS0k582T8FILO+ne6LeTHhM7ePa8M5a0/+XmH4ob2q7YSekaEArPU
	 1GKrAEi/WAXSmpVh2fOxWhVak3eXvqdN4TzRjFHC9lEBO7EiybRt0YsRq1yX8AMVKDiSD
	 ghmOPCR9Fz74m/if7gKRLupWGmlYd5r2fVVV8w1UIOA0yBNid1e8coIKxPuEcRjKbXiVP
	 mnz98l085JfGWuNE9Cnh4moxeBCiU/pebOqtDYc95P4xYAYFkoK2VyBL3F4f4kqASQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gamDn5qG;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F57C606A31A
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 03:49:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F57C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gamDn5qG
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-185fd3a4ca3so3165881c88.0
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 20:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793072963; x=1793677763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QYcOxOwG5nt64SzUuyibNRblxh48usRslX5qPY98KUI=;
        b=gamDn5qG7zjt0/0vVNhqtjnZ55eJX6z5bQbasu+FsrYvhtBjn7O1sZMZ2m5UJJ1h/V
         P632O7Iv6EzQgIWyXQSW/7dwWGcQL54thcaOWV3r1gGiqmmQSnRs+Pz/pnr9fDwFkS83
         qJSljVXArbMCzxoMU/dcnETkrha9eNjEtvxNV7t1chH8D9IOeHtLM10ICapdKZGBqvz/
         irkSWTE/mC+gwnt1dKXb7Vz1K3RMMH8FaVJsA6/7weNB9Zph/x8MEwb+B671LT4OC5fG
         hFPoEDXkyZ5bbOTYhiXsZ27+b99iV/xmUcSTcn+9z40sBc6NkummE2zQOT9OZaeO3bdy
         7Zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793072963; x=1793677763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYcOxOwG5nt64SzUuyibNRblxh48usRslX5qPY98KUI=;
        b=AjiTz5MZz3IVffUduuY/18rY/EatW7ZOnj6AJrSQNV5RPp3FquDMQluM1Rlw+nmlv/
         i0J969Q3g2i/X9GDQuhb4smVhklb+HFbzC1fgdBWvngKMXqChdjaKls7x7ZyUR8Kmz/6
         PcEB2pvFwBGwhiu/xJR9c3Y3MjWb3sNKbGvBCOJqdB+ai6vpjjRz737SrYRtgtSU+1cW
         I0CNiP/3rYc4R0ykKzDItoo1jxa3qt+mejjtXNiZuP0Rzy4Pw/iTDckJ+Oiny4ZSS7t1
         W6FZVKc44mKgOHnaRbNfYQcudcbyTBNd9x4zaSEeUxqd8pXNhBBOL5RNotkW2up4nO9X
         AdbQ==
X-Forwarded-Encrypted: i=1; AKwUvBy26xkhpsJ1AQjfe5Vjlf/p/KmME+yCASsVOjrtcVZkisgNQvbkfmR05znowfk2C2OnmCXJ3BOwLdNF@vger.kernel.org
X-Gm-Message-State: AFq9FYIbRiO9ghZmXIE2Hw0jzueizJ+QD7Xw5z8IwwUaIUX3ygv7hA2H
	fKHO8QO4AFf2bcoEU815s+Z8+lxZgMp0hF66M0dDNNAP6CWjiClHiz48
X-Gm-Gg: AYBFou1tIUABITs44WtxBRBljXtuEEiJA83PzaWecIvyF9X2CuFnQT8KA8evhcYBZ+Y
	IHYOUavCxF1W6u1XGuRxcENjtiR2wWrIq94ujELokFQc0F9s0Gtzy7WRjfFxRYcrR23H4UTKGim
	CoJFslSwSH8w1UhX1dFCHvxPplps6yDxzPzVKkIgOITNz/o7fKEeDiMfKEmeuEKctanIVgJ2aJQ
	XccI8J/yKWvpotvj6YqMLdZ4J95InVtiLV5tRmbT24M+gHE9Ex3/I5e/ECk1tnz06QN4iFiqlTX
	DU0tp223WpgA6Kz7uZzYtVLiOKrtCzSIvdYAWVSkoCD9kuYLHlWOmDVxREWpTShqhnYzHbgrIuE
	Bf3+JymIpYYtDRYA0tWpc8eNu96PN0SnX985tsT4inH7S8TG1fpfs82wCT2nwSwPJOtCoNgpw4D
	S9eVmkW+e0V3JCLkk+xbvqtXGKOyte4hSjHyd2j8x5QuouBommTjmp7DwmjxTcvw/DDPiOrSo2R
	wKdudQ+umLn/JkNPtRmzFMZTzlkaa0SMhaXgzJGzXBBkW6Ka5ql2Hcos0rjtQ1QedGWDDA7ruD1
	X44sd7lB1VfuZtp3EIEwBXdxnyY+BU97YmzAV0CtMmkH
X-Received: by 2002:a05:7022:f511:b0:1a0:5c85:d1b3 with SMTP id a92af1059eb24-1a05c85e6damr7103884c88.43.1793072962440;
        Mon, 26 Oct 2026 20:49:22 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.12])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm26430012c88.19.2026.10.26.20.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 20:49:22 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	andrew@lunn.ch,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v9 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Tue, 27 Oct 2026 09:19:09 +0530
Message-ID: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Add support for the ASRock Rack B650D4U BMC, based on the ASPEED
AST2600. The series adds the board compatible and describes memory,
SPI NOR partitions, UART5, GPIO line names, GFX memory, the I2C7
EEPROM, and MAC0 with its RTL8211F PHY.

Enable both ADC engines with 2.5 V internal references and expose
all sixteen channels through an IIO-to-hwmon bridge. The channel
order is ADC0 channels 0-7 followed by ADC1 channels 0-7.

Changes since v8:
- Enable ADC0 and ADC1 with their reference settings and pin groups.
- Add the sixteen-channel IIO-to-hwmon bridge.

The other board descriptions from v8 are retained. Andrew Lunn's
Reviewed-by tag remains scoped to the MAC0 and MDIO nodes only.
Fan/PWM support and BMC-ready GPIO policy are outside this series.

Base: aspeed/arm/dt in the BMC maintainer tree
https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
Base commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030

Validation:
- Compiled the board DTB with aspeed_g5_defconfig using
  arm-linux-gnueabi-gcc.
- Ran dt_binding_check for arm/aspeed/aspeed.yaml using dtschema
  2026.9, with no diagnostics reported.
- Ran CHECK_DTBS=y for the board DTB. No board-specific errors were
  reported. Two unmatched-schema diagnostics remain for inherited
  aspeed,ast2600-lhc and aspeed,ast2600-i3c-global nodes.

Hardware testing used the same ADC node configuration in a locally
patched OpenBMC image based on Linux 6.18.24. Both engines and the
IIO bridge were available; twelve configured voltage rails returned
readings, including standby rails with the host off. Voltage readings
also recovered after a BMC restart with the host reported on.

The complete DTS on this upstream base has not been boot-tested.
The tested OpenBMC image uses a different flash layout and separate
local power-control and sensor-discovery changes. Consequently, that
image is not a directly reproducible build of this upstream series.
Voltage scaling and sensor publication are userspace configuration
and are not included in these kernel patches.

The patches can be applied with git am on the base above. Anyone
boot-testing them should first adapt their image and bootloader to
the described flash layout; the DTB alone is not a flashable image.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 173 ++++++++++++++++++
 3 files changed, 175 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts


base-commit: 8db593481c8669eddb8b4e21ea44f3fa11d9f030
-- 
2.47.3

