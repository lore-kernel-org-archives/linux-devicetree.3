Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7940A346AE8
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 21:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775336651; cv=none; b=Gt8wxwZ3+kr5H7zP07lStAc6+Mmi7HrDXHsY7WxXKqTs452g54g4JUe13+GT2VpzxygYubN8SevRD2/SFlYq4Li5tyT7vt6b/cJze5B9b2MK/I8il/im8wcwaovjN/xGsWv1sXc5sk7vSVkzra+KoD8u0ovjdHIU427wrt4Th5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775336651; c=relaxed/simple;
	bh=RBr1XjsDT5Kr6QGcEhhynZK4g4iPCpIcVew7cJKrqCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GBLsldIG52DExUeCMFr0NwcKsRqI+EkDxMJrwcw3FSNyF+ZVpQK1GDce0cQ+JzeUOein9TUq29GFmzFL9BnBvAx6jQAwPWhZ54DBWTRQW8RnTUwe5TQIpDEyt7TCicjIeU9aYFP2arlnabr8HrXMX5+vuPxCffCHILsQNPbUmEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aBXpU1OF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kqJoeQzJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aBXpU1OF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kqJoeQzJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634JwJ1Q2751606
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 21:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xZYOVY8Bj2xAAp+/yXmI9Yv3a3R9C9Cg1LE3mTzMmTk=; b=aBXpU1OF/QzBWq8/
	8rgwgjGhA890/YP7rWUin/bLtWa0O26RFJ6BHkHS6RO30sJ8ttbxrmwhq4TOQ334
	y8GuRhpGK8jl8NwO1GZ865yHFjfddjLixlPpjzC1elHUAwxCFSNDPMytwLbKiKxz
	UUxHSqKDnJh0LhLpEoB/2BTaj0UMojXPJolMhRfmt9+HKy020bxxso0NMbuVdWyR
	YX+PJeW/dkSQOsxyQAz792ZNcBxgxOTFspgQuC5PI8Z/TEJKDVK97riUE7lUzAbo
	ZC+ihhraC5l/GFXP13SfBJoCM4EmnsydeEoW4P/GwM7eu/hW7uhKkDN8I8oZQPop
	embdGw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux89cyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 21:04:05 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c12a3bbb9so2949120a91.3
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 14:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775336645; x=1775941445; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xZYOVY8Bj2xAAp+/yXmI9Yv3a3R9C9Cg1LE3mTzMmTk=;
        b=kqJoeQzJdevmdH8k740/uh11n8uQMuDV6B05TQcd31QXA3wP7G0iSOMLbvmuhjOM+z
         eEcjCruUC/9J4cUN7ZXgZClohAaMDljQ3pkmP0jGfuX/sRi5aLwpyNnk5wgyHOf5A1eB
         E/d837nSFdtfXsEVdjQHlyeREMBxidUhCW0uGM5FV2N4KRDkgDpzgP0EGaS2Cyq3CO8f
         y9I34FnL91NXMXWLu/qlAdRWQ0DjS4pWJorrmS/Ure64hJVtyw2OGoOsN/FQc7TCpw72
         UDpI+3KOu6YBr5Kr1JISQG5TnZfKq4jcFdh/+UVTKsSjR4ij1sqlgGYJRc/6kQuAtRke
         npHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775336645; x=1775941445;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xZYOVY8Bj2xAAp+/yXmI9Yv3a3R9C9Cg1LE3mTzMmTk=;
        b=lxWGXTv7IJ0xjtZXciVGxk+LE7IHZ5THBW7JNHuTMCtDHs3U0IZsOnC39sBP73kloD
         ADAkhGN7+myhWTnIZr647w1116vdbFW57fMNL7zw1iT5dRhHitDPy8yWIZwzaVOw6LvM
         pLv0XbT1hoIjXUm6PGVqxO+LKvWR/RI58dc/M0CW2dAsgVmlEBrb7yg0wFOv3FsqGqZA
         sx96S+uJQk/PdNy3l9vygrVHiJkXb3egSzg/XqoWZQ8VCu76QCUvXAwbkxDh7p8K6+7g
         y9mm4xdBYYe6dduOFr1qRVT8BZsyu40tAzt/w9oyJ3HmAHNB6TWm0Yjnjcjovg9kx7Ff
         mfRw==
