Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C963A543A
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789369276; cv=none; b=LB2rLrSD6F20IjAxwVQy93puavX1iDnK2C8pPWYbJwWxLrsmGO8aUo4sWaKuruLdd5hA1XsP+8GZBrRAiD/ci7krUTGCjLgOgPtJhyj43pZt8tU5UX8RVF63pZ0uOKP4O2If3gJGC33kvIq/iagyX9pZ/EMXleLuyqFcaWGwlEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789369276; c=relaxed/simple;
	bh=f9LwNRyT49v6v1jUVlZUMNJZ/T3+edf3GKYv/LCKBX4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ACKy/S8wV6i80MC8UZJ6HVDwIvW4yAXFZAokMJxA9Z+yITouL21wgQ5V/SI3ecg4IfGY93xT9s9e3qvXGVvK2Q1qxAIHoKQ7ApThHHqlkZ5PFK32RIo2ZDjuPSeyMHI3o5jYf6wgDNjC9/urasJL7t4cdk6zY5RtdXKqkPiMvwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jut85FkB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYakh1Fy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jut85FkB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYakh1Fy"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jErJ3842307
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6DIFOYBElHwP+qQWbh/X7gsAhzfrOsm/AMFL+ChATVA=; b=jut85FkBC5AmI7WH
	5p54xkfOX1On19I/aHjuto4XRSKnMkA/Mbe0oWKsA3NYvDOvUMVUbmryi+HrkVtD
	c96hlWkgpOGL8SWsB3ZIvriu5RyMPDEwKm2niwHHn2S28NORBFvOlffOgvSMSlN5
	BIrHfdCMJQO0UEUbSJdRASIOe9R0yiC+lk2qJBRW77oLQlOe+GpA55fUUSiQdos6
	gxi38lHX2df7VcCM7f3zr+nnZWtJoX21xBFahm9hLhxB760pk4E1aYg/5DsFMjij
	jmJpFUzADXKy4ipye3ffyZHlKQsn8ba3SaqvEqhp3OTjgD6RliKtj/GlNuR6KMmf
	Lu6FcA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c5eev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 07:01:13 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c307941971so4163458b6e.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 00:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369273; x=1789974073; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DIFOYBElHwP+qQWbh/X7gsAhzfrOsm/AMFL+ChATVA=;
        b=PYakh1Fy3/ZfQd9n1hnfZ68wm9nhyrLR8nYvIwkQK7ZZbckIkMHhsuveqlRDME36Ia
         wpO5+qQXx4+JWFfWdsIdI5PYL9r61NaLCt1DpW6rOOFJ5rsRm0r/MZwn/li89umcxuU6
         KWUgohqe9J1Xsd+vhKFm3mxNB6Xh/LaaOBSAfycqTJZC2VTKda3UbAa950E3N6YQ+jum
         DEd40KYI6s1YmJqhC/Gdh8G9E1rv1Y4vfLkSGBzjr8IcigLgr9Di2bCQqpcXYOQ5neXV
         HsLISSmDwEciuN5/sMEBHbPAwXAoOc6uDgB9MHDYZp/gYXjs5DbmLkyeFJpfMoqR+yJ7
         DAJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369273; x=1789974073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6DIFOYBElHwP+qQWbh/X7gsAhzfrOsm/AMFL+ChATVA=;
        b=pskEQiBm0jTSD+skBwk9WZDWHtPlV/k5U3cd7xb5o+2dkyY0xXJhqeIshVWJt/z4z/
         rKIgyn27L/ly73cBO/WA9iqGn8R2I0nyO/bKfSHjfs9ey3vBdQt6ygCpIri4KFrFeccf
         HdcrAUFx5ZkksqjDBrrHgsrmF8lG3c6ff1WWAgZM4ZOaO0+yofiBVYcBmlf/fWYMcFzu
         osUj8EY0gpPnISucP1hmZ0YDrLLEnVSpm6vr5RtgCwTcYHsa2ih5g6L9bMdx6/ro2r/Q
         YIYwL+m7oZr77KxWu+H18kKw2sAhOsIApuSKaXCy878rYGpfBvD1CenWdkvdYmY9NyhK
         +68A==
X-Forwarded-Encrypted: i=1; AKwUvByw+lBUJj4Uz5qqVFSVMRJ3MiMBUojv1nMQz2PWecszB7r/6jRQBj+f68PgbCBqb5uKnuA2c8of4aLW@vger.kernel.org
X-Gm-Message-State: AFuF++lD9WJVd3ccuySZ6CUp/zbQi5QMtrq/kVCHqbqtGCKye+veXA9G
	4SjQIX61/wd0y/5d3PeePrfXK58FPD6Lo7hNt4nSeec4BpswekF1p5IGYRbHX8/j8x0k7V7wV0a
	KS9/Z6fWxOV2vaf0rXZjepsAZf1SLMp2///u7ftJnliq8OkyOODf5m2qkZj4ESDWb
X-Gm-Gg: AYBFou1fnR07aQ0u2xEGnGOnFz/MHzheq0cYX7yW2VZkGJTIh/Fp2mzCNPxOjF9z1AY
	657zRoTt/dQEHX4q1g8VEuKqidEozUTaYM7Ybto/NSyZeeI/HrAKB3W5aPRw/F34/o3tGp6aAw0
	sIlzPOPpbY1dUw/wRRkyIHjP7IGqmhKpiCs+he04bcuoEOD0sdLWws24+0bNYR8Igmo/NiYjOUi
	2wRQV7xePCRoDTeB6FJ59pv5eGuSZY2UfjCUgeMaoiKbHhPaZ+pFjw78TfVaurGbjqLeCuSER+C
	evDM+w77QIMJwxahfhpiwRp3c0kdWal04U30pl8sNNbcNkLpOKlOQQskkCuByilDwALp+Mab8Yp
	PBt5NkGbrsJq2mQVD5+g3Z2HA5C0z
