Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793570478;
	b=1DC+NJ7PngNBOFvxEiM3xiVAgQ6C0/3CLkJ4HKEfm6IXPQ90aMLRbpJEfNRNWgKGC+3T
	 gjFPa4nuy1QMcrm3PSXTpr/GXS8i65NDv7aRP6WIZ+E2UmIyYakyR3Rev0oAmWhpu/jOx
	 eIFABahrx04EyU42YgIZCgBllukSjDzVqWk2oupEuZCiMnaZBeNVSUCJDS6PlD1vxQ3Xo
	 QlKjRgHXEVk2nojDLpt3MMAo4vg+7BEpR1XmO0jSYdmbU1i3U/XsGPmPnqtLy0zyakMkI
	 9gXAVW18KM9+MjBrPvaHxRlq9eHUWeHW1mpT9VrTP09qC29HxcgSfSGJX5XTSDXuPRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570478;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6PppkLHzhftU1CpGaVXNcPy7ndzJqJy0rOwo4bwxoSA=;
	b=fHy0DrRRguaATmo0iPq8W8nSAV1NZ6UanbdDKDEYEsNo0XVzpFoFjAkZoa8iVvmFU021
	 klYS3yI5y/boxI7zkIxtdUlQ8gkvtF4/6ypH0s65VuGRETF2zxd38zafXj484QceNOpjK
	 fvhdJbBea3+hN7wuK80B+m/nmEgDDkF0GXEaZuh7CkXrJNQyAKrsNcU0/4R6sAQA2u0cC
	 Fo5N9jJkoMwAUThMemKdBbaD0c5GMW/817X0dPDVRiUk/imPA5eToXdAqz1y1Fdcg10VK
	 kjFZ3NiuVPXKenzf5eCpd8Bys6b/xWd6YrPZzbR5I0V2y3OfJJLN6jwwBeKCW4GSf+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lf+UPqIz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF03606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 22:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lf+UPqIz
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570478;
	b=wGONsqRXjGalfHxQ9t0uQI4rwcHlbzBlKsQYGpU24fqKM0Pbx1x50n5XDsMS/5qXeEMo
	 YEzhLyxb7V+Tm1DdCFW8Ex4AbIltYOIckjqkD2ghN3/JTEBk/ijHyl+WVVp5pYUUbkHuM
	 HnV6AWt8m7B1hJg6Jb1FEFn36EzyqWsemcPdM0/Q/2dDjl4ayYul0ItaosRE+9XDFs8V4
	 rkYqXNY2xbw6Zev8/Cv5cFsyqtHTc0D7gMNS/sNC4uCUQ7C0ut53VbDHKFn1X9gPwnGw9
	 rOMGbXzGgb6+IpLcoIcage4JllygYwJOofy/EcBHrg1r1iTVwKquPeHYppPs0j06R2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570478;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6PppkLHzhftU1CpGaVXNcPy7ndzJqJy0rOwo4bwxoSA=;
	b=vin4ZzNZKRSDdE12+cyPdD39CIswyVidxYjlPr66OjaP0fZBhYRpCtthuGzUG15Qw7F7
	 eTDBznGBZgiyrV47lESEIoU9KS8wk1aIaYqYFrHjUam0yMmXMA9gmR04JB5tIMs0WzDw3
	 U9xt0yFzueoCnQxypY+Zly4FVmJCUnur4P8yCHgRjQtaV5hPM0VAzx3VBFKPvAUGrHomF
	 4PUPMXbUaLCx9nCTZt3py7C9avTmTokkZ1Nv2bsvoW8doD+yon/oocYoDaCmv6AGTV0/J
	 gRJqzIQ4Sanxh3fTiNLSNQrQMX7ox54P0TBBX+PoXFP8dsSRFNsKVL8QoTicl4GvxMw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93B521F00919;
	Sun,  1 Nov 2026 22:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570478;
	bh=6PppkLHzhftU1CpGaVXNcPy7ndzJqJy0rOwo4bwxoSA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Lf+UPqIzUW8taX8eImjy2725bNO8W6SqZCBMBno8xyAR5urEgST8cWpxmAcl+5aCE
	 tXsil40d19mhOQ4Cic05sfz4GxNFKdtZXnZ5thhTU4TnrionCdJB+EtPjclZiHTjG4
	 nr6KvMLlafhf0O2j/xfHgyQwfKEx2ovrVsK/WCgRxkhyGDF30iViNQ6dXrX8vtSAUN
	 TFksHrQPZ0ClDyiJXN42Ka7aJRVfYKWnRSlXLGYju4qTE0J4xP28sGpm6z0f1SPBSe
	 N3bNU3THYROjFJuZrtCWhLdo2vNOkKzJIFjpqLb3ZwbAHA9d5TNBERTmPGWdD3BFps
	 YON1k1W4moe0w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1060F462A0;
	Sun,  1 Nov 2026 22:01:17 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 23:00:53 +0100
Subject: [PATCH 2/3] arm64: dts: rockchip: rk3588s-nanopi: switch to
 generic eth phy compatible
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
Message-Id: <20261101-nanopi-m6v2-v1-2-e401ea64b394@gmail.com>
References: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
In-Reply-To: <20261101-nanopi-m6v2-v1-0-e401ea64b394@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570476; l=947;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=LlnCbbgiuToElbilUWpX/P/5aagrWhUu+VZZ4pw6CDA=;
 b=6r49hQV1GiJbQRNgRFAS/qwjocmblPV1giqOE2nGW7zep3X7dR33B7QnaJGZLo/P/d+Vye0VA
 NCSSWtlwmbBAhNQNJwAYGj0ICgSkGXI1FJpnp3xDj+EJJztAoUgD5on
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Use generic Ethernet phy compatible for all NanoPi 6 boards. This allows
us to easily support the new MotorComm YT8531C phy used on NanoPi M6V2.

Note that the Rockchip vendor DTS has used the generic compatible for a
long time.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 22b0cdee22b40..4977ccb668f39 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -269,7 +269,7 @@ &i2s5_8ch {
 
 &mdio1 {
 	rgmii_phy1: ethernet-phy@1 {
-		compatible = "ethernet-phy-id001c.c916";
+		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <0x1>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&rtl8211f_rst>;

-- 
2.56.0


