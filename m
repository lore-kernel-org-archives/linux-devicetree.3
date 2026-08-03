Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A8C3B8D41
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747825; cv=none; b=REvLspy47uSfk49eXom3G6u9vl0IoQGOh68H+luqsS0CY/2qXsP4J/Ris9WhaJWgBbRYUR+uMYTMXYf30h1m8Oeveg5DfuY8bOfSTSHaBGRAzxVlCTSvp9x+pTAltsKeGFlXth6tPTCL6rmYMvo79m6s60eJPz5ZHIHa/J+lDlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747825; c=relaxed/simple;
	bh=+ehgfCq88a330bC4aVlKBlM7axSaqvHg7R8ENeXWgqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KFEqwvQomB2YPbD4HgkgxfZHe2crv0BZl7nkW8aoSUJANq3CkhRsvS/9HNjYYjmfDnAKvrcgGJVGuESm0NAlq8lZR8LiqemapmJQjUcb4Nt9I9CT1D5WjtDqm+gk4TfhjFX90OHKU+sfd03AORaMvGxG9kK9U7Gf0KyT5/BmbUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H+OsUYkw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJSaWiJR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H+OsUYkw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJSaWiJR"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736Db6L3882607
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qfS7xPNcUV5R2reXYO78DYUur2fRiq7mPGCcABscjcY=; b=H+OsUYkwa4nO4n0B
	2b9+1QXRraWlpJbV63HPmm1NGR0nsiGfErttlcetNB63Gp0hmANHlNmcaY1vHfRp
	9dRuGfH/pnhZSlyjJZNBgXOEzlrN3qkWoshBzy/fkieob7ZeCEsUwCP8TKx6kH/Q
	QzThXyksNWZNNm/1Vsx9qbokmfUiRbHtKL2gHPraBVo/Z91PaJpHvssIywx7ie/N
	t3BinxHVJ2JXBJ5TzLT1/zPE6QxCufr2TKy/8vLu4eEddVWRjCCUBIz7XdXjZqfc
	oB2sEFuirEkYo/zK11LgO0fGkxi1nPD3P1iTh+KOMuheXbitOcqI1KWvjER1tsjQ
	HR0a7g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkgqse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d137a68so58973031cf.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747821; x=1786352621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qfS7xPNcUV5R2reXYO78DYUur2fRiq7mPGCcABscjcY=;
        b=dJSaWiJRwWNN4wUXaMOwNIyAF4u2dbUKvp9DlHha0S2ejhUHYO4x9Sf/GlpWHfg7Pg
         FdWqpP2hxnMx6q+8TgPYExNSk7iOPchk6yBMFH5Sswoq1CwHw3QIDEq7kQ5ilczFe0BO
         ngHlACYnPU+pI54rPQ7ckcoMbfatSrwgJiRCnb3xKwXzdR3mZHefRfmCk37gE5M5hLlE
         5N/QFZ/un7woGT5AU72qZkYKnnXYqQ1IG3PKry6mRHOsIx2k8bDn1fEd09XPmiQs/kRo
         IMulmcgH5AbME0PCJmP58n1XRHGCdzAJrHyC6Qd9zT2FQY742SN9nHZNyEhvJgL+hgOv
         nPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747821; x=1786352621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qfS7xPNcUV5R2reXYO78DYUur2fRiq7mPGCcABscjcY=;
        b=dRTFSrzJ1nnrtAfESHZWfyx3Va7IuxShjcNV/DMU72wcBoJhE1I400g3NyixfbqAFE
         8KVy30n4Rbt2NXIRtW1vC3krJ0OHV5TZj8Imuc5nWJ3UhQ93lKlWMs+u9kkRZwAtWd65
         r2JTugLJJTl7Z++DJ5BTBYl2o6I2V5h/Td52SobQeDBhJQkXMzI0ezeDW6BrcJqWbgkC
         5zO9FRpo4Q6pz4Gh8LpGaDlXVzUJ5lKZYs4uruY83//cM9keZEfdCI26oqV0SqOLuQ0D
         Q3olp7iejapsc6pTe90W0MclohIhXzeM59P4V3HniZKgaSjqsoK6+WST+gEfD6NZgbbt
         fmlw==
