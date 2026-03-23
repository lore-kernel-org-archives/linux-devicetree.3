Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB9733AA1B5
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774270717; cv=none; b=KvOkzy0TboXX7qVb310rlPE2bFRpouhB34jm+Y0F3Dh/cNkPWQGMsLZpUppwZvCMNridkGQoVxj/DfSXnx7yq0KQ95GwChq7XD1PGKDo8XVIrGmi6YizWSyxzH8b9qxBdZTaudTxwR4UJDaF+W1xKuxrRYxm8P5pszwMU7eQm7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774270717; c=relaxed/simple;
	bh=O3qTqvPrEAM2Z6DMps4v+LJ+XWKaRSdRt03qEk2jEP0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KySZjcK6AveOFT7xCXyzVmz67CvgLtvbqVekAJx4BGk2DUKGbrwhndXhRsLckof4Hl6pFi6KcOTEXS5zxg9KHTVPRMXtSQXjpycZI2sxqmjbAAlHvymDw74iAO/4jl6HVxTK4PEsrfVuO81iyLQweqzHSlTeG49e6+BHBeKMHnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EtkYH8Jn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N/+j7O0F; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EtkYH8Jn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N/+j7O0F"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7Jutj443182
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:58:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GuB2uDFgbIo
	dLV5rjISLBBhR1Mies0xNCtvE5IW7Ez8=; b=EtkYH8JnWZEM9Zn9vgVEGUs0ICh
	bMbqDwVxnDU2gUY2OYTvwfx5/NsF9aqMGV/NsyUTwTOQO4XYjEMSmQ2iGYzprZ5p
	9/pvYAGw/7fVvS/F+m4TiAaxfYk9/2KfDU/9/4ZJh9QXxkGn67iJeb1RBuDNGm2A
	yVDiN0XtRO5OYFwbhJMM0753qFPMxgsmqEgnQCf9GKSJA8sJvNgjiiSNr1Vs2jmY
	LGX/gUC9iubmQZRI3YQnSG4QyydAeCFFBwLs8SgknfppHJ105wMbT0RjMQVVJj/L
	+ePSFsjZD7boBcCoF2YvdeW+tEi6paM9eWvHjiR5iDzdSKZT3BAT8D9Xlvw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e5htp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 12:58:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50925fed647so5162591cf.3
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 05:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774270714; x=1774875514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuB2uDFgbIodLV5rjISLBBhR1Mies0xNCtvE5IW7Ez8=;
        b=N/+j7O0F7NjkKBw2miw9bk0jnux8S74mCyxRMJVwr3cSG+ETgQm6hXSlaPqDObWJk1
         fveXfWCYY1+cQT1P8FN+/suF7E4TQ6RGcgiBRhS7O2oYW1D+0pYafK/EZTpwHdn8AYAF
         5DysyFDKLW2eWLWqojfyQ9c8WKY248KiSyeE5TQUuRdFPUdzI0qh29G9SMyDYOn/J3/4
         fKyS0336NxIBSUm3dz01p/DhynlW6dD1eQCKRVOHeTKqFp+bWzgdOd4h1zupVmez5yi2
         dnXRFXNVzLJP8i1Tc3ptEMUCYncxFr8u+JWScLZD2Gg8poas6XysDbvMcFwBGL8febBG
         cRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774270714; x=1774875514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GuB2uDFgbIodLV5rjISLBBhR1Mies0xNCtvE5IW7Ez8=;
        b=PWAmHzAX3XMjglcSTGj8GlxMaWLwSiIu6gdW4gZIedgiEziplDKmsf62PPv9fxdR5p
         boUzj3j/UNQ3M7CgcF3PAqljXDboKo+3z/Nq+fz1rVbt2aBDVdVBJEcSB1xvs2kYZ+XH
         NXBV82WEzPN678BjeWMgMBKHcAoXjXWjcp5Mq05R1Rtvxcu9mqL2o13EKNIGtIS9RWSo
         HqZDIVnDLeaiK5TBhFqsgoaODLcyf2KOI5Ef9wmtlSQl1t3D9xe3B+eTtzFf3Xbi1iWH
         1zlzCXOHZWO/FKyhdY0guhvZF2J0HiovAwgsDEqlY1Om8wxZSCUi9r4vVVJEHDktCMD6
         gfLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaNXXB4FTgu6oigVKKkcNr6dBoc/lb9IMs1fRzxaxfhKn6jMgCXkBSEbX9aMmsAX2hbJVjL8oVkBRL@vger.kernel.org
X-Gm-Message-State: AOJu0YzZjVMZJo5jRh1f4zOCnQ137Kxn9Y9DrZjyiS9cRARVbSSdvsum
	56s/K8Wx/ip9zHfnCsAODrSIj8kdGeubpxnteT8spzt7BGd7461EMMQIV2XqTcJLLfz3SMfTSsD
	kPxBhOm2Rg7rybkgUjS988T9rUuAzK5si8g9Qk+gxdxpGuD1FV+t2MquG3wWjH7NR
