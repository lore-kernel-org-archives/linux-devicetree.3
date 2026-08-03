Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977A933F598
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747837; cv=none; b=j6rHr9XnhNxxKPVmmyiT92rj/JC8MP+3cgQsN2SoVkWiyt7A4kbwashnY3k8vGlXB+6UfmGDE38PT5G2tv8IqBHY0ryCjNDVzZZWu0d4hjYA736Wje+F3ZXgUFAWVCOS83H/OSGoE7ss6PBZUAqN9Y6BOb+WFWVooUGpzWn3L00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747837; c=relaxed/simple;
	bh=5pm6xzgUJ4vy77QgEXHHe3Jllkf2jPPDEFKrevn1v18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGkGeSQnGK560JKJ97C8kxx+jW7HPZrClqJjAfVywm/pMAoUkyB1zT0YnbaKpAXvY6LI8JthksQJTu7KaQaPadtxxIyAniLAJafltri3qSCAQwPA047lELOuyn/rUH/SBa9hDDFuRTeqWV57f4G6APvugOylY6Lo/ByTnFPwhDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oqE0AGb/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JvQmhe9K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oqE0AGb/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JvQmhe9K"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bQ4a3957180
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PQmM6UluGtuGgi1cUWf9fwarKMZSjE5W8/dc/SKc2p0=; b=oqE0AGb/OI0U9EcX
	N4UhlexbJrmuhyE5cvJMAJ2YThCxdoXmrBcaWQLwe8lHa2XirOstgPBkd3jHlmil
	T1sX6t2b7i5TsDZ6swDQoEUWQ9JbWMWOlHcxEBGen6AJHoo1yIpcX812T/xpMCGI
	YgKr5yd3tQorejB9bRKoHdba+ELjL4yhdztRDBR4zs+oUx2in3qui2S+A0lGiGvo
	jPaIrW0f0S10kFjijNVmsLdtKeEjAVEKJ6K4qhqLqnG5TseLCL2rxGDaqoO/siio
	ALeaAMIge8hm9htPr4h96BGcUSR6lqIDF7yXY8j8m1SGU1LQaTiU6uoHqX2PJIpE
	n2qmHA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvngncy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0408254aso52248611cf.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747834; x=1786352634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PQmM6UluGtuGgi1cUWf9fwarKMZSjE5W8/dc/SKc2p0=;
        b=JvQmhe9Kn8e+G9eQfI00FOizllBTMTzbOXS9t/Gylv30Yj29kM3EX1AYa0B2sa1b2Y
         FfWReDo11ac3tR6aq5EXHoQCH0Z0rCAXVclx9SPcM6GcVYOwuOWM5ucoQINHBE0smXTw
         UtR7y29wx2rjFfZ2WkOzzWMIWcm0vv6CNhVQBbTC7H0hSAv+o4VFJtE3gMWlUcyBksF0
         YeDU1jRhdSEJlpJGxgqIFvQz6df1Q4fQPNZMLCvHEX5wQTUBAL8EXRndcICtB1bYTAZo
         69D8okfQOF8lSPs5W708rm+HA148sxpQXZne3UPT9e7v2avaGyxbih0MCERGEkmRNzAF
         K+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747834; x=1786352634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PQmM6UluGtuGgi1cUWf9fwarKMZSjE5W8/dc/SKc2p0=;
        b=pLKi48B6PfI29yokFs79xo+f/Fam+NQCjN7LgGX3YUgg9/m2eCOZpZri8oauxXBLtW
         pbWIwZTv777t9TFutKtzlYourPT6v4Rea09QVsJq7Wa1Aimn9mtgWxPrZzG5IsIveN6A
         xamUU3nAT92/y527dEKT6u4jzx4edtMX1Lp0Emb5mahfUhNN6mdRnFfMvvImDoA0y72k
         9c1KoR3dyDVaxgoDfhsoqJYkIndaGu2PVmVo88LEvRMBTMMVtWuFDpcWjnhpLoIrf+oX
         LHVc9TUcFik0D4Zl8x1XMof4XXPXbbiFSAYY/QEQvs5JiTCJzcwOHDHAl/a21waGDyzr
         t1pA==
