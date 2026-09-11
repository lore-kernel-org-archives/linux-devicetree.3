Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7D53E451B
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106873; cv=none; b=JPcdZpiu+jPqfuWrueM0butawBF8b2bLSMV1IaxQcgRLG6NonQXELHk4/85QWiybtWKqpNsUg1NpqFtAwKCFYUPNgBtib+qSn7ywBc89D6ETvqoWBV84gAbnGbxfFgqP4uOiZiGNq5P0chMdPehi/e7ZEgvld/YC+HIKoNQbx7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106873; c=relaxed/simple;
	bh=zNaTzQ45QCKD6bWD0K+HfKnebkoA/A9iSYC6z1a2LtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KkzDCmAJCKWT/UrFKuAaH9kmOLdPN9enNfYaNmzFBYyvD0VNiMp65SCL9DAQe14nsmgzxzSZ2sW1x8Q2/Xml/O6cP2eI0602ml1i1CvgX5kgV0F+OMf0VaEbtFKE+r0nEAWW0GlPVwcnu8i9ifJTpxynkoUhnIX+5FHa1aJtBC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYplHSvx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3Wh9VyH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYplHSvx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3Wh9VyH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B4vQow1930508
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fm++pxDqL3aZSOs8GsRafGg2fgoFosuU+f1X9SfDKGI=; b=LYplHSvx+OdcTDtg
	HhfXGswxwu2fXYkCAVSDxIeLcWMwh6s4V+84gMm+fqYTGOzmNb/cKt74B2KV4T01
	DxGx1vFe/XcjClnZe9kANZI8YJBWJHtvr6ZQltyYt4ba2WBTO5huwzCe/krhap/X
	1tbnAVK5Tnxmisxkrt6kAeavvVAwd5IYAnAF0Gzx1Hkf/HPc7JsK6OixDIUpcvRJ
	civ/7OaXwb+gWmBH9cAdHVdq3VTCJfiMgS3KmBvUpHNJAO72aCj2Kvbomjs5dcWR
	sco6c7ZHVGqkcEI1tWI5YbVAn6lgkc78b6yRSWXkAnOKBpvE7XWZvuZcYtCmSmRe
	AazWDQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm7ucgx54-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 06:07:50 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso818772a91.2
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 23:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789106869; x=1789711669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fm++pxDqL3aZSOs8GsRafGg2fgoFosuU+f1X9SfDKGI=;
        b=N3Wh9VyHBIzvA083PKcyC2h2LEOUSNk9eZlp3UJ26BRjVlM9DxICiKRbUm6MyLpuwG
         CorvEt+geO0v1HSq2pSG8b3+4X33S5wTYXK8wblgEUeBUlZZp7tpuK/VZZrDoXzr+2ql
         yAKfaL/R6e+Q3T0fsgJJKzoS00G05NwnDRCtx4E/lD+QWi0CL11wHZvGmW1mTfMQPUor
         8wc3IuAGg6JyKFu3OnBRa38QPxBu9aAXQkPX74Oq1DVjX6aE5Yf9Z1Hd3pevOlFM+f4p
         fhdpnwLQKCRbEMyxi5So6SOjMNyWC9qjw+imqa79ox/AAWzTmXhoxT7gIb0Z4EiBeTom
         /FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789106869; x=1789711669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fm++pxDqL3aZSOs8GsRafGg2fgoFosuU+f1X9SfDKGI=;
        b=HhLhRen0vSbWRdfNohcIYTyBm/c8OaGuiSNQMtr+m/XstKXlxfK5uxG8F7HTAacUOM
         bqNacpaN1v73DbCtgi9zeJcwuCTb8rW8j2JcjYqd1ScGovq98Jm9CBvoRjwrsXQnfZlD
         JeqJzKco+VLTwJePw9J38pAi0/D+xUlNqifzKFnr2nCmoQbwyeU/6IOOAHmyEVzcwjcq
         KtdnbVKFHBd0MT8A22jBTBwtluMUErxMYEpDNZM3kVde/M9N+wB4hqxRfb5peloTX8U1
         +pZpJSBTTuMDbZIO53HeJ/R3FEthISNEJBd+jibdviw+bpvX59QwTHL2K/uF6xasvqcv
         AM1A==
