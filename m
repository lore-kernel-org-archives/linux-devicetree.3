Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224833F44F7
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781784248; cv=none; b=JI/pgcYqju3lLHNCcw8yzm9alq73NrIU4XARCE4HGMAkjny3zouwUlwVa4vg1l9bPY4N4OkFaxTTeHKGoSA5TxmEo4uxJtrcdkb6SP0BNOn/jim/lxZAU5uUNgBpUZtY8ut9YpEw+zorJtryxqzER8C+y2AX8TxFvGXkOAoY4ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781784248; c=relaxed/simple;
	bh=CN7B+Lh5v1f7ljPZ/xx3A2oW+MMpv3B2h0zOfhfjcDY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mF7S7lFak5V4g/CPxWqotnjaXwz0CkrprcVh5oIPreWa1oVAY18mcBqs5sF4Tm4Aqla8Ltt13xmAtzt6cVGdYokbqWOlZ7VGY2hfvbxn9nZGVRgp+gMV2AoOnn+UFC7qWHqDEYLquYLFJ2rgiEXpIM+l/mfs01MNuGGlOrlkCX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HGckqdcl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBgZtjKv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HGckqdcl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBgZtjKv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IArgZv936336
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	50qpAKaZmU7XXgHmmXrFtM7Lmi8/JSAxN0nLlW6ovKE=; b=HGckqdclsLaflah1
	jgUNZj8Ku+8xIBefwXwmbnI++7ADnFRepx7vNcQOsyDUdwd9YQCvSLhDmaROLy1r
	M+BYWAbaQojuHpNxP8+cMd/PjkTxaX/wHbJuyfIK/QeNc61S88P9c5BRz1uXv/by
	371tU/Fe/rFfeWFK4ssLCpEopZiMZot/Y1QqksI25xuQT4bRjTKV7vUzvIomH8Uz
	YQbfE6+eGl5qIc8juQXrjq35kQr55ojIzOGIStVV79kk55gt5GtruzE+6GzBLh8s
	a51Rn/cBo8XvXcQewhjAJWl4sjnqXsVk3hobgiBIsOCFoDMoZ7SbqY3DGGVeltgB
	k3pX2A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4euxt543s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 12:04:04 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-307fd7138b1so1309702eec.0
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781784244; x=1782389044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=50qpAKaZmU7XXgHmmXrFtM7Lmi8/JSAxN0nLlW6ovKE=;
        b=kBgZtjKvkqc4eGTvrhtzZy5hldLbwp/NvuVz4zovI/MqxV+rTuuxNGOnIi2PlaI6T3
         DBcGIrMYqi6N557mjsKWwEykcdFh6/gqCQBH8OFCBsV2DuLTq8SK7Pz/YsjiUZIVuFcP
         7/xg9x0BThhi7un3HQm+iI+NnE6OKAgF+yMWHRiMQ8fizyv9cE4yYKhSPM5RY+9oMN+0
         AaudyWDkFqkiyY3t2I738u1NtTjWyg57Zta8L1bKC47fcbZ53uo8Q5jWAA9f27POhL7r
         fI5LzrMqbAoYpoj1zRrKLWw9CUkJJW0URePr0fxhIC5tGVksTW2VxD8xafnrOoqnKZye
         RxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781784244; x=1782389044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=50qpAKaZmU7XXgHmmXrFtM7Lmi8/JSAxN0nLlW6ovKE=;
        b=Kzq4AUPH3m+gHN0KATL+uhFT+yoQHyzF/1ROewux66sWFV/SbId4uDU3feXtGl6tSZ
         VXVrLWvDEMpKLoJGcCsryfMqKpSKKEKdtmdikQOF153q7tnCSbQ3YVJwTKHkka3t+jq2
         ein1RkvYn00Mn3E+q5I39XyzPAHxOubMJfDAvnHwEdtdDVK4IyvslZrStpyZ3UFyF3Gr
         ZkfHW+0kafhZczF2u2/cBVTE1hiv2ynFVHUXb7qCXs2WlHtsb8TecjLjdiGkh96H7D89
         PzL//yZBLZdT2Nl7hllZ6sYJ1bw/aTygPh7Ugfj0Jzj1LOB0a6phB1tf+q8cMDIHv2Uu
         Sm6g==
X-Forwarded-Encrypted: i=1; AFNElJ+95Z0b5KV2ZyF9BjlKldiyIJNhzahDpGMw6XGxbYQ7ikTKunrjjUefV2q7KyfBPL+4SQX8cf/cK39n@vger.kernel.org
X-Gm-Message-State: AOJu0YxktQyzE+oiafF4KX882kezeyaZGh86GquYi4Z5jtwdeeyaQvd9
	4lN1yswMw+Z6zZyZ9auNnC0TPbpaanzFI+a2DpGTZrxEkyu+6WgA/4k068K6EGrX6IJuNlXbL89
	GoxfwdU758bXKoZQst9zl9NZO1G3qqLQj2G4Wb3bz4/I3oWs590gBFekk8IdpH4RF
