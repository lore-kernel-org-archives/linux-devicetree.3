Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496268;
	b=yKGi9ctaT5pNbSETReVqQ7GUz9WHiABdt9Y4biwtbmI7cxMkOfEQN/8n3dpP3jRNCw1f
	 83i4gUOyutyntG/WwrAf2JZ1+kaYM847HeTVSiAn1e4OZbTBOYA7ZRtlqDbzJwSDU1KvP
	 XnhxyUOGG9z5i5x5RopfgWLGbFZyeKcJ6alNzG4dXycf0bf4yX88iFNKsoFIAjYKJqxdm
	 s6wp/1lcvWVHwCGfxe+E1gHpGiW9nJi3OVXb5NwwVs2JREuYZJ78IEQdEr5gCcZPVr/rq
	 DnEJcTebNDHE47nlLad6X6Cogsqn9CTaWQjLIRvyZA0hPkqbDVilAF/D6MrkktVvlWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496268;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9EfSOgLxi4obTSYFEKDcXWdZzyYRk0JZmlRNRhuV2c0=;
	b=j23YrXbSkZxJF9wo+3+UmQdb4uL0x364aWBhVDqXBXg0p5IwFxAv+FLSVq62bQBbJ858
	 7CMa7HxsB95dQc7ZUPu7POAuN7L3zbSZyzHTPu6eeUbuToA1UPMNpl5cyoYKrHamcD14t
	 QTj6TYOUzVYT4Itfu3roBgWLQL3/oT05ZYMCP7Qma0YmROCQbIVlyTd6W1LVtZCGlml/Z
	 fBdm9PR5kXZ6/gpGgDDHxv4gjm9416INaBZf6Y/h1eMi9hvpwFagQbzyNX521muZYWBcf
	 Lue69LghfA7ObAo0iqnj+XVPzE+cNtNye96jsu8go9TbZGN0bglHyfke6ABhgCVIsiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=AVjXfT06;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5812B606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 11:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5812B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=AVjXfT06
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2579832f8f.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 04:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1792496266; x=1793101066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EfSOgLxi4obTSYFEKDcXWdZzyYRk0JZmlRNRhuV2c0=;
        b=AVjXfT060smBSSydciK7f/WBfzkpbUzvdYi/U4/+P6RI7tLqa3T6JjCX+LEcSAwwq3
         gVqBgwCZ/QtgURgVxVr+eb8V/5u5TVqiWCS3+nW/AG9FhZSYD/BDi2AIrBQW3beIUG1f
         2usM4TRNloNEV8wMh7ho1WnSCgxGw4lLP3xrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496266; x=1793101066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EfSOgLxi4obTSYFEKDcXWdZzyYRk0JZmlRNRhuV2c0=;
        b=NkplGYl/W9JKu01Ez163vO488U7brR8StmuDUxtje8rbFHP16ubSe5uvMCKJ+Q+6QE
         6SuWhZ+Fm+YwbCwvHVOOGS71xZIR6pcIPfjQdt9GBKOMVIldUzCv/yjtwLPUQZRNjO5q
         lOKa/NBvQ8JocOVnruii3cykyfHpd7pLJW1ENwwce831TzJZk4lSMHMYvyhBCK649twz
         wRkYpZ/R/7ISVGu0WmPCBlkqWR9CT88wXPG+ykTbfVn+HhROBcNjLMKzgv4TiaCMaMNz
         m34wUPf7a6VG1qVgDWJnirpuevR4Fkpe8tDRubIyCi37Y362Uutb8utJABjWzMvmrii7
         iDQA==
X-Gm-Message-State: AFq9FYJJDMmDDZDvHmtEUK11VJc+hvl7Ulvp6nENT6DsBDcoqTKb67un
	09BprJB7BZN0/V8UYNSLjNGQKd7+8UOGdnCzqhBqmC5yFovK3ZNFoQcsekOUoYIcdHJcT2a/bfs
	zUTrcCi4=
X-Gm-Gg: AYBFou2Vnh8ehASJXnveCbGRkATGvy6REjpwaMisvGwmAeAH3n55YPCrdaVRbjtkNrE
	3D1JmQVBnYnyW1IVOYY2g3NI1jgIXTAidg8b/XlA6sYFfUQBMfdkuIi5TMAV97J+HTqDU7XAtF2
	ltsr/RXnjpomNc1lha+3J+pGVYu0Ds1R2l76XdeVeRhXa7tU20d/thHluxKWapRvQMBqks01r1w
	3Sr5Tspg9jUH5/MKsTFBc9xPRnCRIHNrAQTzF1z1aaWlOL72nI1KGKkIkr6aUCktWBgSLb3/U7a
	pTNw3fGWYn2HZst5ULqvEslkzubyqk3/6CAvQkRL0QIf690+W1YvjfyHHHzA7tB4FY1g4fH1aah
	nkeh0vsniLt+b61bcM4F7clQZaE7Hq9bQkVA0D58atHCJkStl221OUmpoENqx5RyqHTIUiojRfi
	L3xwAXAU0pgx3xKZv/BU0StXpUrQPfh2M1uJWKJhRCX8sI5He0p5IPsisYFZyQuezjQlG/Y3bw7
	DOVK+aE+WGaaaEx9BRtveXbGa0ZEIvMoSchnWBFgYWb4kxAqrN8NGZ9/yVlAjFc7Os8etkpXYvn
	zbxp+0RC
