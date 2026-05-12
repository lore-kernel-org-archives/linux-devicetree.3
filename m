Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067782DA75B
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613762; cv=none; b=DNb249W0O0dVYrFXHgkpWvUynrQrDmjihKS3HjlQlMET2GGbeJDAypp6yxiLjxmfce8G1jke8go84kemyq+dfKRA5fLCDsIrR7zyJCjfjoEbgf+RwrMiQfr3vc6d9PWYBb2UA8yiwoTkK0/IDaregfPlP523yAbncElkzNdx3+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613762; c=relaxed/simple;
	bh=2/wYzISHp6nF2rbU3isTdIQN5SfLqPLFS9JhWJyo+sQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eXOE+ASPOdruE6Xvo0HDlCuSRDoqKQf9275xi2EREiirq+JXsT5uBK2rDapQRlGRWuqiRhSQ0/NK3tFKEk7blPg0c+Ykb9ruC/OZu/w2/yrKQffdAihUJXxV+hSQHK0WCgHOY3jIXMXOyt2SMxb7GdgA46xCTkLmpFxeqQsa88M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y9qxqQ5O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZYPcWUhO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y9qxqQ5O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZYPcWUhO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CDgG8Y680094
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 19:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=; b=Y9qxqQ5ObT1QEvrX
	1ADyfkvit8bEghKMnqklrPREP+JwFcpIN5YchPuhAMfQKVzniI/UPCBD5hsmddjw
	OtbBY7u1SLhjtLMtVimRv68fvfkbtliW2/qbXumT8MUEDcZXJX7m30dbdjC9V0jc
	M6OtnaLDr9lodG6qQMOLfSo4UXiTAHRS3F/A/squjmVEevcc7R/6T7U1JmRM1Q5y
	/3M0PyrcROos2yQlaNQBV8FgsCGMiku72DVgl1KwyBVZa11xCBrtGUP4HjzWqA+M
	wQP8+/3Y0TnG/xVGDBLUpPB59yfUIImqUMn7e+bSNpZq4AA6uxec2+N7BLU3XbYu
	GKUG9Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e45avhd53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 19:22:39 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2babc42244aso111461165ad.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 12:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778613759; x=1779218559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=;
        b=ZYPcWUhO5F8jwy7oPC0EoMaKBfzs5Em2tGfcXqceQDMO4XeQet/z/4oY0LuhBgV62J
         5YRIJTIHH+KERRHruwA10QyAhE2jUCxcK8prcdEbgKBYH0Act0eAKmDHMQPg21vQSsRx
         AzZZQVCgAh65GyoyUDhOFpyVgBRr37oPL/pNGoglYlKRT7xhACKUB6o5AUyHfYfmCuwC
         ubO+MfsVyEv9N/wcmQUkQQKMoghVkwb0G4nMetBZpDERqtc6bNTh2MBk0fGl4eMNXgLg
         PErgpQLjIYxhTqJvXpxTGTR1KC8vd2tGs6Oott6GXumSI5OhsQvSoka+b1dkKIKJ+i+N
         fenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778613759; x=1779218559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DoITA8fvLNtJOW1hfjo3Z8UjqO3tTvhZNsT60HL4KYU=;
        b=lQLjAXzmFXQDVyWwT5Ij449gGkD4Hxp5M4fBo5AmgXoRkaZGtCrSW40rZymNLa0jtu
         NG0xPuKfFDEGP0OyO2NgArr1mvdFeczz955fCWEobpvjUGwfCTyzN3recNkQWm+GSRf1
         TJ+KhAoMA57glSDvWUvypK+BOdLzmW2ip2qXlNM/3i5Mfl1NDUhjor3r9kI3yicNaqob
         I35WHIGQdPX8GpXOBcjnHsGmEVAOjZ+FSsPbvUzcurg3dDRhhG3sw/c8d/Smt7iJ8gGc
         hhfxiv7LOWXdysZ6/VNYgvxc5qffolituwJCpsB0D4RIcgFoYiNnzB1l+OpMMzJJKdYl
         WbAA==
