Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D8B552955
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 13:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788959929; cv=none; b=gZ8jSjV+BOMWFRtdRGUFAUJI5Cq4RQlzCkt74bcRzDtsUlr96l9F3z68hR3YxsFV1nNf0DtQEQE4Pv/UIAvMi0DNUorlmEfW6pnm+6rF55LhQ3JgL11efB8ITA32tk+A9ozJ5uB+Y395064rW0h7JbDaPO7HMyqJ0KV4JRvqqww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788959929; c=relaxed/simple;
	bh=P5QjNrk8YCBoewGYIMDFOF+DssUYLxeljDAGYw9Rig4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFuiwnEJKZH5i8CoJGVip8KbN4PuL/X9l/ECNJSK1Z09ldYAy72tM+D0wrsHpoT4qfyw2K8Th5KYlgY+QE+O7w3DBXVgDQUaz2D4WabMbFiZVK4srjL8mSyCa9P/1lteWi3xmB26jDnzFk0A1A4XkA8W1QriQPnEnBDwe7vaH2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h5LWEgJ+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSxiKP6B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h5LWEgJ+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSxiKP6B"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUA7q1183763
	for <devicetree@vger.kernel.org>; Wed, 9 Sep 2026 13:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkgy+MhX4grX8MkGh52r3vqTjHDSVCmckqvAW7qpwYY=; b=h5LWEgJ+tlPNU7tB
	TeSI0ZqXgiObk7k9ImxqneggjbbdoUOgMQRGyqrpT2O0DFDl50In7x4Bc5kHCi8x
	vKD7xvFWrlKIRCJuRNdialJgCITD9VDBwF8dkqtjsVhLSVxy7X0dYjVqB7yu/3wl
	anMUUpqQAfCiRtyDGLibcazwu/T08/GCyh4Nw0Hxx80uv7nmGSo75ufk5ttdfFhV
	CjtefKxefeT4bzBHpCI5QSI88y/XIHm3wnNljTdNz1QfOG25pIaWqIzUkDBKs5e/
	rtNmEPMo0o4XXq7RyCtzdFURVznSAaUv2adaxAVUUXpL/e6l+yjT0QcgvpDXH7Fk
	cFA4Hg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk559rs0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 13:18:45 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-980a896f53eso3245213241.1
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 06:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788959920; x=1789564720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pkgy+MhX4grX8MkGh52r3vqTjHDSVCmckqvAW7qpwYY=;
        b=FSxiKP6B3totxMZVdfd8D5i+AWTDkSg2sCjTcIOd1+EKH2Gt4KTefC6ThNSlbx5+UO
         E9PJNPtV3yY4JyUKd0HVcxyzSpQ7UnO8PSDGdr4SRpcMFYlwuWHyFDrUoJEnVr+shbnA
         tH9/rpg3ZyZOht0Hmv5Ggz5Y8ODnHFAJTcFPGjgdDpkm2PO1is74F9JNjpSM4+J5u0is
         zPPDfPpn38aI7zjsaySkHvWa7aZ/4Rhw07UemRXFG2/3DwOqzeZRyO6bHajUHZ2SFwjB
         KVsfuKua2Pg3+y7sPrm3kh64tInMpvFceY5mHKDxbzfK1sOz7iJWSRDrNyVKxHOsg6SM
         RrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788959920; x=1789564720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pkgy+MhX4grX8MkGh52r3vqTjHDSVCmckqvAW7qpwYY=;
        b=nuq0iRwCZacayhxt9JnU10qe04AzOGiLxFqq9brEYnKwHJ+VD8y4EgkRjsIX0LA065
         ipIEjd+H4XZs6B3960Ab46oGxXdwYB+mBAoiuaFNpSji98VoaDYIbrxEcE8IndZBsTzA
         eGDzmBhxD2VYRK2aCMTys/99hkd03SDD+zsJgkuJZ/FzxhxQanCOcVUXhIQEjhmeHGeA
         pa5kh5YC1Y7gc/1mYD7RfKyhJYKAFV/qpT4JLzLsSCDXGWBgeOoLnVMW+OuM43QQemPY
         Dx2dwN3H2+Zy9RtrTkq9ceeOxQemlEKbK6vzAW3D8R0o4B9095lTIyznWYs9SYxRj2cw
         S/lw==
