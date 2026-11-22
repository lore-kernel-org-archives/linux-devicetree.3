Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.66
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373169;
	b=XMWpJNSTl+ERPc+Dsa6KtGRC6ip9lBL5u+gDpQI1GEWzG2UwJW1EdaNCPn3dW7EHUx6x
	 VGrErT5A4prQjwxhYkq1HYlGquolvwf6HUjO+XYInSHalVjhSZeyF8ET8LxDL74u1ue+0
	 qFkWAtgBloQpmxgix/Seq7OqGOSmG0SM6XYYLY7ccfO9AopbTwCWrs+D5izDmsIXsWpk5
	 WNxxr+nDdJpRtFR784Car8modrDAbYE7g7QZbko9DR75Dc2moSmkyb6g+C4ZVWIGwpd0/
	 fgEfgWt1Li+dWsIn/jZp5UpyaDFAGvRHnWtVJEsSrwi5qHlFQ30oCmorIRsY/RjSpXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373169;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JCpUg1xfHA0B+FJKSad8mtJycKAl0PWQ2N3i63PPRWk=;
	b=sppTLbMhXZvRPAyEswuaeo900JAmdHyy2H1AnMbYa0DLgSHllDeddsX5Vm8/yn8KzFrP
	 iDcxyX2yycoeDJ+/1rm13/LHEKsfOPYtvZlIW3aOTVSUKbXoT55GCLRd7XvES2D07HNpl
	 JbxVhbyLqMsYKKYCvfS6+zWHmiH8SiZyqckEbqHkjDvy2lYheYuXSgECBQSdMs+LrcoEJ
	 bxD97bvP154xkhYOltz7v85dFQFPquK8G1F+qtar5huk4WHuBw0fXrMpWjviEQQ83eVf5
	 Dvipxryx/nAv73oif564+ghYwOKcE44cw9SrJbm9n5c52JJ71qbxFD+12XB9HKAYyGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=SmbMNYph;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b="E9av/SOw";
	arc=none smtp.remote-ip=121.127.44.66
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D9F606A330
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:46:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D9F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=SmbMNYph;
	dkim=pass (1024-bit key) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=E9av/SOw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: MIME-Version: Message-ID: Date:
 Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1795373167;
 bh=JCpUg1xfHA0B+FJKSad8mtJycKAl0PWQ2N3i63PPRWk=;
 b=SmbMNYpho9HvB6FxSZwegwXPcy1QTBV2f2AGwJy2yUwFk/tkXReGSW6bDbRQobYYEDReXJ805
 vVpRZN/Ou48Em7bf6Xg9PXodmAIsUDjZzoR2sInMO+jej6F6VhG7wJ2WketGsH/Y6h1at+qAV3o
 9mcpeS6YPkpiEysTm0QDghCtYttaZ3NJ528+HCgGwvohxArwIIjh2NWm3OmSkyEUas/w2Xpu4wC
 z33PmIQ+A2J33J6X+ZwdNFUnMT2vkOVrPwD+G7Fk/2F8Z7X6g0eBrS2TLMNGh6GEKb2GAnorUKc
 soITI1504k9D3GaFBccDGv8R96k4obHBNSInihYen+Aw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: Content-Type: MIME-Version: Message-ID: Date:
 Subject: Cc: To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt;
 s=default; t=1795373167; bh=JCpUg1xfHA0B+FJKSad8mtJycKAl0PWQ2N3i63PPRWk=;
 b=E9av/SOwdFmcm7MY0KDYxlV+lTHybXgkA+/nrumf/oKWgBfjoqw83buK88ilf6eifFR89hEJc
 5mAq2h8RJnyerBTiUOvxacvLrmIQJDFrNvyA6bW49xn6Xro3sBq281L5Cjmkh/ViVdc4rxfUwTs
 xNtitNce+BC/p0odq8tOdWQ=
CFBL-Feedback-ID: 6b0338504432eb7754305b22:d73f4f47d606828bdc09bfd0c059efe0
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6b0338504432eb7754305b22
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
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
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 0/2] ARM: dts: rockchip: Add ArmSoM Forge1 board
Date: Sun, 22 Nov 2026 18:45:28 +0000
Message-ID: <20261122184532.1300004-1-jonas@kwiboo.se>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series adds initial support for ArmSoM Forge1 [1].

ArmSoM Forge1​​ is an industrial-grade product powered by the ​​RK3506J
triple-core Cortex-A7 application processor​​. It is specifically designed
for industrial gateways, HMIs, PLCs, handheld POS devices, and home
appliance display/control applications.

This series depends on the base SoC dtsi added as part of the series
"ARM: dts: rockchip: Add Luckfox Lyra boards" [2]. Similar to boards in
that series this board use the rockchip,rk3506 compatible.

Mainline U-Boot support can be tested using a branch at [3], it contains
board support using same devicetree files extended with USB support.

[1] https://docs.armsom.org/armsom-forge1
[2] https://patch.msgid.link/20261122060114.773624-1-jonas@kwiboo.se/
[3] https://git.u-boot-project.org/u-boot/contributors/kwiboo/u-boot/-/commits/rk3506

Jonas Karlman (2):
  dt-bindings: arm: rockchip: Add ArmSoM Forge1
  ARM: dts: rockchip: Add ArmSoM Forge1 board

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 arch/arm/boot/dts/rockchip/Makefile           |   3 +-
 .../dts/rockchip/rk3506j-armsom-forge1.dts    | 229 ++++++++++++++++++
 3 files changed, 236 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/rockchip/rk3506j-armsom-forge1.dts
---
Based-on: <20261122060114.773624-1-jonas@kwiboo.se>

-- 
2.56.1

