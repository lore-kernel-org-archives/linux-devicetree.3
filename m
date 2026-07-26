Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302013C8C43
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080868; cv=none; b=B3mG33M+TPqPFKBdxFnxqlSntZqschwuDQnSBZVEJ1ayUy737UyFR7faz07Bf4RVHmaXS2iwVZYrdmIszoKRHmVzbpD31v3D5FFSzQtc85AwJ1CwQLPYY3kInJ51lEu1qjEe02F1UybVUxqpgiP7qKOP/Xv3zGAipuUHj9fVRjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080868; c=relaxed/simple;
	bh=lM110TQBOHlGOebdV0k3fcPOIk+J9mVXi5j1CtihZhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V1WjiXX87ife0Yhu40mDdOWXcvHGpxGTeKuRUTl9ULMhoghGEx2iJOhWZYfpQCyG6w0D1hARUB0ImERBC0lPwkHcNZA5zRdEpggom8K1MRLDWHUQtWMk/5wfVpz4hnZrM/KdEkszVNVt5uGR3CRJpyb0k64q264j7r0TeiIbGjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l3B8bdpc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/uuv3ev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l3B8bdpc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U/uuv3ev"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE2koR992937
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0vaXCSII8JuopCM12YbEorPNee/lERUB4r2OlxzTY4=; b=l3B8bdpcnrq51NhJ
	MJyFB9apHEd6yufYMQL5PFlQ8NbxWfGJA7izVjxqz81McuEMAzOS+C23ZfZ8QrGd
	Ud5Ad0rMqZVY8p0D9A2hpGXtigE+dMRxmck1ysmQvhPCity6OdmfyfldOD/ARYRs
	b8tsohx/g8AtxTX9yHv0wNVsZPu5IDY00XrJlmB4BFZkP19FvpJY3atgsVFDXRdM
	fUQNrZgZH2O6j6pFnByoepa6cLjcFPAEP/36pStEQgsK4Bg0PEO+f+ZFDg2DYm5p
	EYn+ptkl9uNau+zvD2jwYD9xf793QKBE3zmWhi6+LLbxbT3pZC3x16ztPrcnA4Gy
	x5FapA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysrewj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe3fa93bso24978431cf.2
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785080865; x=1785685665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0vaXCSII8JuopCM12YbEorPNee/lERUB4r2OlxzTY4=;
        b=U/uuv3evcl5Q4NREuZ5DgNxe7WH2f74MBBgOgvyIEAPnQ7IKkhrZ5NAnaLB/ms0BKC
         iaLmMQJfqqIILOzfEhuoM5o3fYu+p4sHZekCTRMSB8I2F0gU3jPwR1y81YMnRP9NvD0L
         9yp9cGrqDFx0Fh0xx8kaj7Fk/Cw2p1CNKdAhCQgedoyfkJWeCtn5P77Yu2fP9UXAiyDK
         jxPx03QDmwFrHDBXS/JI2l5lI2tf4O7RNm+jfG1+R8PUUCCqQw9PCOtdp8Icu3JIcPAp
         g7zgeUojhTaMMX1wB8xH0q9o6IxrLWrh48k8e2Fv6DWomKn13ma9vRXAsYA1X6aTysNX
         GgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080865; x=1785685665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0vaXCSII8JuopCM12YbEorPNee/lERUB4r2OlxzTY4=;
        b=iFMoesr7eEF+a9oFOvpp9o0Yk9BJ4c/Mhm9FVxkNh9RcC6GiE+DLlorz1rfymwjhjc
         hUF4/qd5T4NpD6Z+GgaeLb3rrkcjFRq+R7julLKBNlqBfjs2qVtqRpj2/6nElRTi1adu
         xriaL2Xu9SV+mvG/nMks5A8lI6mq2DIGn5lA6JvWU57ewDLGNeguOT4E4+/JKq6qKv59
         HTYL6O1pQTnvKyLSNW5ZJT1X7GdMCrNvXcDZoLrKpJCN5vT8J0I+ci4gbvYnZ0qbc8q6
         tp3qLYMAVEC0dumAvUqMZ6qQ3SlP/BoFXT5tYZCOvXwTvfJIkeUdZrUB/KyWjx04afoH
         BmuA==
X-Gm-Message-State: AOJu0YxxSLD0yqLLqJh3pJK/x2Bpo+qi/0vCc6EKAxLJ+Y8olkbVl9A/
	LIYs7XK69FgO2raPeKe3X4SsMyx+he5rdAv+n3aXvfrcMaZauF9Nm0ehxtELfxIJSCAACDvDIuu
	QO9WK7aCUMNdRdR2S7UuXjikdUt21D/4dKggDj54/0xg++2aeK0BRAY9YYF+WNHeS
