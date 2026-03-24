Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC4A71E515
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311063; cv=none; b=ZphgKabVxNkeGnULaD1LShtUOG8QY5li0QhabxDIjDRZG8yz3GF0TEoAt1tquZ6KaarBaPxKtBcr7mHZ8MdlvCihvhfy2DXQyVhishrWmol5jUewTnGLntfCetFUCCY15ZB7RufuxXaBzyyUSd0N2pOGNpfyUC01QrUkF3x4Eak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311063; c=relaxed/simple;
	bh=yVthNPm3DjOsdKVYIVqko1MZL9hhEvKfRIuyqdTPA9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mLWBcOX76Bm4+F0k+/mqcSRm9skAS9VS1magTspAZTY6qVn4nK7FQqojoCJVfosjf4X/jL5PqHEMsKx5tkeJnvmi/w2b31BJTNRDC1Z2aZraXw54Ta7hTq0EzMacJ85HQ3rUygjdJDqpSRNsI/WsMNz6pqqRe/S2CIszvSHmCLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LvCZIZhg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E52EFUtq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LvCZIZhg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E52EFUtq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHrhUn620409
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hhwgxNDk8Z3SvSduo334zellR1VN2y2e+x1xd/K7O78=; b=LvCZIZhggnhmaqOm
	3vol9ed7M89SX2dADkVSkgrrXQnZz88d4fXjwaQbZxuihlxWw0WYM6SuiALIkiI7
	lvKBLCY3eg3Q6Q9q8nya84TBdwuYas/FHXKJBji2VuxekDduKaUFoETzYTwSgctc
	i88h2bgLW9Dl1e4GKCdlXCfxdiTB72aiJ8jzV7U6qDqAocRXW9sGtKWVrjHolqbp
	vK/k2Z/wkBHrOOvgtYnVtnU1Ht9r7+gWB7hap2c+/BBqlmihVcCfNL8cS0Wz+as8
	NpY9It7R8KJ0p6KhUEy3uXgUcvSOG8wG7EYk9c4VIF3X3g2tfMG6XG/Dqtns0HU4
	zKPcjg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jgk7tm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 00:11:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5093b92f327so351961761cf.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311061; x=1774915861; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hhwgxNDk8Z3SvSduo334zellR1VN2y2e+x1xd/K7O78=;
        b=E52EFUtqZjSp2A3rmTEp46oHV2ZMYobCPQEaTpG4gHURIM9RjCqpBz77hmhTFEv2UY
         /QnBT76YVU5ZkI5L+vEFzZ54gAnrw01SbGos4BkZZiNUg8Z1P55ppOC81fpTlclUowil
         Efy4jtHPt+me99bKe+TKTT6fQIZWrrnzUdNHKsJeRAiF+b6FExIp4KcdBuPsAdL3Imnj
         ITQq+//WUqrO0rHcHiOBAgOIgu4w76Jae6slO767diQ5sUZRnu/TX+wLbbLj70sDVvOj
         Cofr8c1gk0XA7Wd2mVHYXUxP3UZjtfN4ui7GtOY/CbPj9KSkZhOgbxncIRAoMvypsdJn
         D+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311061; x=1774915861;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hhwgxNDk8Z3SvSduo334zellR1VN2y2e+x1xd/K7O78=;
        b=G0gVwNfoql5Mp2hA6/Yo7QWrJ1V+iLTC13/FjHaqOz1xhYGoEasdEHZ5L2ujSbJlf4
         kuv8/24lqcM/q04/O4Cfywf9DKOTENYEgiAtThPUYdCmmrLKqvMh0l7de+SDWKVNCBYR
         3Pq+rfTAZEYhYzI1pJQyQTxNCxOloQ9bvdGNUQ2DZYXvG7svgZsRf/9diuZm3SHhx4db
         3ZJRAzW/9+n0M25F/bjDB8XCbf3mHNrNXDAbKpXiIAxSaFcOLGuRwB1Ij8xzhBdp1JW5
         tW5jmeNpNc66bYRl97VwgSmiDWMCibBcjFhQkuaX6/tdymeJSVAXoHPCkStuW8KEa3tN
         t65Q==
X-Forwarded-Encrypted: i=1; AJvYcCV7gZmWYgQJfQd4ZVOosSOjMjS/8cU5UezEUnZ5kWWX5akoVuM4WOpkwOVET4NRscmoiTLqzuDZIWgr@vger.kernel.org
X-Gm-Message-State: AOJu0YwJWWeTdoBh1+m34SMpMBVrVCrIh9gYIhqhebp+F/hwCBwzCMgr
	yCSPPaLKWqRur9PY27+y8NGrHH6A3TjH38BvkMGWUB0phfxt8eh1B3eW69hqQ6YRipGlqzGgbrp
	ZkdWSzeG7lrUCaG9ZxNQFpvRsV+TFeZKcaA01ih/qSq/DSVEio4x8OWIk4TvJUbgQ
