Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FC13C9EEF
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739705; cv=none; b=ZsvJxiEDxIgXdgOEXX7S5uJ+eZYWcXtE308wvsDtImVTD/76EHIWwB5Tm+EOtsx4VKjjDavtdW+c7U3ivQm49cz8BONX82NmITZD9wl1Xgkc18OZsMkOMABwD/8CkPN5jChUbhtnawhwGIrCQM7W9h3hEHQkrYV5XjTlC0WNTEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739705; c=relaxed/simple;
	bh=OUabwSWfavIXTw2drr/3+VZk+1cyKQHSZ5mqfGkS/zI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4BHxYRBpqkfuLNwmxrcx76RloeGTQXCzhofsxsyoQUtmCVeIsj3eYVwykfbH57Sl5p1XeChpwvRMvpecqpB2zJFCsSUvzAcNBNQg9ShJmfoGgi/wMqKIoIzojlEGL2FRckrAF2T4qJOq2yuL1gyvbgcKUtcr7yh953dXGtS0rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hb2ckuEU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WvN/u/93; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hb2ckuEU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WvN/u/93"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGgoJ647029
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pp4R1J8z0f93FKYvJQw79hTGJ2FR4gYrN4MAKLImV5Q=; b=Hb2ckuEUK7a3dkd0
	/p4Sf8zpNlLyPviIeH/snJ0PNU3tByz7xqNULRiaPbo1yWHpuU/nmpEURmYf/x7Y
	dwrv3L4a+861oPGMzg7JoHAuAC4AXyoTRfKrjJXCWQ6FZTUSZz2zlH7wOjYBtgTp
	nsn+nObst8GE1cY24myqDiJ8u0jOfTfVPXoLvvUD5JvzWqLe1tkUVZQ7kJa8/78h
	IGdzZ1uyxnxf0gRLWa3ZDJ6AZUwUJc/m8AZNqLILCJHfn0ywTQsbqyOopXXwQHOQ
	zsAYHIszJ306QTnqcg+e/dCoIVNKzh9DpLYzAXVT+QWwJ///0jr0sSi7fXEe1WkW
	vMPtKQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9g4mu612-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ec3146553so112483785a.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739701; x=1788344501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pp4R1J8z0f93FKYvJQw79hTGJ2FR4gYrN4MAKLImV5Q=;
        b=WvN/u/932+1TdhS+c9Wvcu1ycp+y5hS5WF6qj8T2lb7wqH/SgkwKaOx6M3Zc8VYsDE
         nue6W4VXls/MGgbITY0tgvJwDYVAJdDgHHP0im+LESsue+9qQRPP9mcVJM4ddRLYJ+oq
         PIT9ypBbbw+pJ2oex7SlF+GfSXguTbZ9ax71w1LwkfgUZaLdUG3pwciUJy7i04XY0aU6
         9J3aV1OIs3+w9G77kYjFC64ZA3FJgVeTEkXupRtUxNboUFZJsYMkQvZJOkjxO5udPegE
         Ix6tuxlaSo84zkp/97OgbauzFB39N3mUJcb1oTctXFUGdwJMeg3UdNsBIhe81tlBX2hH
         fNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739701; x=1788344501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pp4R1J8z0f93FKYvJQw79hTGJ2FR4gYrN4MAKLImV5Q=;
        b=qnugGVWYtnZFRxMm8XdX4o3d0Y3uMXNVYTI+YA/QjvefD5iXzGeg0d/04k5CCg16Ow
         Kkhm44JsOK2w96FIeJP2otyrNuJoW87Hz+DX/9mMJ0nlTbNA3rTjnmmxDrQ/daIfYMvj
         hQbImes24WUyuYvCWO7w35wuHJctyVTu7vA/7xOPJKM27O/jwWgi4XyCEr2FqXRs2paO
         uWcHg45PsfHq2KJluHcyLyhSRMKFUw8WVEvimOC85eyyJyGiVghqqmUdzrU3M3+VuL++
         DN6+MfmMLqjBHsvGDe2J/6hz0YJy1msStos06KpTBAPBdOIFopzy0VxW/8Szoq2G/oN+
         YxdQ==
X-Gm-Message-State: AFuF++lu2gLu3wCWFiZqTggRbxdePjAl8XKYMl9GTmwPkTlZByTLvoO/
	nvMW8GEHWnZzY/71ISy6W8kAJSFE5X1k+BtkzJ7wXqZg/DF4ID7RR1APUgfaEd7l9KEVmpTBvrH
	7osck/A5ArEpnBkVcBuLdk7Ur1Janr53AUVfjd97icxZlsksyLcDYxr5xEhDR0GTB
X-Gm-Gg: AR+sD13brEU7Gj34DlGqYt2AZNCik+/NA0gAOlm+f9VHQPkiF2PAKDPZ7D/I/DLI7qA
	AdRLIXpUXhs4nKsyqhCUwW4lmJ7KkJ26VLqmMq+G9ODN4K/qFOhh75gYBybYIPfrNNmFhG+8jxL
	Bg12N7Bs8pKjKmqU0U9DYrZ/uzugxF40u5E2B7i4jmidxjkCqs4D7nhLMzrYX7EvRecVqZ9Pf9g
	jtvJWl9JzAIJVzvEj+78rblg61jh2U2OB4CLSA/bo4sqFlwsqWNozN0LQ3+sewoaxRx+RPGMWO1
	xcHBcyen7tmMpnR+0RxhfSNMmCMZbtr2Qk9U2DevVk1Eqa9I9L09vs027201Yol+qWtA2v8C4u7
	wwC8OhTWfaJlHmBbYAAZuyo8=
