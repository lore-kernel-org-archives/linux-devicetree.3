Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C972E37A83C
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727980; cv=none; b=AK8cWRxEk8wA6pHzpAOBYQYQmhn0awvNLbA54GW/yov11ljkBy5RkP0I0+9LlvILu9W2jxXhCSxriNiTIGBWaQC16VE/HJqsbvt+L6tG6w0piOB3XrEjliiVEuZeAX+Samt2S4Sndz/+hOwMs5zMkvu2C8FZ8UISRUyWViUAleU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727980; c=relaxed/simple;
	bh=OUabwSWfavIXTw2drr/3+VZk+1cyKQHSZ5mqfGkS/zI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=acnqeI4Kr2rvyYNNg6yVErEIuRVHSuCIBykiQvhew/uS+MTnYrGUvyxRJXu7wjT3uzB8uIj3cd4bel3LDH9bYC3wP5XDg1qZwEDdreBdsKAH69tbWeX3rzMQIugqzkvqShb9lV6u9NVZIfd42A4Tk/VNDimIfIzOiwvN6cvH7Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oFIMXs5N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYwPVrh5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oFIMXs5N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYwPVrh5"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RobD3124008
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pp4R1J8z0f93FKYvJQw79hTGJ2FR4gYrN4MAKLImV5Q=; b=oFIMXs5Ne0V5vFSp
	O/5JM/QKki25hld4nD3C5zZfV0TdQRp5oTFHE7LV/ALOGp+vRSe9nUobSTqntLCn
	lw7myg0kXF2cfaBMVwi5nOyilRn/Nyb7m4sB0/CpMXhjoyUn52OHlog1iYOSWMoN
	gvffisQiwkTCXHLac5IVixYYPSeRpaAdiDuYWDt4IQlwCtsNFviCrkP+v8Mvnfpe
	1YWD2GdTW8cgUHPS1WYPA4VQ8egHdfN7ylWPW9XlbmY0y6kFGsvVIGJyYsSgitSC
	AEqBDsUDJLNdPjqzq3cyifb3y9LTK/fC3WcayGfL9tkLjUJ5//9axJjP10nt0CA1
	dprwOA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9f9utjgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so6632581cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727976; x=1788332776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pp4R1J8z0f93FKYvJQw79hTGJ2FR4gYrN4MAKLImV5Q=;
        b=PYwPVrh5uxJr0ITD9JDDpWGOIlXQzO3j3JrKY9b6OL5ee6UibwD1nrBVHBB3FYo9wV
         HQ485tUBKZK8rl95+45jHjIRzRBsQX27OPHm03hqEdPFIvNFstCcPZdpjH42cgpEux0p
         o4Gc5othYbCVr/NJt0V9Nai6M9NBJyH/qinirvfHqnGEgkdZ7GXINkjlnAdaNXVUCZZC
         yzUD9cQDaUw+th3cUPGoqnuMCzyTR5NywrDb2PObZhnve987rBKw87Akeu99KqEev+fd
         AckkG6rDnGGcW/90oyzNrFR91RZbL0Efp71Tu/X12NQnMwo8v3GIniwOKlUfkmaBCurA
         QFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727976; x=1788332776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp4R1J8z0f93FKYvJQw79hTGJ2FR4gYrN4MAKLImV5Q=;
        b=ZQKjG+22vQbAQthkaLIM5p45gGcT/B7jieONwuC5+X2G0IqNOLx8Y6muWjgpPBxemu
         DSM5VJHjCzdZTL3P2HilGmDmvkjRiOV3MnnnEU4LGTdctVO5Zcz+objKnw4mJMhfN7Y3
         m/PgkMcJgt2F/4H8xWdHdf+4BiaMD5N/tWczvG3xXcOgmLJAOjfNA/gKXHOaKp1uUT/D
         PoqO7dslslnpitnej4q1/pEhltXAcFz2op3XyvpqB/SfKrUkUGkQ2rBb02iKIBFOBsjC
         3zXd7FEj/iTqg967PjvkwbBuDx2rV9NBAqzzK18ttwRpe3pL6pw//aGVmgK5qZqKAjeL
         nNXQ==
