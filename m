Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606263F164E
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742999; cv=none; b=MFGAgaLB8ADqLMUlKzX/x9vJPMhuYWmXehEhJocgmNAuimC4mLNHc0/bCFHbHiDPBUE0NkJ579QEewxkr8pQfgA7ZgvozTUvT624sqd98/XUpIIcyxn4nzfxU4xX9LpzCM9rQQoeV0Anpu9wMI8m9AsjqmENpbwUj6V27EdEPnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742999; c=relaxed/simple;
	bh=JO+IzFZn+yaDfy6uNVzBpaE8MfXyIpmMMi+mY0p12Lc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDm/jBa88kjCSGEHepxVS+tS0l4rICb1McSn2BDqxWmLXbjNTLbfmkaKX9Rygt12iB5/mBaov6qSjmVOTbPRJLDIXIHwEmUbQdXmlhnlotzhUeBfBTTN8WO48IlBlCxL3xW915wl+zZZUrNqI7ICXaTAvjLXR/CfuCc6vC0pGVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GN686/px; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XTwCyIiF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GN686/px";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XTwCyIiF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAH4HT3648241
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JfFq5wrpX8fufdvKRXSJaT/toW4GF1FW+U01x9e8DnQ=; b=GN686/pxBQCSZcfL
	LFXOKiu5kcBPbccdw++aq6ckNNb5V6NV/vFy8FWDFK0yjNo5ZbQqt1XT0KZ5rLYO
	5psTTYsSHi/S7HH81wPsze03wbkfuzFzTe1UYxhtj6DaSpRYKLsVh48bfOlEiYvt
	kMsL1Owag8kccvVmkij8Utj5aqpYpIHi0BL+WkSJ3HksMGk1So92duP+zl3fb1fX
	q+vybc9GrwHwwGrQbjRYzBpkx62s/LS6Si5laH12iNKa7+OrZ+hMbC72dZsTidHh
	lcYJ81UQSm2DJDcbEFFdgZpYqt0TiAV0eyjRTthUCfUVg4+nZfOPwavt8tV1gfKy
	syV9aw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthrusp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ef04756caso1904821cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742984; x=1788347784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfFq5wrpX8fufdvKRXSJaT/toW4GF1FW+U01x9e8DnQ=;
        b=XTwCyIiF2XHv2wiaO2jsN83sXNWGAjWtVbXYypTXsBYzop17qIIVGruzj8U2M7lyVC
         zmZvH+95Sg2Yaxi1V56htcr8IiRaQEO+/nM40cvi4DJHy/lVSzqXim7A5vby6uf9HdXp
         rALVYUeJ2cMoZqRqk3UoZUG2yL5j7BCbrfvdUuS4L9RZixCSNHxoOUWWo3GqqCAHzYrE
         GcPD55Zx4Kzo377RnfBfoHWGcUGw79f9VF9KH4EMa+RATaWI5R4axeJqJq0KnBrC/nr5
         QjzY1U4Np9UVP2nqqbcj3hgis3vRwj4dqSHEBd5tfxtlmgALYjlK3Flh/O8iROGOKE3c
         wmRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742984; x=1788347784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JfFq5wrpX8fufdvKRXSJaT/toW4GF1FW+U01x9e8DnQ=;
        b=jh9XwkqrhYr2T+rqwXReumoMiJU34Zt1A33iHJQTKzdr9P93AW1SzSSfvjKYuANN4M
         ZM6l0wnyulmO5mWQpPZaJYec80xSXItcMri6nuYnKfSlN3/SSkp1DQ4Rsdaxbiw1qJY/
         lTvjBtcy8t6QSxm+XtDpLLM9XqbQ6b4W+pxH0Kx96dAd6osgptqHaT/IBs9v005dxnx0
         6hPOsB0Pzr2TPVYuAOidFcg4NHIeU3w0t0CWmTF9xYOU9vNpbDSIBWeafHLgQvOWIov4
         SwocDrctkfZAq4cVSRhjU8Qp+HO4aRqkj7pxKov+SPaM2ipvCjxjcgXMjNUYXdhCHeui
         8riw==
X-Gm-Message-State: AFuF++n0fy43aExqnAkNno5Zt5sd75HFWe5351I6h3NLpdtd+fLXnDAh
	nejBIIbZdeY+dCjQc4OvSPmJbWKKmOUGIETd9No2F/EtPuIhy3oSui976FgFtzTZcwYLNSqDMhQ
	GEiSZSun//tCredHoj8FsIOMXL3znK9yZBShOHLBm5IUjI6GgUX1eRO3Obpv5/zUg
