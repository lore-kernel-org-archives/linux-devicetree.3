Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422508;
	b=5JQnFoE6iTeyaaEHNmDW5UmXCIKsBsIt0srsJuQkD1GKtTKSlGG3/xqEcLTd18n4wSJu
	 A8lCdceqd2lA5lep0FvrVu/bBHje4v/WQsFBVT9QkUDtKinz07/tNSCP84A6v+uMsmrTS
	 Guy5rD/2LZDYeHTxiMzJJmhrqUdC/RDEICBwY8zbclQJ6yNDcK32yV9RC6HAwCjOo3R2d
	 z41CxGT+i02NPuMlOlAQm//2ja2yzIt8d75kUwmHRO+FwexEU63a3t+fAEwZsZqvm2uz3
	 cVUnlhFpCGgOaZAlerxFo2ZVRdtzHzD4c7rPwudbGrJ3vdfeA5f84yfb2CNLkVvm0JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422508;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Jg/KTHFOBtwtde44/snwUiVpXPFhDH7Xp3dRiaUBRFU=;
	b=qALOG8uH8uMEklftwAS/adLT8mHA8doReb79hvHiZD6GWMcKyVAm3DdR9uGPdTh/fXPu
	 Mbj4aSYnV5lCaZ5L4NyLleNgXQPkQxZSdjdbwoBsh8UoiWxVFswLOapF3cYKzzY7qjH8M
	 b0POACAE5P+8H9rL/ZxxFyxjJs64HdsGpRDY0CaFUSa2wNLZAYKNe8A0k1lsSk1z48uU+
	 wuuBbrLx0k7vWJ0gV/qxDP50HHLuUdZkoHNoq7XtN6ctEnkIaQlaUCVDbuQEQF0SAWDeM
	 /zyAfN2NO411kcDUHnWUEMMCl4PjPG4N+a0OF1MZme9fKaXILVotDUZIOevkC7HVcQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aozHOBGU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hoYbTMm5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58ED606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B58ED606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aozHOBGU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hoYbTMm5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABIZ5Qm1490695
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Jg/KTHFOBtwtde44/snwUiVpXPFhDH7Xp3d
	RiaUBRFU=; b=aozHOBGUpotbI5H45FA16Ct8GPJHKSwuKE9emudKv2Fqyhuy9xo
	1sTXNLDwL511IwuQDNAe2qeq62JpCv6l9K2hMKOwy4MZozPaVODHmrQdnx34nFcv
	4G+4kszy4GUuf+iyHgaGRkEIiq7Xh82aT4Fax0La/bnLJ3WXavxCJ991n/sc230x
	gmYnl2Y83JDAD0fprztPs0Nyqbelz+p4wbmhQ+YFTL5IWBuk9miegFpk8vwK9eU/
	8AdbRfa0nWOC/2CZ3ohDb9IAJwBMsLVyQj0wMUiMmXmMNHGhUsXbf0dlE6Kf+JO0
	+NPMUScWkU8XerJEXCmOA6Nw+sb0qPTvmvg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1r1x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 18:41:46 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99b715e4f44so1327690241.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 10:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794422506; x=1795027306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jg/KTHFOBtwtde44/snwUiVpXPFhDH7Xp3dRiaUBRFU=;
        b=hoYbTMm51oHrqKLO+zbQSVvbViGj3bYiCLYYruxQIJBF67ttZIs5I2On6Qxz95K1CX
         Hh7fwHXoKt2OKRcNs8slKqSs2nESSJOxYMYnDjkb7rVPKydy93WkfL9ZljlTf22CYajj
         yMhk8KTNZIS5DEcktXXijnPBRlAOe9zW5gViZGQwW5AgSAeH+dMDdnxMpDkk3KBUHTYR
         xGAIB6Bk/L5DbkMryiuzpKqSrkzePl0yBF6aCPCHN81ZywpjeXlKvfJG3xW9AHT7e6ic
         KciCXch19v8r05dVuI9Uyh4p8ekKGut6ZrYrJWBBZCVBGOks2ultHnejf13InBZZimws
         yP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422506; x=1795027306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jg/KTHFOBtwtde44/snwUiVpXPFhDH7Xp3dRiaUBRFU=;
        b=nrXpZiVkBNzoKCYpoSnh/QuDp3c8TPj67rxjdQFOCwjLMV0wEa9fzmaClS2gxtfA2b
         /FjRltnZrNNMlUTfD7AXlC9uG6ZJkWp0TRFdbBUu9gRdC+WQgUxOh0JXowiXMRhMj8oA
         sSn1r36dj9/UtuWzwE+SEyMXoahFozHX1WpC6bGJn4zO5EK6CRDGzLZ8IFk3IJh/0h2y
         2kDH7KqsnJf+Vz5rI6hrC8aRd9gcj8/lWo7ZiF4TXudVFWGJDk8m9sFwsxQmKrYIWNRb
         hoYTec6DrsGbQAWIbYinQCv0/YRsonAZYwfu7jZE56XvqpMX+0BD7WNdsDi2RbrC2CgY
         sMuA==
