Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795813173;
	b=huFtEFZHk8aVmAiRKC6bQPNvwA5iIIV7NmyAJMYaVK2OVXxWpe2uP5aF3hmd0YDmXWS9
	 T9cWmasBWNqObq6UlTxKrY1/dLr1OjJDcucslPQ4LCdRVYWo4pBhKMxv+NKolU8tUZS1Z
	 aEQtnvq6h3X09+RfbPvLyKsoURFe8h791m/ClUjYndwWg05k4GMUyDYrdA4KL7pyGGpAV
	 ykQeg4kWbUFSNee+i9ram+RkXkF0gZYzVG873EHzQzbSptspfOLjyM/DVdq86EIq6NI2Z
	 1VE3CRoYfz9707zlTxxu/Y2mjFJdCGLiH5EtsVPAWW1rOf4nZfJj7ngY2d1NH+a0H4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795813173;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=gfqgUL7yYtwlVpnXWIP8EprRDIRRU5H70FV6g0eOX3Q=;
	b=RQZrg81MZJA8m1YYilLHcBDksXv1GX/8i02PQ+P5uvP+fKj7Y4/8oHxQkdP5kOpODnNu
	 302YYIOG0vwwq+wUVzcm5eu5Ln5YHEJFGcHNYK2o+d72rZpUupLlGH9/zQCEAkNqy+e6T
	 qck+eebCni0qLIn6dhrazNNsBgieTmDwWNMEFK4VT4xgi/AYFp4Er3E4cfd6NGO7hMsEL
	 RW8ytKPUGZj5BaTZZ74fqMCX6ZmPWJchEmd1fRIq5Q8lq311/ok53U75JQeyzwtnQn9E+
	 qPTrFrrAuoIBL2lg0e2Tqcvxv4jEM2p/Kahaw4GOWqUsBOBA1G+iRIwN7YlGa+qRBGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gn0ZsS1a;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAA3606A31C;
	Fri, 27 Nov 2026 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gn0ZsS1a
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795813173;
	b=Sm0ATQNl9mvdfRFM2SWFdsTRms9u446jo09L3PvItz1CgcRIIBB+KhU223LKWxJDg6Qd
	 UNmX76Pauwuxm+RGxUW6QBAGV+sNABw0vhBuTSRjkLrIdDojOpHVPd8MzdNnVh1OIk/j9
	 mLVfMPzPDlON+CsU7CPPR6qhQyuLBwPeuzCdVh+9imaEu8lj3FX2QiKczZXk4DTj5PHpQ
	 HrPPI+2JjYx5Z/+FkLok0J7dI44Xu71EuYdK9ZZe65gRDOAIbfH1aU0kBQJdWLgXIbuRD
	 IQaD2KkiuxB68iGwLNy6Bu2t9Ht7Gr9peqPoeGEoBXOPiyp42loKny40h/Qf7BAvaCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795813173;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=gfqgUL7yYtwlVpnXWIP8EprRDIRRU5H70FV6g0eOX3Q=;
	b=TfDwbinGyWKazVkkpgWV+pRD9+n4Lj5xwj+z3VeMo8jUkZfx5IAQ/3S9VRAe5Oquh8Ot
	 UF/j2wnu51pS8EpBqXVvqFahp85xORmYeLcXKWhTY0tFQq0eNzM80OTsD3eTc2K5o7i9p
	 i+cfv/ShApA4+uTNf00oUKC/ZVGK0HQ/5k5Xf1w0c9roUaXgmzIDusNyDmvzIc1pcnKOW
	 5Vqk6lBUDzaxtSjX4aedeLa55TmEo9zmzheXPq0uv7GpGzm0CbB7gNexDYAIiftQYm1HY
	 TflVi9IPLreWL4E2ZMI3It/3qkObueSKy0HcRiDiW/vfCaNLUF5HJUsIUCef89rZnqA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C68C1F00897;
	Fri, 27 Nov 2026 20:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795813173;
	bh=gfqgUL7yYtwlVpnXWIP8EprRDIRRU5H70FV6g0eOX3Q=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=gn0ZsS1aCidyTIm8DEYBGkaR2vKUoIa7lZugbhxb1xgYPThTq69cz6vq3z1wXqtOE
	 VaqsXbNy3B+aH4cEdv6eyjZIOlSwF7N3756V8e9dQfoN0Tlo+FUr8w/osloOMfbKrU
	 yA0tEm6ps9BSI60PQmEV9IcwiPoXLuhLXojNOU6+L2CvODok5F/OS+1RoXkotdgvL+
	 h4zHKZWYDdswkdTjDY/jT2XnZ7qkuoDO3x4DNIWyfB456xtiEew9nHlp49ji2y/G4A
	 PYBajEpocbYnfG5Oe9B6KG1TBd1zkIqicS90+eW8duH5PYiKvvpi2jxWhRCbf1iTM5
	 EFa6cFO8X6iXg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9D9F54DDF4;
	Fri, 27 Nov 2026 20:59:29 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Subject: [PATCH 0/3] ARM: dts: cortina: Enable CS7542 Almond+ peripherals
