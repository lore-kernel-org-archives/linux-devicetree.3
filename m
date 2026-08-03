Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809C39CCF8;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738863; cv=none; b=SZI/FpGQZ9ALPqNCQ8nolr0L5WU8QqyfikAajVNt4wNRHndizVHw6psJTkS/GVSoyBQAA2IIQG+xx1ryIghxFCe9hufx6Nkzgkc/54ZPaeKUtIWO3gNVU0lmdV7okPMS7A23cld/k2T4JhxLjMFd4f2N4jNLWq0NWAEiqJOW06I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738863; c=relaxed/simple;
	bh=5wjqpP4BjYL4+G4dxYKkcKf7sdjfhJshjfrdrCadCko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pm0DUfIuUIKIROFOKyblrlFbxBPr24p4GhMz2t3kMoiCIN7trQfnNEG+3YXKG2SN2dGPoneE/dizgOvSizIiwzZEmjOECR3OLQ13rwLJ1LEH2AsliE6utUvxUJ9HSMFT2wa5zYmc+ID1H/3S3iCnjfQ/IT3wg+YnYNo+KhYQpW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/j0HAJv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/j0HAJv"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61A0CC4AF54;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738863;
	bh=5wjqpP4BjYL4+G4dxYKkcKf7sdjfhJshjfrdrCadCko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=g/j0HAJvcA8ZtNJCRYQmfJv/zqKFNcNiFre6F5t++76UPV+CAeC0jjM3LWUM3lAKC
	 pzOYMolyioy73qXnW4iWujvqXINYz+PsWRxlKBlCRU7PWC/EpwbTsOhYN3NuI3lCIT
	 oIMM+ou3LQglyD8Hd6Q78WjoQqYOQVqZ2O69YfMIjer0Ckh/5SU1UseHptV1QdT7Q1
	 lXq8QC1EHYgzITY68AruokxpDlB5w+GFg1cWRiO+uWL9w75WIUYxYHgEhuOR0cUS+Q
	 8fzAg5jxGEG5bFJngl/6sU8D8CQO1KlF3IKfSGXBl5gI45t7czImWUJGp2/3deapSl
	 P3ND/HKKMQwkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7F9C55162;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:05 +0200
Subject: [PATCH 07/28] arm64: dts: qcom: sm8250: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-7-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4466;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=ur6aC7igXGhOXIX0eL9vKWIjwvCJqfvszUoT2v2OkNA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZj/Bs+uaqnq4t51x+RsfsLFsQxVhLJBH/H8
 uHDE3IeTZeJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2YwAKCRBVnxHm/pHO
 9SBTB/9J1T8AFBdjsYK2AJiu4Uq5mjF9Q+arsKs5xbD5bf2BLBi76FmuMmQHWeONmJmDN3zzCWR
 qewqSM5u18Yzd8NI88nGDsRV6eZbbqKmbeN2f5d5Cm/t/wpZXm8CrKMhV062NPyAbQL4NxBVesO
 cSWxrR0ba8Oo0Ot8Zwyy2hviEDk1/4TWdbZuwf2TeyPNWuO5ou6ACqZTeLueH1lMA6h2IIhm//i
 WdhFcwWfK6XCosHsfbT4kHGkE2xV2RaNpQVBqyvwXXt//Dszdc83AO+gYlHgI34fxfF4JniKM1j
 0JdrWwm463U4fpuYnoy7ch4yasOYM1OQCFCp5wC99vCq19GN
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

Fixes: 91ed0e90fc49 ("arm64: dts: qcom: add sm8250 hdk dts")
Fixes: 221f0ef37f55 ("arm64: dts: sm8250-mtp: enable USB host nodes")
Fixes: 69cdb97ef652 ("arm64: dts: qcom: sm8250: Add support for SONY Xperia 1 II / 5 II (Edo platform)")
Fixes: 264beb3cbd0d ("arm64: dts: qcom: sm8250-xiaomi-pipa: Add initial device tree")
Fixes: 52c90664f122 ("arm64: dts: qcom: qrb5165-rb5: Add USB support")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts             | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts              | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8250-mtp.dts              | 8 ++++----
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts      | 4 ++--
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index 690b484352ed..d6af679abe1a 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1424,8 +1424,8 @@ &usb_1_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l9a_1p2>;
-	vdda-pll-supply = <&vreg_l18a_0p92>;
+	vdda-phy-supply = <&vreg_l18a_0p92>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
 &usb_1_qmpphy_out {
@@ -1451,8 +1451,8 @@ &usb_2_hsphy {
 &usb_2_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l9a_1p2>;
-	vdda-pll-supply = <&vreg_l18a_0p92>;
+	vdda-phy-supply = <&vreg_l18a_0p92>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
 &vamacro {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 3ea9d2b1a7d5..c1c673086df5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -438,14 +438,14 @@ &usb_2_hsphy {
 
 &usb_1_qmpphy {
 	status = "okay";
-	vdda-phy-supply = <&vreg_l9a_1p2>;
-	vdda-pll-supply = <&vreg_l18a_0p92>;
+	vdda-phy-supply = <&vreg_l18a_0p92>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
 &usb_2_qmpphy {
 	status = "okay";
-	vdda-phy-supply = <&vreg_l9a_1p2>;
-	vdda-pll-supply = <&vreg_l18a_0p92>;
+	vdda-phy-supply = <&vreg_l18a_0p92>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
 &usb_1 {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
index 51779b99176d..14c8ca602110 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-mtp.dts
@@ -862,8 +862,8 @@ &usb_1_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l9a_1p2>;
-	vdda-pll-supply = <&vreg_l18a_0p9>;
+	vdda-phy-supply = <&vreg_l18a_0p9>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
 &usb_2 {
@@ -885,8 +885,8 @@ &usb_2_hsphy {
 &usb_2_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l9a_1p2>;
-	vdda-pll-supply = <&vreg_l18a_0p9>;
+	vdda-phy-supply = <&vreg_l18a_0p9>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
 &venus {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index d8289b2698f3..51c0caaf4ea1 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -715,8 +715,8 @@ &usb_1_hsphy {
 &usb_1_qmpphy {
 	status = "okay";
 
-	vdda-phy-supply = <&vreg_l9a_1p2>;
-	vdda-pll-supply = <&vreg_l18a_0p9>;
+	vdda-phy-supply = <&vreg_l18a_0p9>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
 &venus {
diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
index 078ba13f8762..f11e4e244dff 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dts
@@ -515,8 +515,8 @@ &usb_1_hsphy {
 
 &usb_1_qmpphy {
 	status = "okay";
-	vdda-phy-supply = <&vreg_l9a_1p2>;
-	vdda-pll-supply = <&vreg_l18a_0p9>;
+	vdda-phy-supply = <&vreg_l18a_0p9>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
 
 &ufs_mem_hc {

-- 
2.43.0


