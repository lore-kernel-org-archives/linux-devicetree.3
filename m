Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B2F42CAEF
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353239; cv=none; b=W0ACd8cs6WYG//oGeIz0UdylxoF+SsiVnxLBDOwlu9nQ74V8mkebvmPYbmq/dvCjelmtCI4qFQJgI3qoY/2GoQC72mENi/fIEwESiCOX5s8BqDzn1CQdeVUqAqoJZh3U9TuMTx4D5GlyBStWTe3/jtxagD4J4Mk1FulJ1eZrJq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353239; c=relaxed/simple;
	bh=DewxMyu0+MSZUvj3Msmx53KmfNpsvwcK9VzMPuL5RnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ujd9bR1NA60xcFqH3EQMT7O1Rq+7AWvPKY86qUgXlM86B57/34dhBbiR+T6r79LV7f5L5a9TyrolVKEG/gUBtrxThjOy49YzzqnAKn0wrl64N9gztwdj96sbVezr4xwt42Kf8+gZAHo2rJSR0R+1SD+G+ABU0I9G/j6dJOZcomE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wz9YEgwf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLhl/mnL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wz9YEgwf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLhl/mnL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF9Qa900738
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QYandaH8gBqYcn6Vvkgs/zXLADAR4tUYYeM0zd8Pz8=; b=Wz9YEgwfpuVWShmV
	pnAVDVFHIV4jn5TigpDGvcf8OtpawVvW2crRGOkXrSRvtiHYo2AadvAB1S5zjAJP
	FsqPYo77cdc1679zlTp83/fr0b7Fd1TdguqQPE7aaD9lw/rNuwvxlta33QaDU5/N
	YDdkYUsnZ3nUT3QtnE/Ui4NmQO/835Lmbuzni0M4zogzqaXogMCko1vnEk06HZlB
	10P64WyZUadOtGZcZZFRFufetKylpHy9SUr8Ve0BmM8P+lNeratfACZ/MzfhQDOe
	8XotXC3ZQGhr4yTteRA2qYpPIMXQ3aq7w87moaA4R0qmOeusmRdIt8vwbI5gj83M
	9rXgNA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7j8c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:53:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d1cae5939so319881485a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353237; x=1783958037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5QYandaH8gBqYcn6Vvkgs/zXLADAR4tUYYeM0zd8Pz8=;
        b=dLhl/mnLdY0Z1Wd5xK1JERzuVq18U9oS/XPrVyaB6io/oHCqDkAhvfMLL20wyOmsd0
         ih8FtwWtd1VamFCmRKkWp8BnlnCYQtRyjyZ3LyfoFEwJBXn2sSgLNNTM+7+3OJ3f+Z3z
         PNtGg2JRKzIjYeAKoilNjtSvDtNf+Qp9UwsZJnL4E21UYPODRNHBNMFYFtK0EfKcBMqr
         vBl2Xkl5WG8pwrhPubB2+A41M6HlHRKlDu9JIf6xHyxiWP3S+DDrRY7klK9AVrmuENCa
         X+1zDVvCiH3F5s/JlB6JfIJnJhGEeczkpJ/B1b2DGmcZM4VFLLKwSpTeIf5TBf3eqHyw
         9dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353237; x=1783958037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5QYandaH8gBqYcn6Vvkgs/zXLADAR4tUYYeM0zd8Pz8=;
        b=YUKPXGvYjyYjkDjxf6fuUkOs056Jcww70zD5MThb7jslX+OpthfFjlRA1yq4m0Fwuw
         cu0txGjzZNHX+JowZ/U0gSnsaVMJueqCEB1MtZgaQ0wbFOcWJsa+pp2LHKoIisrIqPje
         XE71fYIUX5xFPzbf51dCJtserYUG1B3T5634+vDZuGuk825+P+qo2wCipplt4PWGOos/
         uz6d723q9nkrKMAk/QgPZk94wG6X1jsLgUK/iIhmn9QJFkMs77aihi2FJhg4GSOdpdNK
         eq7i7iLpolLhEIQAr9FiwiOGQOGZzVsULJA7+YXHRgwrPjU9u4t7RU0zzscabgfvH8da
         1JKA==
X-Gm-Message-State: AOJu0YwI7FsXza8slE6nWW1LfQH0Omqd8tKWC7dBI2fRvX7auZWpXqCn
	V/EmEPMdO6NRNT5bB6iOa3EOI9JSxiZa2oelzz67OtNq5gYdGnpDOXFPeFAtHiK+5kOGf6SAcOX
	6LPAxux3X4alVdjs9euTTkmqyH0j3qCl6T3I58l1+LXZ5x4Wf+4nygL7KxJ49bUKM