X-Forwarded-Encrypted: i=1; AKwUvBx5rAJt+vGwmyKzX0ZqrJ2v57ckl24d92fLqmRvwKMG6VKJZ22BHFiD/QMYVPeqeF8qmwHeEcg76vIX@vger.kernel.org
X-Gm-Message-State: AFuF++mr/C7xssRs1Wf8SXi3icKlLtqD/yhi6ORB81JOgtcabHj/K7sH
	LULoBJvKI7RVZEQng+QJ6cZL8fzovSys3VKRpmWbTapqSnM4CnK2OABHCy412Z7KdnRpUbnuHT6
	gXtDrcYWKnn3GbahKeA3IZWBtAjt3sTpybTmAD6s4+XquRC9uE4SgeGPqWUAkCCB6whZnsFHC
X-Gm-Gg: AYBFou1f+R/F9KqOeeoy0ZOyV72mrZuf4N087bLO963MpCU3UNv41P7bLMqw8qf9Ezm
	e+0HH7PQS6JNDwNMf9PlSC7iEzCSZz1Z8aIZq7iJN6uGD05f30i8lhmUHxiSA42l/Ju6/rcRXaY
	45kTg8wKxy5R2fcAeFuCVtkJb+MJ2TmtSO+6A6hnndrLRJ7JQY117Y4wE7gD6uaw2dOc9L0twAs
	WkI+HR1AmiawsoOOHDi3lXMf8Y7RXXRUvtcHwxqiCAvmjCyRy4a8mI2zefVsnMvN7ftirn+JMO+
	/Z7aTlX+ku0JfuKJWLYHm73eniw7mqOamxd6niZ+ANnUha4yojia13tWH3T+qtg9HIQFTAcDphB
	lSPY0v0HHESUPH5Q=
X-Received: by 2002:a17:90b:4b82:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39d9bbd881fmr4497103a91.4.1789106868979;
        Thu, 10 Sep 2026 23:07:48 -0700 (PDT)
X-Received: by 2002:a17:90b:4b82:b0:396:5fce:8e24 with SMTP id 98e67ed59e1d1-39d9bbd881fmr4496999a91.4.1789106868238;
        Thu, 10 Sep 2026 23:07:48 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fb3ddasm2989933eec.30.2026.09.10.23.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 23:07:47 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 11:37:19 +0530
Subject: [PATCH v8 2/3] arm64: dts: qcom: Add support for usb nodes on
 Shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-usb-shikra-v7-v8-2-851ee4bc0eec@oss.qualcomm.com>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
In-Reply-To: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789106853; l=7639;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=1I3yzTLyS1HTTBLxG374MHa0PF3cx6CrfViJFAX9gDw=;
 b=zT85E8se5evT+CoxdrYHkIxIP/jGJcmgrD794EDdXmyO/GbjdDlqK5HsRjU6XV9LxhF0CeJNr
 Feh6JuVIwvjDSPjLN5UZxVzF3T6OcNX/O4un9bCOlleJYqbVpihV02y
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=O4asLx9W c=1 sm=1 tr=0 ts=6aa39ab7 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wA36ycbUlljGYm-j3gwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfX4MFFcdoUCTsm
 RmdvvPS+8NWSFIi5eenDomIWG/2gVnCC64dItObMMaMNO2FwAUsQqOlSExvBoxrk86bd07tUEwz
 oelUjwnZ6td5p0NqCQIQiH2h0caPPjRoNR6MtFjGG9sjcQhv5Hx1yztvHqC6QgO6Fhr4JG/ksS3
 Li8PkbPu/dTeDAmGfBe9h0ousb9otADx7KXga/qKq4hBIBhQMuZ2FuhRZtbRli53YaQIOEWqOZj
 I8z5omZVB6HJRTxvCnaQOY+UJkWIjn8Ld5y3OkqjA6wGB24DiplVk6TjQCSlu+6w1S29kEb6Txe
 FWh7AVvVbp9WINxNCyeF4xW1El2GbDOIlpfUgacyj+H/1UnHCsFHcfrzQh5+0izB5qmzdcHp7ol
 ui95oAFH8ixZOvnY+ZxfS9RDOTFczwjfblFVfMMbgbUkpg2Ys2HpLJpxN3XvrdKH9nGgnJXJH5H
 B5rW3I1BLI11UcOR44w==
