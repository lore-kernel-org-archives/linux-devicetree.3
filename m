Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F497388392
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369304; cv=none; b=ZT9Nd1X6NxDlAFyBoFvBp+gwwrCUBfaQrl8Y5Zpn/bwzF/PdHEl6GMbIEqirCUXj1C/AMcM8KEnzKKBH2tGYJdMhYBJUBRXCeuoryl2Fgj+U1L7EAeWXlJTjpWDMCp7sXzfs0t/aii48YQbMNXVxPxNQeMWWfSn8dUSCAw3oNHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369304; c=relaxed/simple;
	bh=0ChFdrnXHniIZffyMMg9wPkrrgTJUcEhdYiSTyjce6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GZfkZ3rx/KZLGBtbvfRHVr1iHp9/xHP/HqYxnXLnDbrxjerWj3E/uTahPrBYKprUWvoyjpKgIOBZGLdUxLfdVF+Lda6vGnZ3CDpfGGW2jf0pp+k0guxf96rKNPRJHoLXrUQ5ANoXvDRGjvLfAlLATyiP74sRL3D5zAUwCvHQeLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpF1INwi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8hTu/oj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpF1INwi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j8hTu/oj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ixA5543166
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v5poFASCQGmaTA8JRz0hlnh99JV/MkN0yzoUGlZxOoE=; b=QpF1INwig6KlnqY+
	NB9gzja1buvCDTq8VO2MlG6tBAve7QclfRBzAERNL/3OkKiKlzOcSd9fbwyeO31N
	+Fihe3x1RWhT1CjT76QWZWAERtjGwDmxvADzc2w2CbsYJyPvKu+ceBVmyxm0271S
	wpi1vio63L6sXb/0kZp4pk56+RkwCsEHMrxGLGlihg6bu4U8rLBEakSqBqXLCXVh
	grJqymZ6/HRawyhRDjjAr6jlJk6UcW4RAWwpV46yizSF0TwC1qkYjTdNlqvHDv+V
	z+zpSUa1x7a0vyW4Xwe6HCHDzaE7CHh89u32AmdB3ZRkcbzKDLqyCu0mKISDu7Op
	8XvM6Q==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k098t2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:42 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46509ab0149so3442288fac.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369302; x=1789974102; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v5poFASCQGmaTA8JRz0hlnh99JV/MkN0yzoUGlZxOoE=;
        b=j8hTu/ojbD/JYcu5lhLZPB6m7KBDH6tqI++rKGHQEpD0zxaf3+rpbez4gh9PyEVe9V
         EffpAwKss37Izz3KGeIZu8/OSGguQ+DFbKPz09Kamp3jKuO2VZIOESHhzXdl6MdjlSLb
         dX0l+jSI7iEm6aOhAFvdLVKnOwaRP1Wc3aFfFE0Ezz8CHCw9ZxhbLAISLYBnwHQ/dvjc
         XzIq9PnxZx5CUHmPMFFrkTKCwugVvPiqqUFT+8TtOsfsrYesoQuGD+xWgE1ht2k8L9RY
         XGNffCzUYAA4KmvTLMcYbUmmzjTf+UaOIABsHv7EEI00KPYJKJ3T4yQx9fS7J3ItZSWk
         JFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369302; x=1789974102;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5poFASCQGmaTA8JRz0hlnh99JV/MkN0yzoUGlZxOoE=;
        b=mnQHR1WieeMaDjAACrHF55jEG5c2X77ODtWA8U9oGgPXOMHtF+svondhD8OASfHYa9
         WCcfTXmP1ExfAC6TLZDjEE4VQbtN0matJxa4lRUprOG1WIMvJYzqmz0V482XWwXaX5ai
         gbzp/7GEOatLS3TKlMK0STHIC2XHc4PEGjt3Gw63a7hrjZBvtcdZAh/b27av+dRB35g3
         4OBY9hQcjyPewQZebeGhwcpxU0ZrvoddGiFaGTO9aokHFfpfyXWe8VCctVONDSnOuquz
         Qn0wtO3SjwghcRbewvJIiOLiUJ0UiUgX3OvdmEuS/0wKAFMycVfHuTCea3MwOogV0vmy
         5sdg==
X-Forwarded-Encrypted: i=1; AKwUvBzK/20RhwnfA9lZVFQkgB/kSvDnQoslgbIFTfrlC/Ro77SI30AHvOR5ClxXr0Go7AMwghp/wYuKO6TE@vger.kernel.org
X-Gm-Message-State: AFuF++n9mhSs54c+FQ9inHb/NRNBpY/W+Ts6QrEtifgAOdmrosY28rpA
	5CJwgxuX+rwGnG3A8JqUgwhIiYE6eFrBG0imI0sLdgLIrZ7TSP1bQDv4VPKykR6hjLCCK7CBwXr
	NsDM3peD3ICC/TxhU+fBAk0TtzNIAfB15iyRVa/d3cKUt6pwLtLHWEkXnZu6nzrKi
