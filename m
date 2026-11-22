Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=149.28.215.223
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795327296;
	b=XBEiMPQa2DVeUDp1CzXq6SMgXEqaRaKQN2/JxVfT7T7kPmT8VSQLRrbRuThKPv1ombvl
	 V73T5kOTIDl4KsRxTTmJ/KgwAY3L1pZeTAX3EG6Ol0a7daXG3yzsbpjupFJ6SAjQvzp4K
	 kdmVcKV9RmyaThFkGud7xXjLtFmu0DHblziTW9WCsfuqhboOBtvAg1culOEHO1+aahZ8+
	 KmsAUwcIaTS8p4jbZI5WBeml4r1kJ4aTeBRvUlQG1x3g5yVktvba43+UvaP/FUPic1A6m
	 jpmtP7fr9DBv3+1C5Q0kNSYCM7rEsBn55PZTadlYWYmYTe/Cl0k9oTXPuDUV8Q7NFCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795327296;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ke4IgnUz7inY+ONMqxKiiDGn14CGx+ZmqvyLZlExotU=;
	b=U8q2ZA5J8vUoCoPKJUcapzksYuPuCe9EukCgoEBGcKYvQKSNBJCb1a3F8KCaefdoRb2T
	 Pw0xO71KhYvQWojHrZqTdDjIj8i/gg2acbqglWgR81u8KgXZ2/wuwdyAxMBYwuTI/MGEV
	 z+E2N3wpqmT55mYIkDHOhzPePv8G0LCIZtoJD5SS5JR0TMrKuc3Wanj5KDVXh+vAOd59p
	 t3Hw7nRmD0M5AjG6lnTh+8j2dDD1JJWGlbKrWHHCoCDlOAX1KDc3NdFtIIoLRv1NOQ4+n
	 R9fBqo+2w6ghfbbDrO7S0zIYam+2w/Vmn8i7ZT1JzldujphlcXhWT6obTi9Ceq3z1cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b="SIMnqe/1";
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=SbHLWG6O;
	arc=none smtp.remote-ip=149.28.215.223
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0708606A68B
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 06:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0708606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=SIMnqe/1;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=SbHLWG6O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795327289; bh=ke4IgnUz7inY+ONMqxKiiDGn14CGx+ZmqvyLZlExotU=;
 b=SIMnqe/1A+ZAT4miO+N5u14kPWWegl+hFooFbCeaWisDy3sTr2gaWTEIRL58XPHkqGlz9D7Wb
 lIROsFyjyMsMTFOZSzKfkdtZsF7Wq6bShbcVh2UJa6LoeeX8NXka7od7OJyn+frlq/6gQdT4uMH
 svykso6SetvwVuEIJhbeJfWNuT+qN2uzUIFdQLvVxAvv0s/nWgChh7i5oSY/kSVpg3b6RP6QNvh
 3mVF7e1rJBGpmG9/Z1XesjGxCVsXLsATbqX50abJxBwUqEWDFuKLpIo2xbO8kuFVBnnbcQO8Fe+
 Ilg71HRRQ+QU70aEmmyjj/qF+qk1nGGNYX5miLUGJdKw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795327289; bh=ke4IgnUz7inY+ONMqxKiiDGn14CGx+ZmqvyLZlExotU=;
 b=SbHLWG6Oj/yeXr1u+yCKktShGhRyzUBG8EqkwEfQUcnpUgBHFiOcWmEGOO87DZhLI7beJQqc+
 TZZJsbLoSDtcS7grGZRSQ/FJQg/gUYMuJXACBU5vHr3m8F9xU++dGLOXfJIToiZajrTT7W1/YVZ
 hyNfIXOHH1K+8hMd+fxC2QI=
CFBL-Feedback-ID: 6b02852fcff95ecda8c09329:42337bd3833695854f7a2e6fc72dcce6
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b02852fcff95ecda8c09329
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.37
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
Subject: [PATCH v2 0/8] ARM: dts: rockchip: Add Luckfox Lyra boards
Date: Sun, 22 Nov 2026 06:01:03 +0000
Message-ID: <20261122060114.773624-1-jonas@kwiboo.se>
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
and GPIO1. A patch to fix the pinctrl driver can be found at [2].

The branch at [3] also contains follow-up patches that e.g. fixes pinctrl
driver and adds USB support.

Mainline U-Boot support can be tested using a branch at [4], it contains
board support using same devicetree files extended with USB support.

Changes in v2:
- Add default pinctrl to fspi node
- Add display_subsystem, vop, dsi and dsi_dphy nodes
- Add osc_clk_out and ref_clk0_out to pinctrl
Link to v1: https://patch.msgid.link/20261119152055.556266-1-jonas@kwiboo.se/

[1] https://wiki.luckfox.com/Luckfox-Lyra
[2] https://patch.msgid.link/20261120201540.672016-1-jonas@kwiboo.se/
[3] https://github.com/Kwiboo/linux-rockchip/commits/next-20261116-rk3506
[4] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506

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
 .../arm/boot/dts/rockchip/rk3506-pinctrl.dtsi | 594 +++++++++++++++++
 arch/arm/boot/dts/rockchip/rk3506.dtsi        | 614 ++++++++++++++++++
 .../rockchip/rk3506b-luckfox-lyra-ultra.dts   |  31 +
 .../rockchip/rk3506b-luckfox-lyra-zero-w.dts  |  23 +
 .../dts/rockchip/rk3506b-luckfox-lyra.dtsi    | 100 +++
 11 files changed, 1546 insertions(+), 1 deletion(-)
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