X-Gm-Gg: ATEYQzw4axO4tRt+/+Ay68zzCLaQDkE6SotargmomZIr2fN2AHXVPTPlYGYeV2hlGRj
	B68disDCvYoR1nZTDirOoKBnpG02utzd1OErMns0dvC1IrBlCFs//v8EBv06VR1b6J8dWMAJmhF
	UwHMG4qKGHm6xkjjII2YAlxLAKtHumT2SuhE1PlYmoLn1ACE3hW+jm3c78qvv978rbGvXyQkCjM
	1U5tIvbzMdosLwASUWDpFH1BdC1MRTYUXVveVGgOKPRWhl3G1GhDWnMa5oseWKV1vkAKusjsqtX
	SxgwLn96/mEIoWJU/8PU5Nsa/f9v/exdrrqoHx83Fz79lQc/H4D8yRKWHK8KXajSfwqf2Ks1EP8
	lcDSCV1z59SLHvIEiG1oJJKio0R+MeneRPyVqmoTdq9zMXTmLPgF8scmPU/OoUvfK2wVq3K0RSC
	3/44iFy9rCqP1h
X-Received: by 2002:ac8:5985:0:b0:50b:51f7:c671 with SMTP id d75a77b69052e-50b51f7d579mr94396001cf.67.1774270713916;
        Mon, 23 Mar 2026 05:58:33 -0700 (PDT)
X-Received: by 2002:ac8:5985:0:b0:50b:51f7:c671 with SMTP id d75a77b69052e-50b51f7d579mr94395631cf.67.1774270713493;
        Mon, 23 Mar 2026 05:58:33 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:830:450:d9f3:cf55:9f3d:be1c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98335ddfb9sm487139066b.37.2026.03.23.05.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:58:32 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bod@kernel.org, vladimir.zapolskiy@linaro.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com,
        robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        johannes.goede@oss.qualcomm.com, mchehab@kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [RFC PATCH 3/3] arm64: dts: qcom: qcm2290: Add CAMSS OPE node
Date: Mon, 23 Mar 2026 13:58:24 +0100
Message-Id: <20260323125824.211615-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
References: <20260323125824.211615-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WWhj4zSewA2npMoNgOvF3I-VD8f8O2Hm
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c138fb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=mzACg6t9QVaUiISIE5MA:9
 a=2O4lf2QStkfF1PFr:21 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDEwMCBTYWx0ZWRfX/NM6zlJyxX5O
 xGm8127S6V9RDCC5xHUspew03rivURD3y0U76Heix+pKGqWLkgYtUn+7I+1kxmSEHyt+LZ/P5ro
 h1ivGIftOcQYDOCTdTM/uK/YP7BoY+9XJofftz8AFINieoX9uoYhupc2jx55OkbDHabdHZbaUab
 mEssOjglIiGFaWpXSOxwfQbsWLQFBiT7CnMe3nPVx8yPalj7h7q54Va+EKBZTTnLCjyaUbBeo69
 W49PezkRDpelpvfqMkMu38DxhIGpiJXjb060FuPHW/yBHCL3Ow4xFWNFfDiuS0AxOY2ndH48wUJ
 +4WzEzZrU3WdvhNElKdtUKaEe+yqWJlLkZ0QgPT+VkkN4HRdsfR2xKl6rEsG+oY62u3CvzrmCkL
 DAQULyum4B6ILfVbl4Hv/slrVkn03h5FSYQm14mpFT331Do0+81xzzKtwktx3pe88b7TvaFv9WN
 IMQicW/dvLpI3Z7WjnA==
X-Proofpoint-GUID: WWhj4zSewA2npMoNgOvF3I-VD8f8O2Hm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230100

Add the Qualcomm CAMSS Offline Processing Engine (OPE) node for
QCM2290. The OPE is a memory-to-memory image processing block used in
offline imaging pipelines.

The node includes register regions, clocks, interconnects, IOMMU
mappings, power domains, interrupts, and an associated OPP table.

At the moment we assign a fixed rate to GCC_CAMSS_AXI_CLK since this
clock is shared across multiple CAMSS components and there is currently
no support for dynamically scaling it.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c646..358ebfc99552 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1935,6 +1935,78 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42400 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c42600 0x0 0x200>;
+			reg-names = "top",
+				    "bus_read",
+				    "bus_write",
+				    "pipeline",
+				    "qos";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi", "core", "iface", "nrt", "top";
+			assigned-clocks = <&gcc GCC_CAMSS_AXI_CLK>;
+			assigned-clock-rates = <300000000>;
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;
-- 
2.34.1

