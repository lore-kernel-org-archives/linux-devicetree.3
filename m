Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111383B7770
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742986; cv=none; b=JIK5b93II8Ct2JWiYbaov7NFQ0RqyZm752RNDVYPVJ+GAxVOE6akBELrEYS6jMjRuhvNUJ87Y46So8URi6Lyx1cglzx6UBUChNmfFuQ46ph4Jx0ktPoGwwg/CCIxXA6ZlTfi8iLPUatuCLvpl4G3VnTNUYa6pg+cgqIXbUH0gUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742986; c=relaxed/simple;
	bh=vUywCdt9f5EiGeQ9MbdCyKVHrE9ryco4S02U67mU+54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=egGU0fG++grn9zW5Wyz+B8TI/IH7yD16TzLFaTQDUujimaCwbTusmZdxY0P8yJWQABMUNVGI02gdzKi4dGxwsdlG43Otnx5VIIPeK8yt73jynExLHptGn9CwFeHdeLgd8Eswn+1C5jYux/eosoZQFAT2PUZ2aUQw/Pxhmm5VONo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caj7VnVA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jC8mTS8N; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caj7VnVA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jC8mTS8N"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH4W83648234
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LjRoNeoFbcKwdkt38RcjtODM1aSosiJ7EB/zrpSw2Wk=; b=caj7VnVAxRlUSffw
	SFB+VWPhkpPclHwMMlXy0YxE1yQq4vOhAWutFnq/1290tC7jIKKjDrX/0kqtFOJo
	xBnbyjx/aUywxxlbouv9PNsgOoOQrUgcCKgd5GfGJ0O7MlEbdb36mpwKssNOpAoX
	nqzLdFq2ylSCZcfkfLCqnO3J8c1moAOWF8VoxRQfJt0SMqBOWDkH/MAxLsSm+e0+
	FOf08XQhWz/vzTWP7E9Q8+U0Uxc0Haf8gAsHeD2p7/X9Q5zULikerf8cNCDPY24L
	8s3avKUbUPZGmW7eQc3/V4Enf6jxQ/SSDGlS147AanoHMnF5QU8TvH9yE1NOoBbz
	/401AA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthrurx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ee59064d2so1834031cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742974; x=1788347774; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LjRoNeoFbcKwdkt38RcjtODM1aSosiJ7EB/zrpSw2Wk=;
        b=jC8mTS8N/RSmnn3nnqVDhpn2OsPRKznjE1n0kNhTwzLy+kc/eHYUVcjABA0USPVS44
         DA0X77GdcbBlKdNcF4slx+8hugS3EN54NMm5+rJrGqTsb8AasUMDiJ9FF8AApyM729i5
         OUkvSOdZkQ1t/orvtA3wvTENs5/St9uPP9/dQUkRuPK/etnV9xbm7p8dYY1LvNW+BRuL
         CmRrLKqRLzAP2Y1+KOhE5IwAN6X0DzCLn3OHUdzRrVXdF3iw2kzMKDAZ9NK2TzXy7guG
         p4VGQMD+1BlF5ahPaY03b8TXQ9mdPGnEg68lKBZEd497rZLH1YXgY2Oqw/azvPiNnBeq
         2Jng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742974; x=1788347774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LjRoNeoFbcKwdkt38RcjtODM1aSosiJ7EB/zrpSw2Wk=;
        b=dtgF7zYIubCEyu4ojsI4NHz3+68Csnt1DdAz09x0akwbEbx9wZ17b61x+nVZ6MVWYP
         NRnrjmdPlyzZpDrKRtB+l26OOyQeN8yQ91iIzEwS8/pzX8b02C/nhOXkuEt/wISKR87t
         99I6yVDKGLR//yMhNT9c0rAvH+2UO7nSN2/ClxBkzW2PJLSMAI/B5yiOxrzVsNz6qopP
         zUAGHA8eJ9wd2l/X/nUNwCKPNSEtYY8+eT7n8ZBUuVBGoM9XkT21lCByzPEm3GO1JZj2
         GiNEw9ZBbzLTmdzeUxthwo8ZQUfvR2ev340x2VwAWzGhDh62D9fOeFg+9UNSL6i/XJUO
         OxGQ==
