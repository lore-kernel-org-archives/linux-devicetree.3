Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D383B83E0
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747818; cv=none; b=FQSobVJNzpLZ/4+JnlhYLLuQdn1X3MmkycoQun+XR/Zppm8hOL3JS4LFoK7ElZySct7tKnjxcXDUi9Ms9VJCN8HIclx3cBgYEGFjV8VlhFYebxpJnrBdaDi6S5e7xaZlHYQ11GzuoUW7jxMWKIMHD12jTdPx7XFMyVYyjJsqeTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747818; c=relaxed/simple;
	bh=LjkbmCe6vn81FFu+ZMtn1oaw7c6HMT27qU1FnMtVjvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O5m3OhFRoVhxDVw7A3H1ebOWt6m41wPwYXUdWQAEECr46ApRDoLbdaGNmMvqJxintj5Wm0oILIXLKVFRKamfndn4VgCb0CcwxNT617z2r0BpEByjpYL22VcOFxzfK7zhWk/BvyqYummEpLR2QZMVeQo1+k6D44XLx9axwqaNT3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bcy+8QSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FvtqocVa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bcy+8QSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FvtqocVa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737Duth4041882
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fnX+Bhb9Lb7raNVA3JPHSL8HRf4LFQTpLNpp44RNZTM=; b=Bcy+8QSfYHPu0TsH
	0UXAdFWoQ/JZT4q730JwAlc/9yrmCJfzYm0sd4MEsFCjoaoKhPKI3Q/UY6oYFIgi
	AR8l4N9BIlP4+4i4KGGTD/Oo7iFyhtc1DH3Fi0p7bOF+enmuZnM8cELP1IOrOP0i
	fYTqNVxPP92jOzRFLrOBbRZ9CdDAraNZAiZA6jfuQfpQttzLKJe+FsBVPUgCZD3b
	C7jakTwC2JhUW8tNKnHE+YieJiv2JAqO46BQpG9xRNvpzOpL8l9BmBNPW84thdim
	OLUq+lNbuSubS1Q4Cdu8pwwpEp+BpvhCJqDJ9KU2zV77vIIhpdAyf2MjiZ1uLyh0
	n+4X2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvngnbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so57203581cf.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747815; x=1786352615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fnX+Bhb9Lb7raNVA3JPHSL8HRf4LFQTpLNpp44RNZTM=;
        b=FvtqocVaSFOEgyWFcfeJAQ1cMw9seRuJ1pePIWUSF4BpMMLHV3J4+5QIAGfRc8m32n
         OIJT1sDcul7X0bfs6x7b4rPe80HXaqCfKKHobMwdrnFPdhMJ7rZxgqO7IrrM/en/VWq+
         SXqPfQ5yWvhfMngRUz/SBwQvzS9Qyr/IV/O61RDygbgY0a2g74bIfXi9MqhaMo52bkgz
         XrAaTKpzlNJINhZV3CxUDFRndXUXbur2Yn7/FzOFIRECa4HrgdetsVok4bhqbKz24MFE
         dB782V5dmeaitt0mwu6BSv4N7WeANLMqmEP3e+HwsnvDIWAKwczpbxsxI55mBajOcD6p
         ZU5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747815; x=1786352615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fnX+Bhb9Lb7raNVA3JPHSL8HRf4LFQTpLNpp44RNZTM=;
        b=fv6Ly/VbtKFd14pLNy/7axbnCK0XLDqbEsCMOFNSWqSkLUmPBqhIzYr10rhlyheREA
         6E9RL5CJVTYScBXm89LVbmO8qQ2XR83Pdy2+iZPFhWwZiXzta5TIN5EBXUNFsgTLz14T
         Sr07/hk0BPR9qc7EkmaE0mx+MXCabtGic17Mc9dCuYQ8Ax7X1wQlqPzbwkS9JOzGYWDI
         wONK5R/3LRFprM/qIbT1k2RUWXXxUVdAx10xQu8UrlpCzayKwBzHm8uyK8vnOBwMkVp2
         JKGnp27lVrIWYWhbL1wxMi4S0snl9vpPBMbJ5IuBZl8JL1puKHPEBd2de8gKwuDaabbD
         6Bpg==
X-Gm-Message-State: AOJu0YxJ5WNyutUb85JqSM004nYBfbjJgFJRq4IMJelOBYJ+z0Jwydvq
	kBzzLop4JIHb8RqxKD1fPUeDimmX87cAwBTwWdTPWNO7i/55TmAIzsbPINhn4RCOLok2UfxR53p
	4YPlxCcytSTKdAVyTunBExhQ1gh9XYRmNE3+spna6Z8Olp6sHorHiLVeMuqcC+z8O
