Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721279;
	b=a9WbyHbyszO+tw9u8I8KxtwGhJVPc26v42kjeqgJ56diVZsgtIYNCoNUxZdp9xMbA8C6
	 seoHlIwkByBk8n/q5lhvKLGzJvz16kY13iCBVTTHGKbhlkD0D/aUAEYX6t8CMusD1OYW9
	 Hf8yPFBoC4t9ACJFlUj0xFnQ+fhKQFjYwztL2vJsdAAJwNuu1NFKqqmkIMrilsHGeflFC
	 jT5sBZg8Bqf7BK26IkPbPbruLz9ZPJxw4wUPlbzJ2+k3wE+mBFvnkCaMvgRBBxbH45tSL
	 JN1hdqZWwNTuVKaZopNuIDdOoy2sRpK5mN+4z3bMtaMyUPs798ntw27+QjKd4Af6Qtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721279;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Dt1leGuDwrWA2E3OVhdzYv2X+ho/ucBUcti/3VyXxnk=;
	b=M9C98SO047X/KiuJFNJHGQLEak7XX/CdLWphU6PpjpTA5LDZygPY887yfwOPEpz81NCL
	 t1ufANIQhduzfEAwnbnKM9IsaxoiBnx8JdJBPO8pL3Kz63OykoktgkZShQgLKVMhaSMJM
	 QbvMkfx/tYeLSRAuctFiJPK3Z8IUKmcnTw/zI3HB5Lt8aFipQasXfwyasZJS/B7j5bHQK
	 0no5X7cDzk3udkkYMZ+yVR+Hq+uW4oCXZ+YmtAWK8eZCvqyGtU9riQ6oTgY/2Nq3BQguj
	 cm0Y7/ivCWQTRnVG5efVBbxrbKy0D33/oiIxBiJN+4GvkXd0dzFRQqsFOpWq0HERZCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Ib1kjaof;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=Dse0tQzx;
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FEB606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 19:27:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91FEB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=Ib1kjaof;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=Dse0tQzx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795721271; bh=Dt1leGuDwrWA2E3OVhdzYv2X+ho/ucBUcti/3VyXxnk=;
 b=Ib1kjaofffLRqFzChJbFtRw0dL2qomq/Mu9kyrgDMv7vz6R0y6VpL8CYR0EIKU97JxKvkSBXq
 dwJY9K8Vn3L1R/AYY5YZXt2kzJvt/Ln2+EGt/qjonpCCz6gcaUFpNMMnsiFdil2lnVu5Xn//xt1
 3JE1828sIkS0V5hvHjifZnNxUni6fLqYY//zcpTAYNJgt0GXQZubj8Ho+oxwVP/yicOqw3K4W7J
 w2/xzD1+ymahZSFqhLSvidAx+/b497CdgxsficnMj7+7StZDoTUS+9MjC6oBFet9vUtPmo3J6jg
 xDQICXeEqoghjPoQj4YUzEUC6p8B+++s7mYRIwhPRE9w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795721271; bh=Dt1leGuDwrWA2E3OVhdzYv2X+ho/ucBUcti/3VyXxnk=;
 b=Dse0tQzxiTw9C5iA4so93j9IPit74yxaGHfPwqs9KXS95JhWIePjfKixGmT5TqHAX7gx1QIYf
 4OVAih782q97Wivm1EB6dJOmb/ugGqT+qc4UPJK9alPpDlgEADljSUuxxir2Ev7LGXhQ2zx8GTj
 u3XTxpcYJZkSUARwKgC2424=
CFBL-Feedback-ID: 6b088836b69a54ed847adb2c:f6ea4d869c8a42e936c08f2cc48301d0
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b088836b69a54ed847adb2c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
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
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 0/2] ARM: dts: rockchip: Add ArmSoM Forge1 board
Date: Thu, 26 Nov 2026 19:27:43 +0000
Message-ID: <20261126192746.1595707-1-jonas@kwiboo.se>
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

This series adds initial support for ArmSoM Forge1 [1].

ArmSoM Forge1 is an industrial-grade product powered by the RK3506J
triple-core Cortex-A7 application processor. It is specifically designed
for industrial gateways, HMIs, PLCs, handheld POS devices, and home
appliance display/control applications.

This series depends on the base SoC dtsi added as part of the series
"ARM: dts: rockchip: Add Luckfox Lyra boards" [2].

Mainline U-Boot support can be tested using a branch at [3], it contains
board support using same devicetree files extended with USB support.

Changes in v2:
- Remove unintended use of zero-width space in cover and commit messages
- Add spi_nand label to flash@0 node
- Drop rtc_int pinctrl, it was not referenced and unclear how RMIO may
  affect how hw description of RTC IC may end up
Link to v1: https://patch.msgid.link/20261122184532.1300004-1-jonas@kwiboo.se/

[1] https://docs.armsom.org/armsom-forge1
[2] https://patch.msgid.link/20261125214421.1580359-1-jonas@kwiboo.se/
[3] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506

Jonas Karlman (2):
  dt-bindings: arm: rockchip: Add ArmSoM Forge1
  ARM: dts: rockchip: Add ArmSoM Forge1 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm/boot/dts/rockchip/Makefile           |   3 +-
 .../dts/rockchip/rk3506j-armsom-forge1.dts    | 223 ++++++++++++++++++
 3 files changed, 230 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts
---
Based-on: <20261125214421.1580359-1-jonas@kwiboo.se>

-- 
2.56.1