X-Received: by 2002:a05:622a:28d:b0:52d:bec2:c34d with SMTP id d75a77b69052e-52e4232063emr53173131cf.25.1787739700525;
        Wed, 26 Aug 2026 03:21:40 -0700 (PDT)
X-Received: by 2002:a05:622a:28d:b0:52d:bec2:c34d with SMTP id d75a77b69052e-52e4232063emr53171181cf.25.1787739698319;
        Wed, 26 Aug 2026 03:21:38 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm479830766b.43.2026.08.26.03.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:21:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:21:22 +0200
Subject: [PATCH v5 01/10] dtc: dt-check-style: Handle sorting of top-level
 nodes and properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v5-1-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=28301;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=OUabwSWfavIXTw2drr/3+VZk+1cyKQHSZ5mqfGkS/zI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjr4lPEiVT33WzMbnWhWM3VT+sDofnvXZWzvgw
 Kov1QB5+JSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6+JQAKCRDBN2bmhouD
 12XUD/9IBUqGUxIBxz6ZMdPutr28RH/5unLeK9N0LeltSAoiwLxInQPhIR7BmtwajC76PJxkSJV
 be8pytWiAnebgz4cY2x4kqZ3EA5sgRV/lYhdWgsfxcva7fHa3KKTm2qFAWFSHlqWMkZyczDiXxg
 rnKRCklYPEgCNP8ZEbT1lrdu9HnuKDxtgnCFmFlW1e+dyS7DfxRHwfr6fQwZKhvKo+3c8CZktnS
 nYP3pc4D1t4OXuSTByRazulx88ShlHzrcTMwyNyVTudwItcMc++/+4MU/Eh9FOYo2w0EKlwsXZt
 EaIyfVcfpDs/afxJ4TGugHba50l06a08A32xGMRzQqTAdxtGFMdZ9pm1TH8Qmp+xNo94TMCzXFv
 fI1HPkvpEgPHRnn6fjru8GxwnhKM2rtiXkis8azb9zYjBjsu3SWzCB2Nkh+7n+cZzKwOeqCLiVa
 Cn3uJrqYVQsQ+Fu1vtu9qvpydQrOa8KETUXt+BnFiEfHU/rlJ2Z7py5ve8dMsEwB7VZD2a9ADbp
 nPWRZqk1StML4ACynnWNqNHyUPOyXnzNOD8qiv8SiMsKFwVX+esXS4lkfpUlMrZBjl5u7j/OTOq
 D1Fj8q3u0MK6P2NmexBdyHso+VM+i5gJBTiEozkgExhhiU/wBkpBrhTr1PnUagrzcNc7HKRjRlZ
 +oWISXAXkE/wNhA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX6a/arWxY1Wsf
 ndfkn9eyOBbSYADQ31ZBhxc/2C1YoPkNal9vveKMAzCzWBbFTq1h7GtekVAsE/hZvfQwpuEYl2G
 YSN9bGY3if+ksIK4pZsCHjmC4tUO/Cc=
X-Proofpoint-ORIG-GUID: qrghnnR6oWWaLQUP8dPlY6XDpxxMPMJr
X-Authority-Analysis: v=2.4 cv=eYgNubEH c=1 sm=1 tr=0 ts=6a8ebe35 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DEs8lHOyw9br0RGUMqIA:9 a=CL4GF0xxeNQD7lhm:21
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfXwLrzJOL73C88
 ysh9qCVo5EDPWEzSx03cvhasbxBDmyeridIfHE7MtYQarqjNweFL1s29AkP2tXCo16T73ZrSk4Q
 ZMAdO5601lgqum4LOtp3UI7HUB6tSCbVVkoW9a9wCi4q75DrJQuP+yFhTdT1Yti3AzyrQXhrSha
 ZCfh8ysvvY9kis1oOsYrl9iYdPIcYlgGH7gFStHY0iR6iev+gdE0UC9E6zLrZfYeGq/R5me4eiD
 tsxoJSgb4q/fQTgSpSKJydIWuS86zkhi+98+C3f7j/bTEwJcJwSRtsELCs/zPyGvGWjNrjoNq/s
 qSGHm4384RIsnbGhQG0NW5HlLLuLEHwN1kzE6qTYleUYfm4/WnhMxjYKcOS/+hMox9W6R1zIJn7
 QXSgu+jZSTpL0IYvyyBQb6TBSIYW+3cYfZ1O4KykneCsWvfBTnya+cgalS+o65yuf0EVp9+Bzun
 XGNeKt6ySz750CH0vzQ==
X-Proofpoint-GUID: qrghnnR6oWWaLQUP8dPlY6XDpxxMPMJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260086

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

