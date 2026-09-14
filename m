Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637823A7F64
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369280; cv=none; b=tTmZBY28YUB4xRwpL4isffIkD9XTQucjqvcCjlDvdVUdhri7H2LJzzCbL9ctxBBLe2VCVU0hjgke4h7CEPOitBASNJ8we4nPD8JGlBJpcGI7mZB077YXIIen+KwL5OQ3O3qjjjciRHXqE6m8IvvIMKI+Xa7MM6YoiEI/G6im+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369280; c=relaxed/simple;
	bh=xgLpMCNINwFqqPVBT78gS2XsaLcIC4OX980DPAxnCFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpYlz1EpmNc48PYQtNZAJOBbwjztROPAOOHGBEN/M+3SgPo/4y1GgFT8PFSd6yLEaVAih3JXLXKkaSX7sNm0IkCSZT6jCToFzF/GuqsTUZ9u7Y3cnItnlDAGLOXZyNtc2/gnbsEPq8NxnV+knNp12ItcfBn98/P3j7Uw+wpmwPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EdGDxIi0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tj5k5IBx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EdGDxIi0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tj5k5IBx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ikaC3369126
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJtJYXAa8GpV4/jiuEq7JbT9lR3WBQXuWifjshJ7Bw8=; b=EdGDxIi0aulxSqsU
	ApUj7Hg5Lgne3eiRdLi/eZDwoTjTh62U2xoAGzstDv3JgkKQmsxYqVUbQ7YcHEOs
	BiQbIKBOX0K22ElzxIObK6nkvNS0MgNz065QZOoe8Y0aOUhRQbuCe84aZW2xae/e
	5Iwns2O4a+4Ixgay3qkhvD35hrJ8xrzCUlQ4D3s8CrVaLeC3s/p623VJpsYd7aMy
	NCC13Xe4XX/HkLcy9dMmzuM8fL9oy6a9SvUe7FCIfnOtTTpNw+DDsvr0/lq7g185
	1AHsRSl1auOktFRWvZIppqPy5n5l9D34Je4Cd6zq/c5RfE8TwRFt4SLP+fufyVtx
	Bh6ukg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5ecv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:18 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b26d8d2498so3761130b6e.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369278; x=1789974078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJtJYXAa8GpV4/jiuEq7JbT9lR3WBQXuWifjshJ7Bw8=;
        b=Tj5k5IBxNGg3VINWl3i/N6jxw7yiKX8t88IDFz/zWVXNCzCUPMw2aC0+9cg5V+nGwA
         eIzq/oJsbHNT9pCe62vsU64NJ0DKTLP44yUN2MeBft/NJty4qTjyNqPA+KhuNY6uioBb
         FrT4t7bL6TRWWMrXmWLBtt+qym9mpI7JUGqnYPc5bICfQ4nK7e2wEZWp+SoNdKDpza+h
         u0ZQxxM5gHH69XjIoKjyyEqoXnfltpZHVmareLosgXdGZ0jyeasadTLezGSSiaJj/v0u
         rGad8aCgsMyN86UWhs2CFeKHt7HprRy4LrN3GCrLjpUNHrvHVsgqBceSfZxWjDjQLttN
         8UCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369278; x=1789974078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rJtJYXAa8GpV4/jiuEq7JbT9lR3WBQXuWifjshJ7Bw8=;
        b=RrOYUSiRW6btpScINkualwkQa3EJVGD9HGBP/JjxTYCtSGOyIu+9KVqRSskkJcuyHu
         pRDaZq8Y7yHpZPKS7kMRsYvpRtc789mAgMYBrHltp7VeqcNXyvA0at6dBHaIx0Dlajg1
         95b2H+DqyXsxOmDehcRVWOlUJdyWrdCwymEX5ERNGpZ4mwCa634nTFbMAeNyjA5ZoKhe
         wnFuAmpDBSUou0ZmBDUryvq41kuKgZ2Jbp1eHplwl2LSioO3fJqn/BKIDFqR8Gh93cDe
         SyHRDYyl9sOas0WrALG2daIHLSEX8n67AjL1UNsopuDkSRJadoH1M8atyGIdBKsRVvF8
         LWLg==
X-Forwarded-Encrypted: i=1; AKwUvBxt//Tg2Pcm1KFVpW9B/rfXyRTwVLfs8DctIuxzKpPi0vgewyyK++QhREHdL+w9ggshPQLqTqtmdkfO@vger.kernel.org
X-Gm-Message-State: AFuF++nR6rN36thRXf1w6vqjLMCeUC5g5qj9vKYNeADPEwFX919VyjNP
	99kkQB1m3qdXG0kYqeaP67U7MYA7xydZTn+FebjiVKfXXHYZcZgt5++KkRT9P/v/hAqbJRYzpLx
	5WvldJ7Q5saKLlFxAuRZmiRR0tXHa9aXkUHAvLN17rhhtlYZU7ZzwjBa/Wiz/ELya
