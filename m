Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED74D39B949
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369296; cv=none; b=a5x4UnY5tjouB3/UEvX5sV1znRIOTriDre1UFU8sqnyUELHolMOU/h7qLuJsBb+m733qdIGbw16/mp88x/AUTqc6M3Y1eWcx5vUMXEUtC2f12C4sIUepaofIwB03bMCkRAj+tKaluiBxslQzN7AydceG//jSTG4HysACFRYK5z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369296; c=relaxed/simple;
	bh=pCNTZHsA2UbHJDN64tqrrT0kQDxntC2PXYK1qd+joNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UoNoJFXdewhelFZ50cs4dylh3KGt5pPjFyN8a00a7WQ2n6ac1NdOAqalkc+QBDW7q1YsTXDARiPeecF0utDXHAXK0GnTURpl3/+HbDYvxVy47hjWkE4ltBTdc4dpEqR4IueIb9usHSRx/n6VkLtEn/B6xHS8PondfHbCIOYF/nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDmFmYM3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZsQnKs6E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDmFmYM3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZsQnKs6E"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ipl7793595
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H9a2vz+xfe7lwSs8AKFPiadGBP5vY4R6P7MdXNsWTBE=; b=pDmFmYM3/fep1BmO
	0jCvuxHZ5DcRp0oHG6iOdcfV97Ni1Y7/pRFgp/CosrrpX0CoHUZWSBBvrh6GSyxG
	OaOAkK0yPZqGBmIUxz2iutHfw6iNlXy/hzBBzAB39Vsbg8fkxp3dqeA3QrNQjw30
	jLXeWd5XzmesPWXEwWRLOSgYYiwy2/glYTlmDM+JqYIy3q5gVB03BCqc6bW3v0B8
	O0QgxNdaPWuD6DYl7ComSRWDjx3uZ7vm/OzhUWDqbOkVkW00Tx1el9aeBEqbWeg3
	/jINi71aWynk35u1Cnyw+UddDgiVP6M/Rxy46HWJjzYsqAxDzCjiy/iy5HbG69cj
	1pLkLA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cnd2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:34 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so2938743a12.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369294; x=1789974094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H9a2vz+xfe7lwSs8AKFPiadGBP5vY4R6P7MdXNsWTBE=;
        b=ZsQnKs6E1B9KxH1SS83PFFCAV6H6HSpERCUXiLpl+US3InXRSGk8Fqtzj2eMtlkg8v
         IFSDz6XVlfWzXgJoMzmVMtNzkZVtvIVQxsGS7aG8Q/pXjK9C9/HGRJwFKpIpXNY+kAB/
         r1tpyCQof5KyKtonGSYBv8V4g1oDCXnM1T4C1/DkyIn9J/VFxaqHotA+evcYzxzD+J8a
         9hUJWjioKWt/iHqPiH70DvQy+6On1SmzjxgxZuVV5e0twVdi5POQ5LA9pHP9wYNo22xP
         r9m/8Kct9yt/kRJj+zH5clSJQ+Aj4zA4GyZfXIstyX/tJVFbMRLlq0/fSya9X2eRquqg
         E4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369294; x=1789974094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H9a2vz+xfe7lwSs8AKFPiadGBP5vY4R6P7MdXNsWTBE=;
        b=PRLphFq5AMmROHBx5um0xQ8cqH0iKL2ALPaOHJLDezgu8s/OTiKg628RNlTHrLI594
         vi57MC7Okni1eralVom81vvgV5pivUSWh1yGriYeVS7lEMqvOJ3XlBfV8mxsNRamwG20
         DzLQwG6EKE/ZAFFKsLpoFEZuWsY0nRO24ILL8Vho0e6G5gjLETODB1243MLZi8a6ak8j
         J58wQropDL1jfMC09fvnuXdHUcABqdKwOfngDcsZCJ4WvWHp8vjS3wvVtRyhL73zmLRA
         7TIJ9WIhhxkHnBla4Y2dTc+KBJDG4NEDrlSj2RLS6yzQYsa9svl4C4+7rec9VPK8KQM2
         rzmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnbU/ZKbjoPzqd8ReRLmGEF6st3TB4zOR+jBqoHldd+UWDrqOHnZfZ/iPMCiiQ59eP9nN5s+KYDZbQ@vger.kernel.org
X-Gm-Message-State: AFuF++lpux35CDsxvasPyCFwgZ+ReN4/gIJPIF5NVOu84EdtGzMPta4x
	2ZhOhCLU2bS7JccOSME521tB/blA5rVW8E/zy9do7PIy7dWVsBDXf4ebIjQA2KWvxYmWTu4RwRW
	YuHA3NCsYUVM6vGq0B/B5RhyewIWIPsy+8GKyOgoaoQL32x/2zpywvrcx5VY9yQ7M