X-Gm-Message-State: AFuF++kkC+0cvaWN2kLoNR9RMSLXbzsJKKslx29WBxNxC/bRVaM235/8
	e5GdXnFz+E/aII7sdvL70EAl1uOwTWL6PaGzmnxNwFJQJ6woGdz7MEsXdos7E4Ce+1to1JMFXIf
	cF71+uoE9oLNe8AfJp8mb5S8zipC8R3y6L8re0gKfQkgYHNTPPXLFJM0GH0nQQnhWm5BNw4Wy
X-Gm-Gg: AYBFou0g7mRCDUlrjUIQ4tPvA4l7Quk0KZ7zQ4YmJXUzAQeavcyvZAcU1Obhh7DjPun
	qq2l/+cdIM358q8F2Glqw6we+54Ib3+fnJh2AQaQJuqohMWouX2FXMZCQdCoOXHsIjY7FgtfFH3
	0xEsSlgzV2qrRwsGsJJxoSpo+YTI4ktbMzPXcuHQkn1NQB/6TVQyIUh8PHIgUaMhztnfaQQIBFo
	K7D0AghLbRnqa+25E3pg6k7gh7RmbROYpkvz/cLTL7RW5M+8po6FXuQpeWqaBsfdItZE4mgZiAn
	w+ePA8DFIOOYmvleyO0c8NiybvHw3zOVjfmv6GFQ3YcGfbw5QlaxDh50XOylMKTEWXe3GwKPT2g
	2FkUw1myVeprFKYdZAQOiMpw=
X-Received: by 2002:a05:6102:a146:b0:78e:45f7:54a0 with SMTP id ada2fe7eead31-78e45f7557dmr4508609137.8.1788959917888;
        Wed, 09 Sep 2026 06:18:37 -0700 (PDT)
X-Received: by 2002:a05:6102:2d0a:b0:779:c38e:de53 with SMTP id ada2fe7eead31-78a4aabb603mr18682510137.10.1788959467492;
        Wed, 09 Sep 2026 06:11:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8993253b3sm114594e87.52.2026.09.09.06.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 06:11:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 15:10:41 +0200
Subject: [PATCH v3 7/7] dtc: dt-check-style: Relax property ordering rules
 (drop alphabetical)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-b4-dts-style-checker-continued-lines-v3-7-474bb324ae53@oss.qualcomm.com>
References: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
In-Reply-To: <20260909-b4-dts-style-checker-continued-lines-v3-0-474bb324ae53@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=19738;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P5QjNrk8YCBoewGYIMDFOF+DssUYLxeljDAGYw9Rig4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqoVrUq28GZYGdDB5XHTV0FQTXUcouWoAxdc85C
 YfM0WUgQ1qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqFa1AAKCRDBN2bmhouD
 1+58D/40OIzaOuIfZxShgj3qq6uhRLG7Dk7JLN/DjBoozjn1FxyyyGCOZUs5+EvayYZRJX+1FtB
 cQZV2Ka5ruUiUHY6bz+S6vK1KD0Tkxl8w7wOS54kUWAz0IvsspuSXX1vLUAIKTP6jr7l/pg4wS+
 ITqFFLlRCTRZuo5IpAOYJ6mmBLEkRE1lV1bkUEyVJuh2NClWmZc9ddq4u/2bAGh34j3D4D4iAOE
 FWuB2s3PGb4eZq3tHfFkNFiz2L1wQtTiCEzR1EH8J5im/AZIlkNfO2pDUsdWaSJpNau1z/FwoUk
 +hvzV+NSSkIgOlEgnLogGMt/kVONC3V/8pt9x2joNEyB9XVxkQFo4uPlwRwhObx0C3DjXK3v+Jl
 Q1Ca4Kcc7vQn7akVFPi1M+pwVfRMTqHtMj4DoeptGnnVlu5K5cllUQi8Qx0iARpIF4Eibyh8rhF
 11GRmS8gGUGXuEyQUdjL31SXVk74aZHGlAwlOkQQmHFCvZWg3OQVgkwrfjHaXsIA97wa8W+lLWI
 vt5tUAySYKfrveAfPS26D8QbnX5AMPDd7s75DQAIFZ/N555PYzCx2t9wXQDCMnOw95RL8Coq1J2
 8th7Y+Bu5PQAQvcIdDDtUDo7vsUCYnF7Rkbcj+yrewBTy2l1D7yBSnUXOuicF5dc8i60cVwlS4+
 Gtq99yWs8dYLEYw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=KP1qylFo c=1 sm=1 tr=0 ts=6aa15cb5 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=eho2TGTMVoPlayXLsvgA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 4bSh7athu6Pa4OENfqNOQvTgAS88Q8QA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX0gkb1bgYZxfp
 tQ4EiVKtNmBVdN+qtcTpLInCtH/piP9u5dcchvfx66uoXviMet8hSdXL7ngGyYfnf6GWTRzf3ye
 Jf0VGRVQPGmMgRHGt8f1hm6U8F8207s=
