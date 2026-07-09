Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52CC4195A2
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618901; cv=none; b=TktAORHwJAWXjHOUyV3drbTA0ckpOWalPBIvG6T45p1FiPiNOKohCkHB7CBCFbKBukGJZfl+/PvPzG6lVjuqPD6GbbSHdeYMjbLVZEz1tfiNnTtGNkg8oOHMBQdY6okGENpHNakjBpvSjlbEs0cG66tCelDKlaPLPGuelZGs62E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618901; c=relaxed/simple;
	bh=hhxMLRyhmmqO/lCJtwd/K1/4O0l/CMASeXGHtr++M8Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZ+OiFR+/g5mnLsxDBN6wryzx5bxfr1ZCYVMcfKa08xjaHRcazs46+tBrZUADy9mc93rZEM/hJ9qBQyHnoJEafi9NJQWtGbKUULKXUJ0UBCE0/LA5o9HBz5ySf3GKWK0cKs/BMTEqQuGl2Lf/sRrfnOx2lLVW/T/ZUV2Q4V3OgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M3AcWhit; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Im+zr5lS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M3AcWhit";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Im+zr5lS"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HY0w22520542
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 17:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AXRIodgQnBSxIff+yZejwe0OLdZZ0AUG1z0Dy8MKJzA=; b=M3AcWhit+bNcGIaN
	+oTBk5lIWG3GferCh7Vum6UZhmszk4HIDIhrptg6tFUXX9zxnedNi5sbI8rZeT4v
	+UT3J6+MlUZkcKUoFEYsF/+mr9Nx8pqGu983JKKzTTHNFN2eBDDd3fcadpP5Ngcj
	a2vcFjOoHE+DNqYmBZpqWvkW3XeOKbK6Dvgj026aLKRgezbogkOzLpZZ/V2Uc+uU
	MM2YVS4zksqk04351bJcROe+UtLKF8r3z2SbDFuaHFmFjpsU7RtXjK05Jknpthzk
	SefrkEvikgxPSuiZNw24mlQVQHtgSWY4XX8170fsw5BYXcP+ZTGGHgm1ktx13Hil
	o072TQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faekn8nbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 17:41:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso121761cf.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618898; x=1784223698; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AXRIodgQnBSxIff+yZejwe0OLdZZ0AUG1z0Dy8MKJzA=;
        b=Im+zr5lSdwgh3MoYbkua5d7Z4cIq8z/eKoxHB7dwHd/PtknKDVz6AX9SPXDP65gUO4
         voIls0U1iWhWt3jeANRbMpdqJDgVWQbp6XHaJo6Pp9aWM831vWNcrkxqCgraql5ICjW9
         MQIJiD2+gJpcVrVpJqWHyHxxJ5FkCIhOldfepFuMS1mdgs3MmSI0PR0Aol4KE+8NwZiC
         dh+qcw7e25GuNRiEPBscsdM+wenfJQH8HZVLI7XFEc3mV7yjMZ2NkIQHTlITKekeZXn/
         181CnBSp7h4CJT50+NcfC0fhh2DSkBrzhQD3Ym2fbGaeQkD2VHknRqvYHns6eDLACohj
         yogw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618898; x=1784223698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AXRIodgQnBSxIff+yZejwe0OLdZZ0AUG1z0Dy8MKJzA=;
        b=UBXYbz+hK0dBpmQbH7hRWfytKUnUwpExMAadWVyBAxYHVQV/Wr9ImHT1d1amGTuxlQ
         DvKS27+I+E4glRv4yQQfsx0pX2TyhFkwPngvYLJOuxH3AK+kyJvoPWXY2Y31iQM2rCDk
         0idoxFfZpKIybknpyYr8J/RmJO5bU7zWRqX9ll4br7i179zSQ7lAg+a7gKkYo27jjJgO
         1xLISgomfwzOOilai+mf6afamhkMsoXZd+7HXJGHV5yFK+HHfrParbECv3gSvBqLP4Md
         VV+odnm1dGJ2s3vq3PyN8QUxzWZfD7sH8Es5RvLShPTsHHkbNGgwNTvXrmY7CSGb2tx8
         evQA==
X-Gm-Message-State: AOJu0Yw7KibyzDfAH8xaEnUZArgo/ZIqUCyWP9Z57/WHJgHYZgWhXy9n
	z2uhQRwRSXumpdCyIH/1pzY8696axMkNqTthADO7etFsGCiUagl4NA7y6TuPff5gDxYVszzrgPH
	bhGnS3lDlBd8BmPNZT4E6smHGb96MpBCE2AMyfOxs3SVMIOh5oK/luJPHH7wW/tXm
X-Gm-Gg: AfdE7cl7WidGOpuPFmjmgvZSCkGnp6I5tN3QZGecruGRe7mQ2FJMRci5JRq5AqHKNcB
	5VuyyhNOagi2ovHxPjOa02P4RBnAhgTQXF8K1mLhQESpTQ125A0oQ4DRdMpM3FdlTu/3Zu4wbqH
	9CmuSSw/9eS368LF7Sq/irPu9mQXgHqfwCGB0sMpafz+bEiQarcvs7mq2ggi5RJpavqomLBemne
	4JJaF+4bhzDrT4mnonr6E45/awCsRr7xDTGqF2nPKfidDO/rlTuywBhzUBBOeXtvBx53BkWmuwy
	TFn0uCkvXeduNuvrtYlBuvPiKwOMOhbWZxpbjH6VMW1NiJpJOJICaKFgD1+aSdTzsA8WOlDKDKu
	NkobzryJJjILo/0w3+sZNuQ7z3YKNc2wT
