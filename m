Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4562927AC45
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774499632; cv=none; b=ki+1cdFCUbOo4egcxUD8hTx3PZH/7l9ElfpEEzorD4WBiNn+EBCrsiuXPXjd3EMa5fJetbDIFCKQadGMM9m1OlDscLaeJaXuh6Eblp+R5f6et/7Y0egbMPN13ogTQOAQClk02Lm5/toZR7n9O0kQv2UoyOcMiJuWsfb6pZ6wTbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774499632; c=relaxed/simple;
	bh=Ua0zHZvTYxgJeKurVOMitZ4An0khWIUfUsSSIgPAcf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r7KibxeZk7Wb13I1p2kf9FCcW53aCPUqS4096GzpICuoHh8ibVFn9hKuW5k4QhOMe7YYLwA+aqfC7mrImSpn72jWow64m9ktJkrnCnQV1ja5t11i6s7WrQoTViT0cI36iQRBty5Qw8s/fNvKGS+zxCi/y83o/IdPjJc380KLnPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I4xh37ge; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Va1+6ZMI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I4xh37ge";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Va1+6ZMI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PKkuWj051557
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yp2wQ0vAoaf
	Lcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=; b=I4xh37gelGQVBSGA/2FZIUM/zWB
	rwC/UI0m5WcsqNsz5enka/nSmfdJxOWSbQdcmWujN6BtSAHhI7Ney6lvaa8SnmQl
	uW06596q2e3RTZL4+M5xZ7u7Y+bpOnG+joG/LoSOqU91+c+DjCVghkDCTmrb9eis
	sE1DC+zOce6POcbJsLZReVaVlsyQuHvbTm+O0mEMPlTolL0YPTexdYeFrjhhKLhK
	7+PukJQbvKbwoT55B648c7R0YKyooDhc8dKMqnkIPCwpsMJM4KLWEzm+YZlXElub
	dGAK77BDybiU1GdQ8E+FoB1qCUFHykjsboj6d8h6gl8HnBLyiOSIg4pumaA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t163w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 04:33:50 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0601ff3d9so8877045ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 21:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774499629; x=1775104429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yp2wQ0vAoafLcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=;
        b=Va1+6ZMIcoqZwkXmjmppvsCL8VKC6C0xAPNwgM5/euu0z7MDAvT+PXXKateghAgtI5
         iMCk2lGw4L5yAagk43k9TngCH13nzeYPuE97cZbJwG9b049pviT8RwzHM6mYSS7skiUV
         WvN2PPSchz1ur1kHVDf28Me5p5vD+rD9+ndHvtRftlk9MFYFkNGIaE0lRJgmVSfXATbY
         BF9JqahRsAal1e6LQK0KodL0KQU0gWpux5wVCn4ybXpUEHHS4Hpj2OFLvx4L47MhI8BA
         KSZ42QYkgQJeRujMYQwzCtNZsQi8kgn4/Q4bfrAZw58hmKH5DUv6GUOyDaHj33k34BTN
         SGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774499629; x=1775104429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Yp2wQ0vAoafLcjx/jnVKsTWIoUwH6nSDD3/qLWpglqk=;
        b=UwmP5Zv+tdMps+mnQLsSUHoiYP20kwI9EagleudxVByMMlYcpkoZxmLwbpi2+IZR1B
         +IIQMpXusJogaqqXk9zqVewFV/B6vRRilsP3r7FUGyU4fxl4xgBUVVzwSLAHTUiZLZxS
         NrbgGo7Q+VD73rGCYgaDKVC0sHxrfedJ3R6DWAWxBGlBZ8VGwFO0ACvQT2LQWAQ3tvso
         50CD6S8FsKvmbugoI5kodp8gs5jLDRHVyvX3sQxMT6TzhDt//EbOcxuE73x1Ki+UWA/C
         fjDlYUCjnmv8KvhAzf1vaev2mEhx/+Umklt/mQBT/EQlSmUnlx4jDyF7h+12c1V911E+
         Zynw==
