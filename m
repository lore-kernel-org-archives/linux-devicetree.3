Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795455743;
	b=mtP7xfXNUUAm2vfEdmSfQbesNF5fPCOydgej3uRYUDoj8TgvNIVGCAQdoDHYTQmDPvIR
	 vF/32eZ2XqTaS/ZnP+zaaEl68HkU3virVxt3zB59oP3IJpNX4i/hwP1eHiwBE2G3u2EK7
	 iPU5mM79LMuGKPtqJTkMvKJDLVUOesOfqMfnVeJNDNxY7FStGO6GP/brnbe4G+YmOHFQ9
	 CFJ1tednwA06ipF1rmuX+YReQ1TSv6FQdILuzxY/Q5ew4tzJjJQGrSgE/dU+t2sXAFuCT
	 LR7fzmJwSONw6cjD9B9MNt6ssRjeC/THSvQKwYBOPYxT7XA/NIoL64p2RGWZiJ5kd/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795455743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SIbteC45At9e/phHEDZccWeZUiRHWTYBk94KBVq+cmo=;
	b=xXRqAehq0EXCuJWluJ94BbnHBd1h8mdBZXOX8dvgVI4gwWkj2Fj1EKTL6zvPF+V1X25C
	 ckYyBBEZgWTKogLZL+wMQGVTqI+Zn7O6j7Yma3BaoST1ao7gVJca8JlhYDTg8f4UyCVTw
	 gB5b7vojSB8tFJ+0fDnKIrnh8vEVwxPY9KI68YELZBZNnQs6QKWsJvzy1sB3q2xXEe6A4
	 PJ+1rkN0yh2Oj1Kmu4WXs05S13EKue/VaoS8w10cFGoEPHjZR2D1OuB+OwQFKC8tP//8Y
	 OP+mDw6Vi/ybIU4GLT0NK32f1wCMoGeo+3sHViweM+GGXV5iE28y2AZi0M3dX/qczsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tKpIFAt9;
	arc=none smtp.remote-ip=209.85.167.177
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CCC606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 17:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2CCC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tKpIFAt9
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-57728d87699so1423795b6e.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455742; x=1796060542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIbteC45At9e/phHEDZccWeZUiRHWTYBk94KBVq+cmo=;
        b=tKpIFAt9r/n/Lm3zRG2Fua+r9rf03oSaVg2DYFl8RoxfbeETi+nlZ08m2+z+8x0NPR
         PXPfezQizR0aMqw2hk812sf81/ImWF5pZ+cN4LTOyIM0eueCXq5lRREwzXChcpLP/m2M
         bVdLbivyukZRb1n3z6yckW3Lm3cye/vASAHPJBzBiMjfi2slDyrZQ1o2kTpMvA2GMgik
         b3kbLXTDngePv3Rb2C0h5Oydb+v9iR/lj3ntWKX6hxY35967N0w3pYkf9jXP3qwj0FlS
         7enY/8iq/EhI+2BoVi0z04PvbSw6CSnPsWXVycSPJMohoVqRAmGB/WEutcwgVStBpe4r
         S49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455742; x=1796060542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIbteC45At9e/phHEDZccWeZUiRHWTYBk94KBVq+cmo=;
        b=Qv204+A44X/HJB0xPiDAE573YXDPeblG/1rfueZRgwf5BIDbgNmdAH4dGJtaJquNqw
         U+zT4uSyOHowoYhScPBPE1vidpa8EVVvfy8X7Qo23Zag1otSybekorQRbKG7j8eDkE6D
         TSsg7q67SDoPt8JZFLvFQNjytuYCdwT/73MEhjjB+ffRwqDqCUBjp6j4f7N5DPCJ6rYC
         SeMK9CQ3qkgfYwwesgGM97rddcYCrIvEhcpQ7cgjGF2IW9qws3mko4yQuKGDG7V8jSQA
         kPBOYnz3mXL1L56RWB65W3t5auOinWywoOgUm4gqan/stR4LL11EbOTlh5lSM20Tkvet
         hX8g==
X-Forwarded-Encrypted: i=1; AL+hErHsc6kYKVpZuiFC2JkuccnIxI4Fyz9SgqlKaZRetY4ehi/AS34xpZYzeRS8ZNSSL1mdVEp8vcce+heG@vger.kernel.org
X-Gm-Message-State: APuU4Z/VEGp32IdZX5BkF32NmyhxeW20OJYiL46qhBz2s5J2SQpGmDHy
	+CDbWmBYtCH56xveEH5nkmKA74QdwakVSn2lYdXO7JgvEx0Qs1yXZeVv