X-Gm-Gg: AfdE7ckQojHsrhxuVpoAMGdFsAZN45f2Q2N62/cZI43eOFZWSvcaQ3g1O5fo6fdh5Es
	3Rs0WkF1RqZN4+G1VEN523RiALpg8zABeD4jVkQWWrki/TqdNGXXwxdAIGGv4Du0D6LY9n/mNa/
	gE3u8cTYv6CvfgxoR7PYhPDV+jZQxSJGTiAe8uREzIwwI1g1zT0xP8zMfEJzdGWXwNB+p9LDSEQ
	oUl1MRu51zqRj2rL3muBNjxQoQZa/z0lo+QaxQMBKtxTtWsTnHkLKrp2A3Nm86j2AePqPWopHez
	lXwMZexiUHoAo0U5NDqk9Ty6hxSVt6JcLkpLtbNlqwrTUthcL4RoO0CpY2CECqbiVTreKKlMAFO
	pWq2W9kgiRIDIpzP4R+/kYYoamxZ+O2sM0L/IrvspnhjV6QIeUji5UgwK0PyUlqy1IA==
X-Received: by 2002:a05:7300:cc0e:b0:2ed:6f94:9d96 with SMTP id 5a478bee46e88-30bf09c7bedmr2371555eec.19.1781784243555;
        Thu, 18 Jun 2026 05:04:03 -0700 (PDT)
X-Received: by 2002:a05:7300:cc0e:b0:2ed:6f94:9d96 with SMTP id 5a478bee46e88-30bf09c7bedmr2371469eec.19.1781784242643;
        Thu, 18 Jun 2026 05:04:02 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30be0c45a16sm4177713eec.14.2026.06.18.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 05:04:01 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 05:03:50 -0700
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8750: Add camss node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-pakala-camera-v2-1-9fbb729fd242@oss.qualcomm.com>
References: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
In-Reply-To: <20260618-pakala-camera-v2-0-9fbb729fd242@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: duxs9Qzwj74aMWi45Npd1a8tH-INRY3Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX7ZxxHIdxi6WY
 rkGn/8eNMfM9Iilo6TuTbv0slAJqPZyT35U9ZY97mUU7GyQUbDDPQiZz3ezUgCWnq2qJJ/PuLKw
 8XkEDoJlstBVKfqxf5Ts8+KehmDfKz0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDExMiBTYWx0ZWRfX5hGxMc+bp216
 JUDIdqwigc9AfaH+QONWSBGEhAxGpG++2dhMHID4GmErZJazbsEqPvQYdAtDNBaYr8vQw/6zySV
 20DXAaXcd0LAhw5dlGgnB0LzSM7V14MqWGddfdCJngQzhaCPKMfET4O768oe8sZCtOvNQRsvJHs
 Gxj7a4Ww0CciB9M9v0ikSxXL9B6IaOaqwaRewIFDpDfTa8xfvdk/cwZ3ZeLZgw0PeoVPuVr9ucC
 JU75i2l3gix+CT8dWupqXyohN/hmiopqreHmtaoCbjEm8deZpGeHDaB3aweMis1bWYhNrkfGaRD
 AntCwTdJbWjXqOPF34E4rd0Z92B9pnOzFVQdRtgAiq/fMN7LrTPDvHl13TSzKadcOr1qC9/j9+O
 0bZLqQBFrJoN8GOdmOekIbWUZD3rHZ2uO78jmf/6hc4TFj0GrqkrafD9Q9Aef2jvrBGUfq2MDvx
 phSBUHEV9F7wNqZLrXw==
X-Authority-Analysis: v=2.4 cv=PMw/P/qC c=1 sm=1 tr=0 ts=6a33deb4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=T-Dl8XKw7-qrnIs-YWIA:9 a=FRvXc2ZoFFwWrJln:21
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: duxs9Qzwj74aMWi45Npd1a8tH-INRY3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180112

Add node for the SM8750 camera subsystem.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 203 +++++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index fafed417c66f..15eb588acafb 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3037,6 +3037,209 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		camss: isp@ad27000 {
+			compatible = "qcom,sm8750-camss";
+
+			reg = <0x0 0x0ad27000 0x0 0x2b00>,
+			      <0x0 0x0ad2a000 0x0 0x2b00>,
+			      <0x0 0x0ad2d000 0x0 0x2b00>,
+			      <0x0 0x0ad6d000 0x0 0xa00>,
+			      <0x0 0x0ad72000 0x0 0xa00>,
+			      <0x0 0x0ada9000 0x0 0x2000>,
+			      <0x0 0x0adab000 0x0 0x2000>,
+			      <0x0 0x0adad000 0x0 0x2000>,
+			      <0x0 0x0adaf000 0x0 0x2000>,
+			      <0x0 0x0adb1000 0x0 0x2000>,
+			      <0x0 0x0adb3000 0x0 0x2000>,
+			      <0x0 0x0ad8b000 0x0 0x400>,
+			      <0x0 0x0ad8c000 0x0 0x400>,
+			      <0x0 0x0ad8d000 0x0 0x400>,
+			      <0x0 0x0ac86000 0x0 0x10000>,
+			      <0x0 0x0ac96000 0x0 0x10000>,
+			      <0x0 0x0aca6000 0x0 0x10000>,
+			      <0x0 0x0ad6e000 0x0 0x3000>,
+			      <0x0 0x0ad73000 0x0 0x3000>;
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
+
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
+
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8750-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;

-- 
2.34.1

