Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3053C345F
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 11:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778240491; cv=none; b=CBMqcZUiGYrE2MhSdIHN11DAjaIkTaqYnbgI0pJhGhP+PCG0Vs9x3N9QdKg5Grk3yh/gKlc7jjgKYoLPHcPXNItog1SLyp6ZaWEdRzH7tqIBTFoiqdfcM0kGCtRCjNPEt2j+JnCsmTyP/+YKw9zHbWwKm3bs6ICZHR7utxHtM28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778240491; c=relaxed/simple;
	bh=UW/XrYAgo0pzL3UTVQuEqQdZDs4G4W2BqvG+jSGjjVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPmunhwmQXoi8dRuVoNy5vUDRihvh7faiekV8QXYe6GFZ9ZtbTgQt+ZVq7q8AkfIC5w+LQrnapCc6JZ+RN9w2i9T4eqxilfdmzS7aymRMqfca+WG9YV8Y9WFDwDrIO0AnKAWp42VqJGtiDZMFtEytc4cnHKOSkHDQkOfBfWnw+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lB5PNY7o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fX/sYkW+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lB5PNY7o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fX/sYkW+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64880C002384389
	for <devicetree@vger.kernel.org>; Fri, 8 May 2026 11:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ij6VwFxhGsJZ3ci27QfiE//xRQ65VYL2iOQjr4D6LI=; b=lB5PNY7oCQAKy0lO
	Q+O6f+8nEa5+kaiQQfBlZ1Z6gkG+Y5dPmebt3L9SXKdRDWEEePucckJlsyoN0B+Q
	L0JfndWQgxT2tagMAJjzkiK84oVFaHrUOXCjaAQQe+i7uTlzFBLLxoSQit6tr+TS
	IUiM3l2c+JuwCPqYErZqsbGx9/IOmGO9ZjUWT3KLJjVyUl7TexEHNkkAK6fYT/E+
	E0aviw/2hb7svAEix25btL8y6i3mRtmXNA8PDtl2/SKygfzGuijtfrIgajfici4R
	JWph8TsFS53fmcHtYv+aAKqYCjx9mDyUqfvZwnRRjwlVP2jclRfX5hKXN7pi1sVn
	rlwqwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwukwhg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 08 May 2026 11:41:29 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eb21daf7ddso130141885a.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 04:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778240489; x=1778845289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ij6VwFxhGsJZ3ci27QfiE//xRQ65VYL2iOQjr4D6LI=;
        b=fX/sYkW+fXIUT6roVmBy/0vjav5AYbydGjZXeHVkbNbET/ThUP6mRPzK3sLzVBQa7l
         2cKOPbCZoaksg0Cc+rTv/8cJ9EdZpOJq09mTrTHxdBzfFn820kDy99TI1X+NTyESeiyV
         B/KVYDcVlIHL6kuJ6UFJqntlf1IYTnfrlkkmkbC+TMmnIAY+bBeiUzWtobQprGOff8y8
         xf5jnkqsdmslWfA2gsbGWi6EfN+X5TVnahLSWoIPyECSDfLscDeR+BTkxSjkkxNU2rFX
         FDSrjUhN9BIs6lxYv3DC3KMClUsXkqpATzPwqhWcY+W05+M7ad7dReWVkDbaBwbQy9rj
         oAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240489; x=1778845289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ij6VwFxhGsJZ3ci27QfiE//xRQ65VYL2iOQjr4D6LI=;
        b=SaqatU9tNYiU7dthO0kSiUdRF9QnJBq7lR9KJofGRbWbF7Xtd0txm3fqNf9pESCU4V
         7R3Ks/mtDzC+wEiw0D1ricFMcEjDIsqHip9lLgCJWvg5Ni12Lr7mHg/FXqguL1/l/Q7H
         YxeysMHbJjIxPib8zlcNU34O5Kvp0Kyv7s2Eg8gQS9pOuIe1iQEXSxAjgGw2yz5PhfQX
         nn/d8ek91wuvonnbD+53U28ypnU11rV1E3Fk1MraCTSxWVEqeXFyUXC4X04NKJJ3LjZR
         yIUR/vq9uIL/R7LaMaY97uH5wl+7SY8WnWCg7OSiy35iIi2mRZxoynPTvZw2XGjXM1NR
         vs7A==
X-Forwarded-Encrypted: i=1; AFNElJ8vPM84vFYtdFEt9U8PiRt7necc94SMarEeRAbEo/OuIqzU+zMLxLj7NmybtF12aYsjjEsKOcJbbNBF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6zuA8JwmU6CGoAwQe0iviWEOZnqUfOsb82P8VcwB17BcyyTeM
	XOqlx6/hvC0MIMmPSMebV9qurxTIsE8cwspfCYp9KZaaecMZpUE7S2Q/FcqEV9EDGE2vKG9lktz
	N25+xbo84+Tofdv7bAMdU9+DADp2OlzdJop/ufA3wwZxbu6LUuihhJY6uhsMD2ArW
