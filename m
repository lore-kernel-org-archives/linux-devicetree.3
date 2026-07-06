Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517391C5D72
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374088; cv=none; b=uGOf/qBvtobgYV+JG28q1RHj/A1tg1gHr6Sul0MpSlTwCsJvOf5o8bmV/lGY9C/akglR2mi02lRImRS2c+SRExIJKXAOQUqsgh4ncjXue5Wy3XE+UcaMB4bEM9ajdujLLZzwADvif09lexgff6nnMg6dSHRSkWkCe7DCjtHscQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374088; c=relaxed/simple;
	bh=SVqkbnuVkvWM2bjS/owUid2P0T2KJfUcSYVpq7Ga13Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jhhbnZPJoWjFsT05Al1I7abbR7bQTNejgdnsFRNFJ12+O0DoeGDbaBVivqrGNm5X+moo1b5XxTAR6An1+gAX+L0AQEc1xidJKdZiF/cWaXfi1OsfxaGeqFtuiWqEsawiT9DjHlx9gPxkdrOU90Fezx349FtmaoiP+oHXBkoB5WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpDozFu2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zq/hzRF1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpDozFu2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zq/hzRF1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KF1eN1656373
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:41:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QS7BNKTCaR/fMQBlOz5LdyW+kfRopbgNR+7ZmGi8md0=; b=XpDozFu2LWxD0NRF
	QZAwx0qOAUTH6lndolSEVkfRt/n595rpztqrLrOuI6nsRg9//N6De1vFyrM1T4LO
	b7WRRmMzebi0hZmRsyHdfoMHK7W56FgClPjLXDyPlbP9V+LgptESY5iJgxJs3XeM
	smV2LG49t4ZteKBBOiNOrOuI/7Nl93I7ME/lJ7kk7rPdbdUow0DbkLUAY1O5ATxy
	wasw3XWaXBKMA3YBuvzd1B0EfKPhp6ptaBAagivk9zdlk4IvszFVLB4Kmu6RWybd
	Lx4VnLep/XuW+/3PYc3y1MPFtjD0vkg+sU6XzQE/eLa1kaM617t8pQF6joPn71Hn
	Jfx3bQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpk3an-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:41:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847e78d656bso6742871b3a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374085; x=1783978885; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QS7BNKTCaR/fMQBlOz5LdyW+kfRopbgNR+7ZmGi8md0=;
        b=Zq/hzRF1oK8JNj0/SiqY8XqjPx/36ftECEI3F9guty0nL8/PfzXalEqk/Vvq5XgADc
         j5LV6bFNwy+WWyibQdFaYDcOAyE80oXrA2enR0mFndPBAkAXaSb0Vn1PfnEVD9JZY44w
         7GZTneBJB76uc3DiKxYHfTJlME71R56bFZMVTYPqewvj9Zl+4Mpuvmx0N8RnUmz0lZ5a
         AlReMbAoluM9enqF73wB+MB26Psg9K+HyWs3AldDGId8fMRNTvBFnf+8kE5Khwlvr2hG
         mFcag4Cs/W2fQ970Fw5KeTv+l9yF/Og7L07DHlesmL1SOBiGIhBlUHewcGEc95dJXqea
         EJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374085; x=1783978885;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QS7BNKTCaR/fMQBlOz5LdyW+kfRopbgNR+7ZmGi8md0=;
        b=PfJPrHQ380cGJueQ7hlRr/P/F+HZmXM+//VZuGyZM618ezx+lJyvqI64wOe46CPpzl
         EQcPbi6z6P0P07mURkU5KF1ynn0FPb9D0h179e1ukBsAPNIWMjQMXStEZCqzksi3awOC
         ICOU40wLFilHdDIdX96L8vtj8Q1HuC7oyg7E1adI4kv0cdm+hsm2giYsR68kjzVK7SG9
         CZlZyJz204O0m6bSL66EoHVZarT01tPkJsLUq6gt795yIypjx60UK4LWIdDaolo89F99
         69rFAFaU2y3GspRv6v8paM8odKVL8GTtLg2qrsoo6x+L+1pLeIim5RjDN7NiyUcLbCmQ
         wUUg==
