Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111756;
	b=dPN4QVih69sVG1spDSnvkrECNM50QZqQUOpxuCPSBT36QOjjs++Ekh23DVXMYNBkLRjQ
	 EGgfIjLldAGQNlkO/UCXP4xR0caIhrMJxCOZWltDTpy1Rv7EVctbH/u4kel5FsC6lQFOZ
	 xL+VtjNkOUbO/M5Cj2FwWQys0VELTFNvz+n7UutGvO/CxlpKVWFtPp06PaUGdJssGBjip
	 euOgahyAd4WHofNh8Jkhiw5xJGFrxnlhOYdmchcdzCgjPp5JOyv1Wbdt+/tA7WS2OQ8mz
	 EmNeLIHKZzLdN6//NthO8CGRgz6rHv13BvDEeGONE4aGJkMYNufiEKMbln18V8qmPLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=;
	b=stS64BbNEmxVNqS7lL+bQ2q+johfqsFAWYncEQEBLBITcaNoe5UT0+9WiGu6eYN6k1UD
	 Exm3ASiae25uKviRHKLuvHc36WIvcvz3GUWyib2xVhCgc9UtFw2X3P1Qh8lp+jgxi0CMV
	 PTx2UXCgixo5zM6bglbveU6eO/tY/RcyNDwWxAQdLijhLwMRoiP+OejCiiNJjT7a9qms+
	 d7al6oPrdB4l01o+xpQdKV9HwpJ8I7vPPU392CnjoUJORfyK2zb0XLPplCSoorYR6m7+O
	 tOmuzvTsB5awsE2PoETTCrB0XHsKcneYPu5CAAa7z0IX4SWaOfx/XdvWw/xuD0I8N8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hv6TyWgg;
	arc=none smtp.remote-ip=209.85.160.53
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A34606A32A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 18:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13A34606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hv6TyWgg
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4a85c656c58so87163fac.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795111755; x=1795716555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=;
        b=hv6TyWggD0il6OvPOSZjruj4SbRvPRlqpZjDRcNFCT5JmoYcUt6tARO3G0IJ+yfiQJ
         GV9yMQ9fS+/EVJZM3W9HVCMhh24hiXiPqi0SRoP4xql2QBTC433xdffk+npG/NW8mxv3
         skrOWHFc1XNrFkYzN2dlAFlauEf+U5qdeDEVH/EK1spvBIkh62yDxO+axxEIWZzgk2qH
         xvCtB9OXLnU3rUaXNOK091AK8dZBpLuQ7tN6sCash7hUMD0wXJtSfZaYCEz/QbsyXVzq
         nNonHL0k/yiyxyZVWMbAN6FJyno1I+1aSlKxb48aKAsI1aOc63gIQgBbToOeuGqKA3a8
         ++mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795111755; x=1795716555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eqGeXaKgskH76AWGvxlQS6K/15vXQQ9IhK4LOBED4PI=;
        b=xK2yc22Occ2JoczwZbCvl1moz+OM9HMW9wPj3lJDglsBuwq7lYLKqHPJxZi5GL12pD
         DnYCdIxKVob0scvjvDKfp7sTlJVqWS44Y5ryZbXDIOGs6E4KjZCOJDza0ff417VWBXqL
         TJZM1770/SpcLRIKBeNpxZc3HjCWGK8aweqVHx2+b35Tv9k+XufxyvG5sf3f/VEoCjW7
         21D8jxtGcCUdG3NtI45LJri4j3kj1Extt9Z5mCt6oVKohdQR/h/e8iIyYQwiDv+kfUkf
         0C7ci/TdkAVuVGMpTkiIp3CYbgP1tabSlQa7FyzZxwpnsC4kFkLOnm2CA7JfIjdUCy63
         EfLw==
X-Forwarded-Encrypted: i=1; AL+hErEBgzHS0dokQUB6d3AgDX8QAZ1AtcWVzdeFvCosSlx9vxMKfumvDCTZffwhZD+QYBRGmHJugFQ48WzY@vger.kernel.org
X-Gm-Message-State: APuU4Z/BpIxDkT/4WoSN/LvC9cgxYtxEty8eOUC76tIvuHykU0ehd/KO
	6Hak9e4EcAygs6ihWkczaQq6iAgAM998wUaSHATB/rJUi4vaWOXoTGft