X-Gm-Gg: AfdE7cmEBuz69l48J8ZrWBptKmnpWXsjAlH9nTkh1jr2hv08hjP7abP8/C/kRQY9MsX
	XjIbs+VDf0i7Gi5Esxt9ttJrpZ3t6P8EOZAsKKSHdvKNNGayO1dpX55yCaHJfI/6B+z91FHWjY2
	fwtoh/kzKxA6t8GBXz+TNWjHnPYN4Oi+8fiKWqPchg/vIiP9jR9O8s4pMLAKWPagkNawZCIjAdx
	Dh8FCVTVe96XeKQ6iYeT9QVUWYRmEOc0objMMbBSvkaciRDRAuMhSfuYHJdkEKukq+4y5H5iwYT
	BoTAMWZ6zdKBp+12El+pIglteL2a1Q8XZwuFL7Bg2tj+dwk7UadctRzTeTWTttxgJeG9vcjJPYG
	ioqm65S0ZBCrhliHr+4NB9ek38juMB6XXolQ=
X-Received: by 2002:a05:620a:2911:b0:92e:2c3a:a15c with SMTP id af79cd13be357-92ebb509802mr164087885a.29.1783353236510;
        Mon, 06 Jul 2026 08:53:56 -0700 (PDT)
X-Received: by 2002:a05:620a:2911:b0:92e:2c3a:a15c with SMTP id af79cd13be357-92ebb509802mr164082685a.29.1783353235907;
        Mon, 06 Jul 2026 08:53:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm23174169f8f.31.2026.07.06.08.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:53:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:53:41 +0200
Subject: [PATCH v3 2/6] dtc: dt-check-style: Allow space-aligning
 indentation in DTS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-style-checker-v3-2-03ffacff9226@oss.qualcomm.com>
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
In-Reply-To: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4783;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DewxMyu0+MSZUvj3Msmx53KmfNpsvwcK9VzMPuL5RnY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS8+ImMKMwS+0HJA0vBdWmmp9QcNchGNWL9PEN
 Y0Zr/tZw4GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvPiAAKCRDBN2bmhouD
 1wVOD/4m+ttWpMti4l6jx13+wcaTGf4mJypbGIS5ky0oqszSBDIatybwet0e+sq7Au3yD7HiDGq
 Kvgds1racwoj9yUkxzGx2W29ylKocgyjX0YkTS4DsMMVRFiwZc5kGIfMeZkkp77dyyhTNaOZe3W
 r2kxeLegCGIt6iBRmpgVa6Xx9QsKHZZegWn9wwfs+NG7WK1HdS8QznHhVTOTBHSPk96lTzoGhyV
 H8+5vrhqKE/50wAVyJOuINNVOeLocFiI9OxwY+V9X/ix8L3998EG93KX1iPAnsEjpDJVAgLv0fs
 aZj4rw4lASqxSO5t6c+TX3+Cdu3JD5ef+8TFx15eJXAXiwFsN9icK4mLtVzOw0Jay3C/kCFMYPc
 AJhjXHZHYZidlT7yD1VIeJfPMk7VoAjZnryWnILi4seuwK21Fv8/+3G7rL8Y9k4pn3CRDY9yqve
 mUR4oMPmHK1rSWVPl3sC29PEbQvcyrAM/b1MxUE/g5ehImvGlLWxK1MzUlzkai6wUAe6pMeViyx
 6lFjcthUoSfqiu2QnOOdKJ+LmqqbGSlm7msTDlMKW757+PPerABVyra76T/SnXBdawjZGEr2nwX
 Rjkm3jl/N1jOxz+EcITCAuPDw+j+0/jf5MpOsd7a3tdn7JlxxsclXhvYFRqY2OMbP50kg2EIgH+
 phMCklxYb5OHrrg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX1s0d+RD1Mx0S
 UC2C0QKGL1LpM5E0jIk3SUnxOE5Xt5HIAyMkR/yUUlEYXST4I6aiea0uhQPScq8DyltHegsKxfa
 Dv3Z4kZ+TB/vBk2MQkvDQKwC+T1tvHEIqSGj/KCgEXzyqA0+ClSN3D+sObQELsAZB/B6xT1r/us
 IoTLo0+cAW6WN5DLPSxgHudCUW+/ehfdPC8dQgp1DuXo3iMsX5XOlNu0zeeFlDO8N5lKl3SoK7v
 x4520PTdeBXDiHOtbEDy/BroskMeh8WbO8OpFPa8/EGIDRVVNAz7ZOEwJKso+1TQvfA+PlqS63a
 6jGAuNAFlTcSQDwXkiApDbIiqsrn2XkuT1nqxPKgCUScj+X/G+a4HDYp2fFl9dpSNI5VdxU0Rkf
 VT2X2gE7E+eI3xxt9WYe7wDEm2Omh+vmKooDw7ORBwdI2P8shlo+hncUZmXuCLP923dCK7wg+3d
 Hg0EHqTaTSq0UQMqqeg==
