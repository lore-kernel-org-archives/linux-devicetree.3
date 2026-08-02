Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA3A366816
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660356; cv=none; b=slYiV8/Q1CELms+hciudegNoc70LloqsR7GtEcsun/HRMatuoluk4yN1h7jXfRFZPXL262vdDKTDNaRt6/U0hhU+Xd6PkbVNvF2nB6YIx+c6wRkYuyDDcTdPLfhrC0z1FSdYueeI5iLQsWzmiRDGH1QgMEwWJ7W7l/Dxcn+z7rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660356; c=relaxed/simple;
	bh=1ohYjM0kcqQXFf/ASBsJHZYihajw/hCKyDfmALEWsBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6LOk7aK5PPWPpj1BpO/r8MoykQtwCbk22cGymKblhoMfLfIPwewd3H97dPzxHxTSXvKZyAmwBr96Xn0i0M3tILzZGzajIGCSC7w3BwiR4J69MZua+v0Clc1qyp+hc/IrRNoF5IwU1ESCybAWgJl+Iw4uluncrQdd65+Z9b71as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0ZnKKUv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XIxjLLTq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0ZnKKUv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XIxjLLTq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727ll6R915754
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E65DB6RMGvAetunXW7GsYIROhDk8tolV7VS8/HCkqVA=; b=m0ZnKKUvaDHqXGPC
	+8lwI2rSHtzFonuvDQPiHCPGrNk5oIEwV1IR285jVwbsokBq4bi2rVmwKujQ3fTa
	tYESIpts49l8y+Yxm9Zy6SxkaGEZb5pRwHl0wqIs85lD/IFS6Wtg+sti4KN05Tjs
	6SccvuGNTw/1Qqhs3LJGQm/UlbXQ33rQoIj6AqaaeT4S1d72crTVU7PyYFgv31qU
	ZeNe039oAEbaDl1Wm0wu8Yg71jepNWWu2Yuk1pIWrQi+fcYbOpW/O5BUSoivDYQ8
	jL4MiLv7S29fzwkJQbzSc8RBZavdavWJNJSWXaoVs87OU+72tcPRY3voJGn+fGX0
	MAdkcw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs966aftd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:45:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9349c5af52bso355752385a.0
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660350; x=1786265150; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E65DB6RMGvAetunXW7GsYIROhDk8tolV7VS8/HCkqVA=;
        b=XIxjLLTqPr6U1wc52AgXFlpKxfneXOqFFVQ/3bE5LhL/LEnV7Wlj0/A1ccTpL+t+PZ
         3eOgaxYcBo9v+CC8lec2408cSozXSvTGAAEDQKPgX21ZzUs/kQA4P8c0HfVQu6sDum9J
         Suo7QCLs7o6UkWV4s4nCkNJg608dP2I9fnI2Sycsloe6LZEvFaXFLo710v94Qkri/Zoi
         4HAVRyqr94xeSSn/kMGv/kNuJqS3UxB1jc4wo/FhIXMqJpDw6RgFMjMZQ23J9NDilJyb
         zrwdR79t3oDvAkBkTG10xkad6bnw0apnh4KGXj4au+eDc83tOj+DXLvQUOqO9jeXVQ6P
         IwhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660350; x=1786265150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E65DB6RMGvAetunXW7GsYIROhDk8tolV7VS8/HCkqVA=;
        b=AVLjJ7GO9Yko9ppEvAyuEo+boHJY+QeB76EBQQvDhNd5BHoTjM/L/zUXQnI+uyaSyD
         7dkKcN/v04EbHzX94BuQISOivYJmYzL6zNsply0mHgH67OBhay6z0+D14AN7vLg9Yx50
         OjcHdRKYqjWrhDFsZQXAE+N3+ZMyR0H4RiwlHpCIqirScI5vKJpSOa4MulefoZdDafY2
         7S80/HdEcdnP0uE3RLykPlEx2tPyiaDH9DKB+HG4yCf/bjqd9AZAtetzmQtBjrncGBpJ
         bsWGn5BCKVAz51USbEYE93PAf4Yc3Jse4vWidG/If0JXgVzJh4PYQqmvon0eQv0LmRwK
         brdA==
X-Gm-Message-State: AOJu0YzCpl+6UxkZdqRf/3pgM55yHoP6gULThbQF+kt9+e0Knt0wD4ai
	ArXn+ODPj7hZ3vN6PTV/z/OpUSTR9GeZrLrWTNoCRKYMBFEW1W6qteFaOH01GdpomDEHBOT0QeI
	2Y6d5QmQr7sCBuGZeHnu6xoOLIrX1sm8l6qbqyMxXYj69rJD8qdnrsVT+/9NYFpNU
X-Gm-Gg: AR+sD11P8x6Sy0hKe2fPBen4Yo4b9bzzSuXCdDaO3E5eGoX/99tw+RPmz20O3obkQ9x
	fzbyVpdBR8+bIS3irY/mrBxIfj1KQ873Z3+Zoe1zs2OAZZZIqInogWLZGfv5ZSXnwsuMEQsxglG
	jEW27TSX/LcgqazSrX3umZd2toV0Y4KEaVYfqhrIcWmKgiziwNpdzEXciyzrlF8MKZCwYmdUGNt
	a//yN+NijYrRSnO6SOvaAyc0Eh8+UyrKB2aVyKEuy5e5sb85fYXL4UvWsuHGqprzOPZpgcxH4Jg
	h4Xee7UGaNTNBCJpNzyiqFMlF9vPecprk9gTpYb645GDcO+LC/pIWQQ6gANzOZwFux2AtUDr74q
	iY+DdgNyuRsv3xhQn/d5yY+Qh
