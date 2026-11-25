Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795643079;
	b=X6dtmrGDGwRqH9pRL97bErN1zKlxl4whMBV0KFxavoyrJi+hP/034klfOrnEyLj6VwFc
	 DGC2XN+eFzE8AV0UG8ntqORQFW43serFkhnajh5wKNSlwoGI2KZn7n0iZm9E6izXeuCYm
	 SbJ241xvZsQPfMbG/zqufFFrf2n0LEo4mqf17KxXarBiHk80Rnf8Pz7co/ZIy/kmUHFEt
	 qRj80Jl8vOONeQSUk1NXSfb5KdY3yl76NquWHfMvdBPYBensUVdaUymtkQ4RpFDqAspGi
	 Wu1iKsPMacHLGFaA8vMLv8v4y+drRJU6xs+Ekj2eJsRItIEiFWhNyI3uYQDdCH0+BNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795643079;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4j/XQhOlH2ab0JMIuNjO9RvRaPgAJ0A16BCloj2ZjhA=;
	b=Tfx+PDXZxWqScsO5j/1Q6Jebh/Mx7qTrSmM5HkTiNxCycsERVlErsY1jUiKL0VR7O8YI
	 vMA6lETKugWhU3UVgHD5I9ZlPeRlj76tmVLY3gdAlxLVsoUJNL5vCsWTbYvupYG/oPg/o
	 j4DjMWgKRN4rafV3KKC1DcvRSWCzt2YdGXBs9fmyPTBVhIf3NlmcQWeqEydBKSLRxts2c
	 4MPMSdzQCTLKuuR0asms213AQh/AYuCcC6KHjvgCKuZLfuXHKnnOzHEdlASro8lxBPrNK
	 8DVtTlrlSnS+p/oGeh9VnxrSux1B32D+YAaGL7uwXJCq2IjPPWkLDo1/nv69Qf1UoRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Mi3v09Is;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=W6aayl0y;
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A02A606A323
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 21:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A02A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Mi3v09Is;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=W6aayl0y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795643071; bh=4j/XQhOlH2ab0JMIuNjO9RvRaPgAJ0A16BCloj2ZjhA=;
 b=Mi3v09IsNtNnS3bkhI+MnzQwl7vRmLCG0cnOwdykyIJM9yQa8VGFByhQ5grjx8uaMn9++VWrR
 Nq5V0GfFra1Yg/3nQHh0wEekjsAueakCxPPX5duF3LeNQ+BrtnuytINvfQEqxURvLnLeai/OK02
 1macQXDI4gmtMLEqlvqpWVbgH1s27XfZ1EaeFPw2NR4yZdrQCcYAL8epo7zszL9NzJiTM4UT9wI
 ytghFu0EthkqOZnFnpCP9OgqDJTMCE/eDO/blcQhaap9ZPcv13OAtorP7imwFiDZgtdAsTxKbC8
 HGPYBp1P9vKZtmX3PA33dcETc+fygUOCIDXqHbBBCFSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795643071; bh=4j/XQhOlH2ab0JMIuNjO9RvRaPgAJ0A16BCloj2ZjhA=;
 b=W6aayl0yB2MXslwLxlVCfBcFJIIs9qHPCH3kRzkJG2aLyFXrfb+QkUlCkoqwXEvhbQv1Mg2B7
 +K6ri2XhfeGfvaxyvq2+pQT1YnSRae+f7YMaGZ1JbmZc+WysIrrOXnvp882vYxK3R8OiAhvo2oe
 46YhbzU9u5AH+4ABHW2ALss=
CFBL-Feedback-ID: 6b0756bdf930f38bf754f931:8054e09cb6735f7376d55581c80b2ed5
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0756bdf930f38bf754f931
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.39
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
Subject: [PATCH v3 0/6] ARM: dts: rockchip: Add Luckfox Lyra boards
Date: Wed, 25 Nov 2026 21:44:12 +0000
Message-ID: <20261125214421.1580359-1-jonas@kwiboo.se>
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
RK3506B variant.

The RK3506G2 SoC variant has 128 MiB integrated DDR3 memory and the
RK3506B SoC variant supports external DDR2/DDR3 memory.

The pinctrl driver for RK3506 will not work as-is using the SoC DT from
this series. The already merged driver depends on a rockchip,ioc1 phandle
prop that never was described in dt-bindings. The SoC DT in this series
instead uses rockchip,grf in GPIO controller node to reference correct IOC
for GPIO0 and GPIO1. A patch to fix the pinctrl driver can be found at [2].

The branch at [3] also contains follow-up patches that e.g. fixes pinctrl
driver and adds USB support.

Mainline U-Boot support can be tested using a branch at [4], it contains
board support using same devicetree files extended with USB support.

Changes in v3:
- Squash board compatible patches
- Add spi_nand label to flash@0 node
- Drop unnecessary /omit-if-no-ref/ on led1
- Collect a-b and r-b tags
Link to v2: https://patch.msgid.link/20261122060114.773624-1-jonas@kwiboo.se/

Changes in v2:
- Add default pinctrl to fspi node
- Add display_subsystem, vop, dsi and dsi_dphy nodes
- Add osc_clk_out and ref_clk0_out to pinctrl
Link to v1: https://patch.msgid.link/20261119152055.556266-1-jonas@kwiboo.se/

[1] https://wiki.luckfox.com/Luckfox-Lyra
[2] https://patch.msgid.link/20261120201540.672016-1-jonas@kwiboo.se/
[3] https://github.com/Kwiboo/linux-rockchip/commits/next-20261116-rk3506
[4] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506

Jonas Karlman (6):
  dt-bindings: soc: rockchip: grf: Add RK3506 compatibles
  ARM: dts: rockchip: Add support for RK3506
  dt-bindings: arm: rockchip: Add Luckfox Lyra boards
  ARM: dts: rockchip: Add Luckfox Lyra and Lyra Plus boards
  ARM: dts: rockchip: Add Luckfox Lyra Ultra board
  ARM: dts: rockchip: Add Luckfox Lyra Zero W board

 .../devicetree/bindings/arm/rockchip.yaml     |   9 +
 .../devicetree/bindings/soc/rockchip/grf.yaml |   6 +
 arch/arm/boot/dts/rockchip/Makefile           |   6 +-
 .../dts/rockchip/rk3506-luckfox-lyra-plus.dts |  31 +
 .../boot/dts/rockchip/rk3506-luckfox-lyra.dts |   9 +
 .../dts/rockchip/rk3506-luckfox-lyra.dtsi     | 123 ++++
 .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi | 594 +++++++++++++++++
 arch/arm/boot/dts/rockchip/rk3506.dtsi        | 614 ++++++++++++++++++
 .../rockchip/rk3506b-luckfox-lyra-ultra.dts   |  31 +
 .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  |  23 +
 .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    |  99 +++
 11 files changed, 1544 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra-plus.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-luckfox-lyra.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506-pinctrl.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506.dtsi
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-ultra.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra-zero-w.dts
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506b-luckfox-lyra.dtsi
---
Based-on: <20261121155810.706866-1-jonas@kwiboo.se>

-- 
2.56.1