X-Proofpoint-ORIG-GUID: t3zwl9gfFS4703bxwub_nlV8X3dUcoTx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfXxLyPBIWa1Iv0
 EmcfPH7EC00ea1erv395SagMwyIYOkguQLq3iVgbaWoqr0yIMlPsbEiVWDTO6qjSUwgkrpZWkYt
 x4FiO9nPcp6TFfSE6cEBV3HNj4JZYXo=
X-Proofpoint-GUID: t3zwl9gfFS4703bxwub_nlV8X3dUcoTx
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4bcf95 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4QunWNA95kgjFIb9QjwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060161

DTS often have spaces after tabs in indentation for aligning continued
lines of comments or list properties, thus allow such cases to avoid
many false positives.  What we can easily detect is a space followed by
tab or too many spaces (more than alignment).

OTOH, DTS example in YAML files does not have tabs at all and there is
already rule for that, thus there is no point to check for mixed
indentation there.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
1. Use re.search
2. Add dts-mixed-indent.dts test case

v2: https://lore.kernel.org/r/20260706102421.343639-4-krzysztof.kozlowski@oss.qualcomm.com/

Changes in v2:
1. Rework idea.
2. Adjust function doc/comment.

v1: https://lore.kernel.org/r/20260706071446.87669-2-krzysztof.kozlowski@oss.qualcomm.com/
---
 scripts/dtc/dt-check-style                           |  9 ++++++---
 .../dtc/dt-style-selftest/bad/dts-mixed-indent.dts   | 20 ++++++++++++++++++++
 .../expected/dts-mixed-indent.dts.txt                |  8 ++++++++
 .../expected/yaml-mixed-indent.yaml.txt              |  1 -
 4 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 34e0f7e2a57a..29a2ee658e2b 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -359,14 +359,17 @@ def check_tab_in_yaml_example(ctx):
 
 
 def check_mixed_indent_chars(ctx):
-    """Indent must be all-spaces or all-tabs, never mixed on one line."""
+    """Indent must be all-tabs, except for aligning indentation (comments
+    or continued lines)."""
     for dl in ctx.lines:
         if not dl.indent_str:
             continue
         if dl.linetype == LineType.PREPROCESSOR:
             continue
-        if ' ' in dl.indent_str and '\t' in dl.indent_str:
+        if re.search(r' \t', dl.indent_str):
             yield (dl.lineno, 'mixed tabs and spaces in indent')
+        if dl.indent_str.count(' ') > 7:
+            yield (dl.lineno, 'too many space characters in indent (more than 7)')
 
 
 def detect_indent_unit(ctx):
@@ -932,7 +935,7 @@ RULES = [
          check_tab_in_yaml_example, applies_to=('yaml',)),
     Rule('mixed-indent-chars', 'relaxed',
          'indent must not mix tabs and spaces',
-         check_mixed_indent_chars),
+         check_mixed_indent_chars, applies_to=('dts', 'dtsi', 'dtso')),
     Rule('unclosed-block-comment', 'relaxed',
          'every /* block comment must close with */',
          check_unclosed_block_comment),
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts b/scripts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts
new file mode 100644
index 000000000000..f0e40cfc910c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/* Test fixture: a .dts using wrong indent. */
+
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+        soc@0 {
+  		compatible = "simple-bus";
+	  	ranges = <0 0 0 0xc0000000>;
+
+		clocks = <1>,
+			 <2>,
+		         <3>;
+		 resets = <5>;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
new file mode 100644
index 000000000000..54ddf3608244
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
@@ -0,0 +1,8 @@
+# mode=strict
+bad/dts-mixed-indent.dts:11: [indent-consistent] indent mismatch (expected depth 1 * '\t')
+bad/dts-mixed-indent.dts:11: [mixed-indent-chars] too many space characters in indent (more than 7)
+bad/dts-mixed-indent.dts:12: [indent-consistent] indent mismatch (expected depth 2 * '\t')
+bad/dts-mixed-indent.dts:12: [mixed-indent-chars] mixed tabs and spaces in indent
+bad/dts-mixed-indent.dts:13: [indent-consistent] indent mismatch (expected depth 2 * '\t')
+bad/dts-mixed-indent.dts:13: [mixed-indent-chars] mixed tabs and spaces in indent
+bad/dts-mixed-indent.dts:18: [indent-consistent] indent mismatch (expected depth 2 * '\t')
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
index c989f8f19853..0089c62963f5 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
@@ -1,3 +1,2 @@
 # mode=relaxed
-bad/yaml-mixed-indent.yaml:27: example 0 [mixed-indent-chars] mixed tabs and spaces in indent
 bad/yaml-mixed-indent.yaml:27: example 0 [tab-in-dts] tab character not allowed in DTS example

-- 
2.53.0

