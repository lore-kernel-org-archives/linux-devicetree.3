Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51910406267
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815611; cv=none; b=TZd4ptBSpdY/8f3i5bkUKPmFjxahs5AFh40hSxTIX8LCqW3EKpC7/CMC4axaBQTbpG3mDotlwNpBNdcEGZr2pV85p+uM6on+VGDBMcC5IgNJQRJoYrK5OXUOk4x00zpUjoIdPS2G/vzFa6kaz+Kp6r2XfANiiH1NgPTkQW5yhMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815611; c=relaxed/simple;
	bh=5j9HPHByrjfIQ9lcpGSiDGJ2ss0BLEntTz0H14pT1mE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CfFj7y9mQQgJOssQHMbsU9piTfscvqGoyIRYk7Lix/59BMzBEx/Bboz1eLWadT92Fxz6c1wriaCfBMt/1qt4UYOF3wnpK/B8/jIjwWPkrMjBSAFhaCJPT28NoNTt/TGD3zq13/0ooYUSS1l5Gvv/J+ToG6XicJmcka44fpj/Nxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9y+lIH9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YKGXAar0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9y+lIH9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YKGXAar0"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH12K01752060
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XONe5QpG6DzBvhFVWtsDUR60QTo2WcBMmV2k8RXmilE=; b=Q9y+lIH9xCTcKaBW
	AzF0h1oAqTKTvG41lwd4fV3euOSkgHjEZJRZ7G66jdsSFW4Q+E8clAX2f8VGxICZ
	wjbR9qxtgMKoOr+CFmV5ttXt3bQ2OGTheN75GcChbPcZNURn7a2v84vGEfIgcvOh
	1mSd4fAdJpgl+xwriR2yNOB4oLto8lZC+V+wH+Wd/BCKm6slGrYoFn2kyuCG/UhB
	jabnJqljcHXinvRfmy1LS65da2JtHkOXEeWtw1hys8xmY928+f4v880B7JmPI4+m
	wDhi6ivDx0P8u4HUEgAMz2IpBaq+aSKnAGqZwa1uc+dDvaA9xwAPh+Clnkib/B3k
	opyWtQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edd5nguaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 17:13:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6e6a3a76so12928075b3a.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 10:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815607; x=1780420407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XONe5QpG6DzBvhFVWtsDUR60QTo2WcBMmV2k8RXmilE=;
        b=YKGXAar00htXfoSDcGAEQyarHBRcidvy1ftBJjerk1z8z1hY2fIpLux6Fw2VjxJBw6
         m+vdsfweeGO1e+Fyv5MrxQKVFvchnp2xE6YS1yoWtRXmKGdf192aovcsqglRPZV7ZOGP
         YE8KNQ2AvGwakDIsXU0hz43ngAbhE9kOsNrxryXbUtJvexblYk009jvWpfAliMfG1x5M
         UOEwRl+f25LWFf1KkCXVY98/hZOoqOVmkSbKLL99+X/jw8WaiveMiGUq0qOXqF0u9h+Z
         W2RdxXuavJD+/erJ3UskU0qXl7HFe5KYpVpqd7mxgKRJWl8t6TCEsu+HD93QAamXe3Jx
         hDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815607; x=1780420407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XONe5QpG6DzBvhFVWtsDUR60QTo2WcBMmV2k8RXmilE=;
        b=P28NUb1wHtg4+3p7OLHTOKI72ObQV/4OSIhwgt4kIkS6nUYzy5dDTfP048gHgJq2JV
         4N3si3czZCmO7+Bb4LQmngC8AJOnNAFP8OG4txDJtxheiofFSrRXa7nXZjeZehlHeoMK
         yLPZYap1bN0gT0Gq90+jqu4/+V4Zm5olHjixe9A6fbr5AXfUYFj1gdda+2Orf4w7ajSq
         MNj+7tcZ0siY0rD55PpPVVvTyK/O/aI1hueP9hSIg/W+wipDy68u8q7aOgMBZ+OfWGcj
         oCWUoIr00Hq+4BbxsRT6Xr6Gxs3oXbks71bjJWPI/6OxYibR3UoO2MVXsOzQ520iIFaH
         Lo4A==
X-Forwarded-Encrypted: i=1; AFNElJ8R0hhUn219Ltm6iPTNgumN55CKF0f94TMLSwLra1BWz3Z0bV2DsyEydNheo7QDWab0wvqb6oILFi5B@vger.kernel.org
X-Gm-Message-State: AOJu0YwgSArP6cDUTSm9p0GilpmhR2vWs7qXRGhr8drXebl+VskgCE0d
	Asj2NfvIz53k8FQh8y0MFdTy+09Cuac1HcZJhi4zvKuMmk00M7XNZ43QsEh9Ag+rnbqOigYltft
	WHx7oABS0mRgJ0nkJeknZl0I2sRiFf6yjm96b7B2x9XKA6UbVbV1xJ1lmrx0p6UWr
