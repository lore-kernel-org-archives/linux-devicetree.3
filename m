Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DAC39CD18;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=lLsi2yZaqOKC1SNtNkf1lHmrocVf+Jtvz2uvCp++HAKIqr/P6TMBplia8hUa1QJl1Jk5KSxT/sxMv8/gNM+v2r8StsCZ+hwQjxqygQVFXMmJLe+COkCxjQT0+M5IpUmrTlA592SFSiJBpILoPUTELRDScG7YC6jKGeA/d/H06Cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=+CZAyrOcvGJijWgwJrsUe+2RziEDz8zelzdM7KMLiRQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OITg9TbcO8TqX2Ugk5pLysIhzlkX5B5Olof83aqF9d9+yXnlaQ+zB8ARfXXusky+CRceiNZGaSQ/fvLqOm3slM5qJYVDXZIzgZm30qKgSJUht4WT2b7/rXk8WekEOfGrdm9Tv6ZFDjsKHGyKzUfyCUeTfc3w2sWFB8FTP/PwZ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ss/tI9Xm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ss/tI9Xm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0247C2BD05;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738863;
	bh=+CZAyrOcvGJijWgwJrsUe+2RziEDz8zelzdM7KMLiRQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ss/tI9XmZSlUwDIsPavXKrqq064a4BQOmNAmaRkCFmBRgK6YS+FX8HqfGKrsiakQ4
	 dBqI6sQACQB9Wr/1xO7mpApqXONqnY8HjB5TRK8lqA2st4XxyEqk/N7FaU0LKlt+Rt
	 RjZBHPsniyxYEouccYFqaTzAZi6JMh5nTHUOCSZyNHqDuCHSe9J++dtADYWZRoxZTS
	 aWYiLAS2vmUXBQ7lV2VpuXc6hLyJwZaqxZWnFyhayYioTshxlSkjiU4SNXK9zKB6Fs
	 BzdVOaV5e1/fM1cc3bjjE1pBOy3ejHjIy15KEEx9JwCvSniIDpIgzf1AYThCgRhXRt
	 RjItZBjg0K2DQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD35C55162;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:10 +0200
Subject: [PATCH 12/28] arm64: dts: qcom: qcm6490: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-12-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=RhG3XH0/Ea2Rv232KNpCp7WdKXwu1fia53eO8pGiLeo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZlC6do8v58lflssdfHGlL7RQX0Jpdxkg0hs
 5ObJgA74PSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2ZQAKCRBVnxHm/pHO
 9burB/4qTPpKz+M9XO9lpNrkOeep+ylX8WN9ElcvmVZZsh4HpEh/61tFzYkrDtgNSCRrF50beGC
 tPt8RkvIKveMUYV0NpAYq/HLcSjm+vL5q/Gonw49Jo7M+FINXGldb3u1PMPG4Jn3iJGfZSmUNsu
 OcndszXNI+lry+SD3+z3m/kAaeXsjWVAPt54dcsRPA8sbht+WiJ90x+kRlkWKW0TFoQn8Pm+Fpq
 8oO1x2f5r2MquM7sIX+f2mM+HtRdKPazX2M+RlfgLFsE9G6rnbzUASeQdYimv3sziD2u8evxYAd
 60eexD1CAhhXPE6FalQzWbPaNtEIWR8LZO4wcj/3wdxMJppl
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The QMP PHY expects the vdda-phy supply to be around 0.88V and the
vdda-pll supply to be 1.2V. But these two supplies are swapped for the
USB QMP PHYs on these boards, feeding 1.2V to vdda-phy and 0.9V to
vdda-pll.

Fix it by swapping the two supplies back.

Fixes: 9af6a9f32ad0 ("arm64: dts: qcom: Add base qcm6490 idp board dts")
Fixes: a319cf4a4b09 ("arm64: dts: qcom: qcm6490: Introduce the Particle Tachyon")
Fixes: eee9602ad649 ("arm64: dts: qcom: qcm6490: Add device-tree for Fairphone 5")
Fixes: 249666e34c24 ("arm64: dts: qcom: add QCM6490 SHIFTphone 8")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts    | 4 ++--
 arch/arm64/boot/dts/qcom/qcm6490-idp.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts | 4 ++--
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts      | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..92a7d80b7fee 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -1502,8 +1502,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l6b>;
-	vdda-pll-supply = <&vreg_l1b>;
+	vdda-phy-supply = <&vreg_l1b>;
+	vdda-pll-supply = <&vreg_l6b>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
index bdc02260f902..58cce89a0c1c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-idp.dts
@@ -1141,8 +1141,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l1b_0p912>;
+	vdda-phy-supply = <&vreg_l1b_0p912>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..17804de03e17 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -839,8 +839,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l1b_0p912>;
+	vdda-phy-supply = <&vreg_l1b_0p912>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 797f37596bf1..cdaacc09f56c 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -976,8 +976,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l6b>;
-	vdda-pll-supply = <&vreg_l1b>;
+	vdda-phy-supply = <&vreg_l1b>;
+	vdda-pll-supply = <&vreg_l6b>;
 
 	status = "okay";
 };

-- 
2.43.0