X-Gm-Message-State: AFuF++lTDsGLvO+yqYG2G0zKYyZSjzS7IliKaexOuwsXAigs9oBTSh3G
	ZNpG/MpAw4/foAkutGBetFVLDAD+9C8Qp4Ncw3/86/1+xgguuu+r+AtiKK6MhFxpXOkva4JYUDm
	QNr8JjSoS3pW3iaJzCTJpH3LksAoWY1PJ8e4BzoEdPq7RmrS2gOiwh3agh1RZyu63
X-Gm-Gg: AR+sD13QKvWjIa49KvwQoKgXLudrCHJ9ygtbNYMbtTIf1ZHezsNVpUxcoP/7HpitGGl
	gB3cSRhqADQUNyOMsfjJbiVHcOyepmi5ILzuALwd/rHF9MfqEdbYXzqDjYxKmmHEPeZUFMtsmBk
	SsDbN6wUkZhqWLnx0RR4SFn8fYIUZsN7fuMenG3JB8qxMQvUT5C+lle4V+xTDgMl0lSVer2qPbs
	WllYe6YKV0OiuWty+Q5Dhid7Q0uVI56fRefl+300zA+UtjyDpAsCf1LEMk/AhuV1r/e+pP3Fg1W
	JTcOCXpgE8kN7RaSh6QFK/ch3Acq2d45t/TPFmjpibz72hLx8fx32D69PN5rzZx+43Ndg81v0UY
	yro1e/2K+ldIBVetNuZM6Ki4=
X-Received: by 2002:a05:622a:4d94:b0:52e:2d19:b665 with SMTP id d75a77b69052e-52e422b33c5mr50008271cf.15.1787727975621;
        Wed, 26 Aug 2026 00:06:15 -0700 (PDT)
X-Received: by 2002:a05:622a:4d94:b0:52e:2d19:b665 with SMTP id d75a77b69052e-52e422b33c5mr50007641cf.15.1787727975120;
        Wed, 26 Aug 2026 00:06:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab82sm366812966b.31.2026.08.26.00.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:06:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:05:54 +0200
Subject: [PATCH v4 01/10] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v4-1-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=28301;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OUabwSWfavIXTw2drr/3+VZk+1cyKQHSZ5mqfGkS/zI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjpBZe+N2MopBa7iBepqv9mLYK4nGBTmPsXkc7
 uJgjcTYXf+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6QWQAKCRDBN2bmhouD
 14BOD/9k820jm1urQ+gwbO+XEKSJz6lEM3+IpKf5Zgg+WgHg/AKs0Gd2QWz+8iXA3b2YeqsKiOl
 oU8d0OHvKAjzO+6kSElCiJlsuLkBk/zI3cDNDXwvreOv76+cFHb+N//DQkuW6GyjUaYzN7utPGy
 YQ8teK2EsItFEJDG/9FiBiAg4H2FhGRFAsfaeOsfv08q1VnM9+8zPf8KHNIIr3n3vjnxAJ8/JUI
 JCVmSskG1RHU0QU7aY4ev6BeCrorAym1fpn8G6v5zppIwPLlG2GwVnULpGTsPO6Yj1COaIVQRr7
 1CYIUlFXAwnuRiWTn2ZxW8z6cUnrBFyVK6Aq9BUKKrXUOKeCiKWxJ+2KDbP4dAko9J1O8bXTY26
 JhI8KeOJkY5FFkUyGo25vZD19Jy493JaOvcvlxyYc2ol54nSWQsAFHaxQ5MKfLZ4Sm4d8A66lAt
 738xgmLdhuYHtgw88VlJz5BcKo6U9oaRBEwwLERqJR4D9EP+t2X9zWP4mm88KJWOP4W9bVTGaaM
 Zq44TrwzfQKOtkS7iD/zi7UwpKy9iuK7bSi7qbEMUnI6bJXdrhPZW3uSXnfCNRW2Vlp4WTL991A
 uqbVZjWKWFsb3JghCLsZlrqjM1u5rNDdWOnftz/jWePAwUkikLeHpy0i1Nl06YaDEqKLtiQ6344
 38Uye55Cmiwl28w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: R2EhkoKv-fUtuiGmyxz8jD3Ch1XiKPlm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX79rCxq/oac0D
 pbgn50yW0bNpo6Mbpx3DDX5WoExsqJu/VD+hIoURqP3gPHd8a6MsnYegqvgmuTm04Z/0Mbi5vKS
 ny7MHq6Qu+AwXBjV8XNItKd/kGFp0Y/U8/jCEn4VEzsj0ENkMpsPVeVsJbo9W1VeqYTWxIZQSYB
 vOG/snS/TL44rCFy8VCJXoUJkxbUuP1ExK0EdWDM4SRPjHZmVHR/NJWlegfDCo/3gpdGevUh4m1
 LQnuTvj9uODgOJckVeiZeUjyZSxD+i4krbRE/RnDy1kRsdr7J/O8dCcV63jh0aC6kQLeeiObl5O
 8U79a5QQ1ROwItKG4k/N5nzuQUTAmNV5CFETimcoUcgIwDqAtyvv2vD8Zmn/d78zyiiFh1MKx3m
 f188d6+djQZKcKKDjDpsNpdBWvUFqcWucjtTbi6fFnCR3pKiOTyq4tNdtDCcoXX9nr6h78KWk8j
 /gb2oooijxdy7pdhhCw==
