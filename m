Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793570139;
	b=o7Z/KzFoHVuGaGHxsixO1VGrBrP2BmBr3gNsy9SNMlPHt1Qao6p9YCAEfWkfpSmIMBiH
	 WasJHChZr2gaQXJHHummxF/W+/XQUVXxhnIh++RB6Fi3VKaeszIMVDaFZtrWe2KK7pK9v
	 m12DTkzNzHwkgOW5EJqBi5IGTCt8KZfalHTebKdnCjHMiOv7zCyUsiIfYvR6Au0HBPBeE
	 qgKvlU+2J3lapCfmF/V6xl4IpuWQSwVgDb+JmrGmSGhTuBcHyK4VQ2N0KCxyliHrQ+LK7
	 xGSrULRNWONoUMkLzLigBlu7u1+KAgUSavmacBE795EP5QR2l2BIW8F30Wi0rFqfIYQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793570139;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KUhoy3RuqCBaQi5mrKmv2Xw4b/lvAotKYt6J3VE5Vhw=;
	b=F8s3S6u4vk655sE8LN2jeXapDbNWvN4149GFEYt0I/VqDcuomqlzrx0LYeE+WBuONDMa
	 Ltmy1U/l0CTAoYMaQ9yQLIRXQPmhm8T/4BIwKrk068BFVpoS6T3vLFk4Gx4Sw9+YN2QbE
	 tzhzKYBD+sR9Pb/rHWNaQ+fqpWactcyDuGXDjWN8L9/hdz0cJMLW5nIOM0FW6clBe3Xr/
	 zbAp8/3/DiidisJR9ezp5qHT6Ffh33xrZrcoIb4ROPlm6RnTaVD2ACzKY8W2aQ1NMe0fl
	 jIL59720rdu0/VPowZwMlXRnA0PIeXfTBpQtWxFxG3Ag9Sw9j/8OtL7EXsq58J941cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8mx7koT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A4E606A32E
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8mx7koT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793570138;
	b=P2xgdP7KitemlgWi4aQNMC730t8sgncTFBM0Z7vkuzhpR6NZjqU+5gdFGYaKLJB5sU4q
	 lxG/ml7LP13FhIiWnCJyfQ+pFY60JN+xX6LQSGpvC3lCezBAzoR+Dan2XyPrjYLGyYVsl
	 gCO2O3RUrJP1r7oqDHPF4jNayhELY3R1oaJAcbXK2rBUbI5ZvFJPuuAyCpsjIH5YtCxoL
	 LUCv398LhZ0GteM4CbhVKfNUqhE5MrxsEyBlciwE2EzV7qAI2oYEsKQBjq/rlGuMCVp/B
	 uSlB+mo47JIPLQtzKR/I3MMyxDVPPD8BLbKWmY4g0yPTYirzWXjCTvtLB44KoXcn3Ow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793570138;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KUhoy3RuqCBaQi5mrKmv2Xw4b/lvAotKYt6J3VE5Vhw=;
	b=UKDblCne2Tk6DTOWfTpuxw/MLlORJNeDTL3IDIOfCtCCRpEoBAO0RfvMV6/jUtoLziPk
	 yalhdC/JthMfgDjnXE5DqBB8ybHuTGx0yBPyx7Z3LYxr0X7Wk1KOCxXbIHnCpnWV1zGKf
	 Afqm3b3W/TET5CFPlcbltmZSZ1xypOAAUMH9Rt/HKNlX1m5aZ0ZoSerkwst9TawRAPhcd
	 3k5C9xE4d5xpowVb760AIcDCsy4NuOKCwbnemGF3x6NcnXuwnHuDGok9ZcAdrb6Z+Xdie
	 tNR+orJjNTpO/L1lssC03MnFFRufWBmbc7OnqAdAT7yXpUqJs6tgSbLsFE00U3k2UEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7ED181F00919;
	Sun,  1 Nov 2026 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793570138;
	bh=KUhoy3RuqCBaQi5mrKmv2Xw4b/lvAotKYt6J3VE5Vhw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n8mx7koTHuVUDWORMaiOz3tIGt01gMny7ZoQwOSJS/TijNeDQ7ZsZQ5xpJBqcunow
	 uY3kYmYPq2bdFiPnI63Ru6QpyyfV1VNPObI95ZF1+H6j+Od2lnZp0OU8bdYhRuMQP7
	 /y/oiGtcm48aD8eT6bTNtNwoqWKGfzzAmBBRoAX6cVLNO+QD6wOK42oszZnSOVpue0
	 m1nL3hovlHZAavgMtLcUy0aHx7h0gWrSMJGXUp3/I0+ofiSP2ZrlB8Qcl/xy7Zd7GN
	 oBAcOfcv+Yvweoqray37IEIbkTf7lQonNjrX+L0xW6cYpAN19irvgIEJB9tw4BYXd7
	 Vl/Y4XQXzh8eA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E28E046260;
	Sun,  1 Nov 2026 21:55:36 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 22:55:19 +0100
Subject: [PATCH v2 1/9] arm64: dts: rockchip: rk3588s-nanopi: fix sd
 min/max voltage
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
Message-Id: <20261101-nanopi-m6-improvements-v2-1-a24769efda23@gmail.com>
References: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
In-Reply-To: <20261101-nanopi-m6-improvements-v2-0-a24769efda23@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, 
 Diederik de Haas <diederik@cknow-tech.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793570136; l=1052;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=httrn91OQ2U6CqTOahyrbkVOu5oMQXSvYoVE4WvhaW0=;
 b=eY2gTPAhWjUmWCOb7jjfwjV+hp2i6v14P6f55coA02s3gfdh0sY9Tr7Kvbc0bxitA6gL5h5pv
 TYtYCLvNb9XBj+RwjJy3+WzDttbRjS9hNooTKe211Zr0vr+rh+fa3/D
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

This regulator is only a simple power switch and cannot change the
output voltage.

Fixes: c08257d642ac ("arm64: dts: rockchip: refactor rk3588s-nanopi-r6 to support M6 boards")
Reviewed-by: Shawn Lin <Shawn.lin@rock-chips.com>
Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 22b0cdee22b40..8c36268e98768 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -79,8 +79,8 @@ vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
 		pinctrl-0 = <&sd_s0_pwr>;
 		regulator-name = "vcc_3v3_sd_s0";
 		regulator-boot-on;
-		regulator-max-microvolt = <3000000>;
-		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
 		vin-supply = <&vcc_3v3_s3>;
 	};
 

-- 
2.56.0