X-Gm-Gg: AYBFou2i3VTLG9oCwxw5z1dnQfaiVrZ+hYee3re3xQroR1LBJBpf+niqEIu7jZci7c9
	GTUdSQDBiBeIFR+wndfF3hBBjdhEETs9xXLEUTIlhWC6I2rwNXC+vkeX0G1VY3D/EK1sLRbkriS
	IHK7Au8hhAFZkcEoP+Mx4h8ajrFo7iMzztM/LtcVBJtjX1NcDf7N89hMh8rUwZovPevqBeDAhjP
	nvJOFHQHhMrGw6RU1UyaaUCJRaaCZ2vzqIa87N6ix82jTawPjTUHR1KYn4E0m89PB6RAYHIeiYA
	eiCuOuhzZ45O3ocodi0NZgPgMyfb6dVDsaN3s/eDfsDhLJNhR9OcQtV/vbj3lpwQRYZJFfwOIS+
	gRA6AfSpG09XTkfLggkllkjIf7WrG
X-Received: by 2002:a05:6808:4fd1:b0:4c5:cd9d:c6de with SMTP id 5614622812f47-4c7b42cbe28mr736176b6e.7.1789369277824;
        Mon, 14 Sep 2026 00:01:17 -0700 (PDT)
X-Received: by 2002:a05:6808:4fd1:b0:4c5:cd9d:c6de with SMTP id 5614622812f47-4c7b42cbe28mr736151b6e.7.1789369277398;
        Mon, 14 Sep 2026 00:01:17 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:16 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:50 +0530
Subject: [PATCH 18/31] arm64: dts: qcom: sm8650: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-18-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=4339;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=xgLpMCNINwFqqPVBT78gS2XsaLcIC4OX980DPAxnCFg=;
 b=uihvyWh2I1cuyZLm/JZbc0jORMQU5HLTCPrSUs9BVjOKwjeTMoBlXIiIJX2iRTwnWswqiyWk8
 3B6aenxKElvB2ivlbJkO7r+YFYyQmA/udETy+DfYki6op3hgLlGOl90
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa79bbe cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=rliMdntzdNrDum4ZpT4A:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX4ec8WH8r4DA2
 7spSwfXX2XGfbivFaWsbBkoYtje4sDP4gtAE+RQ8/+1LsmgkqLAtFlqQV1tHK46175Ot/RbDKJ3
 F+vkgdLYTC1n3RBI1uD3Y6uyiWg1G3ztIXJKBXpUlhSVe2h0V156f9y91LheLY+WpCdsj41AKzm
 c8QwG7PavkeGa9qWDnzzdSSJ1pHg/LKzUf0TaP1TkteEconSLwVUIyNRKTBO50p8+6SiWBELnPP
 KIB12wj9BpNrWE/jqhttpMEu9VrLJ4h5Ttkx2h3uiHO9W4CmWAYPLsnwyibiqxOgz1AosEyk5mt
 eYUIl/zjXZzPWqtJgVx0ZRCl2es/FHTt2NIWmin28kgsKpn07pyEzcF4JZ6QbaA05KKlc2sju0o
 og/lYPwZl9B34Y74bvGGFysZ+OJI33GkOLSguZF8sGF8zFEoUX8oY50DI3ocJRIRXGcnqHt19iV
 eC86YGbE2mNtZwsISog==
X-Proofpoint-ORIG-GUID: nNabJ1GQgva1LLI2IWCVh_sfTAmQSivZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX5tIuO+SEB/d8
 lwlYhxnhBAcMvYcq5bPrE4IxeHo0Cy8gZAyuqsNLP6MbpOhnQobTT/hLSTaYToJNPr5lC66YMWr
 JfRSoWfjxWhiEaIr8OMp5Sv5tc61jbw=
X-Proofpoint-GUID: nNabJ1GQgva1LLI2IWCVh_sfTAmQSivZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Use little, big, and prime CPU idle state labels for consistency with
other platforms using this CPU naming scheme.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 99509305f970..11e491acb715 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -451,9 +451,9 @@ core7 {
 		idle-states {
 			entry-method = "psci";
 
-			silver_cpu_sleep_0: cpu-sleep-0-0 {
+			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <550>;
 				exit-latency-us = <750>;
@@ -461,9 +461,9 @@ silver_cpu_sleep_0: cpu-sleep-0-0 {
 				local-timer-stop;
 			};
 
-			gold_cpu_sleep_0: cpu-sleep-1-0 {
+			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <600>;
 				exit-latency-us = <1300>;
@@ -471,9 +471,9 @@ gold_cpu_sleep_0: cpu-sleep-1-0 {
 				local-timer-stop;
 			};
 
-			gold_plus_cpu_sleep_0: cpu-sleep-2-0 {
+			prime_cpu_sleep_0: cpu-sleep-2-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-plus-rail-power-collapse";
+				idle-state-name = "goldplus-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <500>;
 				exit-latency-us = <1350>;
@@ -485,6 +485,7 @@ gold_plus_cpu_sleep_0: cpu-sleep-2-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <750>;
 				exit-latency-us = <2350>;
@@ -493,6 +494,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;
@@ -1659,49 +1661,49 @@ psci {
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&silver_cpu_sleep_0>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&silver_cpu_sleep_0>;
+			domain-idle-states = <&little_cpu_sleep_0>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_pd>;
-			domain-idle-states = <&gold_plus_cpu_sleep_0>;
+			domain-idle-states = <&prime_cpu_sleep_0>;
 		};
 
 		cluster_pd: power-domain-cluster {

-- 
2.43.0