X-Gm-Message-State: AOJu0YzcQW6DngO45Fqgaa7oVTgSKLaL/AUL9jE404AuowviGlNtVlZG
	4ASx2LwAqolnrqtDWk5TTGWCcGxxZrryHFavxxi6K25lK6i+xG7QtSiQSX3JKmZPNFNzSHLSDwF
	N6aO3iUWqPwqkSo39+rA7UWCwzmpe5l8ZFm+tUAPT1kb+D0lomfTSI79cQltH/f3U
X-Gm-Gg: AR+sD12vshliuZUD7UgxNyhW3a4obBey9HtMPleTXm9/7N6zER5a1kMusbMBt6uyCw+
	Z7MgYlJT9N3xbwIun4w+gVcpJBab1WHTquU7gDEOSVgSvqY8x3Cv/tKmbvR+N4FKv4D8upF2mQk
	sgdd+XJMLElpSNZLjQDArNsnTIzE7NqcSuy0qLS7p9yw6VHRnSd2MvV14QjMARqp4kBUXfyYjCB
	r6X4KtTYW5YtSpc/xJ+dSmFJYmMICODdxJNLv1OzE9amBAQCUKJB5bnCF/ucK/j5E2QjZGRflLh
	0mI5NsKDOEQcCuOJJv6/h2PRHx0KztXjvKNZyPoU4Hwo71W/oa2dmAVal1Nv+FYyjmGG6kiNekp
	ubOxoyXfiShLcC9QfOHverjhC
X-Received: by 2002:a05:622a:1f14:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52b4c58754fmr200540351cf.13.1785747833616;
        Mon, 03 Aug 2026 02:03:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1f14:b0:51c:b91a:33f9 with SMTP id d75a77b69052e-52b4c58754fmr200539781cf.13.1785747833064;
        Mon, 03 Aug 2026 02:03:53 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 11:03:13 +0200
Subject: [PATCH v3 10/11] dtc: dt-check-style: Add warning for redundant
 white-spaces
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-n-dts-style-checker-continued-v3-10-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10971;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5pm6xzgUJ4vy77QgEXHHe3Jllkf2jPPDEFKrevn1v18=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFleZOMmAPd1FQW7RCcFIoL8FRU3wzfkObPfQ
 VuqkC5naHaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZXgAKCRDBN2bmhouD
 11uTEACCWNDShxE8BFGpTUIAHIgnc3Ws/4+ObDm6mt7jIycSEgJheyrwWteRs1NL+4tCA/5j0Gs
 dwNVlsmm9UouN/La2sxGCD1VUbUHy90nmXM0uBMsqHyuSiEntfqVZsMX/SMUcXoM9HytWiaChjc
 4+56jhgfM2nvne0ro/eLXFhhNYjKjXaR1nvf8dB6FNf7eXYhcbiAI2mxPuw5WB0TUgQ1ODSPH4O
 N2OECuPPN3Ka4beS7GgJc4JacpdHEj8x4PX+x1THyfThYrfUzVp0BFAh0vn4jqYjectJL8OzBJw
 bzfCPAahORAuF3Uqba5X17bzE4kbgg/MjZmHw2U2+WEPTNTtfl9YoiRg9ZUOS94B2TxpxsNeWpR
 B+/8jLFXSsAazWeWAIMvKxfRlOmOi1JDXijxavL6vbcoMokA0M2f3sDNkWgg7p+JbdPx8+meZ5q
 A9QnEz8m9gwmmXLZVFWPafUpmguiyA+UDwKWjNtIxmR8YgqN8JAc0HpQEpaqREeAvNyKrvBrmaK
 lfhwgFbWNNQvao/96rf3kio8MkMZEDgd9CmktzpDRqGffkEPzp/NFtt5enn3o7i0aMYO3B5sk1Z
 dmah9BKxwRjsgIZrpmaAvDLDE4HKwqPOZzIAX5N9kwySVvWfqCZKg9aNQ3QPNOXUhiLTYYV4qX5
 QvQ9kz7/1S7/dTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a70597a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=B8xk_V0qu_cBOhDEdJwA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: UNjzqJ51nEcQupBsRIJTxbI1CgN9qYOC