X-Gm-Gg: AR+sD13SSCSEyhjWlt2vgOBlut9pyOEsWWV7WO9CzvsgF6I+13nTMNc21iOKnrBfmgP
	Tr16nekGK6OSL6Y5KEeZ7p6upIowbBxCgxBHmcobV1lkqnAJpOknqFVmOHJXmQMqXnrud3NAeum
	uH26WaWU3QvA5Fwo+mvh5eg0mwS7962pnxyQvOIO2rtgm/mBf+x8+oNb8vlB9Ng/agBIIaJMSmU
	Qzc9w5CBxQ0tGAJwLGZu4jV7/uKY/dqxENFlvgI8NiUOSKDrUNzlCzP92nsT1XQMz41RMeH1bpe
	f3chNzoXxnsPuQz3BIZNgcFsLphxNAnSBp8mihR3jEW3hLlaiAzm72TfdRg1EtSIAtFsjdbDON8
	5U/JDx3/R7EkAmJVudwcq3Rz/
X-Received: by 2002:a05:622a:5799:b0:51c:164b:b242 with SMTP id d75a77b69052e-529a8370913mr55962241cf.15.1785080865241;
        Sun, 26 Jul 2026 08:47:45 -0700 (PDT)
X-Received: by 2002:a05:622a:5799:b0:51c:164b:b242 with SMTP id d75a77b69052e-529a8370913mr55962041cf.15.1785080864745;
        Sun, 26 Jul 2026 08:47:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9ae5c3sm236848035e9.3.2026.07.26.08.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 08:47:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 17:47:23 +0200
Subject: [PATCH 4/9] dtc: dt-check-style: Handle sorting of top-level nodes
 and properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-n-dts-style-checker-continued-v1-4-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11922;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lM110TQBOHlGOebdV0k3fcPOIk+J9mVXi5j1CtihZhI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZiwSNs30hSpXjEu0G9a43hTWW/8VNLOj4U9Lx
 ZNHeXT4LPyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamYsEgAKCRDBN2bmhouD
 10PtD/0adfaNTVQkjywdXRir2QDtanrmiQc/kYe5cbSiaf+M8yRT4ReYkmBK5OMK10kK+JrNsao
 PyjW9FDNeQ7cf5UvHiHZ81NbK8Q37hC+rVMnGhSdzQkyNot8qbwc4b+cUKsUO6hcSsrIn4sVdp2
 bex9BQrZiTbjf8kDGwp5gdTXbSELzeZVi1T+jhB7qDp5dwT22qhFOhce2dbpEGd5OgcqBlN8VZ+
 zKJs/8HHumNIj9AhjhyB6v6n/1rPFYpS57+sQt+jSH5B68+hoS6PtFcVbaxwpdox8e1W57naB0E
 GxB+f4B/XouiOUA/xGPbysh9MAYg1ZZn5jShSIHaMV3CPI+e139ndKeX1wdIGFwmj39nehYhxb8
 W6vZQdlGbn0w9CNUzdqcXsjifLQyMde7uX/Y+JKLLz6PpMEggEqf+7omj/QEJNeJlFU+cALLhRL
 m694s3BjmqV3bkQaWlc1S3AbahFdg3dRbVMt9uFyJ5Gzy1pI3PpYg5cY/KBPsdShCup8zKKkjAF
 3HhNQ5grkhqfkbr35hKrNMabbMzacNm5Vl1wUyFQEFovESH9shSfXtP3NiN7wrdslH7kDITKzuB
 RfGPPdav7gG7V+nvvjQSaNA6AnCN9keXx34P+iTlmvQhzNmptT0g1oJToXpOy8mrKDOJWdKxm6S
 eXw4OYT2DTd8mgw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX9RLnGiEzpaEn
 4aj5zYdKcmg5ETHTqnqMEFJYe0GN7/wPxSmghMuzxQio3iUvJnPAuJu3GDUKZNaMwwzNUbHRID4
 JH7Vkztcy2u60c5U7QaMIioV9pkndTB9yuDrk7FBM9yfxMj2gZ4XenT3shfmXcbsa3FzO6071Ne
 B58leBNkeetC2dtwUl6xG5jntxHtgxUkU//BzsbOHyYeR6I76bg63NNVbgpJYtlIcfR71hSpKW2
 ah5HT0C4FBV3dWWr6nrROTmdLN55UoY/SsdQTKKXmSfN9mbLAHWHbzrbQA2hOc7+hQhXW0kFbK2
 li1Oba92KACHVFI3P0YoYqSxMsSYmi4EA6hTAfcsoz+FeoxYN0OYqE5Sj/wWD0O4L3j/vTVPpgQ
 h0wwAFJX3KaEK4R7iiPkq6z+Shq8+Ig7bGugkbXuMdOCiipXCEArB7A+V2xB5r0i0tZ74Vh0pjm
 lQiMeXIcBz+IoENhIoA==