X-Gm-Gg: ATEYQzz+0tQ65uGrudpmr7HGBEdnjgrlgQHYEnoCBp1tYO9jXh5gkBaIl8jP1Npdh5M
	av8iWpum7/dzsFTQCNk3bR3uFx1fAf1OLMKmanky0MzUgVcL9eUjmgD7iqBmp6Mm+pxxvafbu+3
	sEIr8ls8fwqtPOQVsVRejJJ6rFO09GsKpsTG+7KnDB1kfnJ5SyOAauupkmG7PDURSpvUos3h9Wu
	1EnBknDyD3mVW6OZIvat85p+5577KGH1hCfuQa7ZbFdPmSWge0mvF8/pc858smif7hXuAandyv2
	ritrUSSLGBX1psSrDcjTEAfbivORYpOCrByfY6QyMw5fDMdJzfnqYWZnG3sKWMctLJKLEmSJHIj
	v0nUYHW2TmUYfpdGiw64mNQEOzG3xgH2cBLqKxXJxzYF7JhQXas8cQgPsbMlY5C2fhOu/4ag7+U
	jS0Rflre2nH948qDYx0BQrEFhYi2cADllvfFw=
X-Received: by 2002:a05:622a:1450:b0:501:3b93:bb37 with SMTP id d75a77b69052e-50b3753b6a3mr213724931cf.39.1774311061103;
        Mon, 23 Mar 2026 17:11:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1450:b0:501:3b93:bb37 with SMTP id d75a77b69052e-50b3753b6a3mr213724641cf.39.1774311060686;
        Mon, 23 Mar 2026 17:11:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:10:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 02:10:38 +0200
Subject: [PATCH v2 2/9] dt-bindings: interconnect: qcom,msm8974: use
 qcom,rpm-common
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-msm8974-icc-v2-2-527280043ad8@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1211;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=yVthNPm3DjOsdKVYIVqko1MZL9hhEvKfRIuyqdTPA9I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwdaGm6tKbN/QjmKWueJ3FdR4wKXZ15RBvv8Tf
 7pGjkdBhI+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHWhgAKCRCLPIo+Aiko
 1Rm6B/45NBZzSff6ONSMtyDvDUOEj+cTeJXB48EL/w+crDAX6/nsVQCovh0//B8Qv+7OM9hXf6i
 lwSacIrnxswnpOJeY5s7c1Ato50PCQiJhmbs0gu/rLLrwMHXCA65BndO8Ta08PLTaUlQFRa4wvp
 if34r4qhJWfrK+ABKB8R9FLY2LLMIjFF/3IzdmDhlPyPeBCM9oHpJ4320PPMJ8BAJIq1Z9DLxdI
 w1eVL3GyUBV+1VCJPnKuG8pBhQvpCxJLejVojKFYl96eURN8ooLe4+rJ3C/NOEZ+jzKICCVXifI
 QaEClwX6W2WieVUeItA2OiARZ6uAse4opLAWiinLASDrb5de
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: m2wqytQjP1b8S-y2TX21177-yX5If9nE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfXytPaIXAX0n63
 5yqCEKQlZqcJLb7aKcOnxsZJo7qc7d2IdVqK8W+QeYwo5WoGNwozuNe2KiehNaSIWbEbLYldHm/
 QqAaheAzDE3/tzIloPXBPfMZ3fZTwMnCFVhdf7FSbYhvkekaTBiXnK4uUqkwWHJGALzMQh8SgQ2
 2NngLXrqloKr+DTBZzPYMcyVMcLWMZ2Z7YT07APOLt59I1dbBHPIUwWkQBsEPZ1i8yDVP2D0pNh
 5IfgeW5KIKCgjcQaSwCZLvqZ+Jfm651Vr9VpsbSZhP66WDE20+cgyx60xaB4+d5FTccMVVuHoQ5
 +k0jyBMcLCulu/oYsSg7q4Dn3R1W04nya9cJajJlABsHo7RQxVJwm/j53itAoefx6Ols9z7TFJa
 VQ4jLWxc6rsuufYvdGz5zFXQLO9vIWI+WqnaLh5xOermj8hH7lgmD2ULXFHdQzq9gYvKYmtPwB5
 l1Td0iz9N2oeNKtUFvg==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c1d696 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=wtXhX3L6yvnwcyBavz0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: m2wqytQjP1b8S-y2TX21177-yX5If9nE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240000

Use qcom,rpm-common schema to declare interconnects property instead
describing it again. In future this will allow the platform to switch to
the two-cell interconnects, adding the tag to the specification.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
index 89a694501d8c..b35f6dd11c71 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,msm8974.yaml
@@ -26,9 +26,6 @@ properties:
       - qcom,msm8974-pnoc
       - qcom,msm8974-snoc
 
-  '#interconnect-cells':
-    const: 1
-
   clock-names:
     items:
       - const: bus
@@ -40,11 +37,11 @@ properties:
 required:
   - compatible
   - reg
-  - '#interconnect-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 allOf:
+  - $ref: qcom,rpm-common.yaml#
   - if:
       properties:
         compatible:

-- 
2.47.3