X-Gm-Gg: AZFdTZeVUVP06gkeKzh56o8bNyFdPhA63vGYMVvU6t0xuJRc5LGQbSnE2CD0riYY8ve
	V0VHMytripn0ZEz96sr3fKit+6EmoC21sRG2oIqAIDTmSRojP/gunLVzGw6uxN8yUKEpLmeG57k
	kjVyjZVTQP0NGCK9oCJMBtca/XtHXYyReeWWEC4qfjzOOrYfap8gulCs5qyRmHWvBVK1k0pFJ99
	lu8ZSMfys+9aKQBU7FYhtEFLXhz2xsDKm10PjcX6RPvNzqcNgmddAUL81x5b8BBREphcRi2zfzc
	tgh+ivrV3bOZQCBGsUHrEa23Vnxw/3/cOgnQEnOnv9qUZmAMuhTZnWW+ev4d1OoOKpWjF1ha5zh
	IwvxIqsNS6W+h6Ss1LgRakjQnMu+e5MEhdCT/MUhohJ46Gkmj4WnX24S2k8EIOPuUcjWPLzW9V0
	ijAL6dAgAGIpbBK4KuiGB9mjLT3uP2kE7p3gXNq/uMkpww9h3Tnhr1FlA6aNv+XweN8q0kWlrSz
	+GjWCdFZYZrIVZq7WQQGBPlEabyLFDgRdV6hhMxabuoCROY87NgmYX4rkkotdz5W2F++vh6A0IU
	KeueVvf+7MJla2b1EqTD3AIWbD6ckJZZyPrJ1Eg5ATwnMy7aiRagOMKJk9QlZpSiQk6La6Dnymc
	uWn7uzQ==
X-Received: by 2002:a05:6808:1908:b0:571:b166:3d76 with SMTP id 5614622812f47-57a0ab2460amr14209938b6e.29.1795455741608;
        Mon, 23 Nov 2026 09:42:21 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5b07d57csm11240123fac.1.2026.11.23.09.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:20 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: [PATCH v5 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Mon, 23 Nov 2026 12:42:18 -0500
Message-ID: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add initial Allwinner A733 and Radxa Cubie A7S device trees for the
console, PMIC, microSD, LEDs and EEPROM. The Cubie A7A compatible is
for Andre Przywara's forthcoming DTS:
https://lore.kernel.org/r/20261122004008.0ee8e16d@ryzen.lan

Base: sunxi/for-next (2ba07dfcd45bb6ec414e68213620490548fd5aec).
Previous version:
https://lore.kernel.org/r/cover.1795034153.git.enzo.adriano.code@gmail.com

Changes in v5:
- 1/3: Add the Cubie A7A compatible.
- 2/3: Keep one DynamIQ cluster, rename osc to hosc and add I2C0 pins.
- 3/3: Add LEDs and EEPROM, simplify MMC0, describe the 3.3 V PF path,
  and revise the PMIC rail descriptions, bounds and always-on flags.

The hosc label also affects Vinicius's A7Z and Alastair's U-Boot import:
https://lore.kernel.org/r/20261111134919.90264-3-vinicius.eduardo.pedrosa@gmail.com
https://lore.kernel.org/r/20261113023236.569054-26-alastair@d-silva.org

Runtime dependencies in application order:
[1] AXP318W PMIC v8
https://lore.kernel.org/r/20260910-axp318-regulator-v8-0-e906a61a7f3d@baylibre.com
[2] Pinctrl IRQ-bank v3
https://lore.kernel.org/r/20261025142412.112216-1-pmazzini@gmail.com
[3] A733 8250_dw v2, patches 1-4
https://lore.kernel.org/r/cover.1792439398.git.vinicius.eduardo.pedrosa@gmail.com
[4] Firmware-clock v2 for vendor-firmware warm reboot
https://lore.kernel.org/r/20261112-a733-fwclk-v2@gmail.com
[5] Pinctrl voltage-mode v3
https://lore.kernel.org/r/20261109-a733-pinctrl-v3@gmail.com

The A7S DTB and schema checks use [1] 3/5, [2] 2/3 and [3] 3/4.
The runtime build uses context adjustments for [1] 5/5 and [5]
after the regulator allocation and IRQ-bank changes.

Validation: clean application of the mail patches, arm64 defconfig
Image, arm/sunxi.yaml binding check and warning-free A7S
W=2 CHECK_DTBS=y.

On a Cubie A7S, a RAM boot with vendor firmware, this DTB and the runtime
dependencies above reached a responsive console and probed the PMIC.
Pre-boot U-Boot selector reads put every bounded rail within its bounds;
none changed at registration (sysfs at about 1 and 91 seconds, and no
regulator "Bringing" messages). At about 32 seconds unused-regulator
cleanup disabled DCDC4, BLDO1, BLDO2 and CLDO2; DCDC9, SWOUT1 and
CLDO5 stayed enabled through their users, and the console remained
responsive. MMC0 enumerated the card in High Speed, with a 50 MHz clock
tree reading, and completed a 4 MiB read; its data was not verified.
Both LEDs registered: green:power was on with trigger none, blue:status
was off at sampling with heartbeat selected. AT24 registered the 2 KiB
EEPROM with its WP GPIO; topology sysfs showed one cluster. A warm
reboot returned to vendor firmware. Not tested: early and repeatable MMC
reads, MMC ios, SD writes, hotplug and 1.8 V switching; EEPROM contents,
writes and write protection; visible LED operation; physical rail voltages
and CPU/cache topology; PMU counting, EL2 interrupts, ITS/MSI, stimulated
PMIC/NMI interrupts, suspend, power-off and other boards.

---
Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7A and A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

 Documentation/devicetree/bindings/arm/sunxi.yaml  |  10 +
 arch/arm64/boot/dts/allwinner/Makefile            |   1 +
 .../boot/dts/allwinner/sun60i-a733-cubie-a7s.dts  | 331 ++++++++++
 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi    | 663 ++++++++++++++++++++
 4 files changed, 1005 insertions(+)

base-commit: 2ba07dfcd45bb6ec414e68213620490548fd5aec
-- 
2.53.0

