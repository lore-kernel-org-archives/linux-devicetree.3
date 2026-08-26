Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDE63D9DD7
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739721; cv=none; b=bR72NoHj2QyFkrb/H7t52xbr/oM+YaDkoVE6MgpYHtdY1vTdUsZ66I91hVwHUPNnNY2PWlxl4o7a6ZmJe+mCtP/HmSllmY0dDlofepoaCcUYkSxNUMyFJc5qKmIMoSf+EKnW3y2/89IcxLSiansYPHpYuo3b0h6+MYvHI2XvdVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739721; c=relaxed/simple;
	bh=tGvlY8tkLcaDnFXErHnzInCo6PMDnllzbfv/cfylV80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rjW3b3+5pNvnOpvASsoqFbbJ9s+PYluvo5MyXG0cWOUq8D0Z0UIuhq4PsHD+U7DC1rHnAXRRNsd/zdUEHRVjph+DW2R4QdcOATARJjGqKSaKSmP6EPzg+z14WgseR+VV6YXl5SCwKmraR2PlCoXAxvH7wsXUFhNV+w8xLfocUT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LYv6ybEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gA/EplMJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LYv6ybEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gA/EplMJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGd1D3732609
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hzWxtPfqPshSGwAuTM686G+g4zadHryR0zflcQIqmPg=; b=LYv6ybEKdMAMbtKc
	03f81xZuFTLnCvfFpoUrBPG3AtUABdDgaJN9P1WTQ8ED6D58au2/FaeB3kEYetKe
	J+bE6Ad+RHiZqkgoqZS1MTtBKF9YWnkNtmWx3/6RBj7OEM1AfqTGJ6pzHHXDHZB/
	0XERA5qacSPbMOkV5dcABpDDuikd4AfieghK/VwXsW9ylZfs+353spApK1HbNnnM
	yHwzCudjUWIHpYVNNt3do5cv32iE4+UhUv2h9M2RO6cl8StkPgifCKPFEcmmP4Br
	iWGM8PrXMk8aTnkAM3PO+4v9u9ZaVahMsPcOE27DEsUj3/UapLYcO0lXH8rJyGnp
	25ECsw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqr6c3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso10869211cf.3
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739718; x=1788344518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzWxtPfqPshSGwAuTM686G+g4zadHryR0zflcQIqmPg=;
        b=gA/EplMJIPZosHMx/OkIjw7tfOJLPf+EPNKm5mUZvbkwlL20cDDkkmPjKRMnAFIb09
         2glzjLq8YV89W4JINwrnCvlgx96+aIolXEFPWmmH0/tknZjTKyrCfzMi4IUU9rwh2EWL
         ufW/07rquii0v8P4/VZaEkYM3efxKr97Sul8Ic3CRBX+7M3b58fRdDTtihjvzOIVHjB/
         aggHyQwtvIn20BmJ28uwCW8b+WDRYJEWhIDoRXt7YmMSSvWiL3bPt59e4c7i6dWZJdi0
         GqcPwz0/u4dLJhtT8eVy0e3elh7qB8fqmuGtrmT3ks4Na9Q2b2jdJbkRetFKK5qz0iYg
         awkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739718; x=1788344518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzWxtPfqPshSGwAuTM686G+g4zadHryR0zflcQIqmPg=;
        b=JQbrkhHFgLZOLaDpFcUZUQwL/GONxQl9xCOQvvNs9dOXBO6EP8RYwwkql+sZih19QQ
         BZ8n3r71Fn2+z1uoZQzjRldey57MIAUDc8AK0YWTR9pculYx1VfcBszAzWo9PV5vh6DH
         JO5EcyxEvEdaHNVaLn6x6bMKuDhyUhSu+9UjJERogva+37v8d5S/3+tlLVuBM57B/fS8
         zPpxD2KSjI3w/uEIzbxOqtoMg5XPeQp3W1KmnP6Z+xMBB+YL+MRAsdhokZVj5QkWtwQo
         arJuSnS4yvNoNdxCCDqEZehiycHr0x+YuGTKWT0MiH65oi3R7uyFT6XdeR8RfBBt2p2I
         8KPw==