X-Proofpoint-ORIG-GUID: UNjzqJ51nEcQupBsRIJTxbI1CgN9qYOC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX4SYnQAcywnTf
 FMWhi+sxf1weFvyrAbTboTD88rf5t3u+bP5CRvyEGMjUgaBBKcRuV5L0GLoVqRpNYeRzvX0W9Br
 ho0Qk7MKCLbz42LCzy670U9pv2hXPKxftkjY8KPgrkL8810IPN/Pi6gvAOvH9s8NK8Z0v2ZdfD4
 GxLU2joXXin0ikl4cKKxA0iFII58Oo4Cqk/n4YeTge2jXM0CZyjseF5DGBFrg+EEZVq+AlhmWMu
 5IJU46XvpwP93KFytzp/u1W7i7A/DDGdOCK3XsjtnH3TkQwOK/g4b/QJOwR0OPb/kjD0wwMgX56
 Bzl6KBa3pd4yTTQLZouAH918Js3Up9gueVO+yIOkg+Y5IFZGQg1v08MU2sPUmnx5fI2cYsDYt8x
 NAq2GD/09rgvOGJaL2HwwODiza+UIl8JwcVPe5x+mlY9i+ORvegPsZT2wxJEV4Kud4dpAEwErXq
 Co/oM18TC7r38HvfNBQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX6ls84k1HMwkF
 tvEry7v9UszradQylyMjIEAA4KGA4DbdClthAcbr8A1S7jc6emZF93iQ2RdS3Nu06NyahFRowNE
 HWCMw0PO+m1hC8EyP+zP2ze3Cj0z63U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030080

Show warnings of too many spaces around '=', before '{' and ';'
characters, or using tabs for these.  Both in-tree DTS and DT bindings
have many warnings for the first case (too mant spaces around '='), thus
keep this one only for 'strict' mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 38 ++++++++++++++++++++++
 .../bad/dts-redundant-ws-strict.dts                | 27 +++++++++++++++
 .../dtc/dt-style-selftest/bad/dts-redundant-ws.dts | 27 +++++++++++++++
 .../bad/yaml-redundant-ws-strict.yaml              | 29 +++++++++++++++++
 .../dt-style-selftest/bad/yaml-redundant-ws.yaml   | 29 +++++++++++++++++
 .../expected/dts-redundant-ws-strict.dts.txt       | 13 ++++++++
 .../expected/dts-redundant-ws.dts.txt              |  9 +++++
 .../expected/yaml-redundant-ws-strict.yaml.txt     |  5 +++
 .../expected/yaml-redundant-ws.yaml.txt            |  3 ++
 9 files changed, 180 insertions(+)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 1430c675bd95..aa2072957a1a 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -348,6 +348,36 @@ def check_trailing_whitespace(ctx):
             yield (dl.lineno, 'trailing whitespace')
 
 
