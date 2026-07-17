Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30F839AD51;
	Fri, 17 Jul 2026 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286037; cv=none; b=o1FLgcRBPmVxiwYAcYNWdDSqLFh+W1jbcc3yH2v+VDSpdNgMlGHDnf0c9zwFclfLavIAOmZ/R6sAJnyeDGIRZaxP+h6erAhkLB2mugM7AxANm/ydb6Kq92zMOoooZcx40upniNwa72gT0BXD1B8CArOb/VzJDlXjdX82ZKxdBMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286037; c=relaxed/simple;
	bh=V7SapS0BruEobbiXITZJJGj2Y51FNtWmFLVuJ2evs0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=inYy5neJoTB//ioQTp0ofp7Rzehe0eGPl5kRqNSUFOelMiYrz38lARq9M4MrutM8lGBDR3Ey5vitOXyhON0vwQlYyZ4HwlWbINe1hZ3RMqlVWjlYQVQKXZ1Fv0uS3WYZT61aoxeQAhypQ0sg0TgKJIJdcSqebL4FUY6eEbKUAVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJzBrJLo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJzBrJLo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643D11F000E9;
	Fri, 17 Jul 2026 11:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286022;
	bh=AMCcUfGITNZzZaRp8jtcUJFaWkIKYyCgIoQhy/elzGI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=JJzBrJLoUjSBgcew+/w8CVocUOdns0ku95XpYfXjQ8QcTdzy5bxhtwt/mXYwKSUcl
	 nUSc2VVrxE/aq04igIbXz/vOMFTN8L1ikNy0rkoMhgORUAsD9AiTsmEI20DP+1Q/34
	 e8uiBl+1V1jgKe9src0O7FiHQsbnnPyZO9056RimfqkaUmVGYyFR16VJDZXIM0ZfAK
	 rkIjFiBN4lzzKOqdJlVcyoQBDOvHJzhg6aY2F/1Duc4ZboMOShxW2p2OjBruQaKwWP
	 lHaaPZuxcmNFCvUA6RWpzr7xIzkZ8TrdcBg3rHkR7W59ZQrT3DPFkkjuCAWKDtqglB
	 39XXzkxj4AoWA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 17 Jul 2026 13:00:01 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: qcs8300-ride: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-topic-june26_dts_fixes-v2-4-797cd46e5d9f@oss.qualcomm.com>
References: <20260717-topic-june26_dts_fixes-v2-0-797cd46e5d9f@oss.qualcomm.com>
In-Reply-To: <20260717-topic-june26_dts_fixes-v2-0-797cd46e5d9f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca@lucaweiss.eu>, Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784286000; l=842;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=ibFploazir3MXEFLcPVYX9ZIT/3eQn7Tkc6omZuu9ZU=;
 b=z5BScDXqBAvm+9psNsQzM1mpcpT/ytzMZno3jr8RqogynwUzObuyIO0dBsQNahZ91UVt9XDmS
 IEeLjobkGbiCntsPVpxgpV1okV/VKiHtn3yFbUMmHd1zekCJbNj7w+g
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with qcom,wcn6855-bt bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index e9a8553a8d82..1ff39530ea3d 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -837,7 +837,7 @@ bluetooth: bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.55.0

