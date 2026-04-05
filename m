Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EA61A6805
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399655; cv=none; b=pssK0LSHfEQ7dok/3WwYTK+bjz/QoeQRY8iOeZy2xU9fhjroKf/V7RVSjIykRlc3OCu2QhfQVKjXZTJfi0PhmF9vZNdPSHxfJfItPK22/ckd/3rOA1eCvjYq2fq8/HDuR0oC8mds7iKNE6r+9POV4zsGg3n7lwHKUYPR455TVR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399655; c=relaxed/simple;
	bh=T6igVgCi17Y30yaXK03+ftYDUSOYqPbFkDI3RkUHhzc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DaFPWC+4YzHtwZuHnwPoUSurkOH161LueQ54YMKO9StwWdCGnugGGyNRXMMwd+CjFr8P8ocFsfbfJounnH1giDtsy2x85wgrNXSbPHszAo9Mgxvqb9MoePyfw7crE4DXd6OIprTrnNAnDNcqfivVAHBI3YvzRQ31bPnCceY2o20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+RyREqT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hyCau1Br; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+RyREqT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hyCau1Br"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6353o2kF1015085
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 14:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEgiRRNXVBNBCFK41iccbVB+NEAUjWWt1W4xiJ6K27c=; b=o+RyREqTDr2HCPa6
	e3vUYlyXBeZPxh9bR6fTb6GF3/cMw5NSSYzz43PChpV00l2M+HyT+n7o5lnBfb9J
	1dJkB6l5/teNpKtS2DI5CsAl7I7J57ceCPi44MCQbauPQZrATTpF1qUDRbDk9MpB
	X2wAA/4IcqA9Md7JhykuvGEBZY7W0cUAuxqmm8eX8XZ3F2cVWXFnfMRywPOybVS7
	ZSk7s1AHlH4w/5Zcby6DoPD3PUcZXJhR1RTT7MMh7VdPCc1HfvtnjwPPq1qn2lvg
	R5jbDRhaGmxKwRY/gQbHXOqQ3aZAZ0sLNgwArggjDHDF+LnljRg28uo69WizfY04
	kshuAg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dat7uany1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 14:34:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d831e8083so17879551cf.3
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 07:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399652; x=1776004452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mEgiRRNXVBNBCFK41iccbVB+NEAUjWWt1W4xiJ6K27c=;
        b=hyCau1BrnW9hywLBpi6lNPNDqHoZtd1Dn3UXzQYi8SBIBQdSsLFvq32IoVsxHdHywZ
         cpTbiMZ1oD7JpTZtlAsA12JHgvJlyc2R0AkBXEPf0+mDI7Wyvc700vj8hsimvSqB1m5g
         5XhVn42eUAW4el/Mc+SQYyfEP/c+iQ8OtGF6HUQqgi+EcuuF8jlRrzZZjJ7dJ1Ojqowm
         I5rxunf0h5bTSPjTSl60UQzx+ih+TCmTLGGvqPFlPWiJO+Mak5HyCn5zaPIoGce68xJH
         d0043A4dyZ/IJLojanHc+mknikiVqr6/2e80Ve3AyFWjl7pJuQZemkfKnaabcNqd9sjB
         dl2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399652; x=1776004452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mEgiRRNXVBNBCFK41iccbVB+NEAUjWWt1W4xiJ6K27c=;
        b=sK+iOnkX06eqUn6fJWL1AapVu3+6Y3ORPjb1sNpzCqTlNkmkMSkUhfvcF6ufXqVM0l
         tiUjbefpCE+qA+o1wOUcBjWMIQ2l9Xrlkjg4BL7aI2U0rhFBUNGgV/JJM+APGDPppXam
         FHrxWd77qMYUujNOkBWwSFz0zhLF4BXwzUtOZNjWNrsiDIRwYuz9FqQJwIc+CPsX1f6L
         x6BuMs5WYDnbvg0KmwpFzO/PA2bBRRwfy6saH+TkpciLDuvw5M3OFM+eXxWfS/3tEYYu
         8iEErenYJvEanV4WwzanwG5dXoxbNKn6dcOzgO0cj64r5FWdhUgbB37Y2Jf5DICSL7rG
         11WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWeW+vp3Q1WZp1vljqc+Zorz8pNjbJM6S7tQ9L0TSd2xTzN0l8aCndRgX+0bC3qvM/aX9DklUn3r5Ra@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6iAKwpmI2ky/hx/ak+USOONDcGS+A3pRdpcxRxMot56MXqOT3
	jysEZDOa/hMiV6l7tpXkbxWH6VKR8vQWh+/fa1wQyVCBG/Qz7DKt5CgYekumgbJOnT9YWvcCg6Q
	L/s4c92oKcYNFdQZOr7fPEoO4jmFt4hMW2Y3KNDE8LaD9zhNXBqliz35YHQE8vGCW
X-Gm-Gg: AeBDiesPLTTIg6lkM3TGVp5Af6I4WoeYVPlmD2p8U76a2Gd1EAJDey0/+nZK2XM/fxA
	bhb5ERx9lhU8MXyk43+Q+IyueV0uZpFRfR9me3IJyYixjFGOqNgJxfDT9XaNDXzlToL3k5PDWur
	6V8MacxBhzQEpx3dTZbY5WR2ZVTqWTLXHSRbu+MeLCAV51bCmI6CHG5BErCQrnxG9WP6tRKM+W2
	GfjNDCybmtAp/d3Y6ZvOZKPl12x6pknGs0DJEHdV9ZAk77NdglhoR1X/i5339AxAMpX44B3BEi8
	33lQjxlodscunCxeHSbK9Oj5eVNOcjCv9Ay65YhAqVhM+Fo57YzndIZcazQg1rNkENfE2KLJ1dj
	Kvt9BqJijCe6VZwa7UkZuvlMiICkmWKcBKUxVzvULYoo+