X-Gm-Message-State: AFuF++mdhlGWWNfYtBhDvNZ+LegJoK+MJillBHmcLC5riY19O5R0lkjh
	k4J7iXayPAT21tqbH3QfdOK790zBMV9dZtuZfI/n58k4SVEZ32lA/lQTEs9mX8TST5BcQplR2nb
	WwmWXqcsJvPxU66PYBXdiZi884iOjyvpE9av5Zw8s3kglDqQzQ11PvfQF61tL1hhF
X-Gm-Gg: AR+sD11uT+cPtWGVqJw6phRKfUZfnrZu51iFAC8NiliMukIntPdYlsBakcmrsRIt962
	8Vb+TdOnjMfh9WYnrRSLTLPdC3gnipD8eFhAb6gyRSArRAfKuHgendv6js2mQHTkF+EF9iBZpf5
	YrXcgQjsyu23EX4fZnbHFJtDa2MsE5foiysGpwaF0JoWQxwYawczOTQOoMxDwVQATC4z8n/9afS
	zWTSesgte8HKdXtTL6ptE4hzpp4q4sx/csCZDETGN9Cj+VisSn1SLlAwDLnajfNioSwP9BgDoaI
	7mFHDw2pH1rW7NzkQB+stUyfK1gpRfkf5XIZxTDcP0zP/SmaG4u/9dydd7uHnIiN+euOVYhXudd
	tuwepOGvGHYoh3aP6n+iGavo=
X-Received: by 2002:a05:622a:2608:b0:52c:dffc:4645 with SMTP id d75a77b69052e-52e4222c9a0mr54355931cf.7.1787739718118;
        Wed, 26 Aug 2026 03:21:58 -0700 (PDT)
X-Received: by 2002:a05:622a:2608:b0:52c:dffc:4645 with SMTP id d75a77b69052e-52e4222c9a0mr54352351cf.7.1787739712822;
        Wed, 26 Aug 2026 03:21:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm479830766b.43.2026.08.26.03.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:21:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:21:30 +0200
Subject: [PATCH v5 09/10] dtc: dt-check-style: Add warning for redundant
 white-spaces
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v5-9-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12990;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tGvlY8tkLcaDnFXErHnzInCo6PMDnllzbfv/cfylV80=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjr4sJvHeJrEJ/uM+VqnIASSL4Q+OAD/wALVty
 0gkSZJ2EpyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6+LAAKCRDBN2bmhouD
 1weTD/0YXNDvasJVQu1w2dRily1xAFrk3FbbxaiqoXMMXp1a9tOWKYt0trpGFtnyFUtZnLjtXxf
 ewsKqq7JV2f4h6NuiiM4EeiXiZzHmhDyiAqDe0l0edrMvUB3kQwXIuS3GGfAhQjlM27znmbkaul
 dA0F8rqgyGDWsUi6t7nH+J/GsYqvvCK7nog0bINi2yAIptnUPNwcOe1Rn5u+WsZ1lN+QsRcIbHv
 nthMzsc1FVNlcXVhtnGeZyRtcwG4SRUrvZNkkmzBA3O5rd0BMvEAGgkazr1ICvICi5R5Du+l7Iw
 TKJ9x2zpPj7B5QSCdbAW3s2yy+v4+60G80YO3tdsGyxnVen0ElVNK0FJbh9laydEOPKz7IMrVyp
 Ju2Zi/bnGSIYrHkvIKRjL3Gg/G9ZaFqUhxlOmdUP8/qsEIBlu1OHkt5oVyXta+OSqg5Gr3s+SCm
 nOih5ZReQiKakKzTdyS2erl59j3HW037UEGYotWGlLeKeUp/ZCk8ZoPeIiM+znhn+fbvJB7x0tc
 CH8hurnWoZuSHwAZQBXJCbw19ZG0fe20JWgQG0gLHzvc9G6lFKnlx3zQ1/1dcnqu1uCh8WAxyFA
 rxt4m7nXRVpEvWMIfTmbEKaphB1I+bKEcwW2C5AXD6XoF1gDZ0bivGDirhvNvAIIIVK1EdMCfqb
 1DOTY2d4ZoAezFA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX5RyoRugkdEn4
 w0X49w2FLFZhjSC+OIJMu3FWmWUgHILbep8iXqkN2r/Eh6bxypyaGVXmemuB0AmgUeQv3InRl/w
 ffAuEpsiQoH08AXGjKYVar4mV1pY4b8=