X-Gm-Message-State: AOJu0YxpdFaMF+F+Vl+28io7lkakGw27ceMeguV3rrrgp6ipsWa2Mm/Q
	hHhmNsS9cpEOI2aqWejFmhQCENuu7Ua7m10YOz0vdGVrZGtC77tb1mV/YYLakc8Nv/WUXWBj18x
	mpx4LuVe6+CM+qp0Ft4pR+szGTJCzUP+f9s5m+aBzm7jmtFmgRLrECHgLPy+Xii1Q
X-Gm-Gg: AR+sD11GGXSw1uXUFlG5fidP/e5iyQlBb3Rx2xEywWdGwEqTOb3UblOhfmO/Iia/6ao
	1NWKbKK5QDbeXROqP9zqWu/3N6wTVvqp+Xn3IR3lV4Srhgxyi7rr5gyYT9NUHPjzazR56TGqf1Z
	DPZILe8zjO2eW6wUBOkok9ZSuyTesJNJIEHA9EQx5lR1A9Z+/4cLWUxYVZQJGCPa4WSkGUtkA2s
	tLezf4VkhhD8eK+/6WTEauz3yX2/f+pTCUP4Topjf/MleOqNEivZJwdeYV1x+Dz+kF/BHqahwat
	Nk88Q+AjnGwq58YhHyjKPTXeOo5wMYfFCzy/b9bSYvctvcSFMDUbzljGlT0AAHykHSvPqZZxfOw
	opTzIMaYIU9AcK6ftVkSXFdAI
X-Received: by 2002:ac8:5808:0:b0:51c:511:c5 with SMTP id d75a77b69052e-52b566abe43mr168063291cf.16.1785747820209;
        Mon, 03 Aug 2026 02:03:40 -0700 (PDT)
X-Received: by 2002:ac8:5808:0:b0:51c:511:c5 with SMTP id d75a77b69052e-52b566abe43mr168062891cf.16.1785747819725;
        Mon, 03 Aug 2026 02:03:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 11:03:07 +0200
Subject: [PATCH v3 04/11] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-n-dts-style-checker-continued-v3-4-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=20420;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+ehgfCq88a330bC4aVlKBlM7axSaqvHg7R8ENeXWgqE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFlYHwrGUFNm8yI94HF1GbHn5Kv7cMIgH4uXX
 7D2+mjMniaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZWAAKCRDBN2bmhouD
 10TBD/45mUJmowNJwo0RfTjffS8itme6lHJJJhTOz2KCl9BjPwMm3dFHCRyqtfw8fo4IrioeT5O
 bPcFI7FXKZLub+0MCtm9+5KH1GZV63yH27H8j5JPC55FEj4dFisH6anZSXi8sixS1SxECebNjPE
 OpSvUQHfMSb7CQMrxwdiIylsZ3VtLpGSq2H5+QPrIhxH5PANz0ftRXEnyem9SGs9tx84f29TgxC
 8Pz68Ol6b4D+/nm3hFU7g8o3eBhI6U928HBMZgYvPEpZkwKF6GxYf+p2LM5GP7f71RrvE295Zrk
 l14PBCgMwitWkKP7nRJrHYecjJB2mj1bWOs1y9wJ8GTDl6eMHFcjFJsxCaM0hhLwYcyswMObSm/
 yJ1l9a7vzWtYAC/Z6IhVfzIQlKJOue16nM+1Jr4MM2B0riQ3vuN6lUiClYAT/cC5D3t2svzUM/S
 JbNw6yuDIaLSyPchBHV0FA5GorWB+bQpFRSA/QsHlB8VRxbw5DqSRDqcM0PTa4PlboIJ2GFFeec
 MEiHu6/GVYqgU+AAJ//q/1JJCk84SvOxJzrtfh6St7Fsvw5lcgP7aJWJ8Zs63qUVrCLarxatK+9
 eISaOxgFOHSVYQyTWtSqphyqj++Wu/ASXe4gE4DyEZonmh/PfFrvx9UqeNCO2P7NGmkkfLK7Ey2
 UFvNSEZGNdOx30A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: iRdJGfnwQQAEWBO7sSrW0RFnHx7LRJAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX7DuAO5eTK7hT
 sGKAO/7Ro4cdqZNRxcAC/vJONhVUpXIa0bw2CKPVXECUg4iKZ/SFGQdcP4Xo/WKrfgQsqTmC1li
 0DfojH6hhvtd/+m6x5nBNe/tG0HizFMh45OIfsMurQLYh20fQHfcJSrSf5jNjDyogDvgub1pRFu
 NsKl8QqCF7dLd2Uk9nf6vQQK4N0WXO/QzfDJH0Npk6xnrvH21nmlLIpDVSy1sXcYPMC2H3oQYdu
 r6zUw7nrJ8N46/fX1F9h0L4wmt5wHEoWMSpkp2uCFFFiSv5KgBAByt3TdEQ24o7j9VpeKsI0/iM
 sa9i3H4vhFHWflj2XHCaqijxgSKaAUqoU9xiGEUtccV0erwFlGNsiBsDTfugvgbxx6foWemNAGx
 QHJhFbgFoi+IrmAmjjjm3/6jfi8t1uIezUHaw2w+/kHIL9T4XHfD5rOoMGRyZhjdkFVSicc48xy
 3qbPrR2sYPHXz2T5VVA==
