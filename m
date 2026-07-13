Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E7C357CF7
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783971449; cv=none; b=OC+lU9R25/Xhp03eUXiQdw0uzC6Ldo1Z4eTQa0cAEsue0nK/xf+kcd7Qxa2YPUevZf7ckb1j/ScdIY88pxr9UUuzCVybMyDmKqyoH7tMHdbL/luuqzjY8TfstnRZdmxSkJ4fCX9QMIB4rG4O8VTKTyUupSSsPueffhQC7yKJDPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783971449; c=relaxed/simple;
	bh=MG3sAgTxM2yS2k98bs7iCxw+/UEc3/K3gbnTW3sIzdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SZAhmUaV1bkJh/N9kpp4B9BJQuGPbvm3rX3BYiTmJFECPo3mfIhpPe0WaZgAed2s+fZYQ8ZUwI94qWZB886Or/bGAdJZSpOzpRJ6pUYIxEuy8N6YmD4K7cLwiD4TTUcD9a2Pt/QRLqMDgn/Dg3d1NUmLWykf29O/IDsVk7h0IDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJNla1oC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VENVs3s6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YJNla1oC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VENVs3s6"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DJ9SQl2409611
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=; b=YJNla1oCkmh2/frg
	3NzRL+lxHZZHk2V5Sh3+gxiaa9sm+cF80ZPd5islSQqyjBB2vop7C9At2xxXz2By
	wLxgU1kcD8oWfGkD0itXOA0fVNvWPEvGUhV6qYvXok87FN1L1RNhFOhnIkAZLCBi
	pqTltNsyREvnrLHuP1Dlg6w4VsSrXNjJNKX899x26bVUGvVc2k4hWHfxWC3tCFOB
	JeyvBY/db+Dw7j1GzDsrgJX5C4VPk5UkVqzdt/GCOijMnlvFx2Uh7cC8hvmfp0jI
	ErM4RblIK3k/uvbs7Ho5jO7r3vIal20Iw4fPCke5UsNrFbbb0eerNUXweA/tlFNZ
	XT0pVA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj02wrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 19:37:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e095fd889so396441a91.2
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783971446; x=1784576246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=VENVs3s6R34UVnQPBe+UCdUBLQHE9AYjREglUlLmrS4RSZ4uf5g2LX2iNUmzyNJPGA
         GBQHfIQK3/dtrNXg3nFjWVoaR77/b3Z25HjH+CEV2Di+SxQwacMrhY3V/RuDhs6BwWFO
         fKinw+ZQxbNiFzLC3EH+R9h6davGGTCVz50UOx8a2pWNTWPhyfa1wx1ZNC89pxhiLbcq
         P2dQBQCtIHib5bsOER5pQI/fk86SOPnBr1Tu/5ox3GR3/cMbzjLaiU9zYH4bc3mD7lqX
         FmIkDGYPP5LDbIhEksVOsqw/zOT+rbNLP58+7vRQHVX8RLJQPS65wzIzeGAZYj9xIuvr
         9ZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783971446; x=1784576246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s+HSBk7qe7sm/8M8mPnhytls3w5+cC3ur32RaFcr0Zw=;
        b=ko5F9BpnOTf6FLNRIsqv+PaIw9wk4s82YWy85/m0SZ8iSzWhfxbYqtHqfm+MR8rf1Y
         M9F7pWNRhVQ3dPzq66j3jpdybnKbU9IODupPMzIeGGeb1yaZTM5o34c8mSeNqdbDAijb
         h0es4+sD2W4alRCBy2d41dDJxd+GatGe3Va2tUWMejF8yoveENsCDyC8LjzZKV8Ap/eW
         zkmevOUQcWspKz9eN7ZjmtwwMrm76VT9K70RbFLlLQ000+Sa7tS1ePId6IBk38JvmRpL
         M8FhS5aCTuJH68gyzrSNimptdGccL/6d4Dh83rcT7C7zX185M5CEMD7KYOw9s7K59Gwm
         U/zQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLd+oHJ+GddhIcA6qy38VcgB6RFkJmuOJt1nkRCOJzlRGgxO3Ahy+G46XjYl0fx33+gbj7CjXRKVp+@vger.kernel.org
X-Gm-Message-State: AOJu0Yyss3tHeClvHc1VBrFRD16EE53WU27sfpTwCGkWMnfxM9sz5mBG
	89YJvY5CrV2z16vobiLN9/OQIdJsbWrd2ifEV1FgOtthu28uoyd/FTw1ubxliNsgO4TiITrVf/a
	F9RUim+eGD2ma3wqPkSLbZH8/gxHj6X9crsxGzYc5rL2NsbsMntpqzypgVruknL17