X-Received: by 2002:a05:6808:1250:b0:4c4:73ca:3edd with SMTP id 5614622812f47-4c7b34d61cbmr601364b6e.12.1789369272757;
        Mon, 14 Sep 2026 00:01:12 -0700 (PDT)
X-Received: by 2002:a05:6808:1250:b0:4c4:73ca:3edd with SMTP id 5614622812f47-4c7b34d61cbmr601325b6e.12.1789369272253;
        Mon, 14 Sep 2026 00:01:12 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm25962177eec.24.2026.09.14.00.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:01:11 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:29:49 +0530
Subject: [PATCH 17/31] arm64: dts: qcom: sm8550: Add domain idle state
 names
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-b4-idle-state-name-v1-17-660c31187819@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789369181; l=2240;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=f9LwNRyT49v6v1jUVlZUMNJZ/T3+edf3GKYv/LCKBX4=;
 b=CVytst/B1Yxrdj7zlSai6X4LQfzbSrdyvnkgA+OyF50znHxZFjLlZm9P4a6QmZtexF/ECgXCB
 8CNzHpcSe7jBts0ERR7nH8HKB0FhJRK2jS/fnSSyyuH86/r3tdSiwXN
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-ORIG-GUID: FGsF1AQkz4ZkwIsnlocumyHv1dcSt3lc
X-Proofpoint-GUID: FGsF1AQkz4ZkwIsnlocumyHv1dcSt3lc
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa79bb9 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=jBt9j5u6eBwbyPT3BWQA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX3CkG5zHL1hsC
 uywFPKy0JHYciCdyGFMzwtGG9u0j04FZvr7yNvv3sh8UoMWzS8v6rt7gw17h0fbYWtNWx+5t1Nb
 TF0iKrB9KEMuErrZetxUDN1JI1OAqh3PRwbTTH3gKnl4/V2xR1lyy3+eb1hlaRMRN+Fue+NUIhW
 USO+cuDoyuDsr5ng/PSNK6cjdB8XO13io10z2Hv+0J28YOErP7z0F1IgYV0etwQ/wlv1ojcCT2g
 T4vviyERiK6IXyNBfhrgnMgshhl1IcGL8xwwiRP6H19lS/L5cgVE+t99hqx20OsKYleA5N/2CmN
 gY+3YxPbZwfODgv4Q/qCJzGCN2i6LrnNJ3Q4TiIcgC9HJ8oJD6ppk+2GeGbgMmngjp4jcgl8gKt
 K7QmCxY7tCnSDnprmWZASUzzTCu/NbB6H/5QXrHceJV2hL6UvFS7fwkw+N29gYmdeJEc8owf+T1
 PzoDDk3EsXdySjmK9cQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA5OCBTYWx0ZWRfX4Ix7czAJh0Q0
 08IaX8jU2rJgs7tH1Q2AwU7zuHBIQmXpVVpJIWxIvWfq+jdyYP1Pokbfg/WmozI735Pua0btH+V
 zN3A/kqSfpGVmvYqwqMBnxwpNlvyhxI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140098

Add the idle-state-name property for the domain idle state so low power
modes are described consistently and its name is printed in pmdomain
debugfs.

While at it, update CPU idle state names to match the low power modes
they describe.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 23604436add3..9fd739d1666f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -336,7 +336,7 @@ idle-states {
 
 			little_cpu_sleep_0: cpu-sleep-0-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "silver-rail-power-collapse";
+				idle-state-name = "silver-pll-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <550>;
 				exit-latency-us = <750>;
@@ -346,7 +346,7 @@ little_cpu_sleep_0: cpu-sleep-0-0 {
 
 			big_cpu_sleep_0: cpu-sleep-1-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "gold-rail-power-collapse";
+				idle-state-name = "gold-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <600>;
 				exit-latency-us = <1300>;
@@ -356,7 +356,7 @@ big_cpu_sleep_0: cpu-sleep-1-0 {
 
 			prime_cpu_sleep_0: cpu-sleep-2-0 {
 				compatible = "arm,idle-state";
-				idle-state-name = "goldplus-rail-power-collapse";
+				idle-state-name = "goldplus-pll-rail-pc";
 				arm,psci-suspend-param = <0x40000004>;
 				entry-latency-us = <500>;
 				exit-latency-us = <1350>;
@@ -368,6 +368,7 @@ prime_cpu_sleep_0: cpu-sleep-2-0 {
 		domain-idle-states {
 			cluster_sleep_0: cluster-sleep-0 {
 				compatible = "domain-idle-state";
+				idle-state-name = "l3-pc";
 				arm,psci-suspend-param = <0x41000044>;
 				entry-latency-us = <750>;
 				exit-latency-us = <2350>;
@@ -376,6 +377,7 @@ cluster_sleep_0: cluster-sleep-0 {
 
 			cluster_sleep_1: cluster-sleep-1 {
 				compatible = "domain-idle-state";
+				idle-state-name = "llcc-off";
 				arm,psci-suspend-param = <0x4100c344>;
 				entry-latency-us = <2800>;
 				exit-latency-us = <4400>;

-- 
2.43.0

