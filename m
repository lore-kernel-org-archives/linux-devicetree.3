Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B63E388E73;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776676398; cv=none; b=GkjKaDLWbL6DMdSDIMONfIQJ5osSbTaGeyM8u/PDdeeoxmOLFgh8dq7gPK2rABejgsIAFClR3RUIVJ3gq2SzuLjZ40QUBipw48ASzu499ao6FfTEk3P1ehgPFCqJTkCqoXDoC7k/tfRnU+ZYDb7zZphwkDLl6aSkce/4ZPIc8bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776676398; c=relaxed/simple;
	bh=CPeLnTCytq5apC3Xf81ylWPoZiJdIH6Sk0OmNhFg2bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qxhp5yP2+qSySk/UuRAxHD3aD3Aoy7rj/iWnCHQuJ6AZ4/xcD1TH5q47MEdcF9+9k7mvR7B2bdakjjblP/UHAOVuwY5wdfee+JcpCCS8nyCD3wVZwXFxPk5mgzOHwsozYXMIBl4El6M9/tGZB1zDdriRxrdPef2n2blPbeEYNW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vwysg1RO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vwysg1RO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DA68C2BCB8;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776676398;
	bh=CPeLnTCytq5apC3Xf81ylWPoZiJdIH6Sk0OmNhFg2bw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Vwysg1RObSfZXXbQDQqleXt0ZaTvT5BJLAzgI2lj3XdWOzm2+FSUE4ZX/NJBEg/sv
	 QbNhJ6scM5l2F++hAD295IjxtKpV1W6odkEpcz67ASJQH2BJK3QGMNTP6iaM53XU45
	 0rQ4mZjCyRnKBs9U/qbjcVEpSn3/NI6xoG6Qtuhr3G4sdvCg/IQF6u5B3kxyoQwvsx
	 QTG21cQSaFj8b/yIrI9CMpWaAiemmhD4g7LTQdVM8SrK2FblCli0gGVGZsfhowbjVO
	 RPTZRo9wXd3AcNJE/uWlM3ZutvW6h0RdA4SCm3fHlqFuGw/RmRTnjTYjk0QPQUPS+O
	 q1hbHTYXIT9FQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15CE9F557F1;
	Mon, 20 Apr 2026 09:13:18 +0000 (UTC)
From: Joe Sandom via B4 Relay <devnull+jsandom.axon.com@kernel.org>
Date: Mon, 20 Apr 2026 10:13:15 +0100
Subject: [PATCH v4 3/5] arm64: dts: qcom: sm8550: move IPA properties to
 SoC device tree
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-rb5gen2-dts-v4-3-b461909c2de8@axon.com>
References: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
In-Reply-To: <20260420-rb5gen2-dts-v4-0-b461909c2de8@axon.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joe Sandom <jsandom@axon.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776676395; l=2013;
 i=jsandom@axon.com; s=20260319; h=from:subject:message-id;
 bh=2Hf81fBazRw+MMKDG2/cNY2JsBcSjh+sphR62doLGW8=;
 b=Q1t/lEirurX5HqzIyviieG74aCBbHvQ5KN06iE90BzciCXl9+iYjtywFC/cMWpYUPdm+j6dJU
 iFgIRY8CGL2B+4mR/iz0/AjuPToFTtiNJ1S3Hpq1wmq+bYWvQ3bLLB/
X-Developer-Key: i=jsandom@axon.com; a=ed25519;
 pk=Q/yflwj2WhkgBVTskrS9Vl5oScD0Bp3vTzDi+OxskTo=
X-Endpoint-Received: by B4 Relay for jsandom@axon.com/20260319 with
 auth_id=687
X-Original-From: Joe Sandom <jsandom@axon.com>
Reply-To: jsandom@axon.com

From: Joe Sandom <jsandom@axon.com>

Move qcom,gsi-loader and memory-region properties from individual board
DTS files into the SoC DTSI, since these are common to all SM8550-based
boards.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Joe Sandom <jsandom@axon.com>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 2 --
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 2 --
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 2 ++
 3 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index e821b731bdc496c872703723df02ae9b9b0233b5..b795589385520acd74eecc7701cab82f4f7da200 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -939,8 +939,6 @@ &i2c_master_hub_0 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index cf63109ff7bf7b6fc827f108e22e82b8b04273c1..f2effa55d8197819175bfd5a89d2fddb20561548 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -818,8 +818,6 @@ fsa4480_sbu_mux: endpoint {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm8550/ipa_fws.mbn";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 54308cbde40732da072177eab533582c155df590..d292dfce6b66fff6cff918b8bd6ac0b9cd22c4b3 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -2730,6 +2730,8 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";

-- 
2.34.1