X-Proofpoint-GUID: 4bSh7athu6Pa4OENfqNOQvTgAS88Q8QA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE0OSBTYWx0ZWRfX1zCFKqTxluUJ
 GHwJLuGR5YSErfWQIPTYI8QTrqQw1GOR3spKa0ZSDkRbTSwhPaHNdnjrvMIwEZGpq1RArCgdUBy
 /SEnCdBHIrchDQemDLIfOhzQUY6TAA14qlsooXuAAIqFmKFVyNSgwXa3DxO2aklTB+Q/e8DAbB2
 hMP6/H3bNFG8h2Cm0XrS5e4o07aKv83Fk8Yno3oalV6ECrpkExD9esWQ8FVSJlCjm6484W5K2o+
 eIr7Xzw/gImzrG1IV/y9unC80IKxekyyj468JifflVuM2m9KKMDEFMz5VsV2F2ZZbQsvdnbcklL
 4P8vH9LKi90arVfk+D2T/1LsvmgF7DWC59rrAnSQVHiyvGlFCqlhgCLV8LSSMlLSRrw9/+VJs+S
 B4rY+p/K3VkZK0ez1SCH4p0JVxMHxyHxnZo0EuXVuTPZlOMtx5P+PTf7xa7SiJoyExrOzMnKYDL
 Qf0FeFG18iMAzwWYjwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090149

Existing rules checked whether properties follow DTS Coding Style
guidelines in respect of common properties and standard vs vendor
properties, plus additionally it enforced alphabetical order within each
of such group.

The in-tree DTS does not follow such style at all, so this lead to many
warnings.  There is little value in fixing these warnings, because DTS
with non-alphabetical order of properties is exactly the same readable,
even though DTS Coding Style mentions natural order.  Actually groupping
properties logically, e.g. all supplies together regardless of their
name, is more readable than pure natural sort.

Relax the property order rules to the most important aspects
(device_type, reg/reg-names, ranges, standard properties, vendor
properties, status) and skip the alphabetical sorting completely.

Assisted-by: LLM
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/dts-coding-style.rst       |   5 +-
 scripts/dtc/dt-check-style                         | 137 +++++++++------------
 .../dt-style-selftest/bad/dts-property-order.dts   |   3 +
 .../dt-style-selftest/bad/dts-property-order.dtso  |   3 +
 .../dtc/dt-style-selftest/bad/yaml-prop-order.yaml |   5 +
 .../expected/dts-property-order.dts.txt            |   7 +-
 .../expected/dts-property-order.dtso.txt           |   7 +-
 .../expected/dts-property-pairing.dts.txt          |   6 +-
 .../expected/yaml-prop-order.yaml.txt              |   1 +
 .../expected/yaml-prop-pairing.yaml.txt            |   6 +-
 .../dt-style-selftest/good/dts-property-order.dts  |   3 +
 .../dt-style-selftest/good/dts-property-order.dtso |   3 +
 12 files changed, 91 insertions(+), 95 deletions(-)

diff --git a/Documentation/devicetree/bindings/dts-coding-style.rst b/Documentation/devicetree/bindings/dts-coding-style.rst
index 63648db377e1..441436b7fa80 100644
--- a/Documentation/devicetree/bindings/dts-coding-style.rst
+++ b/Documentation/devicetree/bindings/dts-coding-style.rst
@@ -135,8 +135,9 @@ The above-described ordering follows this approach:
 3. Status is the last information to annotate that device node is or is not
    finished (board resources are needed).
 
-The individual properties inside each group shall use natural sort order by
-the property name.
+The individual properties inside each group shall use usually natural sort
+order by the property name, with exceptions of logical grouping of properties,
+e.g. supplies.
 
 Example::
 
diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 9fcb2eeaf7fe..99b22364d866 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -714,65 +714,40 @@ def check_property_name(ctx):
                 yield (dl.lineno, f'property name "{dl.prop_name}" is using discouraged style')
 
 
-def _property_bucket(name):
-    """Return the canonical bucket index for a property:
-       0 device_type
+def _property_bucket(name, is_root=False):
+    """Return the canonical bucket (group) index for a property:
+       0 device_type ('model' in the root node)
        1 compatible
