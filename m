Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC383BD224
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609868; cv=none; b=RZsAx/I4F5UrvUjq1/g5xdEnVHkPbEvHESSlxUpD6FBlsDxAxhLhw1chZ9ZGlPLW5GmkhWsAp7NBsIxvyAVzP5xesNcRaCkxc39UR1w1c3Km+UIZUy9GRl2OtQWf0ZxvefIFYIB+xzRAHsMeVOaxPX6RyPPtQH9tO9vCOJfx2eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609868; c=relaxed/simple;
	bh=HM4Q144WRYIyEOX+nPGu/omCtu6sc0Nnc94O6puH3Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K45ZIUuZENJvAURj/gS5AnX/9JtTteR3D8yPwJqrgteKRppZO8gkAJYE7wYTDrv4mfUKu4npo2p5OY0rFT59GJTkABtPA6HS1J9LJVn82pJQovgJ6T30v7b9Tatwgcaxq3xR/jugAYjoroyaNF8Q13NVoRWhR+HMvixRcsgBfxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZATSIi5V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XxvM3V3v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZATSIi5V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XxvM3V3v"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KNDomt4152305
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HPl4Htm/dQ/DjKXGdMasrfAlZl8n/vEvdiMFoav6Wo4=; b=ZATSIi5V6y0nSvaU
	I5pDdsWrECBX3xbf0n7rVQ2rw55Y5tM+88AT0kI9rgXxgYoI67JXXBqyqD09LkAY
	bPAUi+B8GRQBjAxXOynsRrY5wSHbJPXfK4UNYS0LfbIC561LBLGD2lcO7SutbO3e
	YWqZ3uPESaPVEl+O/ss1R2KX3JQci3NV158oNCfSKqgPrsYSlnlSdKXqmQXPq1uH
	5XmB/DM8UvgrEKBQEkYVP4EkJ/euqo9n7ZkPmcNdrAHcnFS6YvCnxE5hLBZoux2r
	e77vxBcJhs4Xc3xeey5mO0ttzgbC5I6DvafIsUnMczZq9AtXYUo7sjN3y/+o0IU/
	u63/OA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff2hp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 04:57:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cee1ec30f2so102439355ad.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 21:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609864; x=1785214664; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HPl4Htm/dQ/DjKXGdMasrfAlZl8n/vEvdiMFoav6Wo4=;
        b=XxvM3V3v/j+kiO2bxqyQORL+Sb2VLRyae3eGliACEX97gsKHYGX96sF6bD/PgjM7co
         yCI0qPW0v3jCAvdpAtAyHIjuoroTqAv74R/L01nTFH6hcGptqCtCzMaACa3aD9P33hoP
         ujpboSe/UfqVUSDlVo9JOzL/LsZ5TCeRpBSu9UxHYkVgaJ7bjUTy0UzqOefRq/ZTQv6k
         PMSDG5Sfv6S7oiBquYdZZLXv1YgOA8J7pd22m3xVy7HGs+HHwnObO2fB2fsflzKDUHg/
         FxPJG2jacAhNtNCNGGA9Ttq29Lo5ccTW+D5LABXi73sXv9XG/kKuCxUmxP9ZQlQ7Nriq
         BEHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609864; x=1785214664;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HPl4Htm/dQ/DjKXGdMasrfAlZl8n/vEvdiMFoav6Wo4=;
        b=rd8KOXLi0jH1aV3cd3CEGHwFflEQQL/RRJPhLU4CQlRUDB0B5bMiWVbj4eBOckmput
         e00QYhjHgjmrrVGeGS6NDqrSA907perHpHcYif2ww+QKrUP/a8KTPgIuKfbvph8b+K4Q
         jZIkFkcnHtcUnN6EwLvXUCdhgE5Zo5v3IxYYKsWKPx0LGThBnRzMv/iDr8AHEWHtDyab
         hQP8zZF3XyUodXRYr3tf/28GviDPdD0Nbibmm5rmm9a2p1mPn5/wTS68ci+CeEI8bRW4
         ZJZFOtQk0DIm2z3pQsFnk0PNWx8OE2yFxQx378EoXAT7AjRFrR92CLTxjL0arA1jBy+E
         bvQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrF7SyNvdBG+jg1KIziQId14B4+DchNPFKTlyQb+5c0stQBKhnTae5v8buhNNvv/6IhioTzH6ogB9QW@vger.kernel.org
