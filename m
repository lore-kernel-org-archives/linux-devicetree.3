Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5351A131
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058145; cv=none; b=E2T/8JrjE9XlMLF6KCShruJA3UoHUlipJof75rdUuc38lTAOW6Y2C+uhekZq4s0ipD0xJ85HLjEycVE54w6Euc0DR0wVGjtxw/EUjfm61zSK569xZw0h7cUffpDN8BivzkuOLlxUEcO1KbNcaOCn5Y+s+hFcVb7WZA/r5Jnpna8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058145; c=relaxed/simple;
	bh=wb3EvT2aSl7klz2UgJHQq0QEIeAXIx4uIPM2LzTmY2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J2G3dJ+eOc9kshoFE72BT1W32XVuy2gNwTkgU4JzB8adORZipk9i/xCYh1IoqLyCSVui8p6sXGFjhZbH8SBce7U0P459IkXMm3U578Ifv3C4tLLRrDWX0BeuyrAna7zUFiPQMtQvWA0YQLyQK1gc9escXKqS6Iariuf11gvGKhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CtdCMIcU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMig1TS/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CtdCMIcU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMig1TS/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kHhr1507254
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fE1exKssV2qfOjHjVoRaELptiZ1wBqEO5jlvibdDEbE=; b=CtdCMIcUK+XrXc8y
	IcxiitShv2sytA52Nmz2q+OQZt20rBDdoVsloSjnQQ4K0nFoP16xVil6Mo74bAYZ
	9Aj/LjaC9V6jezM+uiuxoofnSZha1lPEBG+B4wTKgxzSNpMBZHjXNlA3+TAJDOPo
	bwGAo+kDEoFcZANNTw5p+/AZFMuqvq4BKW2iAA/qQ/9Xn0ZKTvyAjO6FayEbaWmY
	L5J3rgYhhX/DnfNNfNrYtYNVs/tV19g7zuKqHYvDCiwgtRDXcEjkszgL2ygcTbQl
	ayjk8DS0xAE4myew45jxQiHfjzSpt/4Eo6XJPatXqvXppGhEFTy+GUvDibUuRbdb
	jtUv+Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bpdg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:55:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-156b5338d4bso1824062c88.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058135; x=1792662935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fE1exKssV2qfOjHjVoRaELptiZ1wBqEO5jlvibdDEbE=;
        b=WMig1TS/QYi6YM2+llyjRHC3+M7dJ3xFZOiejZy1w9tOZ9vn8dieyzM7ZJRtZgpDC+
         VI/TBROiMnDJYkED2w1GrVXb9O+FldlVw+6TQAhTMIbKTVSlkWtvqx5UBeWoKtPHu3G/
         XhjuJqUp4RZC1U/cTZ7zVn5E4F2MJpljWsLduEvM/hl9wR9geheadm0MKtqsZ2JElERz
         y7TkIl1u8qCAt4RunFDc/vcCkufzUulRCVWNm4Xjmygy/Z50qUyOW8ghVi/9jEMQe2Sd
         wj/NHzeB6M48lLT1koj58WONeALLoCW8suALUlxe2g6oyuYuc7xoU/4Xza2IDp/kAOw2
         7yDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058135; x=1792662935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fE1exKssV2qfOjHjVoRaELptiZ1wBqEO5jlvibdDEbE=;
        b=mSyB8I9VDn8JgDto8zQUoznJ6cTCi0QXgy90ToKRJQbMpw8Yfxpl9/di857rMA/8Tc
         BJ49wGEaoWnx5tElEnO2Mrh8EdlUVF2Ho5MpjhcxsiCSofAWv8CUOubxYHcsDIDQsuLV
         icLSwIdZ+JLwmtixH4nOBUH0OVEC5gLnCWnjk0AhWOQ5msvXsCGvp/0RlZ1jnU8zhzSX
         xJ9q3WKp+wMc7ViQR4TPZ/La9wFUh7ivWo5NaNGFhrYDOI/mzYO/tpaiOoqAO8LFLv7A
         y6ezIFyupE+Jl0LeWZ3sA9PaK71MAillZcUG4upq0ROtQ4zwilBlpO4SiZcB6o89iuoo
         M0XA==
X-Forwarded-Encrypted: i=1; AKwUvBy8zVygA0r4lKJlOacRx2QYnB3i1gyWwckMY/GR4q3g7pryXhSD154T15RZfvCYZmn8UEwm61sNzykZ@vger.kernel.org
X-Gm-Message-State: AFq9FYLfwHc8dh2HJVBCS2Qm9AglZxfCyfhoDIygiOm7QWwfLuUNk3Ll
	ETALbtMvGM0O+e1B7xW2F2mvfpNLfOcjlXyJDWbRWmxfoiiqEhd3NYFVR4gD2snef+S942VBYRQ
	sieSWNwMBbEGufoOV9/pHDj4S7mssrWMdJSGJQiMgWDYP+lfJ81v/BFnUyEwfA8A9
