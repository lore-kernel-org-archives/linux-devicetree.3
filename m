Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537EE3998B1;
	Fri, 17 Jul 2026 11:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784286024; cv=none; b=Wj+lfZeJK6dvFFoAdA2jodz9cSwVdq7XTmRaR3CuZDrVLPtZoQiYI/3dn3YnRqqt1F0W/VdHFINICOohxClprVxLFJDN+kt7xycJgeS3qXVKpmsBoG+LrvF2t9FCbZs+5CwkMgfdWqdGep/3kxi9osKXJ/3bS3PXnlsR/wpZN0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784286024; c=relaxed/simple;
	bh=1gn5jZU8Kpt5k1W1oqoydBgNz7uj6mcGD6bQ01opjds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qRGpcjTN3KbwEHEmM2dSqjpDWlpokPh6x37k7MAw16slC4atUImvq/aUsDwmYneZVayy5iTja35CDVwA2iyMLmxSnWJ3UhMkR13DSHfJ+0LYfM3y4jCKSsuX+8/JC7qDIcDr9xLXFxsN2CxCvZIzIiAV62mHrQzYSjgSAoOrRME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVVkQg2V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVVkQg2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933081F00A3D;
	Fri, 17 Jul 2026 11:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784286013;
	bh=LHnONwBaTw0e5nPal2XWjW+3/uxVJnX8G8yPrKlx+Y4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iVVkQg2VafVtgOyaYhsx0Kinh+kFjx4bCkk01oCKDAzT5KUI1oRiuFkmqtAYAVYIQ
	 Xflm7ak7sK+1tlLcs+F2qdmTa60qjssKXShXeZ3TxWvv5m5iG/1vMCZUCXNEfPSakb
	 mtJleHDJJYOZl5y07qxoAwNDDgq05WYpY0anioFrgBlfSIoYxMDjOcZrCe8J6xudfx
	 vn0D2FeTb+u1ZM15p/J3E3McIvA5KJu9DQoXn6zAoMYen1b6tQFMmTaYA1QSft4oyH
	 05UpX+9WQqZsUZ+QaVHhymjbF269aXmjjgeN1cBFEleTnTrpQ2PDzpxIA+Rm7KV0cA
	 Q5JZQYXG2RGzw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 17 Jul 2026 12:59:59 +0200
Subject: [PATCH v2 2/5] arm64: dts: qcom: msm8976-longcheer-l9360: Fix
 accidental node override
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-topic-june26_dts_fixes-v2-2-797cd46e5d9f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784286000; l=1308;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=aFTJv1JmxduaYzf27Ol+AUdeW6VWXcM9JNhSAFFI2I8=;
 b=VJDOEE60uittGFccS16DlGewe2e52rRHOUEW9ifC0u37fvaS37OcQBPqHw7dvg75MMZEia/Ah
 GgTKWdlcm8YBjTlvVQLLE5Iig7jY501SEnHP5bw3owhNjU1u4MM+1wE
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The active and sleep pinctrl states for the touchscreen interrupt pin
shared the same node name, creating a single node, accidentally
overridden immediately after the definition. Alter the names to make
them distinct and to silence DT checker warnings.

Fixes: 79b896e7da7e ("arm64: dts: qcom: msm8976-longcheer-l9360: Add initial device tree")
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts b/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
index 18832a3b9a1c..57f549f06f73 100644
--- a/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
+++ b/arch/arm64/boot/dts/qcom/msm8976-longcheer-l9360.dts
@@ -455,14 +455,14 @@ sdc2_cd_sleep: sdc2-cd-sleep-state {
 		bias-disable;
 	};
 
-	ts_int_default: ts-int-state {
+	ts_int_default: ts-int-default-state {
 		pins = "gpio65";
 		function = "gpio";
 		drive-strength = <2>;
 		bias-pull-down;
 	};
 
-	ts_int_sleep: ts-int-state {
+	ts_int_sleep: ts-int-sleep-state {
 		pins = "gpio65";
 		function = "gpio";
 		drive-strength = <2>;

-- 
2.55.0