X-Gm-Message-State: AOJu0YxpPgBgQXbLd45LQf/o1yqmToNNdPbyZqbYNBG8wkOqNp7YyqUS
	DjGzNbRy8O4gymdDSyaTP3qjm6hzf9kw2Td3gGQWfo/lk2hxEXM35Adqt6dV5RjAapQsTZfBhZo
	Qc5j/H7Ai5iQVpVqBp0JAexujRnetxjbLiYoTY65epyBDlyopCw4AiAFd9z7aLhvK
X-Gm-Gg: AR+sD1338i6J20lVtEkxqOqcbeP9DxoTU1IMsAjNxYEztsh62IzyhjOXQp6noR1HT1H
	eHyWNnFWrht2Y1rAs7K47o8aR1pmSbXxLTVbwPQqWxAbD6fkVNL2Fx1G01OfwdklltCe3zimn7X
	JUw2hsuP+DtEFICXEDrh/TVQhFQTeuCK1WMF06J3FKZF2oKi25FUdrWnohJQT6wsfUu7GEm/GeA
	Y9zfRRg+cdu7KNob45gNY/oGOn5pE8dpD7y6AJcDj/oRwx/SwMVqPNud/R4tRfJFDj1K+V/yDEs
	tC89WTGg3WmuMW6u7D9itC5JVN8mThDkD9hBLDDeA2fmV+QUjtS2f/zUgK2DWNa3bBtXGDB6DiK
	LlOUXu3YKMUucdMxb8j/Kg1uAaDo0s0SDCXSAbT7GoGCe6ygeThIJySs=
X-Received: by 2002:a17:902:dad1:b0:2cb:2b53:559f with SMTP id d9443c01a7336-2cf349b8ed6mr175351595ad.35.1784609864347;
        Mon, 20 Jul 2026 21:57:44 -0700 (PDT)
X-Received: by 2002:a17:902:dad1:b0:2cb:2b53:559f with SMTP id d9443c01a7336-2cf349b8ed6mr175351375ad.35.1784609863829;
        Mon, 20 Jul 2026 21:57:43 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de301sm42110862eec.24.2026.07.20.21.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:57:42 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:57:34 -0700
Subject: [PATCH v2 1/4] arm64: dts: qcom: kaanapali: Add CAMSS block
 definitions
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-knp-camera-v2-1-a21c3f0ecd55@oss.qualcomm.com>
References: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
In-Reply-To: <20260720-knp-camera-v2-0-a21c3f0ecd55@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfXyvstrmaTu5Ku
 fTI1YYByx6Unmortpf2HN19n1GQ+GBx4dbQaenAzB5rj8vIdIl/0L57x6ZJwhRXAryQRyyjPGYT
 hBiIqkMgf4L9QpCMRP2TvV+UnRxuVIY=
X-Proofpoint-GUID: 9QWi9AsJQX3XiQX-hWB9uUa-Dvz8Wkz4
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5efc49 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_TJ3Lstxay1-k2mMBggA:9
 a=GokwOTH84F2-HeID:21 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0OCBTYWx0ZWRfX6odyWW0aUJj3
 nH1BkP5WfhR5H8xW8JKwpvGwZDRfcTjdlJiTNH0MLtnAy4FZIdBvFLrW7ldefZ8NAOcjxy5Mw2m
 8GhIwTYx3fTEdJKVuUgp5j7rmpy830terN66PbL4fNmKHAoMHNTaeBw6x/ZS0QL05Ah60tN8wsB
 Kj1VE7Hbh2blAxk9yhMn/y9Eua6FMS0GQwmZVWLRJQruqqO9Za0Nt4eYbU4mDIh7Nq6oBysWsgI
 9bg51ntdX7yxDDNDGaYYdmJvVH/SGph2uJ6C+ay9P6pHkoJ05cuO/MorGa/gCthmfJ3SkIZza6c
 c2w+rOoq3IrCHvBDcinb7hqOzxcckT38G0rUjXbX5A8gkKeq/UXTP19A62RtOoCRUlvhjsGLRPp
 qdZ76C4P5FGj/B2cmiPfWYA2T/siAzy5sEazMxZYZAfUQutqHx7l6R6K0vd3isOQNHfOSQjeWId
 Qu8nUZi4/tzrSffhlCw==
