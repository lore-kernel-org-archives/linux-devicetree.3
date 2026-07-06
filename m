Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3714395ADE
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 21:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783374053; cv=none; b=UwOzq11TOds9Xm2aBd0fGP1n/MVTmOMeHx9Kyb4fB/OFLw9W+QuGxL34fML+ohH9ilFFsEbmIDAJgwlLFrA1Jp3QpVF4S7Bh9e/B+rNh6iRYHs5iy+iAngWO90fnIdMa3zrDKWCXMjJL9Vnpg8gQN+4jXH/aema/gAbR48YbFrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783374053; c=relaxed/simple;
	bh=lgLt7qK/jqQ9CHjMSFFe96pTIkCFyU2Iu+KakUcKLvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LkGrATpvc6UMjtYkJP9g7ReyP9+j2uGk/DVtCn0405t2Xcv37Z/mc8juKEAN0Yh9BBxTc74MthtMZM7LN99kaZ8RVoK7Hp0vIJcvojzHsQEwe5R6m4POzlwUCjmZllFcka+MA+unA8EbX30yRK4EDd1ZFQOhJQH87FXXTvbDTZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCWKeDBi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LjgLFKKz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCWKeDBi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LjgLFKKz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666KDvpi1566475
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 21:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	neSdm1nMyL53Us0RPcN1r2C1JTuB4C/N4I75S58aU5M=; b=jCWKeDBiSZ4CNpz3
	UHG/bXB08T8jao6zLEqscXBgQY420HkAGU5CSdqRZHoPcUrRFtKaQJRqfG/PhdR/
	8Fyqd5AqqnT/XiPCqcFt+xHVl50PukrTPOmhiYNbjp56e/dSBVlBYzoxSMGOhJrU
	K+ieZnB1mOAdpwobm8JYAzR4i7LN/o8vIhjd7hNCmqNYLh1+YHNdUf16uZBXhxr4
	OOLNrKtiRzXFwzOJ19BU67H4AV7t5DIBbYV6yuoNLgs4Jvi6XhnXYL0iEH6aJTVo
	eB977Hv/7XMDbFnf5bi5yyA6+P4MJvDH8GdPNc628lR8JYpI3v6xrKEXpIvtp57R
	N0Y9OA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7kn5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 21:40:51 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so5578063a12.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 14:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783374051; x=1783978851; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=neSdm1nMyL53Us0RPcN1r2C1JTuB4C/N4I75S58aU5M=;
        b=LjgLFKKztv0w+smxfm9w0/1IJ7sUexSYUvW+WPbAx5RPQaav123B4/caKcdLoc4i4e
         uP1COsVIUYw8Q7tPU0GzXuNjvTQivHS8dsK+Cujtn5L+R7kQZwZPRLNFND7NSnJa9CAX
         Mk5JGkbAZXULJn/s7QxO/EZvUpnwz9I+A4x0dDVNCz0wbP0vJCXWaPAUl3AiPM8o69q5
         UpqTt5Tio3e02KZSmScV6AiJhD/Q7oZdwpuGtT9sxlko81qg1EdOolr7Joi7E65jxmw2
         AllDbgWIzqPp3JraWHTUqIr/L4oUX0xDL0rc1baL7UNCqoKsdBzNNJZfq4pi3uFAYfSy
         TL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783374051; x=1783978851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=neSdm1nMyL53Us0RPcN1r2C1JTuB4C/N4I75S58aU5M=;
        b=LbbpeQ3VBjydk4nQeiSoeOphN4EgkQTweSm8VAI9IMELSHbyQqxOYdixaa1pvewM3v
         FNQeb+yk+vLVBYxVY3YFGcayGNnJkmVK3Nonx8OQRND6pztQHi8j6DnyeVjbwbPRQEOR
         EZj/ruN7URs5dx5tB9Oa7XN5aXhnr6RmFXAUIytNtfX1RGkoTdZTB8kI1yq+2QJa+sjc
         mWOkJuaKZEWmZAiUWRucrN1DRIHtHfE035zn/SuI731SRGIQhLuWy22i3UuQfMYnXYjm
         A0taYId9oDpnJWFU1SmJEOFdoheJUPmCOtSiVRyp7fAf1WEE6aua0SOSIrRAiHiXphUv
         2Yng==
X-Forwarded-Encrypted: i=1; AHgh+RqFOJQTcHWcZkUpz7M9ZpWrvEn6zHWf830mk1zHhG7QcdnBO3rpVTc+TQz8lY7UwZlGaBh6UWf4GPPH@vger.kernel.org
X-Gm-Message-State: AOJu0YyRp/Tx9Gr2SO7qiPikvslZArIC9eKxGARQ7w+i/0LjaQIncnh4
	tHgxdsAuo5r1txlMoQGHVB+Lh8k6kMKm9svqsGYE/oTcC9eoi85dnK8Rk27KCla3CTp1tAFOw0O
	/QqiU/URsHNJZfiTfpiX6Vj0dOvf9sR9iqIAvzn0cjDVEMZIMg+kL4tWeyoMazJ4X
