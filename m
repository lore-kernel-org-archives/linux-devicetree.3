Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F95039F18F;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738864; cv=none; b=ma9casW1xFDTH1R93VH1NMzLrXJnTe7nbj8hYf1S85KijszqNvQODkItYyXJzG6ydKzUs0baAhXFhroPkn/6UMfK5aFBOSTV/Qg7uyFg/qDyRH8d2QGl6o2RuFCrPchWpuTGpKqt7mEnO4XSYPzNXFHz+6xeJCSHdnfAZhXQKAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738864; c=relaxed/simple;
	bh=Xs/cAqp0abT893CZ6RvN26bzhOlnLdEZFJ92UbzH3a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iO3gts6Y+AaqVv8wlklM/SfWSLqGEAe0PXwdpU6QfN2DIp6lSsAK7P0hi/TdG5FnBJdR6uQuLHFLQ7yyzmzypqSoUay3Z78LURgZ+n5tvi3Yeh/ibzRcvhQwgI+DfYvQ6ZWDyb3LtWKoKmzGqxbMX4XcjXVtt9eXOX6mZxSxmqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OLUtMoDv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OLUtMoDv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1E3D1C4AF0D;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738864;
	bh=Xs/cAqp0abT893CZ6RvN26bzhOlnLdEZFJ92UbzH3a8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OLUtMoDvliegw0DbjMqa1BBs/JOSte1UlsKikSHCDdJGvW2xQSu/XlMR0OwvinW1g
	 jcSkizR4In7P1K4jtEiHTbXOGckptdvoMpNXPc0bo8OW4zKvHR4CfL9l76ZsQ7eePr
	 8IhcEb3gW1A3OXAGBrmIzOh7ynmBgR00H0HBV1nt4E5JYxwsR5m7bolhuzydFu0Bg4
	 kKKZV4pbSalXezwhZ98QwPGGJc5xrzWzwR0Hl3d81oXdWO3MYai6plN4SDJVj+jxLA
	 YKuOv97U/0dNZjhv05XYH377OQauE6wqJkbepS2EpujuGxEzDgp/za4sEpbBxaO4OW
	 kDaDdbUF1v6dQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E59C5518E;
	Mon,  3 Aug 2026 06:34:24 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:16 +0200
Subject: [PATCH 18/28] arm64: dts: qcom: hamoa: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-18-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=22884;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=ucE4QvnEIrQloiC6a7D6nX1gkwefll8Or5TiNAFmdiA=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYsgqMEtnOF/lE+Co3lscuv7dM5YbplpM2WV1whWi3A45h
 XLrP2R1MhqzMDByMciKKbKkL3XWavQ4fWNJhPp0mEGsTGBTuDgFYCJ++ux/+G8WqfhnyBW9ZDST
 KleZlK++479CotNn3cnLP/j52MoesG8TzFRzMGL9y3je6aCC3+/pTrVc7ltrtnJychQnrPGe5fN
 SL5yHk3Xm0Q1Mi7WvKURsPCP6qfOrm/TLzc6Re40bUnt+mkhszinT5H3opRWcXSneybvV9nbWBd
 1vd/LKkuue9/w1Puu5jOU1796avT8SFi1nVN6VuYz3x/HYuK3uO7m2tbHnMpwL/nY7ef85Obe7W
 /ZO31zO+clW8o/roVt3vSNVBf75bAkSb518f6228drrSXkS6bYb1pqfnf7vml3XYbOFr7yYdx4z
 um2/4a8k6+Xzma8aBT0yn4vGvtjQGv8nbi33h7qb7mIA
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

