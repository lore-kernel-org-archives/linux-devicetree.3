Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7DA38D6AD;
	Tue, 25 Aug 2026 14:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666872; cv=none; b=WXbZfJSkegqh6tQRRzb/ppdwMGdfskNUmVMalciaSbrV6NEAfcHmrUl3rGlMxt3tUhFYYKEzGJIK+LmpmOC9Uvr1/gWsxKq5KHER3CdPE4yc7d6+Ckah7IfOCLwujmKXZVUPtnFwE6n7AOSD6v9hAeCAPYBN2WK4rmBKH4mkRkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666872; c=relaxed/simple;
	bh=elVGgbEpwGybCvuf5wv1HaOcw7/CCmdZgx3ztVqtZ80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SiXWDExkFo7h4YdKC5fvTIt6WvIEzpHyaOERHVcl0DN+UtwZBIaZlsTrYXf4yCheNuAjI2eA7pPaesG7U6zxZIEB3gKxa2ohmM/tQWKKZYyfW9OHeeCm2Js8Z6hVLo3b6FD4HzdK+zQRVAJXH+XKjjEnxWj2A4sHphZF/f9H9u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbBb7Yl0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbBb7Yl0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A791C2BCFA;
	Tue, 25 Aug 2026 14:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787666872;
	bh=elVGgbEpwGybCvuf5wv1HaOcw7/CCmdZgx3ztVqtZ80=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kbBb7Yl0qsoNlkGh4nFjxGdqnw/zs5jqyJYu6SBUZdh0U4Gsy78kIeBucfPfObU2w
	 NFDeh9VVEBh6vOISAihdlnZ/NNNmMaQrb8WCYfBk95IrjyiCXcRI3dzknDJ4yKj2/s
	 QDykXac8u0oJUEebPj01A88S6LCC9FVz4NI0suDc2YP/TulLDivc49V24i6nMx/rh1
	 ZXwD+bEzjvaP1rF9+n1uHoN7dCyVVmuaRtdm8w5mCsKjJ4EZn6Xd3oZt7bx+ich6fV
	 ZN9YFvyrKZgYTCbuZNqwUCINe5tOqQ75jc9fZhkLRF1b8ua4c1Mn64lSk+Ld6vu3af
	 juU2PddWms/tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA1DC61DC2;
	Tue, 25 Aug 2026 14:07:51 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Tue, 25 Aug 2026 16:07:46 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock:
 Enable 4-lane DP altmode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260825-blackrock-audio-v2-2-659cc4724d57@oldschoolsolutions.biz>
References: <20260825-blackrock-audio-v2-0-659cc4724d57@oldschoolsolutions.biz>
In-Reply-To: <20260825-blackrock-audio-v2-0-659cc4724d57@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787666870; l=2296;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=UOYmIKEvjesIgzM9RnafIQQv3nkJi5f0ENtDPOfY/KA=;
 b=Ymt877u44T9QDIPfPY/byASOzTcJmxgEnC7hQ5ZlRYocOj87YaekyznvysD1F846ZCLmXJJ3P
 WOPRIs/9XbMAm/Ki0gfcQggTlM0SlNndCtJ+4AZzCuWnGspPoKNcVki
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Allow up to 4 lanes for the DisplayPort links on the USB-C ports and
the mini-DP connector. Add the standard link-frequencies and move
data-lanes to the out endpoints where required by the current bindings.

Also enable mode-switch on the QMP combo PHYs so that altmode events
can reach them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 13 +++++++++----
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi                    |  4 ++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index ac22f44020a64..f5140d3985503 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -563,7 +563,9 @@ &mdss0_dp0 {
 };
 
 &mdss0_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
+
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 	remote-endpoint = <&usb_0_qmpphy_dp_in>;
 };
 
@@ -572,19 +574,22 @@ &mdss0_dp1 {
 };
 
 &mdss0_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
 	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 
 &mdss0_dp2 {
 	compatible = "qcom,sc8280xp-dp";
 
-	data-lanes = <0 1 2 3>;
-
 	status = "okay";
 };
 
 &mdss0_dp2_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
 	remote-endpoint = <&dp1_connector_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index baca36b151853..1c8836c1aae63 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3692,6 +3692,8 @@ usb_0_qmpphy: phy@88eb000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
+
 			status = "disabled";
 
 			ports {
@@ -3807,6 +3809,8 @@ usb_1_qmpphy: phy@8903000 {
 			#clock-cells = <1>;
 			#phy-cells = <1>;
 
+			mode-switch;
+
 			status = "disabled";
 
 			ports {

-- 
2.53.0


