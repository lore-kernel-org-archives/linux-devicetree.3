Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E930B403B09;
	Wed, 10 Jun 2026 11:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781091841; cv=none; b=O/AVX1BsiGMfBbrxaJFbUeMGDuFpEKizIkjRa3WPJS4MeGSVW+824eUHdPKr+L2KYa+/qXzvI+GJdKgqeZaiWXtwPsTJw5JHAQOP2av058uK07Xm+SJqsvmFjuqiwRzKNbFl/24eRkuUXMCd8DDaa9sver+WHrpJySFLl3sDIPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781091841; c=relaxed/simple;
	bh=OvO6vLRXyJDNLP8bLEQAIFJBN247vRVumNJYdOzxHVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EaJhVFRr7qzc+OTjUi1LFQcg8CkA35LsMlFZWZv1UikyQsUqObtB5+GIAQ3hRQCaFQqrL4NqpdCaqzX9CRPViwzv9WAWJ2Dphyqjo4qba1pugezXNTOQ3LicAN6IOfZi4tTHadOR1didCHAR4gOTzFY0fLXlaSBEvOAbYAwqtt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eqk+UP9M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eqk+UP9M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91D31F00898;
	Wed, 10 Jun 2026 11:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781091838;
	bh=K0jELDYMU+kS91YArcWRrjgyrw/8KUjt3+T4n2Vb80U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Eqk+UP9Mq3lhyYU5JmzL9+Jj7TC9MktAfNccoSpJyeU6iGvLUJwlBVmFIeZ6xu8+5
	 KuxslwvFptqpkOvpFC5qc1/zQFtvMzCOovPOXPnrGg2wQ1huA2MpUdMoE9WDdPo2HM
	 RioEC1jNSEx4IzSlVRneIGW0yTl7mZxx1fD41lsYs9xT0C0QcCUhnR1Ot2sUrO+seI
	 6W70fCe0lb7mJ+TpuUFDYteeLqcDt4xOjGZJAkNb1tW74fseF4e0RcwBtvtVRykS0m
	 FvmykhAv/M6DdTxGO2q0OvdKvHf4oI2/68grmUOVTr7/ejlF5eFYAGjSKwy5kJMQI9
	 WygGuIFmlRfJA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 10 Jun 2026 13:43:46 +0200
Subject: [PATCH 1/5] arm64: dts: qcom: msm8998-sony-yoshino: Drop extra
 bias-disable
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-topic-june26_dts_fixes-v1-1-2e0c953a6c08@oss.qualcomm.com>
References: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
In-Reply-To: <20260610-topic-june26_dts_fixes-v1-0-2e0c953a6c08@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca@lucaweiss.eu>, Gabriela David <ultracoolguy@disroot.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781091829; l=1063;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=0DXKxcyvNIDsWj5cwtHSf4cRpIqy81OE0w9RFoGjKSs=;
 b=e+LEmu6qJoiLwcm3fsPeJNpLU6uUIE0jPVd1NPhyaN+797TCvV4UesZroUQz35QrIu1yjcUb/
 n5RR+jPQPMzBiptKBMAjpshBbLwdAQkXl5sigojwUcFUiW1pCFHRoSh
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The msm8998-common i2c5 pin sleep state is defined with a pull-up. The
Sony Yoshino DTSI attempts to override that to bias-disable without
removing the existing bias-pull-up. Remove the override and use the
common definition to resolve a dt checker warning.

The change itself shouldn't have any functional effect, maybe except
a miniscule increase in power usage. The defaults may need revisiting
at a later date either way.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index 3650f2501886..04d4741cdb5f 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -229,10 +229,6 @@ rmi4-f11@11 {
 	};
 };
 
-&blsp1_i2c5_sleep {
-	bias-disable;
-};
-
 &blsp1_uart3 {
 	status = "okay";
 

-- 
2.54.0

