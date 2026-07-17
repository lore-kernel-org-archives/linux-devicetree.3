Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63C23F39D4;
	Fri, 17 Jul 2026 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286035; cv=none; b=g0MCaFKWvHr9RNgnqCY3LxLvr83Xq/hczBNpYtIk4LcSvf5ErDs2a5ovhyHpOeD7DDEn2n0ezB7l0+s1UqgOUt2nT1dT2aGQNFHopjXtuGQGhUY1/QAjTLLWnmKaTe5w8NKFN2796N0DNpicwk0o0Xr7ohqdA/TfpXk8dbB/Ndw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286035; c=relaxed/simple;
	bh=sUegKNsCF6rLsobN92I06SpzVjlIzOXm86CONW//mlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TGEauqca4BtMnO3l8qYSQNI3fRMWFOt/11a9YOy+bRDtM7Gh3Iq4GNEUTkpqVYoBvFTwKBhFfEyDVMJQYUVXRIFcaKbKfuuggL4tnG9fZSpP5xGen12n//QQYscZoUpFQq14wlVEcJeSpBt+3lGmjdWnxVUTLVs1i+KSlu1si9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M5bz6gqG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M5bz6gqG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CDCB1F00A3A;
	Fri, 17 Jul 2026 11:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286026;
	bh=4srcOj6G+mUskQytog8LXd6tDD+Pt1IezN02Zg0HcBY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=M5bz6gqG4I8RagvYToF5BUKISqhySnOQXLhcQMhmXNzAwaN4/lHxTwi4GoxdAFjTg
	 OGU2MfKrayTCGNFYP8BGXQ84Cs9buh8vAotzviBNtM/Ll//uFCZcd89DsJQ7jFSF7A
	 +duJZG9SVESyNIEwJOhEzXaVBsqr4/QtFYqGFDqZW4ZGi2Z4IrSrEcnXf3PsOIbflp
	 OpT58L8/GcDFLmcV+OvJaApP0q2y4T2FugI8gZfLp3giuK1KZHTLbZSbsuyM/70roY
	 0rjFa/cFEYLZ+2PTd4C8ltDKGzm6QCvfRNur6glX6Sor9Qr5BftT8k1rAZNx4HERw1
	 iCgNuSva2x6Hg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 17 Jul 2026 13:00:02 +0200
Subject: [PATCH v2 5/5] arm64: dts: qcom: talos-evk-som: Fix BT RFA supply
 name
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-topic-june26_dts_fixes-v2-5-797cd46e5d9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784286000; l=841;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=eTMRt1SQ3yRl6IXZq4mqGGHmUbyUph8eneP/urjdiVs=;
 b=FQbOKoF5P+SHL+M13E/NLfkpQnKz4OZPeDZWF4etEV0BLMoAUFtD1/KrmeVGcVem0p3tCumNB
 33xdetQo94gC380VoRqmE4oYpiCs0CdyqMDApD7kCcQuYishzaJ9uVW
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Fix up the supply name to align with qcom,wcn6855-bt bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
index 6d2cff3cf23c..a057a7271480 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
@@ -535,7 +535,7 @@ bluetooth {
 		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
 		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
 		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
 	};
 };
 

-- 
2.55.0