X-Authority-Analysis: v=2.4 cv=acNRWxot c=1 sm=1 tr=0 ts=6a8e9068 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DEs8lHOyw9br0RGUMqIA:9 a=CL4GF0xxeNQD7lhm:21
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfXzABG+ndfFmM/
 TBHsszIgeBIdjHRREx+HKJPR9uGwH4Pza4EhCmCxvCowjrEKmri0Q7ic/etahGnOLYK+NUcLXhk
 7BECo2xcm3KlLyE52Nc84lxdKghzpXI=
X-Proofpoint-ORIG-GUID: R2EhkoKv-fUtuiGmyxz8jD3Ch1XiKPlm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260058

Top-level DTS (but not example in the bindings) has only two nodes with
unit-addresses: memory@ and soc@.  There are two special cases here, in
terms of coding style:

1. The unit-address of memory is often not known thus set to @0, because
   it is filled up by bootloader.

2. There is mixture of non-unit-address and unit-address nodes.

Therefore usually the DTS chooses for the top-level part sorting by the
node name, not the unit address.

Also the properties have one exception: 'model' property is supposed to
be before the 'compatible'.  This cannot be applied to the entire DTS,
because sound cards have also 'model' where it is supposed to follow
standard rules (after the 'compatible').  Root node is just special.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 70 ++++++++++++++++++----
 .../bad/dts-child-name-order.dtso                  | 33 ++++++++++
 .../dt-style-selftest/bad/dts-digit-node-order.dts | 40 +++++++++++++
 .../bad/dts-digit-node-order.dtso                  | 41 +++++++++++++
 .../bad/dts-extend-node-child-name-order.dtso      | 26 ++++++++
 .../bad/dts-extend-node-digit-node-order.dtso      | 34 +++++++++++
 .../dt-style-selftest/bad/dts-property-order.dts   |  7 ++-
 .../dt-style-selftest/bad/dts-property-order.dtso  | 49 +++++++++++++++
 .../expected/dts-child-name-order.dts.txt          |  1 +
 .../expected/dts-child-name-order.dtso.txt         |  3 +
 .../expected/dts-digit-node-order.dts.txt          |  2 +
 .../expected/dts-digit-node-order.dtso.txt         |  2 +
 .../dts-extend-node-child-name-order.dtso.txt      |  2 +
 .../dts-extend-node-digit-node-order.dtso.txt      |  2 +
 .../expected/dts-property-order.dts.txt            | 12 ++--
 .../expected/dts-property-order.dtso.txt           |  8 +++
 .../good/dts-child-name-order.dtso                 | 44 ++++++++++++++
 .../good/dts-digit-node-order.dts                  |  3 -
 .../good/dts-digit-node-order.dtso                 | 59 ++++++++++++++++++
 .../good/dts-extend-node-child-name-order.dtso     | 26 ++++++++
 .../good/dts-extend-node-digit-node-order.dtso     | 34 +++++++++++
 .../dt-style-selftest/good/dts-property-order.dts  |  5 ++
 .../dt-style-selftest/good/dts-property-order.dtso | 47 +++++++++++++++
 23 files changed, 531 insertions(+), 19 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 96deffc0d8a7..e5f26d3e2792 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -77,24 +77,26 @@ def is_preprocessor(stripped):
 
 
 class DtsLine:
