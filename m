Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC3044D00A
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 16:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529983; cv=none; b=WD1ns1f4OBWixmF2ulVKgVHeysxso83fFaopd8Peuo9nBsqqQa0uTE/OPKHuFgIPukOZ0GLjuO/R16Zc2H5wjTRbNWm8rqwQs5ujP0xtF980keXpTAJVhGdQiP9XXfeYgw8+um3pmusY2fuN9ji9hpQnNHDm5rK+3eXFBW/NlOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529983; c=relaxed/simple;
	bh=GehVWmNtsGJvh9eVVcAzNgbKC6kD+Tar+PIqAhQbGxo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YIXXLnyRRMwXmJ07JVhKXoC9iM2jqMDf8xH+5nLuK5N1l8XJERn5GF50IL0bxpxqF0NIhionIAUInq3FAmcqGFsz86Z0rKWWlxn6yQ0mCPMo2e+a0V5s19Pi7BQbo5HszKVL1W7y3uf7LKk/wovT5KimoX6Az8Pry8WpbSYCBsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kaDLjZ2Y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kaDLjZ2Y"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c5220cb7so7444165e9.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783529979; x=1784134779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zq3p9Jd1uMf+zvKdqsUxTIR3QC8XpydmsK8x33evoe0=;
        b=kaDLjZ2YlgiwnXatzQ6tsppfEwNY5yvHIRJxaKcpH2ACII1/ZJCEF3x85CQw+omKa5
         m4VZexJ5GrFPW1drmu0tKD3dyYA1Q+frB1iCkJ6QYNAGAwmu+lTINSzybwQ8upxkABgZ
         WiHb9bthnkswd2N+c0SpivSVjJWW9c0z+H1ZsKiYuKE5JfgTjGCQGbcqG2psexVMQ+lr
         AOuHRYRZi0cfmutlaGSOuJvpQei0KrkatVJw0EoBmJbBhHPXJEOodMZmPLjrEmAJhbOZ
         hEChO7gl3BUpXFZs98RRx/Gy+6EjOruWKGWO7im/2FQCfGNxSHfJ6fdBP+ogysBh2a83
         JAYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783529979; x=1784134779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zq3p9Jd1uMf+zvKdqsUxTIR3QC8XpydmsK8x33evoe0=;
        b=B9xE3HIEen2l0HDtoZRLzVspVhFwxPyhsR7DMr5aXV8c34c3BhbCfFAqpGPT/MWqua
         v27bppzWgDcMEsFcEvODlkIMZZbb0ch0KqhCPX3xcwuhPIJlpTrIdMKnbrQLuzhDcq2f
         vx4WAXcfw/nlaWPWsF1Aa0/pHOicSKnXLvqWMqZeTo9d70oG4bKu/yPeKm6qTenwf+bB
         YjIYH+EYNA484Xm+xjCRUTJdagPx9UYwoMZCeNCd+x1TI5t+AV6wcZcSKWWQlh5C+Ik/
         4wCDb4gc96+Vfpc05XjrzVYGzBqGBcOfD4xiwrwZ8ol3ojM5c0Gonj33IbBstB+2b70L
         1zqA==
X-Forwarded-Encrypted: i=1; AHgh+RpIACAQ1mhaSXqGQi4XHuBOC96bPZxizT3jzvQp+fHx6N6e0O9rD3gfROFNsWF2TBBKhhpoVrKV+Dhg@vger.kernel.org
X-Gm-Message-State: AOJu0YwEVnhge53IOABvXNjFRlvToLl0VFESjhLbW6dJVtejB5UIgKr3
	I8vlA5QawhbjrsSRrXDCmmR6vbIjVL1TQT/6/fpVN+S9rqoFfVRmUymM