X-Received: by 2002:a05:6000:260f:b0:48d:f14a:9176 with SMTP id ffacd0b85a97d-48e07bc1033mr21008073f8f.22.1792496265627;
        Tue, 20 Oct 2026 04:37:45 -0700 (PDT)
Received: from thinkpat.amarulasolutions.com (host139-112-32-195.dimensionesrl.eu. [195.32.112.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d83a099sm4709728f8f.57.2026.10.20.04.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:37:24 -0700 (PDT)
From: Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
To: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	dario.binacchi@amarulasolutions.com,
	Patrick Barsanti <patrick.barsanti@amarulasolutions.com>
Subject: [PATCH v2 0/3] arm64: dts: rockchip: Add support for Axelera Embedded 111c
Date: Tue, 20 Oct 2026 13:37:14 +0200
Message-ID: <20261020113717.189082-1-patrick.barsanti@amarulasolutions.com>
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

The Axelera Embedded 111c is an SBC based on the Rockchip RK3588
SoC. It offers efficient AI compute for multi-stream computer vision and
generative AI applications in a compact design.

Product page [1].

This series aims to introduce basic support for the board,
which includes the console, the eMMC, the two Gigabit Ethernet ports,
the four USB ports and the HDMI connector.

Changes in v2:
- The board was renamed by Axelera between v1 and v2, from "Metis
  Compute Board" to "Embedded 111c". Address the name change. Drop
  Conor's Acked-by on the bindings, since the compatible changed. Keep
  it on the vendor-prefix.
- Address Heiko's comment about regulator node names starting with
  "regulator-".
- Address Heiko's comment about non-existent "mem-supply" binding.
- Address Heiko's comment about dropping the unneeded "Use rgmii-rxid
  mode to disable rx delay inside Soc" comment; checkpatch complains
  about uncommented rgmii-rxid, so take the one from
  rk3588-youyeetoo-yy3588.
- Address Heiko's comment about reset lines of the phy nodes being
  incorrectly described in the gmac node; note that these are still not
  described in the phy node because GPIO3_B7 defaults to pull-down,
  which causes the rgmii_phy1 node to never come up; rgmii_phy0's
  reset GPIO, GPIO4_B3, defaults to pull-up, so that node does not
  encounter the same issue. Moving the reset to the parent mdio node
  instead did the trick.
- Address Sashiko's high severity comment about hdmi0 node mixing M0 and
  M1 pinmux groups; use the existing hdmim1_tx0_hpd pinctrl group
  instead of redefining it. HPD is wired to M1 while CEC and DDC use the
  M0 pins. Verified hot-plug detection on external display.
- Address Sashiko's medium comment about "full-pwr-cycle-in-suspend" and
  missing "vmmc-supply" and "vqmmc-supply" on the eMMC node; drop the
  former, add the latter two.
- Address Sashiko's medium comment about the pmic node lacking a pinctrl
  assignment for the interrupt pin; add it.
- Address Sashiko's medium comment about the "vcc3v3_hubreset" regulator
  hack; describe the two GL3523 hubs linked with peer-hub.
- Address Sashiko's low comment about defined-but-never-referenced
  regulators without regulator-always-on property; drop them, alongside
  their pinctrls.
- Mux PCIEX4_PERST_N as GPIO, to match it being used via reset-gpios.
- Drop the unused input.h include.
- Drop the unused rtc label.
- Drop the local PCIe x1 pinctrl groups, which duplicated the
  pcie30x1m1_1_* groups in rk3588-base-pinctrl.dtsi.

Link to v1: [2].

[1]: https://axelera.ai/axelera-products/embedded/111c
[2]: https://lore.kernel.org/r/20260522174918.61523-1-patrick.barsanti@amarulasolutions.com

Patrick Barsanti (3):
  dt-bindings: vendor-prefixes: Add Axelera AI
  dt-bindings: arm: rockchip: Add Axelera Embedded 111c
  arm64: dts: rockchip: Add Axelera Embedded 111c

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3588-embedded-111c.dts     | 816 ++++++++++++++++++
 4 files changed, 824 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-embedded-111c.dts

-- 
2.53.0