Fixes: 5098ae93ce44 ("arm64: dts: qcom: Add HAMOA-IOT-SOM platform")
Fixes: af241225893a ("arm64: dts: qcom: Add the Lenovo IdeaCentre Mini X")
Fixes: ae5cee8e7349 ("arm64: dts: qcom: x1e80100-crd: Fix USB PHYs regulators")
Fixes: 20676f7819d7 ("arm64: dts: qcom: x1e80100-qcp: Fix USB PHYs regulators")
Fixes: d0e2f8f62dff ("arm64: dts: qcom: Add device tree for ASUS Vivobook S 15")
Fixes: 6516961352a1 ("arm64: dts: qcom: Add support for X1-based Asus Zenbook A14")
Fixes: 45247fe17db2 ("arm64: dts: qcom: x1e80100: add Lenovo Thinkpad Yoga slim 7x devicetree")
Fixes: 6f18b8d4142c ("arm64: dts: qcom: x1e80100-hp-x14: dt for HP Omnibook X Laptop 14")
Fixes: 0d72ccaa1e84 ("arm64: dts: qcom: Add support for X1-based Surface Pro 11")
Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
Fixes: 8cf65490cdb0 ("arm64: dts: qcom: Add dts for Medion SPRCHRGD 14 S1")
Fixes: f5b788d0e8cd ("arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345")
Fixes: 7b8a31e82b87 ("arm64: dts: qcom: Add X1E001DE Snapdragon Devkit for Windows")
Fixes: 7d1cbe2f4985 ("arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6")
Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi          | 20 ++++++++++----------
 .../qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts    | 20 ++++++++++----------
 arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi   | 20 ++++++++++----------
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 20 ++++++++++----------
 arch/arm64/boot/dts/qcom/x1-crd.dtsi                 | 20 ++++++++++----------
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi          | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi     | 12 ++++++------
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi    |  8 ++++----
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts         | 20 ++++++++++----------
 .../boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 20 ++++++++++----------
 .../arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts | 16 ++++++++--------
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 12 ++++++------
 .../boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts | 16 ++++++++--------
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi    | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts            | 20 ++++++++++----------
 15 files changed, 128 insertions(+), 128 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
index 9c5e77df0054..bc70fe5db96f 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi
@@ -590,8 +590,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
+	vdda-phy-supply = <&vreg_l1j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -611,8 +611,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -632,8 +632,8 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -670,15 +670,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
index bfb7cea56df9..284825008389 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-lenovo-ideacentre-mini-01q8x10.dts
@@ -1101,8 +1101,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j>;
-	vdda-pll-supply = <&vreg_l1j>;
+	vdda-phy-supply = <&vreg_l1j>;
+	vdda-pll-supply = <&vreg_l2j>;
 
 	status = "okay";
 };
