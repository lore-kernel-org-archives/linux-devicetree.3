Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30394195BE
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618918; cv=none; b=ULru4oy5p9YOmAyRd34gh4indC1ce/JsycnXO9KY1FennZLAf9I9MmzQHXkJShdpdOMBPoG7uVDTTUxJM4qwDoVtT31VqcZEKFYmALE7Ig/CqsbtCNT7hOQAD/VlyLVBTASdtk0EowZquyhQF8RbJQBQ5A9qBy9e2bGHhxhvdzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618918; c=relaxed/simple;
	bh=31Yek430e1uqebAy9ZELLFearIkajkO02QdXaEoVJTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aA1WdxraxpGN4aNZLsK+7/O2YxQPH4A0SJgwpu14nu254P6VLMkr2HWNllPErMqHTfB6GHxvtbWnuim3Kzs36w/g1fGza0k3SGshIiD//yyqXbYLI7Kc4Hew/E5q6xkasKor69fr5MFHMatijxy2WcKODmeBRFg0oiyGmmlEUEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbxeSIWC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SwHv9PQc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbxeSIWC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SwHv9PQc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXLBo2517485
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 17:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uuXgEvlASP0UBHjE/3eYOsropkXJkf6Cj4VcoOnjcDk=; b=fbxeSIWChabMSLlz
	uq+IGhAkbWJMqeNz8fmqMngPZQ2FEbaHwHT5Z9Fxa/aZnGWJyiNSwIlD6sFiyXwm
	iSuhAOFRfn8+uGH+BxEW9jzmVwhXta7cLphJqglnrPd7POTrYtpquHbepAWe8qWu
	Xf0IOuRhwLsFzNRUvR6ZVssPnlvk3OHQiWS0wX2oSjJhVanPj6qA7qS1owvsmCHg
	DasRAY1Aja/+Y1nSNAWJ4w86Swo1toCHVDSV2+guj1CEBkP2dX9HkIrOhSN+BKk3
	LsnzSb0DEFeDKxyujsUFCu3cDBolDXwqeRXVBXD0SiV6sLFn82f5jSDXg2H7BSMB
	k2JW4A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesrnua-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 17:41:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8c689b5fso534881cf.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618907; x=1784223707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuXgEvlASP0UBHjE/3eYOsropkXJkf6Cj4VcoOnjcDk=;
        b=SwHv9PQc8gKnmkWcNb4CH9DLjPs29EsWTR3TVyTE0upLCwsrcFk6MgGuVIrSjCRrKY
         YJzk6Td6IHEIwS8/dOp3cU/rNXkjEmwvmxjvsDcdHX3sPlZKqPamPyxH3S/Lf9UD+gch
         lXrzRrkCknEdcHJF09Oaj934Vrotk7hstyjvuU9vo06/eKTFXZOqnhlZ8OrmX7IhB0BF
         k/RdwUSXBQqgW9uCXLGzBP3S/1waqk/TzY9bHmiJnOUVxnEwddBG8LKFAoecmFJo9iWM
         4/CYtKktQsilkzCG+xErn3cdnl3KM/932HrfROfXBhY9jG7Ew0zjmCOjLK8HgRr7i9co
         V0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618907; x=1784223707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uuXgEvlASP0UBHjE/3eYOsropkXJkf6Cj4VcoOnjcDk=;
        b=NWu+nsGl+VjNdX0UUZMRGjG9BiXyiIvcX18TJX09kdcPQ7r5l0AA2oepER0+uyqp3S
         vRJeR9Uv5oQid4gX1g920r+NPlVU4AVrwlqkGBssMHqC8bTsArlzfczctA+4oyRoJ2gu
         QIy9pjLfiX+BpArKs25ZHmnt9Lylf8ZBIKIlYkhLTJf5zjunEh9pqC6OhSUCcVbBsWnT
         QMWdus0g02jq0TmDSBOBDbwiqt7ryhlutBb4itEToKFcx1tGJxS4jhPZnwGDmjTeVJOE
         JA/TfBeDrp99wboHEKXy1rd4XokaRJeQxs+5/ebQ+HGsED+qz43ArC/ASdYu3IuYFJ/3
         GiOA==
