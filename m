Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F093A383A;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=gk8GK+J8Pu2jtWKdwfgyelBn1f3w1bUyhhOkdLk0/3XJfVTjrl3iIKJjJxacGrxixZ1GYixk760Lmd7/3X4LM87mD2cqhuXMkMa0ibCzFAUBnocJO/58BYgPM5G5WcIIYdZ5UKxHnSFVYjinGLmvXfJ7caZQJp0bwTaS2JdaqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=nVmrwBXVmSlNCRQFUYE8QO6y+Z/xQN4/02P8kFLpT2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btDA8eFoMidbmzgRDjrGsmLM6BIBlDlBuu0lp/VbaZrpiylGxdMhnuz7aVtTpbm10/ZEXdC8s8HQGHaaApaqaoJE0VNhJpGtIl1KVm8PBxPDIAiBV7zKkMBMDbCRUWUOwSltdTSz4kOKFqUUGVjuTQPft2ECHCy1FIvQyf6qZkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uryMM8gF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uryMM8gF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 789DAC4AF11;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738864;
	bh=nVmrwBXVmSlNCRQFUYE8QO6y+Z/xQN4/02P8kFLpT2c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uryMM8gFc5jgiZFu5f3NzpBKZ1gAJvsXj0mqV9r9P6jzFQVocDVDmdufdLze0w8QU
	 WQ0OTMATcP1H7E3bsai23AZel0665PA8riWAMGA2iIG5XqlK2CeIm/D25NGa4kc74T
	 6BUVkiDRXswNETi8RC5ia1/t1T+XduAH5P2alvUORsn/0qlkYQt4lNxdPA27Tmw8SZ
	 jMMsH5br6AGjzwPruxzW6rsMc9GcuYWWwzybEMBtfGiC9jNWzV5nf+b+pRBms3Zg2H
	 u1077PQgqpQ8wgHcMi2nArfwMWHX9LXVVOl+55VjpkydFrzNOjgJk+nieRFN267adu
	 s6x+5k2vRC0Sw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FE4BC5518E;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:22 +0200
Subject: [PATCH 24/28] arm64: dts: qcom: glymur: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-24-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2102;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=JyJPDL1ZlHK9X+tyxrgwAOPJ/PXRxxJTbY4uRsNaOTU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZpGIipb7iCX6tCEttF5R2JcJGrIBiP1eUpG
 n3CtFDsQ1GJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2aQAKCRBVnxHm/pHO
 9TaQCACZWLruzY0czIqNpmBmgNPVDDgUTSey1DVfVh4t/cnftUv2K9mEaFYV14ahY7/m6psQ+Dt
 CtEVgndPQsGzQl5sDIw7LCL5n5bCmRrl0XZA1diQhwbC53cDIypDGJifoQma2sdgoLgj9cjD7er
 yH3IZe0onHu10UfWxcR1XTT7HluDM8NwDXAqDAAa8V3W7ZYnGeK3dvr5psIV9Nvw/sEOcXeduS8
 q86WX2zFTxFhDF95KbY9VPxsCKqCA1S1S4G3Wwyhki9SLNoB6RL8yyvHuQ030mPzAgiBvu42fco
 U+UUopcJVBNfVIxfNV1hiuWJ95GKEfaVuNhUlk8CXJUhUk4l
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The QMP PHY expects the vdda-phy supply to be the lower voltage (~0.8V)
and the vdda-pll supply to be the higher voltage (~1.2V), as used by the
DisplayPort QMP PHY on this SoC. But these two supplies are swapped for
the USB QMP PHYs on this board, feeding 1.2V to vdda-phy and 0.72V/0.83V
to vdda-pll.

Fix it by swapping the two supplies back.

Fixes: c8b63029455b ("arm64: dts: qcom: glymur-crd: Enable USB support")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index c98dfb3941fa..9d42bd858595 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -339,8 +339,8 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l3f_e0_0p72>;
+	vdda-phy-supply = <&vreg_l3f_e0_0p72>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
 	refgen-supply = <&vreg_l2f_e0_0p82>;
 
 	status = "okay";
@@ -368,8 +368,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l1h_e0_0p89>;
+	vdda-phy-supply = <&vreg_l1h_e0_0p89>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
 	refgen-supply = <&vreg_l2f_e0_0p82>;
 
 	status = "okay";
@@ -413,16 +413,16 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
 	refgen-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l4h_e0_1p2>;
-	vdda-pll-supply = <&vreg_l2h_e0_0p72>;
+	vdda-phy-supply = <&vreg_l2h_e0_0p72>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
 	refgen-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";

-- 
2.43.0