X-Gm-Gg: AR+sD11MmwX2Bb9Thdbxems1STJhkuAzONBkZA4aoyN5iLUjZq8WkQhYKH7bNE4xIU9
	vXNDSbe+/jbp56G6kOtQG7ssWd04FzCa2nKH7c+M7k6DZCbgtW8dHGZorlqruyUFPcQlyrvqjKF
	r6LPp7IuCm5OCdSEtK0dClvHrfNqG9pYGqHQZ9KgfQdAkoZGi94eJN78RHnppg4E3wU5X/ykUQN
	JWQ5bP0gtLIGY76EVfGTsR/W1TMhvv8VuTeklK/oUxa4vCZsl4acR2TMSRH51neoThJrhdDQQPr
	MEGZ8NqtQ4qQS9dJFvymQZ/Im81lTgsZE7Lb6pagK/m+53SU1GjAj2INe8WguqZJaiSJMZQBu1f
	GpvdZdecZjMWjvlmE614iw+66
X-Received: by 2002:a05:622a:480b:b0:527:7d0f:709c with SMTP id d75a77b69052e-52b567d0f3emr181101181cf.42.1785747815226;
        Mon, 03 Aug 2026 02:03:35 -0700 (PDT)
X-Received: by 2002:a05:622a:480b:b0:527:7d0f:709c with SMTP id d75a77b69052e-52b567d0f3emr181100751cf.42.1785747814785;
        Mon, 03 Aug 2026 02:03:34 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 11:03:05 +0200
Subject: [PATCH v3 02/11] dtc: dt-check-style: Simplify setting depth of
 DtsLine
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-n-dts-style-checker-continued-v3-2-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5042;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LjkbmCe6vn81FFu+ZMtn1oaw7c6HMT27qU1FnMtVjvE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFlX7rP3/bps2wQR5+1Pp5z3NfWThWrh63kxX
 Rm19NVuXiCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZVwAKCRDBN2bmhouD
 1zKBD/9nP/0DnnPL/v76mDdbXbBi3vnwkdAhz8N1oYlhQp3Nco2lylxN0vKr9qiWd5hXHFWMHKN
 L/9iX3W1b/1GATb2SRJV09Z6Uvz174t+qJ6Qe7GMqHe2DBXJJ2D1/KxSmc7aN+Ij89rltsf59zk
 1+YMKQzFWFw+VVB8QSZjPU9cppwujl/0+AYt5Hf8neW6QavFsEYjZBjxotBMzsH6D7YkdtHzK3g
 fr4DG/kdPm0aRNWIc0OTC8p4CAxc8+kzl9+SE+qTlMa9bAwCgW/SwL3txjZz69TfHJoXw1lFg8i
 1QFJ0NOeIA/7HBEttq0xTkLKz4xd74QbhSHqjUG3GBu9aeDyJK2AhVtGQi2WPfF4c7wKdk/D5XF
 bh634bV0+ULCcvqH/K/ImrsqNn40z1odHuPsPLtOxFtylpIWngflx7PXoSj/IW3AQhDGunl5lLY
 HzNsOZFJA1JBxfnzYM+H6jzzGprysEtqnkgZE9Q9d8/vjRHrEAg2az2Jw2cyESrSQPnEgkbRkch
 oJr7QE7Ys4GxDOV4njYAiXAEQF/Y9mtpLcUyJ5aWSs6P0IGr0OF0eI1HGU20PGdmaj+0KsGIV59
 CQEAzYTjP2CUqpZYhocZbHPFk4SRsSJ+cWnPJWHkdDt1UTpU7u/Zf1ix296GnOc3IDROlFRF6S0
 AmUt2xRe6hEXBMA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a705967 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8sziXlxsN6MBhN6jAs0A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: NdW8fTmSpPW6HtykiVMCAvPVZluy4y1Z
X-Proofpoint-ORIG-GUID: NdW8fTmSpPW6HtykiVMCAvPVZluy4y1Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX0oWClFg37V8K
 ysjZzcdJZ4z/gFjkY9TWkV29whngnvD+ZLa49eYzjrkHkYsUJIOqTAi2TFWru0atu5jvLyjwhiY
 cLyHcObhMVQrA80JGpnnJUNcgZPnkoNHvjvEeRjyVhl25rh+TY2yGlpl/+SwCp4urnqZdSPdlm3
 pgV42cyWb9Qg/a6pmcOqzEzwUyAkipBk7nVLgnfagcTVb910NpjqG504FO9CG3wQ5zX6hzNYIPx
 SI0GYDHinE1wDA89ewyya3ee7kzZ9JspMzmqNC53CIXec/3lK0ysnzV1vn+SqjAwMd7oy/Dy6wG
 iUFwBsMCG2rXVCh72GKenJKr0P8DB2tOpCUvbvE1ukcsWAWixDyZKil+pDyPuNrukILLNTfXWxT
 QszNpx9LJoIOA5x4JwTQR3s1YCI5ORb0NW94oP4rQ4UDRMORJ7hwDlsOTZSjgAJ/52AsL1pqKvK
 7HuiZtHFr2b45Lf4JYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX3wBKdQjLbPW+
 HuThHQZuM5jx57oABrJb8lW/dah44Z7/0sUhHqYo9ikuKXpkE2Tw9QO74CnfLO0eZ3luFweZIZp
 mfC4T67irtUBb2sCTw2WQZesEMBGm7s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030080

