Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775233E3148
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784544656; cv=none; b=ZpnX0je+kq/MRSJGoM9drjg9h2+BnZxWZok+Ad/R6KM04P3fKelJMwVyWqXSyM11u7lY+CrUy4e0EZslb5Xhm4pSS372pmKpzDewU7jqCyiq7yv48SyVRtJ+jyB/zd4tvlh++w8J+AvuHbudN+6OkNBImJvQVUaCds/bHd6Qork=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784544656; c=relaxed/simple;
	bh=do0tzTludNgpGS/opTf3SCuV5bhJp5iWnrGtxTlST74=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WmZ8U6HHoOWZpSH1V7YsAKBDIm1vREeJYT0R5ggeqeD7UiKcnC1ZCkBkyn+z+IgIOe3G/YgjzaGiRTAjIrCH63zDFrKyHRp60ij2SzXBlm+oZYj0DEzaHR7/4pJcV5r4n52YcI2Jo8Mp01SltCc0ahsDnxSGifg6relZeVlwZNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GD3mfQKp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f09Decvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GD3mfQKp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f09Decvg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9wTaG2296442
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CJNfEpph7JMPeJCP0Eo5JXk7HW2DFwVqyvqs385kgkM=; b=GD3mfQKptH6U+tvb
	cxGqD5FKd4EH+o7wh9MaWbmS+fjTwv5+E/KbAN/sK9cG6Edv/H9VmLMuas0d5KOc
	1ivPBh37VNZifjAMg5E+M0cwBoKza6G4fJLqEuTYOzrpMOqwluBqiIyznDKPSOTA
	Z4o0FfYln7WguQySrZ/A/d2/h8r1Q4cU1QeDW+FSOfFuln2kzKZgzRMsPxHUKNSQ
	9QUW6LDn+4UhjfWdAPKG2Sak34csmAeKi6ZDOnSxs6lTc1AFJDct+lYQB9ubnaY7
	c3JMGyp4+L5CfJxTzx+EceNfYmat+zy0MRptKh1vrVItJjy7l1G59pIryA4l8ywt
	agNdOQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhhgyr5nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:50:41 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8482fd61e83so20022343b3a.1
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 03:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784544641; x=1785149441; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJNfEpph7JMPeJCP0Eo5JXk7HW2DFwVqyvqs385kgkM=;
        b=f09DecvgyTCDHGgud1RuQuiI5hPHaTc5gb/sM/RmhGK8gvelPfM851Ov7iBtEP8whw
         TsZXAk9yQFFWlB0JxF7W7Yr9tZpyYNeF+p/XsurznXW0HW94aWkm//WQFvt2ePebEWs1
         Jb40fFVYWvPvZdBAZuK1p2x1GndYfuM22FxDaWQnUyD0b+Lb/V+xGTn1ESEl2A8AFcue
         W3H2nQF0cqafo86EEjk6LGYY0D4TQ8Y76veQpLDLvX6IAXkZY3bPvq+PVzq+0llIVkBi
         ufWaFRIa9hYUzDvZ9pDrUuczjPTvHDruUC+OqFONOuY1y4DDDEva06Enk1Tw4wCl0Viy
         mOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784544641; x=1785149441;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CJNfEpph7JMPeJCP0Eo5JXk7HW2DFwVqyvqs385kgkM=;
        b=r0RqEK641gmrOAg25pvFaPwrG60NdekCN/i15N+dD987QqMYXwQuoS+hm+8mSJXNa3
         ndl3X+ZMrEBlO9gUOnYOUpNrO1nGgVzCh2Owi4gRL33e+7BK5BEdxELEhvNTRGR4fT5J
         422JGtkbYmjgXm8uegaejVC8J2MAYouRQPaP4+EDRm61vo9SOX/MkhuSt8TMCsMGmAET
         dTtQiJfCQmty9qh1RMtBVivJEDJjA5o5dxVLpPZxehlQVpeK94Xvxc42zds8YU8E6GXI
         eTZEamE5j8T40mP5NZFnXc9LMSkwZMPYJA1us3ITcD4pmhrke1DO3w/K8dzUzwNjt3EK
         5qbw==
X-Forwarded-Encrypted: i=1; AHgh+RoBHhksH9MxXeZRhm9LjfpQ8KZb/hc70hBBpRmroeYEqIkbGVqlu6f10+QW5bEK3+O/kJhCobydEgB0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy0MCLs3/xJLCpqS3+bZBwBcY8BS7vIbiY9L+sG25AdD4dwD9R
	OGhHgECf4vZrCYBP3K11s8gKWAd+4vfoKjd9NaQ1XpMoL71AOjFyosxgxOQj6zJrVyuTuqfFmsN
	TVA85kEduCv7xj532u45We94V5VnJ/zpTMNhguiw5Tkx/uJvGVDQOxp1FT/UY/53g