X-Gm-Message-State: AOJu0YwK/aROoFt+poKN+HlJMBC0mmyBOathAYUSRyA6z4gPpyztv1VM
	vRvnwgFbctke2kKQuAKzHycS4Hzt1V/YUH4dqe136DTkprgeu/A90ry9YcsVP3WNKcyozHgPj0T
	x7k8o+huhDLXdr+X6kjONF7PmLGEaQPoySY7mK4qRFhdSiMRZGlZiXj0VAsHZrYRc
X-Gm-Gg: AfdE7ckd4pkS5bnSmYA8M8iNuV/X9N+uqTsItCs375DsC80a4aA5EW05KYbkXxGfcKK
	ZA8mpOw/KJiCJyS3mFXgYvTHBMtfcrMSSZ4CtcfKBlygFaXWN5CIrw40oIxTiMajDVDzz+QjM3p
	45UIFWuitkA+ePNmvc35+JeR/ed+L7pB0S0GsvwHlO+6ZlWLf7I/MSkj3K+rj4Svp3Mnk70AOLE
	tNDZU2lNBtLgcve/z+ezaa4IJ8sVQ0G5hfguIZLZgxpWlGRw1tsJBfPKNGOrk6wkZ7SsfvmQb7S
	MHzdBxINDH4nSsjxSShcTXzHdnLZQ8ybknSk1SGlZWfYNc1BjgvUHGs4xax5+ftFpWWOWg7NyXq
	Obhhtl9TvScFqzYN+BzyIoKX2697K5jvi
X-Received: by 2002:ac8:6f07:0:b0:51a:8c9c:7f3d with SMTP id d75a77b69052e-51c8b4fda49mr91384041cf.64.1783618907453;
        Thu, 09 Jul 2026 10:41:47 -0700 (PDT)
X-Received: by 2002:ac8:6f07:0:b0:51a:8c9c:7f3d with SMTP id d75a77b69052e-51c8b4fda49mr91383621cf.64.1783618906920;
        Thu, 09 Jul 2026 10:41:46 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm55174048f8f.21.2026.07.09.10.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:41:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 19:41:34 +0200
Subject: [PATCH v5 6/7] dtc: dt-check-style: Print proper line number of
 indentation detection place
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dts-style-checker-v5-6-fcc147cb697d@oss.qualcomm.com>
References: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
In-Reply-To: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: gtERkjLOMu_sSiM4MwfjdMB1m8-AiFNf
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a4fdd5c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=PZs63ITsWf6chMizFqwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX0kOnxddqqbrn
 WdFQK8NIdQ+g+xvAfd9Is7NuYF+9lo/gMv3S5KALvFTbNkGAmt1CX0asQ8FN0tP/q/CEUtgxdPu
 6klaGXOcJDmhC6HffzuJT4IyCe4CvSA=
X-Proofpoint-ORIG-GUID: gtERkjLOMu_sSiM4MwfjdMB1m8-AiFNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX6o0mpvJKzE61
 3YtTLLRDzSvCSsj8oy0aUz7/tcVD5PuMic/P3N949c5rIKeRBsr9fR01hC8fl3E8yjqnlsYrfB1
 fhYIxykCSZTxglqNC0uZfYHkyVlf+iW2B+RCYAKV1i0MPAoJgDn/kgT1gm2TnvQg184TkIXFbKE
 f2Bcs3bJJRGvgY2JIwknnd6br0qca3Dnc86TiS+2pKqybf7RWjr0r3JS6k7oVOTGNnTXU00mD1o
 68qH5ofq8Bru8Krr2BvgIZWZTpTj/xDU3C/6NvThQCaoKy1ZfhLZW0bRRH1b0zz7nv1npYOChv4
 cua8wgyfHOQTa5Z6qI2j1Z1Te8xxyyUeQ8bc6aO+NYkFq7KCU11NtkNAah96n5cvlXGCA6LVT8Y
 AcYBP4MHY1BaacIUOYEVfpEPP/dVnqu5gO6+pBS0e99jaPEroUeDAy5LuVjtAaqz0jMqIkvGHOk
 a1nA1Au7gjdjiQfNFdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