X-Gm-Gg: Acq92OE4S24V96Okwhadw2PLDB+6c/iWx5rZ5CxRkcsVfIRmn0mXwi5MNo5Npysnumf
	s5DLRKuBpCijHIb3gkwc7txBHxRlbjzHcBT7xCjed4Bv80QaTmyLgbbYAFE0ow2aANvzYGyeO+g
	nRLDHJ/78927HH7PyyoCDUfNZW3bCcBaxiiz9EL0DV7Q9wVzfHwZEswfjX2ePdaa6ANDTT6Oo5y
	jz2na134+72J9e5NfZ9Kv7WXlRNi8kXzc9epJo5iPvs0rzyUuM5+a0YbJoXunJf/FfLK9jl2V3L
	2m5wYA8rMu158fA6UleBZZUYIYrZSH0hdYudmRc9s1x/8UHO3D9jRHFi0Zz/AiXZcUeMBDs9nuw
	RtXPoAbNP0o79La4vaNZe+HKwY7Cyu3smPgxNKLLDOqUc3zmyhS9iLHjIHemnEhk=
X-Received: by 2002:a05:6a00:2447:b0:835:424f:6a83 with SMTP id d2e1a72fcca58-8415f65c577mr20365430b3a.41.1779815606917;
        Tue, 26 May 2026 10:13:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:2447:b0:835:424f:6a83 with SMTP id d2e1a72fcca58-8415f65c577mr20365368b3a.41.1779815606442;
        Tue, 26 May 2026 10:13:26 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:26 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:48 +0530
Subject: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: WnmtimQKBH_lFIxYAbEuzpGSR3c-8XrU
X-Authority-Analysis: v=2.4 cv=TZ+mcxQh c=1 sm=1 tr=0 ts=6a15d4b8 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7JZC8XBhqYczC4Ahd7wA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: WnmtimQKBH_lFIxYAbEuzpGSR3c-8XrU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfX64Uc+yDvFVbO
 t1qXiXH5WCuvQHBTTqVUccaZ2jE/bY8tyl1Mq988MuKgYybW8Kfies9YAtjZNNZbLn/KqN/+6mb
 akz5uUSiNOS1/Qp+wleF6wjwC0q8pKQ0sxACsr/cb5r3CTtvpQ8N9dkwzqu7BtxNAF6LjPAGl1o
 lzixIOYwlp6jJEnyKWYbUb3gHpbWlDJ+ef2Y/C77aplWlygRoQSSOPez4McEzKqBg4216MRACp9
 6wELYF6epBGTmJDjp2R58tUfEIdOBB6G8beexEtzGI9aiG1tfub9oKFCDnqrGg33NGtwQBMNipw
 G/apgsp+vrEbSr4/4lqNNx52EP5BLDe0IYusSYG5khal4Jnv6j4DCQy7YNefqH46X6UymH6UC6X
 7q3rBT8t4iXTSrt3PjtJH9elwrHOiA1dy3LBe2Oo11Q+R2PZNu2URbsRii2R0PcSc+jjVn82f/p
 cFCbJt+8gTWk9QDyjEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149

Add node for the Shikra camera subsystem.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..6c47cf2a7ef26b4bb7d7f642a240b435cf5208d8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -604,6 +604,105 @@ opp-384000000 {
 			};
 		};
 
+		camss: camss@5c11000 {
+			compatible = "qcom,shikra-camss";
+
+			reg = <0x0 0x05c11000 0x0 0x1000>,
+			      <0x0 0x05c6e000 0x0 0x1000>,
+			      <0x0 0x05c75000 0x0 0x1000>,
+			      <0x0 0x05c52000 0x0 0x1000>,
+			      <0x0 0x05c53000 0x0 0x1000>,
+			      <0x0 0x05c66000 0x0 0x400>,
+			      <0x0 0x05c68000 0x0 0x400>,
+			      <0x0 0x05c6f000 0x0 0x4000>,
+			      <0x0 0x05c76000 0x0 0x4000>;
+			reg-names = "top",
+				    "csid0",
+				    "csid1",
+				    "csiphy0",
+				    "csiphy1",
+				    "csitpg0",
+				    "csitpg1",
+				    "vfe0",
+				    "vfe1";
+
+			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
+				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
+				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CLK>,
+				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CLK>,
+				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
+			clock-names = "ahb",
+				      "axi",
+				      "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "csi0",
+				      "csi1",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "top_ahb",
+				      "vfe0",
+				      "vfe0_cphy_rx",
+				      "vfe1",
+				      "vfe1_cphy_rx";
+
+			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
+				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csitpg0",
+					  "csitpg1",
+					  "vfe0",
+					  "vfe1";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc";
+
+			iommus = <&apps_smmu 0x400 0x0>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
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
+			};
+		};
+
 		qupv3_0: geniqup@4ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x04ac0000 0x0 0x2000>;

-- 
2.34.1