X-Forwarded-Encrypted: i=1; AL+hErE+ASw8dtLBLyOUdUjMm0xAFF7j36qwVrjyieMfinjF6yudIdfLOjefNrRYstjffsB9LdIMlWA+KZO1@vger.kernel.org
X-Gm-Message-State: APuU4Z/pFMtlC2IFOzodQKWoM9+LjYB7L74ZwnIY/x0RZCihUBBtwUZ6
	gxDBJFtHNvaXryM47vnZ0akTYVI244J3yP1TyB9cikGNWHhvh6F4RnYsAoOxOfUZS+7t+MLWZN6
	u3Vp2HBeDdglDwXfBZiattq95svva3Hl/+2d49jDm3NOyxj9MojCbP7NeMCY4ncBU
X-Gm-Gg: AYBFou0Y+y1ncv6iCP+YedtiHK6sr5hAOreEY8u8GU+EzGOq2G3Fb5+xEjfcQvPcnV+
	yzMZm3fzzO9RsKujDCt/DwRmdEw3iAjqPDhedEDGkMiWvJRPFV2ss10Q+VKvXbECzZkFS/vzBuf
	uyPOlA+ovUO1DtrCnR3rA4DuPLTdJ4j0ZlSxI61kzN+rLX/VtVd/uQtttMKMOTmVGrbHwaRlZKt
	ckL126QBG497WTLvDwucmNWtKbFb/1Un8Ksvntu/Ktlfeld1LSB8bvYb5kpqFeOZYoOFQ6qsenK
	epspO+hyhO9OF4THOip/8T5kTFAFPAcEKYUgNmhVR7ZTqvDkIV5vc5rOkTXVRZHrNrIpQeW3Jjx
	xk17pisq1XDUispRvsl5aSkCu871uuEZ5dbTUJLqDvqNm1QOovzf3SVZjxKermA==
X-Received: by 2002:a05:6102:160b:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7d4fb28a79emr1229655137.15.1794422505618;
        Wed, 11 Nov 2026 10:41:45 -0800 (PST)
X-Received: by 2002:a05:6102:160b:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7d4fb28a79emr1229645137.15.1794422505132;
        Wed, 11 Nov 2026 10:41:45 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm7705105e9.10.2026.11.11.10.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:41:43 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3] dt-bindings: example-schema: Show example of dependentRequired and dependentSchemas
Date: Wed, 11 Nov 2026 19:41:40 +0100
Message-ID: <20261111184139.205114-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2884; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=gyLLVdP+Ex8SA/ryo3pBJ0ZHnPJrA+/PevPf700KBjQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq9LbjqHENkruDW1hjWni3IK1CvXaIsF8NN/joL
 JyAgqVlpHmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavS24wAKCRDBN2bmhouD
 15dzD/9I9mzq+MaPTvPb/PJz7fBrPUS9ipgdI6QddKep4z/xAw54j1RHuxgkOmqBLwDgfB6C6g+
 sED27F9gA5DM1L7D4kOnYEDx4bt7sQ05tfvh7slEMZKDk9fc4FEdo54R163O/jP9PRj0c4jri6D
 qRQq8TKFs/B/F68nv/qkjNtxeB3qQMtl0PaEAiACOUzvQNOI8A6e61l4PDxs8fgZcfadCiKBeyy
 RBPtqUZ4fLmGrjpQka34i8rXegFUwYRUNn0gBQXsFOWt1x9AxZbB1uwnyGnL2lLjvJb5UU+np34
 S/BMvk0YCyRHzx4PrfVdk8zkToVZ4xx0a5mDatFdoXWQZqyyRouWfdEKBQ4xOuwofnv2EFlQuOV
 u4V/E9GZ/5rSd5F+Zp+jvpEvrnUkx40uedrh6B+QN/tLMSCus72cGih3dGqPmHJLQoiYRNNBnpg
 4+MlA20g7FvcUsjTIj9gRsraFyCFGSrWfyzhAlh22RxXdXoTTznp2dk4VTvmVvHGe/vp3tjXKe7
 TqvYcT9SX9Sdck1pYRebMuW/zM2KOvD7jvD9fD2WIhsH2730aXx+MRFKB4U8HQyjiTvJi7x49YP
 1/B2Uq+QPB8H7wM2U/5zXU/v23DzqoYi+QiUdr+xyOyRT0MpUvskP5SW6mqKR7SLlSCH9GX9PY+ vgORrqLhGDw+xhA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af4b6ea cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=3XJjmg7gPLNQuPhX6QIA:9 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: w6Ke1rPy7pGhmsdvy8lI-kFwBMne_xxG