When creating new DtsLine object, pass expected indentation depth as
constructor, instead of assigning it immediately after, so the code will
be easier to read and explicit (depth is not supposed to change during
DtsLine lifetime).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 3985923622e8..96deffc0d8a7 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -82,11 +82,12 @@ class DtsLine:
                  'node_name', 'node_addr', 'label', 'ref_name', 'depth',
                  'closures')
 
-    def __init__(self, lineno, raw, linetype, indent_str, stripped):
+    def __init__(self, lineno, raw, linetype, depth, indent_str, stripped):
         self.lineno = lineno      # 1-based within the block
         self.raw = raw
         self.linetype = linetype
         self.indent_str = indent_str  # leading whitespace as-is
+        self.depth = depth
         self.stripped = stripped
         self.prop_name = None
         self.continuations = []
@@ -94,7 +95,6 @@ class DtsLine:
         self.node_addr = None
         self.label = None
         self.ref_name = None
-        self.depth = 0            # filled in by classify_lines
         self.closures = 1         # count of '}' on a NODE_CLOSE line
 
 
@@ -162,16 +162,14 @@ def classify_lines(text):
         # or a blank line).
         if in_cpp_macro:
             dl = DtsLine(i, raw, LineType.PREPROCESSOR,
-                         indent_str, stripped)
-            dl.depth = depth
+                         depth, indent_str, stripped)
             out.append(dl)
             in_cpp_macro = (bool(stripped) and
                             stripped.rstrip().endswith('\\'))
             continue
 
         if not stripped:
-            dl = DtsLine(i, raw, LineType.BLANK, '', '')
-            dl.depth = depth
+            dl = DtsLine(i, raw, LineType.BLANK, depth, '', '')
             out.append(dl)
             continue
 
@@ -180,15 +178,13 @@ def classify_lines(text):
                      else LineType.COMMENT_BODY)
             if ltype == LineType.COMMENT_END:
                 in_block_comment = False
-            dl = DtsLine(i, raw, ltype, indent_str, stripped)
-            dl.depth = depth
+            dl = DtsLine(i, raw, ltype, depth, indent_str, stripped)
             out.append(dl)
             continue
 
         if (stripped.startswith('#') or stripped.startswith('/')) and is_preprocessor(stripped):
-            dl = DtsLine(i, raw, LineType.PREPROCESSOR,
+            dl = DtsLine(i, raw, LineType.PREPROCESSOR, depth,
                          indent_str, stripped)
-            dl.depth = depth
             out.append(dl)
             prev_complete = True
             in_cpp_macro = stripped.rstrip().endswith('\\')
@@ -205,14 +201,12 @@ def classify_lines(text):
         # structural classification entirely.
         if not code:
             ltype = LineType.COMMENT_START if opens_block else LineType.COMMENT
-            dl = DtsLine(i, raw, ltype, indent_str, stripped)
-            dl.depth = depth
+            dl = DtsLine(i, raw, ltype, depth, indent_str, stripped)
             out.append(dl)
             continue
 
         if not prev_complete:
-            dl = DtsLine(i, raw, LineType.CONTINUATION, indent_str, code)
-            dl.depth = depth
+            dl = DtsLine(i, raw, LineType.CONTINUATION, depth, indent_str, code)
             out.append(dl)
             prev_complete = (code.endswith(';') or
                              code.endswith('{') or
@@ -227,26 +221,23 @@ def classify_lines(text):
         if re_only_closures.match(code):
             closures = code.count('}')
             depth = max(depth - closures, 0)
-            dl = DtsLine(i, raw, LineType.NODE_CLOSE, indent_str, code)
-            dl.depth = depth
+            dl = DtsLine(i, raw, LineType.NODE_CLOSE, depth, indent_str, code)
             dl.closures = closures
             out.append(dl)
             prev_complete = True
             continue
 
         if code.endswith('{'):
-            dl = DtsLine(i, raw, LineType.NODE_OPEN, indent_str, code)
+            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
             parse_node_header(dl)
-            dl.depth = depth
             out.append(dl)
             depth += 1
             prev_complete = True
             continue
 
         # Property (or first line of a multi-line property).
-        dl = DtsLine(i, raw, LineType.PROPERTY, indent_str, code)
+        dl = DtsLine(i, raw, LineType.PROPERTY, depth, indent_str, code)
         parse_property_name(dl)
-        dl.depth = depth
         out.append(dl)
         prev_complete = code.endswith(';')
 

-- 
2.53.0

