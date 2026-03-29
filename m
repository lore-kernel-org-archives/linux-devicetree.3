Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB62736EAB8
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774806786; cv=none; b=izb0f/22cgSYc7du2ar+50lo9Xl5TSX6MtAJ1vsuqKJsDbOZhkzxogRi00DNJKYz7YK4c1GYR61a9QUVApFkRwbqA0XTOSQEeFgA+NXz2a0I0YYUHajSMKy9hwCmbPFcJ8diwanq1IB3+NrgZv5YseV20VSper+PJMQq8Mt2iqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774806786; c=relaxed/simple;
	bh=j4ws4BJGa06WuxYdyoLT9bm/Hn0TNC8Ttsbn0q7sRPo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s7PBADWACKDVIygQ+B1s6dKumGBek7rCpzFig2qt09q6htzmTmhXkejPq19joaxaVu8N6DQ3oSMp3Ko3zlUf3xpaluhMfKbupKOVNjybhdPfNrtN/5Ce/j0QUmKEFH2veq8XjwrYgVE1ChCYqg8ZKbZMJIkuW3UbIgyF6Rh2wjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzAMmOz7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SK7GC5iE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzAMmOz7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SK7GC5iE"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAhosO201859
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:53:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dXp1vYKqTdf
	Vn4Owmupe+GpmLrMm+neHtKVfg9M9mhY=; b=SzAMmOz7FNIbWd3VFp/r5n0JHaf
	Kj7y70hWExJEk5WS+wviIVC4dR8ufs4jRXEOSNbjUIngByX5iH4REpqAsZn2k2Fl
	m328f/JOAIvjdBS0qqrT7EtRhnWyAsouy2xwfL2GEnoUthKWrvekiTr9frbuhNMu
	a8+MHXqa0DzUB3QFTAPgOpDnhQNU23CMEnTFz5yWwZVjkdmj7+XsCzYI88M/wxtl
	wTj++Yb7D0wF7N0JT9JvtqBHgLdbVWwKr3uew2N4rVOsl9yhjuWq4xBm/BS2+QlN
	Yl9kelIPo122RmGalMfU46qXl4JivNd1xBy1RqWjzB27GBX3WWXjj5FthTA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d66jwkdk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 17:53:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b24eac21f1so4766995ad.2
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774806782; x=1775411582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dXp1vYKqTdfVn4Owmupe+GpmLrMm+neHtKVfg9M9mhY=;
        b=SK7GC5iE9FZ1FccAgBnwxzQBjKIMWKtVBWf8+I69C53P3UsxnDNWacQZBN6X8wt/EF
         EAxWdWGV/80nt+45HMxPKh0thEoGyKZEGlkn/i9RYCHqM15L8183BYIH1qUTCxjZhOKX
         OjpsG6FmdozsokiU2R4/C5SaBZ45jmxexsFWHTnRcH9ZhTTRMA+CX9m3vnXJVgmMVxuX
         e1mUfQkuY2QgOwAGWwOlwSAgUnag+fLJKwov4jHnqQWMr+4PzEavXs/v8ymnOy2Z+14D
         JKAYVPqd+Iauqz/QC+EqINEBTpYKPL6HhSpul2blRf/FRygfkZlKC/gJpKZu1My5EufC
         LeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774806782; x=1775411582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dXp1vYKqTdfVn4Owmupe+GpmLrMm+neHtKVfg9M9mhY=;
        b=mrpGSKWjqThACHgiq2cOvwWydbITxWnTi7il54J+2XxVQvLXEgyObcamT8E1tUN28O
         TVD4EBgz9mUFTs2zsJuwtTbofVqlS3TF6QwbuPpMa98b2dYTWApfm2wZrQpvOisnuu24
         +queavvCaxo8iGSgrhMpGVObEPse9phuwFlO8Z1+UDe3en28JeHaIik8TfsQQK6Nv3Mj
         Gig9rzsrke/u7ieEvYsoA7zf32jOPg+U/4OZCPSlbrQCnoWI2oVYpdubw5BvtGkjMxxJ
         vfDF76RPau4pdS2qQ6ozxWlKuDznZaU6ijlt28aRLE6mS0cNSO//NppgWjSTUXo+rba4
         ZkFg==
X-Forwarded-Encrypted: i=1; AJvYcCWofvM9i2US9vvSy1mG2GlAiq/q8fiOHZlN3L9j2l+apTGTwd9fjm8KYn6bqf1ga86mZPEvPSYNpIvd@vger.kernel.org
X-Gm-Message-State: AOJu0YyHSqy3GGVA7KWuslLPPdQJj6uOo8j2TKzavh1mtrt9VXscZkDE
	0pTPBou7DHu1FpWzOms50+sT4OkPnZJYp5SrA2evYGL+5Jz9RpKz1CNsHs6q1bdoFWpOnOM6ZBj
	K7p/Xkgplv+cR9gj6Y76P0JpKnAIAcs3nHUJ31c0QFR5BVW1IWaLg22e/C60jYMdS
X-Gm-Gg: ATEYQzyghOkfNk+k/mOJF74vsfBBvDiciNQXd+nHdaIJx6oHpYkKHPv1ikREe/Usrac
	uVMYU4LehwOKYSryK4D4+uX7n42z5jyGM/AE45uoLkxzLw2SowL/+g5zEEiutX69C4zK4KQt8E5
	gGhWGQcmHlwPRuggr75U+ykqrMV8YGnE5wa15dlv9o0iNuPCoeUTMw7Py9DGNX2YRqRnDDXLNqV
	b60KHRbpvYaTEYDA2b9SPn50SYCsQ5+kBbdu79IGVFt+js+4VNZyEHYps2KG8YGte62pLKOtaCG
	NAo7vG+VxI19Ij1N8Lk4vvc5Ld/649pRm8U6KVU9NwcWatLOOz3Xos+hDkm3wshXrgv0uf0I3Zn
	kr9Ch5P5gFdWH/mVh99ECXvqgAt35VbGszn73aK4YkGr3LgTAUrufBW68S/Y=