X-Proofpoint-ORIG-GUID: GC6xquzXiSk2GgNuxsjYd9lbzYCZd3SB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX2G1im/yyP1fN
 KtCCfjvXETfMQxBllciI4OGwkg7/rFJxM9kJumlCQ1EwubOm32dA6Eeu+ckjz/3RhpKsmew1dIj
 fh0OUMj2Sk5OEC3/r0HrK0UodIhf5WcIkwzkd1xQXB13uM7P5sF2GIle5uLpRBquZ72md+G8DsF
 OQLEzfFF8As0D1wrrW09r+82IQGEn7ksXCroUtqtkLpFpUAFD9+BAuscgEM6in6N4jSRTdMl1bl
 t06WX8tcmN9fauOGUOIjtL9NaGTzTs5uhhIvLr7+CuuJiPzYTKiT1e7eqgAeXdF+UfZdAlFeMbP
 gCVHnpF7zJJ53i5tjHEUXxfnMSeTqEbWOaZ+53IXH15klchM3S8qSiwNgKzUA8PUQSTwnbIVHFA
 qFTWnvQe5aftAtv0aPo/6SUF1x/SuB+RZ5hV2MIEn31AjSnBC4NmA3Cp9Jc6yjYTV3HRjSfy1l3
 pIEfJbcFtk3FsQwNUZA==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8ebe47 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=5jFD4gabhsihpJkUSYkA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: GC6xquzXiSk2GgNuxsjYd9lbzYCZd3SB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

Show warnings of too many spaces around '=', before '{' and ';'
characters, or using tabs for these.  Both in-tree DTS and DT bindings
have many warnings for the first case (too mant spaces around '='), thus
keep this one only for 'strict' mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 44 ++++++++++++++++++++++
 .../bad/dts-redundant-ws-strict.dts                | 27 +++++++++++++
 .../dtc/dt-style-selftest/bad/dts-redundant-ws.dts | 28 ++++++++++++++
 .../bad/yaml-redundant-ws-strict.yaml              | 31 +++++++++++++++
 .../dt-style-selftest/bad/yaml-redundant-ws.yaml   | 35 +++++++++++++++++
 .../expected/dts-property-order.dts.txt            |  1 +
 .../expected/dts-redundant-ws-strict.dts.txt       | 13 +++++++
 .../expected/dts-redundant-ws.dts.txt              | 10 +++++
 .../expected/yaml-redundant-ws-strict.yaml.txt     |  5 +++
 .../expected/yaml-redundant-ws.yaml.txt            |  4 ++
 10 files changed, 198 insertions(+)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index da7edd5ea079..a60891d76137 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -349,6 +349,42 @@ def check_trailing_whitespace(ctx):
             yield (dl.lineno, 'trailing whitespace')
 
 