X-Forwarded-Encrypted: i=1; AHgh+RpFlW4G8MoWVloo/HRoNkwa1N0B31YuB+vrHEjQ/eIF82V6faJAcPJZLJDLrZ3GbvcT4L01b/tNtkSm@vger.kernel.org
X-Gm-Message-State: AOJu0YzOe6WGRapRHOf1qUobHeCC9TQdl9V5nQNSiq0vykm32Gsrf1cp
	5zrdtI7QyuoObk9BU8ialnKuFUJVF9hXdC7ctcgpqnJHJkKJv2xQ4eyZAOuAGEGKhe7gsQVnF7y
	seoB9+Rz3nxV8/bHnSQewwl/KvOY0rpXKo2tbLBhJBWli4QOxpFwnKf8Dtw/TrKtr
X-Gm-Gg: AfdE7cmbQymS3FaLyKdTxx643I1VrBoWOVKKUVWZscHM+RbwId0RrmADC4S8AhS958l
	A88DXwqPeEsWAy5QvQ0b1qXPEv0n0hPxfPUMxMxk+Qesfp5a5FZeDRiqowk+I/uH0Hpj9LzStUL
	ciXXJTcl4gKy4K+egPjeUJQPFX5LUbrRz+di8OmIEof156hgiB3aoSmI9dvqRDO1oPLPrBtkw5i
	wwI8YE1LkQkSWMX+nsnWfhY+m2RMwUhpuWs0zTdOJ9p/h7BZQV/8HswbtFxaG6cApoDQq8QlKSL
	6CIIS3MlBWPss5kcrv4Ak/HHpqi6S87XrXroMeiEBh2TFsf9UdlaABoMzSQ/0xWmu65DRc9WqJ3
	gimDCBlz2hA2rT8utuUdDDpwNquidCURwqdY=
X-Received: by 2002:a05:6a21:3d84:b0:3bf:aff8:f572 with SMTP id adf61e73a8af0-3c08ee92e86mr2157324637.32.1783374084977;
        Mon, 06 Jul 2026 14:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a21:3d84:b0:3bf:aff8:f572 with SMTP id adf61e73a8af0-3c08ee92e86mr2157288637.32.1783374084451;
        Mon, 06 Jul 2026 14:41:24 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:41:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:23 +0530
Subject: [PATCH v3 5/7] arm64: dts: qcom: kaanapali: Add GPU cooling
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-kaana-gpu-dt-v3-5-8dac9a60dd5c@oss.qualcomm.com>
References: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
In-Reply-To: <20260707-kaana-gpu-dt-v3-0-8dac9a60dd5c@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=7506;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Paj+Uxrzy46nVOxI8FJpxB45y1EA6N7DR+yUmwEsd28=;
 b=/9SEus1VLj49Qfme1/2sFJTqMKJoEjB2c+6dOgkvo1lNSZmEe+k4v216hrME+T4zoLSMe+JWm
 XpEGGms5RCgCKOFHbgu5qiERzejMXQJWm4xUY047q7Ntp9Fzd/QWmBR
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4c2106 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FGf9z4Ax-beoPfFoyYcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: ba78xYvf8_PvlcYd354nB_k13gaVX88U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX05/Vg3DY/wTa
 JTpLdtxjvj9GAucBv+ippYopGfpMcr4HPYb7v5s9hC75pibZcMXOVcTw2Qsw0qfJ8zGxj0KCGkL
 lE/9Zlhz74PDVYOalu6Ozz7Owigae36GjrhMNoDhjWVH44dIvkApruC7Fd83h1oYkIYaDxwG6bg
 3IHNG8tpRKAwj0V7NfcX1seOzGFzQs7IhbgYMQyPel1QW+PlWU+8zkgCgspmQ/Bi3UJT8i+3nAK
 V5qsh/7koPT+hCdOP0KpTirqoxuRuz2lJVlvYBYqmuIdItMk+JCQVJ6bSAetQi0bZ+hG3XUWTfS
 MYnCH/FrQg4BRSNXR8I5o0WfdEw7rIWvm2ktiRNbJy418B3DjE4tBPkzjZEKIk7djI5AEo0ynHG
 CXGTk9ocujQn8U1lWDx2KmMWzFOVqiQzZOfJP7WGZsOiniOKtzs27ea5tKvv8i+znuuZEjIxp+5
 jg0YH9f154fkA4+7xHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX/V73W2DXyfBR
 fcHXT2XhUeo9uHQQ2jAKHh9iaK2Nv4bl2eMOG2qbOqGpq3sUbK8IApiIzCKairL16BcyqVI+YvW
 SLtRyzxdcINfPXYbl+GVr2VS5I9eRBU=
