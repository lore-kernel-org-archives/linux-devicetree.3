Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41134443AAE;
	Thu, 16 Jul 2026 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223240; cv=none; b=P/2wspPytj0z8DfqgJmPa23BlwMzL7NWLSuyFtARxbdxH0zBGnC9pIwmeJvkyDwh/meJGAYqLREduRtCherlesUe6ULxemFV3tJArzADNMn6V91p4pimQe6SkzY7rCZpm2wrxVw+NuelBAeNiRo5UM/UtWQ/28XPcQGQKQp1ABM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223240; c=relaxed/simple;
	bh=U3f2i+S1l7IicozaxVBk8mvLIf8XqNOAaChMA7rsGaU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cRXO2HYZb6aFCYH65XUV/9p5/dW50yBnDFv7kHXyrQnlNYDHMVRrI2DTYLUVhsuVkA9nAmkinY4WzZYxmXXRkb2YeladQ7uvo9VYLekIW8ZqhU3v1+IM5th2Jkn+AtdrJfqpgumbPRGtNm/6erjsMRsRxGAoXZe8BMexq8UXry4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asBZlIq3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asBZlIq3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293A21F000E9;
	Thu, 16 Jul 2026 17:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784223238;
	bh=2h/eflKxXmNY1+ClhaFTWs5e/Z5XUAroC1vzlwrkPFA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=asBZlIq3OWSgQd6kmk3CY3rXlN93kHAQ4Te2bhWwSfG0Np267Tsvnrua4qswWbMK1
	 9XMJB054fUmeYy/Cfc4reTYMnSoY/4m84iElvN6bCn3bHEwY72FI5LUtlqrt4Q3qDf
	 8C2O0PwFX0mtEObGcn6C/BFIocg/AyxzX1RP9HPvdBboncQb+jci0XkZ79O7OT8vxg
	 UOAXI5Kcv4T81GFpSjaZLjs6tz0RCxYy436ZFDKOmoq6ZuCWSrT98+k6Ov0dIwmzpn
	 RQPszEzS9rxGA9LaORKadBX2c0OE+eNk2O2S80uyEqjkRHaqQ8vm6uNVBwnQpQq6bd
	 u2bJ4htbSQyoQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 16 Jul 2026 19:33:43 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: glymur: Add PCIe port compatibles
 and ports
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-topic-smb2370_port2-v1-2-83d02b2ba4b0@oss.qualcomm.com>
References: <20260716-topic-smb2370_port2-v1-0-83d02b2ba4b0@oss.qualcomm.com>
In-Reply-To: <20260716-topic-smb2370_port2-v1-0-83d02b2ba4b0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784223229; l=2171;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=305DCkMnj6IJ3KfBtHD3BIkdK3eM0+n7UFRwuDNYKoA=;
 b=VSKiFCvboUEYbWXuSLqNUTSxHzvCFRMCOv8oJSSAEmCDxyGg7MxIUq6j6Ge0yZML/18FVI0nn
 4RDHZrPG/1PDp5ShVkKTm75ebrIV2AzA6Cj9o2SbwEbaaahZtt3eDxV
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Centrally define the endpoints to let device DTs that describe PCIe
devices and/or M.2 connectors refer to them without error-prone
duplication.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 55d91c696a3a..8d7354affd48 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2946,6 +2946,7 @@ opp-32000000-4 {
 
 			pcie4_port0: pcie@0 {
 				device_type = "pci";
+				compatible = "pciclass,0604";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
@@ -2954,6 +2955,11 @@ pcie4_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				port {
+					pcie4_port0_ep: endpoint {
+					};
+				};
 			};
 		};
 
@@ -3212,6 +3218,7 @@ opp-128000000-5 {
 
 			pcie5_port0: pcie@0 {
 				device_type = "pci";
+				compatible = "pciclass,0604";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
@@ -3220,6 +3227,11 @@ pcie5_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				port {
+					pcie5_port0_ep: endpoint {
+					};
+				};
 			};
 		};
 
@@ -3422,6 +3434,7 @@ opp-32000000-4 {
 
 			pcie6_port0: pcie@0 {
 				device_type = "pci";
+				compatible = "pciclass,0604";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
@@ -3430,6 +3443,11 @@ pcie6_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				port {
+					pcie6_port0_ep: endpoint {
+					};
+				};
 			};
 		};
 
@@ -3688,6 +3706,7 @@ opp-128000000-5 {
 
 			pcie3b_port0: pcie@0 {
 				device_type = "pci";
+				compatible = "pciclass,0604";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
@@ -3696,6 +3715,11 @@ pcie3b_port0: pcie@0 {
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
+
+				port {
+					pcie3b_port0_ep: endpoint {
+					};
+				};
 			};
 		};
 

-- 
2.55.0