X-Proofpoint-ORIG-GUID: w6Ke1rPy7pGhmsdvy8lI-kFwBMne_xxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX0xtfSUK/Rf3J
 iHOu13DHLxFoGa//MhpYeXfUAkKkFNcSWm+SyoEfu/kX/t2utRpKruXsQPcCU04taD3JmhmwxOu
 Rz6C63yv6g3c2f5Q58WVweXnXYA4kK75A8cQ1ioVYlX84VZhfvWQ9r7S0IrRtnxRALQiOVh0h0p
 PqBV+YmBBDUi5lqPMW1LOonlVWR1KggrSVYGBN3LCNXEdsGlcaCbjHwwzs4lLYuE84vOIOTlcdH
 abq2ZMcWlRxqEJ7S8bT7uSKwYF6TxEtkRunBGV+Gm5wm/OPfZeAUmldtLtiEVeSoU1p9EPljgcZ
 x6gw0gtSHAkAXwFaNOwL4B/nyISHNBMdkw6EGV6G+qtF1OilNhkEd1YR3oK6chiDiaE+yg5YXOn
 PwPFDC1/e9IVg92J8aQgREfOBlkCQISrMZEWj8cQsTbxwhAedRftkdZjVUba2ZPj6SEJyOy0+R2
 SlAqLds/10a3x6nnccg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA3NCBTYWx0ZWRfX+WNajqRAtGvl
 u2AgjCjna8CJjKB1SdToAkoms2pgc0kHCiCQQ9EDVZp9s6Uff7nddigHgIZ231IBKtg0MvJFULV
 SmYS++smvXGkqjM1Af6uXNKLJU5Ixow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110074

Document example usage of dependentRequired, a shorter and preferred
form of conditional property requirement over dependencies and
if:then: block, and dependentSchemas replacing the if:required:then:.

Place both after the "required:" list.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. Replace existing dependencies and add dependentSchemas

Changes in v2:
1. Use clocks/clock-names in the dependentRequired, to avoid conflict
   with existing foo-supply constraint.
---
 .../devicetree/bindings/example-schema.yaml   | 33 ++++++++++---------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/example-schema.yaml b/Documentation/devicetree/bindings/example-schema.yaml
index b04f3cc4312c..801677a13755 100644
--- a/Documentation/devicetree/bindings/example-schema.yaml
+++ b/Documentation/devicetree/bindings/example-schema.yaml
@@ -202,8 +202,17 @@ properties:
       compatible:
         const: vendor,sub-device
 
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-controller
+
 # Describe the relationship between different properties
-dependencies:
+# Properties might be required only if some other property is present.
+# dependentRequired is a shorter and preferred way to express this, instead of
+# "dependencies" and if:then: block.
+dependentRequired:
   # 'vendor,bool-property' is only allowed when 'vendor,string-array-property'
   # is present
   vendor,bool-property: [ 'vendor,string-array-property' ]
@@ -211,11 +220,14 @@ dependencies:
   # must be present or none of them.
   vendor,string-array-property: [ 'vendor,bool-property' ]
 
-required:
-  - compatible
-  - reg
-  - interrupts
-  - interrupt-controller
+# When given property is present, entire object must also validate against subschema.
+dependentSchemas:
+  vendor,bool-property:
+    # If vendor,bool-property is present, the vendor,int-property accepts smaller
+    # set of values
+    properties:
+      vendor,int-property:
+        enum: [2, 4, 6]
 
 # if/then schema can be used to handle conditions on a property affecting
 # another property. A typical case is a specific 'compatible' value changes the
@@ -238,15 +250,6 @@ allOf:
       # If otherwise the property is not allowed:
       properties:
         foo-supply: false
-  # Altering schema depending on presence of properties is usually done by
-  # dependencies (see above), however some adjustments might require if:
-  - if:
-      required:
-        - vendor,bool-property
-    then:
-      properties:
-        vendor,int-property:
-          enum: [2, 4, 6]
 
 # Ideally, the schema should have this line otherwise any other properties
 # present are allowed. There's a few common properties such as 'status' and
-- 
2.53.0