X-Proofpoint-ORIG-GUID: iRdJGfnwQQAEWBO7sSrW0RFnHx7LRJAt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX5GlJGa17fLUM
 Yb6f9kw4W04B/qqE4leHIvaXKPAboVkcr6g9Lcavy3UW31D9dggDoqut2U8TBCZsAkLWOI9JQB0
 V0xAt7Um3V0wGLA9FIibC5IQSWdveMs=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a70596d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=M31IkpsM9wu0Ilc1mG4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030080

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
 scripts/dtc/dt-check-style                         | 60 +++++++++++++++++++---
 .../bad/dts-child-name-order.dtso                  | 33 ++++++++++++
 .../dt-style-selftest/bad/dts-digit-node-order.dts | 40 +++++++++++++++
 .../bad/dts-digit-node-order.dtso                  | 41 +++++++++++++++
 .../dt-style-selftest/bad/dts-property-order.dts   |  5 ++
 .../expected/dts-child-name-order.dts.txt          |  1 +
 .../expected/dts-child-name-order.dtso.txt         |  3 ++
 .../expected/dts-digit-node-order.dts.txt          |  2 +
 .../expected/dts-digit-node-order.dtso.txt         |  2 +
 .../expected/dts-property-order.dts.txt            | 13 +++--
 .../expected/dts-property-order.dtso.txt           |  1 +
 .../good/dts-child-name-order.dtso                 | 33 ++++++++++++
 .../good/dts-digit-node-order.dts                  |  3 --
 .../good/dts-digit-node-order.dtso                 | 41 +++++++++++++++
 .../dt-style-selftest/good/dts-property-order.dts  |  5 ++
 .../dt-style-selftest/good/dts-property-order.dtso | 47 +++++++++++++++++
 16 files changed, 315 insertions(+), 15 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index d9f76d6d9179..f9e5762862a5 100755
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
 
 
@@ -495,16 +496,24 @@ def _walk_bodies(lines):
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
@@ -525,12 +534,18 @@ def _natural_sort_key(s):
 
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
@@ -548,12 +563,16 @@ def check_child_name_order(ctx):
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
             if c.node_name is None:
                 continue
             if c.is_root:
@@ -597,6 +616,30 @@ def _property_bucket(name):
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
@@ -633,13 +676,16 @@ def _pair_x_names(name, all_names):
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
 
@@ -674,7 +720,7 @@ def check_property_order(ctx):
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
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
index 782cd55ec283..e675e5e05a46 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
@@ -6,6 +6,11 @@
 /dts-v1/;
 
 /  {
+	compatible = "example,test-board", "example,test-soc";
+	model = "DT style selftest";
+	qcom,board-id = <8 0>;
+	chassis-type = "handset";
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
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
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
index 4bc21328625f..29283f3451c7 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
@@ -1,6 +1,9 @@
 # mode=strict
-bad/dts-property-order.dts:15: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
-bad/dts-property-order.dts:16: [property-order] property 'device_type' out of canonical order (should sort before 'compatible')
-bad/dts-property-order.dts:25: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
-bad/dts-property-order.dts:30: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
-bad/dts-property-order.dts:40: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
+bad/dts-property-order.dts:8: [redundant-whitespace] extra whitespace before {
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
diff --git a/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dtso b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dtso
new file mode 100644
index 000000000000..477b13b1ac2e
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-child-name-order.dtso
@@ -0,0 +1,33 @@
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
index 000000000000..79ea2deec789
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-digit-node-order.dtso
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

