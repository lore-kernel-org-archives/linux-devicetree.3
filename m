Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DED639E191;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=Ne98/aEtxaR+WZJlxVaJh+zrggLVLS5p/FBx3c41zsTZaQSWimRRbd6o5GsKI8AGzOz5lVqO6TBH+87seIGihZbYGunrIb0xp2Ns82Agi4txU32MMzjCBbJ0NDY2uZtvSl+/zLvc4YLoI8Yjag/MIxxbZpbW6/2wLUxDH2YjMMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=8U8AMBIZki20OsqevPsuOBJY5OgK+MKp6dXteB+83hM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ToIWHmFzRtuqFKfjCVarxz1AEcjfa6R83B67YBIirms+gLVjVnfmxDQwvfD3HC446/lnobGWVla6jHB/sS0I0ZfUJkZaaQ9s60UVOtX0s7xYuo1Adh7n2MUlzpw38r4C5uYBPL/d4glsJ7RRFkNKQJJF0aVufpL4EZ0P5oU5w5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hiaMoTpL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hiaMoTpL"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07B33C32786;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738864;
	bh=8U8AMBIZki20OsqevPsuOBJY5OgK+MKp6dXteB+83hM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hiaMoTpL24SM/tJ2d2ZD/IO7NpjAoZ9lCLv2YOrClr38Qn2qznNsP4cHEQlnsQb8W
	 NjXlQ0fOGVA6uSjNID9t5rrym6tdgOQDDdoOTxUhYmvSe2j000FhHWQ1Vy8aiqDuC/
	 f8M04xxlzUJ9AlebCWPpNMUhJWMIFhK5lP7DtQPJEOvJG/XKoe0O2wooMyPSlYFZqJ
	 diKZ4SZktQuyNwgXpACkgu61V0m4JWucgpExx64RLGkpMqlxlRvYJeespFM7u6IDMm
	 GxUt+eCiKr0rTni3eB6rAgZd+7FDSo51WwzmmyMzlrEw2Mm6JpL7QgSMHaGDcZE6+l
	 tcbUshQJY+9fg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F41C55162;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:15 +0200
Subject: [PATCH 17/28] arm64: dts: qcom: sc8180x: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-17-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3246;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=8yGcMIHGCK4uLxsBiqs/8mLi5aFNIL0pXC7kG37+8is=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYsgqMEuv3XbS+Ofzc9J9x6SWhaju/qnzRrdLIfW2biZjl
 7btxt7cTkZjFgZGLgZZMUWW9KXOWo0ep28siVCfDjOIlQlkCgMXpwDcaFX2v0I8ztr/JmqXRi+v
 Mq4yFA9rdLzu/TLI5sqS7O1bjsfffzZtZlWEzHqlM+env5tatCZSZ9Y37+gF0VsXCa+YPXOHq9W
 0hsqWQP+cHnUm8abufrf1M4tSG5zE3vEtZfiz2f1tODPfe66UU7METH+tvsYaVaJh2Z90L8l9W+
 KvfelmsQxzTXjXuUUHfYjdlCpd/a5gzWwhtXkdtq6C76/knDkc+P6U+Zuj/rnKL46drnPhPvHs8
 ZKmX8XlYXnNxq6tKtukAg5WT7Zl4v3Mc8w2zk/E+d3b+BeZ9ZFBtYHbuU9x6JxYNquvqmRJmb3W
 7h1CH3LFDLJj+h/8ncm1MuRq8u9Z0hLSsQUha1fV7q0EAA==
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

Fixes: 2ce38cc1e8fe ("arm64: dts: qcom: sc8180x: Introduce Primus")
Fixes: 20dea72a393c ("arm64: dts: qcom: sc8180x: Introduce Lenovo Flex 5G")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/sc8180x-primus.dts         | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index d86a31ddede2..2e3ae73c6459 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -570,15 +570,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda-phy-supply = <&vreg_l5e_0p88>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda-phy-supply = <&vreg_l5e_0p88>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 
 	status = "okay";
 };
@@ -592,8 +592,8 @@ &usb_prim_hsphy {
 };
 
 &usb_prim_qmpphy {
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda-phy-supply = <&vreg_l5e_0p88>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 
 	orientation-switch;
 
@@ -633,8 +633,8 @@ &usb_sec_hsphy {
 };
 
 &usb_sec_qmpphy {
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda-phy-supply = <&vreg_l5e_0p88>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 
 	orientation-switch;
 
diff --git a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
index aff398390eba..557358fbb5b3 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-primus.dts
@@ -669,15 +669,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda-phy-supply = <&vreg_l5e_0p88>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda-phy-supply = <&vreg_l5e_0p88>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 
 	status = "okay";
 };
@@ -691,8 +691,8 @@ &usb_prim_hsphy {
 };
 
 &usb_prim_qmpphy {
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda-phy-supply = <&vreg_l5e_0p88>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 
 	orientation-switch;
 
@@ -728,8 +728,8 @@ &usb_sec_hsphy {
 };
 
 &usb_sec_qmpphy {
-	vdda-phy-supply = <&vreg_l3c_1p2>;
-	vdda-pll-supply = <&vreg_l5e_0p88>;
+	vdda-phy-supply = <&vreg_l5e_0p88>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
 
 	orientation-switch;
 

-- 
2.43.0