X-Received: by 2002:a05:622a:1647:b0:51c:ebd:fb42 with SMTP id d75a77b69052e-51c8b5659abmr85758631cf.59.1783618897907;
        Thu, 09 Jul 2026 10:41:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1647:b0:51c:ebd:fb42 with SMTP id d75a77b69052e-51c8b5659abmr85758201cf.59.1783618897408;
        Thu, 09 Jul 2026 10:41:37 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm55174048f8f.21.2026.07.09.10.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:41:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 19:41:30 +0200
Subject: [PATCH v5 2/7] dtc: dt-check-style: Allow space-aligning
 indentation in DTS
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dts-style-checker-v5-2-fcc147cb697d@oss.qualcomm.com>
References: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
In-Reply-To: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX8L/UYESZAHYW
 OAN0SN8vCsuzvUrZIXx2x6PiW7YOXFIqK9EoyIxLI+Wn2qO5hnI5HWvCR6RnV7jTYfo7EGEAbr+
 1L04X0Wfa6MACldWusqKCxaEhvF1wek=
X-Authority-Analysis: v=2.4 cv=SNlykuvH c=1 sm=1 tr=0 ts=6a4fdd52 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ay0YNoD6mRcLqaeziEEA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: nH6deJL_kQ9Xk5WLN7cwMdskvqgCnG9k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX8+UalzWxM/yB
 /kAosPWn+4VHJyvRBfzIy/F8+VgebcnrQRFJumxrxk/Z08VFhl8zgKLXkyTVxQdZ2lYg4Bxe+y0
 l+RzjUPa2noiSR8bDzfcYUO6+5Mb07P7IXpo9M2JGrjyyj16MbHvhq+rBNi1pUsGPoDGNfdbv3W
 8pXRaF9PsCvQisfKgfo0r2xKw3x7vaKcU1FFIRzLTApDlME+iWTfoYEhZ2eYb3Vnml5K/xo07cu
 uM4fJuK7k5rVEfA7JiNY8CHjYjb8axe6o+jOkizH2UNiG7IUe1AcAeNwFUudB7w3IqYdgBSrpgv
 p+6H5ugIJkYmX6V6Shcr7893YjmzuQOdGqFHnMWMOaoGwXTVZJCmLmN5WT/3RUFJSeVQgnwlRyO
 iHMTy9nRGDk0/U2NLomycV8jFL0i7Xz9XDH8rBBec60MCM+uzi/TlR/8/cWbjqhCIUxDMFklsWi
 0qR3iCJgmVeNSHG0EVA==
X-Proofpoint-ORIG-GUID: nH6deJL_kQ9Xk5WLN7cwMdskvqgCnG9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

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
 scripts/dtc/dt-check-style                          | 16 +++++++++++++---
 .../dtc/dt-style-selftest/bad/dts-mixed-indent.dts  | 21 +++++++++++++++++++++
 .../expected/dts-mixed-indent.dts.txt               |  9 +++++++++
 .../expected/yaml-mixed-indent.yaml.txt             |  1 -
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 29b25ecf15c6..e715fb1e741c 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -359,14 +359,24 @@ def check_tab_in_yaml_example(ctx):
 
 
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
+        for cont in dl.continuations:
+            if not cont.indent_str:
+                continue
+            if cont.linetype == LineType.PREPROCESSOR:
+                continue
+            if re.search(r' \t', cont.indent_str):
+                yield (cont.lineno, 'mixed tabs and spaces in indent')
 
 
 def detect_indent_unit(ctx):
@@ -932,7 +942,7 @@ RULES = [
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
index 000000000000..cd3de04ec5a9
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-mixed-indent.dts
@@ -0,0 +1,21 @@
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
+  			 <2>,
+			 <3>,
+		         <4>;
+		 resets = <5>;
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
new file mode 100644
index 000000000000..93146cfb51c7
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-mixed-indent.dts.txt
@@ -0,0 +1,9 @@
+# mode=strict
+bad/dts-mixed-indent.dts:11: [indent-consistent] indent mismatch (expected depth 1 * '\t')
+bad/dts-mixed-indent.dts:11: [mixed-indent-chars] too many space characters in indent (more than 7)
+bad/dts-mixed-indent.dts:12: [indent-consistent] indent mismatch (expected depth 2 * '\t')
+bad/dts-mixed-indent.dts:12: [mixed-indent-chars] mixed tabs and spaces in indent
+bad/dts-mixed-indent.dts:13: [indent-consistent] indent mismatch (expected depth 2 * '\t')
+bad/dts-mixed-indent.dts:13: [mixed-indent-chars] mixed tabs and spaces in indent
+bad/dts-mixed-indent.dts:16: [mixed-indent-chars] mixed tabs and spaces in indent
+bad/dts-mixed-indent.dts:19: [indent-consistent] indent mismatch (expected depth 2 * '\t')
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
index 4b3d990e0824..bc3fc3cf00cc 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-mixed-indent.yaml.txt
@@ -1,3 +1,2 @@
 # mode=relaxed
-bad/yaml-mixed-indent.yaml:27: example 0 [mixed-indent-chars] mixed tabs and spaces in indent
 bad/yaml-mixed-indent.yaml:27: example 0 [tab-in-yaml] tab character not allowed in DTS example

-- 
2.53.0

