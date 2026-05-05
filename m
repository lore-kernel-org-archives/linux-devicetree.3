Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FBB401A2A
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976623; cv=none; b=oql0OvLBvUJmZbOzh64VSjjs0cdcfaojJUzBsGe+8PkTV7MUtqITeoejJJ2JwEUsTWnphL9VO7ENAkk+qmdBgW2JoyuvVJ1jUJLZOP81mlLNZohfPqYXyUGhKoz15hpB1xMkzHm9YJ+vyWLdybPNpAOtFNLYk3LILnYHyH+qkwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976623; c=relaxed/simple;
	bh=Ua0zHZvTYxgJeKurVOMitZ4An0khWIUfUsSSIgPAcf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HgBJmM/h2WhhlFgu6K4aAYStRQ3BOF1oij7wXO/jvNwt4w7yqO6oHSIGUDg+Lw/1aI6Q187Ng3+My/4xvnV495s5GtPGuKLLVTcKwkof+/bezK2VEg/I5MJWV5fKm5q26Pb6HBXc7o+MUqZe2Y+A+qfk4sU7cGluf+Ya1AJLRAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JaP8PCJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQ5+Ilw6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JaP8PCJk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQ5+Ilw6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6456BaTe299461
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 10:23:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yp2wQ0vAoaf
	Lcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=; b=JaP8PCJkTqKGkXA3nwZdGxUfbXa
	K4L583hmpZwhUvuqWJ3b1MIbD4ojJC4JSA/ruGOj34cijd+DX6B0kz4sCgbQ8tmX
	JOIWgy5b6Qe6Ojn7oJw6N5PsXT/4MqXTRgW3LOic1zc5zn8TMNcjsbesD1xq/SiU
	pqwayG2DVMRaSIbj4ZU+I2EVJ4PQ2DugOJSdQiDROl3mNr2+jF3aEMl3hTxxWVhb
	HNWaIbYdkOSPpN8geLK4Ii9bH+TYDjzVOCeHx2u7pM9pTYF7sNHbYfuUHKAA6eyc
	KsLhVvI2GOXSFbMEBhtEvUj7mFlgyZ/Y+s+B+jDQ3n8E3hE8htBBTMi+ghw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvndc0r1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 10:23:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35fbaada0caso4690170a91.3
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976621; x=1778581421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp2wQ0vAoafLcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=;
        b=jQ5+Ilw6e57coQq93E6DumebR6RlH3Yl3aIYTDyOWSw7wfmTdVzouuDqNf85AzYUOE
         FwwQbHtIHWsUVdVjvnfprahmrgBZOgZdC6pg1FrFv/9fwW56XSao/aZnJIhGyvYksEzN
         mA4cmr28o4gSIn88blIu8pKwPGW95TN4wR+l77bxY+EKKIqqkqHpg3PmyOBGbw2SKBF0
         OxFf8X5rCdo8YCYO9F6TSfNAcyewtt+aq+1szcL/VFqKgs73M8i9fUCjhG3FDkDAKWF3
         NdGthwqWLhA85AKzAvs03curS8n5bz36VwhMBUgNFUdqot0EOS6KgbtSkYGRmunuFhbL
         wg9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976621; x=1778581421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yp2wQ0vAoafLcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=;
        b=VJMLDvOKUrOlYsJa4qPHpAOQeR5I/xTO3pYQ5qWaU3JR6k9iLSkgYcPJ8RvhDwkzL4
         CU/0kL54OD2aZLNVinkPlis5/8lC1ktW3whttQExL+5guKUMJN66v4Lz565h0X3aRrav
         daVRXawZ1Euozen9YoiQFZ4EzDCaxRsP55oIpb96tHvDUWNoI6tcZbXpRWUIFsxpvrIj
         Ey13aQoAdLc3J8wzlGlmqdkzEA7zpldkKqr2F/Th3zs154aCw43Z09/jurW+h9iIR5I8
         4P/YOr7KLFg6e4OL3Z3tMtE2uuUTdNzL2uuQ0GpZe7b0Kn2V/qW/AwsnPaxHVvqSSSLH
         Pofg==
X-Forwarded-Encrypted: i=1; AFNElJ9ouJFoyXgNPUaVDp/jCqvszq5qK55jf9u21+EtGJdcTr/Vli/csTuYsjcEGmj/R1lRBsYSqmgZ9JxL@vger.kernel.org
X-Gm-Message-State: AOJu0YybhMACW093U2Ad1O7ecvf3uyv5s9hi7LsqHQDvz3hbRJ7GXfuE
	qGYPbsu+MJ1LNz/5tnjUukYXySFk+Tjp4bjpEyN/g0rmOGbRef2QRV69wLY6luNm8vwrAAKqe9h
	O1vy3KKzyndnCVfhKPorwF59mkrx+uGecOOgLfFvQOaVJQrNUDn5eA4BGuCKZP1zb
