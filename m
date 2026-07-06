Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475E5409613
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783347259; cv=none; b=cRGc4+QC9Uf9cMMRMt0Q9Jky+NxVWLVP/J8IsXProktoEO93WQHC2ak+fiZVkT+t3SimNBUZHRoARjUFcE68UgU447QEQjUwm85cHhpPHa5DSO2LkzZEdpu88vsO+nJICMWFVs+yu5kzCXw5is75A9ZRHTKgkbG+oOyI09Lwu28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783347259; c=relaxed/simple;
	bh=7vQ0uKqrSlO2ZlaH3b9H/oONVwn/rPEPYu8psEecOtk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gD2mrlMw2rV0KifjUF6r9go5CGMvqOL3kEHj0o0r79iuz4+TXEnxwfxs07DmsMwKbEWw3pOa4NgiNAjU5CE+D9/Mkmb2iLtgk1WzyNv/msGw2TfV2f+qVwpc6bhtRMNzBs79h7oc2Ftv7ZYw98vKVyTirDSOZ5w74hO1Za1o0Wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8nkltYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xwekt50p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8nkltYd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xwekt50p"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666EE6Km680522
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 14:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k/DdBXFWYVR
	feak4AuuwTZRxi77GMBHL1kC7LE0w84s=; b=V8nkltYdf7oTERsCPUwMDfxA99k
	UG5HtzRqQAh6KQcY1jCoyXResjn1ooDBoH/I9CjqdWMzEwkuqa6TIm6yyli/ho5k
	ZnkFBQF+xyHbiJtnS+c+yKMBJlS/CnQBCH12EyIInVGtV3vGapziqKvqE4BoRCbp
	gkhyxk0GS4vDrwFww/shdCmK5K+HYuklYF9vsKIww0eRhm8T+uqnU31d/c6TCR0q
	6smL0u1OUIAYF+Ilijti7shr6gQWLco70XihfnPmhCCzh/zi6xba9FVoJfiVG9uq
	sUNRgrR16peM2azKlKc6HfPGt5X8Z5OXZbmKpqYhjMnD7IcD5n2Ja8tmrPg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88t89d5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:14:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2caf4173b1cso58613855ad.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783347257; x=1783952057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k/DdBXFWYVRfeak4AuuwTZRxi77GMBHL1kC7LE0w84s=;
        b=Xwekt50pW1MClLr05q2TwaG7Pv8k9C1Xn9zMzwQN4Msg/p0SK5lQhrp+ruxQSj0456
         Ia1RHNLV3NYkeWrpS3BWbANTfkmv0JJdF8VRTM1dzrMC83XrApJBuxelFh0QUFw9wsiA
         rOJ1/BQUTx491SW8UNPheAxGJvcuhZReQ6rUsO79nuDet63Zx7f60fqH7up1zo7tuhZW
         q+gcQSpF79azb2zt2JN9YgsBlCfqlfcZw9EVmCTSXLwfa2+fWEjxO3CzF35TY4Woax1M
         OGaWlXK8y0doQ4k7LkGX6Jc1bKkFx9VS6dRk5u3kbgSggQPg/MTrEAJNg3O5TYvcEOAZ
         5Wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783347257; x=1783952057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k/DdBXFWYVRfeak4AuuwTZRxi77GMBHL1kC7LE0w84s=;
        b=FN8m7cyPMVbIIAfixu1QLTRDmAqqv0yWRiUuCeCOPh0WNbpvlHRA2ULYoA+YJSnXUE
         nzFucRNN8wA9N5MXH7g0HR5zsbgonXAYLlikiiTqcjMkcu7Wz31Rbu9f5UAebv3xpv1a
         e8hwhHdHEnGltzuA8s3Kp+PxcFOcZcMDTn+d8xOURbBxIkTL/QviRyDw2PPVCf/sK9Oi
         CVPcfEXzjX9CJt9tZhigSXqs/hsy6m+a4Lua73KYRC8Gq3pXrfB197g5vnI9FC0BJraL
         J2bLIotJQrKGz7DVT8QX7PzDgchVoEBGT8QuC/Ka2CZtaiFu//cLhJwz3UT3QQrPbX7g
         RYzg==
