Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11560442FDE;
	Thu, 20 Aug 2026 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229447; cv=none; b=i8SkEHoLf6l+3S6+RrKtLdFumhUqB7pez38M5D5Fwo0snsGROkhYCS1HMupc8cCjyl5C+ka8Lmv1oCNS0lqhLFwbdU0oG0fuMbE/eWm0+xD7gWTGfDQuwFr6EW3HHg87AZc0yNU24lshuOyOGL3J+HZaKsdnKWx19wAu+puwhCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229447; c=relaxed/simple;
	bh=Q5hEPdRXiZ8+bSq/ir+iccDb8GEh5bgQP/Hi8v+Q+zs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p9k+MHzgJyaFAfcYJghjZxf/H9ClIJxQJw6yHbB5BzuRBTOL/N5rBLY7+MWkNOshdm+BpkJzo5J2vbYcSPaUbWL5Rc0MWEOwV6XwtZX0VQiu+OkjvPzif3YfJoZ7GUSVI06JO9lhnKi4OlBu3yAubgFssSOofOrYWdboJg5CINQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mChoXdsy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mChoXdsy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D1B21F00A3A;
	Thu, 20 Aug 2026 12:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787229445;
	bh=yR5ZzCfs7WyRDLFIsPoy209U8J2FiIeZGQEb96twuxM=;
	h=From:Date:Subject:To:Cc;
	b=mChoXdsyaYWxCXMsri5+VJtT/7C9PJKnrlOodKbikDoLaeY0mR+Lgd6sM/xsySxGj
	 4D7/qPfAM2eSOg3PmCcbJ449YXMTGYX2WGaTXh7RbMIFPtVshUDr3rwcj7qay13Ixt
	 /VCJXHZvd9XDb5mDypv3bmSVDnfLVM5KrFqJECLROwRalFEdTDMLIwOsyqpg4XyVh3
	 +i/geFTIKrNtY6BzKHAip2FQpN2BTKS+mLHtNhk214fbvoPrBpRLQ7v9L96hv18uO6
	 dqSHeQo8pmiuZCFvHabUxPjDdW9mhCmSyn/G4YY7yXDnHbRuCCeGn5sPGRHvVIaNC7
	 r1hrRvF0edotQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 20 Aug 2026 14:37:16 +0200
Subject: [PATCH] arm64: dts: qcom: agatti: Flatten the USB node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-topic-agatti_flatten-v1-1-ba9dcab9dc2c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QoCIRCF4VeRuU7QgZXoVSJC3dEmQkUtFhbff
 a2uDt/F+XdoVJkaXMQOlT7cOKcJfRLgHzZFkrxOAyo06oxK9lzYSxtt73wPrzmUJDqNizZBO0U
 wr6VS4O2Xvd7+bm/3JN+/LRjjAI9qXT14AAAA
X-Change-ID: 20260820-topic-agatti_flatten-2b12516f1b0e
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787229442; l=3741;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=D8K6Cp5Zr+pzkyToLE1cGfMAi0HjgxWIC09yZM00uCM=;
 b=WOHNOtvTjnpd2ijVcAzZSL8IQ2BXdO0mvQjK85nd2I4WN6AXW0KgT7TDEnCR6oVSzjpX8K/L8
 gCCOsIzZkHwCj7zOAJ/qEOyIfcou/WLiHCKRZlxFWDnLWjNYSw/vj4O
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Flatten usb controller nodes and update to using latest bindings
and flattened driver approach.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
I tested s2idle sus/res on the Uno Q and it passed without issues that
popped up on some other platforms.
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 76 ++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 39 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 590bd2432d85..e7fed60a59d9 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1572,12 +1572,15 @@ &qup_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
-		usb: usb@4ef8800 {
-			compatible = "qcom,qcm2290-dwc3", "qcom,dwc3";
-			reg = <0x0 0x04ef8800 0x0 0x400>;
-			interrupts-extended = <&intc GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+		usb: usb@4e00000 {
+			compatible = "qcom,qcm2290-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04e00000 0x0 0xfc100>;
+
+			interrupts-extended = <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
 					      <&mpm 12 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hs_phy_irq",
+			interrupt-names = "dwc_usb3",
+					  "hs_phy_irq",
 					  "ss_phy_irq";
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
@@ -1595,7 +1598,8 @@ usb: usb@4ef8800 {
 
 			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
-			assigned-clock-rates = <19200000>, <133333333>;
+			assigned-clock-rates = <19200000>,
+					       <133333333>;
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
@@ -1606,48 +1610,42 @@ &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
 					 &config_noc SLAVE_USB3 RPM_ALWAYS_TAG>;
 			interconnect-names = "usb-ddr",
 					     "apps-usb";
-			wakeup-source;
 
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+			iommus = <&apps_smmu 0x120 0x0>;
+
+			phys = <&usb_hsphy>,
+			       <&usb_qmpphy>;
+			phy-names = "usb2-phy",
+				    "usb3-phy";
+
+			snps,hird-threshold = /bits/ 8 <0x10>;
+			snps,parkmode-disable-ss-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,usb3_lpm_capable;
+
+			usb-role-switch;
+			wakeup-source;
 
 			status = "disabled";
 
-			usb_dwc3: usb@4e00000 {
-				compatible = "snps,dwc3";
-				reg = <0x0 0x04e00000 0x0 0xcd00>;
-				interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb_hsphy>, <&usb_qmpphy>;
-				phy-names = "usb2-phy", "usb3-phy";
-				iommus = <&apps_smmu 0x120 0x0>;
-				snps,dis_u2_susphy_quirk;
-				snps,dis_enblslpm_quirk;
-				snps,has-lpm-erratum;
-				snps,hird-threshold = /bits/ 8 <0x10>;
-				snps,usb3_lpm_capable;
-				snps,parkmode-disable-ss-quirk;
-				maximum-speed = "super-speed";
-				dr_mode = "otg";
-				usb-role-switch;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+				port@0 {
+					reg = <0>;
 
-					port@0 {
-						reg = <0>;
-
-						usb_dwc3_hs: endpoint {
-						};
+					usb_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_qmpphy_usb_ss_in>;
-						};
+					usb_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_usb_ss_in>;
 					};
 				};
 			};

---
base-commit: 6a746cd265aed59107ebdaa9ce039bb832922969
change-id: 20260820-topic-agatti_flatten-2b12516f1b0e

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

