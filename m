Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF163C7DF0
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444769; cv=none; b=NVa9YuXW94zxCSPJHjxh98jc6fuxLPHDd4F/9QaRVjXl0FnFlwrUmiOLJ7UmCSCb1+H/Vn2GBwuw2BQv5yhLiUgswNofl3M/35D0zqn0eEQDR0wEo3e8QS6fiDXTbcW04bahFnGifbs8+c/KavW6eCcDEwOq1fS/Sed1lh2OuB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444769; c=relaxed/simple;
	bh=VXyPjRyCvwokK/qdzZThuxToG/yvYiuIOD5L6w36bck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lIFxN/kui2tsOgURWtElkaDGJYoV1S3LVhF3IPlSX89yrCC47tItaTcU9rAmjEN9nymmpUwX0suOxr4Hyr+VO0Valf+fVxrE/HMuWsBF2ZF/7HntmpDztunjQ4vVrx+iazwK8DW25AR37MnK9iMS5HnelC+s0zBGX1yEmU9Sbeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BaHp0and; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U59URYX+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BaHp0and";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U59URYX+"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M6Fisj776936
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cokVwtObejHhNsT8CGzVLLo/zm8OUnIjAi9EaYJJAFE=; b=BaHp0and/uMoE7DS
	h5Sz57ZRPv0MyxT1qtrLFJF2OQQtbuHLeiyLzQU3sA8IHq1UVGvc6rXcdreUU+UT
	PAvSZM4zm+jOFT4WRJHe+UP3IjkTMwSfyyLeGvZux4Nn890yHF3zuwfufuOc6CTm
	gzqsZTvd39NxbrZjHvBV0S9XtKJp4x5F7R5aXn8Cv8aaVgUyZQV/SJq2FFkQBjjC
	yOcWhr4IsiXpTLVoSPEchgFBsaXWBQetjs0QQF1p7AI3z3305IY0jkvWjHVtiBpj
	rYL2rmFU7bo4bOrvjA2pb/tX3ysXfjiqjiYlWnW/fkj7hKWIaRADjGG8peid1swE
	dEf4WA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h309q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:12:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367fd7b8825so7158771a91.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779444766; x=1780049566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cokVwtObejHhNsT8CGzVLLo/zm8OUnIjAi9EaYJJAFE=;
        b=U59URYX+J9Ue6OAu7p0lYwhI+6evzn7Dq89s95ePU38vIjz1d5EJCaB32HGrT6tK/N
         v3Pdm3/QemnHwId8UzAXLZbQQEfrlGcVy+j6vusp8aCIoQSoAJiMsQWcJUrzUfNHOWeD
         CyVOsEM80LydxlHJlnRkPFTZc2X+v0lcAn1MJcar169VunMvoY4Fc7XGDcYasNVGvfM9
         /mi5QCtvWqwtiVRtGkcsAaYwLC09bjBrHqhOQ8dXty2njlR3fnyJRPZn2DRGrJYLYxnP
         uURrEfr0JAiSQdFIluIMSnPu6PHB3LuqepxaS5E51o03+P7Z4vn/qK7lZbkB285vTr0G
         OnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444766; x=1780049566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cokVwtObejHhNsT8CGzVLLo/zm8OUnIjAi9EaYJJAFE=;
        b=s8hEA00sgYB62OAMuL785salwrcd2Fj9UBkfszNv7Rx8+l6nlZK768KSbbPjhiy/1w
         T2JR0+cPbheT3hs4oJI1WYlCGyiByFVKUWwP4aY2EdDxGaf9N5nkPi7N61lZjqOYPhul
         W/ulXarXrhUghN22/F8mXN19AeL1LeZnnli0NGq7bLly+r7mFwHCnZ9PUKYxoKxlDr5n
         FrAonIcbg88qmr1EsiLC9+pR0wfxpjnURmFIonDdbr1UOEKCs+aESTF06eWfCEfdeTME
         RkKEEssYKwU8/jhH0grqORx9tLfVb2uVJy/PuthKuAhja+30IgoObx8GVyQo7rWKNgNF
         8FTw==
X-Forwarded-Encrypted: i=1; AFNElJ8gsqXXyATE+9V3qd29OwWiBDVa9uYix3vxKSGaoDxbvtY2oEd14/oropAbIyj/EuWoUtGSJktyAqcZ@vger.kernel.org
X-Gm-Message-State: AOJu0YweABUiT6BGwHsdxDD0SPceJxcfD2zTb3K0Dc/vFQ8iL6oAPWXN
	8Whn7sD3FD21lNOIdUi6JhwqcWxr9h/qf4BddYHsMICtI5Okm0CKKCp5QfiT2Ochn3ilq+zitwy
	LP84NsTI33GeGJ6U37hhq+brT9eqXmrMekIy267Feo9y++6/wgdueRK02WB8Spa0I