X-Gm-Gg: AYBFou0BoX2nz+e6KImvskw/tLDcy99X7hlGmScf6oFSF23JoqGh9jGqHk22jN/7Et/
	KxJEK3PZHBNsC6M3UyNdxE4EMPrD7leCk1GBtrYB6pwQ8IIQsHHgNwQX/SnA8GrARkdL96xMiI5
	hYE9qWWwEbiNj/InAoHf+jkrdXKDm2EtFWDydYAWlivDY2w2t7DtO0F0JqI7HVJX9lQNuZ4TtwM
	eVAi69FPs7M5duYXELFa24oRB8TqfRVUBe9gTagkHhPT6LO1GESqFHPGdu8XPtyG0WU9YAfGhpn
	34rGicJw1iRB4a/h0x7UvUeDymRsWMWqIzW+dLvGRjYKVL2uaMvfbAZ9YVHlE6gbJyERl1Z96Zf
	/OYTkrOLhD270zH5olUu23ZABASWNxNGV9u4Y3ci5Y6g8B0ApV3Z/bHmS47i5fksp7UMFXcBPXp
	gy8z2UKnVii9Tv/Zox8s2I+K2cSOfvwxJMk+Rr8tPHk0K6Cs+bJcNJK/IuGAd8Ji2dF7IUzzy+G
	bX0dlQi/WVtv6vc0gV0SdR8NQLy/0GeKIG9ent1eRE//1CqrbOax1Xw0H9w4Ndi21Kdmims0afS
	gJXvRZMdRIEIBEtmyFFC0nN0Ak3h8mf7NdVs7SagQ7zHQ3KwYVsS4hkTt6tQt1XWBZ46q/rxeYt
	X
X-Received: by 2002:a05:6870:51ce:b0:47b:cd37:f931 with SMTP id 586e51a60fabf-4bc81aa2294mr384102fac.13.1795111754944;
        Thu, 19 Nov 2026 10:09:14 -0800 (PST)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc60491337sm446604fac.12.2026.11.19.10.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:09:14 -0800 (PST)
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
Subject: [PATCH v4 0/3] arm64: dts: allwinner: add A733/Cubie A7S support
Date: Thu, 19 Nov 2026 13:09:12 -0500
Message-ID: <cover.1795034153.git.enzo.adriano.code@gmail.com>
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

This series adds the initial Allwinner A733 and Radxa Cubie A7S device
trees for UART0, the AXP318W PMIC and 3.3 V microSD.

Base: sunxi/for-next (03b3355ed7a39b4416f0d0a39061479b1aa13196).
Previous posting (v3):
https://lore.kernel.org/r/cover.1794227241.git.enzo.adriano.code@gmail.com

Changes in v4:
- 1/3: Carry Alexander Sverdlin's Reviewed-by.
- 2/3: Add a one-cluster CPU map and A55/A76 PMUs on PPI 7, using
  GIC ppi-partitions. Change #interrupt-cells from 3 to 4 and add a
  fourth cell to every GIC interrupt specifier. Drop Vinicius Pedrosa's
  Tested-by because of the interrupt encoding change.
- 3/3: Sort root nodes and put status last. Move boot history below ---.

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

A7S DTB/schema checks need [1] 3/5, [2] 2/3 and [3] 3/4 before v4.

Validation: clean git am, arm64 defconfig Image, arm/sunxi.yaml binding
check and warning-free A7S W=2 CHECK_DTBS=y. The compiled DTB has one
eight-core cluster and two disjoint PMU partitions.

A November 18 RAM boot on Cubie A7S with vendor firmware used the base
and runtime dependencies above. Two context-only adaptations were needed:
PMIC v8 regulator allocation context and pinctrl voltage-mode v3 IRQ-bank
map context. CPUs 0-7 came online in one cluster. The A55 PMU covered
CPUs 0-5 and the A76 PMU CPUs 6-7; cycles and instructions counted and
PPI 7 overflow samples were observed on each CPU. The timer, console,
AXP318W probe and MMC0 read-only transfers worked; warm reboot returned
to vendor Linux unaided.

Untested: PMIC/NMI interrupt delivery, card writes, hotplug, suspend,
power-off, CPU capacity, 1.8 V switching, other UART/I2C and storage
instances, RTC alarms, EL2/ITS/MSI, and physical BLDO2 voltage.

Enzo Adriano (3):
  dt-bindings: arm: sunxi: document Radxa Cubie A7S
  arm64: dts: allwinner: add A733 SoC description
  arm64: dts: allwinner: add Radxa Cubie A7S board

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun60i-a733-cubie-a7s.dts   | 287 ++++++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi | 657 ++++++++++++++++++
 4 files changed, 950 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733-cubie-a7s.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi

base-commit: 03b3355ed7a39b4416f0d0a39061479b1aa13196