X-Forwarded-Encrypted: i=1; AHgh+Ro1UuIkgVP6K3EyBvdCU/eVJzWuoCLimttN8ycDVq0edWgU4rQ45yjvIhTYKiXvhf0NvlaQRfsQO4+0@vger.kernel.org
X-Gm-Message-State: AOJu0YymSLIHPesjlbexsxvGwMVbdjLtAOX3wI3P3fRKSHYrTAxGveHL
	/yi2G1RP9eaLoCSvCse1MMxC87SsB3v47JrvI4Nmq2/KeOe9U3MHAwonUb0hg8l5Jnm0hmyiI2d
	WxQpwbVl4hLFF0w8LeMET+Q0yRi5utPnRU9rQRgvaM00ghiTYH7S0VfXlfejzsMuN
X-Gm-Gg: AfdE7clU50XXHJMpJQ/t8YHNsqADaLjvep/e1w4Y+RaS02iMWGLIIx7AtHOak+z9O/B
	jgpGasKxnZR7eQiektpJDqWlvuwsCLlLKHs2mUM535E4X1mXpOrCz6sY0a0nZJaUcizS9f2PTTK
	/ZKihe/dQqlB9bJGLyVcxw5vXBTjDu6/c+E0irMU331g2pR/agz46o2Jox+rnXF/bpBgSOYJNu1
	XaSWnlmg7vg6YAwZLIWXS7oVf3J/e0x7riF+6sBTWX3SELL2Knk2q9xp7LLGmHOcS+NJhUjzuOA
	iWkQUM0rgqPfUhsgjCZTz8YlM/4a/BP27UFi/pFnTi44k2bSq1Db98lWiu0Gy84NcFmr0abqFm0
	FWNxRUwYHokSm0wPPurQ/QX1aw0Ag7rFAdlc4kQ==
X-Received: by 2002:a17:90b:4ec5:b0:37f:d70a:9605 with SMTP id 98e67ed59e1d1-387568fe4aamr589562a91.9.1783347256522;
        Mon, 06 Jul 2026 07:14:16 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec5:b0:37f:d70a:9605 with SMTP id 98e67ed59e1d1-387568fe4aamr589507a91.9.1783347256069;
        Mon, 06 Jul 2026 07:14:16 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127ae5b06sm5118416a91.3.2026.07.06.07.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:14:15 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH V3 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
Date: Mon,  6 Jul 2026 19:43:45 +0530
Message-Id: <20260706141346.4180348-4-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
References: <20260706141346.4180348-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX2YzhNFntgPLh
 rf587ciwk+zcMIz0ka3bgR1S4XI59pdmZPJLC+dboA4cOMnfTwrYr54BqAxpP5oyz5MgVDC37i2
 QF0UQDHbZ0MbwMkPhaJOIYg0ibxvVxM=
X-Proofpoint-GUID: LNjaZ7DAJZ0lddulWfmzNKLgapwr-iiF
X-Authority-Analysis: v=2.4 cv=C6zZDwP+ c=1 sm=1 tr=0 ts=6a4bb839 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=9wC1NwHXjCwt_iaUHW8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LNjaZ7DAJZ0lddulWfmzNKLgapwr-iiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE0NSBTYWx0ZWRfX7l02m3Ec7Rxu
 vJLHKrxOIFcTLoWcRwWfz7wqpeKu//QIQYOlnyNETPobSuJRobH6LMQkZv57Dmh0iDx8AorDaAO
 7wR0wzIsrNtPBKMd0gjtzGs6cY+LQ4opIS/LzXvIdDlKJm0VPtMUNG5eq873H0UdxnNKXKLlfb/
 SY0nQtEESjqSqeJU01cJGuW7bhncP7c3XczCwHFyKjvq8JgiBTBwlvMoryGI7p0eTMSUJNykDB1
 vkGwJKRL9hEuHaQzOXjwDu0v9DNW9PMr0w3VqmxUhnQkujrgryOlaiGbqwdvEjASGfFc7ZBvzyD
 4yGV7cJGZCZ90SHxk6A1EalB8MDJtSl3YjtdQXB5lsiOrBux1SYsYqU7yv0H8KFNnEN7SEFUDLK
 nNtZcnOstbuFj595Mv7L303RlE+hAAILX8nnj1G8KD7k5jxxVv14yvqmZa0gssdr6RdJ7BBu7Dx
 TQZOWktdASx7q61evgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060145

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
index e1c9cfee1ddb..ad70c9670008 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4149,6 +4149,58 @@ lpass_ag_noc: interconnect@7e40000 {
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
@@ -5936,6 +5988,45 @@ rx-pins {
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