-    __slots__ = ('lineno', 'raw', 'linetype', 'indent_str', 'stripped',
+    __slots__ = ('lineno', 'raw', 'linetype', 'indent_str', 'stripped', 'is_root',
                  'prop_name', 'continuations',
-                 'node_name', 'node_addr', 'label', 'ref_name', 'depth',
+                 'node_name', 'node_addr', 'label', 'ref_name', 'parent', 'depth',
                  'closures')
 
-    def __init__(self, lineno, raw, linetype, depth, indent_str, stripped):
+    def __init__(self, lineno, raw, linetype, depth, indent_str, stripped, is_root = False):
         self.lineno = lineno      # 1-based within the block
         self.raw = raw
         self.linetype = linetype
         self.indent_str = indent_str  # leading whitespace as-is
         self.depth = depth
         self.stripped = stripped
+        self.is_root = is_root
         self.prop_name = None
         self.continuations = []
         self.node_name = None
         self.node_addr = None
         self.label = None
         self.ref_name = None
+        self.parent = None        # DtsLine of parent node
         self.closures = 1         # count of '}' on a NODE_CLOSE line
 
 
@@ -228,7 +230,10 @@ def classify_lines(text):
             continue
 
         if code.endswith('{'):
-            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
+            is_root = False
+            if code == '&{/} {' or re.search(r'^/\s*\{$', code):
+                is_root = True
+            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code, is_root=is_root)
             parse_node_header(dl)
             out.append(dl)
             depth += 1
@@ -491,16 +496,24 @@ def _walk_bodies(lines):
     """Yield lists of immediate-child NODE_OPEN lines for each node body
     in the input. Skips ref-nodes (&label) since those don't have an
     intrinsic ordering."""
+    # Array of stacked nodes (parent/child)
     body_stack = [[]]
+    # Current stack of nodes, purely to track parent relationship for each node
+    node_stack = []
+    parent_dl = None
     for dl in lines:
         if dl.linetype == LineType.NODE_OPEN:
+            dl.parent = parent_dl
+            node_stack.append(dl)
             body_stack[-1].append(dl)
             body_stack.append([])
+            parent_dl = dl
             continue
         if dl.linetype == LineType.NODE_CLOSE:
             if len(body_stack) <= 1:
                 # Unbalanced; ignore to avoid crashing on malformed input
                 continue
+            parent_dl = node_stack.pop().parent
             yield body_stack.pop()
             continue
     while body_stack:
@@ -521,12 +534,18 @@ def _natural_sort_key(s):
 
 def check_child_address_order(ctx):
     """Addressed siblings (foo@N) must appear in ascending address
-    order within their parent node body."""
+    order within their parent node body.
+    Exception: Top-level in DTS follows name order, regardless of unit address
+    in memory@N and soc@N nodes
+    """
     for children in _walk_bodies(ctx.lines):
         addressed = []
         for c in children:
             if c.node_addr is None:
                 continue
+            if c.parent and c.parent.is_root:
+                # Top-level does not use unit address sorting usually
+                continue
             try:
                 parts = tuple(int(p, 16) for p in c.node_addr.split(','))
             except ValueError:
@@ -544,12 +563,16 @@ def check_child_name_order(ctx):
     """Unaddressed siblings must appear in natural-sort order by node
     name within their parent node body. Addressed children are scoped
     by check_child_address_order; reference nodes (&label { ... }) and