X-Gm-Gg: AfdE7ckDNFHKZcYh+wzgr/GrmiL1isME3ZYki7gcOmRRLvxJFMGSEJBylxugUuw2Yof
	CFx08EvHcC1CBcYdW12OnYkwPNcIzLo2L+jK6ObOTAaExinf+Ohm+NfJzuuksoPQ4lLSNIVqXFi
	BW5OjD5O4wDiKGSRKtpAQ3CWjta7eAQRhx43TL2DKmQYrFB4axjaKfuK+HhNj1R27y9viMzehOf
	T0ed6UCyAsev2sD2dcaClbSLGLA+iofmmyp+TohFxGuSYqYW16Gu84dcQGuhfwPTAwZzf7OJU+k
	OvMrGSwlknC4szHqFbCezO8HeitXoc+t7J+Y2mvhu17mljAnlVV81ixVCtN+bQhKjU67OXOpqLP
	BQ1renV6Zd53PMzfZnuu2jLg6ItXfw26mCwdGCAPFY9Uh1kyRNXOvYwDFZkcuCELW7CIjzMUgKO
	cK/kixSNfHGGUurPKf/++9a2c=
X-Received: by 2002:a05:600c:b90:b0:493:e97c:10e0 with SMTP id 5b1f17b1804b1-493e97c10f4mr6839135e9.35.1783529978222;
        Wed, 08 Jul 2026 09:59:38 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0faed92sm141201035e9.9.2026.07.08.09.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:59:37 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v8 0/4] arm64: dts: nuvoton: add NPCM845 SoC and EVB support
Date: Wed,  8 Jul 2026 19:59:25 +0300
Message-Id: <20260708165929.2233934-1-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This series fixes the remaining timer binding issue and adds device tree=0D
support for peripherals on the Nuvoton NPCM845 SoC and its Evaluation=0D
Board (EVB).=0D
=0D
The first patch drops the undocumented timer0 clock-names property.=0D
The second patch reorders timer0 and PECI so the APB child nodes stay in=0D
ascending unit-address order.=0D
The third patch introduces peripheral nodes for Ethernet, MMC, SPI, USB,=0D
RNG, ADC, PWM-FAN, I2C, and OP-TEE firmware in the NPCM845 SoC device=0D
tree.=0D
The fourth patch enables these peripherals for the NPCM845-EVB, adding=0D
MDIO nodes, reserved memory, aliases, and board-specific configurations=0D
such as PHY modes and SPI flash partitions.=0D
=0D
The NPCM8XX device tree was tested on NPCM845 evaluation board.=0D
=0D
Addressed comments from:=0D
        - sashiko-bot=0D
=0D
Changes since version 7:=0D
        - modify timer place.=0D
        - add PSPI to commit message.=0D
=0D
Changes since version 6:=0D
        - remove IPMI i2C device.=0D
        - Add FIX enable property.=0D
        - Keep patches 1-3 unchanged.=0D
=0D
Changes since version 5:=0D
        - Add no-map to the tip_reserved firmware memory region.=0D
        - Drop the unsupported snps,eee-force-disable property from gmac1.=
=0D
        - Rework the FIU0 boot flash layout into nested fixed-partitions=0D
          under the bmc container.=0D
        - Keep patches 1-3 unchanged.=0D
=0D
Changes since version 4:=0D
        - Split the timer0 clock-names cleanup into a separate first patch.=
=0D
        - Remove nuvoton,sysgcr from udc8 and udc9.=0D
        - Rename apb: bus@f0000000 back to apb.=0D
        - Rename spix-mode to nuvoton,spix-mode.=0D
        - Keep cooling-levels as 32-bit cells while encoding fan-tach-ch=0D
          as /bits/ 8.=0D
=0D
Changes since version 3:=0D
        - reomve tmp100.=0D
=0D
Changes since version 2:=0D
        - Fix dts warning=0D
        - Arrange node order by ascending unit address.=0D
=0D
Changes since version 1:=0D
        - Fix commit message=0D
        - Fix dtbs_check warnings.=0D

Tomer Maimon (4):
  arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
  arm64: dts: nuvoton: npcm845: Reorder timer0 and PECI nodes
  arm64: dts: nuvoton: npcm845: Add peripheral nodes
  arm64: dts: nuvoton: npcm845-evb: Add peripheral nodes

 .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 721 +++++++++++++++++-
 .../boot/dts/nuvoton/nuvoton-npcm845-evb.dts  | 404 ++++++++++
 .../boot/dts/nuvoton/nuvoton-npcm845.dtsi     |   7 +
 3 files changed, 1115 insertions(+), 17 deletions(-)

--=20
2.34.1