X-Proofpoint-GUID: 3HhVHyAMnk-HewtGqj4pCoe9huKi_pyq
X-Proofpoint-ORIG-GUID: 3HhVHyAMnk-HewtGqj4pCoe9huKi_pyq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDA4MyBTYWx0ZWRfX6HbmphyPfJZj
 iZITRl0zZMOXlWzHYfb7BXyqejDGzBI78VINC5JVPl+ftdwyrLIgT7TKk4gkFZu17I3Rfgs/HYG
 VGrPkfi19Hv1gv19jBYnbny/c5EFD/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110083

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Add support for both USB controllers and their respective phys on Shikra.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 233 +++++++++++++++++++++++++++++++++++
 1 file changed, 233 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 921ae2a5a3eb..1395c182a2b1 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/interconnect/qcom,rpm-icc.h>
 #include <dt-bindings/interconnect/qcom,shikra.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -1019,6 +1020,85 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		usb_1_hsphy: phy@1613000 {
+			compatible = "qcom,shikra-qusb2-phy";
+			reg = <0x0 0x01613000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim_1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_qmpphy: phy@1615000 {
+			compatible = "qcom,shikra-qmp-usb3-dp-phy";
+			reg = <0x0 0x01615000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_EN>,
+				 <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>;
+			reset-names = "phy_phy",
+				      "dp_phy",
+				      "phy";
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+			orientation-switch;
+
+			qcom,tcsr-reg = <&tcsr_regs 0xb244 0xb248>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_1_dwc3_ss>;
+					};
+				};
+			};
+		};
+
+		usb_2_hsphy: phy@1617000 {
+			compatible = "qcom,shikra-qusb2-phy";
+			reg = <0x0 0x01617000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_USB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim_2>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		system_noc: interconnect@1880000 {
 			compatible = "qcom,shikra-sys-noc";
 			reg = <0x0 0x01880000 0x0 0x6a080>;
@@ -1100,6 +1180,11 @@ qfprom: efuse@1b44000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			qusb2_hstx_trim_2: hstx-trim@25a {
+				reg = <0x25a 0x1>;
+				bits = <4 4>;
+			};
+
 			qusb2_hstx_trim_1: hstx-trim@25b {
 				reg = <0x25b 0x1>;
 				bits = <1 4>;
@@ -1977,6 +2062,154 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		usb_2: usb@4c00000 {
+			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04c00000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+						  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+
+			interrupts-extended = <&intc GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&mpm 59 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 58 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			iommus = <&apps_smmu 0x140 0x0>;
+
+			maximum-speed = "high-speed";
+
+			phys = <&usb_2_hsphy>;
+			phy-names = "usb2-phy";
+
+			power-domains = <&gcc GCC_USB20_GDSC>;
+
+			qcom,select-utmi-as-pipe-clk;
+			resets = <&gcc GCC_USB20_BCR>;
+
+			interconnects = <&system_noc MASTER_USB2_0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_USB2 RPM_ACTIVE_TAG>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+
+			usb-role-switch;
+			wakeup-source;
+
+			status = "disabled";
+
+			port {
+				usb_2_dwc3_hs: endpoint {
+				};
+			};
+		};
+
+		usb_1: usb@4e00000 {
+			compatible = "qcom,shikra-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x04e00000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <133333333>;
+
+			interrupts-extended = <&intc GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&intc GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>,
+					      <&mpm 91 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 90 IRQ_TYPE_LEVEL_HIGH>,
+					      <&mpm 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			iommus = <&apps_smmu 0x120 0x0>;
+
+			phys = <&usb_1_hsphy>, <&usb_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			interconnects = <&system_noc MASTER_USB3 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_USB3 RPM_ACTIVE_TAG>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,has-lpm-erratum;
+			snps,hird-threshold = /bits/ 8 <0x10>;
+			snps,usb3_lpm_capable;
+			snps,parkmode-disable-ss-quirk;
+
+			usb-role-switch;
+
+			wakeup-source;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_1_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
+
 		gpu: gpu@5900000 {
 			compatible = "qcom,adreno-07000400", "qcom,adreno";
 			reg = <0x0 0x05900000 0x0 0x40000>,

-- 
2.34.1