X-Gm-Gg: AYBFou2yTTfXKxvKJ4PADTBDthfRMN8vfKTvnWH2BAJ9RM0Fpbbq27Ur6PcssVp+4x3
	I5n19wVrI2Aq27lPzCaZZsHWX2I3nJtbUBbPEu6eFRTyzeVmw99BJ+aRkuw/NvqDO6r1ZoTnufK
	ZlHgHgfpmdWl6F4gG63fq57mTehpemiJc/voz7jG1hg2NQ2MEJYTykXNfRhfbGel0DAY1qslrdz
	ZCMeUZLYnI9dT63cRN2y6ChJLHUuhix/SqGtTa0eaXIvRt89n6kx9WLzyasDUrZqktvvvhIW1ET
	BmvUqJOnJFWBguG/zi+W081LcBQWmMj6MvCgnMkLmHPicu6BiTevR2sBJHKDgyacRMHNZXfBt+Q
	F3wDOqYN+GzyHR6f+ayjiY1Dtv2FA
X-Received: by 2002:a05:701b:2512:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-16a8ffd49d9mr20307290c88.17.1792058134554;
        Thu, 15 Oct 2026 02:55:34 -0700 (PDT)
X-Received: by 2002:a05:701b:2512:b0:16a:8ffd:4977 with SMTP id a92af1059eb24-16a8ffd49d9mr20307263c88.17.1792058133920;
        Thu, 15 Oct 2026 02:55:33 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:33 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:17 +0530
Subject: [PATCH v2 1/9] arm64: dts: qcom: shikra: Add CPU idle states
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-1-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=4467;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=wb3EvT2aSl7klz2UgJHQq0QEIeAXIx4uIPM2LzTmY2M=;
 b=qU3lNFGQgQYnbIWoAxUGGmhIZhU2+35sGMbVEWluduIDYJdEVd0ns2srHaOoFurCtymLVK2xg
 lIYELgHvuW6BbdnhE/S4hQ+1zJNuPpsGd7hzLQWJrcBvXoHtxm4OO0F
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad0a317 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=1ktBgAoqaJrOdt2i0ToA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: aXPggjjSnsYOqA74RGe8gvUU56v7zDhd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX7ltmcmV15g0L
 CJiRcQE0WH/IEqmXRDcUVHbyH9VAitJ/Dd3g6y2pbOqkjIWfYziuTdrr/huQ2W51L5RaRSuk0zl
 Cpy16sYO0Dqkr15tfmVd5YHuDpTvUFRLJL7dvrplnc2jM5oGFW/JGWTiZ9MQSr+KprdByptf2iN
 ZoKXfKu3M//D53jveDa/mK2WY1o8df/Y9k9g8oEyhMRZHBT0YwkN4hQICLdWVnDhRVaFL0min92
 yHkd8w/p6q2XvYyI/QEiepDg11wEHJwiPIskSeWrARg7s0M5Ro4gLfn2VUDDA9/jsbAXHq78siz
 qK4RdksBpvoad+Twmj8ZZI4ysp/MYbGk2KHiaD6UGL6JvHbUlOqNKqs9TCjF2VT/Mc36Vkr0D6R
 0ZKSiikW/fR4rD+F+mliQeg4J788m1yNkUPckPlK3nFXvLLgTWjXCKp9ngALildLBg/JsxQnMa9
 qIDu8zqn5HAkM2zpQSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXwfD5zurxj6I8
 PrsGxsqunUuBHzJ2PRhErzpHfp0ntiOExtEUmFAMv4BEftMLTP5HQpzGLBU52bhGIHgwQFP235x
 UISC/LNzwF0Upk21VSuqgAUcrFwCLQ8=
X-Proofpoint-ORIG-GUID: aXPggjjSnsYOqA74RGe8gvUU56v7zDhd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039

Add idle states for the  CPUs as well as the whole cluster. This enables
deeper-than-WFI cpuidle.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 93 ++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8ed8914733ac9fdc9b69128b40216e..df4a7181ff80da0b75287bf4b96f82facb152b46 100644
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
@@ -144,6 +207,36 @@ pmu-a78c {
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
+			power-domains = <&mpm>;
+			domain-idle-states = <&cluster_sleep_apss_off>;
+		};
 	};
 
 	rpm: remoteproc {

-- 
2.34.1