X-Gm-Gg: AR+sD11BAQtaCAIf63motqvIeR4GGQ54jgfmljw3VxGUbvSbs8+AUyHG2xryGWiKg6a
	7QJ8WKb0oUa9DqE59h4ekVUphnxwp8V5Ei0TfsGmi2rTbbR/+XcoFySQyQ1T3xSyMW6xcL7al+5
	c2Jzw2CdLeKZ5dvhDG0fG4VhYHiIToz5k4Gp1syNb/FkUzHjqkQFDdCk+jZ+WUGp4TNPgooOAP0
	U1s1WmD1mfIQ5kJvxrYNrVdAhzcMn/FEL1EXvRLkD4luLMwO3itCZ76/EOVANXpL7Z+dbTT4vUP
	dyd2hgp4jmqlUpaGI0dFbm9WLnjdiw6X4hX6K7CViF/24GPft/6DI2uWfWVJOrDYY7ip3nRwQYp
	cf9pwECMwkiujAftl10TjbiU=
X-Received: by 2002:a05:622a:c84:b0:51c:ba4:d837 with SMTP id d75a77b69052e-52e422a1bb1mr58386711cf.18.1787742984153;
        Wed, 26 Aug 2026 04:16:24 -0700 (PDT)
X-Received: by 2002:a05:622a:c84:b0:51c:ba4:d837 with SMTP id d75a77b69052e-52e422a1bb1mr58385881cf.18.1787742983593;
        Wed, 26 Aug 2026 04:16:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4577843a12.13.2026.08.26.04.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:16:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:16:01 +0200
Subject: [PATCH v6 09/10] dtc: dt-check-style: Add warning for redundant
 white-spaces
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v6-9-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=15521;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JO+IzFZn+yaDfy6uNVzBpaE8MfXyIpmMMi+mY0p12Lc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsr0PDo0EgzKDusjyEtZu2HFkQWfHLfOC6nFg
 3WAZ9gUr1eJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7K9AAKCRDBN2bmhouD
 1yhUD/4uxn9TmweHMCUWkGOOmXhuszO2/FKvH96qMj1obGYqHxBCuRpTHAMk3l4BS/OaSBFgltC
 wZrVf54lDBNXdN/kKwoDhwaun5dbRSPCDVBFejcweMUFm3BjjTkTiZBujFetu2mYoStwgve19us
 9b4dWolTUhOIk7rlPyIPE1/3siRa6svqvpgxGEtUvErN7txP+BQPk8MaMI7n7WtayUEyNMNKTJw
 A6j+OLW0kaRBqcyZ6U3R6ur83gAkazmppFgbWQLMp2ON3vfKzYastYWcug8Xfs1y7mTvkBOYMlA
 uTX1X8nCYPOUblaTF7zVIv2gypB/8UtBLI3XFmzwKPMoS3Wf/Vjit/tY1uPQRyDOIm5LdFN3P9y
 R85lqev7DSUyX3c7Y03fXHzlLeK0BzamL6nXAJOTnG4vB0lQIsJDR4OTjboHMoCrKbWbY6uJ2E3
 a69RYUFL1yXPfOEFKPbFoZgYMVvRAfypXCWKYsvk8I3jdsnASBgDS+JGRz0IKJo6vcDE8dkOt3M
 RJDlnD7Snl/ValxMs8k/66gTu5q/NwYQND1uiUn8bo63bOkRblTbWYF8eJcfxrjQyyFEjL5T0/K
 NKhxJ92xYedgnYBw7MHlrhoNC0I8I0uOYTOeFDfltbWDtsezhjYugzt669Gpt3MYdy4RaKOYrHL
 J9BEqteDKhLMqTA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8ecb09 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=m3j7uktoDPJKQtxIavEA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: ksUAAF0K5kOPn54mQyHwqMpCvQJzfTJ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfXyvqeudOfB2Ns
 RLlA0wiA2YtDAdr2mk0OP6ZSFsroBeT9k0wCw1LcGafIZLBzk8bLkTuNAZD1R7IQ94AsiUTrj/+
 bUDiFmiTZrhiGRXJN5cNR1HcKOYZ+BaNa3S06tRSDkzivGsHmbRkvNJpLcZdByA2KISJ/N8vNcP
 N5P7zLcMaUSPkUx7S2q/pF75zof0Ictx94kKpLQ4DJ0cf5Q4IpxSSOe8NbhzsLZw/y7wy1Oq0Cp
 2Sz+FWzNW/uF5gq+iccFgY09NPIVRmmFurE/22gPU+32vp5o+dr6uvmv/T9S6iEFlZF3qXGFf/s
 0ECgZDbFZ0Wl2N2mn8tvOY0wvp/A6+pqEyI9uI5Xpvqiux0sGk5aqAweEa2nCjJOpIbcZy175S9
 6qytGdAc0kf7DxHGukd5ViQfD3mPJhngXN8zpZupe23CaeU3q219PYHkGGDHk0XJPxh+J56Ao23
 YQr1tLrOHLkxSx3y4jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX5JiZ4pXj2FOZ
 OpYC7QP/mQTeINskCuhuEwJLFCWpT5v3h7P0bjREdmT1RXstAgx8mKnzY1NmFPUtBkQr4a6kDy7
 aQnjkLlI3tsWu8YGiDeDInp7bZrH2F4=