X-Forwarded-Encrypted: i=1; AJvYcCUXRS8hs7w9RAkRpR/AG01O2spJ/xlgIcjcQEHa3j+Yq2zblosE0ymENX3MxoDjIWerCkjKwGnpe1F2@vger.kernel.org
X-Gm-Message-State: AOJu0YxjhsOGQI4Lu62uY2ablTNmuPAb98GU3T389v48KEPWF/W4E8eA
	P1YVpYZkdFydVI4G5A4kwdqzUFN6NRpxCegy15ggjebwIib0sauHuf/28oOiFdF/Ks7/FGQhj+x
	vfJ0WJGGiLa7+ywP8SIZVyKnKTBY1x9KUIFzAPBs/Ct3Z4lam/qOU0eMAvKL08lTE
X-Gm-Gg: ATEYQzzc8D9wuJQynjn9STha2ssgYtkqzRWAuMOTMQ/debgGHWLbFeJr63Vk2HToACt
	1NHrJpwtFmR4emslf6NkdvOCfETtP0gFcYtlTJ/LAMBYIeIJuZvW8qoPV+yO2x8BsLUxUb4r+Gt
	D64rIBaXWioGmF12YONoIWWmuOBfi2MXjw/Q9rwi7IQnTSvfVGx5x3hKsbsJMHPakDdRV+vxQRy
	Ox5TDI4KjP6hif31ovG/zWLPtllYy8E0aB0Ypx2GZD0xD+s06uHS5wYD/xvXwov04loC25B/0ip
	6jhC9OPwkc9D8R1hXCo3/XFQLG8/vn7/MPQGs6CJXOne/ir4toFt12ARg34UYx8b3zjK8FNYG2y
	Mg/SIAF+C409sIIgk1SpoaPqjk9HMscbQbznc/+m8etuTG1NcnTK/BrbNf468cHW0IyF3cyW2zM
	o2blIqq4PAiefkdBilPfe68wfRaLOR29XRb26Jf82ugiITK8bDdWA=
X-Received: by 2002:a17:903:41c5:b0:2b0:c0a8:5000 with SMTP id d9443c01a7336-2b0c0a85571mr14369545ad.14.1774499629263;
        Wed, 25 Mar 2026 21:33:49 -0700 (PDT)
X-Received: by 2002:a17:903:41c5:b0:2b0:c0a8:5000 with SMTP id d9443c01a7336-2b0c0a85571mr14369225ad.14.1774499628751;
        Wed, 25 Mar 2026 21:33:48 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7b233fsm15163715ad.32.2026.03.25.21.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 21:33:48 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        quic_mmanikan@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v11 4/6] arm64: dts: qcom: ipq5018: add nodes to bring up q6
Date: Thu, 26 Mar 2026 10:03:18 +0530
Message-Id: <20260326043320.2507890-5-varadarajan.narayanan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c4b72e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=UqCG9HQmAAAA:8
 a=EUspDBNiAAAA:8 a=bkM7E5Y1nIw_8vhdTpAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 8jpspQIAp2g-d5IeOHfa5aJvFnsAkYsA
X-Proofpoint-ORIG-GUID: 8jpspQIAp2g-d5IeOHfa5aJvFnsAkYsA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDAzMiBTYWx0ZWRfX4c2vbQuHjPEw
 /lmy2duY5jyP5E7BIEHNxJ6kfLbToakR8JqqDvb+aViN2LZTe7Kde+IhyuVGvZogoJB9aKIuM9O
 sGiLbHGlSCQQ3Hi5J3gFMu9QjStiBIkeErEnmCReIuQpV7UJ4LF5HQwGfQ2tZbeHsY6EFFrzKrk
 /YZb0JHz6OwqcSa/mhqZTFXUIXw/dMDa9tITE2QOv1i1UwAsEldaKHA5yePy0vga6y9tAqIuy0X
 jnxoJC8zarHGNbPheSOdJGijCPPYAcvLmnfK6Q2e+JnvB5PPXOVLG05+ayXaIvOwYBNMvjju6Os
 /7tH+ODkLfTyvlNb11IeDOkWViZSDFo3uarcBG+bmijwFl0lfnDIV7WceplACSMReT1HqzJpOam
 AQxavl48yVyWrq/P04OZISz81l6Fc21+AJhw7UYHDrhaL71lJ/EY7HSYixPrASvbno0KnC8qjSo
 OXiv95B1iZue81iEXRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260032

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

