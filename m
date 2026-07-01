Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5923B3894;
	Wed,  1 Jul 2026 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920610; cv=none; b=PPNk5UJtMHRVnqqHzZSf6jTyHjso2HccXe7iTnQh3zLmCnmHitlW35oXH7LIW4601fUY3MvuAI0vxZS2Atgr0n07Ds3IiUfww5MO3C7rRd/9cmnJ+5Yi8fgSVHjeobiixq0HkUAtp72HmZ/G2ikHaJulxtQrReKXu5uKwqg5ZbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920610; c=relaxed/simple;
	bh=gtif1OoHMxEhhG3j3g6okBshbqb0qtgOCA+Az5csT68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gj4U5Gv/2Ndp78ebcNYFDvMbXXa7kM2+1jSWnnI4xzXzy1imbKslBdNjKYcLi9XxEEs4qQDfj7X+nD7PToZ3m83E3y0xNQFr8DkpsCFwPcSnYXx1OyjH0rzBrUvBuJFq5D9Fa5hyShRs1VnzBE3k4MfGaQdROUlWn9qosWuoRnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BP4WLdKW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BP4WLdKW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EDEA1F000E9;
	Wed,  1 Jul 2026 15:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782920609;
	bh=pbPevqBDaQWq8tGCXHFVTyAf/dPYuJeMhHkxM3/SqrY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=BP4WLdKWKPkHaBWpSora99uUg+FThcJZumzuk2evpw1cr439JKmiV9Al0gtBGltpz
	 jBf0ItGvICr3s3SPcyTHc8gSOVRyOD00tvHB/XB4J+eXEqzE6LSx2Y9+ey6mgxA3vq
	 38JmrBGK5ytbveIX1cP0LrQDKTFDqYls96WRMy3sJuoTwGRzIq9pI8vwb3LeSImzdV
	 22sf8mSrQJZGR8cqGQ56X4OyWOqE6FVsDKLf9Kd0hXAcXNKstk8W1ETnrgg04Woesq
	 dTOnfMTQ9OAo129gD16w08tZkEz+yp8LT8QAXEgXmH8KpOntwifzNT9Psyko8ZR5Y/
	 47boIegwLA6EA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 01 Jul 2026 17:43:16 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sc8280xp-crd: Fix the pin index for
 misc_3p3_reg_en
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-8280crd_fixups-v1-2-3fe92ee9636b@oss.qualcomm.com>
References: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
In-Reply-To: <20260701-topic-8280crd_fixups-v1-0-3fe92ee9636b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782920599; l=1025;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=m4Ki/fMAJ7/KgZK7YUWp8LeXJTA+K50a864XICUPu+c=;
 b=hQEc2so4e/R7bB9dlO91iFjuI57m6Raq3skwCLJH/uKGu/RqPvI2R8I6AB0MSbP6DjkNdQ8D4
 CT2+A2xlgrbB19sWpCkEznSVdbwwTo7Q96MN0Y5+jqj6JssJoewvGR3
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The correct pin is GPIO1. Fix it.

Fixes: ccd3517faf18 ("arm64: dts: qcom: sc8280xp: Add reference device")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index adc6d7b7c91b..535abc5dcf37 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -184,7 +184,7 @@ vreg_misc_3p3: regulator-misc-3p3 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 
-		gpio = <&pmc8280_1_gpios 2 GPIO_ACTIVE_HIGH>;
+		gpio = <&pmc8280_1_gpios 1 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 
 		pinctrl-names = "default";
@@ -917,7 +917,7 @@ kypd_vol_up_n: kypd-vol-up-n-state {
 	};
 
 	misc_3p3_reg_en: misc-3p3-reg-en-state {
-		pins = "gpio2";
+		pins = "gpio1";
 		function = "normal";
 	};
 };

-- 
2.54.0

