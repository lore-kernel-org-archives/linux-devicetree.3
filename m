Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793825995;
	b=mSjbJRZvtPH72V4T+E4HHRvlwbArJ7/Oz0N4q8S92MFJJKypJT30gPhsEQ9DBcOmLjcs
	 szNu17LwJAVU6XoKs6goh5/hR1RaF567DfJAyrDhnOUi96vn2C5qgoKHkSm5ZIsebZnn5
	 5+VrCTHI901hNwz/SeCrWSj1nHhF9TLVzUb8LtlEwqgMqCd1o5GVgntltMm0iFU8FZW9R
	 wMOKRz7PQyXRBlm7cBZq/CqF9IJn2kJbb0y226fCC1KOoyn4k2VXGD+7Jk+iO38Z0DfKd
	 xF+4LoZRzOhUmv6vi6YfYRDW/qw403LAQVQcF1al9q23IulPWW7WhHBCYc5MojmEkxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825995;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3aOVg6Jv5IJ7pOKPAiSDagHYdcalZogEnpnCNs0L1Ys=;
	b=bEH9G+EJCX9hof78oI1LDWAEsqDuhAncISPep1ZJBFWhSUKuSmQw9RTn+6dGeFF5FDiZ
	 fVkd6no+yDBr2TTHblT3YdEDSLZ18JahnRU42TStvgHJsd1vGFjxIat+R/mDnJWAehDeo
	 a88Krhk3h5o/NzhIGmzIMb6StDvc0gu8GCKl8iz536n9YYN+zoKnOWf2BqzM1biTJoZ2F
	 HYgakOoWFTpl4AuVxP5pSylsA75ZcMHhe1FVgWJO4GFKJWmtm0tUbyAMLKNTQH4S3ks3b
	 b0AN7IxyjG7AAZqqRZU6iKiYh1V8NfRIXoi87u/m2nBb85T2HTAXF4Jx1Opx/K3szkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cTcB/kjj";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A4D60E752D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 20:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cTcB/kjj
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793825995;
	b=e8XE2S9Kqm/AqccuTOiEdwmpvcFnB6DpbG9RrfYaEhm5b1D0YpzhecBEebFIOd1A/8ON
	 4KsfOB8jZdiESfPrs3ciId9DYNQDezouMtHgdR92qlUtm6cJbLZ1YCuYVw57mZHm2SAQR
	 K0OtH6StPNTrutXaGaAwBDSUT+N/jJz1aq4AcgP/hJlMivkWh6B/huGnjAyn6n+4m9Lhj
	 2hX/srEcibMbLzPnym6GpKvs+HkhOFi1qcWB0nVqMH8ea61Dw+JyQb5Odny715jV65zEJ
	 WDcZfzmprzMXxi0SyVhol2LTRj6FQR+8dYnepJc2+RXXUjuL7WP7JEGoaDSXpAv1YKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793825995;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=3aOVg6Jv5IJ7pOKPAiSDagHYdcalZogEnpnCNs0L1Ys=;
	b=bz9eA9AP8GGiLvfqSZnGfOqUU5pcRPJSMwCQ3r+p3YjowVCyDXPtKzUyhYbt9eonFk3L
	 qgGv9bRUckOQGNC4wdRJIBXUmzAr8W65+SiSYeuXxioZJnP5hV+Yxto0YedwI5Yk67Ndh
	 9DADrosXJccUAwfRLUKFhnE9wAV73icMstO7sjQhWE9eObuA84GW8BfdPLxZMxFdtwAhe
	 PLBnJTUsDTXuPggQrnM+L/HtZ4s2m5i69Jl+kShHkXRsQ1csmJwtybK4F7+NGc8ignJBi
	 uVLU8UVRWWaA2Sc3vF18glP0gE1CKn0Yr7qBLOxOTaNkEGoUkGLnPEZ7bK62fImRoMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8AF461F00A17;
	Wed,  4 Nov 2026 20:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793825995;
	bh=3aOVg6Jv5IJ7pOKPAiSDagHYdcalZogEnpnCNs0L1Ys=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cTcB/kjjaAOTRojOfbGuAE9Xc3+jP17RXDaShwLHYSbA04RbKyIQSa1QpSOVL4obo
	 IZO9zJPBmxb4fEh8csHz3H00Fgv9oXTV8ujWJmSWFqz/LqzN3Ex9Lz6FpKrkeKB1YS
	 slomAlUp7cjDiSI/le2u/VzM6IhqbtjKocgEYHIXrDJCobk98ONtyIO5awJhzMhE6t
	 uhie+7oL6niJO6KHlU4/4Eq4UbO6tXcFtqr2R9Zy65M5lLq/bu4cEi7hsffjljpGVL
	 4Z24Kup7wBh/Sh5dhZaIkekqVE4Fq4oC+nABvmBponUXSmPxeJYAX8uAR+AwdvCKVM
	 Mn7S44BLjC8pw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DF61E46FA8;
	Wed,  4 Nov 2026 20:59:52 +0000 (UTC)
From: Joachim Eastwood via B4 Relay <devnull+joachim.eastwood.gmail.com@kernel.org>
Date: Wed, 04 Nov 2026 21:59:22 +0100
Subject: [PATCH v2 2/3] arm64: dts: rockchip: rename rtl8211f node on
 rk3588s-nanopi
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
Message-Id: <20261104-nanopi-m6v2-v2-2-dfcd8714f48a@gmail.com>
References: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
In-Reply-To: <20261104-nanopi-m6v2-v2-0-dfcd8714f48a@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Shawn Lin <Shawn.lin@rock-chips.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Joachim Eastwood <joachim.eastwood@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793825992; l=1185;
 i=joachim.eastwood@gmail.com; s=20260701; h=from:subject:message-id;
 bh=pWt2wGDRaet3La5ROqFeEM38kPjTG/xpYp09IgEaEV4=;
 b=h9mpAPPDWCb2M/8J68l6oAiREZZi0E9GNx4DlfyJ5aR2pmuhVll37ItFQgm9eBWeY24AgNnds
 89XjNu2oaJjCCPl8DF0oGY9GZB14TqA0ND2LaPsGwIpl8HWljeJpqXo
X-Developer-Key: i=joachim.eastwood@gmail.com; a=ed25519;
 pk=ZN/8xWtdYaSd5oEfloYSZ1a+/ri0n0VZqjlEeHlbXFU=
X-Endpoint-Received: by B4 Relay for joachim.eastwood@gmail.com/20260701
 with auth_id=846
X-Original-From: Joachim Eastwood <joachim.eastwood@gmail.com>
Reply-To: joachim.eastwood@gmail.com
Content-Transfer-Encoding: 7bit

From: Joachim Eastwood <joachim.eastwood@gmail.com>

Since rk3588s-nanopi is also used by M6V2 which have a new phy, remove
the reference to the rtl8211f phy from the common dtsi.

Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
index 2789c3d9bcc40..4edf3728e8d17 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
@@ -307,6 +307,12 @@ &pd_npu {
 };
 
 &pinctrl {
+	gmac {
+		gmac1_rstn: gmac1-rstn {
+			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hdmi {
 		hdmi0_tx_on_h: hdmi0-tx-on-h {
 			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
@@ -344,12 +350,6 @@ usb_host_pwren: usb-host-pwren { /* usb20_host_pwren on M6 */
 			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
-
-	rtl8211f {
-		gmac1_rstn: gmac1-rstn {
-			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
 };
 
 &rknn_core_0 {

-- 
2.56.0