X-Gm-Gg: AYBFou2qiRFMboqAQoIqDMfXGDcPuHY4IVEZrQUFm55DjfBrdmVMQVVYdlLD9V3jQU6
	VdkeOxX8SIyOcDP/mEK6HbvZOao1p68gaw76N8iolUemRZMsfKv+qHn68Xi8+UB0mIEjA43hA+y
	QpoLch3c6oHgj5lU+jMS8u6VWFFIVUJbd8XDYauLnC1nW0MInwX+hYx5BlmGOm0u7hketOd+zDq
	Ml2Fk4BJJJVXCIf/fGQFvxiaKgniTS3C1P/jLVXWqv4FX2964HXb79npWu/4d+illLj5oD18qHF
	Mk4lT46I1PxiVlj+PPeMUHbbs8tqzQW/b84c/2rHAIc5we83JQXJqDLwqSdTpDyhWg14P/nlf9B
	uOJ7gNldacTdqOLFm7DfA/9A28RgQ
X-Received: by 2002:a05:6a20:a11d:b0:3d3:adbf:7783 with SMTP id adf61e73a8af0-3db40672d49mr2763038637.24.1789369293277;
        Mon, 14 Sep 2026 00:01:33 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11d:b0:3d3:adbf:7783 with SMTP id adf61e73a8af0-3db40672d49mr2762933637.24.1789369292660;
        Mon, 14 Sep 2026 00:01:32 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:32 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:53 +0530
Subject: [PATCH 21/31] arm64: dts: qcom: lemans: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-21-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=3522;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=pCNTZHsA2UbHJDN64tqrrT0kQDxntC2PXYK1qd+joNs=;
 b=IYwPhp3cBF/fdX9DNYCx1xRWazsb0ihTOjXuohFU3knj++i4eV1W7387n1At8h739H2Pautn+
 eOLe+lc+l2FC+F8r95tCtvpGWsfBfnkUg806mN82pfex7q4UXxlGogq
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX/kkt0s+fBTLO
 9I+jEe3VJRtWNnj5N+qlAvPMMpoI1EhI4DpWWK3dCR01sCz74a0O07fQn/8JLDebc2xFB05O0ZB
 gZv418qwmfOe/y8BMu9+vxZp6DrBO72GH73GN0Mlbuz1poc0oGbUDOGk3MT5EXVeC0jff8P6sYL
 wZha4gYMgBAUuvVSElXAnuMwFohMnkKYf+ehLdbqmMy0N5nLqt/rWgu2AcdwJZuEpLiTLVhP3ni
 zsNlaZknhtAiBM9G1wXaVLxXx/5gh8yWbJBcZncrFbpKMCS8eww1I7Z4TWEMMwse918aehY2Msc
 t+HaWvp7xOf9CnozqS/obXpPE3ZkttjU8GaFdhJy2EWsM0Y1EITRncImeK7LOE59BzC0N083yxO
 n31G1AphJ9yjZvBFD1mnPcxP1xhJXhZe49IilKn4Kqpr7aDN+ByMqDs5upjzedvqe0wJJK7jmUG
 sUu+p5qCmnjQ2j2dh6Q==
X-Authority-Analysis: v=2.4 cv=EMyTQFZC c=1 sm=1 tr=0 ts=6aa79bce cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=UcAHh5uPUnfCHGfL1k4A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX5d+qaSRTKv+l
 rOiJFEUd+5KYOvAHElfeMoAKtGflZ1gy1uV9/nY3ByvtBQLdungmt9oEUQ1edUggu/tuuUowoFt
 A7vZG82e+PWL0WDsmHK70iCcUoRYRUI=
X-Proofpoint-GUID: MSHxpUtzSfd-5YRQvBY2Cy_y2jWNSWsM
X-Proofpoint-ORIG-GUID: MSHxpUtzSfd-5YRQvBY2Cy_y2jWNSWsM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140098

Add the idle-state-name property for the domain idle states so low power
modes are described consistently and their names are printed in pmdomain
debugfs.

While at it, update the CPU idle state name to match the low power mode
it describes.

Use a big CPU idle state label for the shared CPU idle state, since all
eight CPUs use it.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..09e6138d2990 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -297,9 +297,9 @@ core3 {
 		idle-states {
 			entry-method = "psci";
 
-			gold_rail_cpu_sleep_0: cpu-sleep-0 {
+			big_cpu_sleep_0: cpu-sleep-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <702>;
 				exit-latency-us = <1061>;
@@ -311,6 +311,7 @@ gold_rail_cpu_sleep_0: cpu-sleep-0 {
 		domain-idle-states {
 			cluster_sleep_gold: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <2752>;
 				exit-latency-us = <3048>;
@@ -319,6 +320,7 @@ cluster_sleep_gold: cluster-sleep-0 {
 
 			cluster_sleep_apss_rsc_pc: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "rsc-pc";
 				arm,psci-suspend-param = <0x42000144>;
 				entry-latency-us = <3263>;
 				exit-latency-us = <6562>;
@@ -557,49 +559,49 @@ psci {
 		cpu_pd0: power-domain-cpu0 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd1: power-domain-cpu1 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd2: power-domain-cpu2 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd3: power-domain-cpu3 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_0_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd4: power-domain-cpu4 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd5: power-domain-cpu5 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd6: power-domain-cpu6 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cpu_pd7: power-domain-cpu7 {
 			#power-domain-cells = <0>;
 			power-domains = <&cluster_1_pd>;
-			domain-idle-states = <&gold_rail_cpu_sleep_0>;
+			domain-idle-states = <&big_cpu_sleep_0>;
 		};
 
 		cluster_0_pd: power-domain-cluster0 {

-- 
2.43.0

