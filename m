Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2E33655C0;
	Sun, 23 Aug 2026 08:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787474151; cv=none; b=JSVsSivTGwUWRWsqYydgcEj6ymfsjGVRoxF29LRRqmKPxA1gMY3KfitZJwCKUPBN7xE5IZlucV7JbuBMK75amDQ9pFXHUBo6yAi2aZn5mjeGlgGbf0R3xc3XibhaN6ynFt1JiawdydrFLAidfs1g06pixUgmlGk31gleARkBq1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787474151; c=relaxed/simple;
	bh=OScqHlcIGrFn0GPDSiFH2yr5J2fHbFH65CQvX8SqyUA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q1fAQrDTvRes65flmizqDgGxEoPEkzTiybBIQGgfH1k6EVoChbOe4hjXJWVRS4hNDtciu+xlsawQhhku5GAly63bgHwGt9MdkpzIfFFzwUSgmhU4GYicjaYBdvP9mss/Ix/ezIknN2hxO1fdIUsl1As6wQ7aUErNwPojGDX4eSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BG6NoR9r; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BG6NoR9r"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B823C2BCFD;
	Sun, 23 Aug 2026 08:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787474151;
	bh=OScqHlcIGrFn0GPDSiFH2yr5J2fHbFH65CQvX8SqyUA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BG6NoR9rtXDdMniBDXxB50EZ1miQAv1k4OBykVmtbVjBeSa7FDkKXEdBJ2HN3WGdy
	 iNX2je2qqzZ7QV/zpKiK8VYYGIpGdjDVLU1Mz4Vbb1CsCkh2lOXpsf38tL5UIO+Dur
	 aQ/nNrKscNOoBPIBjrKROX+Aw12ZqfZ1kOBoxnzdun8ym2FZJQHB98YR6vwdgsuC2k
	 6h8goytvePUU8hHgn3B0aNAG8BIqjSKiKxeNtYLod+V8sH5fqSiyRXd60Fx9ZcQ+0U
	 GQtu/34e1qPzoy9TKe22hPOBWvvcG+PWEAz2Js7duMHRXApQ233hGw+lX0i7qqdUDO
	 cfceZT5LHNkNg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE05C5DF8C;
	Sun, 23 Aug 2026 08:35:51 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 23 Aug 2026 10:35:29 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sc8280xp-microsoft-blackrock: enable
 4-lane DP altmode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-blackrock-audio-v1-2-f319387fc6a6@oldschoolsolutions.biz>
References: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
In-Reply-To: <20260823-blackrock-audio-v1-0-f319387fc6a6@oldschoolsolutions.biz>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787474149; l=2037;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=I7UKGMSk+s4dyW5AvgjG/TZCmq97eEd3LiG6adDQR/4=;
 b=/BdBee6Uq0Z/jqdf9lcGcx2a2obr8yN0u1TYyKWAl3NYqjaEM47SWXjG58PaI5+nl4LaBJStR
 2pqepi312DyD8IeD0fstKTWghPTwLzaejCXoACQgYiyx2w7VNjwTUYe
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
can reach them (same treatment as on the X13s).

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index a94141d670f62..aceeda96911db 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -564,7 +564,9 @@ &mdss0_dp0 {
 };
 
 &mdss0_dp0_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
+
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 	remote-endpoint = <&usb_0_qmpphy_dp_in>;
 };
 
@@ -574,7 +576,9 @@ &mdss0_dp1 {
 };
 
 &mdss0_dp1_out {
-	data-lanes = <0 1>;
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
 	remote-endpoint = <&usb_1_qmpphy_dp_in>;
 };
 
@@ -582,12 +586,13 @@ &mdss0_dp2 {
 	sound-name-prefix = "DisplayPort2";
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
 
@@ -932,6 +937,7 @@ &usb_0_qmpphy {
 	vdda-phy-supply = <&vreg_l9d>;
 	vdda-pll-supply = <&vreg_l4d>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";
@@ -969,6 +975,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l4b>;
 	vdda-pll-supply = <&vreg_l3b>;
 
+	mode-switch;
 	orientation-switch;
 
 	status = "okay";

-- 
2.53.0


