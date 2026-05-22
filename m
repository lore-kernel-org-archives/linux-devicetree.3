Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00CD3C81AA
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444794; cv=none; b=UrAwpwhxIIZfdmR+xb8scTuTOwtIxMu3U4R+OZr2uqfxgb7I38PlW2x+al1C9dngJdAml1SFFGsM4FfVPAZAJ0QCjifTdsN9RYeUKCwuP2sF7ekFJJMoRh3MllkilNXWHqgryB/YYBFEuN7ca40XK0q0MOvnfZtDfboWmOTRTUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444794; c=relaxed/simple;
	bh=2/wYzISHp6nF2rbU3isTdIQN5SfLqPLFS9JhWJyo+sQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aRAIka9gKNWJBiCs4rZE9gdcs+eJkrq3MnUZXxJZK/tcsWHdIg5yFpjId8bnTVcdTqYefDdE3Kt3s8frUV95htg+7I4J3hSf/yLFFEQgUUFWrc+ed0ehz64vedDWeQhTEUpwQVs/R7cp2xSmtdSNUSuaE/wMt1H0i2OeM9uSEv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kSTySAbj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FiBe0c2c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kSTySAbj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FiBe0c2c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8i0Hq3532248
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=; b=kSTySAbjKJJkJTGo
	5cRLUYa1Jn6d9NM7ZIJtT5S3YFCHomikpvVpsTPUz9+/HlYqwFEe7beB20nFdwMY
	53KoN9+x389KZThvcsegYZqlyFAGjxtK/GGIhNkSCsDc/VgiDtOMSe8Dr5CSfk/y
	IKfIWbRUY0ULG0gUASKOdcOEfAySZthTmqoGPQt3z7MMARqCGZ+qe1SkWyTrIBlJ
	cRpgHNyUD2j+BbWnDCxURRNlEQfjpVmgKmZq8iLb5B7btIaDpzvAnAl6wjmnAmFd
	dWkmnmpMVlBuW3c5AAWb1XSOHIr2KCOzAdaL7nbSRuLnvwFI5m5c7dx7aouLcg4o
	L1uCuQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gvjnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:13:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3684cb22502so6817281a91.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444791; x=1780049591; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=;
        b=FiBe0c2cNdX8Mlgiwm4RohKknwhAyp2GTWd1PbUdEwh6iRo/wMhe+XO06Z9/MgOKks
         YHXkRhz7fVTXPrOfMUGZISuY8xUhJbJhQIA40Vp5hyCbmYKJn0JWPwTWO1kUGzU23oJ8
         6A89SVNuD4pA9pVmTuz8HGINHS7kX/oyvjnWoySnq6TSkXo9HHoFJs4zNWqJkNxQun8V
         e83GsxH/2pn3DiF2dKCMyiQTrTU/LHmwHLFsw8Xy9RNPZjAdZF/V6zoilCBVUo1iEs2U
         DyeYImYLAZYNenGOXhUhNcTEzeEcjpDpNvEt5DWh3E2OQdqsdE9jLBUfRU5cvNm2uVOV
         7ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444791; x=1780049591;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=;
        b=jGhPcD6vNloxERnWla+cpv07jqts08pbvl0xb39RmzQb2SLZlX8LMidr1G+0ffVl9+
         tbO5/fieDPwdZGIOcnyp4gnAcpdFwa8j1B9GLPFO7tiIPyzr3YzO5DElFh0XDyraUFAO
         yFBP/UtjIYWKW3T8QWurp7TsPRi1mtAWV7riiYXL6pOLMfIE+668rjsY4iFO43/N4FYr
         hgdGYORWEkpN2V8alG0xFQ92AOImkxQGPZmTkk01HyLn2qbzDX8DJWPQFcSc7Jcnvlf9
         3aZ/v3R1gocRg35bUxTto1DswPsEv1wTaJig22DM23DMWSsh6+PnPoy9j+Bf1/cG+PAK
         AIwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9dwcfP8MBOCmWzkAXXrKJn5/SjB0JcjYDPJn1Ug/KEjJxe3FECukyUtd31lb6lhfGi/lxpAKqd+eKT@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0VgpxDlca+04stnUmuXdDSM3p8J9hym3AosDzhRRJfpQFBwGU
	NhNx5/aJzncyG5+jGmboawtGd73pkIxNHtTIi91vyV0OHM2wOPa0Qnih+4oDArPmjWuKaUfozPv
	M7gJk9vOqEvEUrmlw++1MuaPgsuMYo4mYCCVkPSGiQN19LHwVewiNiBmowxnWUt3N