-    the root node are skipped."""
+    the root node are skipped.
+    However root node has children with and without unit address, and
+    sorting should be only by name."""
     for children in _walk_bodies(ctx.lines):
         unaddressed = []
         for c in children:
             if c.node_addr is not None:
-                continue
+                # Skip nodes with unit address, except when sorting top-level
+                if not c.parent or not c.parent.is_root:
+                    continue
             if c.node_name in (None, '/'):
                 continue
             if c.ref_name is not None:
@@ -591,6 +614,30 @@ def _property_bucket(name):
     return (5 if ',' in stripped else 4, None)
 
 
+def _property_bucket_root(name):
+    """Return the canonical bucket index for a property:
+       0 model (for root nodes only)
+       1 compatible
+    Plus a sub-key inside the bucket for fixed slots (device_type, compatible,
+    reg, reg-names, ranges, status). 'standard' and 'vendor' return None for
+    the sub-key, signalling that the within-bucket key is computed by
+    the pairing rules."""
+    stripped = name.lstrip('#')
+    if name == 'model':
+        return (0, 0)
+    if name == 'compatible':
+        return (1, 0)
+    if name == 'reg':
+        return (2, 0)
+    if name == 'reg-names':
+        return (2, 1)
+    if name == 'ranges':
+        return (3, 0)
+    if name == 'status':
+        return (6, 0)
+    return (5 if ',' in stripped else 4, None)
+
+
 # Declarative pairing rules: each is a callable
 #   (name, all_names) -> anchor_name_or_None
 # If a rule returns an anchor, the property sorts immediately after the
@@ -627,13 +674,16 @@ def _pair_x_names(name, all_names):
 PAIRING_RULES = (_pair_pinctrl_names, _pair_x_names)
 
 
-def _property_sort_key(name, all_names):
+def _property_sort_key(dl, name, all_names):
     """Sort key for a property among its node-body siblings.
 
     Format: (bucket, within_key, tiebreak). 'within_key' for
     standard/vendor buckets follows pairing rules: a property paired
     with anchor X sorts as if it were X with a higher tiebreak."""
-    bucket, fixed_sub = _property_bucket(name)
+    if dl.is_root:
+        bucket, fixed_sub = _property_bucket_root(name)
+    else:
+        bucket, fixed_sub = _property_bucket(name)
     if fixed_sub is not None:
         return (bucket, (), fixed_sub)
 
@@ -668,7 +718,7 @@ def check_property_order(ctx):
         if len(props) < 2:
             continue
         all_names = [p.prop_name for p in props]
