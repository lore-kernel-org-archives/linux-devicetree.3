Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F29139D6FD;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=ULRe0O63ifpj3qn3EVeyEgxJic1lpr31D7SD4HCliEORp8IRqieVIotcu0RN55NI8AlrD/0mhF4JZ7jwPwNC662cGi6+aqwoqZSHmmAxblTA0+BgWNsSeRgAwKEnhnAYga0gUpkt9kVTPpQIpGTEktYUAJXfBKKqoxsp5Q4SNjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=I4JQ+jqxZjlPtswOL3PqzpyBXNMAnpippiGdY5Q9G1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eDQxf8BKi5Q+AO0+W6vJyhG1XIPQbWtKzOz7ddoxuYfEFEA6EW2M9vXwzFSNY63GoWPwI79IwNLDRPM7idrxq8Xd8TYV7qQhh9sitbHYagp+1pRH5DG4hwVceZaN3XBKSMvD971HqaUwfZIyxl7f9SzsQDp3ZQ3YwOMbDtS2J10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJpNThjI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJpNThjI"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EAA78C32782;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738864;
	bh=I4JQ+jqxZjlPtswOL3PqzpyBXNMAnpippiGdY5Q9G1s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iJpNThjIzZ1+A5y4rZBi1X6CbPSwu39T6R2piIDVC0MpPkHkl3htddaVSB0AD6uKC
	 k7udZaPVq4K/ZD1Ezf2ypiI5Z50jHEQmvMXxigd9UbxpoDCy6/f9+L0yuHf1xmGqcT
	 d4/1nT1VHW3uumaL+HUdyZ8RW3QKYUPKHyzNHp9f+8rrAzusWopuKbGJAnIk+HYyxx
	 W09Xblqu59iBvyPJhcJE49lLfA/kIoXzms3bVj0I0bffi2GUBKJxbN91+GbFAuZA3T
	 rlpQaSgo3U9GbyYC9LYLDeo4LdIdOIfBygm0qZx557d3n+FbJvffvQmf82oMy4uuTY
	 YDX3wrEiOeHow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90A2C55175;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:14 +0200
Subject: [PATCH 16/28] arm64: dts: qcom: sc7280: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-16-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=I+mc1gmYR/W7IjdVctuuQ2GufrmtA1dU0l/JunQ3sQY=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZm6+rDf3niwxWRD2wqFf9jqqtjC0bonLCjM
 Le1CCPhBPuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2ZgAKCRBVnxHm/pHO
 9cfEB/wKxyfuz5/aMmIETXHb2QhLRiQEPRGZtJ0zpLtksHinlaJW0/m3R4UIbB+ySsFpw6wlEDi
 8fwPNcHykRTAj8Kq1k72olMqgAzlM0DqL0Yh7X3MCRl6GU+iVd/mmXF/AVoL2SR8XAGtwCmHGTY
 6XviQPrbEGb0ioH1FC9buRDOYeNzMTm5ZSqPX4ve9XfejDI3QgxLIbKBDoBMvzV/VvSR+2yJYWZ
 zvDeoiks3vm+SraAwwnY1C+C+QE9jASS5ZOX/9OifaecjnQ24SlWORXU2fYR/Ha1yhXut/qDAAZ
 GvgPmYMJ0+KyI0tqbjJN7ZbkNMYXs4uZCsAS2VWucLypDDcH
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

Fixes: 97a5b73b7058 ("arm64: dts: qcom: sc7280-idp: Add device tree files for IDP2")
Fixes: 116f7cc43d28 ("arm64: dts: qcom: sc7280: Add herobrine-r1")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi   | 4 ++--
 arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index 8cac4ce9c851..23ced0621c99 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -542,8 +542,8 @@ &usb_1_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l1b_0p8>;
+	vdda-phy-supply = <&vreg_l1b_0p8>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
 };
 
 &uart7 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
index 9ae9af40f4d2..264029ff3f90 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi
@@ -465,8 +465,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vdd_a_usbssdp_0_1p2>;
-	vdda-pll-supply = <&vdd_a_usbssdp_0_core>;
+	vdda-phy-supply = <&vdd_a_usbssdp_0_core>;
+	vdda-pll-supply = <&vdd_a_usbssdp_0_1p2>;
 };
 
 &usb_2_hsphy {

-- 
2.43.0


