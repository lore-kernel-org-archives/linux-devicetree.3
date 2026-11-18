Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007342;
	b=cBbcaLzPTTp9tbZaL2o5iWt928gDE7HW3TO+jMU1l+A1rgsVXX2ZQOC4rjej6n2ZQoHB
	 sNHsOjwmMPMaAb4i7Svoi4GwXCWMPYEjYK7MTMo6uHE8DNgyY5pOylyo6SX+iGFhViDwb
	 H6ezG9weoaPxG7MdJLPK/n/B6EzqnE7sj90ZuN2Cvp2ihXAgNE1ihuPilBfz6AQs4criT
	 RpvwVrYy1Vew6zRoeBgMHGj5MYmBptAdGsR5Qje9+Pv1pib5sTEV/wrQBhS+yYoZoFiGU
	 2JyiXCMENtyi/ivpnaHrsl5jhIlP98x+LbZ1aL20nPOt6wnW6oqPjXpmckcKZ1FsoKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007342;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=;
	b=ytrv0EL2ch+ONtrcjRq2Hr+GWbBON3nAmAaKjQjCBCJYxWzOmsBgnwKJVU7UKynl8+3u
	 Esd0BtzpL/beu2+YvB9bFLzbgu3jvRKgsPEtbjorUOWDrfPkGimtJ+9NHnHI2RvVdPS/K
	 tLJyIyAVkvkiRmHnAa9mZmWkLgbENp2GtCnT0W7z8zhJv1McjAnz6oibzXJibTbygjaC+
	 VZSZIqSC+qm+KGhvKYhDFtLmLWdDIQK4hVq5mvvrqMfI6cqmfcT8i+dMoTrehPesOLgyY
	 fd4oUt3CgKYMRjx+it8al2yii6fpU2JRzmedW3Z1Sud7i4vQCIOT3El+w8mPbl6eL3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T4VOQp4a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tb1twCVl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D5606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8D5606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T4VOQp4a;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tb1twCVl
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLCQn1785739
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:09:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=; b=T4VOQp4auuCF9d9K
	dBHRh2NPdzXmVqAAFD0hc2u62KM5OEl7D568svnolivrwWvMGWT4YAkLqRQKL3ys
	2ONpsT87RsvGWKuaMSSxGuCSVvyySbpvhFVJZQaw+M15oSC7M1jdg7/rdGLkVhdB
	r6ZwcAEKkdDARSpjU3xymD6vzpyeFcfjGJsWs6PVDfKkstEXieTD3yo22KeDKEpq
	B3Hjd0fdDwKy01K5vd1/AXNlfevRivlMG+/7stxrYdNKoxf1KP7i7HwXzy3wWPE2
	8Rg2caG//hOPQPoAxKTiGpawn5X8toF3PfsOVk8urDTKSgKZERlh0UNI39aM6fOO
	2wFb1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8b3nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 13:09:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b141294006so198038a91.0
        for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795007339; x=1795612139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=;
        b=Tb1twCVlm5H/5/wDuMvVLvEbIBvhexxgqwsSpL9DK+rDG88CWk0RM/w2ONEpmQetJg
         QZ7YkQSvt47daqpbwrapBJt0na4wnaFGVD+hsR0Asy1HEDFGYHypXgoQ8t1bEf+MZao5
         p42zsLnuyg/iWpRrS1QaOWs+AsqTmCdDlEItFCzWeWj3Lptl/Bz5buiVlT4XXGIgASuG
         hazaSe1145Rq36UpazmLY/njvVm3gih5OtPMbsPKDSOpVazBIlDbTaSY8h/0DBD6uI0y
         F5jX/Gdop4asYDN5ZAYhH93iumVnDa4Q8RaElm/HoagzdFkwlh1Xfvr0Ptk77IUijVP9
         f3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795007339; x=1795612139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2uypBfXz8UgmtHwzBAp3Qn7tdU0dST+3c5sXLO043nI=;
        b=c/eCW45rQAfqkmVx7iR7jL36ZqsyRGg3/g+iw2L7dgCQNOhb7ukaLxMQVEZAdokuWX
         /BtpGhJA8yhvsnIotgRiYDsljPU+Uxe3JxsxSFIFH5GunKHRS75tQArHy8QcOuCCbQty
         t2orlJBBuO1HJSIS3rBZs614icswImxSAvJXpkAv9H1k5gue5EmV5L9sA5ZYzSKIFoIu
         MbYR/FyfT9G0ZuDTKE1emDWwz8DfSG/uohgtUSm0jaCGWAngjDAcOEdHBL3RWunC4YDT
         BoYkrypRki0loDKVUITmGUd9aNdAnbYYi7SBJXf79Tlq/ODC0/dB3vUQbYDmWV8dj8Ja
         C6/g==
X-Forwarded-Encrypted: i=1; AL+hErEp39gVy3YlDOKgu3f6jQUul7VRAS/1KVrQDqM85m91JK5Cif66cD3jrZnQ8JWP9nKWgYezjQkHNeFi@vger.kernel.org
X-Gm-Message-State: APuU4Z82j7EyWsyEjlW5ulShCi+jjennW+5q5TFXVAig7/tQs8xW5Cwa
	RsI3y1gtLXlUAu/xU7tnJ9SHPRZ7XjDzs/6j0fXYw0bQoqRQIGlC81lfIpQtCXb1TpmbpPcOILP
	dJH/Umsu9CH+ivVKD/Y2K5kbjEIbpGNVKQoMDXZJYrL9c3qCOUAjWgTB0FDTmu33l