-       2 reg / reg-names
+       2 reg, reg-names
        3 ranges
        4 standard properties (no vendor comma in #-stripped name)
        5 vendor-specific properties
        6 status
-    Plus a sub-key inside the bucket for fixed slots (device_type, compatible,
-    reg, reg-names, ranges, status). 'standard' and 'vendor' return None for
-    the sub-key, signalling that the within-bucket key is computed by
-    the pairing rules."""
+    Properties sharing a bucket compare equal: their relative order
+    within the group is not checked, only the pairing rules below
+    apply."""
     stripped = name.lstrip('#')
-    if name == 'device_type':
-        return (0, 0)
+    if is_root:
+        if name == 'model':
+            return 0
+    elif name == 'device_type':
+        return 0
     if name == 'compatible':
-        return (1, 0)
-    if name == 'reg':
-        return (2, 0)
-    if name == 'reg-names':
-        return (2, 1)
+        return 1
+    if name in ('reg', 'reg-names'):
+        return 2
     if name == 'ranges':
-        return (3, 0)
+        return 3
     if name == 'status':
-        return (6, 0)
-    return (5 if ',' in stripped else 4, None)
-
-
-def _property_bucket_root(name):
-    """Return the canonical bucket index for a property:
-       0 model (for root nodes only)
-       1 compatible
-    Plus a sub-key inside the bucket for fixed slots (device_type, compatible,
-    reg, reg-names, ranges, status). 'standard' and 'vendor' return None for
-    the sub-key, signalling that the within-bucket key is computed by
-    the pairing rules."""
-    stripped = name.lstrip('#')
-    if name == 'model':
-        return (0, 0)
-    if name == 'compatible':
-        return (1, 0)
-    if name == 'reg':
-        return (2, 0)
-    if name == 'reg-names':
-        return (2, 1)
-    if name == 'ranges':
-        return (3, 0)
-    if name == 'status':
-        return (6, 0)
-    return (5 if ',' in stripped else 4, None)
+        return 6
+    return 5 if ',' in stripped else 4
 
 
 # Declarative pairing rules: each is a callable
 #   (name, all_names) -> anchor_name_or_None
-# If a rule returns an anchor, the property sorts immediately after the
+# If a rule returns an anchor, the property must be placed after the
 # anchor. Rules are tried in order; the first match wins. If none
-# matches, the within-bucket key falls back to natural sort by the
-# #-stripped name.
+# matches, the property can be placed anywhere within its bucket.
 
 def _pair_pinctrl_names(name, all_names):
     """pinctrl-names follows the highest pinctrl-N in the same node."""
@@ -787,8 +762,7 @@ def _pair_pinctrl_names(name, all_names):
 def _pair_x_names(name, all_names):
     """Generic <x>-names follows its owning property. The owner is
     usually plural (clocks/clock-names, dmas/dma-names,
-    resets/reset-names) but occasionally singular (reg/reg-names is
-    handled by the fixed slot above; this rule catches anything else)."""
+    resets/reset-names) but occasionally singular (reg/reg-names)."""
     if not name.endswith('-names'):
         return None
     base = name[:-len('-names')]
@@ -812,33 +786,27 @@ PAIRING_RULES = (_pair_pinctrl_names, _pair_x_names,
                  _pair_address_size_cells)
 
 
-def _property_sort_key(dl, name, all_names):
-    """Sort key for a property among its node-body siblings.
-
-    Format: (bucket, within_key, tiebreak). 'within_key' for
-    standard/vendor buckets follows pairing rules: a property paired
-    with anchor X sorts as if it were X with a higher tiebreak."""
-    if dl.is_root:
-        bucket, fixed_sub = _property_bucket_root(name)
-    else:
-        bucket, fixed_sub = _property_bucket(name)
-    if fixed_sub is not None:
-        return (bucket, (), fixed_sub)
-
+def _property_anchor(name, all_names):
+    """Return the property this one must be placed after, or None."""
     for rule in PAIRING_RULES:
         anchor = rule(name, all_names)
         if anchor is not None:
-            return (bucket, _natural_sort_key(anchor.lstrip('#')), 1)
-
-    return (bucket, _natural_sort_key(name.lstrip('#')), 0)
+            return anchor
+    return None
 
 
 def check_property_order(ctx):
-    """Properties within a node body must appear in canonical order:
-    compatible, reg(/reg-names), ranges, then the standard group, then
-    the vendor-specific group, then status. Inside the standard and
-    vendor groups, pairing rules apply (e.g. <x>-names follows <x>);
-    everything else falls back to natural sort by the #-stripped name."""
+    """Properties within a node body must be grouped in canonical
+    order: device_type ('model' for the root node), compatible,
+    reg(/reg-names), ranges, then the standard group, then the
+    vendor-specific group, then status.
+
+    The order of properties within one group is free, e.g. it does not
+    matter whether '#address-cells' comes before or after 'clocks'.
+    Paired properties still keep their relative order: <x>-names
+    follows <x> (clocks/clock-names, reg/reg-names, ...), pinctrl-names
+    follows the pinctrl-N states and #size-cells follows
+    #address-cells."""
     lines = ctx.lines
     for i, dl in enumerate(lines):
         if dl.linetype != LineType.NODE_OPEN:
@@ -856,16 +824,26 @@ def check_property_order(ctx):
         if len(props) < 2:
             continue
         all_names = [p.prop_name for p in props]
-        keyed = [(p, _property_sort_key(dl, p.prop_name, all_names))
-                 for p in props]
-        for k in range(1, len(keyed)):
-            if keyed[k][1] < keyed[k - 1][1]:
-                p = keyed[k][0]
-                prev = keyed[k - 1][0]
-                yield (p.lineno,
-                       'property %r out of canonical order '
-                       '(should sort before %r)' %
-                       (p.prop_name, prev.prop_name))
+        buckets = [_property_bucket(p.prop_name, dl.is_root) for p in props]
+        findings = []
+        # Group (bucket) order
+        for k in range(1, len(props)):
+            if buckets[k] < buckets[k - 1]:
+                findings.append((props[k].lineno,
+                                 'property %r out of canonical order '
+                                 '(should sort before %r)' %
+                                 (props[k].prop_name,
+                                  props[k - 1].prop_name)))
+        # Pairing within a group: the anchor must come first
+        seen = set()
+        for p in props:
+            anchor = _property_anchor(p.prop_name, all_names)
+            if anchor is not None and anchor not in seen:
+                findings.append((p.lineno,
+                                 'property %r must be placed after %r' %
+                                 (p.prop_name, anchor)))
+            seen.add(p.prop_name)
+        yield from sorted(findings)
 
 
 def _check_redundant_whitespace(dl):
