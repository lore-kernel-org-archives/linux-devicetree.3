Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D830939CCFF;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738863; cv=none; b=XPtguWLVj51vCB7B/AdyluBJEGgGo02/bJm7GOfSnppOZSqblIlKlbCnSR3oxv4lWyUykEf58QvzHcoZXeZW9kvfr7a4Ow8g1XM6DSmswmIJz5nfXG5gJuoc4lhSBL92a51lwnWijmuPEEqz+9/R61uIx8SVNzlLUJs7KBUv2kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738863; c=relaxed/simple;
	bh=EMQuiNtI2Xt8PMm+G9bS37TBFheibbME3glUAZxhVLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DQ2boM5L9kjbBnNMfpPJ3KR56V54HkKpweirR7wULFTltQ0BJDfToejOinOI7zNO0Wt54mwgX9Uwr1M8WQjH/6bj4LZ9beJ5WCtYrAh6lt6TPIydPuPiXjaF7Di8OTncujPVrZ9Jlp6xHT5k6ystsW/m6TYFyfhM/2Z3/8bQtkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NeMrUFIB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NeMrUFIB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E1B4C2BD00;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738863;
	bh=EMQuiNtI2Xt8PMm+G9bS37TBFheibbME3glUAZxhVLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NeMrUFIBirDVpvrYLACJ/Ng3FZ/MnFr33dTWjCK2+jFbP0hhWf8tjUt7cw53pNSqo
	 5K00I8p9whJv4S2zpkM7yA+EEq6z3a2gGZKkwZuW6X6U6Gt4OEnOzAAHQYOmWAH0U9
	 qi2MzT2kHKNkn5dr9WdKX8OglTZ+nlfXh774/zzSIh/X4FJlvhRDX2nNTgO0kaSZ2x
	 nmmjw2LA2mKn0I03iRmFnrdW7WV9/erTnQf19TpPMMpmNJkoarEccCaLRw0OtDsPrY
	 ypG6uTL4TyQ32+BiVrI2Z2ZbFB72FuYb1wDcD2lloJb9pt5pikPPfQkPowaslf1bwl
	 oEecf6LpEFT9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E28BC55175;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:06 +0200
Subject: [PATCH 08/28] arm64: dts: qcom: sm8350: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-8-5880630cde3e@oss.qualcomm.com>
References: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
In-Reply-To: <20260803-phy-supply-fix-v1-0-5880630cde3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3951;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=ABAYTaWiCjIebvjq7HCMBKuMD4DT2ynOkwyiRLAviBM=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZjnJQdxkyrby1++K9IV95q6w+OCzmEx5YqA
 2V2px4T3fOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2YwAKCRBVnxHm/pHO
 9YmcB/sEi8uTxdnTl0LN+HDD5vgibMDRK98XvqAgwrh3Jm1MCbVI5vAF4AyvfDNYvladuNheLou
 QTr5Rs9/8xPzv2sE74drBHlMHhKG9Y2kVMMVPEwSHrom+gZ/UhS5g09WUWAL3+WgO7DF+LJ9Yd6
 a83dmdc13h0Ye61WH37gwzihI2SH3pLeGKfKmRdV1cs4qhRcz9WReBk5fyn4FumnU1iykemzbcL
 L30zWqRhBBv00FXseVYFX5g1E6bmaww209zEYTLslhEsiDMKyoVjnkRAcZ650p5vEtbgCEJ9cCk
 S753T+6EP4LM2GGyvdQl2/rIA8qrM86Nrw+AL/4geOcQTgnB
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The QMP PHY expects the vdda-phy supply to be around 0.88V and the
vdda-pll supply to be 1.2V. But these two supplies are swapped for the
USB QMP PHYs on these boards, feeding 1.2V to vdda-phy and 0.88V to
vdda-pll.

Fix it by swapping the two supplies back.

Fixes: 9208c19f2124 ("arm64: dts: qcom: Introduce SM8350 HDK")
Fixes: c16160cfa565 ("arm64: dts: qcom: add minimal DTS for Microsoft Surface Duo 2")
Fixes: 054b40a6111f ("arm64: dts: qcom: sm8350-mtp: enable USB nodes")
Fixes: 5a077120bcf6 ("arm64: dts: qcom: sm8350-sagami: Wire up USB regulators and fix USB3")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts                    | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8350-mtp.dts                    | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi    | 4 ++--
 4 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
index 5f975d009465..b43dbb5921b1 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
@@ -860,8 +860,8 @@ &usb_1_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l1b_0p88>;
+	vdda-phy-supply = <&vreg_l1b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
 &usb_1_qmpphy_out {
@@ -890,8 +890,8 @@ &usb_2_hsphy {
 &usb_2_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l5b_0p88>;
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
 /* PINCTRL - additions to nodes defined in sm8350.dtsi */
diff --git a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
index 3bd5e57cbcda..57bb8c322e8b 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-microsoft-surface-duo2.dts
@@ -358,8 +358,8 @@ &usb_1_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l1b_0p88>;
+	vdda-phy-supply = <&vreg_l1b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
 &usb_2 {
@@ -377,6 +377,6 @@ &usb_2_hsphy {
 &usb_2_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l5b_0p88>;
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
index 8bee57f3b25a..859985e561aa 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8350-mtp.dts
@@ -354,8 +354,8 @@ &usb_1_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l1b_0p88>;
+	vdda-phy-supply = <&vreg_l1b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
 &usb_2 {
@@ -373,8 +373,8 @@ &usb_2_hsphy {
 &usb_2_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l5b_0p88>;
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
 &ipa {
diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index 7ae1eb0a7cce..1f9d094fee8f 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -917,6 +917,6 @@ &usb_1_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&pm8350_l6>;
-	vdda-pll-supply = <&pm8350_l1>;
+	vdda-phy-supply = <&pm8350_l1>;
+	vdda-pll-supply = <&pm8350_l6>;
 };

-- 
2.43.0


