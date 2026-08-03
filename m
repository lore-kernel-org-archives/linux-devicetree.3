Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7189B39A81B;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738863; cv=none; b=G4qKCBKlPYj6+o7XpYbQ+zCDm2d8IA+KETJg58ShGfCGcal7yP32XOyHPHQqP1ySlYbAI94G413mpBqQIsd2lYgc7fWTMQzt4RzjT9vK53aUvJUJ1fybkBsjVbKY8wLhofwJe5uR/bylw65nBz9lDPXx/XAmrCBSI5eoaKdB9UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738863; c=relaxed/simple;
	bh=8qLw2bPbG08JInJgSQM3SY3LyoK5UEDJvJH2fRZ53Vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e8tbEX/V3TiC4yj7XqbBxmNHrLd/649A6si3qnDOyhFgBL3YRUzgzTWNUlCPi8RSgFcxQRMsHxNra8Yb4qIrZlQt1H4rECzNP0PxIypv/AHy5Hpx7Zyof0X7jRpxa3bvmi04Z6tSCVL1m8/i95X+vrqrY0jz9CXrLGKBh9tCkMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r95vBi5h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r95vBi5h"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30C99C2BCFB;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785738863;
	bh=8qLw2bPbG08JInJgSQM3SY3LyoK5UEDJvJH2fRZ53Vg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r95vBi5h/cfYeQ30EpvDWDmLi9DJe8AyiTrrWDcaB+0jRfKMe5Ifa42GSBg1fFp6k
	 FRvTZyrO1+dUI7cZZv65akOg1dWMzjuYDbGndZCmE5RPriJRkjipsJOOGzZjOAHQUL
	 RpQwSh3xi6TCRJ8gEgHFBVU/h+fa/BN15gshJ78jtLCdysYH5Z8AUbVOwkkVTDwB0s
	 0juqSRl++iza+Qo9T7IccT8+GlZPFqCLG1W2jwi7YJb6Ty2V4e0rMCqZ+On7rLngpJ
	 TaSaE9+C1nDOycKPfWbSNx+vSbv7QsaYpFRXFbCZ+NxukN1uv2vMh5eQEGAHLNZVfW
	 a1z80L7f0meJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D072C5516F;
	Mon,  3 Aug 2026 06:34:23 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Date: Mon, 03 Aug 2026 08:34:01 +0200
Subject: [PATCH 03/28] arm64: dts: qcom: sa8540p: Fix swapped USB QMP PHY
 vdda-phy/vdda-pll supplies
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-phy-supply-fix-v1-3-5880630cde3e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2564;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=0rmPt/07pX2g9KPGixObuTKoy95XHhWTdoHlGDnMQ2Y=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqcDZih/NQ/ZW/PKYjWZcoI6S+gfSux15Gn2B8f
 OvNb/ioTu6JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCanA2YgAKCRBVnxHm/pHO
 9SGgB/0cMz974pUXxH9YfXYD5RH6A8QpehsE+epwZzc9/CZBNLkgehVbZMD4G568VgoDeV9e81Q
 oIr5qqiLHsCQ+vPs8Z5TovDoRD9By2krzh8cOkLtHTgMJXbjHXo5IC1VLJK4wyAlpcfabBknUKP
 y5iNYdKZAy6/FrFshNc/QIEFrr+oDApQejOR0qjv0UC9/3szjCG2ZLZL25kA0ZwaruQJH4g9Dyx
 4FTm0l2T7tSsGAYtY11HiYKbFiOOXZpmgN9wufRPkBF+M9U2LimIz8rzLImM9V5rAURzluTzMRm
 o5uBbse483ghLzx+DDfdCPCMAdw4er0UNpHRPenvoktXnHHk
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

Fixes: 519183af39b2 ("arm64: dts: qcom: add SA8540P and ADP")
Fixes: 6be310347c9c ("arm64: dts: qcom: add SA8540P ride(Qdrive-3)")
Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Assisted-by: Claude:opus-4-8
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts  | 16 ++++++++--------
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts |  8 ++++----
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index d28d69162427..7178ae087038 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -604,8 +604,8 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l3a>;
-	vdda-pll-supply = <&vreg_l5a>;
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l3a>;
 
 	status = "okay";
 };
@@ -628,8 +628,8 @@ &usb_1_hsphy {
 };
 
 &usb_1_qmpphy {
-	vdda-phy-supply = <&vreg_l4c>;
-	vdda-pll-supply = <&vreg_l1c>;
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4c>;
 
 	status = "okay";
 };
@@ -671,15 +671,15 @@ &usb_2_hsphy3 {
 };
 
 &usb_2_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3a>;
-	vdda-pll-supply = <&vreg_l5a>;
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l3a>;
 
 	status = "okay";
 };
 
 &usb_2_qmpphy1 {
-	vdda-phy-supply = <&vreg_l3a>;
-	vdda-pll-supply = <&vreg_l5a>;
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l3a>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 44177e9b64b5..df40c44c447e 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -478,8 +478,8 @@ &usb_0_hsphy {
 };
 
 &usb_0_qmpphy {
-	vdda-phy-supply = <&vreg_l3a>;
-	vdda-pll-supply = <&vreg_l5a>;
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l3a>;
 
 	status = "okay";
 };
@@ -493,8 +493,8 @@ &usb_2_hsphy0 {
 };
 
 &usb_2_qmpphy0 {
-	vdda-phy-supply = <&vreg_l3a>;
-	vdda-pll-supply = <&vreg_l5a>;
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l3a>;
 
 	status = "okay";
 };

-- 
2.43.0


