Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E99385D73
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727985; cv=none; b=i/FHmtO4nEdQzlJAOKnEF8fZONcysZvFxGSOfAzprGubuuP3uOQuiUEBaC77tZZhWzu7MsZ+31qQPo12Ru+yI/BXcizDEJcPfTensISt+F+UJSGXMC/4P8CDSX/Kt0Bfg9w2ZxRSPxMv/GQzdKJoHij/iEyw7yxhugKKE1oSd7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727985; c=relaxed/simple;
	bh=gkQBOWvqKXEAALCJMdR1ZeGPxX1TspV0C1QzCvNDdVQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dSnQ7ui67aljbStacipg++JIfuG00duMEJtlA2RiNHESrxg01N7Gf7NxefTDhKmRPiZlPYO070kAWPDic+4sQMl0RwHI9QhxQNXyzWQHznlPamkHX5VaxIoaXgLHaInM2w7cs8O3Y174eOpNcn6EVL/rBjdvt29CK6uiH9O3GkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5bpL2rG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WcOHAGQU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5bpL2rG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WcOHAGQU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6S7ka4189928
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COmDOxR8cLKI2M6JmLNRqnensPRPRk/PTkPg76/Qp5g=; b=f5bpL2rGbII+5nFy
	EgKebKwDVkXIATbbjc0KSWnFPy6gefjGh7/093L+wsWqKJUw6OWkS+vj4dbIvSxy
	ASuBIdlInW7gKZmslElEFQTpsPSzwI5tz9IiZjHp+TpH5BxPO9KM8gPKsQ0UJJVQ
	Jxrh/jiaUNV06vwoabwdELGEBba/sefaaiLXjQjToKvx54UTzya2K/YZcezFGrdM
	HKPr4rP/Cxkhc5sxfm65HM6lU57mE6vu0KNsVe+IZqKHOmhTq7J5RQJegj93ogo/
	aHArHnY3jcsBqubBqE98AYzGcWFF4aUB61UiwLpRXYBAm7a5G1AcoJz90GrtZg2x
	v7RAxg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgpueqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso13019871cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727981; x=1788332781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=COmDOxR8cLKI2M6JmLNRqnensPRPRk/PTkPg76/Qp5g=;
        b=WcOHAGQUXoznFso/3hE30r0RIPEvwEE4waSxm6M/zVLJJauTGbXPF99/YqnMQO/zj1
         siUe5EgnPIOZeGSmHTIIQT9hoTnB6T4JRWVbUBrvjLNoxyPHvW57gQjqsEHEJpyTGRQ4
         y0q3fX0G8pAeBI/7y0zfV0LWahpy69Sthw57v5pftwXxtyDlQvWRBiByoIFdEvvJgs3V
         JNFGTTxUpyxNi1ZybFoo+ueRX3rFe7YCkNFRwQNyMMvsf01pycXEbertJ+X5raATDLpP
         SxdCfVvRfkiwVy5njKbaHSRIVuga134kcxlJ9YLdzfe26unch9RJx0sSLePxynPu6hY8
         kHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727981; x=1788332781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COmDOxR8cLKI2M6JmLNRqnensPRPRk/PTkPg76/Qp5g=;
        b=gwScTdAXm5ibN7/iOcyIbx7nGdJdy0S07hXxPLAJJcNnCW14ouX1nSfbAEZxW7d7ea
         Z+rAG1ovwbSGmgh7SvBZbGIwvLwFZmOqiP2+8wDALVaEQVKeX56wmtT95XmpuZjVYrfe
         6HqPN2PeUDP6B/5J/o6aoKXMZx7rDHIvH4v4mDDsFh8TtO1BVj4LfWz5B9iimPT46DyW
         OGSYe+Q7r9JDQLSbjtmpYb6Dama/0CwQCdAkx0pr4zkadispuKDhzeRSbsmHG1ke/xP/
         ZNL5Xa+7W7bzvC8FpheHswnE1b0Y4SPkrXCsOWWF2Py7Tniz+d94TYVoS9qMeRfTRSLG
         QtPw==
X-Gm-Message-State: AFuF++n6N3a4Ob6K3Dr2mCZpekKcyewTbOoEJoKi8es8iwIRsHNxA1Oa
	E5IKZSNePWgye3fiaI8vYfy3GPDy52aaf1I4k5bF6Atc8PUIGAyczUDT/WKImnFh3MbJVEAqKOX
	SPSuCqS4QxtJFWgmyL7cgbLkkmy8f+oSfrm80565R9ODtCAWyp2O5rdbdLLw+Gldp
