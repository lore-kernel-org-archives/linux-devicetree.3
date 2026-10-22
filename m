Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792662612;
	b=kQpHiYRp5vTqqx8vZwjT33haebH5YIYAE0sVpjRN3+U9WwvstG6mZEKekpgcVWsIJcV8
	 23/FBTCVPkvhAGspnt6z5SiQIfJXJOnetrh1R2NY9M5LZz/SFzZDComLvYcki1HHU4VkU
	 PLJbUUmaAoL9OtDb7BWcmm3vr8jt2RKOgVFQGsxjZTCovzszW0RLsLiLxPT/cokrcrmII
	 K6KIL34PqhYkyHwxbCkQ+Pjbu2mQTc3bbDh0CwUa5919QYV3H/LCthTE+G4KZt/c6n1TW
	 LnGDNRJEDhHtIax6AjRAHzzK0iHbiQunDiQLsPNXP0pjJ1keN83ZUe++fMHmJWM5kaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792662612;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=;
	b=r6/o8kz69oRXUIg1hVi6fHY/atbvtCM4R5bpu5X8V5nsslj1QnOZQopMeyWkfdlG/N/H
	 WsAEypwrdi7Roa+r5uSGhPSrMcHyfEGP6ncu4nZRNHnKWRwAXXGCBUmGsEJwRegxzd/69
	 BeWvPcNlby8KjfKYXRFZy5yeZMQ2S7PSMpKpiqGN2ojl1vUsk2k3zqcB4MSvdUPCkHMht
	 W7//iHTUPDrrAAh9j+FeTy3cPTkNjp+79Sqd6zF+02BJ1hXjls2lSq9ban4v24fkSqzBQ
	 eCx9t0nVcaJevkBBcTxRzBxMdL3pBHmHg5tcUr0Kg0Qt117XQVZgmL/a9OxccT7ZYKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbXPla0A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="KXt/qt+D";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC2E606A320
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC2E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AbXPla0A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KXt/qt+D
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8LnTe3194722
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=; b=AbXPla0AkEHYbGxb
	OtMj/fQ/ZX2XeVwGNsyn4zdC1u5ODfSLmejfHwDj24HV1jeRxjB49jrugb4ckTCl
	rHRtmK3VYImSrD2oN1zxhiZsd9/s6SCvxvtAUh4NU3jvfc29dm5WOql1NSuVj60Q
	VLGdxU6vMwpifPZPK2HCsoTfbB4Z862NrISLeKW+BPRhN3qPkUcIEqot7KT1QMAD
	GGu3GHT9z0c6+3Hi2jX+Tcj9F0jqeXwGminVTrlH+S6aAutNxeUyXg5HMVh8csTo
	/c48n5M9bA833A/8fieLN3X35L0jJl0Bge/X+xpPaxiGonFUNKjn40SfOqJaQMuI
	NfWIpw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfewq0d8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 09:50:10 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3692c5b061bso962657eec.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 02:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792662610; x=1793267410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=;
        b=KXt/qt+DY4mDCY+KZ7KYaXnGAxX1103IjWW2iaUV6/B5mnOS89nxnFpezyO4VxNI7a
         y7RYFfiTJ1y76OwJZ2YOA9gR43Nr6gJBPKlab+DoFQz0uGYSrQ29iTRxwNSZg+9MHble
         LbvQ1D9J71zcyEM7ar7rq6cdtOg5pgGGE+3z9pT4najBHJJdOx7Ecsk6uF06euFgNk6X
         47sKVH19wTnRsiGChxN5xZ5Jv2G8ia18cy9T+8UUVDaIgNPWeXDeQItixrPKE+CRVxvC
         SQc0OOx2eYAMiMNCvIHLeWDrvXmiDCFW1TQRmU31a3Vs3mltuQ+25dgaytGCoK3ung7M
         JR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792662610; x=1793267410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dnWRkXpHDUV/iq5zv2EkNTP0NIBqskKv9yRVf0xDCaw=;
        b=rW/6cbgzzoOlM8K6QE2Yd+XQZkYiJjd3a2bE1BC0ieauzquWgjS1+Ds2myFfNq7DFu
         482EaqGuS5TvzQ8+F4pOwFmTcsKEL+HqdvzAQag/TycT04KivnSndaPXw78lLDF4ECzd
         rc0TZy/JwOe88SV5CCS9V76wLkmk1mxHUwX/L3Ykzaj9Y9fvYLJ2x0BtowWQ56aOJhv1
         skt7bwIsRi7NjyiZC9FgD4fcGq1Od/2/lEC+8ddVVI0I+PyHCAFa4kTfAcMHyob0sZr/
         B+vFf3MKuUUHOk9meVCgSRYqIDDahhDzCVR3pZ/prl9tA0ipAIkkYKVK0cA7gXLlpYKI
         c6QQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7pZ294VL/A8u6rNzJvRpzPf4Kznk9daJzFPA9Y6VfUfcM4QanM9myLM/iahkpF3yfO5XKR14G13DI@vger.kernel.org
X-Gm-Message-State: AFq9FYLDRWTwq0wuFPfu4Gq6pgXT0onaB+091nWkpucbdfEg1XlKhEsI
	Ji8IQzo78XY1GFmoyAj8z0DmQaBS4lXYEUxduQ1GPFMPCpihWNRuAMkV+z/1iIwU13YT9Cb9zH2
	jV/yQN0927bx2+Vk3DvmSYt6agIfkZ+n4YNNQDBImMjjf/s9jwZk2iJD3AwnTEdwm