X-Gm-Gg: AfdE7clkw/bp4t+HhTGF+sno71TmlXSDnh0jeyCLo8NG0UM2rxb7yEYxctbdt+w2pRX
	rHXNSgDYnWQAsnpAwOsbWIcHgOTQ4nm8fATzDKl1pfeA3yrIMZ6CkhJcuQe6FdYz/1PAGNK/M6z
	4EceypP92ju5Vugy4jDL1GRLl8dOdjZgIfI0r8bXFf6ir7hTSeux6Yjx28xNAi1LPofbcRtY7fh
	LeFgJt4OWF4PJoO3KjCise7LuL51jooxaGv2Xt4Db/NKlBOjVWwyWp2jWRqZ4W8oC9EmZ/Lf5kO
	MbkvSN65E5f92gRrVIY/AuX01M5anG9Uc+5ugM6uiYZrZEEpfQ10ydRvZn7I4/xTMjihfUeJ40j
	nJDSfBPYgobP9QIE=
X-Received: by 2002:a05:6a00:408a:b0:84a:2dcb:5aca with SMTP id d2e1a72fcca58-84c2954df26mr13507931b3a.77.1784544640868;
        Mon, 20 Jul 2026 03:50:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:408a:b0:84a:2dcb:5aca with SMTP id d2e1a72fcca58-84c2954df26mr13507901b3a.77.1784544640362;
        Mon, 20 Jul 2026 03:50:40 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb5159b11a5sm4343368a12.0.2026.07.20.03.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 03:50:39 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 16:19:20 +0530
Subject: [PATCH v7 04/10] arm64: dts: qcom: shikra: Add SMP2P nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-shikra-dt-m1-v7-4-7dc99100c6dd@oss.qualcomm.com>
References: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
In-Reply-To: <20260720-shikra-dt-m1-v7-0-7dc99100c6dd@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784544606; l=2339;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=x9fBogSqQcJioAYXHmlLdEWBKjDZV1eFUot6gF6WwrY=;
 b=DuOjXnuJbkJkS9xX8RVRUFQHf1wQAWlEgiocORFQ9jq6UdtD1tJbCQuzMckxp+oancPLJ/38A
 4WLI96ypYeeCaUm0g/6pCd9Wd/PCvSfURw7uJmFvAugpugHpCkfw+ML
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfXzaAUvos23O06
 aogRzLVycCAA/Y68m+icZZqc9Rdt9zFyJjPOIN+2qdJgpSbzUCmjsurFFywhljO3Zwobe0Ygabm
 HbNo24qIsP5VzN7i5FkTpFAGNQVdNqg=
X-Authority-Analysis: v=2.4 cv=LK9WhpW9 c=1 sm=1 tr=0 ts=6a5dfd81 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=EkeGX7dVun7IgMBPpHMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 40sjJQJi6GRQOl3sRafGpdutq1A2tX8D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMCBTYWx0ZWRfX2NHyiF/WXQ3n
 nEMvGta618RiCVi1cyqXv+6MGCttcKIpYZNoIELcvP5AFRlxzhY+mEfAVQb1o4m0Jo/pXp73wR1
 EPL5wx+8rGbPrK1Rjy3ONeFcmFlgVdFLdCD/KE9V9n9rPIafoY/94u696aK99IQA3Bz5iBaqW/9
 MQl+7G9t5WZWcCna7SQfxGcaW2CSA3kcNVqFYq6Vh+VB4l7cjImN3wYJwIT5PE6VnhnY24vTWp7
 D2eX6oshwXuF1vJF+xShkphUc4ae66E18113PuRL0Yx/9eECot9nHOxegJOtoGb6x4K7fjOSfBL
 hn4YXIrNm24Tk9asVFVJpJUw1eL3Ui9zo4ppgcGhsvCFVwKnJb/tAfBH+sCV32Btf8ehi3h2kn5
 P+fMHy/Cog6nmXnVxqbGw+etS7sKwtrEiSUgzPDh81bHncWUF5g1oH63a9YYplHweytDYaN/pYR
 as1LD4e4yZ52US/O6MQ==
X-Proofpoint-GUID: 40sjJQJi6GRQOl3sRafGpdutq1A2tX8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200120

From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>

Add SMP2P nodes for the cdsp, modem and lmcu subsystems to enable
inter-processor signalling for remoteproc state management.

Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 69 ++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 26ae21d4c7e3..53dddf35963e 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -428,6 +428,75 @@ lmcu_dtb_mem: lmcu-dtb@b4702000 {
 		};
 	};
 
+	smp2p-cdsp {
+		compatible = "qcom,smp2p";
+		qcom,smem = <94>, <432>;
+
+		interrupts = <GIC_SPI 263 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 6>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <5>;
+
+		cdsp_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		cdsp_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-lmcu {
+		compatible = "qcom,smp2p";
+		qcom,smem = <617>, <616>;
+
+		interrupts = <GIC_SPI 287 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 10>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <26>;
+
+		lmcu_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		lmcu_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
+	smp2p-mpss {
+		compatible = "qcom,smp2p";
+		qcom,smem = <435>, <428>;
+
+		interrupts = <GIC_SPI 70 IRQ_TYPE_EDGE_RISING 0>;
+
+		mboxes = <&apcs_glb 14>;
+
+		qcom,local-pid = <0>;
+		qcom,remote-pid = <1>;
+
+		modem_smp2p_out: master-kernel {
+			qcom,entry-name = "master-kernel";
+			#qcom,smem-state-cells = <1>;
+		};
+
+		modem_smp2p_in: slave-kernel {
+			qcom,entry-name = "slave-kernel";
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1