X-Forwarded-Encrypted: i=1; AJvYcCWuAkvIzbmGiDMhFhY1rLWI2YsUyUMxc3lujY7pnCIh+fsJYCBk22S6qDW4ZILmTvXVSmT3k/QgMhcq@vger.kernel.org
X-Gm-Message-State: AOJu0YzEr+bMUaysc3B6xLXG4j2zZsBVA4xdkmIjWSU2Xvq886ym6cFG
	60tileSRVz8ts0MYbHa0YkplvBluic4jE3lN51CLU5ZTxx+i27JLHVF2AZVe0+m+inhCHY3SaVN
	Lqizjx1/TG7wkF7r81NKzqHmv/W1Rhz28yyQigiBho8zfz9mroKyjMvOD6euUhnbv89V9Qv8H
X-Gm-Gg: AeBDiesOd0ZAQiZKExYWC9rc/SxfPMEs54M7JkyDHx2O/a6ghmpT8N2BiCFeCjF4NO0
	4+ffGBIIVbE5QqgIFRfCemCtb+PGSE9eznveSWCJ7m8OSPIGGa2RXQsdOtroYbgSlFb1tlyHhML
	6zse1N18f5ah1XaIQbu2uA13PGCe1tWDSvIVk/ZmXAN+2pFYXMTrJjD9SXG0LeNJdJ6OlU3l+YN
	IxI6i2X8cWCkCQWIeJAzR+BwGBWifBxe82a9V1AhaO60KYgv1wPY9nljEP+rWV7UlGMQVJoq86N
	WfDoZKeY+1hygG0MEaH/ySF56afUuxkSdzoirYgNzdZ4An5z3RfSi8mR21/yG6wnQi63WUHl+y5
	pNkHzu1XOhHiRFILL4b87JVDX0EY/ETDr6WTyNhusKjpztg==
X-Received: by 2002:a17:90b:1dc6:b0:35d:a843:6b1f with SMTP id 98e67ed59e1d1-35de6899ce5mr7001531a91.11.1775336644818;
        Sat, 04 Apr 2026 14:04:04 -0700 (PDT)
X-Received: by 2002:a17:90b:1dc6:b0:35d:a843:6b1f with SMTP id 98e67ed59e1d1-35de6899ce5mr7001496a91.11.1775336644271;
        Sat, 04 Apr 2026 14:04:04 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de677e2dbsm2675545a91.4.2026.04.04.14.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 14:04:03 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 02:33:16 +0530
Subject: [PATCH RFC 3/4] arm64: dts: qcom: Add GPU support for Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-glymur-gpu-dt-v1-3-2135eb11c562@oss.qualcomm.com>
References: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
In-Reply-To: <20260405-glymur-gpu-dt-v1-0-2135eb11c562@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775336618; l=6149;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=RBr1XjsDT5Kr6QGcEhhynZK4g4iPCpIcVew7cJKrqCg=;
 b=vwd51qZFvIb7MednXSSvkr+UUDduQutfBfAo/sQ7TfeZ34CdFZg1cWFzKWn4D1+CkPATty4PY
 Pi68RNF6rnpDkq/GLcPC/lUcNAnGS4RWDQvZ6pW+btZ0u55wZsMof55
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: NBtgvIx1uHu12AmUsYmi4RZ2MwCOgYef
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDIwMCBTYWx0ZWRfX5I28eP1NfMgx
 PTeyh8QzGaFPb1BOv6KnMaIouJNMxyvm3XFE5PtXUJP31dONCplJwiYOMvxikvXtAFatVNZQQuU
 bLkJ9oh9dmM1Cuvh+ciY+oJD9hxWaDqylPbWqm6rlzoSCMI3UAdoLWhNZxWHjXLmewKRTZN0Dg8
 +cj9fIeZt3kbMymhnDM9+31mwi+d7kX5NTo29KFffURCSiwNiF2nOBndn5YD3Adpeyhas9/U53y
 g2YkLQB/i2vacUVn4a0LA7SbKS8zRHONfVNBTIMvIIErUTuDAqadHNYdaIHjWoOwLrCmuv+IPwo
 +XO5MBIue6LpxpanFUY3XxLxUzGqlpGgGHaY6PGH5U2ZR1Qq+CBZJTjDleK2AxnnRWCvW+1tSXD
 Vep+rGQVmw/BvKftydiu3iXVXu/frpRuVrW8zfc7gRhiJA85t+Ehp418o/mNHLLwOz+/HBvoHAM
 /q+QvRUyuOEvGZtcZLw==