X-Proofpoint-ORIG-GUID: 9QWi9AsJQX3XiQX-hWB9uUa-Dvz8Wkz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210048

Add dtsi to describe the Kaanapali CAMSS block

- 6 x CSIPHY (CSI Physical Layer)
- 3 x TPG (Test Pattern Generator)
- 3 x CSID (CSI Decoder)
- 2 x CSID Lite
- 3 x VFE (Video Front End), 5 RDI per VFE
- 2 x VFE Lite, 4 RDI per VFE Lite

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 385 ++++++++++++++++++++++++++++++++
 1 file changed, 385 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 74699bc3eadb..81246faf45a4 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -20,6 +20,7 @@
 #include <dt-bindings/interconnect/qcom,kaanapali-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
@@ -3313,6 +3314,390 @@ usb_dp_qmpphy_dp_in: endpoint {
 			};
 		};
 
+		camss: isp@9253000 {
+			compatible = "qcom,kaanapali-camss";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			reg = <0x0 0x09253000 0x0 0x5e80>,
+			      <0x0 0x09263000 0x0 0x5e80>,
+			      <0x0 0x09273000 0x0 0x5e80>,
+			      <0x0 0x092d3000 0x0 0x3880>,
+			      <0x0 0x092e7000 0x0 0x3880>,
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
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			phys = <&csiphy0 PHY_TYPE_DPHY>,
+			       <&csiphy1 PHY_TYPE_DPHY>,
+			       <&csiphy2 PHY_TYPE_DPHY>,
+			       <&csiphy3 PHY_TYPE_DPHY>,
+			       <&csiphy4 PHY_TYPE_DPHY>,
+			       <&csiphy5 PHY_TYPE_DPHY>;
+			phy-names = "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy3",
+				    "csiphy4",
+				    "csiphy5";
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
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy0_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy1_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy2_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy3_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@4 {
+					reg = <4>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy4_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@5 {
+					reg = <5>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy5_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+			};
+
+			csiphy0: phy@9523000 {
+				compatible = "qcom,kaanapali-csi2-phy";
+				reg = <0x0 0x09523000 0x0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+					 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>;
+				clock-names = "core",
+					      "timer",
+					      "ahb";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+						<&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "top",
+						     "mmcx",
+						     "mx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy1: phy@9525000 {
+				compatible = "qcom,kaanapali-csi2-phy";
+				reg = <0x0 0x09525000 0x0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+					 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>;
+				clock-names = "core",
+					      "timer",
+					      "ahb";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+						<&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "top",
+						     "mmcx",
+						     "mx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy2: phy@9527000 {
+				compatible = "qcom,kaanapali-csi2-phy";
+				reg = <0x0 0x09527000 0x0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>;
+				clock-names = "core",
+					      "timer",
+					      "ahb";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+						<&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "top",
+						     "mmcx",
+						     "mx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy3: phy@9529000 {
+				compatible = "qcom,kaanapali-csi2-phy";
+				reg = <0x0 0x09529000 0x0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+					 <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>;
+				clock-names = "core",
+					      "timer",
+					      "ahb";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+						<&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "top",
+						     "mmcx",
+						     "mx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy4: phy@952b000 {
+				compatible = "qcom,kaanapali-csi2-phy";
+				reg = <0x0 0x0952b000 0x0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+					 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>;
+				clock-names = "core",
+					      "timer",
+					      "ahb";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+						<&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "top",
+						     "mmcx",
+						     "mx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy5: phy@952d000 {
+				compatible = "qcom,kaanapali-csi2-phy";
+				reg = <0x0 0x0952d000 0x0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY5_CLK>,
+					 <&camcc CAM_CC_CSI5PHYTIMER_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>;
+				clock-names = "core",
+					      "timer",
+					      "ahb";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 89 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+						<&rpmhpd RPMHPD_MMCX>,
+						<&rpmhpd RPMHPD_MXC>;
+				power-domain-names = "top",
+						     "mmcx",
+						     "mx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy_mxc_opp_table: opp-table-mxc {
+				compatible = "operating-points-v2";
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+			};
+		};
+
 		camcc: clock-controller@956d000 {
 			compatible = "qcom,kaanapali-camcc";
 			reg = <0x0 0x0956d000 0x0 0x80000>;

-- 
2.34.1