+def _check_redundant_whitespace(dl):
+    if dl.linetype in (LineType.COMMENT, LineType.COMMENT_BODY,
+                        LineType.COMMENT_END, LineType.COMMENT_START,
+                        LineType.PREPROCESSOR):
+        return
+    if re.search(r'(\s\s+|\t)\{', dl.code):
+        yield (dl.lineno, 'extra whitespace before {')
+    if re.search(r':(\s\s+|\t)', dl.code):
+        yield (dl.lineno, 'extra whitespace after :')
+    if re.search(r'\s+;', dl.code):
+        yield (dl.lineno, 'extra whitespace before ;')
+
+
+def check_redundant_whitespace(ctx):
+    """No whitespace between brackets or other code elements.
+    See also check_value_whitespace() for more checks."""
+    for dl in ctx.lines:
+        yield from _check_redundant_whitespace(dl)
+        for cont in dl.continuations:
+            yield from _check_redundant_whitespace(cont)
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
+        if re.search(r'(\s\s+|\t)=', dl.code):
+            yield (dl.lineno, 'extra whitespace before =')
+        if re.search(r'=(\s\s+|\t)', dl.code):
+            yield (dl.lineno, 'extra whitespace after =')
+
+
 def check_tab_in_yaml_example(ctx):
     """Reject literal tabs in DTS lines when input is YAML.
 
@@ -1003,6 +1039,10 @@ RULES = [
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
@@ -1053,6 +1093,10 @@ RULES = [
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
index 000000000000..201e3940ba1c
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
+	soc:  soc@0  { /* comments  { are okay  =  though ; */
+		compatible = "simple-bus";  /* comments  { are okay  =  though ; */
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells	= <1>;
+		#size-cells =	<1>;
+	} ;
+}; /* comments  { are okay  =  though ; */
+
+&soc	{
+	serial:	serial@20000  { /* comments  { are okay  =  though ; */
+		compatible  = "example,serial";
+		reg =  <0x20000 0x1000>;
+	}	;
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts
new file mode 100644
index 000000000000..f6480ddc508a
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dts
@@ -0,0 +1,28 @@
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
+	soc:  soc@0  { /* comments  { are okay  =  though ; */
+		compatible = "simple-bus";  /* comments  { are okay  =  though ; */
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+	} ;
+}; /* comments  { are okay  =  though ; */
+
+&soc	{
+	serial:	serial@20000  { /* comments  { are okay  =  though ; */
+		compatible = "example,serial";
+		reg = <0x20000 0x1000>,
+		      <0x30000 0x1000> ;
+	}	; /* comments  { are okay  =  though ; */
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml
new file mode 100644
index 000000000000..739c44fd7217
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws-strict.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/yaml-redundant-ws-strict.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with redundant whitespace
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
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
+        clocks = <&clk 0>; /* comments  { are okay  =  though ; */
+        clock-names = "bus";  /* comments  { are okay  =  though ; */
+    } ;
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml
new file mode 100644
index 000000000000..b2f51969b0ff
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-redundant-ws.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/yaml-redundant-ws.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with redundant whitespace
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
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
+    device@1000  { /* comments  { are okay  =  though ; */
+        compatible = "example,test-trailing";
+        reg = <0x1000 0x100>,
+              <0x3000 0x100> ;
+    } ;
+
+    device@2000 { /* comments  { are okay  =  though ; */
+        compatible = "example,test-trailing";
+        reg = <0x2000 0x100>;
+    }; /* comments  { are okay  =  though ; */
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
index 65977f96331d..29283f3451c7 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
@@ -1,4 +1,5 @@
 # mode=strict
+bad/dts-property-order.dts:8: [redundant-whitespace] extra whitespace before {
 bad/dts-property-order.dts:10: [property-order] property 'model' out of canonical order (should sort before 'compatible')
 bad/dts-property-order.dts:12: [property-order] property 'chassis-type' out of canonical order (should sort before 'qcom,board-id')
 bad/dts-property-order.dts:20: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
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
index 000000000000..3b2a989045ed
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dts.txt
@@ -0,0 +1,10 @@
+# mode=relaxed
+bad/dts-redundant-ws.dts:7: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:13: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:13: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws.dts:19: [redundant-whitespace] extra whitespace before ;
+bad/dts-redundant-ws.dts:22: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:23: [redundant-whitespace] extra whitespace before {
+bad/dts-redundant-ws.dts:23: [redundant-whitespace] extra whitespace after :
+bad/dts-redundant-ws.dts:26: [redundant-whitespace] extra whitespace before ;
+bad/dts-redundant-ws.dts:27: [redundant-whitespace] extra whitespace before ;
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt
new file mode 100644
index 000000000000..fbf323832c91
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws-strict.yaml.txt
@@ -0,0 +1,5 @@
+# mode=strict
+bad/yaml-redundant-ws-strict.yaml:26: example 0 [redundant-whitespace] extra whitespace before {
+bad/yaml-redundant-ws-strict.yaml:27: example 0 [redundant-whitespace-strict] extra whitespace before =
+bad/yaml-redundant-ws-strict.yaml:28: example 0 [redundant-whitespace-strict] extra whitespace after =
+bad/yaml-redundant-ws-strict.yaml:31: example 0 [redundant-whitespace] extra whitespace before ;
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt
new file mode 100644
index 000000000000..a162967e4336
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-redundant-ws.yaml.txt
@@ -0,0 +1,4 @@
+# mode=relaxed
+bad/yaml-redundant-ws.yaml:26: example 0 [redundant-whitespace] extra whitespace before {
+bad/yaml-redundant-ws.yaml:29: example 0 [redundant-whitespace] extra whitespace before ;
+bad/yaml-redundant-ws.yaml:30: example 0 [redundant-whitespace] extra whitespace before ;

-- 
2.53.0

