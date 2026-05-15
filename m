Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A65847DF96
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845639; cv=none; b=UDxtpgt1juPPktOqwvOpPrNYvX4xYupEzmnb8QU5vXN7AoBhR/YnomF8HBwf2aYzvxTwEIJpkmQqtZYFoYHoQmxK8z3qzYtFsnuLSPR2jzwMN6ymtwjH2QU97gIPU7B41v+0L3+JgYUzZPzjBWHHID/jaxyOo8/Z/vq5DB2c24I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845639; c=relaxed/simple;
	bh=pJg+R2xE3TJq1ua9vcLgtwOsiqpAX7eHWu4mdzJVQKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SHMIImw8Fnu6AGKMWw3lGIfLxXMZPikG6OFZGd4Wz1gVxRlQzMoZeNWyKubkngg8QRhZdu0r1UXxVxqA6fwPfmOhyQam/yLrrfXywdacZ/f+YyvvxG7qfakSurXMctVZlJ40+Fv96kK1/9MiypzpGPoKAdh7frjjWqbRIStlSuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DsEsgw8W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WneUN54a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DsEsgw8W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WneUN54a"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F8sIX01717292
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7nKgCnI8c2DSmKG5lrtRaSOZViyWlVhBD2IxthKxy7g=; b=DsEsgw8WEvoW5Gfc
	k9QlDtMLSH96Fjk4qu1OOzde0UrPMCqOLZ/Dcb8v8/jnGR98LLd6Ch/dIV8mEnhV
	wX8H0ZzMiJBSYTYSIF4tan17R1SMAhz0dNMNFIRb5as7WLpIXNyYaBcyn6uf0BCc
	AZy7lUyPKX+K4j++BVNlTa5iqPuBEtMT4gBMK/I/cyjtTPCGujc1bQ9mhv3cF4IB
	Yeq0yvwtaO1ucbKVFMWamVl13v4d2UzC5dxMCnOSvDOj5hJp1gi1A7cfWIh1gIMV
	RcEfll1/oRvCCCjyeK1Bk2/NL3UscGutkH0YiAyLvD66ZB4MaaV6vAs8eorLhsyS
	xdLpIw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5tyxsvc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:47:15 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6313c9d983fso205307137.3
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845634; x=1779450434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nKgCnI8c2DSmKG5lrtRaSOZViyWlVhBD2IxthKxy7g=;
        b=WneUN54a40QMjYq4yWDZ7jVZ3e1fhw2PHjzbTX9ebaI1pzLhN0fdxjx+wAfDew54Sd
         sX0wMOGGZJMzFX1xNRWrX6Shh6ys8UPrHdH8bnc7t57n34p9pmS711UGXtnHx5oKPbKr
         gmvsQzvBqPjVGQeoNuVaBGt1fZweFaCbIA8M+n0a5onb6yJGLa8mXWx4p9L4LdHyV9mi
         u0u2HnyG3whtRMTsvgyCqwSqAF91heiYrkCDJW1GWvhS8tLO04znvYSSOo93bzH+Hz9K
         cAIvEB38bEoRIyghYwVM3PNTY2dTiCF4rRM8vX45b26PDXnrfCXT1RJ7wD4KC1XVenrq
         akZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845634; x=1779450434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7nKgCnI8c2DSmKG5lrtRaSOZViyWlVhBD2IxthKxy7g=;
        b=iWfM7LHM+nOFaWuumXA55CaU8HvkjC6enePog2mJdT1bEuPCBetSJo1/a6+lDgjTD1
         aIAVuijomKLAd5T67sf/jiRkEbetk9snkbC2UMJY7XyEVQf30zT/ilTxALUaro0pMCy/
         KcNkBCqM+yrr2KFq956kiZk1Ek3T2lNohqSa6Y+y1T2581LnRAsdKI9snYur08gt+cRX
         X+JIwh+Mslf19JImx9jptOroPvDQJag/qIb/nES0JJWI1FOEHqquPlhhqz2jefvSClz7
         mzC8T54Pexh4gjN1AkRf+glkUL9RCtMSZPsm6FnoRgIDodLeAPBCC1qcrv9+qkE1oFVY
         xMGw==
X-Forwarded-Encrypted: i=1; AFNElJ/dc6QC0yExjdkW/DJVLi/kx4ahEIBRqKhxqqd1MSK57u8j8SuC4JDdmILBDQxyjPxNHr5aC7fLlXn3@vger.kernel.org
X-Gm-Message-State: AOJu0YxOD7li9HGh+kVPXN/TBae4y+9aEpc83n/eol0jQrhkTFf481Fu
	so9UdoA85KFrnm9g/mB+mh6kHYMWw0X4wzx8Rv5pPZEBqCpYgOffpu1H+dpiuBC8c0NlMHBShLe
	S1n+2N2rBIh3PtKQB29fK/t3OUrwRP3JGiptOCkkju25ily2MIqgBhMQEDvAIRxaj
X-Gm-Gg: Acq92OEHqlyO86Zx8j3tQPG+u6czXcf6l2tt8SgspVwJmMyYnFLOuyUo4QniK2E2YWb
	mbb6KDLhUhWoMBvGxM3lizYKGigrecF3qN86IIgk8Ag1Q4eZgHin+idcUrotYPFEpPXEry7AKOJ
	gv8u5h51n5+ffDJ0g/7UCpCswWwI74me8MS6xh7o7ba728pJweQQF5Hl9kUJrz9eGr552pXSaEP
	jLf1OTGyE7mOV5U0/HWsjYJoK5ok6i77G4pq1RyZOXnCfVmASlMHWIP6Tff/XT3FlxZL9W6XlIn
	vIExoB3cCIou9jT/PKbRTOD9L26ava537qfV+o9/W8duW6HGYcSwrb4Ji3t5nEZ2LTFVyuVHv0E
	NrnUukLVTLx/5bZ9SC9oWCjzMJzZ11ft5
