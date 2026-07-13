Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1D3EDE42
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938406; cv=none; b=YtuNPl2NmeuDaNBgKlsWfQLLiEz8R7RrDU+SxyScJWFtugE8GYbiTGrz0un2UIn0MzZ1Qr89U5gGkHng7woUBYjY4A57PXEpXfegRbFaKbuuRcu1JBiMG3dkMnF+KLPHdfSbgvBMb2BQsXwlBl65ab0g/pKIINKx3lW0Ub5/Lh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938406; c=relaxed/simple;
	bh=rQxxLM0jJkOrRdQzxvhz37dQOF0NxP1AODzN+crLYtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pdX8PQTkaB1PtUT/llF0kA/inxsk1rgsdFhICL+ClzKv0F3xAtF9BjQEs/hQgBK4+L6MUvLnho/AXFzwgGuxsMFxMy9G4U7abnm2b5RQApKzQJNAAgxoX+ozA0Q0RazsCUQsGgNODW/46uQMYV+fj4DDjwd9boTMDclVbFKT73Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YDCaT6y9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XBBhdxrQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YDCaT6y9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XBBhdxrQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9uim21089950
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uAnOOERdIxllvvm3kVk2q1b+wMhPfevl13MsiW4ZmC4=; b=YDCaT6y9hfFasqz4
	3GBngIK8OSFMkdXjMkewNEokHoWWr9t3k5sfo5idc//uMsagCjdjs7bPGMB1kl//
	ESFaWbsiavkRuYgH07hrgDe7As9lNLZGayBP6h4pPqNKLSM+G2Be985+nrEWuV7J
	5yDjFQA+QE17Ix3zwWm6xubwe26knT4bJXCSN75Wyp8XGb2pWgd8h7t64JXgtgyK
	LjKdFW8K92LKiU0xXvh382UUWFWK2NyS7O+hU9MJzJgfB93i1hbx4k/09hdqILO0
	a3Z2GfB7mlkYM09S7ztdIKPRpt9k96j9pOy2n90QjndnUYPHzefSMgcvQg7gU9vd
	stxPMA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4r3c5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c890bac374eso7729229a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938395; x=1784543195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uAnOOERdIxllvvm3kVk2q1b+wMhPfevl13MsiW4ZmC4=;
        b=XBBhdxrQLayGOFUa7A9aHafmX5ZHZBlfeA5bCVmZw0J+r70fXrVA4wi5au2o+li87A
         ulmYHh/hW9qp8LzedtlZYLGKeOuocdz1KEqVi//xAYOU5PnPp+v1IN/XBCKDYQyW2Gid
         8cUkrMQYEROu0zTcoUd5uBzOpyK3X2X9KFhsnNQxLqJ5lNetnCZWn767dBAJZJ1JcxRe
         XiVargc4JrFvjTZN+D6TMhR8V0L7/SkJgz+/AtSgaOMb21ELpRqyAxnA2/5KpHKElDvU
         QLlvoFfx2ZY8eyixuQgnKCCzY4V2mi7sP3HtV52meJ51ZEjOxIKy88HTWdlF6DZlE3UL
         mcAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938395; x=1784543195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAnOOERdIxllvvm3kVk2q1b+wMhPfevl13MsiW4ZmC4=;
        b=sL4dZp3zD2AMa90A5MhvfhPfQ4a3XQeEH7A29wLUN0CSIH6BD1fzZVxCJkMpTnZo6J
         fUBeHL4ruaSp2Vp5TlSEy0elbSVHs2YX4rmzSbEZhxgFp4QtP4adYy2VIM3slQyLqvDn
         feM8/otjiM9dNDAzpsZU982W0qWi2wfHwb4oiPay0H19EcLmYspY4cH7K+9XlL+ML24T
         MTCauiwbhjHCcOpI2zBGzqNJ3D6Dri0X3BlEtPnSZOjzibfoA+jXt816KSBtQcVfwnZw
         NVdwKASwyymQ0yoWT4G9QUvLRRhpO6LT7dt95HZ3DgZfInSL6wkISVflMbAINu+Mfdw3
         UTZw==
