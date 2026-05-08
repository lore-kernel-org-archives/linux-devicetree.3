Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37DC3815FF
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 08:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229412; cv=none; b=ern8zFiLpI5VazzyeoMTdZwPFf1UkNxpPc5r3bs7Gscw+cQ9VowsPW82SFIL2e3Cr/RvI10m44CQVqXY6frHLE2ZYqrigkgJAjDMSkNjMsJSISgn7u3NHQxk1tFV/hjZkR/aoRKUpGalH817ryNnRxpOtPdoaelYHOC3jFf+Ue4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229412; c=relaxed/simple;
	bh=MafWGe/lgj1+hqQIV+kJShoBKaZsLIZc3Z4/oHTpjBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBJvD6x843U85kz2LtMbAFHQay8u1+3pIXZP7zUygopO+K5U2C8Z2YMEZPF4+gamfqWckuaCOt5s0c511nb2z78oiQeaPB+UN6YxzA0ZRhoLWVUhlkiz43cGxPNhppbXDvxxDkQgVR+H3DKNv6LR2pEzinhPC/MdpZqg3uKmLrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SO6QxZts; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CdvEv2eV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SO6QxZts";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CdvEv2eV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6486Zmxo1173959
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 08:36:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nf0ZlZoKCzVBY8ovtqcZinrlsomdshX3gPGSsU7hvwg=; b=SO6QxZtsStvYdFEK
	+lsgH8ziMl57A5uMwIaY7iiIl0+TBRDBfmVaqZ75XZgBMCEvgQhPLrvqWdMNnnAZ
	45fsQcZlScLKoV5QhT4iUkf3EeUx2VLPe18/WIrrSWbC3BHOTa0JU0hcUf7B89PA
	eVU0GIb+iTTXqvYwjSLiJWCkDC3NDL6KZkLD+snC2SR5/jfOitmIs90j8Ofgev5U
	KXpzAV7UQfo7ty9gIjFkbHThIrT+th95e1CrkUBgv/ZG1yPI+bbjd6lXO9uZbvN6
	6/UrRK1CFps2/gelW+jV2aNF6xaemA9RJn8h8dpWCZJNMW9v5eX1QQHEQH1lyxpP
	snUmWQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e132ha16c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 08:36:49 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12c35f2c09dso3039786c88.0
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 01:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778229409; x=1778834209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nf0ZlZoKCzVBY8ovtqcZinrlsomdshX3gPGSsU7hvwg=;
        b=CdvEv2eVdm42LnZtT+fko5rDVAyNrSon4eGZwlRXMT6VU8FHv6OiPrdWs9t5aG6MQp
         hyDvkrvQ61MHTj1VgaJEOp2kwOHrYH5A8qQz31elxExYtMJB/TSJZVTd94HUtUhKiDKo
         HTIOmWHE7YD5hEzFI1qmPl0BURPagfaadQs6JWPs4xNUESiII/e94MarBvtsmA5nXgqw
         p1W9abmA3Avtml+vxLe6jsiwLltOvtLnXOgqiouXqQcatutteaK1Hqpd67/haRayhBzO
         DePAY747kEf8GwS9+OzXfS3kmPrAX4Azd7Dm7wZDEwfDh9o/WNkr/C0/CFewBVCMvZhs
         ORpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229409; x=1778834209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nf0ZlZoKCzVBY8ovtqcZinrlsomdshX3gPGSsU7hvwg=;
        b=mUIZTSQ52PG6PirEQ5p1gWD2/cWZRWgw25ZNSgFBFvrs7lkMwswMenxhGq7KxN+MsV
         p4XjsIsE+Z3EyaSMKYKxKexsVICzKgfVBcYZw+/oWcfiOmUsYMGH6YsyYaRNcutSYZnN
         5nFi8rXjMn3L69uZFGnEsX8UZdllLMaoOP1bemP0vfc/+Kz+LyM6XgsGAIiZDtbKLAxK
         hDt2NhsOJd87Hm61MOhUFVV53K9bJsLN+igf+5qxb/Zo/SASRH3RORW+QXifbwCWtSFm
         8wQ0Xq59I/sWrWr+8f9m+Zu2Qj3FJJQoL+EiRqLVkuAJTcf5TwMIIe3Dj27h0wummPYl
         e4xw==
X-Forwarded-Encrypted: i=1; AFNElJ8O/uvqGW7aRg5MyPZpxf1UM954Tsz/mm4Ioh+NeuYCX+gjiEjiuuCbAQrQbL2uLot6gDE+lsCMC+XS@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv+g/uZnsrKmM2GMygsLYgA+4pm8Wjex8RHbj/sychrFH7fvlz
	2XaXfXpEYGC0/PyKy5+t9oPc8SvW6/3ujO/z+p1wBZxAXcd5jxU1EORIzkpf3hmivZBWgK2h9D9
	bgrZq3JCE1c+w0hPmyCgbAppnPiWYybsRWK+WyuIiq1bxSLDTLlV8rdPZa2hAcCCr
X-Gm-Gg: AeBDievAmRTS/egvsh0mGpydkjRnzzpOEjY0mQachwJN2iAcZ0El9lsrRLRlOeLTcHe
	wHkxVAWVem5BRXfBBDjfbZMmWtHmFDzfTlvPWz/77W+DbCcagJZSfYNWB2xtsMFuDFdzHTMWTjW
	yDRnFOjRdsLNOXxLaCixAiaxS27a+6YORv3brzMY9Rk3rhGw6hxZwMsXJK6Glqo4lhGem4EqCcq
	psXGcVC47jk5XFN6R0/4dHFXBTb05ymtNOrFveAYnl9gnanXfRBt1A0Cmz45fpUviNDz5MWB2RU
	sb7GxQr+3wwetIDP36RiHymBRfputN7FWx2KeYoUGx6ytmkJUFDCzUZomAXUnmOir9fnNTzAY3N
	c/+eG9YJ/2G5E+QCpgwJdAubsSYG2boFtC1XFzJl16itQxnIaD2QQUyd8DcY3cHYwwuU8bbF+sD
	gV