X-Received: by 2002:ac8:5f4a:0:b0:517:9570:c1bd with SMTP id d75a77b69052e-52b5673f0f1mr111125251cf.25.1785660350211;
        Sun, 02 Aug 2026 01:45:50 -0700 (PDT)
X-Received: by 2002:ac8:5f4a:0:b0:517:9570:c1bd with SMTP id d75a77b69052e-52b5673f0f1mr111124991cf.25.1785660349670;
        Sun, 02 Aug 2026 01:45:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:45:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 10:45:26 +0200
Subject: [PATCH v2 04/11] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-n-dts-style-checker-continued-v2-4-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13857;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1ohYjM0kcqQXFf/ASBsJHZYihajw/hCKyDfmALEWsBE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOtSmHcUFmGqNR70K2f2lvAcdqe1+dlmhJCv
 BGqvfa3LSSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DrQAKCRDBN2bmhouD
 1/MBD/9xrPwvoSN4K/nCkc6VlLzGm16TLXuV+w/5sNML62v0uSr1AT5DyM8qztumq9dKXSosbh+
 QlW2yHO9O0BtNuNxncq4AbhXKJfBpfu0rx9VFweeW5//ZPlbu+nplZ3h2dsIPJsOCJcIqGvS0PZ
 vjpmtOR3mDZv8ypzpczpoUi2aFPbfAWCkmkG7LOP9JVj+Kl4J9WjXw5XuQtNeYH51EEs4spoKBY
 0T13iJSFQvsu3HJzvuhcGRReBh9l7hsQ7U7s69B1oHq0nQ2ViBbQneCi9PSXbFzT07KlRQRBaVG
 hxvrS93ataTm7qRCrRaXKnzZX8DHBSG4IImh8uC16CTjQkY2M5RZlN4GKTePRbSTm6mRl8CVYLZ
 LXABanEUb4yhHLTx0sWaRhYKfGexTnmL8tHgKN9WWsSVbOOr/win3r5Vb8SXqkq/oeKSXEpU00w
 QZt++3iwRGzGQK4AbrEIEYXnv1dK32Oiy6sybjrDqlPZo1O5hraqnoqTC9XUjXFKSwgHD1QbOWT
 SztvUOzpJ6GFeUwD9XBgtcNcymFQstztsHOv8nCAriT2iJMp7eDsZT3jh5oZhoOoV7yMhtKga6Q
 XeR1ZmYWV8HFfQYO+5TvqJHZ5JU98MXBiMWrOfghY5hf1yaztttnyi/y9NO7BK7OqDB4nCuNQeI
 hcnCTOqS5m/KPSg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: D2-yGpV20SANe9ygDeBwu3vfTOyLNdMW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX6+Hv+Rn8fhhO
 2C/6apPvvud5RrOoSaq/zWq1+S3lmra1lcIRGTgKCDZS+WCUSyDb+5/dVda85Vq7x8NTHYZrKjO
 7QEPqPvc5MIdrD5vAB5tBChtl5vvkm8CX+2aW/ghwelggGxGGWMjeJmRH473VV0mpH3FxNkkFMt
 OHgyHzp9E2ijWqI98L6WjQKeG53Mp17x27Aem65A8Wl0PxUzbRWgZtNvH6wEmISF5QmQVNnL5Qq
 W9qeeW4sarV2crAmfzbLqsicWNuOjlqL3PGVDh9LZ9dfmW804fqKrJNbND3I9ldrGVQqKtbXLBS
 xwlyW2k0yAktirTi6F0S+eYAMQHnlViJ1i4bKCTJPpq3yRlRwHS0mlO2Usfe3ACSI7XW3tqChgP
 D/gS0C7Gq/q4pK/ea3noQpV23vNvSDkP34KvQT4/D7TopMCINW+dZ8vi4ksxaHSVnYxBCt7NcN+
 um4GOUwepZqpv5vYbkg==
X-Authority-Analysis: v=2.4 cv=TpfWQjXh c=1 sm=1 tr=0 ts=6a6f03bf cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=nicHA5mNOroHdHr2fLUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: D2-yGpV20SANe9ygDeBwu3vfTOyLNdMW
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX2LthxOQsswfW
 y6KWUCgNhYEeblrI5MYWtIWl/hti0x5mCz4CJhogsRL40pCdDKm5+j0nNuGlrzHhe7DnQ+T///K
 2X3jG2uQFfbB4vz/rsmXSxNNtZjggOg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020072

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
 scripts/dtc/dt-check-style                         | 60 +++++++++++++++++++---
 .../dt-style-selftest/bad/dts-digit-node-order.dts | 40 +++++++++++++++
 .../dt-style-selftest/bad/dts-property-order.dts   |  5 ++
 .../expected/dts-child-name-order.dts.txt          |  1 +
 .../expected/dts-digit-node-order.dts.txt          |  2 +
 .../expected/dts-property-order.dts.txt            | 12 +++--
 .../expected/dts-property-order.dtso.txt           |  1 +
 .../good/dts-digit-node-order.dts                  |  3 --
 .../dt-style-selftest/good/dts-property-order.dts  |  5 ++
 9 files changed, 114 insertions(+), 15 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 1937c6feb57e..6a05929836f2 100755
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
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
index e2eea0862102..312a45ed913a 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-child-name-order.dts.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/dts-child-name-order.dts:16: [child-name-order] child node 'bar' out of name order
+bad/dts-child-name-order.dts:21: [child-name-order] child node 'memory' out of name order
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