X-Proofpoint-GUID: ba78xYvf8_PvlcYd354nB_k13gaVX88U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060218

From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

Unlike the CPU, the GPU does not throttle its speed automatically when
it reaches high temperatures. Set up GPU cooling by throttling the GPU
speed when reaching 105°C.

Introduce a passive polling delay to ensure more than one "passive"
thermal point is considered when throttling the GPU thermal zones.

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 166 ++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index cce2e0a3f971..79bf32a9df83 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -26,6 +26,7 @@
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "kaanapali-ipcc.h"
 
@@ -7056,9 +7057,17 @@ nsphmx-3-critical {
 		};
 
 		gpuss-0-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 0>;
 
 			trips {
+				gpuss_0_alert0: gpuss-0-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-0-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7071,12 +7080,27 @@ gpuss-0-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_0_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-1-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 1>;
 
 			trips {
+				gpuss_1_alert0: gpuss-1-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-1-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7089,12 +7113,27 @@ gpuss-1-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_1_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-2-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 2>;
 
 			trips {
+				gpuss_2_alert0: gpuss-2-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-2-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7107,12 +7146,27 @@ gpuss-2-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_2_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-3-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 3>;
 
 			trips {
+				gpuss_3_alert0: gpuss-3-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-3-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7125,12 +7179,27 @@ gpuss-3-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_3_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-4-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 4>;
 
 			trips {
+				gpuss_4_alert0: gpuss-4-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-4-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7143,12 +7212,27 @@ gpuss-4-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_4_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-5-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 5>;
 
 			trips {
+				gpuss_5_alert0: gpuss-5-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-5-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7161,12 +7245,27 @@ gpuss-5-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_5_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-6-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 6>;
 
 			trips {
+				gpuss_6_alert0: gpuss-6-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-6-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7179,12 +7278,27 @@ gpuss-6-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_6_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-7-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 7>;
 
 			trips {
+				gpuss_7_alert0: gpuss-7-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-7-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7197,12 +7311,27 @@ gpuss-7-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_7_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-8-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 8>;
 
 			trips {
+				gpuss_8_alert0: gpuss-8-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-8-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7215,12 +7344,27 @@ gpuss-8-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_8_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-9-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 9>;
 
 			trips {
+				gpuss_9_alert0: gpuss-9-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-9-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7233,12 +7377,27 @@ gpuss-9-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_9_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		gpuss-10-thermal {
+			polling-delay-passive = <10>;
+
 			thermal-sensors = <&tsens5 10>;
 
 			trips {
+				gpuss_10_alert0: gpuss-10-alert0 {
+					temperature = <105000>;
+					hysteresis = <5000>;
+					type = "passive";
+				};
+
 				gpuss-10-hot {
 					temperature = <120000>;
 					hysteresis = <5000>;
@@ -7251,6 +7410,13 @@ gpuss-10-critical {
 					type = "critical";
 				};
 			};
+
+			cooling-maps {
+				map0 {
+					trip = <&gpuss_10_alert0>;
+					cooling-device = <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
 		};
 
 		ddr-thermal {

-- 
2.54.0

