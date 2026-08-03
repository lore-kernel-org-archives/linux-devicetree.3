Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2433A0E97;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=nNrRdV/MML8rFsHLnpoKVTa+SsFmU7R4Sc1Zfz6lOH25dt52Vx7ZR2Yd0bnZGMSeFbumSNeDFyFHjk+IpoTcYuXvDZD44ltufE00m4StdH1QTbBtMndIWF+O+iVclF9Q/IzRNAqvLCeUxMhOLWuUhssBYjkFXOduEAfSo3xezlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=dYkWajJOMg55Wdwzzr+GV7y/E+viuFK4vygFydkE5Q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFaU4RrXiTWgZlLa3MtInQXMherO5UntxZ0itGcMOJ+x612KTF9CltDfSdQS++Tocar5vD8gOOXOMaVRV34J7gJAuM/KJKo62k6/9ZouNM64ZwV/SjPnNLJRsBB17PU6HWQsgd9RcQN0Sc/hof/xpFkoN2J0rqECUkSAURAKvfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwXm8qWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwXm8qWI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43127C4AF52;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738864;
	bh=dYkWajJOMg55Wdwzzr+GV7y/E+viuFK4vygFydkE5Q8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UwXm8qWIiOXCC6wQldBMSHGKj5DGzMku7nYMCSD5fyVeGYWxPGChcnTZ0zpkf24Xf
	 yAdx8DvFfy3joOUa8Ti1oPU+mk6SNKsD11N05qYiEmwXZsnUTyx3QpNLbadXPsC0V9
	 K2KpK7/OkYZCElwnZcJLRYMegkyXc1N3P/oaCKFdi7tjRSUulkdv2m3av/48TK+L4A
	 oG9ogu/jlgNFfAGc9+IRMBOV/PVNrlzmJqIX9zpfpshyLJSqzigCIJCSm1N8qR8jmP
	 Cpo3l7PKPZEsHEIe8ho8w26CL+QU9Rxm2PO1nMWCIc6IiZ2yBybDTjp57Jomdr015q
	 ppnMBUSw7giOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2472AC55177;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:18 +0200
Subject: [PATCH 20/28] arm64: dts: qcom: sm8650: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-20-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3072;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=IbUJedzPlW/vWIkxNFCFt03WHMn1ZU5kOcNspFJ3Nn4=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZopNL+gVyCEU2bGyTqUZqAXY3g4apr2zSCe
 zJVbQmlAKiJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2aAAKCRBVnxHm/pHO
 9eSAB/9CqdzdzugIBRbkEo6XqMZ7sh05kgDDry7px794tvOVaSBcelqvmWjXVtN4BoJA1PwT0aU
 R5Lkdzq1pBSk1EvDRYiapjKw7ZvTXe692ZEU1kq9rw65waFYJ53VORc8bFf7AtMor9O2yjrDEBe
 KUq40uMJ7PDffhhgHwne+5rfzszs0QHPI9fis017tE29EHw+Ejx1iQ/pawyg0vQbxZ0fCW96tGO
 XKdEY0CR2UVJfs+GzdeKNxomveegeYXZlJuuMJ8zOSvGzdb9O4Gde42Yt5EkuX/6k9g2Beb6tfH
 cqXyra0Wp7vht60Puz/iaV7Howdq8C3G84rm0DxD4R3HSXry
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

Fixes: 6fbdb3c1fac7 ("arm64: dts: qcom: sm8650: add initial SM8650 MTP dts")
Fixes: a834911d50c1 ("arm64: dts: qcom: sm8650: add initial SM8650 QRD dts")
Fixes: 01061441029e ("arm64: dts: qcom: sm8650: add support for the SM8650-HDK board")
Fixes: df260487f33c ("arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts              | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
index 0dc994f4e48d..6ddf30ecabfe 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
@@ -1536,8 +1536,8 @@ &usb_1_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l3i_1p2>;
-	vdda-pll-supply = <&vreg_l3g_0p91>;
+	vdda-phy-supply = <&vreg_l3g_0p91>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index eabc828c05b4..865ee15be9e2 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -1338,8 +1338,8 @@ &usb_1_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l3i_1p2>;
-	vdda-pll-supply = <&vreg_l3g_0p91>;
+	vdda-phy-supply = <&vreg_l3g_0p91>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index dd6e33d2dc5d..26045430d34a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -886,8 +886,8 @@ &usb_1_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l3i_1p2>;
-	vdda-pll-supply = <&vreg_l3g_0p91>;
+	vdda-phy-supply = <&vreg_l3g_0p91>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index a3982ae22929..c00e3ae208cd 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -1357,8 +1357,8 @@ &usb_1_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l3i_1p2>;
-	vdda-pll-supply = <&vreg_l3g_0p91>;
+	vdda-phy-supply = <&vreg_l3g_0p91>;
+	vdda-pll-supply = <&vreg_l3i_1p2>;
 
 	status = "okay";
 };

-- 
2.43.0