X-Proofpoint-GUID: ksUAAF0K5kOPn54mQyHwqMpCvQJzfTJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260093

Show warnings of too many spaces around '=', after ':', before '{' and
';' characters, or using tabs for these.  Both in-tree DTS and DT
bindings have many warnings for the first case (too mant spaces around
'='), thus keep this one only for 'strict' mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 44 ++++++++++++++++++++++
 .../bad/dts-redundant-ws-strict.dts                | 27 +++++++++++++
 .../dtc/dt-style-selftest/bad/dts-redundant-ws.dts | 28 ++++++++++++++
 .../dt-style-selftest/bad/dts-redundant-ws.dtso    |  9 +++++
 .../bad/yaml-redundant-ws-strict.yaml              | 31 +++++++++++++++
 .../dt-style-selftest/bad/yaml-redundant-ws.yaml   | 35 +++++++++++++++++
 .../expected/dts-property-order.dts.txt            |  1 +
 .../expected/dts-property-order.dtso.txt           |  1 +
 .../expected/dts-redundant-ws-strict.dts.txt       | 13 +++++++
 .../expected/dts-redundant-ws.dts.txt              | 10 +++++
 .../expected/dts-redundant-ws.dtso.txt             |  2 +
 .../expected/yaml-redundant-ws-strict.yaml.txt     |  5 +++
 .../expected/yaml-redundant-ws.yaml.txt            |  4 ++
 13 files changed, 210 insertions(+)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 43069fc1fac9..487e76b85105 100755
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
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dtso b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dtso
new file mode 100644
index 000000000000..01d94e14071a
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-redundant-ws.dtso
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+/plugin/;
+
+&{/}  {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
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
index aab048a0ba3b..0ab832ccf07a 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
@@ -6,5 +6,6 @@ bad/dts-property-order.dts:21: [property-order] property 'device_type' out of ca
 bad/dts-property-order.dts:30: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
 bad/dts-property-order.dts:35: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
 bad/dts-property-order.dts:45: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
+bad/dts-property-order.dts:50: [redundant-whitespace] extra whitespace before {
 bad/dts-property-order.dts:52: [property-order] property 'model' out of canonical order (should sort before 'compatible')
 bad/dts-property-order.dts:57: [property-order] property 'model' out of canonical order (should sort before 'compatible')
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
index e9b3ac985718..9f2a00916329 100644
--- a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
@@ -6,5 +6,6 @@ bad/dts-property-order.dtso:22: [property-order] property 'device_type' out of c
 bad/dts-property-order.dtso:31: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
 bad/dts-property-order.dtso:36: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
 bad/dts-property-order.dtso:46: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
+bad/dts-property-order.dtso:51: [redundant-whitespace] extra whitespace before {
 bad/dts-property-order.dtso:53: [property-order] property 'model' out of canonical order (should sort before 'compatible')
 bad/dts-property-order.dtso:58: [property-order] property 'model' out of canonical order (should sort before 'compatible')
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
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dtso.txt
new file mode 100644
index 000000000000..5f9a63061709
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-redundant-ws.dtso.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/dts-redundant-ws.dtso:5: [redundant-whitespace] extra whitespace before {
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