X-Gm-Message-State: AFuF++kDTXcS1GGIs8xDIaPnGyWivS3ZK3yksspfiIaRNYwFq3pzgpQa
	MZWSzsGmHxjJvKFaxBWws1WH1vlpxSBbK4sDn7dL1wWAfGTleVoRELvlmc4d9/8nAd5XdT6CK7p
	GHukR5qSSSaD1Hzdb5M0FnvKuBAAW20/Pn8stNiufzT1OdYA/3c9PpA2Z/o0KVRXE
X-Gm-Gg: AR+sD10ioRveS9i7m1pK76QnHH6TFYiTdIc3nHrmHuQjchBp+/3sL9xALvct1p20Ag+
	K5ukpl0onJVpFPOc1aAOdHsfU3groJhwj9cRewTsbbRq2wHqGNPkTghRbYgbBEuiiyQ0gMqeJlg
	b0usyHwgDzgKmwackhWA1o2zDsyhNAMUvGfc7cEP3WkOEyik2cGYkcE0RtMsvpGzKfsuywKVjAg
	aBM0wU0CiifGNCS71zUgHHBT1tWHjDvAaYWl5ykJVG2LrXhDLfR6vfG7Y5AvAWv9x/UxFPW/ze8
	7Ajeg0jXfKHpmamErUqntut+nz2yGYG68LMryrUJDAaVDOuZ2ongSoB0eHDFLtgkoKtfh0cmrd4
	7be7oh8iEYzRIqTxpMPYwb5Y=
X-Received: by 2002:a05:622a:1e0d:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52e2ecc147amr158271061cf.10.1787742973767;
        Wed, 26 Aug 2026 04:16:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1e0d:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52e2ecc147amr158270021cf.10.1787742973119;
        Wed, 26 Aug 2026 04:16:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4577843a12.13.2026.08.26.04.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:16:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:15:55 +0200
Subject: [PATCH v6 03/10] dtc: dt-check-style: Fix alignment of values in
 continued property lines
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v6-3-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10257;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=vUywCdt9f5EiGeQ9MbdCyKVHrE9ryco4S02U67mU+54=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsru9LAxBtdKQCyaE8ACS18ZzMiUCfhdCv250
 jrU27YpRIeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7K7gAKCRDBN2bmhouD
 1zP5D/9FatNHQ4AWj+5Z207jVRneW0bteQ6g5kFCyeEmU9/KfdP3lJ+tk59YkhGhfbPurCAxP3U
 QhQEs0Plw+7BPpCGXqEr2PCqVegvfS7L/6EPRsUlWZ48MM6BAS2OssINx2KMzbbPMhb8EOMUid3
 d6Ugo50HrxuIX2e/qvur6M22/yWNHtdFBKr9I7CVhQS3MK8afbMtLDpVxZvRnlCXwDfNV7Cq4eu
 ajb86Tj5a0jie1qcj60u8VL4vyxBMImIbFslSoIbEw0DC1TrhNSmS6AjYZ5waoHrWU8jE+EhPkC
 TfUlAikba3lTHqP6lWnfczWRCcgjzaIHaSFHJ6XM7eREneL6zAayuoCevaszRSLB/vTeQz3rx07
 qZsdJNzHj6UBDnlPoOk/CkigiZzCDnWS3aAvF+wvSXmK1ry+BoG9d7GnHig0OH7nH1wR3xY4pNO
 k9hhaxf1QFu+PVsutdZH10qqKqZVLtauTF+a4ddS49kg5p95B+kES8ByFfmMzFM5KMGN6ZMwVP3
 yzUOmF47FCi/SJ+8mzU5cZ1VvCNZi1fVxpq0IKwj7l683i3sQg1WOFz909LSYmU35+fUF7rglAQ
 GsGi+Q+4Og7Ri/6wPU1fgzH7m2DqjGrMJmDOPKFbv1+kX8AAD09x1vKDCZim1o124l56uQPzWOw
 q6XV0g5f9SDyQmQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ecafe cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=hSPt3AOBSVI_F3cxmAoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: 3ZQ5ADDGrnB3RhptbeJuDgN6ktuSVCsY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX1/urR2f4c1CD
 g4luw1rGqxn8FTnX7/mcXesZy13TvUlDNbnwMMwkviNIbn00MKu/EGl9f3xaIXYg2y0j2IvkLgw
 KuqhOZguWwVax5OLl15fdEdFD/hxLcGENKhnahwrc0T4ZdDbeHMxHseQICPbdGiutk3U1pu2dch
 MtnKW8aRMMOmhn4VoTGq9wfU5is4tu2opxOg6nfVF9bK/b4ZHr/yCJtdqp9Slbcm7yySlZnwZOJ
 ts8XOcn14ltkqOtA6HSO1U9jCQpoSS+OF2PPjGxSJmd0ojIBA+4+DYZWkmdoc6tsCrYuz2V0Opu
 Pr3/B/fFGJmmVihBrVUWHBgZ9HKqJemWwdS89B4L3cW0sXhZhtvFIDnqwtpvTX+CuNtmTiqtl3O
 KP0k5JyfTTro7fQuq4fPhKqNM50aACAWvrM4v7ZG8u1Dh11XadOEBJM3zGMAqlMWel6G+HVUIoF
 Qjl7tmaz9ijoH0ypgIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX4M+Ww1Xz4nnS
 2SOgwoLgiWWCplTyxF8XAQxxmJtyYG6E/BBVJXOD1Kdcubpheh2gsY/RakAOb0HmxHLxLaq+4uK
 xyW9b8HqWC15DQf+MvgqbU4ifCPnbhw=