X-Received: by 2002:a05:6a20:432b:b0:398:8071:da9b with SMTP id adf61e73a8af0-39c87848fd0mr10322498637.23.1774806782448;
        Sun, 29 Mar 2026 10:53:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:432b:b0:398:8071:da9b with SMTP id adf61e73a8af0-39c87848fd0mr10322488637.23.1774806781975;
        Sun, 29 Mar 2026 10:53:01 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c769179e2f3sm4435891a12.18.2026.03.29.10.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 10:53:01 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 1/3] arm64: dts: qcom: kaanapali: Add USB support for Kaanapali SoC
Date: Sun, 29 Mar 2026 23:22:47 +0530
Message-Id: <20260329175249.2946508-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=I8dohdgg c=1 sm=1 tr=0 ts=69c966ff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=OvCnZ8610trHg6y7dFgA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: zULR8rd4qtT3cnfzba7W7Ma0_na-FjSl
X-Proofpoint-ORIG-GUID: zULR8rd4qtT3cnfzba7W7Ma0_na-FjSl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDE0MCBTYWx0ZWRfX6XIC348Puozf
 6S0qxqQKULJOUc4wb/OHX0basYEqZrVhPmuAgZ+PF2VfcXlCtR+5bQLl+tRhx/Iir4VGf5lQ4fG
 K+dcjSeYbMSPr7c4EL6xzY1ZXvsKgIQXfs4ZHH38PQmDC6ssIuO7rhYQK96W+PX4Uzz25MomYjd
 4UAbCVV827/muhfQB61ZtHpanln30Y9508FLWj1UsucW012NK9ilxAv12nYcVwn9QEUSsOGCNQM
 l+aDYQHnSFVy6phkQwSLa8931c8ocUdzrEgg4ReHhW1VKTvRfeYaTLnGjqihXJQDGRpasDe9KdK
 NGPmb3ZJ3A1kjgnL1LyC/yoNeSh9Y0pU+juduBYyb64AY8/A3t8ntg488ertxexkTkPOK2R65aQ
 vAF9F9KoaTr+ce1/BcTch7stoN97R53fAFFL4bUFL3OHtIPBFm3b7CXlCrSQlUNmh01znYTGSby
 V8hKIFjQR2vl0WMO4ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_04,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290140

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Add the base USB devicetree definitions for Kaanapali platform. The overall
chipset contains a single DWC3 USB3 controller (rev. 200a), SS QMP PHY
(rev. v8) and M31 eUSB2 PHY.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 154 ++++++++++++++++++++++++
 1 file changed, 154 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index ac6a6c789902..08d7c1a1d829 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -6026,6 +6026,160 @@ pdp_tx: scp-sram-section@100 {
 				reg = <0x100 0x80>;
 			};
 		};
+
+		usb_hsphy: phy@88e3000 {
+			compatible = "qcom,kaanapali-m31-eusb2-phy",
+				     "qcom,sm8750-m31-eusb2-phy";
+			reg = <0x0 0x88e3000 0x0 0x29c>;
+
+			clocks = <&tcsr TCSR_USB2_CLKREF_EN>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_dp_qmpphy: phy@88e8000 {
+			compatible = "qcom,kaanapali-qmp-usb3-dp-phy",
+				     "qcom,sm8750-qmp-usb3-dp-phy";
+			reg = <0x0 0x088e8000 0x0 0x4000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&tcsr TCSR_USB3_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "usb3_pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3_DP_PHY_PRIM_BCR>;
+			reset-names = "phy",
+				      "common";
+
+			power-domains = <&gcc GCC_USB3_PHY_GDSC>;
+
+			#clock-cells = <1>;
+			#phy-cells = <1>;
+
+			orientation-switch;
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
+					usb_dp_qmpphy_out: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dp_qmpphy_usb_ss_in: endpoint {
+						remote-endpoint = <&usb_dwc3_ss>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					usb_dp_qmpphy_dp_in: endpoint {
+					};
+				};
+			};
+		};
+
+		usb: usb@a600000 {
+			compatible = "qcom,kaanapali-dwc3", "qcom,snps-dwc3";
+			reg = <0x0 0x0a600000 0x0 0xfc100>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
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
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			interconnects = <&aggre_noc MASTER_USB3 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr", "apps-usb";
+			iommus = <&apps_smmu 0x40 0x0>;
+
+			phys = <&usb_hsphy>, <&usb_dp_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+
+			snps,hird-threshold = /bits/ 8 <0x0>;
+			snps,usb2-gadget-lpm-disable;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_enblslpm_quirk;
+			snps,dis-u1-entry-quirk;
+			snps,dis-u2-entry-quirk;
+			snps,is-utmi-l1-suspend;
+			snps,usb3_lpm_capable;
+			snps,usb2-lpm-disable;
+			snps,has-lpm-erratum;
+			tx-fifo-resize;
+			dma-coherent;
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
+					usb_dwc3_hs: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
+					};
+				};
+			};
+		};
 	};
 
 	thermal-zones {
-- 
2.34.1