X-Forwarded-Encrypted: i=1; AHgh+RrTrjRkxvaYRNmpk05BmUbVoMXSHMT9swpw6Z7sUBmcsx3H4i4nX6+EOd7MlKW2qqZcjXKDHTlIidU9@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9xGiV/rRkBaAGXIW4pG7sFuuOQGyPcrzWUjdr8uHZSatGc2Gw
	x6zMeq1m8CevC+2hJoaGFSL1jKWAEdO2oY8pLv68/i7TNjYZ56zVwke0uZMZBBAdC3cbMxu+lib
	bSUr5bFQ/dT5ak4vicxdYKAASIw4u4Dg/ki63xS5aTd1q4+xRJgrjeFNquGcG7Nn5
X-Gm-Gg: AfdE7cllbDr+CfNqDhYaPoiLRIdTFS1tFSElghXRTEZLLZ5WJ2EPyAHlj+B5Gm0VNmw
	yPT2Iv4b1WcoOt3IiqTroYHLU42UnVu/3YAvA/WtMb2Kdh9pBBjMRuFjUeWRbDRUl06HG1tApwZ
	5hNLq65SigRwBmiWBxyB41SiMg/HRmQ7FexPgHML4YQAIUEe56OOXF2LrK0TaoaC2CVn600qhdv
	yrRYT/qIZGJFtcKsNqgx/SnFqvu3SYAeQ0uhUTpJGFukY8PTyrtLNVkGBA0mMOJ58wZb30lCgxg
	45FPOZyxQQ8v3FDDuk0nvJq1yFkqzw8Xb9mQSDOIoRzgTPdP3goCde+D2ATlbsIkqrr/1wJxRsb
	NkQCVN6r1uFiQw5CePy/HHGCfoAXPxtS/tshhV5jF
X-Received: by 2002:a05:6a21:a97:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c1108cdbe9mr9176900637.43.1783938395223;
        Mon, 13 Jul 2026 03:26:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:a97:b0:3b3:bf95:f7e3 with SMTP id adf61e73a8af0-3c1108cdbe9mr9176874637.43.1783938394793;
        Mon, 13 Jul 2026 03:26:34 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm49010603c88.1.2026.07.13.03.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:34 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:55:47 +0530
Subject: [PATCH 7/7] arm64: dts: qcom: shikra: Add CPU idle states
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-b4-shikra_lpm_addition-v1-7-3d858df2cbbf@oss.qualcomm.com>
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
In-Reply-To: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938358; l=4857;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=rQxxLM0jJkOrRdQzxvhz37dQOF0NxP1AODzN+crLYtk=;
 b=HMNNF2swY0UNIiA14wmbPhpGg2FHMfShS5/aKewT3nlu46iz+CqJmZZ4gE74fNJhLIJvH0JAx
 elJPM03GWUICheEqCjN5WsgB0cpNx0rGQW5WaodVj6o/nMMzVxAgmoi
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a54bd5c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=bsYgX5F8lsGEO7NoQ3AA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX9XMcV23APcWV
 ycrdlxiTVumXeDqdICb0d3P0fjPNuWcr8x/UXcXZESUgdL0VT/KTFoOv4A6xVrk84mqK0prB/hF
 9+qPWfZKx5to8gzNipIud95fE8ooN78=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX33eRb6cqZE3c
 g/cBSD8W0tU5+lN1m/BMkvwoYntZL5lhWQ/nJM/aZCShr/M5LkTq6Y6HSvN3aGBYhg+Evf9I+oF
 ugkHmSZcwfjLCsy8GGc9ZNKCOdcitV44ajNyv+Avz+Q7pJXrRnnTAArvhRGes1aq7rtZeLjNSMK
 oEFeoHkOkqkAGmuuBoswD0kJ3dyTj+k06yuGHiAi7t4WiwadjrFXNX12hUNgTQOoyjBivgmJt2W
 s1BES3ZkVf7DpdLHB9lQ9tp+lEnNZx5saGMM4OV0OmuvmwQiHPsGoS1nlr0RoBio9oPpL6ebA2O
 apTAqooNA+wxtrjESSFU6y+yFYJ/ebdywQRWlCTCFqRYExjt2m/i/+A5IwuC3Qa7co1h08qMTQs
 oenOzdekr+VNFqbshSNqdwTDwsnXKh5Z9gv6QSYjYN+ZOGmm6v2Vb2PNRDIJJ487oGOsE4RB72l
 Cae4h5Q67MWMVrLHyaQ==
