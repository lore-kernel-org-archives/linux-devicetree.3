Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B88379EFE
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 09:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783504141; cv=none; b=bWt9M/Xm/Ypsm+RcntImrKqJ632OaKW9L7JfZjdTrsXaV0oatQAHxL1zLawHWzaarlvF2D3aqLLCSf+OBy2s/rhos7iyu0WkUZkQF7S/sCOZ5wC2aSAlQ58GWhGgzn+95ZMBsw8nUBkLCyMO089C5NPaKHuNT+IQkYTBFvCF9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783504141; c=relaxed/simple;
	bh=/g/RgdYJpwg9WPX0kGci3O/a/JAF5+J+OsRXlWOxgn0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ee0TJ3PYH6X49z5HZg8yOHPyAKXy6ALERceHI74z+BFA+D51VpAgnlZ2+xgK489CnnQwlc3pVW1GaXndjfUSO5fbWND1lUz5G0XtxMT51LcFnqGxGBB/qhbREKNhd1zNRZFT6kVu+EUpO10PgPJe+f1joY2CHMrRMo9P34AVUbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fy4+A+It; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LSqEB/DR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fy4+A+It";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LSqEB/DR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66889J1i2258992
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 09:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOh+D+/o2aUDHYNGrbXorq7N43Rcfu8PIdYfEiz5oow=; b=fy4+A+ItXJ6pLpcQ
	5jYaAwLWib3oU36NdBsCj19kXAbTop6tJbOTrX95YIPitMGoFJpWPx3W+3IMM4e0
	p4fh1JoHBP0D4U7dx77huE/iP/aC6avXMz8Kg0tTmUjHfTlgZDj6gYea9AmmdeHs
	8niXAeB9uOpngp2nmQnB5PZdDoRqeRfpFrJgb5Mur3c1qLrwasMafK4G9xIg0NT3
	EICvIVPWqTsLvlnA8mTdMs4rCNU6YRSSKWEiJk6e4O/s2ysN2BPtXDR0QKeR/4Nr
	2oa2C24OiMxQHSaHL/Id6fj3dJqDY5ehDqvG2+aIGfGIv46YmKlNIZZXSm/qzRc4
	qXqPrA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csw9su7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 09:48:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c110a3b6aso6273031cf.1
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783504138; x=1784108938; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOh+D+/o2aUDHYNGrbXorq7N43Rcfu8PIdYfEiz5oow=;
        b=LSqEB/DRL9JnX6xI2qcAsopyjcw5lHRAmOebyMXkd8t4/Pt3uEJPoRqR9luxbx9tO4
         fX0A7q1dOtZxNqnAw+Kt65g47yG68EX1eQNiEZIiUcOOAcG1uBOCx1KlHKgH1lIWuCBw
         Z/t3ReRNT4WgyPaZ1n1B97gZwjuMo2F5p78RsQSeZ+JinT1jWR/rTv1IYJyYH/+pg7Uj
         miq0qkVIGRQyUa0d3l1xMC0ozgkSKtFN7sdZHQhvu6Lte8rPANMZJjNibt9PDG3Gsl1I
         3XzzPalMdMUHGMxhymU36cYPk7U62ykwTJe1rcZ+3xPZBHwAPXV79OVJX6Y8k2RUHHFI
         jy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783504138; x=1784108938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOh+D+/o2aUDHYNGrbXorq7N43Rcfu8PIdYfEiz5oow=;
        b=H399T9xD5vZV+KaHVG1ynMAw4sjlf7j+fNLsNkvejVm2Vm2MExTuJE6hmBgd3AzqkV
         +yE9j5Ly/t6wyXp7EGnVpAee5dJJT4MFqqVim4wRGXb9gkGLh2lGnA6YVEb5ZqtR8Det
         L95e5TYSXUOYf4z2So55jwWu/WsXAHO0iRNOAct5FxxbLjQlD5HRUtYw7zht2RLXUddB
         1Nkq5UavCcWcYIQAoGVt4FtraILVtRN8Jjh/lFVfmEjAHnts7z+/nXUdK1Z/2LKH/Zlk
         fpa9gbto36tnMupkkZ/3YjIDklQAbQLQt92YxVruXM9JikrFA2n7P85SQq8WpQ/7exkl
         3kZg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7fioBtN8/AfFD4MVofyBp9Y4pJk98/REBRVEHsllcRIKuo7SoR+ocVftVXZg3UhDTTOEQbt9F/aHW@vger.kernel.org
