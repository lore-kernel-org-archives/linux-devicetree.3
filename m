Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87E83DD50C
	for <devicetree@vger.kernel.org>; Thu,  2 Apr 2026 11:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130340; cv=none; b=L8srMH4iEaeeEwmsElLkUVgs0lgisbiVJQkHNSpuqI5XgCe0pv2XpeHkUT77HGHMy62vNSg4WhGKgBHHVwVjIteroLDzCRUwh7PLLZq2tKb5JrVE17CIMt10AgjvSe4i4NBJhsa+jUOBGhyKy7+tyHGLSvPLR7tZ1TUeWvMgyIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130340; c=relaxed/simple;
	bh=yFoXFf2bQiJ8Irz9zLQs16efGTfbjry6Zus7oX6VYmk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HJpV26Gs7sBg4yf/j7Y8AYp3kWwGvmBTrOrOiBfymknc4f+nuDjiF9xVTFNF70VgfdjBCJcoDqEY7rwAEJ/w82CCj7q/LO+3YsI7NuEs0FpJp+LSIEK3fSfLzl7LQlCgIiruFcs5mT44GIM0goHuqljTCSNHBemErbdyghgUDms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1/5sBr6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kEpsS+7B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1/5sBr6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kEpsS+7B"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6326mfjG4009524
	for <devicetree@vger.kernel.org>; Thu, 2 Apr 2026 11:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIG2xvgV6IOKPVH2TH1vWUTW9m8rqa2zF9dGwt1d/yA=; b=J1/5sBr6sjQAQF1X
	a74cXMFfGzuJXqIcuemsfPTNjbaEwTExshOiHrevNl+epT++eRB9XzYP2Pd2AzGW
	7uZefAHjQ8VXwOXH+4Lk367UUI1J2XccH4TVoeaDLRlX/7bhczEYqhYKdEfr/g0q
	f2fEdqPVMidG7B+qPBprWzApv6vuJU2g59X3yO49wFLIssDZp6VHjH/ZV8sxm2YV
	Hem+4GxmUHGPd7YdnJo6hmdudA6eH6Vk4S7woTWCk5MZ8Lo57MBq77jIEsaPJnDe
	k3uJHr7rjQx4nmQjlYPmsbWwCO1M7wkecOgMjmoyUZWhAi6PC0qHa35tLa1CtEz4
	3jk/fQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d97e03u1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 11:45:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b781542c1so16009511cf.1
        for <devicetree@vger.kernel.org>; Thu, 02 Apr 2026 04:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130328; x=1775735128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIG2xvgV6IOKPVH2TH1vWUTW9m8rqa2zF9dGwt1d/yA=;
        b=kEpsS+7ByvfqsnLt9gJHeVmUUZ9p96eeWBqnng+pw5w1G4AZdfvIyKLGHHSiT0Fyah
         OsUj2uB1WPIopmGUF9UAejYsA33jUFB4NVna32+cHkOoTtt+RCpwe1up27j85eI7/aU0
         pg6Q1bqd0ADcCC8ZRqjvt05eGpXRK0mEpur/mTDf8C4DHxKBs+kWuNYf4mzKSp50+wKD
         h3cBJVlpCpB4Hw+w3n/lFqnnflezqbytWKP4b66Ip6eL2BsgRrJFWlQ7F+rES8Oi8Xka
         MbTv6rwKPKyb+PIsGBUgBUJGCgQ3L/NpHvWVFDbinzVaW4X1x4nXta/Akz/JC2RBS9C9
         SuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130328; x=1775735128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tIG2xvgV6IOKPVH2TH1vWUTW9m8rqa2zF9dGwt1d/yA=;
        b=G63PF53jL3cj/OhqKSChNvqAMuq9YuoNUgS5P50EbmBogTrZrCvQoqZgcAGtwDuN0F
         oDQO1cJLw7LfEnZ+iXNQQShQ1Cc0yxCdPOn4XPjBsev2GfLfhIrqPoI+FdXVXxpVVf0N
         qWT858l7RndiFotweR9B/TXZe30ovKhZQm7zXmE/MJDtR3oH1QMMzozkIEnbDToVb54J
         AKiMrS46NA08QtieLQe731uvNtXtcPUEJHoXsoS2j1oWBvB0rAD8EkiaX9zy7WFnX0bm
         FbA8MxXoWgRT06GDSCyOzGoafpt+aq8aObd3yM3ieFMJi9q5MCG3X4cSmqz4YMClynX6
         fuUA==
X-Forwarded-Encrypted: i=1; AJvYcCXL9do1FgowFRtn0ENU1c64g1pesmwtVZJxfq7C+qJezAgXwWhKf+p5FXi+tiVZVZnXFK/3X/cHEUqi@vger.kernel.org
X-Gm-Message-State: AOJu0YznXH7/iCvSdBjRAe5QEk1JiRZhFjzt6zpzQasPkGnrw5ajcIsV
	k8VWvTmsp2t2JqTeTraLgJix641vZxhIZTupxvoNeMbyDk9Piy+Ix3Nvk01ztIJYZeryUZnPSDs
	ogMOlC8oLmcTU5PuULEX5kiXISmtUGU+aixRIOyY9HY4U7mEHuXxslGkUHFajI06i