X-Gm-Gg: AYBFou0qmQZrlS8LhX3hjqWvsHiWuloYFewB+3RDHvErOSOYcwCI9zbA1Bl+wxPMTq2
	bHOJG+VHO0PG1lqMsUVq/4jyDZJuqW09t+yZv5TT+vgj+bwHfzUhD09Ely7+eInDL3UjefnSu58
	2tzqIFH4TS2wCDbrkcotEqSniEAylMyutr1gfi3koUdx6hf7vcudvq6IKhbupLOzQxWsbNz0B8/
	8DJWbV6PkkB4oT8Y5EkagPZIOQ5GveLSTjMrfRUMqihJObx4L04fCKZJovZvy9Ug7lkL6psHhr8
	uycsR2nJPxEDuQA6iL7mNje9G7/pe3OTcoryPNSr9INNNYZH8Lq6/UQQsX0k/qyNngmIiFDk+NQ
	fjhzTANaXZVjRS+vUYggLGsoWKk9eLDG1/4o=
X-Received: by 2002:a05:693c:414b:10b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3674ff008ffmr6968379eec.32.1792662609444;
        Thu, 22 Oct 2026 02:50:09 -0700 (PDT)
X-Received: by 2002:a05:693c:414b:10b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3674ff008ffmr6968325eec.32.1792662608877;
        Thu, 22 Oct 2026 02:50:08 -0700 (PDT)
Received: from hu-bkalkond-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm14418035eec.21.2026.10.22.02.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:50:08 -0700 (PDT)
From: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:19:42 +0530
Subject: [PATCH v3 1/5] dt-bindings: display/msm: dp-controller: Document
 Kaanapali
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-kaanapali_dp-v3-1-b5ae8e6083c3@oss.qualcomm.com>
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792662591; l=1990;
 i=balaji.kalkonda@oss.qualcomm.com; s=20261001; h=from:subject:message-id;
 bh=gFpmXsiRDLU1j4jPsZHAla7qt4QGjHqNVO9ALlnOzsc=;
 b=97hfX5kyCQXb5TRjlzEy6alGk4pMuHZazh7cCYnWQ/zPZQo/65Uck0Tbax8iowk6/bE5tISAl
 rH73MZ9wRI8AWLCySmVAhq8+krivvAC8Zo6YS/NcF9mJmASkt1UH34D
X-Developer-Key: i=balaji.kalkonda@oss.qualcomm.com; a=ed25519;
 pk=U+unGox551qPLS2mzIlN+b5cHksxTMGPnDwePd6KEnI=
X-Proofpoint-GUID: RwsStck-4-xZxUIN3quKEYfZQ6ogTn-i
X-Proofpoint-ORIG-GUID: RwsStck-4-xZxUIN3quKEYfZQ6ogTn-i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfX+Z6ZOATjyg5T
 hw6lM+LIK07RrS6pbE4y7n8IPpraiGpYiro6k0mUl0EXMMM0zBMEq/WxfIpIXpslBRLhqOxqIso
 7jEx/TJ6CAVSW5fUjUuscrfgTLRDJOM=
X-Authority-Analysis: v=2.4 cv=G4OJgNk5 c=1 sm=1 tr=0 ts=6ad9dc52 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=vzAMpc0yBbT7bysrcb0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzOSBTYWx0ZWRfXzAU7TNXSn6z1
 1amRg/pMBP3qJdUu+yVz9b3M4q22KpxFT3yDPEix9yaAHV8y1/qPORGUvGQQwfl1F3xPv//c7gB
 H1rz7+69zYfeNqutVfzdMXuWgecCFAa31Apuxb+vzh3c+G9ore4sBX/cXkiIfrjHgry/tzdXemZ
 7+W2NzfwdHaNf6UR2aAQfRpHbM6BLLI33XJ3eDeY6+41qKzWtB2NLQflx+OU2a9HTmmdAQeC9JN
 N0KZv4ex0NW63sJRC4YuAnAQcj2yWyQkUVIRWOVf5C054WKPwTUH8x21QY3Ypbv45oBltowNX11
 O8Ngdvhr9uv+bFmZnz9DK68B/GdB6eF0mS4KKlLzV0nOshPMTZrucvtzY3jt5pgcJvTljM/aENI
 5toq8hLRIwkFWHJqjfPhlD6mjpwJF7DOK8jsmUaSjtnBHVj0FJWWh+dCpqOorOQcUxV3LRr4wOP
 U4pR4EJGHvh/R9I8Hcg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220039

Document the DisplayPort controller on Qualcomm Kaanapali.

Kaanapali uses its own DP compatible string and has a resource
layout with five register ranges and six clocks. Add SoC-specific
constraints for those resource counts.

Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml   | 2 ++
 .../devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml       | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..63e1b515a355 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp
+          - qcom,kaanapali-dp
           - qcom,sa8775p-dp
           - qcom,sc7180-dp
           - qcom,sc7280-dp
@@ -275,6 +276,7 @@ allOf:
           contains:
             # 2 streams MST
             enum:
+              - qcom,kaanapali-dp
               - qcom,sc8180x-dp
               - qcom,sdm845-dp
               - qcom,sm8350-dp
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
index 9f935defd6b1..b4851d1d48ea 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
@@ -48,6 +48,13 @@ patternProperties:
       compatible:
         const: qcom,kaanapali-dpu
 
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,kaanapali-dp
+
   "^dsi@[0-9a-f]+$":
     type: object
     additionalProperties: true

-- 
2.34.1