X-Gm-Gg: AfdE7clm65obhffs25jockOKoqTkWmWOyN0KScwWSldnopbGpHBDlczm8gpnqF45TQ4
	5ZntG2fLlo6AjkRncF9q5tzt6yP2RgKEc9gWwL02qHaZmg1YQKMCNnVd/risIHA2TAfCF4UJbdu
	R5rYZT+0e4H4T+8Sp61LRAM/1wBo+I4VT7Wxk3KuXIuZooiVn+1SgopYdd4teFhHJEutdY+gHuf
	vAz4cNKrrG7jFp60SYla73fQidfLERWTaQWp1jAsbdRRv7zEGEMNbgthr0ME4HeH7CkcvtKrufI
	4sKhKLekBjSFm0g3xYY8bn5b0MbIgQYC4h2u0y6yyxfIc5Jvgl4mu1Pv8Rb5S04U19MBtD86n2V
	mxwrYeD8GKeAAUHYBEj22DFWwcdMzdtyqYOA=
X-Received: by 2002:a05:6a20:918d:b0:3bf:9bfd:ca95 with SMTP id adf61e73a8af0-3c08ef05781mr2677434637.34.1783374050538;
        Mon, 06 Jul 2026 14:40:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:918d:b0:3bf:9bfd:ca95 with SMTP id adf61e73a8af0-3c08ef05781mr2677399637.34.1783374050098;
        Mon, 06 Jul 2026 14:40:50 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d8da9sm901810c88.14.2026.07.06.14.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 14:40:49 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 03:10:19 +0530
Subject: [PATCH v3 1/7] dt-bindings: display/msm: gpu: Document Adreno 840
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-kaana-gpu-dt-v3-1-8dac9a60dd5c@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783374032; l=1363;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lgLt7qK/jqQ9CHjMSFFe96pTIkCFyU2Iu+KakUcKLvY=;
 b=+P+NDR6cbAXILISO4q4L/6OEYgzU+DHpDtDOQUJr7ifwgex0pOzNyEowCA74kl7n5Srs35yDN
 PxQShTIo/yLAvA2XB1tMHqmYhhHkYJIT008pm2Q5i50KTBBYOTNWTQH
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX/sig7zZiplfb
 zufGcj1CGfGPrSDdOTp4Z2M3nmYLuLOyQuwY0qxlxUjHB+yRQ6yXwBXWodeq+8pZMKdyjQXHHfj
 XKKj6IVmXx/w7LYGdacoH1CJ0tHZcj3tr96eVn2xZ4w1oIbxNKyl/RI/ZA1YKnBwmktxoKHKyZA
 FfsvN9VgzsuHpdFZrL3o8+SBksEsLGVAklbKbQYJWZwGXOHQPnXnDDqgOGlGHWmuQb1IvBaSUZv
 b/Sutscxkilo2WFq4dt5680UD2EPJAQvjeGLQ6MahwCKGvzvlnnd0n4/64D7d4aVehaSWpv8e9q
 de7wbGtpUmlO5H78uylOfFossT8StZoK+wF//qzWlaQIWUkiJ9jCQ21SRCPGOC9TnpyczKrrzC2
 keSQXv2bMfE8lLfKOCzFjy9CdAAZROZ3SHeZqn46EG9X96UtypofnJOmEA7LQ4WBI54AYeYxIcD
 Q5BExJtg16gCLbFReLw==
X-Proofpoint-ORIG-GUID: XMSt5NOkj_rS-1HOLXbUQElZE7_favw0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIxOCBTYWx0ZWRfX+smuHt0RwqvA
 ZELyZ4DD8StM/kCaTGngLidzRyEMm6fAuupSyiZiBKqpZuKaiQHl/sQ9rsXdqm5P1xDBzoCi5xE
 DJt/T3S0UIjNomM8z7cEcoiC0ef3p6Q=
X-Proofpoint-GUID: XMSt5NOkj_rS-1HOLXbUQElZE7_favw0
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c20e3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=2rxQ3qtc42-NlUa7jS8A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_03,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060218

Adreno 840 GPU found in Kaanapali chipsets belongs to the A8x family.
It is a new IP which features the new slice architecture with 3 slices,
raytracing support, and the highest GMEM size seen so far on a Snapdragon
mobile chipsets. Update the dt bindings documentation to describe this GPU.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..d0b7304c17af 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -413,6 +413,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-44010000
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
     then:
       properties:
@@ -448,6 +449,7 @@ allOf:
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
               - qcom,adreno-44010000
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.54.0