Date: Fri, 27 Nov 2026 23:59:28 +0300
Message-Id: <20261127-b4-cs7542-peripherals-dts-v1-0-7ce24b842b3a@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/41U0W4bRwz8FUPPvYDLXXJ3jaLofxR54JJc+xrbc
 iTFcRDk30vZcQEdGtQCJOEOO7MkZ4bfd0c/rH7cXV993x38aT2u+4d4SL9d7fRWHm58WS2edwj
 IKWFeRln0WKng8hjIx1s/yN1xsVN8pyAIaS1t7gL/ePC5Pr9w//Xx9fn4ZfztejoT/jxx8M9f4
 tLT67HdkKMvur+/X0/XV4OlT8lFvaRWdXC3rNSalDHm1JzUycbrZfd+PMpLtddXv/8sFt+KfX5
 envoCS5qaRodh0OufN/ey3n2Iu/74FR7ewOvDSZcnCoaJwyspea/6/wypvzHcPK775YmDIVdxE
 5D4tXfU8G8DK0YJLQgMGsDoXFvjdxCkRQ73y+mrLV/tdB5DWlpKzaA0nebvKuGNQe/2+ml52J/
 WufpheUpBxthzpgriuJ3po5z09oVKkozuKhkFqxDmwsYpWwn+mQg9DRTO7RLFFAfGyCoijVJzJ
 04z3ubJkMU8d55z9ksUkWmZyXuo3SgX0FIQS26INAmmTc5c+wZVpbWa0Zr1mIpN5AEVO54nmAx
 nLRqfVDeoObwXIGTymS25MsZ0SyIprACcZFrVTV9QvQHB+c/IQZMBO0GYfXoUNnvMJtqmTV8ZU
 o4I9EGzsjBB2DAuSYPzmAk4Fz8zbFDeeLpAx1a7cBTrdUJvNlgtZBClRC1v+irdpdTu3IbajLj
 Vjl5jFBkGoo6uipbrpi8f1nqtGEKqmXNFKLM36hxeo4wx0Nkml0tUZsDQN3EG9+xhzZ4BFbMOo
 W6lZZduLV2iUk25RhstWU4FLM60qKtBLAfRLoIoUSBsKpTQaOhovXCzCmChOnHPM0QsDMZGgq9
 6/XcUYqN8VmmfIg/7ZXw7+XIbpBGG9WE9vSZCuRRAinU15ZeJiI5ce+2RiKRZipZkYlwiRZmL5
 R7CNUy66XrEhs3MiJChjdS4hCSxSyYK5ZhhgjTD7hu/CYV2QAPHaKXEAvWYnWCEssZ2Felq4Vi
 +RA1oGZhaGjMSdZ4MlTwgRKqUIF5xDZFo41LzGQo6cwf1zi1sWmmEg7jE2FNuo89YPBu/hZ3P0
 ew5VlLyHPFLVssgJNcZBaOTAtVxiWpmdaIxdYhzFJZUGMo8KLyUYsGVHMSWdh9//PgHzKsNWek
 GAAA=