X-Gm-Gg: AfdE7clOKp5tjcDvmC4YRiVj8DsW8Oi6yYq8yJLd68dmWPZWm3pLMAwc7ySMbm6nZ93
	YQHaXjjD/7hfX+1WMAErhqkHZ1eAOpk3+0V8uVpa2mUgjdwV4ckD/nFZN2KpQx9VOWqKBdHieUi
	uK737Fy4SKEi3svySsaxp/TgVDL2TcAdmeF75uxGo2vSaZiol9c/shjucFM4h+CXf6joLndo/Kh
	KLFxQXGYQ9yheKdezgWpan1MaDlXuZBKmfJd2F1DARP/hmZ591fzIEUe4JqDv8R/DboM/0CImy8
	Hz0zWvnWKBDcUSO4qcgC/RTTZHnau8y4R1APhSyoryo7vG/YQAb4Yu5nw14AJklolY7xwl17Wgt
	iox/b+YAAEOBMjuRjUR6wwSyQWg==
X-Received: by 2002:a17:90b:35c4:b0:381:21c1:75c0 with SMTP id 98e67ed59e1d1-38dc74cfa71mr10093753a91.15.1783971445811;
        Mon, 13 Jul 2026 12:37:25 -0700 (PDT)
X-Received: by 2002:a17:90b:35c4:b0:381:21c1:75c0 with SMTP id 98e67ed59e1d1-38dc74cfa71mr10093727a91.15.1783971445373;
        Mon, 13 Jul 2026 12:37:25 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313f3ea883asm207540eec.29.2026.07.13.12.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:37:24 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 01:06:52 +0530
Subject: [PATCH v6 03/11] arm64: dts: qcom: shikra: Add DDR BWMON support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-shikra-dt-m1-v6-3-bee265d3499b@oss.qualcomm.com>
References: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
In-Reply-To: <20260714-shikra-dt-m1-v6-0-bee265d3499b@oss.qualcomm.com>
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
        Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783971418; l=1830;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=FgXZj7vad2zgvA0RfnbjlrO8hgDk3pUjpoRSx0IOZh0=;
 b=ohJI347iFWs4U0QCz24SLyaswuGcNatjjEcjZ0P/Z5bStmRHOkpTD1QghBUSqS6AW4VqA/afb
 NMa8uB/KQEZBospBXUY9lZGnuTiWhQQKjydmq6jMo44RFV/g51mTMx9
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfX3gq/RIb5LdUi
 L/3cuSSjQSVw3ZeT397yQ03uwNFbHYXVUxJb7xoUkpz9GXUiSj4GxslgPvo939VjXygKSG+cUIc
 Wnd+MT1a0p2CaVVFSR/+sANZ9E1gxZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDIwMiBTYWx0ZWRfXzK4cyheaJW+3
 OFUFofl1Rs9uzjfZ5SlcRHf1+qQzC25j7rmz2XPSAm7h6SRzqvso3xOzNIpKEpYk2Dv58/XL068
 DWlAffCXjaRFF/hFw6naMLB6b2nRNb3weJP2dRs/GzQSurceA63odevGq37tL8QnbB7U600xZMQ
 tGkBwF7tdLzjLw9Gpg1jZai5GoNb91kf/HI5E2KLf9h9u3tpTyBjuQxY7Hi2RpjsFqEeVkBG1zg
 6eL537rDtrqALB4jfdzMxSL/6x/1qZqjqfwlX1ylZSx5TL0BSjTZTbwQBPidwhMkK2NtdUEgCBn
 XRoYwQfTpoUM69mknKLRflJMcmjfynwAkaC0Ls7YreRxaMzW8N8TaMbvjcaNN0n2pjhRbbeNRsI
 GLUKFrYekCLh4nHgfmr4C1WSMP+jwfL1Ci6UNW3/XoTCQ32Q5zbz//NYMoIpfie8n9Qz4suuNY7
 VRWvAnOPxJNwARgjXgQ==
X-Proofpoint-ORIG-GUID: TybCyTyTF8zD0RIHNStZgRWIqYEvA1zZ
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a553e76 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iYP2JlN40lpobhLRj-8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: TybCyTyTF8zD0RIHNStZgRWIqYEvA1zZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_05,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130202

From: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>

Add CPU-to-DDR BWMON nodes and their corresponding opp tables for
Shikra SoC. This is necessary to enable power management and optimize
system performance from the perspective of dynamically changing DDR
frequencies.

Signed-off-by: Sayantan Chakraborty <sayantan.chakraborty@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index f0fb55b9deb9..d66b97dea319 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -661,6 +661,46 @@ rclk-pins {
 			};
 		};
 
+		pmu@c91000 {
+			compatible = "qcom,shikra-cpu-bwmon", "qcom,sc7280-llcc-bwmon";
+			reg = <0x0 0x00c91000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ACTIVE_TAG>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <1200000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188000>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <3072000>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <4068000>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6220000>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <7216000>;
+				};
+			};
+		};
+
 		mem_noc: interconnect@d00000 {
 			compatible = "qcom,shikra-mem-noc-core";
 			reg = <0x0 0x00d00000 0x0 0x43080>;

-- 
2.34.1