X-Gm-Gg: AR+sD10SmSwP7Rzsef1bd/3kKJf9yDXq6h4P4aatKgRg2LrM0B5BXZxaWPNWD1DJUad
	I/vdrfkMj0jXqB7Vn7WCIAPFjPjJmb/AvqcYq/6gkp/sflB4PuIjbyFl/RzFTyo9wj2GRGB8Ma7
	V5aLp5IlT/ahDMj6qdIBXB/uwhQVjiJb6ZWtJEIeD9e5pRC0XlIucpm4sr56XR4eXMDsqUvT0Em
	HePOI428uBYELJXL7prGsoW/8vaXuhaJKG6cuxQmKlxFNTHaqTVuvLsZyOk+IZdFnX8xsrHFysT
	uQ9mTSY6xIYQ+DNHO3eIgIxc2H7knRbDzSLdv//9n0eI1wAgdKVmv7FASdE2wjaEjdGnJs+HFJy
	SPVMJfA1V7Nqo5PgFSc8ff3U=
X-Received: by 2002:a05:622a:1248:b0:52d:796d:4563 with SMTP id d75a77b69052e-52e4237ac2amr49757901cf.26.1787727980613;
        Wed, 26 Aug 2026 00:06:20 -0700 (PDT)
X-Received: by 2002:a05:622a:1248:b0:52d:796d:4563 with SMTP id d75a77b69052e-52e4237ac2amr49757341cf.26.1787727980024;
        Wed, 26 Aug 2026 00:06:20 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab82sm366812966b.31.2026.08.26.00.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:06:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:05:56 +0200
Subject: [PATCH v4 03/10] dtc: dt-check-style: Fix alignment of values in
 continued property lines
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v4-3-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9209;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gkQBOWvqKXEAALCJMdR1ZeGPxX1TspV0C1QzCvNDdVQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjpBb2vHm+iCAOn8SADt9FwE6572d671NwHFj1
 BA+L26g9tmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6QWwAKCRDBN2bmhouD
 14JOD/9n2rTKo/8FDLaltpdgkl6y/Rnk6hB3nTOxp8eswE1ODfoAc5ijx611k74MjYmubcrJ+PO
 Ss1np9l/v+tRtZ9id0qwBVa1RMOqjvw4BilkRADyQiNlSPhoCnhSxeLUVcbsXbqW8Z/ejj5etET
 uv72XS4RnOml187jHKO1pKLTKs7+Crg15mrUBcxjJX1I5T2LQS7LDkDdAV59dqVDHLcAm0qSNYa
 cpUSjqDIBE8zTCAEVAknGfMxcczf2YfxctnjyXG+UfOJMC0skGNFOdrPx3+1uzKHqIvKXEXeF4a
 tqGEUE3LSRIH92FvqGa1i2922LWf/c6UpoKBQuKJjE86cNG5tANSbz9ymo8pa+cRFBLrWqMjUiQ
 wMjwXOcaPnTayb7n/TAv6ZGMRdQW2iH/oKeuUwhm+Ie3asEuB1Zq4fSa2nkwBSUEOVUQ7J5/K+v
 k5VrbrUaHOm/pX1VsMzihYMuN/pUvdUPBWqF2025cR44mxAF5UdoPS7xg3m11nvJCvoH91HwQw9
 +iEsR1UFk3+8qF6SM4wEDz5pJa9cXnN1UzUfo1yJpp792fcXL1d9HQd/T8FYm9W6H9+0BsjpxFd
 YEsLaUijOQS57CHJwELjP7DRcN79pF+wQTMlHuhLuDoKkOArBeu/ZgCcdnW7hNelXsuezCb7AcI
 YDngShWBUkmEM5w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: zc--VV3wMPe1DU3moJkRI9cYgIgPv7di