Script judges the indentation however always suggests it is the first
line which is wrong, e.g.:

  sigmastar/mstar-infinity2m.dtsi:1: [indent-unit-dts] indent unit must be 1 tab in DTS, got '\t\t'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 29 +++++++++++-----------
 .../dt-style-selftest/expected/dts-spaces.dts.txt  |  2 +-
 .../expected/yaml-indent-strict.yaml.txt           |  2 +-
 3 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index ad07b0d27470..3985923622e8 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -392,8 +392,9 @@ def check_mixed_indent_chars(ctx):
 def detect_indent_unit(ctx):
     """Find the indent unit used at depth 1 in this block.
 
-    Returns one of: '  ' (2 spaces), '    ' (4 spaces), '\\t' (tab),
-    or None if depth-1 is empty or ambiguous."""
+    Returns tuple of string (one of: '  ' (2 spaces), '    ' (4 spaces),
+    '\\t' (tab), or None if depth-1 is empty or ambiguous) and line number when
+    detection was made)."""
     for dl in ctx.lines:
         if dl.depth != 1:
             continue
@@ -404,48 +405,48 @@ def detect_indent_unit(ctx):
         if not dl.indent_str:
             continue
         if dl.indent_str == '\t':
-            return '\t'
+            return ('\t', dl.lineno)
         if dl.indent_str == '    ':
-            return '    '
+            return ('    ', dl.lineno)
         if dl.indent_str == '  ':
-            return '  '
+            return ('  ', dl.lineno)
         # Anything else at depth 1 is non-canonical; flag elsewhere.
-        return dl.indent_str
-    return None
+        return (dl.indent_str, dl.lineno)
+    return (None, None)
 
 
 def check_indent_unit_relaxed(ctx):
     """YAML examples: 2 or 4 spaces. Never tabs or other widths."""
-    unit = detect_indent_unit(ctx)
+    (unit, lineno) = detect_indent_unit(ctx)
     if unit is None:
         return
     if unit not in ('  ', '    '):
-        yield (1, 'indent unit must be 2 or 4 spaces, got %r' % unit)
+        yield (lineno, 'indent unit must be 2 or 4 spaces, got %r' % unit)
 
 
 def check_indent_unit_dts(ctx):
     """DTS files: 1 tab per level. Always required."""
-    unit = detect_indent_unit(ctx)
+    (unit, lineno) = detect_indent_unit(ctx)
     if unit is None:
         return
     if unit != '\t':
-        yield (1, 'indent unit must be 1 tab in DTS, got %r' % unit)
+        yield (lineno, 'indent unit must be 1 tab in DTS, got %r' % unit)
 
 
 def check_indent_unit_strict(ctx):
     """YAML: must be exactly 4 spaces. DTS: 1 tab (same as relaxed)."""
-    unit = detect_indent_unit(ctx)
+    (unit, lineno) = detect_indent_unit(ctx)
     if unit is None:
         return
     if ctx.file_type == 'yaml':
         if unit != '    ':
-            yield (1, 'indent unit must be 4 spaces in strict mode, '
+            yield (lineno, 'indent unit must be 4 spaces in strict mode, '
                    'got %r' % unit)
 
 
 def check_indent_consistent(ctx):
     """All indented lines must be a multiple of the detected unit."""
-    unit = detect_indent_unit(ctx)
+    (unit, lineno) = detect_indent_unit(ctx)
     if unit is None:
         return
     if ctx.file_type == 'yaml':
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
index 070025c4568c..5afdb101dcee 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-spaces.dts.txt
@@ -1,2 +1,2 @@
 # mode=relaxed
-bad/dts-spaces.dts:1: [indent-unit-dts] indent unit must be 1 tab in DTS, got '    '
+bad/dts-spaces.dts:9: [indent-unit-dts] indent unit must be 1 tab in DTS, got '    '
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
index 5ef290d3a847..c4f31deea4ca 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-indent-strict.yaml.txt
@@ -1,2 +1,2 @@
 # mode=strict
-bad/yaml-indent-strict.yaml:26: example 0 [indent-unit-strict] indent unit must be 4 spaces in strict mode, got '  '
+bad/yaml-indent-strict.yaml:27: example 0 [indent-unit-strict] indent unit must be 4 spaces in strict mode, got '  '

-- 
2.53.0