X-Change-ID: 20261123-b4-cs7542-peripherals-dts-dfa20a5c748f
To: Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795813168; l=5734;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=6Or3mAfqJgt3Mk70H6WetS/Z7QWVCsD3NX9KPcQ2sKE=;
 b=EUITBK+MoyOS+B03rJA6nIqgPymg9Tbm78GTUasqPRldDT7MPIoQomepVMNMzs6x9ACO/pxM9
 K2jmztc0fPKBhJKArGEnS5jVKq0wvcYg/wHt8bIP+MluWTCZcf4iUpq
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com

Describe the CS7542 controllers in cs7542.dtsi and the Almond+ wiring in
cs7542-securifi-almondplus.dts. Enable the peripheral drivers in
multi_v7_defconfig. Platform v9 supplies the minimal bootable SoC and board
descriptions; this series completes them using the subsystem bindings.

Use the global syscon for clocks and seven independent network-engine
resets. Describe all three PCIe Root Ports, with one owner for GPIO92
shared by the Wi-Fi endpoints. Put endpoint addresses and factory NVMEM
cells on the actual PCI children. Both QCA8337 CPU links use rgmii-id,
matching the tested board wiring. The MDIO input is the APB clock, as
confirmed by a differentiating clock-domain measurement on Almond+.

The NAND node describes the AXI clock, interrupt, data aperture and
separate flash reset from the vendor resources and posted NAND v5 binding.
The NAND driver has passed the recorded Almond+ checks; that is driver
evidence, not execution of this publication commit. The board properties
follow the tested OpenWrt integration.

Validation: the final sources pass unsuppressed preprocessing/dtc and
complete board schema validation. Reset/clock specifiers, PCIe addresses,
shared PERST ownership and NVMEM cells were checked explicitly. The final
dependency stack is checked with b4 against the base commit below.
Earlier combined revisions passed full native ARM builds and RAM tests;
no new hardware result is claimed for these DT-only changes.

Clock/reset/pinctrl v5, MDIO v4, Ethernet v4, NAND v5 and PCIe v3 are now
posted. Prerequisites select their published code and binding patches;
independent MAINTAINERS-only additions are not needed by this DTS stack.
The bindings and drivers can proceed through their subsystem trees, with
this board series following once those dependencies are available.
No offload-specific overrides or personal LCD package are included.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
Fil Dunsky (3):
      ARM: dts: cortina: Describe CS7542 peripheral controllers
      ARM: dts: cortina: Enable Almond+ board peripherals
      ARM: multi_v7_defconfig: Enable CS7542 board peripherals

 .../dts/cortina/cs7542-securifi-almondplus.dts     | 342 ++++++++++++++++++++-
 arch/arm/boot/dts/cortina/cs7542.dtsi              | 321 ++++++++++++++++++-
 arch/arm/configs/multi_v7_defconfig                |  16 +
 3 files changed, 666 insertions(+), 13 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-b4-cs7542-peripherals-dts-dfa20a5c748f