X-Gm-Gg: AZFdTZeDUUGDF+DJq378ExFa4a06U28bl4Q701WHG14HzVVpsrpDzWjEvvIs2wSnppu
	x+tfP205/1exiETx7LfhsiBg75HvutWa+cC+yrtHUcpc8aM2lAHzeq+p1T2ENuEaw9hQgGFMGk4
	weL369fps52cDwWjSsDM2cSn/rZ7EWymq4XRse/iihqIczw/zb12mvsF/qISmTSEv5qT2Cv/lir
	d+2FXakHs9topgU9ai+IDms3r/nSd4Bi5Ufjd9TVY3EjCR3iuPvFzrxVK3I4VK6FLCxhwtJZKx1
	YYYgb/3WHhMsAV+NVkxCyw1HMR3f/HayYTouYuBIE+CY0XrQQUdVlL/BrVB9re0nMCTW2TNGVdO
	53UPolXApgOWMLmTA1VewRBVULmIR+BEXvSYpQqLc8OToB09I7yHecF8ycVeEJUlTgE9kLNc+Vx
	XT0/V5ZIfI
X-Received: by 2002:a17:90b:4acc:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3b3d07cf0e1mr4603044a91.4.1795007339474;
        Wed, 18 Nov 2026 05:08:59 -0800 (PST)
X-Received: by 2002:a17:90b:4acc:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3b3d07cf0e1mr4602998a91.4.1795007338997;
        Wed, 18 Nov 2026 05:08:58 -0800 (PST)
Received: from hu-pvgtejas-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d187dc82sm4909533a91.6.2026.11.18.05.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 05:08:58 -0800 (PST)
From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 18:38:27 +0530
Subject: [PATCH 3/6] dt-bindings: display/msm: gpu: Document the CX SMMU
 aperture region
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
Message-Id: <20261118-adreno-scm-fallback-v1-3-e99cdbf3121d@oss.qualcomm.com>
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795007310; l=1153;
 i=puranam.tejaswi@oss.qualcomm.com; s=20261118; h=from:subject:message-id;
 bh=syT63WlPX5IX60Og46wRhxhDoNsMAf3uqJqj378LbFs=;
 b=AwXTBw49z4p7aFFLjQBcN1LRUTfdmns5P5yqUq3KJultc0/Mn8btNjKyQknvqqXpLMd/RFbYB
 QRYATkxT2w2CoLGoDSZtDBtxz0JBVYCOFRfjbzMfF/Oal9q7m7cP4tu
X-Developer-Key: i=puranam.tejaswi@oss.qualcomm.com; a=ed25519;
 pk=I7kFxZ7dcroo7ZWUatk8fR/J/KVbRzZq4ZBLhRRGpJo=
X-Proofpoint-ORIG-GUID: GOuO6WWSrtx6ecNKta9RK-p6-uV3N_pP
X-Authority-Analysis: v=2.4 cv=N9u8hG9B c=1 sm=1 tr=0 ts=6afda36c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kkdt65S5UFh8r35K3toA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX3Kz2k1FIBDw3
 U6hFNTS/qFmTmRu71/4iJvSK57Nt4XkQ3KjCjAQ0zMQspL1t+Sw2oZEc/WP5PIYyWPAYETCRRHX
 FXJftbR2sOnIh5ZY7os5HEwZVxarFWZdPUrLDzXTE9b4eC4s5ma+sV536IXhDzDxgxEZzBLMCXb
 jHMeVD7xpXhyG8VW9E9XYwA+TL+9ZKW7YLAL8zEjBFZoqlPu5q5iUXnsvyCIou1+BZJ6kiXw9h6
 XsWJNQ5QGaeEFziivzt3Z+QhsyKPtbAs9cAf1Awr581eRfKpyhnufEsgVjrCBqWVqo1VykDo32m
 NtmFjl9O64kw6vzBSBqGR6NwbqUVfSUIPSR3jOXOe/FbU2Kg45XtHr5MOd/0L4DZqyDozwXkSqz
 0bls4d26cFri27+pUk+gTRBM112jr/+QNBnRgk4JTmNniq5y1QDYintRQIhFh4lunpVowZK4r5W
 KxJSQlC2IZQbRjQJLgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA1MiBTYWx0ZWRfX8y2PN6jGydny
 cF58TSRdvaRm4j7j0C6OyT2htFCGCocMMF/ePfxXxq5c/e+5PJtbk6m6MY5xwaYRsUC6IRsyXn4
 YAda+tJs1bi79TckW4JRRrmHh7flifE=
X-Proofpoint-GUID: GOuO6WWSrtx6ecNKta9RK-p6-uV3N_pP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180052

The CX SMMU aperture is a register block in the GPU. It holds the
location of the GPU SMMU context banks that the CP uses for pagetable
switching.

On some GPUs the block lies outside the existing GPU register regions.
Add it as an optional aperture region, so the driver can program it on
platforms where the secure world does not.

Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 3c90a09febe7..5e4f3149839e 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -54,7 +54,7 @@ properties:
 
   reg:
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   reg-names:
     minItems: 1
@@ -62,6 +62,7 @@ properties:
       - const: kgsl_3d0_reg_memory
       - const: cx_mem
       - const: cx_dbgc
+      - const: aperture
 
   interrupts:
     maxItems: 1

-- 
2.34.1