X-Received: by 2002:a05:7022:4593:b0:12d:b8e5:5ee with SMTP id a92af1059eb24-1318e7f7339mr5814348c88.23.1778229408796;
        Fri, 08 May 2026 01:36:48 -0700 (PDT)
X-Received: by 2002:a05:7022:4593:b0:12d:b8e5:5ee with SMTP id a92af1059eb24-1318e7f7339mr5814326c88.23.1778229408063;
        Fri, 08 May 2026 01:36:48 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm1504922eec.23.2026.05.08.01.36.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 01:36:47 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 08 May 2026 01:36:45 -0700
Subject: [PATCH 1/3] arm64: dts: qcom: kaanapali: Add camss node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-knp-camera-v1-1-a18e289163fd@oss.qualcomm.com>
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
In-Reply-To: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4NyBTYWx0ZWRfX+JveJtKUjwPG
 d4cfnGe3gJi2aGnDz5sWer2L0Y3wiFXp7+TXbFksR+Mgv941WRmkP0FyFAHylHlWhopTUq/aQgT
 nN9bZc69mhcS1qcO7tcyVlZJvdxBdy2cVj1MLUNfGLE77twIAMUFuYT1a8PaGC+G3bMK0PAc23R
 ABUdLPUKB4DxFQpoQPbODBzCHc6AEQ+JaCNMRUzyIow4SeowGbzQIHrYgpwMTVcl7ItBueGnM0J
 I9Dcn/ev8cJAwrr65GSRvNOvzIzUMPYq7g3eqqbUTkDRchctZ4YrK+5FlYxIYRMiHoZ2mg07GzA
 BsKk+bEaxizvePi39iVpSteX9VoTQIYF02m4GJ4JrXFdpUEF0o6/tZbDfG6R0zmdOZJNlKP0Pix
 H3RG1ZNdtrujzzef165u7yaoyGtG+PA9NgIVgrx0B9wiKZrF7fctxlQIfTZgviQKcNAaTM5ABw4
 jybsVvSeTOB0w4NAjfQ==
X-Proofpoint-ORIG-GUID: zErpPviUXq2S3SIcj_26dbMoO_cjOX1t
X-Proofpoint-GUID: zErpPviUXq2S3SIcj_26dbMoO_cjOX1t
X-Authority-Analysis: v=2.4 cv=McxcfZ/f c=1 sm=1 tr=0 ts=69fda0a1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7R1QcmmplBF3aG8vp98A:9 a=E20C_wW7ne7fmbsy:21
 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605080087

Add node for the Kaanapali camera subsystem.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 201 ++++++++++++++++++++++++++++++++
 1 file changed, 201 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7cc326aa1a1a..9d8aee202797 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3138,6 +3138,207 @@ opp-202000000 {
 			};
 		};
 
+		camss: isp@9253000 {
+			compatible = "qcom,kaanapali-camss";
+
+			reg = <0x0 0x09253000 0x0 0x5e80>,
+			      <0x0 0x09263000 0x0 0x5e80>,
+			      <0x0 0x09273000 0x0 0x5e80>,
+			      <0x0 0x092d3000 0x0 0x3880>,
+			      <0x0 0x092e7000 0x0 0x3880>,
+			      <0x0 0x09523000 0x0 0x2000>,
+			      <0x0 0x09525000 0x0 0x2000>,
+			      <0x0 0x09527000 0x0 0x2000>,
+			      <0x0 0x09529000 0x0 0x2000>,
+			      <0x0 0x0952b000 0x0 0x2000>,
+			      <0x0 0x0952d000 0x0 0x2000>,
+			      <0x0 0x093fd000 0x0 0x400>,
+			      <0x0 0x093fe000 0x0 0x400>,
+			      <0x0 0x093ff000 0x0 0x400>,
+			      <0x0 0x09151000 0x0 0x20000>,
+			      <0x0 0x09171000 0x0 0x20000>,
+			      <0x0 0x09191000 0x0 0x20000>,
+			      <0x0 0x092dc000 0x0 0x1300>,
+			      <0x0 0x092f0000 0x0 0x1300>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4",
+				    "csiphy5",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_NRT_AXI_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CAM_TOP_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_CAMNOC_RT_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY5_CLK>,
+				 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_0_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_1_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_CLK>,
+				 <&camcc CAM_CC_TFE_2_MAIN_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+				 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe2",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy3",
+				      "csiphy3_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "csiphy5",
+				      "csiphy5_timer",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe2",
+				      "vfe2_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid",
+				      "qdss_debug_xo";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 457 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy3",
+					  "csiphy4",
+					  "csiphy5",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_NRT_ICP_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x1c00 0x00>;
+
+			power-domains = <&camcc CAM_CC_TFE_0_GDSC>,
+					<&camcc CAM_CC_TFE_1_GDSC>,
+					<&camcc CAM_CC_TFE_2_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "ife2",
+					     "top";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+
+				port@2 {
+					reg = <2>;
+				};
+
+				port@3 {
+					reg = <3>;
+				};
+
+				port@4 {
+					reg = <4>;
+				};
+
+				port@5 {
+					reg = <5>;
+				};
+			};
+		};
+
 		camcc: clock-controller@956d000 {
 			compatible = "qcom,kaanapali-camcc";
 			reg = <0x0 0x0956d000 0x0 0x80000>;

-- 
2.34.1

