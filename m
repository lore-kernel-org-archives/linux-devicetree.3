Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2B735AC05
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784730256; cv=none; b=AezDDQrCZclicZQG68v1MQ27+iwnLSbX1X6Tpwj+va8ho6ViXZM7m3UuKRWf1b9dsbNepBCyKSSdWfhhD0OXBlCG2FN+u0LSU83+YKDW6rulXJ79u01IoXTWrPQ4sOBVDUXbxciOkO7qAMm0IH1xzfqtcWFvIrHHlFjQzHuEihY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784730256; c=relaxed/simple;
	bh=Iwr9I4rJTjSWhl+jXctP7orL7YsQe2skNGEN4QMXspg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PJA/CMMRIllA5k5N4VHkpXWYEE2CeZyZucIVhbpQK2vVhF0jGCBJRuBliFgf8SRV0bEZwqALNBIMl/vDw88n6y2ZLQUgd6ZeZ8XJVFIRvfQjaGe7+T9FUZS7STJbM5mMj6tLD+4cap5bmCNdJTFMUTOmlvuXJUCUdqAxMbll5LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pk/Cr/49; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iq0yJi4o; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pk/Cr/49";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iq0yJi4o"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWdpG974066
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:24:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YA8gMowYmN8
	9etP3+D2UnA/U0zoBgXxwoQNB5la8VDE=; b=pk/Cr/49vHrCiG4yi3YqFUjdzhq
	hd6wDEeKkspNSK3DC6gchv616G5VIP8U4CFwfB9JPDpv9gp/8EmPleO+nbys8ZM1
	qxhwF2jD9N+vK2vWXvd7C1o34ooKezDe9OHwvTBE56E1Z1DM9ZwjXh92DOkldoz3
	XKziT6kmWg2gRiMiVegJrYfnLk4uRr6QGaw33SfqNJAxQhh/NAosVHoO/gISAq2e
	p79/UaWiXy176PEdtyxja9UoZ3KRV+11alfM8DsgzyhqY8E+KfyeeDsSEuYDPJWA
	Iu2hzcWoMlHSiw2SuENxK//76HDyWNrITG8bifBhlHU3rV6rTGEmzNJuoSg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjuu78yg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 14:24:13 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so247717805ad.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 07:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784730252; x=1785335052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YA8gMowYmN89etP3+D2UnA/U0zoBgXxwoQNB5la8VDE=;
        b=Iq0yJi4otmtSM7cwIVE0SqwEJdFmfLHsyc3Fz0URr0NE0fcQzr7tb060ChLRghp9wg
         gEt/k82dvExliio0cMOOk221niiCRrxRU/RGiztclYBW6+Z9NcsPOleh+yV13VSN/jab
         Nh4jitzbGpIYcqHpVMhaa8KSIFjsIl/s8BMrIVzQqgK1VR1Gzg7SqmseqCfpvdcGWhcF
         2MWpT78v+KXIDpx5O7tkyh2K4rQ7y5p+2irgFZI+LyQ5NboBZ2vkq1kPqEZO3S2cdAjR
         wWc+6uvbZbjJhquDnqM3hN/rRTsyR4Co/ABaWBIawRq++ipAr9B4IYDen/+zNWNsl5yW
         CVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784730252; x=1785335052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YA8gMowYmN89etP3+D2UnA/U0zoBgXxwoQNB5la8VDE=;
        b=AveQ4CQM/q5457j+PoBYL/dQoSbQKcIQGZDy4esFQYUelTA2lEZfXB0FH8y0+KaH1j
         XK8MOGHy6NNcrzCBEWWhYX5ZxKrzl0xN2fXuvuezLRBvk8FjlDuR0BobsSyJPhn512HH
         gQwKfYWj39GOpvRBVgbgoMKZKYzclBlyaIgFhhBoM+z6BHjesHCEBLHFcj+wb83e9oHI
         ZTwaFczcjHJfz08NS4G8f8aFZvCMVH6Y4XOKLIWJIQZgLMVwFpljGyIlE/Y9g22vk3uy
         F5xApBmIHECgCTfLFndBEnvT6pRgxczIOxsvSJxIxiij+F87mI6NUHdFsidyzTxeVx+v
         aC4w==
X-Forwarded-Encrypted: i=1; AHgh+RoAHUvprlIGjbMIdsp7warImrwzE0UT3iN2nnintzJtZNCFqH4ykWAgZrocgdCfZLa1GkDVO4ueLDp2@vger.kernel.org
X-Gm-Message-State: AOJu0YxGDgMB8Mb1iwoE+czFdwJiGpvTI++YRHza4sWBcGBK6hXEtyR0
	U0Wb2PP/PTwhVFvAO10gwGUDu51aZqcqKtl1ksTvlQ5LUrkotYSeZcGq1VHfzQoE5HRdnomUUDj
	FiCGIMYVs1bjE9okfNktHZWCUUR4jcRsPI/AF4kAd3NbQYZr7LmzZy8LLCfF/uz1t