X-Received: by 2002:a05:622a:228d:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-50d62e5409fmr153503931cf.59.1775399651857;
        Sun, 05 Apr 2026 07:34:11 -0700 (PDT)
X-Received: by 2002:a05:622a:228d:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-50d62e5409fmr153503441cf.59.1775399651463;
        Sun, 05 Apr 2026 07:34:11 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:33:57 +0200
Subject: [PATCH v2 1/8] dt-bindings: display/msm: dp-controller: Correct
 SM8650 IO range
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-1-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1518;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T6igVgCi17Y30yaXK03+ftYDUSOYqPbFkDI3RkUHhzc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLXg4arhCnf29Y/cl21C0sPWg82UckPf01be
 pfCjsB15e+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy1wAKCRDBN2bmhouD
 1xWFD/wJ9pCf5rqy3LgjmpkHPUsWmp9STdD6vWbwMf+kFVr9j/cYa47bH1dRMwF3/7jLK7X42/3
 /1U19KcW6V+c1hE/J5N8jdg1EW9r1x0sxN1XLwTt0D14i/qlQz3NWmGNfmhQZtANpLWlVnQzonv
 NkJeavpkAjPKxVOy21CB6wGY+CeecjLbNvBf6BWjeW7IowxZfmOEX9ZPWrYbY5DiOy+BccHzsdw
 nvE8dAKv9Sa+1POXq8q9rzy5L8evgPWyJMw/yraOBbR6kBOXtON5CU4uR/ZtmsWaYj5L/883ISU
 +PwFvdXWs9Kkm6np1Ky7Bf/5ZfzTKOuV8zZfqVLuq9DR+Uq8j/c40v4GAtZyW9phQdl/Vn0terH
 AbiDWATZ3fMboTDV78QeTSc1TDOli44NT/o8zKFL0sugCGHIZs9hDC+OSgqgNDv3HUzYn40Aw7f
 b7KGJsdOnriuaWpTqS9JTkJ1iS2MOxAYgypC6MRfXxwhwRkEJ6JvDoO7vqCi3Lxf7/ujGbkkCOi
 SjDRAiX6Cd4NgHVUnnMY6qZxbnyOxEpKdBB9QY1yzXo7Cd0zb1NG09xC4WiZ0CufuoPs15ZJj2w
 K0FNuf8P4b+KfqjMZVOah80G29PrnRPIGM2BHB1fyD7DJmeLagIv7w/1XUVHr+xxHXpxPBIx1wl
 c3qY/B3pZnTXU+w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfXzSxG5Is7EKUb
 rLnfDZ+pH/62mR8Tv95AhLWKIVkNdqCvQRFtsZj4wNgVFf3s55SkD+Dw90OmRRSN78SIB8E20nq
 HkI/4qZCpBoEi+yE7VgMBIE/F0b/xaDC7XzZQzNtf39HhgpTsaMK6eoQwueSkiQSdNE5hDoF7GH
 zALGtLMuDb/glnGdKayEEOGa5u8mbR10RMEL+TkM9laXZfBc5Q9Av3Es10nlJ5KewG36jhQn+bU
 +9+H6tjLc+86spy5VKsg6BnX3yuX8F7gN7LYlrSIOflZ3J/8NPUODsxO/8yCp1Doeya2cx7Gkfp
 Icr1DqVGvrTdU2NyDjZpX/3rTu6qYeDd/UXtqKsA1URJXc3cp3s9Q5zSmJA7kqwbxHnJ+BzPAWR
 XryyXqkgV805YzG8xbx4fALLrzFZqW657WFO/JZxm4HONiYecHPNJ5lOGfRtlOts4l58W4RBLOu
 TtWiO+SRORIkNVpi6xw==
X-Proofpoint-GUID: jnAFZSPtTc9r1HHlkZxXK4-Mc-LQDrbc
X-Authority-Analysis: v=2.4 cv=RJ2+3oi+ c=1 sm=1 tr=0 ts=69d272e4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=LQzgrBLVQjxtG0neiToA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jnAFZSPtTc9r1HHlkZxXK4-Mc-LQDrbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604050151

DP on Qualcomm SM8650 come with nine address ranges, so describe the
remaining ones as optional to keep ABI backwards compatible.  Driver
also does not need them to operate correctly.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/msm/dp-controller.yaml           | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 8239adb7f7d3..e4f17d29343b 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -277,7 +277,6 @@ allOf:
               - qcom,sc8180x-dp
               - qcom,sdm845-dp
               - qcom,sm8350-dp
-              - qcom,sm8650-dp
     then:
       properties:
         reg:
@@ -290,6 +289,24 @@ allOf:
           minItems: 6
           maxItems: 6
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8650-dp
+    then:
+      properties:
+        reg:
+          minItems: 5
+          maxItems: 9
+        clocks:
+          minItems: 6
+          maxItems: 6
+        clocks-names:
+          minItems: 6
+          maxItems: 6
+
   - if:
       properties:
         compatible:

-- 
2.51.0