@@ -1112,8 +1112,8 @@ &usb_1_ss0_qmpphy_out {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j>;
-	vdda-pll-supply = <&vreg_l2d>;
+	vdda-phy-supply = <&vreg_l2d>;
+	vdda-pll-supply = <&vreg_l2j>;
 
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
@@ -1138,8 +1138,8 @@ usb_1_ss1_qmpphy_out_dp: endpoint@0 {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j>;
-	vdda-pll-supply = <&vreg_l2d>;
+	vdda-phy-supply = <&vreg_l2d>;
+	vdda-pll-supply = <&vreg_l2j>;
 
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
@@ -1186,15 +1186,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e>;
-	vdda-pll-supply = <&vreg_l3c>;
+	vdda-phy-supply = <&vreg_l3c>;
+	vdda-pll-supply = <&vreg_l3e>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e>;
-	vdda-pll-supply = <&vreg_l3c>;
+	vdda-phy-supply = <&vreg_l3c>;
+	vdda-pll-supply = <&vreg_l3e>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
index 48c4ad648354..0dc7c1b5a14a 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-vivobook-s15.dtsi
@@ -1226,8 +1226,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
+	vdda-phy-supply = <&vreg_l1j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1256,8 +1256,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1277,8 +1277,8 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
@@ -1342,15 +1342,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index 66d566808f58..59cbbfbce490 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -1454,8 +1454,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p9>;
+	vdda-phy-supply = <&vreg_l1j_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1484,8 +1484,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1505,8 +1505,8 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
@@ -1551,15 +1551,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p9>;
+	vdda-phy-supply = <&vreg_l3c_0p9>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p9>;
+	vdda-phy-supply = <&vreg_l3c_0p9>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index a9c5c523575e..107fe2867e73 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1734,8 +1734,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
+	vdda-phy-supply = <&vreg_l1j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1764,8 +1764,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1794,8 +1794,8 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1836,15 +1836,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index db291730130c..c7c793338699 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1568,8 +1568,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
+	vdda-phy-supply = <&vreg_l1j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1598,8 +1598,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1637,8 +1637,8 @@ &usb_mp_hsphy0 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
@@ -1651,8 +1651,8 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
index 02708f23a865..dba8cee43e29 100644
--- a/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi
@@ -1466,8 +1466,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
+	vdda-phy-supply = <&vreg_l1j_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
@@ -1496,8 +1496,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
@@ -1533,8 +1533,8 @@ &usb_mp_hsphy0 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 7559557610ed..ce7d958ca687 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -1268,8 +1268,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
+	vdda-phy-supply = <&vreg_l1j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1298,8 +1298,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
index 2e38402e2c14..be1a8ac8c699 100644
--- a/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
+++ b/arch/arm64/boot/dts/qcom/x1e001de-devkit.dts
@@ -1382,8 +1382,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
+	vdda-phy-supply = <&vreg_l1j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1413,8 +1413,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1443,8 +1443,8 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1486,15 +1486,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..0bee2a3d6e7a 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -1601,8 +1601,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
+	vdda-phy-supply = <&vreg_l1j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1631,8 +1631,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1652,8 +1652,8 @@ &usb_1_ss1_qmpphy_out {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
@@ -1717,15 +1717,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index ce7b10ea89b6..2be5a37c00cc 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -1286,8 +1286,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p9>;
+	vdda-phy-supply = <&vreg_l1j_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1316,8 +1316,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1357,15 +1357,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p9>;
+	vdda-phy-supply = <&vreg_l3c_0p9>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p9>;
+	vdda-phy-supply = <&vreg_l3c_0p9>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
index beb1475d7fa0..9eb2dfd99f20 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
@@ -1564,8 +1564,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
+	vdda-phy-supply = <&vreg_l1j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1594,8 +1594,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1624,8 +1624,8 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
index f95b1f9f439d..e4a0b86847cd 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts
@@ -1407,8 +1407,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p9>;
+	vdda-phy-supply = <&vreg_l1j_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1428,8 +1428,8 @@ &usb_1_ss0_qmpphy_out {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	/delete-property/ mode-switch;
 	/delete-property/ orientation-switch;
@@ -1497,16 +1497,16 @@ &usb_mp_hsphy1 {
 
 /* Right side USB-A (USB-SS 3) */
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p9>;
+	vdda-phy-supply = <&vreg_l3c_0p9>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
 
 /* Left side USB-A (USB-SS 4) */
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p9>;
+	vdda-phy-supply = <&vreg_l3c_0p9>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 28342cb84ded..13d0f09e0c2a 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1491,8 +1491,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j>;
-	vdda-pll-supply = <&vreg_l1j>;
+	vdda-phy-supply = <&vreg_l1j>;
+	vdda-pll-supply = <&vreg_l2j>;
 
 	status = "okay";
 };
@@ -1521,8 +1521,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j>;
-	vdda-pll-supply = <&vreg_l2d>;
+	vdda-phy-supply = <&vreg_l2d>;
+	vdda-pll-supply = <&vreg_l2j>;
 
 	status = "okay";
 };
@@ -1565,15 +1565,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e>;
-	vdda-pll-supply = <&vreg_l3c>;
+	vdda-phy-supply = <&vreg_l3c>;
+	vdda-pll-supply = <&vreg_l3e>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e>;
-	vdda-pll-supply = <&vreg_l3c>;
+	vdda-phy-supply = <&vreg_l3c>;
+	vdda-pll-supply = <&vreg_l3e>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 8afbac349cc9..78380fec8839 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -1416,8 +1416,8 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l1j_0p8>;
+	vdda-phy-supply = <&vreg_l1j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1446,8 +1446,8 @@ &usb_1_ss1_hsphy {
 };
 
 &usb_1_ss1_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1476,8 +1476,8 @@ &usb_1_ss2_hsphy {
 };
 
 &usb_1_ss2_qmpphy {
-	vdda-phy-supply = <&vreg_l2j_1p2>;
-	vdda-pll-supply = <&vreg_l2d_0p9>;
+	vdda-phy-supply = <&vreg_l2d_0p9>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
 
 	status = "okay";
 };
@@ -1519,15 +1519,15 @@ &usb_mp_hsphy1 {
 };
 
 &usb_mp_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };
 
 &usb_mp_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3e_1p2>;
-	vdda-pll-supply = <&vreg_l3c_0p8>;
+	vdda-phy-supply = <&vreg_l3c_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
 
 	status = "okay";
 };

-- 
2.43.0


