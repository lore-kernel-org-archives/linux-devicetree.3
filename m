Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED93C33372D
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499637; cv=none; b=Ye2tJR/uBVsXj9x+fKvPsCSsgi1VuNsvaIN2Ck3c698B++vOHycV3R9bI+vwp5blRUmEOq44ds+MZQPSFz1M5ahqkMx6sNbpiDwGQQUw/Dn3plfIGRY1OljnYUYkcVEsp2uxlpjgeucnVH/1XtmJFnpCkpF9FCGuW/4QAWDHXCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499637; c=relaxed/simple;
	bh=HjlPUyMlex4k2VRgqs0fNuT1B7Qwy6NuN5AW7pzKve4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wovs/bKw7aACNnwBsdhv8JobyxLSCq+5DSXH/st2LwZZXPnmuE8iAC5QzmwXs3IBDsmD//0MzUbFpTPtbmbml61b9nauOMmQDdAjNHmUjv3NJmHGh1Jp3Gd6EquOaObLoj3PV2MHTQ7DxejR3FUBsoKBkANlmulU1o6IyHqhRA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U9586yUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBT/LDH6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U9586yUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBT/LDH6"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKhNPT141450
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MI1Cks8bUmL
	+vXcRYKGilV2FJrYf+78AmT0/nttC2n0=; b=U9586yUS0zpV9FBSBJKHPp3kzGR
	i1UpGQ9J/6ylpXYc/D7d68Fu37iBX8iRAYrP0eQLXwRIR8O8VapYsjSAJRCiNyZc
	+XwanJoOKEZx1btobF0YVTXucimMh+SKVrvEUvECmGPPjG/OQ+qIRSMCRj9IHnmE
	59DU0UV7fkqBUEvEGbObemvxghSqw6GBVeRWketPBavI8MTkcLzVSekcpbXODZCq
	yPsLE0lh7xvlYDOCrOGuJuHF3kIWEnf/PVgSe6EhM97vqMZiK5rTJvs5bXlp/vDk
	1FHLThGTzliA3dv04zOuiIpNeD1Azoi5x7wUOuE8cIrmuzZIcw/XT1Uap9w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q0917j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0554888cfso8020235ad.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 21:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499635; x=1775104435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MI1Cks8bUmL+vXcRYKGilV2FJrYf+78AmT0/nttC2n0=;
        b=QBT/LDH6ILbvPDJPbn4niWKrsLIVgHGDYzoYQ+WHXgKB7E9sjp798/NlT7eYGucBlj
         ovd20LBt/RuaJt4wecnsDaRCQQ7fG+dGAfN870pfqDZ8FwuBwcEID+5FWt11701VCsIx
         uiRSdj2kbg04GygiT7WCegIDL+FyG2WRG59aI3Lc0Q0MqXOF2EPXL/FLsyNHT9+u7oXX
         xq1p7yLvBQ/a0wGN3P/QAdQXHJa+nIFlcNidkXWqpdcEJ1+wB9lLDN9cTIK0SBuk+8M4
         OiaNuTKDcw6No/pfHy9EdhP+vFqQQExRvxznsAxfshJbuLpVZ58e2uQZeHqJa9hEGtgS
         JurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499635; x=1775104435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MI1Cks8bUmL+vXcRYKGilV2FJrYf+78AmT0/nttC2n0=;
        b=VwAve/8y1kqD++g5ZrxN7yii4tyoMcX4PpZ9aVV550g3M5wcn2bR0LHTRRehomoj+J
         35ABAidIuRWmn7TLnTw7MX8teRameejFSH7g9xEt7o8oUPQWBHonzDovanm86w/dHhu9
         rAXYtM7CLFNAEkkk87CBBomYLhL9vDBxF62jniFn8Y9yvUe/jmyfe0NQF4ZQUYksKEej
         w72jts2yuiLr/5t2fB6pjXK6Mn7r3pr/h2lpOawvSYIMxlkbH5Y2EkxGmwJvKSFmtdD2
         EmERorBTDGEbvW1QPp9mpXCXpyp3zGE9qI7hvYbzawjBuYmfqHGXhr5DhaFJOf/Nwl0i
         +B5Q==
X-Forwarded-Encrypted: i=1; AJvYcCX2Sw5qdjY6akzfwPJewKI6LRrM8Nph+AcAZCn6USNRbsdtMwe37lyjMM1SbrUoPYOiy2DBNTRARHqI@vger.kernel.org
X-Gm-Message-State: AOJu0YyV1F5AiYDe+++qwxBKvzj274u1DUZJyIB7zKRLHyCB31v7S/kj
	taGed2sUV9YSaTkyoyQZ/CBd9Gk4yzomNw07IXPqf2TaeqkM6o8xMaJLeUJqnZSLZJvwiJom6iJ
	zUTWGaqMKlqd7lOOzRVtTCxybgo3FTMdaYn+j9d2nv0OWrnLqKUuuoWYM/NmS3fjD