X-Gm-Gg: AeBDievlxQvsC8gCZdtScljcFAqEhw0oIsY9YzLGHvfwJEnzuM5tWeXsjypae/WsBIt
	4tf8tAjY1DDgDzR+xsqMe5+DRPo9JGfnWuItiu8As3IuBqLgFfjIwg+ijM8lMc1id5jOfz8NVua
	JV5159DFJKXgSyIib7z/cdEGVBaTSkW/P583PhDrvx/XLeNvbp+95XmzsU6tEFj0+F0JerHm+D+
	Kj11Bw6zQGBo8hYYaM/rVQvtIrn1VDbHfhgSQIAhVwBx0ap0qtf1Kd6jXvpUe1ZJ9Hzp+MGmtT0
	yVv/6sCbhahWE7B2aWnRnLsXM0mtVv9uU6Cr/tPULHuwfl6/WFjI3rUlT5+mXeXGNz4sB2ErYRf
	tJXBCf6jzmJVYjliV56V9zLTN6WklssUnn/V1XyrvmOzEwq9Bw6QE0KXAZtpoD9LvP2LpACXilz
	NlBYCjpVJRIYWzmpI4l/Q9WwDj0KrWEqKIn222Jzj0zoN6vBD8JX+1A0juy0UbcQ==
X-Received: by 2002:a17:90b:5890:b0:35b:e529:2d60 with SMTP id 98e67ed59e1d1-3650cd95fc6mr13409247a91.8.1777976620898;
        Tue, 05 May 2026 03:23:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5890:b0:35b:e529:2d60 with SMTP id 98e67ed59e1d1-3650cd95fc6mr13409207a91.8.1777976620374;
        Tue, 05 May 2026 03:23:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3656ae05d30sm3299333a91.6.2026.05.05.03.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:23:39 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        manikanta.mylavarapu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v12 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up q6
Date: Tue,  5 May 2026 15:53:08 +0530
Message-Id: <20260505102310.2925956-5-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260505102310.2925956-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mQONqczNKUpYCFhexds3tP0q3Pxma0Ov
X-Authority-Analysis: v=2.4 cv=d9jFDxjE c=1 sm=1 tr=0 ts=69f9c52d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=bkM7E5Y1nIw_8vhdTpAA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: mQONqczNKUpYCFhexds3tP0q3Pxma0Ov
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX6HCVVq6+fdcm
 jYunSZ0ZeRWBK53JdYLpuLh5zTzLxecjNxemc1Lj3YjBT8u6miXjSg4Kmj+eVIUV51WWnXwpwg7
 6VW7cdwQQ9rfUCQvdQDQbmfN6C/Q5bEF8OMdmLuT0N3IsGAPF17Oe8Hy3ABHybw4eV501eQcgrh
 j4H7AsqIBFWKyfoRInFkbELWaVdJKPmxrbRzvEV71KEWv1b+emCQuOIESNSaEvFCk6q89wbKyOp
 2PhQfa2T1e8pTWnZe28nnBmoKCJdfWU+hahbCHEyVX3BQNzHzUAMKMeSUkUTCtILy578LyCuFH8
 HOD68bH/XU68aJeLcc0an7Idb8vSFrtI6V7liZ6t7AylrZHOeKMosyjY1C5VCLoVDNGckOtlGM2
 3h3S46JkvqRnA+/i8/w0Q2LIpJBWjU6W8bxlWXBgI/Xu/J9R+CLFcqN+b6fULTrYcVru6eA5DBy
 y+qB+LMaVRyWxNoXM7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097

From: George Moussalem <george.moussalem@outlook.com>

Enable nodes required for q6 remoteproc bring up.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
[ Change 'qcom,smem-state-names' order to resolve dt-bindings-check error ]
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v11: R-b Konrad Dybcio
v8: Swap the order of the items in 'qcom,smem-state-names" to resolve dt-bindings-check error
---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi | 64 +++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index 6f8004a22a1f..e1f8b5840acd 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -158,6 +158,35 @@ tz_region: tz@4ac00000 {
 			reg = <0x0 0x4ac00000 0x0 0x200000>;
 			no-map;
 		};
+
+		q6_region: wcss@4b000000 {
+			no-map;
+			reg = <0x0 0x4b000000 0x0 0x1b00000>;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		wcss_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		wcss_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc: soc@0 {
@@ -721,6 +750,41 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@cd00000 {
+			compatible = "qcom,ipq5018-wcss-sec-pil";
+			reg = <0x0cd00000 0x10000>;
+			firmware-name = "ath11k/IPQ5018/hw1.0/q6_fw.mbn";
+			interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+					      <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_SLEEP_CLK_SRC>,
+				 <&gcc GCC_SYS_NOC_WCSS_AHB_CLK>;
+			clock-names = "sleep",
+				      "interconnect";
+
+			qcom,smem-states = <&wcss_smp2p_out 1>,
+					   <&wcss_smp2p_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@80000000 {
 			compatible = "qcom,pcie-ipq5018";
 			reg = <0x80000000 0xf1d>,
-- 
2.34.1