X-Proofpoint-ORIG-GUID: RVFbE-gvd0nWPy-00J_3N-JNIBtdmK9c
X-Proofpoint-GUID: RVFbE-gvd0nWPy-00J_3N-JNIBtdmK9c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

Add idle states for the  CPUs as well as the whole cluster. This enables
deeper-than-WFI cpuidle.

Add MPM under cluster_pd power domain.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 94 +++++++++++++++++++++++++++++++++++-
 1 file changed, 93 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..bbe198d4a476e9d3037439307a0d12ab58049de2 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -40,6 +40,8 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd0>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -50,6 +52,8 @@ cpu1: cpu@100 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd1>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -60,6 +64,8 @@ cpu2: cpu@200 {
 			compatible = "arm,cortex-a55";
 			reg = <0x0 0x200>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd2>;
+			power-domain-names = "psci";
 			next-level-cache = <&l3>;
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
@@ -70,6 +76,8 @@ cpu3: cpu@300 {
 			compatible = "arm,cortex-a78c";
 			reg = <0x0 0x300>;
 			enable-method = "psci";
+			power-domains = <&cpu_pd3>;
+			power-domain-names = "psci";
 			next-level-cache = <&l2_3>;
 			capacity-dmips-mhz = <1946>;
 			dynamic-power-coefficient = <489>;
@@ -105,6 +113,61 @@ core0 {
 			};
 		};
 
+		idle-states {
+			entry-method = "psci";
+
+			little_cpu_sleep_0: cpu-sleep-0-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <549>;
+				exit-latency-us = <901>;
+				min-residency-us = <1774>;
+				local-timer-stop;
+			};
+
+			little_cpu_sleep_1: cpu-sleep-0-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "little-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <702>;
+				exit-latency-us = <915>;
+				min-residency-us = <4001>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_0: cpu-sleep-1-0 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-power-down";
+				arm,psci-suspend-param = <0x40000003>;
+				entry-latency-us = <523>;
+				exit-latency-us = <1244>;
+				min-residency-us = <2207>;
+				local-timer-stop;
+			};
+
+			big_cpu_sleep_1: cpu-sleep-1-1 {
+				compatible = "arm,idle-state";
+				idle-state-name = "big-pll-power-down";
+				arm,psci-suspend-param = <0x40000004>;
+				entry-latency-us = <526>;
+				exit-latency-us = <1854>;
+				min-residency-us = <5555>;
+				local-timer-stop;
+			};
+		};
+
+		domain_idle_states: domain-idle-states {
+			cluster_sleep_apss_off: cluster-sleep-0 {
+				compatible = "domain-idle-state";
+				idle-state-name = "cluster-power-down";
+				arm,psci-suspend-param = <0x41000044>;
+				entry-latency-us = <2752>;
+				exit-latency-us = <3038>;
+				min-residency-us = <6118>;
+			};
+		};
+
 		l3: l3-cache {
 			compatible = "cache";
 			cache-level = <3>;
@@ -144,6 +207,35 @@ pmu-a78c {
 	psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
+
+		cpu_pd0: power-domain-cpu0 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd1: power-domain-cpu1 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd2: power-domain-cpu2 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&little_cpu_sleep_0 &little_cpu_sleep_1>;
+		};
+
+		cpu_pd3: power-domain-cpu3 {
+			#power-domain-cells = <0>;
+			power-domains = <&cluster_pd>;
+			domain-idle-states = <&big_cpu_sleep_0 &big_cpu_sleep_1>;
+		};
+
+		cluster_pd: power-domain-cluster {
+			#power-domain-cells = <0>;
+			domain-idle-states = <&cluster_sleep_apss_off>;
+		};
 	};
 
 	rpm: remoteproc {
@@ -217,8 +309,8 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
+			power-domains = <&cluster_pd>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */
 					   <12 422>, /* DWC3 ss_phy_irq */

-- 
2.34.1