X-Gm-Gg: Acq92OGF7BNT4eE/BrtCotzecYU4Nm+IrLfqeZSxgjjUrouUBrVR2kBxlkQoRt0ZaZg
	WHumJxJGE1u6o3PC6cUZ8aFNQmfZa+ZeR1+HcLMHyXclmwImJ5aa7cF5p7H+GLkqB/ctwnOb0xt
	K74Hd7/Yltc/9CoCWd+X+BUgh+dYDw0ZemnD/3ql/RpsaLL7JwljsdeaZWb9mNfwcar4FjQ7QXx
	GNczlJR1n79uMw1FW/iDNQHVdOI+d/dFO38vnDA3s7+zxA3mjhCdcW76++SAzKyD/4ej9oeRSzb
	y9z7IYLQ37rCzmQqufPUh8cCYBT38Rb2ibAQbFxPL2odpmh1fNvp8/WTmzVyKuWkRkp7ceqV1bw
	EdBniuUEblUres7ZEab2NXIrupIJ+dSmE/xdq7C62eG2xmQ==
X-Received: by 2002:a17:90b:23c5:b0:36a:7c8f:13c4 with SMTP id 98e67ed59e1d1-36a7c8f15c0mr757095a91.20.1779444766103;
        Fri, 22 May 2026 03:12:46 -0700 (PDT)
X-Received: by 2002:a17:90b:23c5:b0:36a:7c8f:13c4 with SMTP id 98e67ed59e1d1-36a7c8f15c0mr757065a91.20.1779444765611;
        Fri, 22 May 2026 03:12:45 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85202b4442sm1143498a12.12.2026.05.22.03.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:12:45 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:41:58 +0530
Subject: [PATCH v5 2/5] dt-bindings: display/msm: gpu: Document Adreno
 X2-185
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-glymur-gpu-dt-v5-2-562c406b210c@oss.qualcomm.com>
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
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779444741; l=1562;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=VXyPjRyCvwokK/qdzZThuxToG/yvYiuIOD5L6w36bck=;
 b=hHmHtgDv/8JAzGDQHpoxO18rVqZunMZq4oxl0d3cCR+bDPnORL1fE/cpw/Xw180Vyv/75m9Dn
 jdLWruQY/RFAIr2sYPUchNZDz0KAyA6VsVna6zODm5Hqhh57SNm7AZb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: JrOrPH44imWjXUMboxKlgRxAKrJDZCnf
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a102c1f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=aapufVXKjK5bSyzaIfAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: JrOrPH44imWjXUMboxKlgRxAKrJDZCnf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwMSBTYWx0ZWRfX+i5l9FzWO0j5
 aXrLP9QeddZ9pKNCKYLqsVQr2F5A9uS/DGGNzuzRAcQHGsQvPmDdeZXx0u/8RKvEupzbDeuAFl1
 6t6b0Yu3DDUW667dkgfBuMp6g/1vNBD2pAmQUvummj0+CvkRznHs+n6F5jrU49llQCU959pN4z7
 C/szlmYNosNz6AMaV/uuLuoqjgCOzjY78KCCCW8CT2VOUBtROUfpyvju7Q5rMPiv0aKbHzrhHi3
 Ok2FdDXhcT1fhdgtIiM53YnPW5sBOsTSTJDJj5w5jdN9fucRiRv653EqR8M4LdON0zCmoKAAFdd
 Fsawds9BNdjHvNMWXHz3tieeLH/34CrlYB+0FHxZv6rZZXCf/sgKUaeZ3d8w1b6rfv2CCPIqzZL
 qKxpdh4QgshrNUTPnCaLG3rnMpqp+RPnp+mHO+vCSzX3QIAf0TLfvgcZuvksubEQUe2B3eDjCMx
 v3nvyuQgspeCFQIUtFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220101

Adreno X2-185 GPU found in Glymur chipsets belongs to the A8x family.
It features a new slice architecture with 4 slices, significantly higher
bandwidth throughput compared to mobile counterparts, raytracing support,
and the highest GPU Fmax seen so far on an Adreno GPU (1850 Mhz), among
other improvements. Update the dt bindings documentation to describe this
GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 04b2328903ca..77caacd0fb3f 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -411,6 +411,21 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-44070001
+    then:
+      properties:
+        reg:
+          minItems: 2
+          maxItems: 2
+
+        reg-names:
+          minItems: 2
+          maxItems: 2
+
   - if:
       properties:
         compatible:
@@ -434,6 +449,7 @@ allOf:
               - qcom,adreno-43050a01
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
+              - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node
       properties:

-- 
2.51.0