X-Received: by 2002:a05:6102:3f12:b0:632:5628:6d70 with SMTP id ada2fe7eead31-63a3d219ce4mr1726738137.3.1778845634276;
        Fri, 15 May 2026 04:47:14 -0700 (PDT)
X-Received: by 2002:a05:6102:3f12:b0:632:5628:6d70 with SMTP id ada2fe7eead31-63a3d219ce4mr1726725137.3.1778845633766;
        Fri, 15 May 2026 04:47:13 -0700 (PDT)
Received: from [127.0.1.1] ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c3150dsm216853366b.24.2026.05.15.04.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:47:13 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:47:01 +0300
Subject: [PATCH 3/3] arm64: qcom: dts: qcm6490: Add JPEG encoder DT
 properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-qcom-jpeg-v4l2-v1-3-f38c2e1b3555@oss.qualcomm.com>
References: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
In-Reply-To: <20260515-qcom-jpeg-v4l2-v1-0-f38c2e1b3555@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kapatrala Syed <akapatra@quicinc.com>,
        Hariram Purushothaman <hariramp@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gjorgji Rosikopulos <grosikop@quicinc.com>, afilipov@quicinc.com
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=dMWWXuZb c=1 sm=1 tr=0 ts=6a0707c3 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=X9MPzu39_fj-rEql-G0A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: W8V6NlaNbznecfzNxoIZOxFLcQQwxC74
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX67+bE2AIWcpI
 NiOC0BU5ztVjyiD/T4Yw2BKmXFlbIVBVD3yY4NfXzh6y+m7oIoWAKXFcux76p6XJNqZjnIAckOn
 mQw2codJMrCFJ8OSuwL6P8ruyqsf2YwEc/5HK4/n00tHeFos+mIaEJFJwmx18p8qYZd1ya4G/Wn
 A7YjnO8aMPJkV/lPR07JFOXXbTiXVAnJI+Gfzaba0RSO4gJtCGPi8OlaUaxhZ8nraKDod8NLMNC
 0cNP5kH+XYdfDRDYhKjJ7/5cYXyCl01q8y/hdW+ILtAhnsMuMutw5+bPPIn4iJaVRWWdB6UQon3
 8AxMGo034QRs87sQER4toI4JOfVQ9bi/nQWZLOjvvAvPmhZWNpTM0zOKgy4owhrteHHVS1GJpbD
 fBtR9jkilZlEOD1eSY8wzR0Fq9OjItE9w7qTed8rbBme3uZprmKxIqxQDJtOmfQIK29t4eOUqMX
 pSVPiPhNYm7e9HBS40g==
X-Proofpoint-GUID: W8V6NlaNbznecfzNxoIZOxFLcQQwxC74
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119

Add the required JPEG encoder definitions to the device tree.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 52 ++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 6079e67ea829..dbfc6cc051f3 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -5198,6 +5198,58 @@ port@4 {
 			};
 		};
 
+		qcom_jpeg_enc: qcom,jpegenc@ac4e000 {
+				cell-index = <0>;
+				compatible = "qcom,qcm6490-jenc";
+
+				reg =
+						<0 0xac4e000 0 0x4000>,
+						<0 0xac40000 0 0x1000>;
+
+				reg-names =
+						"jpeg_regs",
+						"cpas_regs";
+
+				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+				power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+				clocks =
+						<&gcc GCC_CAMERA_HF_AXI_CLK>,
+						<&gcc GCC_CAMERA_SF_AXI_CLK>,
+						<&camcc CAM_CC_CORE_AHB_CLK>,
+						<&camcc CAM_CC_CPAS_AHB_CLK>,
+						<&camcc CAM_CC_CAMNOC_AXI_CLK>,
+						<&camcc CAM_CC_JPEG_CLK>;
+
+				clock-names =
+						"gcc_hf_axi_clk",
+						"gcc_sf_axi_clk",
+						"core_ahb_clk",
+						"cpas_ahb_clk",
+						"camnoc_axi_clk",
+						"jpeg_clk";
+
+				iommus =
+						<&apps_smmu 0x20C0 0x20>,
+						<&apps_smmu 0x20E0 0x20>;
+
+				interconnects =
+						<&gem_noc MASTER_APPSS_PROC 0
+						&cnoc2 SLAVE_CAMERA_CFG 0>,
+						<&mmss_noc MASTER_CAMNOC_HF 0
+						&mc_virt SLAVE_EBI1 0>,
+						<&mmss_noc MASTER_CAMNOC_SF 0
+						&mc_virt SLAVE_EBI1 0>,
+						<&mmss_noc MASTER_CAMNOC_ICP 0
+						&mc_virt SLAVE_EBI1 0>;
+
+				interconnect-names =
+						"cam_ahb",
+						"cam_hf_0_mnoc",
+						"cam_sf_0_mnoc",
+						"cam_sf_icp_mnoc";
+		};
+
 		camcc: clock-controller@ad00000 {
 			compatible = "qcom,sc7280-camcc";
 			reg = <0 0x0ad00000 0 0x10000>;

-- 
2.34.1