X-Proofpoint-GUID: mkMAJFxItKOgjy_Kp3Q12VRM6kAeRL-T
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a662c22 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6sLjxE-HcatYLxMBIV8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX0uIR+9lKj/4l
 uGrasooM9yaMVGMYqJxOBw344WmLJvay5mVuLUZiXFyjWZmBKrgyQzBLVbSGlcMXGzgwJSZgTKf
 CmJQxpxBWWl2thH2lyAmRYkHt8kI6eA=
X-Proofpoint-ORIG-GUID: mkMAJFxItKOgjy_Kp3Q12VRM6kAeRL-T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260160

Top-level DTS (but not example in the bindings) has only two nodes with
unit-addresses: memory@ and soc@.  There are two special cases here, in
terms of coding style:

1. The unit-address of memory is often not known thus set to @0, because
   it is filled up by bootloader.

2. There is mixture of non-unit-address and unit-address nodes.

Therefore usually the DTS chooses sorting by the node name, not the unit
address, for the top-level part.

Also the properties have one exception: 'model' property is supposed to
be before 'compatible'.  This cannot be applied to entire DTS, because
sound cards have also 'model' where it is supposed to follow standard
rules (after 'compatible').  Root node is just special.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 42 +++++++++++++++++++---
 .../dt-style-selftest/bad/dts-digit-node-order.dts | 40 +++++++++++++++++++++
 .../dt-style-selftest/bad/dts-property-order.dts   |  5 +++
 .../expected/dts-digit-node-order.dts.txt          |  2 ++
 .../expected/dts-property-order.dts.txt            | 12 ++++---
 .../expected/dts-property-order.dtso.txt           |  1 +
 .../good/dts-digit-node-order.dts                  |  3 --
 .../dt-style-selftest/good/dts-property-order.dts  |  5 +++
 8 files changed, 97 insertions(+), 13 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 1937c6feb57e..db4451e30dfb 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -79,7 +79,7 @@ def is_preprocessor(stripped):
 class DtsLine:
     __slots__ = ('lineno', 'raw', 'linetype', 'indent_str', 'stripped', 'is_root',
                  'prop_name', 'continuations',
-                 'node_name', 'node_addr', 'label', 'ref_name', 'depth',
+                 'node_name', 'node_addr', 'label', 'ref_name', 'parent', 'depth',
                  'closures')
 
     def __init__(self, lineno, raw, linetype, depth, indent_str, stripped, is_root = False):
@@ -96,6 +96,7 @@ class DtsLine:
         self.node_addr = None
         self.label = None
         self.ref_name = None
+        self.parent = None        # DtsLine of parent node
         self.closures = 1         # count of '}' on a NODE_CLOSE line
 
 
@@ -496,15 +497,21 @@ def _walk_bodies(lines):
     in the input. Skips ref-nodes (&label) since those don't have an
     intrinsic ordering."""
     body_stack = [[]]
+    node_stack = [[]]
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
+            parent_dl = node_stack.pop()
             yield body_stack.pop()
             continue
     while body_stack:
@@ -525,12 +532,18 @@ def _natural_sort_key(s):
 
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
@@ -597,6 +610,22 @@ def _property_bucket(name):
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
+    return (2, None)
+
+
 # Declarative pairing rules: each is a callable
 #   (name, all_names) -> anchor_name_or_None
 # If a rule returns an anchor, the property sorts immediately after the
@@ -633,13 +662,16 @@ def _pair_x_names(name, all_names):
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
 
@@ -674,7 +706,7 @@ def check_property_order(ctx):
         if len(props) < 2:
             continue
         all_names = [p.prop_name for p in props]
-        keyed = [(p, _property_sort_key(p.prop_name, all_names))
+        keyed = [(p, _property_sort_key(dl, p.prop_name, all_names))
                  for p in props]
         for k in range(1, len(keyed)):
             if keyed[k][1] < keyed[k - 1][1]:
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
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
index f31abb6ceae4..eb8b8b29fec5 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
@@ -6,6 +6,11 @@
 /dts-v1/;
 
 / {
+	compatible = "example,test-board", "example,test-soc";
+	model = "DT style selftest";
+	qcom,board-id = <8 0>;
+	chassis-type = "handset";
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt
new file mode 100644
index 000000000000..1f41acdea0b0
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-digit-node-order.dts.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-digit-node-order.dts:29: [child-address-order] child node @10000 out of address order
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
index a78b8c042aa5..124183fab2ad 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
@@ -1,4 +1,5 @@
 # mode=strict
+bad/dts-property-order.dtso:11: [property-order] property 'model' out of canonical order (should sort before 'compatible')
 bad/dts-property-order.dtso:13: [property-order] property 'chassis-type' out of canonical order (should sort before 'qcom,board-id')
 bad/dts-property-order.dtso:21: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
 bad/dts-property-order.dtso:22: [property-order] property 'device_type' out of canonical order (should sort before 'compatible')
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

-- 
2.53.0