X-Proofpoint-GUID: 3ZQ5ADDGrnB3RhptbeJuDgN6ktuSVCsY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260093

Continued lines in property assignments should be indented to opening
'<' or '"' if they also start with that character, e.g.:

  reg = <0x1000 0x100>,
        <0x2000 0x100>;

If the continued line is part of previous phandle, then alignment should
be to inner values to make it more readable, e.g.:

  reg = <0x1000 0x100
         0x2000 0x100>;

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 32 ++++++++++++++--------
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   | 26 ++++++++++++++++++
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |  6 ++--
 .../expected/dts-cont-align.dts.txt                | 10 +++++++
 .../expected/yaml-cont-align.yaml.txt              |  3 +-
 .../expected/yaml-value-ws-multiline.yaml.txt      |  1 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  | 13 +++++----
 .../dt-style-selftest/good/yaml-cont-align.yaml    | 32 ++++++++++++++++++++++
 8 files changed, 104 insertions(+), 19 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 22e1ceac7f8b..eb5045f0ad9e 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -926,10 +926,11 @@ def check_line_length(ctx):
 
 def check_continuation_alignment(ctx):
     """A multi-line property's continuation lines must align their
-    first non-whitespace character to the display column of the first
-    '<' or '"' after the '=' in the leading line. Display columns are
-    used so tab-indented .dts files (where a continuation aligns with
-    tabs plus spaces) are compared correctly."""
+    first non-whitespace character to the display column of:
+    1. the first '<' or '"' after the '=' in the leading line, if continuation is with '<' or '"'
+    2. the first value, if the continuation is still the same phandle.
+    Display columns are used so tab-indented .dts files (where a continuation
+    aligns with tabs plus spaces) are compared correctly."""
     for dl in ctx.lines:
         if dl.linetype != LineType.PROPERTY:
             continue
@@ -938,17 +939,26 @@ def check_continuation_alignment(ctx):
         eq = dl.raw.find('=')
         if eq < 0:
             continue
-        # First '<' or '"' after '='
-        rest = dl.raw[eq + 1:]
-        m = re.search(r'[<"]', rest)
+        # First '<' or '"' after '=', but ignore comments and strip trailing
+        # whitespace (e.g. remaining after removing the comment)
+        rest = _strip_strings_and_comments(dl.raw[eq + 1:]).rstrip()
+        m = re.search(r'\s*([<"])', rest)
         if not m:
             continue
-        target_col = _display_col(dl.raw[:eq + 1 + m.start()])
+        dl_value_complete = rest.endswith('",') or rest.endswith('>,')
+        target_col = _display_col(_strip_strings_and_comments(dl.raw[:eq + 1 + m.start(1)]))
         for cont in dl.continuations:
-            if _display_col(cont.indent_str) != target_col:
+            target_offset = 0
+            err_msg_explanation = 'to < or "'
+            if not dl_value_complete:
+                target_offset = 1
+                err_msg_explanation = 'to the value under <'
+            if _display_col(cont.indent_str) != target_col + target_offset:
                 yield (cont.lineno,
                        'continuation should align to column %d '
-                       '(under < or ")' % (target_col + 1))
+                       '(%s)' % (target_col + target_offset + 1, err_msg_explanation))
+            # Align to the value within <> or "" of continuation (so the previous line)
+            dl_value_complete = cont.stripped.endswith('",') or cont.stripped.endswith('>,')
 
 
 def check_unclosed_block_comment(ctx):
@@ -1052,7 +1062,7 @@ RULES = [
          'lines must not exceed 80 columns',
          check_line_length),
     Rule('continuation-alignment', 'strict',
-         'multi-line property continuations align under < or "',
+         'multi-line property continuations align under <, " or the value under <',
          check_continuation_alignment),
     Rule('unused-labels', 'strict',
          'every label must be &-referenced in the same example/file '
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
new file mode 100644
index 000000000000..5390ebbf4059
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+		reg = <0x10000 0x1000>;
+		clocks = <1 2 3>, /* comments with " < , should not matter */
+						     <4 5 6>,
+				<7 8 9>;
+		interrupts = <1 2 3>, /* comments with " < , should not ... */
+				<4 5 6>,
+				<7 8 9>;
+		pinmux = <0x01
+			 0x02>,
+			<0x03
+			 0x04>;
+		power-domain-names = "foo",
+				"bar", /* comments with " < , should not */
+							"baz";
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
index 92778540b056..ccf443173dca 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
@@ -25,6 +25,8 @@ examples:
   - |
     foo@1000 {
         compatible = "example,test-cont-align";
-        reg = <0x1000 0x100>,
-            <0x2000 0x100>;
+        reg = <0x1000 0x100>, /* comments with " < , should not matter */
+            <0x2000 0x100>, /* comments with " < , should not matter */
+              <0x3000
+              0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
new file mode 100644
index 000000000000..a7ed62677a2b
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
@@ -0,0 +1,10 @@
+# mode=strict
+bad/dts-cont-align.dts:13: [continuation-alignment] continuation should align to column 26 (to < or ")
+bad/dts-cont-align.dts:14: [continuation-alignment] continuation should align to column 26 (to < or ")
+bad/dts-cont-align.dts:16: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:17: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:19: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:20: [continuation-alignment] continuation should align to column 26 (to < or ")
+bad/dts-cont-align.dts:21: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:23: [continuation-alignment] continuation should align to column 38 (to < or ")
+bad/dts-cont-align.dts:24: [continuation-alignment] continuation should align to column 38 (to < or ")
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
index c0801c56d5db..eb9a84d5c222 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
-bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under < or ")
+bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (to < or ")
+bad/yaml-cont-align.yaml:31: example 0 [continuation-alignment] continuation should align to column 12 (to the value under <)
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
index 3df55b1762d0..d25b5b425e3f 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/yaml-value-ws-multiline.yaml:25: example 0 [value-whitespace] extra whitespace inside <...>
+bad/yaml-value-ws-multiline.yaml:26: example 0 [continuation-alignment] continuation should align to column 12 (to the value under <)
diff --git a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
index 36fb4eefcd83..b52ee6cccd8c 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
@@ -15,12 +15,15 @@ / {
 	interrupt-controller@10000 {
 		compatible = "example,intc";
 		reg = <0x10000 0x1000>;
-		interrupts = <1 2 3>,
+		interrupts = <1 2 3>, /* comments with " < , should not ... */
 			     <4 5 6>,
 			     <7 8 9>;
-		pinmux = <
-			 0x01
-			 0x02
-			 >;
+		pinmux = <0x01
+			  0x02>,
+			 <0x03 /* comments with " < , should not matter */
+			  0x04>;
+		power-domain-names = "foo", /* comments with " < , should not */
+				     "bar",
+				     "baz";
 	};
 };
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
new file mode 100644
index 000000000000..2e7b8582bb7c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-good-cont-align.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with aligned multi-line property
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-cont-align
+  reg:
+    maxItems: 2
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    foo@1000 {
+        compatible = "example,test-cont-align";
+        reg = <0x1000 0x100>,
+              <0x2000 0x100>,
+              <0x3000
+               0x100>;
+    };

-- 
2.53.0