X-Gm-Gg: Acq92OHsXWLxbxIYtWW6JEC7u7MKb3uMbdvy6BAKzfY3taNt6uiHNNHbDv3oRor8VXC
	Q57vSzrI38UAWi9LrYW9XTwQkELDbHst3pVfk1/4CwIWFtywpgkL+Cm/0nAP5Dh3kMFBc/xXTuN
	chU+Z7h7rkyRbczozF4M8yIv35Mbqtn8bNYJMRstLduUpuALTwKEHN3WW0PaBlKAGtZwq39vqDp
	7YGcPMIpMbeKn8jt7OmZSY5brrgTUehu0kpqde7ebH5jgEFLhCd947Yo6WjF69utmo/YY2xzTyy
	w6HPt/SYnhfTdik4oc6zvaP+ACs5J4pjeVkWoEbLzpRFH53ymQFhwXe2We+ODVU6zj4FcigHsZH
	GLLjtaxOxA7WDNlmoQaaGQPQkk2QngOjCQZCcoc6F9FPqKw==
X-Received: by 2002:a17:90b:4ac4:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36a6741dd7dmr2845258a91.5.1779444791293;
        Fri, 22 May 2026 03:13:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac4:b0:35f:b572:ece9 with SMTP id 98e67ed59e1d1-36a6741dd7dmr2845229a91.5.1779444790742;
        Fri, 22 May 2026 03:13:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:13:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:42:01 +0530
Subject: [PATCH v5 5/5] arm64: dts: qcom: glymur: Add GPU cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260522-glymur-gpu-dt-v5-5-562c406b210c@oss.qualcomm.com>
References: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
In-Reply-To: <20260522-glymur-gpu-dt-v5-0-562c406b210c@oss.qualcomm.com>
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
        Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=9184;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xn0Sr46RzO9QMjWQmKHE7i+3Gf4gRPK3q5UWU+NK1fk=;
 b=H/Uy28Sbk+qNyTEhNSg47YjTr7XYAKdDGhs35tS2R9fsH/5iIt2eB3i7MBqvC99rPJraDxMYO
 Zrt0jXlu1LGCLePzYFBh/1VOdRRLSWVr6yV2sjV20iX//ECmglHMfcM
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a102c38 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1xJfQSZ986TJDthxghQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: kxDlYftu-nbsD0InDku_tmv4F9DCae7J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfX4ApiGdlb/0Bz
 kpTb0Sa6ZtBkGWN/VAx5LL9k8cG85Rb4ymi6lltMNYQXWFQXJka6WVTddFR1vnHTpOvTZXzLgyS
 /fYLTDCnjEdpD4+fitCgGB5GLVnvvbMiviFc6JDxG5rS+g++qqXpzItVE7E4ABACYOTJ0VoEl/v
 rzKnwRTJ78HeXr3SpU6OkRWKloF1ZRbd3hMpe4vsB0TSuh118Fxtp8/KIfJt6J1jvEFyQ4tP5wB
 mh1HNM/NinOL1oS1vWSLQ/kXQLt91y7TdPckz3vQw2T4cbRFrUvHvsRiQU7iIvzXIorC8QbBbhs
 25zyY90k6U/o+AVI2DShwZ2guLHCq+cPL89pS04iLFCDzPcf+d8qw3GTtbIU2RqJBDbTGAZbtFs
 R/5sxZnenrOAMI8DBAvMYAmq0zcG4RaLTth6KS54Ch+ljcn8gWKZTPSQPTeiRKZvVcrpQl+sSAq
 L4w8Ax/ZqrGOxLNX0aQ==