X-Gm-Gg: AeBDies2yFhLu8uHBQuSZxI92yFLlvov0ZykqREqwUIn31d6RxaOOKnWLIl+9LK9JlH
	i4HDR2kXXtyz7Y0MFFARYgrpleJ5DsywOYhcHQZ7ywo8GgbIXUrm4XfgQI0sOHzB8q7NN5G86mq
	R0gyEZvftOLzvBGdKBFWFyPZChp3qgCYuNZ2oWx40sqNGVnPzAs/Xva38IK4E3Gv0LoeJAuPrLO
	/eFykW5Gl879yqkRss42Jygpi5a+0C5qxEB32uaJpsiVDnPrNu1FeTmaoze8Ihbsff2A8owz0EX
	Y2SA48mWgJnSNzhUlT17mnaQ2oFbEkDvKC9rWK848JhBfiSQXiwRgtS0h7FvDOZ43lK2mXjQfVI
	jWAp5qeo+gJ/ZXkoXduHnyjM1UVp6cZNTiGqVoQasaphWfMb7nl6JAoeic0E3VNjl57QposT97M
	Te3sGLpphZ769m
X-Received: by 2002:a05:620a:2586:b0:8cd:9665:9eff with SMTP id af79cd13be357-904d4b58e5dmr1727695385a.21.1778240488751;
        Fri, 08 May 2026 04:41:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2586:b0:8cd:9665:9eff with SMTP id af79cd13be357-904d4b58e5dmr1727687285a.21.1778240488181;
        Fri, 08 May 2026 04:41:28 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-907b8d9eed0sm179193885a.19.2026.05.08.04.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:41:27 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 08 May 2026 19:40:00 +0800
Subject: [PATCH v2 4/7] Add dtsi to describe the xe180100 CAMSS block
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-hamoa_evk-v2-4-3ebdca3e4ae2@oss.qualcomm.com>
References: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
In-Reply-To: <20260508-hamoa_evk-v2-0-3ebdca3e4ae2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778240451; l=6089;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=A99zg/2bpxRpuNCcBtMFYja3yXbXdYAWdmH7vko/GIk=;
 b=fdWcVDUqxkTe0eKXZKIV7iTnh/6zEp9yBCVxKbdDx2md3UYa1G0rOPABhgoh2f2pPH1STjwDL
 5x3JMmXhf1iAfV3mkR0w6VI3dPtzxguLlKK6oMESm4v69C3ZJDIYssF
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: 1eBH4wWHf6OPKnYA8-nqeB_-Dus0ORac
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fdcbe9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=oZ4ORCjJA6TcenDLY10A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEyMCBTYWx0ZWRfXzVt3gDsZuF02
 d4GKuTVHuMa4KRXKNaJjc5un/dWnn9B9JaURxVArcp9kwZlmF5lTilNTQy6qRnkjePa6OCJgJ0s
 ZhKMuqaZzJkGbbdxl9SWQbK9hbUDlohKuEXcCn6Nc0lifJZ/qQRMqjOLndi7cYb0MFiYcR2uPAJ
 x/0F0sw9NVL7HiVrT9/COa+cjbFgHW3f8wGAQrBcRR0vd/zieixrjWpvw8N34MXt/KTnUV5ykgs
 ATp4L00pq8hhAooqFtHACHLVg2n/cvT6xMUWEMGmzU/zXAG9TdhuqKEbr+rcEqaAUcG7Cf2H3yB
 0zebtxO7IUaiHbpTO59fu3/nTn0QGzLfioRHtAahvF31iFEgSCctplSNoWLT59lrBekyry5ePHU
 rb4n3M4dBUkvAJYc0msXE8G0HdmjZO20SHfcQ7tfVZ8YsP9KWpHmViBOWmVYBIrN44ai6FVyEOq
 KrmdZSftqSaBAhLc5bg==
X-Proofpoint-GUID: 1eBH4wWHf6OPKnYA8-nqeB_-Dus0ORac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080120

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

4 x CSIPHY
2 x CSID
2 x CSID Lite
2 x IFE
2 x IFE Lite

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 183 ++++++++++++++++++++++++++++++++++++
 1 file changed, 183 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 74d6e4300506645a63e09490883eabf749829e58..086c94217eee64756b734f436f1f0b49d49dc582 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5629,6 +5629,189 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb7000 {
+			compatible = "qcom,x1e80100-camss";
+
+			reg = <0 0x0acb7000 0 0x2000>,
+			      <0 0x0acb9000 0 0x2000>,
+			      <0 0x0acbb000 0 0x2000>,
+			      <0 0x0acc6000 0 0x1000>,
+			      <0 0x0acca000 0 0x1000>,
+			      <0 0x0acb6000 0 0x1000>,
+			      <0 0x0ace4000 0 0x2000>,
+			      <0 0x0ace6000 0 0x2000>,
+			      <0 0x0ace8000 0 0x2000>,
+			      <0 0x0acec000 0 0x2000>,
+			      <0 0x0acf6000 0 0x1000>,
+			      <0 0x0acf7000 0 0x1000>,
+			      <0 0x0acf8000 0 0x1000>,
+			      <0 0x0ac62000 0 0xf000>,
+			      <0 0x0ac71000 0 0xf000>,
+			      <0 0x0acc7000 0 0x2000>,
+			      <0 0x0accb000 0 0x2000>;
+
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_wrapper",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy4",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy4",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x60>,
+				 <&apps_smmu 0x820 0x60>,
+				 <&apps_smmu 0x840 0x60>,
+				 <&apps_smmu 0x860 0x60>,
+				 <&apps_smmu 0x18a0 0x0>;
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
+
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
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+
+				port@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0x0 0x0ade0000 0x0 0x20000>;

-- 
2.34.1