X-Gm-Message-State: AOJu0YxgqyCUYTpZlrCXCH6b6LkavuGXQklbszaeRykkHupxZV58LspH
	pLLrhWc0WB8iilhOkkwj5pm0m0WmdvZA0WeZ7yxD1t8FuiYrcZHUK4+vcj3R1SXQL1gJ/biPyZz
	5+QI4Lq723wbtR5tZJuyNVClLRekYexfyi01sMc47xrnq1JlXF/rehMZLqg2itDEBH1tVr5kb
X-Gm-Gg: AfdE7ckYu5fqYKYOzZErhdcTUjHp7XzVsgVzFfs8z9xP1sAxFRTj7f0w5PyOKOYiAa6
	oP2sBPDmR+BI+wZmeLTqXNMU8EfYK3VXK/eZODCHqf8OewtMVL6IC1BGnTv0QfsNLXGCE1rCvJc
	BLH3XvyNLBhTqVDndN2LlBhU1WStn54S6RZPF6bBPayuymS7SXL5br8XpVzxUfgtD+jVqOhYgO+
	+xB5bkO7IW+cCSIpoDT0H8O1oko9tQ/P/woU0pSzUEMwiV/BrASSxbmpfJwhrgDolcdUBDQywtI
	pO6I3FmP+iSIF6doT9w5CwBCViaU3ujM8mhWhXSTR5aHnK4eF3PR0mZw3kfyyplEzmxdPGM+fio
	kpwZ4K9C+f43p/vVplOlo8oBOXEukZjDzfMI=
X-Received: by 2002:a05:622a:1c0d:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c8b4bacb6mr15547021cf.61.1783504138487;
        Wed, 08 Jul 2026 02:48:58 -0700 (PDT)
X-Received: by 2002:a05:622a:1c0d:b0:51a:8c97:fb94 with SMTP id d75a77b69052e-51c8b4bacb6mr15546801cf.61.1783504138061;
        Wed, 08 Jul 2026 02:48:58 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3318dsm114258085e9.3.2026.07.08.02.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 02:48:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 11:48:41 +0200
Subject: [PATCH 3/3] dt-bindings: clock: qcom,sm8450-video: Require
 required-opps on X1E80100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dt-bindings-camcc-required-opps-v1-3-ae0871774210@oss.qualcomm.com>