X-Gm-Gg: ATEYQzwW3l8Ge6qqZ7zHWJ2X5HPIJ1usnDXFW0U319zVJ7ba6/AP9GUxUgSGAM9XgVh
	GzzStRj8nXIxeEvQu49AdN/UG8gfEKeF+iY8QIo/VZFYIXLkHFIPLqae1wPgg0rtWDyJ29CfJIf
	IFTPsEmMv7MGpkqoGVtdM5Fk6cJ7si27bMU3djWnGVVOfZbUevEm05b/tfGYaEhf26QLM2KT6TU
	Lx9PrHml6UmnVoKPGqQ0va48/AO/m62BGlTJS0ZOfFkrlXi5PFYxisSyOPAPJZGIC5d6SAV+/7K
	4M7jsllcQigPrZGVfjBrxQnPwxdy0wYQ5jp+2b7owEQadLM1grMv2Vl5mbX4q74TvlxmgfKwsWH
	NAy3tFJrpDjA5A+44OMOc/LgypcXx7l+ju1fOhJyNSdJzXeRC7RROsQcjMQnJXFj+nMmuTAxHQv
	qTVb3afbvKqqu4BNHfpyxpdPaPuyKxFe6gqsbr3XkUklbTL9O9zb0=
X-Received: by 2002:a17:902:d2d2:b0:2b0:55cf:5e9c with SMTP id d9443c01a7336-2b0b0a750afmr67718525ad.30.1774499634570;
        Wed, 25 Mar 2026 21:33:54 -0700 (PDT)
X-Received: by 2002:a17:902:d2d2:b0:2b0:55cf:5e9c with SMTP id d9443c01a7336-2b0b0a750afmr67718235ad.30.1774499634101;
        Wed, 25 Mar 2026 21:33:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:53 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 5/6] arm64: dts: qcom: ipq5332: add nodes to bring up q6
Date: Thu, 26 Mar 2026 10:03:19 +0530
Message-Id: <20260326043320.2507890-6-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260326043320.2507890-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c4b733 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=wvtPTOKNElVcqRjrzWMA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 112uf_jYlw489Fc6ZAYb7cMps43XJYKQ
X-Proofpoint-ORIG-GUID: 112uf_jYlw489Fc6ZAYb7cMps43XJYKQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX1KYKcFvnDnad
 ei2eLlXaIh8SrTZLsEpGW8aZvOq9RQtFCrMtSFK4SxWipph+8hBNQU+Eplpy4iMXs7Bf15O/EVN
 3SHWgxn9X4csKZXogE4Bje5elvpGNO5EtHkLkkU9kQ3Nk+v8Psg0k1ax2idSCVA2oJjoga2/Ti7
 xFl8MUgM3nzGlhPZeT9K3Th3g0f/GCCptdEbqzI/IqyYoKz5DjMbeErHwuVh/KPztVN+k13fyou
 LMT0tsKXDlnHobMpyyTkTecSFBZJdsHl/45sGsYwQp5hxT2oPA+u77HDxE9ScBf4+AOzfHFbDEp
 lqJ241g0MztUp7mfTBRzTrLg94RiGr5nDo5UnlNErpz30Fd/YEPuHpWs6BwSGj3OznSNtlywqDs
 F3XQSb9pds6Hm/Ckn2A9aFiEwuM6KBQahDxUxXAE+hs8NbpCjSd+um/GKw2kR7MLxO4OYTvkGmr
 7yEIUYpa5ME3ymvsDIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Enable nodes required for q6 remoteproc bring up.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v9: Add R-b Konrad and Signed-off-by
---
 arch/arm64/boot/dts/qcom/ipq5332.dtsi | 64 ++++++++++++++++++++++++++-
 1 file changed, 63 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index e227730d99a6..2173f187ed9a 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -2,7 +2,7 @@
 /*
  * IPQ5332 device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
@@ -146,6 +146,35 @@ smem@4a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		q6_region: wcss@4a900000 {
+			reg = <0x0 0x4a900000 0x0 0x2b00000>;
+			no-map;
+		};
+	};
+
+	wcss: smp2p-wcss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
+
+		mboxes = <&apcs_glb 9>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		smp2p_wcss_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		smp2p_wcss_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
 	};
 
 	soc@0 {
@@ -619,6 +648,39 @@ frame@b128000 {
 			};
 		};
 
+		q6v5_wcss: remoteproc@d100000 {
+			compatible = "qcom,ipq5332-wcss-sec-pil";
+			reg = <0x0d100000 0x10000>;
+			firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mbn";
+			interrupts-extended = <&intc GIC_SPI 421 IRQ_TYPE_EDGE_RISING>,
+					      <&smp2p_wcss_in 0 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 1 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 2 IRQ_TYPE_NONE>,
+					      <&smp2p_wcss_in 3 IRQ_TYPE_NONE>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&gcc GCC_IM_SLEEP_CLK>;
+			clock-names = "sleep";
+
+			qcom,smem-states = <&smp2p_wcss_out 1>,
+					   <&smp2p_wcss_out 0>;
+			qcom,smem-state-names = "stop",
+						"shutdown";
+
+			memory-region = <&q6_region>;
+
+			glink-edge {
+				interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+				label = "rtr";
+				qcom,remote-pid = <1>;
+				mboxes = <&apcs_glb 8>;
+			};
+		};
+
 		pcie1: pcie@18000000 {
 			compatible = "qcom,pcie-ipq5332", "qcom,pcie-ipq9574";
 			reg = <0x18000000 0xf1c>,
-- 
2.34.1