prerequisite-message-id: <20261122-b4-cs75xx-v9-0-1fc1b90bd097@gmail.com>
prerequisite-patch-id: 104c6fb668f30ac8c2c5b3b6c524c18caa8808c4
prerequisite-patch-id: e7d503348cbec7558cd084162133f8e34df1c1bc
prerequisite-patch-id: 1d5770db02b983d012f6c58806fbf3f5291a06c9
prerequisite-patch-id: 8515988ae3509d4289a8d845803353f5ed412982
prerequisite-patch-id: 6c0137d52f201d8ec085ee6cc7b2d49af15583d8
prerequisite-patch-id: f591d13e0d394441e3cd28149633c1133bfb79ee
prerequisite-patch-id: b3dad3ee0f7e08ea9e942fd83f3d2a06ff8fb164
prerequisite-patch-id: 4fdf33aaedc9ca7f4d7a59b48e4ae55c497462e4
prerequisite-patch-id: 9b4a468b7b74861017ef533ba0a5574bc14b212e
prerequisite-patch-id: 1f232c94dd3fc0d862203b7c0c1449e6ba9a6859
prerequisite-message-id: <20261120-cs75xx-intc-v5-0-f2be75c5e97c@gmail.com>
prerequisite-patch-id: d1aa6857057b1e76a68ba14d4ea17352ffa90c7e
prerequisite-patch-id: 1fd32c18f2d4a7700528bf45da72b30b62744171
prerequisite-message-id: <20261119-cs75xx-gpio-v6-0-37aeda0aaedd@gmail.com>
prerequisite-patch-id: 7189d6a033e0e18b87b72f3f9b49a1c71a97a2b8
prerequisite-patch-id: a70999df9edd8fbb4ea81ca7e782aa89f52b4a06
prerequisite-message-id: <20261124-cs75xx-i2c-v8-0-d0800b967886@gmail.com>
prerequisite-patch-id: 1ccad6a46a6b3391a0244edbdbc4949b6614e271
prerequisite-patch-id: ac9ec16b2e96d5580a256823ab1330098380ae32
prerequisite-message-id: <20261121-arm-twd-wdt-v9-1-8118d048cfde@gmail.com>
prerequisite-patch-id: e8d416021a43d45b01ac95877bb1c42a46d30153
prerequisite-message-id: <20261124-arm-twd-clock-notifier-v1-1-62933570ae27@gmail.com>
prerequisite-patch-id: 66eb0299dcb45847726974805c675a856fea149d
prerequisite-patch-id: a1ab9eca32a27a52346d613d4611f152e1b2a638
prerequisite-patch-id: 65d46bb3caaa8518ee561f65d3f603ade396fff9
prerequisite-patch-id: 55dc4f1e91fc85340c4422438225f50fdf636799
prerequisite-patch-id: 7a88732d8d9fdedf26b0729211211d2f74cccc17
prerequisite-patch-id: 7fbe9405265ef3d1ec62811415a46c0061afd7c8
prerequisite-patch-id: 07e805007e8d5e0c1d06e50a9ffe799f9d61bb35
prerequisite-patch-id: 5301369d9b5f76a650c5e6c01b63bf10634e9ffe
prerequisite-patch-id: 5e86fea092879a6940e7f098db6cd346ac515837
prerequisite-patch-id: 49ea479e68bcdf4bb792e712130b22cb9cc2d378
prerequisite-patch-id: ebd89772638cdde67204f9859648c532072f8f64
prerequisite-patch-id: 3602aa81630ee3e18d9302c23cba59d483ea9d81
prerequisite-patch-id: 1713798d81d3140dea98cb980a4bac9aa22a3780
prerequisite-patch-id: ead1ebcb89468d700d8875693f405460d6d5a2c8
prerequisite-message-id: <20261124-b4-qca8k-two-byte-header-init-v1-1-c644025b69fa@gmail.com>
prerequisite-patch-id: 48d4c38319b803b22db91864e3321abdb6ab32b0
prerequisite-patch-id: 9d8ec97932a1c3a4c41dad64e27364d395e8821c
prerequisite-patch-id: 1b20a366220308b1864130aaef2a53816101f442
prerequisite-patch-id: 0a571205b2bb84488ae379a21ab734caa9cd15a6
prerequisite-patch-id: b08306581bf5dcd6d5543b00ee75105dc67c2355
prerequisite-patch-id: def18de6690ce96865075b4bb64cb8138b9f8cf7
prerequisite-patch-id: 6a6f50f93cfd1e3df21d74b525ecf4882e5c057b
prerequisite-patch-id: 8dd7f2d65905ec5c2dc0bc66b56301048436a6d1

Best regards,
--  
Fil Dunsky <filipp.dunsky@gmail.com>


