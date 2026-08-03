Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC343A2576;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=AuWKOvJsfp69F3HOmOVhnupIKhN4f1/lRAkBhXts8Z0LijrNtCzLmo3NAd0YxdW0Wun1IEWu74KerH9oeuDyj09lPqYF4x0kcyf6eGBPi/UIq361deevBuUqrDIrkWigQ1w3rMfVop67NKAlduzXgPt+fe594mOE2USrzGRJO84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=X35aoUtUNFfNn5qtGaMCjX3f3PpgQs23JsH8k+KQcyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QS8pugYx3Z8fvqwXERy348lSq+NHqXcyfQ9VAL9KA7nCKtQTgM6E1i/fulIIaEVuE/apOZfG+E4vUe7PgG+3q78lThN8mIXmbDI5Mi1v50f0X1MbJ51yQ/GubEBqTYnvLpKMkFLaLQLafpwjRkafW0JfVvGeGLNEVBT6LXaErbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WNGrH0jD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WNGrH0jD"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 633A8C4AF10;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738864;
	bh=X35aoUtUNFfNn5qtGaMCjX3f3PpgQs23JsH8k+KQcyw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WNGrH0jDvTw8++H3JyIyTu1DM3sb/pPInXf67fAXIutP/UCxaW3sNJWH5uh8KcTao
	 /M3UJFYc2AvqC/UIqDjUo6gpuOeQFcVQW/WQzHOZK1CFgWBVfT4qK70yB0rclMVLe1
	 vzNWZu0qTbhvTwajWSyq1p2NekEVmCQeFbJ5s1z9gigQTSoDUv6RMdmwXbPi6cuduH
	 c1es+SMwagEGQN2xzpVZvWtDjIjwj9eoMqNX9Q/ZAZSDf90WBJjosAO0N7RUIuhvKV
	 1xpwWqZzkt9EZLXc/7Gc7wMh0amGwMGV1XtbSGKPoW98nfeEEes32p2mXVkWxQatN4
	 qB+TSNM1Q3QUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50B80C55162;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:21 +0200
Subject: [PATCH 23/28] arm64: dts: qcom: kaanapali: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-23-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=C41mphnC+vJN80eBvobanutiyzFmuLERtiuoVRlXJ7o=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZprcrVIKvMcB3+J48wPwRgKNr7HqT70j8EU
 25sr1cVnIuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2aQAKCRBVnxHm/pHO
 9b/tB/9KTHp5lEQKMIr2/7Mrp53YhU/i9aFvrZDpHmJI0iIyi0pKMrW4NhmNTyFWICQMH7bc3aJ
 UN3sYQ+rvXzHp2NsQXWwo8Zp+zGhRupRJoZagnRaXoaxlyV20erpBJ4muD1jqubn02V0KJ0yZFE
 pLb2rwEoyDWLCitwpQdJe/W8SgJ/WSCr24rYmmfndJbuqfW8jXZT0OxkzMSplYFUbxWavsTNabf
 fmOvwktoMQowt8yHIKP6vDQggZHpwerDWvEym0UHPyo0aHpgZksf4z93O5rGXbyXnx+Em7ZvHSC
 5xNZj5nPrNnhCRJ3BDi63rLWQgl9S6zJAxf8DYmWB6bHlHLL
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

Fixes: b2f036a67580 ("arm64: dts: qcom: kaanpaali: Add USB support for MTP platform")
Fixes: 01d15f5f6996 ("arm64: dts: qcom: kaanpaali: Add USB support for QRD platform")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 4 ++--
 arch/arm64/boot/dts/qcom/kaanapali-qrd.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
index f9b5b5718b90..2c1ae40dc7ec 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-mtp.dts
@@ -1343,8 +1343,8 @@ &usb_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l1d_1p2>;
-	vdda-pll-supply = <&vreg_l4f_0p8>;
+	vdda-phy-supply = <&vreg_l4f_0p8>;
+	vdda-pll-supply = <&vreg_l1d_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
index 55d02219ef4e..28779698221d 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/kaanapali-qrd.dts
@@ -838,8 +838,8 @@ &usb_hsphy {
 };
 
 &usb_dp_qmpphy {
-	vdda-phy-supply = <&vreg_l1d_1p2>;
-	vdda-pll-supply = <&vreg_l4f_0p8>;
+	vdda-phy-supply = <&vreg_l4f_0p8>;
+	vdda-pll-supply = <&vreg_l1d_1p2>;
 
 	status = "okay";
 };

-- 
2.43.0