+def check_redundant_whitespace(ctx):
+    """No whitespace between brackets or other code elements.
+    See also check_value_whitespace() for more checks."""
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
+                           LineType.COMMENT_END, LineType.COMMENT_START,
+                           LineType.PREPROCESSOR):
+            continue
+        if re.search(r'(\s\s+|\t){', dl.raw):
+            yield (dl.lineno, 'extra whitespace before {')
+        if re.search(r':(\s\s+|\t)', dl.raw):
+            yield (dl.lineno, 'extra whitespace after :')
+        if re.search(r'\s+;', dl.raw):
+            yield (dl.lineno, 'extra whitespace before ;')
+
+
+def check_redundant_whitespace_strict(ctx):
+    """No whitespace between brackets or other code elements.
+    See also check_value_whitespace() for more checks."""
+    for dl in ctx.lines:
+        if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
+                           LineType.COMMENT_END, LineType.COMMENT_START,
+                           LineType.PREPROCESSOR):
+            continue
+        if re.search(r'(\s\s+|\t)=', dl.raw):
+            yield (dl.lineno, 'extra whitespace before =')
+        if re.search(r'=(\s\s+|\t)', dl.raw):
+            yield (dl.lineno, 'extra whitespace after =')
+
+
 def check_tab_in_yaml_example(ctx):
     """Reject literal tabs in DTS lines when input is YAML.
 
@@ -1002,6 +1032,10 @@ RULES = [
     Rule('trailing-whitespace', 'relaxed',
          'no trailing whitespace on any line',
          check_trailing_whitespace),
+    # See also check_redundant_whitespace_strict() and check_value_whitespace()
+    Rule('redundant-whitespace', 'relaxed',
+         'no redundant whitespace within code',
+         check_redundant_whitespace),
     Rule('tab-in-yaml', 'relaxed',
          'YAML (also DTS examples) may not contain tab characters',
          check_tab_in_yaml_example, applies_to=('yaml',)),
@@ -1052,6 +1086,10 @@ RULES = [
     Rule('unit-address-format', 'strict',
          'unit addresses must be lowercase hex without leading zeros',
          check_unit_address_format),
+    # See also check_redundant_whitespace() and check_value_whitespace()
+    Rule('redundant-whitespace-strict', 'strict',
+         'no redundant whitespace within code',
+         check_redundant_whitespace_strict),
     Rule('value-whitespace', 'strict',
          'no whitespace directly inside <...> brackets',
          check_value_whitespace),
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws-strict.dts b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws-strict.dts
new file mode 100644
index 000000000000..d73908b2ab0f
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws-strict.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+#define SOME_MACRO(foo)					\
+	(foo) ? <1> : <2> ;
+
+/  {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/* comments  { are okay  =  though ; */
+	soc:  soc@0  {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells	= <1>;
+		#size-cells =	<1>;
+	} ;
+};
+
+&soc	{
+	serial:	serial@20000  {
+		compatible  = "example,serial";
+		reg =  <0x20000 0x1000>;
+	}	;
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts
new file mode 100644
index 000000000000..2fedf462ca56
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+#define SOME_MACRO(foo)					\
+	(foo) ? <1> : <2> ;
+
+/  {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	/* comments  { are okay  =  though ; */
+	soc:  soc@0  {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+	} ;
+};
+
+&soc	{
+	serial:	serial@20000  {
+		compatible = "example,serial";
+		reg = <0x20000 0x1000>;
+	}	;
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml
new file mode 100644
index 000000000000..14c2346d7658
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/yaml-redundant-ws-strict.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with redundant whitespace
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-redundant
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    device@1000  {
+        compatible  = "example,test-trailing";
+        reg =  <0x1000 0x100>;
+    } ;
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml
new file mode 100644
index 000000000000..db265402d0e8
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/yaml-redundant-ws.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with redundant whitespace
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-redundant
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    device@1000  {
+        compatible = "example,test-trailing";
+        reg = <0x1000 0x100>;
+    } ;
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws-strict.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws-strict.dts.txt
new file mode 100644
index 000000000000..ac0d57bdecdf
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws-strict.dts.txt
@@ -0,0 +1,13 @@
+# mode=strict
+bad/dts-redundant-ws-strict.dts:7: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:13: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:13: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws-strict.dts:17: [redundant-whitespace-strict] extra whitespace before =
+bad/dts-redundant-ws-strict.dts:18: [redundant-whitespace-strict] extra whitespace after =
+bad/dts-redundant-ws-strict.dts:19: [redundant-whitespace] extra whitespace before ;
+bad/dts-redundant-ws-strict.dts:22: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:23: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws-strict.dts:23: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws-strict.dts:24: [redundant-whitespace-strict] extra whitespace before =
+bad/dts-redundant-ws-strict.dts:25: [redundant-whitespace-strict] extra whitespace after =
+bad/dts-redundant-ws-strict.dts:26: [redundant-whitespace] extra whitespace before ;
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dts.txt
new file mode 100644
index 000000000000..c18c1972bb47
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dts.txt
@@ -0,0 +1,9 @@
+# mode=relaxed
+bad/dts-redundant-ws.dts:7: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:13: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:13: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws.dts:19: [redundant-whitespace] extra whitespace before ;
+bad/dts-redundant-ws.dts:22: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:23: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:23: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws.dts:26: [redundant-whitespace] extra whitespace before ;
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt
new file mode 100644
index 000000000000..a70b365b6cf5
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt
@@ -0,0 +1,5 @@
+# mode=strict
+bad/yaml-redundant-ws-strict.yaml:26: example 0 [redundant-whitespace] extra whitespace before {
+bad/yaml-redundant-ws-strict.yaml:27: example 0 [redundant-whitespace-strict] extra whitespace before =
+bad/yaml-redundant-ws-strict.yaml:28: example 0 [redundant-whitespace-strict] extra whitespace after =
+bad/yaml-redundant-ws-strict.yaml:29: example 0 [redundant-whitespace] extra whitespace before ;
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt
new file mode 100644
index 000000000000..c85e80ed272a
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt
@@ -0,0 +1,3 @@
+# mode=relaxed
+bad/yaml-redundant-ws.yaml:26: example 0 [redundant-whitespace] extra whitespace before {
+bad/yaml-redundant-ws.yaml:29: example 0 [redundant-whitespace] extra whitespace before ;

-- 
2.53.0