X-Gm-Gg: AR+sD115bX8XJNFMVwJGvJ0KCXjVgylI4jknVQE17Pw4bO3b8YG5TiI2zuX8xgKYQWv
	vvLGL5ASOLUi0G8jbM9RB+2/vz+FF2+0AVgjRzkxxtAgk2MGOvW+2thYCyqmo1w7m90ESTJzuJx
	o4Mh/2WZCk+9t8/ZeMFnXSW7GzU3fzKFFFF6jAhwBKDSs6RmZloIjJzCk9a9B3AkMPs655aJZWT
	qrqTebrQ4gA9kPXUQerkIak1NhakXsE7MmVshdrJ98+QeAIwwXD33FETMqdLJumGUqwxjgdAtse
	g+ARnFoaP0gantItQWFLAj9HaRIsaLVNq8H+T903qq+KUtEqTY2r1VnP6HsuuP+Y80Ltr0Oqg6X
	G7bZ1GljqJnyWx207M+8yQiCZR8g=
X-Received: by 2002:a17:903:15c3:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2cf34832649mr252123285ad.6.1784730252391;
        Wed, 22 Jul 2026 07:24:12 -0700 (PDT)
X-Received: by 2002:a17:903:15c3:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2cf34832649mr252122045ad.6.1784730250809;
        Wed, 22 Jul 2026 07:24:10 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc7d8fbsm11231211eec.10.2026.07.22.07.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:24:10 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V4 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
Date: Wed, 22 Jul 2026 19:53:41 +0530
Message-Id: <20260722142342.990384-4-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
References: <20260722142342.990384-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TE0sFn4X_P__qeFQrL9sMCwrwqlVtqFl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfX2kfhM32+7H3p
 zw1jyTL5PSEko3q57x5+up3pKLTPbM9gGmhtdBoVvUee4xA8ZFvXbUbgv0UlLex5t8vcEQO2IsI
 rJZkGT6VG3s2OgerZM/z4yJV5Mbw4PU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE0MSBTYWx0ZWRfX5alxb9yWKHjv
 ROV8aiqedsDTomqe5WETRejAhfdKBJWh0dHyVmOoY2gXNkMuoy4M67ZHDNhO+DkUtR36LFPlBzD
 mqGmfUqDL1aBUTkL73RjkqxaUPmFpx2iVGiarPsRfkyn+fZzPrArFKe2eJxNPZx6CgRuAoEJRIF
 q0T08wLn8M+j4/sB/ZS09+nJ0Sa/wvtTN6EEpA7RrpK8xjCDxXJf6FsSxbbBV/Zgf8daWpWGxpj
 8DoCZRYGsYCRVWy1+tjkSJSjFH0WmvVMv/Et6DKy9Dt4oqQghhQLPsWMaTpqmlkQ3xlmYDrE0UG
 xf5i0RiN0lHUV+U1x6Lj9g+0Q5HjW+/6y+2unbQfrn7MFZMlr2xtgwWGqKBbb8Hd/RNIW+HE7W4
 DGmqRRJdntHt25MGIdEO4xcv43Dt+5VaGAD5JNE1mnOUlHErP3KdUF74LmzddujQDBPM4XX9kM0
 kMd5U0NDPTVEotjQS8g==
X-Proofpoint-GUID: TE0sFn4X_P__qeFQrL9sMCwrwqlVtqFl
X-Authority-Analysis: v=2.4 cv=JuTBas4C c=1 sm=1 tr=0 ts=6a60d28d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9wC1NwHXjCwt_iaUHW8A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220141

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Add support for SD card on Glymur SoC and enable the required pinctrl
configurations.

Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 91 ++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 55d91c696a3a..e7eb710aa743 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4444,6 +4444,58 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
+
+			reg = <0x0 0x08804000 0x0 0x1000>;
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			iommus = <&apps_smmu 0xd00 0x0>;
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			interconnects = <&aggre3_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			bus-width = <4>;
+			dma-coherent;
+
+			resets = <&gcc GCC_SDCC2_BCR>;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		usb_2_hsphy: phy@88e0000  {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
@@ -6264,6 +6316,45 @@ rx-pins {
 					bias-disable;
 				};
 			};
+			sdc2_default_state: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep_state: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		stm: stm@10002000 {
-- 
2.34.1

