Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101670;
	b=TJD+XKXvngjbPI+c5cwMwWIY++puVNV+FUst1M6QYHmM5u3CUvG0ljGsnPcjTBkKQB/f
	 hjpfeoR0D7fraPtgIHXdbURBtrVqAa+KiP6BcbGF2K2ql3fc4mtFc/bICTBDUEWbdvJop
	 X3ewsGoGgpm8FmQQUL2lO+Fc7z084j6eeNctg30I7dkMn+yFFp6mCq8hp59MmFCm3+ur4
	 19PgqX/GEh9Pusx0KKKmnfQlTD8pHXl+9i1P5SThAEkqTtsGDA7DTjmQOk/4cmflbnEfC
	 23L64ws8snkrDXsjGm//hI/22HiJCR6EwMalTJRz1PXmMaeIgAitnRBJSpUZFnUEsfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101670;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qqLsKRglr69cuvfpUEZoX7IwkwkVc1oYOcS80XJiB6w=;
	b=gtZIYy4P+kR1b3hY0MbFaAQ06xgBagsy63MYEDhqMqtmH4gQB4f7WF5FNo1jLIMscv6w
	 uWp2pJFoexDSG+kK4o1EbVzvd10aCIh7HTd9X/3hCKiIlX4Jr5FkcInmpxIVQQ+Yjmwp3
	 GF00O7+DBh5q6Ou/IbnNVU8QKRX2BRG+k9dZFMg0XSguL5TWm7P4bxfCGCF+94jbbT0ZM
	 ZDD/SrEitgIS6L0buhoKdbuzCHEsLxcw4Q4n5ojo1/VpRbeEVKJvtY1c87Uu+DLS7K50Z
	 EErCTqLyod+aWzPItt9V++rQHMVfPcOAj8pafAEwie8X12WI7DkyZcaWPKgSLiR/+FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=KVBGY3JS;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=KVs5kQ3W;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CC6606A320
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 15:21:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4CC6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=KVBGY3JS;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=KVs5kQ3W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795101668; bh=qqLsKRglr69cuvfpUEZoX7IwkwkVc1oYOcS80XJiB6w=;
 b=KVBGY3JS+vnsTrvgUs7w6lyrqcI8h7GTqGYQYSlfx/XB2+4wtNUTrGGFReHTNzPGjVFP2xOgf
 qdSa0i95gOuIYWTIU0VPdhpsTniuB024iiPv/uLJ1QygvsicAIhLQ+n9dEZKGtP6/LWgmNvUN+7
 ula5BpMFsc2PgBbFEefoh78yYi3w3uMlNT5SE9tzeKICcF/H8JYS6j3avHXGUpJMdoMS+bvj0Uo
 /ERQ7ZqadFlE9cNpxG7lOnkT79ZRg7os6Kh6ueqOTbT3Woeic1c56lk4XCkdPmgMihI9OYUW8yo
 ihYFQH/atYl+d+wVkVWItqXQT/qqmB7KoiqkUTEYHOxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795101668; bh=qqLsKRglr69cuvfpUEZoX7IwkwkVc1oYOcS80XJiB6w=;
 b=KVs5kQ3WnVZ1QD3IL5aIEDE7QlTmVi+qpBMOThUISDDC+6Ay4jM6Skw3AWbcnwacX9ifDSOGn
 EvhIGjPeTwY45K1dyjEBvg4EsBjijTe84kbe079yC5jkSbrPwmo85pcNdp6Wm+wVz1/0WQNxJVb
 4QKp4da4BSoukH8xsvgnKjI=
CFBL-Feedback-ID: 6aff13e283f3cb488062ba3c:560892392feac820faf3aab2dc15cbc7
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff13e283f3cb488062ba3c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/8] ARM: dts: rockchip: Add Luckfox Lyra boards
Date: Thu, 19 Nov 2026 15:20:43 +0000
Message-ID: <20261119152055.556266-1-jonas@kwiboo.se>
X-Mailer: git-send-email 2.56.1
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

This series adds initial devicetree for Rockchip RK3506 SoC and initial
support for Luckfox Lyra board family [1].

The Luckfox Lyra board family use different RK3506 SoC variants, i.e. Lyra
and Lyra Plus both use RK3506G2 and Lyra Ultra and Lyra Zero W both use the
RK3506B varaiant.

All board compatibles use rockchip,rk3506 in this revision of the series,
maybe we should use rockchip,rk3506b for the RK3506B (and RK3506J) variants?

The pinctrl driver for RK3506 will not work as-is using the SoC DT from this
series. The already merged driver depends on a rockchip,ioc1 phandle prop
that never was described in dt-bindings. The SoC DT in this series instead
uses rockchip,grf in GPIO controller node to reference correct IOC for GPIO0
and GPIO1.

The branch at [2] contains follow-up patches that e.g. fixes pinctrl driver
and adds USB support.

Mainline U-Boot support can be tested using a branch at [3], it contains
board support using same devicetree files extended with USB support.

[1] https://wiki.luckfox.com/Luckfox-Lyra
[2] https://github.com/Kwiboo/linux-rockchip/commits/next-20261116-rk3506
[3] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506

Jonas Karlman (8):
  dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
  ARM: dts: rockchip: Add support for RK3506
  dt-bindings: arm: rockchip: Add Luckfox Lyra and Lyra Plus
  ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards
  dt-bindings: arm: rockchip: Add Luckfox Lyra Ultra
  ARM: dts: rockchip: Add Luckfox Lyra Ultra board
  dt-bindings: arm: rockchip: Add Luckfox Lyra Zero W
  ARM: dts: rockchip: Add Luckfox Lyra Zero W board

 .../devicetree/bindings/arm/rockchip.yaml     |   9 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |   6 +
 arch/arm/boot/dts/rockchip/Makefile           |   6 +-
 .../dts/rockchip/rk3506-luckfox-lyra-plus.dts |  31 +
 .../boot/dts/rockchip/rk3506-luckfox-lyra.dts |   9 +
 .../dts/rockchip/rk3506-luckfox-lyra.dtsi     | 124 ++++
 .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi | 576 ++++++++++++++++++
 arch/arm/boot/dts/rockchip/rk3506.dtsi        | 540 ++++++++++++++++
 .../rockchip/rk3506b-luckfox-lyra-ultra.dts   |  31 +
 .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  |  23 +
 .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    | 100 +++
 11 files changed, 1454 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi

-- 
2.56.1