References: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
In-Reply-To: <20260708-dt-bindings-camcc-required-opps-v1-0-ae0871774210@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/g/RgdYJpwg9WPX0kGci3O/a/JAF5+J+OsRXlWOxgn0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqThz9zOy8xQNZjndcz2igUzCnFfPMi83dBD4Td
 Xo4N/v5C1yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak4c/QAKCRDBN2bmhouD
 18dlEACJSa/FGOdcKAQmsAwoaCHOaaFpDqqPvsuPSYl5tHLPX1rN46wkUbkm/zImrPnKTEs/i1r
 XLYVB8R4jxb4iD8QdW7u2v8M29OWxmpqfivwFPUa7n72vX3QCbjwrSJD7d4Bs5PBva6/mRcncn9
 IblfkGwTebKZmTevujAEpr47EQ2C48yS9nd9lkd9+P97jiS73NDRhdROn6YrxTg92vthvZvdF8b
 zAUewGqO93FnvJ3ZNTq8E9Z708S0O52fNebGXMG0KukZgqlXCKzjqVXHdE6drlj/ZJj43t/5YNd
 6GHRqdC/ezg8GIN4paGOIzk3YCfh0nTRW7XEvDemb8qi5EAwtLmGMClzCJwcxsg9UhAsZKdgwRm
 sA+zt3hWaoqX7l6eTLuOn5t/PmXCFIsZoc2/yPPo9D6rZ/OMeNRe+vLSkISOrqswc0FlepOwVUC
 ED721go4wJles6wH6jg9meABoyVU8Hg7fJ07etJoLMEtCZ1XmdFa+1XJwOd4oeGcJUVdJAKEsP3
 7wAbZvM9y35Dk2zTxWQgetbVes7sRirdvx4EYiT+AyT1tbWvQJW9/BnOYhD0k5iiZPJyzSiYc1l
 +n1c7Q+jvYEPX7bEyHXQbuh4KADBdx3u1599atnobSEmCSV/JRws8KPt5dicSWu7rVupXM4b9st
 dPTQDKuH6/Xzm7A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: NOBKycS2gajVzDWeWqJ4sfL4jo5AsZnv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX5RHjofqkijHf
 1UXYNqr281nNEwaxvu2/A6vCSy4xQ82q9fKewrSiUJXJSOyoC+fDQjni4EbBJqRIDOO0Nug/6zu
 BcoPMY62H36/GePO7YJXffehH7euKzc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDA5NCBTYWx0ZWRfX6OpisU0R+WsG
 7pfIilclJzIuujxtxuWJ4Mz9V58ymBTcsHszzEibqwBdz9r8bV4o0FIlMJzDVYuwXJ3akZxugVu
 0LSjYkdf/I1kL42JRoACh68OqJVTaLoM1AtjttVyMmh6z55iAYgJLOwq2Z9j9ZtLuW96l2f9WCr
 zVWAzTZ39a6i39RjpZjpoLcyp0p3aiEXvIhHzLDSKij1sEK2jkZYygMSpLJQ9m7CNQ3NPFS5yXP
 fWsNXttFSjcK/TWkNp9soCIxtXO4P+2V5mzjNVbugDNurWrtFFE+uH0eqwlLr1RflRWyfS+Tfqz
 wDxcZ9HUK06orixRFAtFnvnhM3E1ceXTu0ng8840NaYQOK+jsvTiy3QDdLEFZ72uZR5oHFXw6xx
 Vk9KAiFp6KOn34yvcCXwEUZL06L+wHEV2FYEQpCrxTj7T8JL/tT6YIVytLlhn4dKWC/Aus1+Z17
 YMvqNJq94yoSFYG5l+w==
X-Authority-Analysis: v=2.4 cv=HaYkiCE8 c=1 sm=1 tr=0 ts=6a4e1d0b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=DujDKyJwy_lwSZm1sVYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: NOBKycS2gajVzDWeWqJ4sfL4jo5AsZnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607080094

Reverse the logic within "if:then:" when expecting "required-opps"
property to have negative list of only variants which do not require
these.  VIDEOCC on SM8650 does not need "required-opps" as explained in
the commit 6720e8dbcb1b ("dt-bindings: clock: qcom: Drop required-opps
in required on sm8650 videocc").  Requirement on VIDEOCC on SM8475 is
not known.

Reverting the logic in "if:" part has two impacts:

1. Adds requirement of "required-opps" on VIDEOCC on Hamoa (X1E80100),
   to match hardware expectation, similarly to existing its variant
   X1P42100 (already expressed in DTS).

2. Reduces the chances of forgetting to update constraints when adding
   new compatibles (like for X1E80100).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,sm8450-videocc.yaml      | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 5d77029bfaf8..be5105569cfc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -65,14 +65,11 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            enum:
-              - qcom,glymur-videocc
-              - qcom,kaanapali-videocc
-              - qcom,sm8450-videocc
-              - qcom,sm8550-videocc
-              - qcom,sm8750-videocc
-              - qcom,x1p42100-videocc
+          not:
+            contains:
+              enum:
+                - qcom,sm8475-videocc
+                - qcom,sm8650-videocc
     then:
       required:
         - required-opps

-- 
2.53.0