X-Proofpoint-GUID: kxDlYftu-nbsD0InDku_tmv4F9DCae7J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220101

From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

The GPU does not throttle its speed automatically when it
reaches high temperatures. Set up GPU cooling by throttling
the GPU speed when it reaches 95°C.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 240 +++++++++++++++++++++++++++--------
 1 file changed, 184 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 01a2e32e503b..e109fb5b35a4 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -22,6 +22,7 @@
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/spmi/spmi.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "glymur-ipcc.h"
 
@@ -7149,13 +7150,22 @@ aoss-7-critical {
 		};
 
 		thermal_gpu_0_0: gpu-0-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 1>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu00_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu00_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-0-0-critical {
@@ -7164,16 +7174,26 @@ gpu-0-0-critical {
 					type = "critical";
 				};
 			};
+
 		};
 
 		thermal_gpu_0_1: gpu-0-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 2>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu01_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu01_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-0-1-critical {
@@ -7185,13 +7205,22 @@ gpu-0-1-critical {
 		};
 
 		thermal_gpu_0_2: gpu-0-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 3>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu02_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu02_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-0-2-critical {
@@ -7203,13 +7232,22 @@ gpu-0-2-critical {
 		};
 
 		thermal_gpu_1_0: gpu-1-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 4>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu10_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu10_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-1-0-critical {
@@ -7221,13 +7259,22 @@ gpu-1-0-critical {
 		};
 
 		thermal_gpu_1_1: gpu-1-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 5>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu11_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu11_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-1-1-critical {
@@ -7239,13 +7286,22 @@ gpu-1-1-critical {
 		};
 
 		thermal_gpu_1_2: gpu-1-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 6>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu12_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu12_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-1-2-critical {
@@ -7257,13 +7313,22 @@ gpu-1-2-critical {
 		};
 
 		thermal_gpu_2_0: gpu-2-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 7>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu20_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu20_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-2-0-critical {
@@ -7275,13 +7340,22 @@ gpu-2-0-critical {
 		};
 
 		thermal_gpu_2_1: gpu-2-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 8>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu21_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu21_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-2-1-critical {
@@ -7293,13 +7367,22 @@ gpu-2-1-critical {
 		};
 
 		thermal_gpu_2_2: gpu-2-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 9>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu22_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu22_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-2-2-critical {
@@ -7311,13 +7394,22 @@ gpu-2-2-critical {
 		};
 
 		thermal_gpu_3_0: gpu-3-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 10>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu30_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu30_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-3-0-critical {
@@ -7329,13 +7421,22 @@ gpu-3-0-critical {
 		};
 
 		thermal_gpu_3_1: gpu-3-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 11>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu31_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu31_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-3-1-critical {
@@ -7347,13 +7448,22 @@ gpu-3-1-critical {
 		};
 
 		thermal_gpu_3_2: gpu-3-2-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 12>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpu32_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpu32_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpu-3-2-critical {
@@ -7365,13 +7475,22 @@ gpu-3-2-critical {
 		};
 
 		thermal_gpuss_0: gpuss-0-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 13>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpuss0_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpuss-0-critical {
@@ -7383,13 +7502,22 @@ gpuss-0-critical {
 		};
 
 		thermal_gpuss_1: gpuss-1-thermal {
+			polling-delay-passive = <100>;
+
 			thermal-sensors = <&tsens7 14>;
 
+			cooling-maps {
+				map0 {
+					trip = <&gpuss1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <5000>;
-					type = "hot";
+				gpuss1_alert0: trip-point0 {
+					temperature = <95000>;
+					hysteresis = <1000>;
+					type = "passive";
 				};
 
 				gpuss-1-critical {

-- 
2.51.0