X-Proofpoint-ORIG-GUID: zc--VV3wMPe1DU3moJkRI9cYgIgPv7di
X-Authority-Analysis: v=2.4 cv=I+NVgtgg c=1 sm=1 tr=0 ts=6a8e906d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=JHzK3u4RkIQMqoYOWxQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1NyBTYWx0ZWRfX1+jnY6iQiw3u
 m/R4VKMknCNGzSNGQtR3Z9cbLgM9PO0T7llB2TYVZJyOAZIr6igHFNB6gwlr5LtwDgryS7D9xvd
 41rM4G5apXchV6vd2W2E8G+HGmU1tA9ytEyQr9OyLzSr1aF7dcGqeomxfrGxidnU+PGaXqY9Q2+
 lDyFqvUG4fbZUUvrhCrojAm1TV1YcUXjw1UdwmQu+72J5JESWYXN+y70vgeL7uqYHQLx2Fvu243
 yK0Sb224CFK+Qj/htky4643jwnPCX8eJuCZE5hpW6rk6Pt8xtweXsXRqNh45gjML8rdk/VG4JXY
 IzBYhRY1u95M2SxYQdCnYjmc9mw64WVt6lnW4Mgz+lkTbgXstkMVh1qTUGOv47A24SMyiW8WJ/g
 /pBPaUNOvyc6VVgdvdNG/MQdE3APwQp+KPEYcms6Cjwrvp4GhNmiqnkIecl0+5diBssE5IK+5yI
 BGTnaPfOs7qyi8cvSsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1NyBTYWx0ZWRfX/hf89qzCYFdv
 Y9QEp9PbwhHI8Vsbbh5ilivMfgY1+RtjgLVCux9QHQ6TfDr2SmkV1y4u6aW/9baSUtAeRkKa9Nr
 agGurPurVa/O4iMF4Gt6zQ4rVfsgHZo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260057

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
 scripts/dtc/dt-check-style                         | 27 ++++++++++++------
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   | 23 ++++++++++++++++
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |  4 ++-
 .../expected/dts-cont-align.dts.txt                |  8 ++++++
 .../expected/yaml-cont-align.yaml.txt              |  3 +-
 .../expected/yaml-value-ws-multiline.yaml.txt      |  1 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  | 11 +++++---
 .../dt-style-selftest/good/yaml-cont-align.yaml    | 32 ++++++++++++++++++++++
 8 files changed, 94 insertions(+), 15 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 833f8a03ddc9..486dd1d6bb9a 100755
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
@@ -940,15 +941,23 @@ def check_continuation_alignment(ctx):
             continue
         # First '<' or '"' after '='
         rest = dl.raw[eq + 1:]
-        m = re.search(r'[<"]', rest)
+        m = re.search(r'\s*([<"])', rest)
         if not m:
             continue
-        target_col = _display_col(dl.raw[:eq + 1 + m.start()])
+        dl_value_complete = rest.endswith('",') or rest.endswith('>,')
+        target_col = _display_col(dl.raw[:eq + 1 + m.start(1)])
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
@@ -1052,7 +1061,7 @@ RULES = [
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
index 000000000000..2087dac23d96
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
@@ -0,0 +1,23 @@
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
+		interrupts = <1 2 3>,
+				<4 5 6>,
+				<7 8 9>;
+		pinmux = <0x01
+			 0x02>,
+			<0x03
+			 0x04>;
+		power-domain-names = "foo",
+				"bar",
+					"baz";
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
index 92778540b056..d4662acc7b8f 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
@@ -26,5 +26,7 @@ examples:
     foo@1000 {
         compatible = "example,test-cont-align";
         reg = <0x1000 0x100>,
-            <0x2000 0x100>;
+            <0x2000 0x100>,
+              <0x3000
+              0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
new file mode 100644
index 000000000000..a4672206859c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
@@ -0,0 +1,8 @@
+# mode=strict
+bad/dts-cont-align.dts:13: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:14: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:16: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:17: [continuation-alignment] continuation should align to column 26 (to < or ")
+bad/dts-cont-align.dts:18: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:20: [continuation-alignment] continuation should align to column 38 (to < or ")
+bad/dts-cont-align.dts:21: [continuation-alignment] continuation should align to column 38 (to < or ")
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
index 36fb4eefcd83..1a1c07c09a41 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
@@ -18,9 +18,12 @@ interrupt-controller@10000 {
 		interrupts = <1 2 3>,
 			     <4 5 6>,
 			     <7 8 9>;
-		pinmux = <
-			 0x01
-			 0x02
-			 >;
+		pinmux = <0x01
+			  0x02>,
+			 <0x03
+			  0x04>;
+		power-domain-names = "foo",
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

