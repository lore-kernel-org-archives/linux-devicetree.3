Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A1D35C685;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=pZFYDiMQiUJvHoA4pyt/5SXAMrO90W/4D5o2r5ue2n3yxActgzEcCN7BUeNrAuEJ280sXwf6npP+HHDhghkAeINT+sqYX18YKrF1XVK+X4kJS67hDCN/l2o6VFiTC16ebu8Yd1cgQU4sdJaB22ktyL7Hzhpj9uOU5Fk9CZDfEuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=UDNHt4JYG3v9KKDiawb1NrnE26+VRr/zOSFrOMmWDR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JQghuPTsi5miqZz5KIqsL1JzkLvKYmwQcPpUBuJgQJM6mnQ519BD4QjCY7yyXs23RDL6prSklsY3pInP4MI2dDlIMGs1HfGUKZbC4304bkW8BjrPtNTihaFsZKJhqHfazF7u61gg+wuutYvpfdqa5OHAt/m5p7g/vdRF04ZRYLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=upQtSOK7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="upQtSOK7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBD2DC2BCF7;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738863;
	bh=UDNHt4JYG3v9KKDiawb1NrnE26+VRr/zOSFrOMmWDR0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=upQtSOK7Sj/PYwrKRJb6wL/+j1nLl2bevTSkO+gMy2/skJ0vZ1T6NeVbI5GmZYu9g
	 YKK0cAYaFR7UvTu6rCKsbBKbSOPzCRmnDvGOidH0UB1+JyxS44XMA4SvM66ytgt1Y4
	 bnQZNuEmFxRk36tzMGebxT7z+XazZ7+lOb4O/lsvLnvk0KE1ip4DoeNBNILvC/Fs4K
	 0Nf60jWW70+vV5rqs33nRK1Z55G/M3ZKrmkN5YOSvVA0x2T8itcKnUq3RYfd/DH5oB
	 9n7quwPg5u3nS8wE3MEu9jnsC9nrU12wTchi7C76sBqqX92EHihpMR8hfCJ/WFQvqS
	 ywCNYs3xrvzhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9EC8C5518F;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:12 +0200
Subject: [PATCH 14/28] arm64: dts: qcom: sm7225-fairphone-fp4: Fix swapped
 USB QMP PHY vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-14-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=VWRMqE4YJumC58Dq3jW8CeSvBHFBnQX97aZdFB6wV1U=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZljj2KmQJHgk6C9FeqdFlhb7IB28IZyaIk0
 qJUronacQWJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2ZQAKCRBVnxHm/pHO
 9UFvB/47EDG+MCA11p9lAQQdy6ipMp+U4I7bX5aAsEIO60ampF53Qc+8Fbqh27PHrcF/OsaTuoD
 ruEjNsNLzuz9GSWJIA8XFTnAO2xfmpLht1pd/OkGcJfaJ/rTLmYDiW3LBTXawsqult2rg3zUtbi
 //QqVnN796YaW4odN4eUpNwiubPuJpIoasNre6NIPh0a24MV/7QwoL/ktB8Vo1TDRUCcQKtl7Tr
 Zrg0Mrklp+njqrWT7WH42+ex8xnpagcyhJX69Iw6H3DKIOmP6mQ6TP0u1/p+xkKIV1ovZolL4hq
 EKrtexxTL+dFpcEAMGlcmPJCD6TcieWYcfytlpeOGZCReup6
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

The QMP PHY expects the vdda-phy supply to be around 0.88V and the
vdda-pll supply to be 1.2V. But these two supplies are swapped for the
USB QMP PHY on this board, feeding 1.2V to vdda-phy and 0.9V to
vdda-pll.

Fix it by swapping the two supplies back.

Fixes: 4cbea668767d ("arm64: dts: qcom: sm7225: Add device tree for Fairphone 4")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 23f950067a08..bea82cbc2c88 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -1247,8 +1247,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l22a>;
-	vdda-pll-supply = <&vreg_l16a>;
+	vdda-phy-supply = <&vreg_l16a>;
+	vdda-pll-supply = <&vreg_l22a>;
 
 	status = "okay";
 };

-- 
2.43.0