X-Gm-Gg: ATEYQzwjfXx7X4us0E1CAgdw1gNK+SObS44Nhd/GixFyIN7oixIHuKA0i3ecOxd6VpG
	74nLxsdI0scBJwSmrrzgeejKLYDnypEK+qgB4sq+XcozO8CuG5YXBVJ9P6JXj8PuzTON3Rt+JbM
	rdmiaz/nEYIdVutt2HUA1A46+lqs6n8CTvjm6rI6NrPcRJ/0Hqsm5iYPJO8BwtYfEejrWpepfQ+
	X6ftigPxwdoVcGdSQMSAjZh4qVxNocnXJ1IOr+joVOeSBSbb5jrFbzEg1E21bppNai6XLmLuN0S
	iFIxbMWRclWd2nlwswFbVjsoYW66IbvNA9EDoJRiu8a/g5FrxK1RSfBfjEmu/bsQM3LMeGQov2Y
	+jbZxDYDiGeJIsDQDLzlM+MCCvqqcTB4WV+qIldpbHwuw
X-Received: by 2002:a05:622a:134e:b0:506:a289:fd3c with SMTP id d75a77b69052e-50d3bba7d2cmr94103111cf.17.1775130327594;
        Thu, 02 Apr 2026 04:45:27 -0700 (PDT)
X-Received: by 2002:a05:622a:134e:b0:506:a289:fd3c with SMTP id d75a77b69052e-50d3bba7d2cmr94102661cf.17.1775130327185;
        Thu, 02 Apr 2026 04:45:27 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:12 +0200
Subject: [PATCH 1/7] dt-bindings: display/msm: dp-controller: Correct
 SM8650 IO range
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-1-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yFoXFf2bQiJ8Irz9zLQs16efGTfbjry6Zus7oX6VYmk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbMhaJlM5JSVwMAALvqVmHKm9lLQ7xjs1HiS
 iEBdOIN3+WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5WzAAKCRDBN2bmhouD
 1zPED/9uDSc7TddNfSBSa5SWFEv/4EVT6Qmk3soyDZgCj6SzW/PH7ZIfz+9wOXzTvM9FhVf1ldI
 D94hrE1cMkDDPMS+wezFoGs8zkRtjW1eVjTafmWZqAepC4s7tEyG/cHDX3hQkB/yBqtl7SiBCPi
 3tHpZfK3T6LmZdF6sgiEnF8aROykBqJT7yn8dCz9uxl2oFjsT0YLu7dpc8B1uzPXmvnp/0YChxm
 zs9p5cHFj9g6FiOK68HbbZcECHWqSyRa4zfankyNOLiA7G80PoSEW+lGRCOEL5DonyvndapfTuC
 p/TUUsoxvNOE7pjVPQobYRY32aI2Vh8Agq1uF7QzoEic8hN+2J/gj7//dN29ilh7oagIms2zMNo
 Z0bkqJWwlN1ftBk/vB02aQJGPNZlXg+RQ1pBmbMq/8n7wL04Xt3Bhob2xgU/zCNLAVEIACYV5hN
 c6XDSCH+v93rmL4NgOZVqyOMiFfRxTKaUrXUOuH2vwzgxgUfHPqki8uW86ZuBc/XX/73ZBXuY7l
 j1rRXwIgWTwtrXcmc8zqOlq4F9Xys5AbXmUN3VjdXzUw6NDSTFy7kJ78IBO1sSqKGksZEgq60Ta
 nVqCTZDsVNAdh0DSTp0gNbgmF2HT0FoSqUhqZ+jbi+dg8VvnQjcC8szOYr9lXc97QTpdR6KOL/c
 d5OT0KoOM2N4xTQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=fdGgCkQF c=1 sm=1 tr=0 ts=69ce56d8 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=LQzgrBLVQjxtG0neiToA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 1a6P-1s323iDGtNheum1mfqIsXnV9e08
X-Proofpoint-GUID: 1a6P-1s323iDGtNheum1mfqIsXnV9e08
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfX/cJIqObxkHJ2
 x5NuwiiaXOvrvphVgzmj/c7ZunMRmjzBqP3bom6OToDE3KScn9ROeRIZrPx5WLCgpci2rHvGPje
 CwZiseZkIOdDdAtEPoo8bka+EZV5RZpo0RLCCGQt1kyvj0utqSL3MCSvqfN7SYbEQUcWH+nGzpT
 mKMpv4honKxGSoh9Lcgp5IJO0c5rBf96emSEoW7BrdOB4c3l/bXL4MhYLc9kwKW1DR7oBNts7W7
 S81YOl6JVXYU1KQNHHruiPDiWlTtIjvT+Rm/GUrXqeO3UK4uhdhRqSI5SXaO7/aNW6aeaS1oA7T
 ewpAgi/V5clEhgWVU0cB4HG/MNWPdQNiuG/mmqKc8lUsku3dTplLZ83gZkWp1rBHnGXfbXSMOea
 uzv5B0DKAcSmKiV2dD3pt0G78AApp1FV3FdXXCHgczkCQje4eP4BvKdBTW9QMNh3yFG4u2aIqoD
 ysP9rFW9nJvtN3fKn4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020105

DP on Qualcomm SM8650 come with nine address ranges, so describe the
remaining ones as optional to keep ABI backwards compatible.  Driver
also does not need them to operate correctly.

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