-        keyed = [(p, _property_sort_key(p.prop_name, all_names))
+        keyed = [(p, _property_sort_key(dl, p.prop_name, all_names))
                  for p in props]
         for k in range(1, len(keyed)):
             if keyed[k][1] < keyed[k - 1][1]:
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dtso
new file mode 100644
index 000000000000..74b49be69e98
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-child-name-order.dtso
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Include labels to be sure they do not affect sorting */
+		foo: foo {
+			label = "foo";
+		};
+
+		label_bar: bar {
+			label = "bar";
+		};
+	};
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu-2 {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dts
new file mode 100644
index 000000000000..74c956398324
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dts
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		serial@20000 {
+			compatible = "example,serial";
+			reg = <0x20000 0x1000>;
+		};
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>;
+		};
+
+		serial@30000 {
+			compatible = "example,serial";
+			reg = <0x30000 0x1000>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dtso
new file mode 100644
index 000000000000..052c02935a45
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-digit-node-order.dtso
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		serial@20000 {
+			compatible = "example,serial";
+			reg = <0x20000 0x1000>;
+		};
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>;
+		};
+
+		serial@30000 {
+			compatible = "example,serial";
+			reg = <0x30000 0x1000>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dtso
new file mode 100644
index 000000000000..d9cf670f19f6
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-child-name-order.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	};
+};
+
+&pmu {
+	/* Include labels to be sure they do not affect sorting */
+	foo: foo {
+		label = "foo";
+	};
+
+	label_bar: bar {
+		label = "bar";
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dtso
new file mode 100644
index 000000000000..4b2cf60e5a92
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-extend-node-digit-node-order.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&soc {
+	serial@20000 {
+		compatible = "example,serial";
+		reg = <0x20000 0x1000>;
+	};
+
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+		reg = <0x10000 0x1000>;
+		interrupts = <1 2 3>;
+	};
+
+	serial@30000 {
+		compatible = "example,serial";
+		reg = <0x30000 0x1000>;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
index f31abb6ceae4..e675e5e05a46 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
@@ -5,7 +5,12 @@
 
 /dts-v1/;
 
-/ {
+/  {
+	compatible = "example,test-board", "example,test-soc";
+	model = "DT style selftest";
+	qcom,board-id = <8 0>;
+	chassis-type = "handset";
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
new file mode 100644
index 000000000000..81ac2b092b96
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: Incorrect property order
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	compatible = "example,test-board", "example,test-soc";
+	model = "DT style selftest";
+	qcom,board-id = <8 0>;
+	chassis-type = "handset";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			reg = <0x0 0x0>;
+			compatible = "arm,cortex-a57";
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+	};
+
+	pmu {
+		compatible = "example,pmu";
+
+		status = "disabled";
+		dma-coherent;
+	};
+
+	soc@0 {
+		ranges = <0 0 0 0xc0000000>;
+		compatible = "simple-bus";
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>,
+				     <4 5 6>,
+				     <7 8 9>;
+			compatible = "example,intc";
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
index e2eea0862102..312a45ed913a 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/dts-child-name-order.dts:16: [child-name-order] child node 'bar' out of name order
+bad/dts-child-name-order.dts:21: [child-name-order] child node 'memory' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dtso.txt
new file mode 100644
index 000000000000..e44ceb24ece8
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dtso.txt
@@ -0,0 +1,3 @@
+# mode=strict
+bad/dts-child-name-order.dtso:17: [child-name-order] child node 'bar' out of name order
+bad/dts-child-name-order.dtso:22: [child-name-order] child node 'memory' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt
new file mode 100644
index 000000000000..1f41acdea0b0
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-digit-node-order.dts:29: [child-address-order] child node @10000 out of address order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dtso.txt
new file mode 100644
index 000000000000..21db32f6e639
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dtso.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-digit-node-order.dtso:30: [child-address-order] child node @10000 out of address order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dtso.txt
new file mode 100644
index 000000000000..d7941a891135
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-child-name-order.dtso.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-extend-node-child-name-order.dtso:23: [child-name-order] child node 'bar' out of name order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dtso.txt
new file mode 100644
index 000000000000..408796d5bb03
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-extend-node-digit-node-order.dtso.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-extend-node-digit-node-order.dtso:24: [child-address-order] child node @10000 out of address order
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
index 4bc21328625f..65977f96331d 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
@@ -1,6 +1,8 @@
 # mode=strict
-bad/dts-property-order.dts:15: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
-bad/dts-property-order.dts:16: [property-order] property 'device_type' out of canonical order (should sort before 'compatible')
-bad/dts-property-order.dts:25: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
-bad/dts-property-order.dts:30: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
-bad/dts-property-order.dts:40: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
+bad/dts-property-order.dts:10: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dts:12: [property-order] property 'chassis-type' out of canonical order (should sort before 'qcom,board-id')
+bad/dts-property-order.dts:20: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
+bad/dts-property-order.dts:21: [property-order] property 'device_type' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dts:30: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
+bad/dts-property-order.dts:35: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
+bad/dts-property-order.dts:45: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
new file mode 100644
index 000000000000..124183fab2ad
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
@@ -0,0 +1,8 @@
+# mode=strict
+bad/dts-property-order.dtso:11: [property-order] property 'model' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dtso:13: [property-order] property 'chassis-type' out of canonical order (should sort before 'qcom,board-id')
+bad/dts-property-order.dtso:21: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
+bad/dts-property-order.dtso:22: [property-order] property 'device_type' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dtso:31: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
+bad/dts-property-order.dtso:36: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
+bad/dts-property-order.dtso:46: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
diff --git a/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dtso
new file mode 100644
index 000000000000..1fd75a6285ce
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dtso
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Include labels to be sure they do not affect sorting */
+		label_bar: bar {
+			label = "bar";
+		};
+
+		foo: foo {
+			label = "foo";
+		};
+	};
+
+	pmu-2 {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	};
+};
+
+&pmu {
+	/* Include labels to be sure they do not affect sorting */
+	label_bar_2: bar-2 {
+		label = "bar";
+	};
+
+	foo_2: foo-2 {
+		label = "foo";
+	};
+}
diff --git a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
index cdf3f91ebe01..2b21dde7f3c8 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dts
@@ -5,13 +5,10 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
-	/* TODO: uncomment when child-address-order is fixed for top-level */
-	/*
 	memory@a0000000 {
 		device_type = "memory";
 		reg = <0x0 0xa0000000 0x0 0x0>;
 	};
-	*/
 
 	pmu {
 		compatible = "example,pmu";
diff --git a/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dtso
new file mode 100644
index 000000000000..efafa1cccc15
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dtso
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0x0 0xa0000000 0x0 0x0>;
+	};
+
+	pmu {
+		compatible = "example,pmu";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>;
+		};
+
+		serial@20000 {
+			compatible = "example,serial";
+			reg = <0x20000 0x1000>;
+		};
+
+		serial@30000 {
+			compatible = "example,serial";
+			reg = <0x30000 0x1000>;
+		};
+	};
+};
+
+&soc {
+	interrupt-controller@110000 {
+		compatible = "example,intc";
+		reg = <0x110000 0x1000>;
+		interrupts = <1 2 3>;
+	};
+
+	serial@120000 {
+		compatible = "example,serial";
+		reg = <0x120000 0x1000>;
+	};
+
+	serial@130000 {
+		compatible = "example,serial";
+		reg = <0x130000 0x1000>;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dtso
new file mode 100644
index 000000000000..b00c2a195179
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-child-name-order.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	pmu {
+		compatible = "example,pmu";
+
+		/* Just reference labels to avoid strict warnings */
+		example,foo = <&foo>, <&label_bar>;
+	};
+};
+
+&pmu {
+	/* Include labels to be sure they do not affect sorting */
+	label_bar: bar {
+		label = "bar";
+	};
+
+	foo: foo {
+		label = "foo";
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dtso
new file mode 100644
index 000000000000..1ce18afb80de
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-extend-node-digit-node-order.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	soc: soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
+
+&soc {
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+		reg = <0x10000 0x1000>;
+		interrupts = <1 2 3>;
+	};
+
+	serial@20000 {
+		compatible = "example,serial";
+		reg = <0x20000 0x1000>;
+	};
+
+	serial@30000 {
+		compatible = "example,serial";
+		reg = <0x30000 0x1000>;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/good/dts-property-order.dts b/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
index 0e183e3459cd..3d847cc9fa3e 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
@@ -6,6 +6,11 @@
 /dts-v1/;
 
 / {
+	model = "DT style selftest";
+	compatible = "example,test-board", "example,test-soc";
+	chassis-type = "handset";
+	qcom,board-id = <8 0>;
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso
new file mode 100644
index 000000000000..5ae78541f68b
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-property-order.dtso
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: Incorrect property order
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	model = "DT style selftest";
+	compatible = "example,test-board", "example,test-soc";
+	chassis-type = "handset";
+	qcom,board-id = <8 0>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+	};
+
+	pmu {
+		compatible = "example,pmu";
+		dma-coherent;
+
+		status = "disabled";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>;
+		};
+	};
+};

-- 
2.53.0