@@ -1161,7 +1139,8 @@ RULES = [
          'property names use only recommended characters (see DTS Coding Style)',
          check_property_name),
     Rule('property-order', 'strict',
-         'canonical bucket + pairing + natural-sort order of properties',
+         'canonical group + pairing order of properties (order within '
+         'a group is not checked)',
          check_property_order),
     # See also check_redundant_whitespace() and check_value_whitespace()
     Rule('redundant-whitespace-strict', 'strict',
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
index ebe561e38766..eb36daa4fe72 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
@@ -43,6 +43,9 @@ interrupt-controller@10000 {
 				     <4 5 6>,
 				     <7 8 9>;
 			compatible = "example,intc";
+			qcom,calibration-variant = "foo";
+			clocks = <6>;
+			qcom,opp-fuse-level = <1>;
 		};
 	};
 };
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
index 64604fa6b8c3..b2e564f2af2b 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
@@ -44,6 +44,9 @@ interrupt-controller@10000 {
 				     <4 5 6>,
 				     <7 8 9>;
 			compatible = "example,intc";
+			qcom,calibration-variant = "foo";
+			clocks = <6>;
+			qcom,opp-fuse-level = <1>;
 		};
 	};
 };
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
index bf1480e97209..4d8a50d0e35a 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order.yaml
@@ -26,4 +26,9 @@ examples:
     device@1000 {
         reg = <0x1000 0x100>;
         compatible = "example,test-prop-order";
+
+        interrupts = <1>;
+        qcom,calibration-variant = "foo";
+        clocks = <6>;
+        qcom,opp-fuse-level = <1>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
index 0ab832ccf07a..155b072f0ac2 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
@@ -6,6 +6,7 @@ bad/dts-property-order.dts:21: [property-order] property 'device_type' out of ca
 bad/dts-property-order.dts:30: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
 bad/dts-property-order.dts:35: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
 bad/dts-property-order.dts:45: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
-bad/dts-property-order.dts:50: [redundant-whitespace] extra whitespace before {
-bad/dts-property-order.dts:52: [property-order] property 'model' out of canonical order (should sort before 'compatible')
-bad/dts-property-order.dts:57: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dts:47: [property-order] property 'clocks' out of canonical order (should sort before 'qcom,calibration-variant')
+bad/dts-property-order.dts:53: [redundant-whitespace] extra whitespace before {
+bad/dts-property-order.dts:55: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dts:60: [property-order] property 'model' out of canonical order (should sort before 'compatible')
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
index 9f2a00916329..48c020d21b64 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
@@ -6,6 +6,7 @@ bad/dts-property-order.dtso:22: [property-order] property 'device_type' out of c
 bad/dts-property-order.dtso:31: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
 bad/dts-property-order.dtso:36: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
 bad/dts-property-order.dtso:46: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
-bad/dts-property-order.dtso:51: [redundant-whitespace] extra whitespace before {
-bad/dts-property-order.dtso:53: [property-order] property 'model' out of canonical order (should sort before 'compatible')
-bad/dts-property-order.dtso:58: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dtso:48: [property-order] property 'clocks' out of canonical order (should sort before 'qcom,calibration-variant')
+bad/dts-property-order.dtso:54: [redundant-whitespace] extra whitespace before {
+bad/dts-property-order.dtso:56: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dtso:61: [property-order] property 'model' out of canonical order (should sort before 'compatible')
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-pairing.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-pairing.dts.txt
index dad3d8485012..976471ca8068 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-pairing.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-pairing.dts.txt
@@ -1,5 +1,3 @@
 # mode=strict
-bad/dts-property-pairing.dts:21: [property-order] property 'clocks' out of canonical order (should sort before 'clock-names')
-bad/dts-property-pairing.dts:25: [property-order] property '#address-cells' out of canonical order (should sort before 'interrupts')
-bad/dts-property-pairing.dts:27: [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
-bad/dts-property-pairing.dts:28: [property-order] property '#size-cells' out of canonical order (should sort before 'pinctrl-0')
+bad/dts-property-pairing.dts:20: [property-order] property 'clock-names' must be placed after 'clocks'
+bad/dts-property-pairing.dts:26: [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
index 578df7209170..bb0dd5db5135 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/yaml-prop-order.yaml:28: example 0 [property-order] property 'compatible' out of canonical order (should sort before 'reg')
+bad/yaml-prop-order.yaml:32: example 0 [property-order] property 'clocks' out of canonical order (should sort before 'qcom,calibration-variant')
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
index 025ec872f1b0..dcdee1cff506 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-prop-pairing.yaml.txt
@@ -1,5 +1,3 @@
 # mode=strict
-bad/yaml-prop-pairing.yaml:30: example 0 [property-order] property 'clocks' out of canonical order (should sort before 'clock-names')
-bad/yaml-prop-pairing.yaml:31: example 0 [property-order] property '#address-cells' out of canonical order (should sort before 'clocks')
-bad/yaml-prop-pairing.yaml:33: example 0 [property-order] property 'pinctrl-0' out of canonical order (should sort before 'pinctrl-names')
-bad/yaml-prop-pairing.yaml:34: example 0 [property-order] property '#size-cells' out of canonical order (should sort before 'pinctrl-0')
+bad/yaml-prop-pairing.yaml:29: example 0 [property-order] property 'clock-names' must be placed after 'clocks'
+bad/yaml-prop-pairing.yaml:32: example 0 [property-order] property 'pinctrl-names' must be placed after 'pinctrl-0'
diff --git a/scripts/dtc/dt-style-selftest/good/dts-property-order.dts b/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
index 3d847cc9fa3e..288fcfb9888f 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
@@ -40,7 +40,10 @@ soc@0 {
 		interrupt-controller@10000 {
 			compatible = "example,intc";
 			reg = <0x10000 0x1000>;
+			clocks = <6>;
 			interrupts = <1 2 3>;
+			qcom,calibration-variant = "foo";
+			qcom,opp-fuse-level = <1>;
 		};
 	};
 };
diff --git a/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso
index 5ae78541f68b..60c68b3f908a 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso
+++ b/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso
@@ -41,7 +41,10 @@ soc@0 {
 		interrupt-controller@10000 {
 			compatible = "example,intc";
 			reg = <0x10000 0x1000>;
+			clocks = <6>;
 			interrupts = <1 2 3>;
+			qcom,calibration-variant = "foo";
+			qcom,opp-fuse-level = <1>;
 		};
 	};
 };

-- 
2.53.0