X-Proofpoint-GUID: NBtgvIx1uHu12AmUsYmi4RZ2MwCOgYef
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d17cc5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=hGZpaGHu81SVUIw3OUwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040200

The Adreno X2 series GPU present in Glymur SoC belongs to the A8x
family. It is a new HW IP with architectural improvements as well
as different set of hw configs like GMEM, num SPs, Caches sizes etc.

Add the GPU and GMU nodes to describe this hardware.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 194 +++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index a3fe2b12aee0..0174917fe942 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3712,6 +3712,200 @@ gxclkctl: clock-controller@3d64000 {
 			#power-domain-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-44070001", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x40000>,
+			      <0x0 0x03d9e000 0x0 0x2000>,
+			      <0x0 0x03d61000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0 0x0>,
+				 <&adreno_smmu 1 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+
+			interconnects = <&hsc_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				status = "disabled";
+				memory-region = <&gpu_microcode_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-310000000 {
+					opp-hz = /bits/ 64 <310000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <2136719>;
+					opp-supported-hw = <0xf>;
+					/* ACD is disabled */
+				};
+
+				opp-410000000 {
+					opp-hz = /bits/ 64 <410000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074219>;
+					opp-supported-hw = <0xf>;
+					/* ACD is disabled */
+				};
+
+				opp-572000000 {
+					opp-hz = /bits/ 64 <572000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <12449219>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xe02d5ffd>;
+				};
+
+				opp-760000000 {
+					opp-hz = /bits/ 64 <760000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12449219>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xc0285ffd>;
+				};
+
+				opp-820000000 {
+					opp-hz = /bits/ 64 <820000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0xa82e5ffd>;
+				};
+
+				opp-915000000 {
+					opp-hz = /bits/ 64 <915000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-1070000000 {
+					opp-hz = /bits/ 64 <1070000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882b5ffd>;
+				};
+
+				opp-1185000000 {
+					opp-hz = /bits/ 64 <1185000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1350000000 {
+					opp-hz = /bits/ 64 <1350000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0xf>;
+					qcom,opp-acd-level = <0x882a5ffd>;
+				};
+
+				opp-1550000000 {
+					opp-hz = /bits/ 64 <1550000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x7>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+				};
+
+				opp-1700000000 {
+					opp-hz = /bits/ 64 <1700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L4>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x7>;
+					qcom,opp-acd-level = <0x88295ffd>;
+				};
+
+				opp-1850000000 {
+					opp-hz = /bits/ 64 <1850000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L5>;
+					opp-peak-kBps = <18597657>;
+					opp-supported-hw = <0x3>;
+					qcom,opp-acd-level = <0x88285ffd>;
+				};
+			};
+		};
+
+		gmu: gmu@3d6a000 {
+			compatible = "qcom,adreno-gmu-x285.1", "qcom,adreno-gmu";
+
+			reg = <0x0 0x03d37000 0x0 0x68000>;
+			reg-names = "gmu";
+
+			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi",
+					  "gmu";
+
+			clocks = <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
+				 <&gpucc GPU_CC_RSCC_HUB_AON_CLK>;
+			clock-names = "ahb",
+				      "gmu",
+				      "cxo",
+				      "memnoc",
+				      "hub",
+				      "rscc";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gxclkctl GX_CLKCTL_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+
+			iommus = <&adreno_smmu 5 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			status = "disabled";
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-575000000 {
+					opp-hz = /bits/ 64 <575000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-700000000 {
+					opp-hz = /bits/ 64 <700000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+				};
+
+				opp-725000000 {
+					opp-hz = /bits/ 64 <725000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				opp-750000000 {
+					opp-hz = /bits/ 64 <750000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,glymur-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.51.0