X-Gm-Gg: AYBFou1z10T2be5z0Jadx5nhr+Sat/1J5w90DaarqaLpgMdHqsx/LRnPoXzb/4ZZNsj
	FMR+tkfMX33hfU55J00vA/iMHX/A59mZILWmJA8G01MyTcSCko6y95QL4XmOqPyoQW2cRR3m2gc
	T0EBoz0D5HlXDQi3qlC4RjArAeAVkfw5Q7pLiz5Nr5IwgTOAMJ2XGFaiN07OZszp5BxhMVUXosZ
	F2zNvks8Klh+rUnm4fAfKu4Z/D68zyH5Zkew8qFUbmAGzppmF8nuqAeS6ATDCgioPvsuif/KXQK
	Brn2//Nn1ywa4joUgZ1PcJBytbPpS8XsgKwQ6T5jHWaYEwim4mrzt9zOXsycZxYyoKVvHUN0cS0
	J3qpelipLMQeS8SC1eAu+VBCvwH+J
X-Received: by 2002:a05:6870:6c17:b0:475:e066:7717 with SMTP id 586e51a60fabf-481f9c31929mr694738fac.30.1789369293759;
        Mon, 14 Sep 2026 00:01:33 -0700 (PDT)
X-Received: by 2002:a05:6870:6c17:b0:475:e066:7717 with SMTP id 586e51a60fabf-481f9c31929mr693908fac.30.1789369282581;
        Mon, 14 Sep 2026 00:01:22 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:22 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:51 +0530
Subject: [PATCH 19/31] arm64: dts: qcom: eliza: Add domain idle state names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-19-660c31187819@oss.qualcomm.com>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2186;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=0ChFdrnXHniIZffyMMg9wPkrrgTJUcEhdYiSTyjce6k=;
 b=zvcHRcEYw0cZksT+PdG0qtAj+DyDokBz2GYKk1ZXJ51Wmp2I/5j1vXP1AQejmJVklaqdMDipr
 Arel/M/HYg3D/PWcyCT26JdAJK9Mov3mT+tKdLsMGhMdb/MRHnlW35E
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfXyQOMWrLXa6Fz
 P8DsiIgjYoaxJYhTDv1IjifhJOuS7a4AdAjfFsif5IRq7S1d13URROhDVI3XsQuohE9H/I+ZNNE
 +tGiHcYlyxN5wV+Lv8Bv6HDnWOgIfM8=
X-Proofpoint-GUID: T0dAg_5AxwYFUNjVSGnsIQEb8ZiAGJF3
X-Proofpoint-ORIG-GUID: T0dAg_5AxwYFUNjVSGnsIQEb8ZiAGJF3
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa79bd6 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=jBt9j5u6eBwbyPT3BWQA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX9oLxaAf5sITY
 5eROROw/oqFIG1nBS1gE7GzYajwXWbTzeHaDEHIAavuvjEEm6lXLLov+vJcbSlFMdZKgvKtS4Py
 hbtV0Gr6Dh1NoHpOp7SEWg782ry9y0OnXlwkqz3fMxqwZgVJwJu6fiG/n2Q6NfT7wIBOf8Wr+Yg
 3uZSZHpdhM7Y2TaUu/eut95QUmUTEaC04IVuQFzZ2p2OlLQf5Nhc+x6kwb8lLaFH24ciek7TrNA
 UphGfoR/tnZcThepkwJkFxzh71iALWGcoqNd13VXwOAqVxH8oRj/4c6k5UBxf1Xj3urlmRDHM/5
 TC+VknDHswOPb2jXfKvcgMlmNPuMGpA8VtSh9OdvmteqaWMgxFXBQBLHCK1laVmu7uTq7oOCkB5
 dWt8H8Yc/MYTfWtw6srSLE6pVSQS4ACb1N8rupNqJni1TRrKt338BiA+bOulbyMqj3Y1IjxqFr/
 3l15uy+wpxRW/mbUdTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd07..2b6bbdf3f28c 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -284,7 +284,7 @@ idle-states {
 
 			cluster0_c4: cpu-sleep-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <550>;
 				exit-latency-us = <750>;
@@ -293,7 +293,7 @@ cluster0_c4: cpu-sleep-0 {
 
 			cluster1_c4: cpu-sleep-1 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <550>;
 				exit-latency-us = <1050>;
@@ -302,7 +302,7 @@ cluster1_c4: cpu-sleep-1 {
 
 			cluster2_c4: cpu-sleep-2 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-plus-rail-power-collapse";
+				idle-state-name = "goldplus-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <500>;
 				exit-latency-us = <1350>;
@@ -313,6 +313,7 @@ cluster2_c4: cpu-sleep-2 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <750>;
 				exit-latency-us = <2350>;
@@ -321,6 +322,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100b344>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;

-- 
2.43.0