X-Forwarded-Encrypted: i=1; AFNElJ9nwc4G2XfzkhBhoR8gZXQ3vNIXuhFsxmZFgTOBjRj8qOoQaKIEhObzKgHS0CTGwzzrELjpKMkHlq5f@vger.kernel.org
X-Gm-Message-State: AOJu0YxT2dOw8D7YM7LtrDOlPIhR/mjoGeMgLfTxgdSwHlR8Rl6RPNJf
	+bsx4IEctGtqjZvNrgEBc340HWw5O2xbyr4kwcmnXtuxfTsuotK3meuogvw02O914rZQwln/VNT
	O1lLXoKBYtQgRVhLetdDqXba/toYpfYL5zWOLAPfk3nPy/W+FvjS4nDoaWYn2sd84
X-Gm-Gg: Acq92OFQ2WEEwig+TMCaIoBfD6M7seSsNXGLpA0m2RqQIuk6q+LSdfb3MdCsCggei7T
	uHb/Tevg1dMe8OdXaDJKxegfyCioTyv3s3s/408FDItlTa7XFMy67JLyHrAEPkYv0X+6N7ZZ8Rt
	GFhPoOVweFwQ+VGLbKxSnf7JhR5kKuvDU7RAJWqWUMMlf+ntuEOd4rcfPmSW5CJPpsJf2cvwVLn
	qrXh97MDbmwYdp05xyOrzT43OMvNoncOjcFrUMncQE0mazp3RtbNtvJd30qxz8BLVbCFSeiXyEK
	r/j5S+bHuQVx/ttbPou+pIc/qZkTpQ/0ey2sl0ozla6PeftNP90aUmQ1/si5CCYawDQ6RIzsTB7
	kdzD5J5KW44lPagutULumw9OSgPfz1MOq435HE+N13+8LOg==
X-Received: by 2002:a17:902:7204:b0:2bc:f2ae:e122 with SMTP id d9443c01a7336-2bd271436f6mr2874965ad.2.1778613758688;
        Tue, 12 May 2026 12:22:38 -0700 (PDT)
X-Received: by 2002:a17:902:7204:b0:2bc:f2ae:e122 with SMTP id d9443c01a7336-2bd271436f6mr2874745ad.2.1778613758019;
        Tue, 12 May 2026 12:22:38 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1ead90asm141250585ad.72.2026.05.12.12.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:22:37 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 13 May 2026 00:51:23 +0530
Subject: [PATCH v4 6/6] arm64: dts: qcom: glymur: Add GPU cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260513-glymur-gpu-dt-v4-6-f83832c3bc9a@oss.qualcomm.com>
References: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
In-Reply-To: <20260513-glymur-gpu-dt-v4-0-f83832c3bc9a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778613699; l=9184;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=xn0Sr46RzO9QMjWQmKHE7i+3Gf4gRPK3q5UWU+NK1fk=;
 b=Rcg6Sd7G8lX5oJFspeQSrddQLpE3V44pqgLvpli7sW9PfZg0qfLjTk+ORChULDQ/owekcZKq4
 lSv0DV3gYY4D9GVFYDYm7H1JumayCKwQ7uaOL3PWiZb6fdyaTDucYnQ
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 3q13ov32gx533-uXQUN3QKSv0lnLTjtw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIwMCBTYWx0ZWRfX6rm5Oj6Jt2mW
 z0Ml3BN1wtKI0y49SzyDM0pPVmxvM8zLp2zHVc06hjXE3Dg1975wal+DXG5YeVMTbuCGEdHIdzE
 3boU7bK+IY61ulkihSfTodu2XWTwM9gefUdPI83OmDQc78mY5wKWu1waPwVZmzLfxlViA6AamgT
 jDwIMUjVINFvejtQ71AbP0F1qfK1yLre5TMQKDIaAtwQEX6Fm9rsFToZND2/G1unzsWtjULvH5f
 TSXJ05uo4qV+EGjX5UUGw57iJaCCgtc1Z6UHNKFTfrt9v5vmVd/qiPTWwITjhTrzKXUr4KKX+sL
 O+yMQw/WGFDSi0f67HhaBG38rxncexvIZVrr3LOJbPOJKS6Kx85n4UrTTDu06nYt72qHpFOAloq
 1/VtndMZ5Mvb3M/CS/u2DM2pn68ZJJRg8o8lOV+o2NhVo2Kgy5oCi28Wg2Q5H8g+mM7bTFq9xwy
 dhlSe30MRySowvEmSFQ==
X-Authority-Analysis: v=2.4 cv=bOwm5v+Z c=1 sm=1 tr=0 ts=6a037dff cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=1xJfQSZ986TJDthxghQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 3q13ov32gx533-uXQUN3QKSv0lnLTjtw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120200

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

