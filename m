Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548933BED06
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739715; cv=none; b=mQ57/tjL2SSGHS7upEn/cdZkrI5rMKpE0RzwPBBb3tq9M+M3v760U+6W6GWdI++LiPFSAOzzJUzKCkw9TlRFX2qmlzPqOOl44G0zDgrXT8zMWBVMaK2LBHii1gi2pn4kutl56pBXLLdbZE4/Q0FMQuxlbMmmvCKfb5kwXLLynZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739715; c=relaxed/simple;
	bh=82AwuC/PlI8zq2Zeq5h4UdQdCvohPXD9NYgvBA91PGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eFTfMAzT95oHOrlzorHGDTptCzXGVwqehAwa3cxaukN/w/gosRgQflDihY0ZgNgS7sxCWW2VDs/N5K4gairvgj29KctiPhJ7cCDMsAgB+QBRo38/j5WWjgzZLMqGFUitfZPrS6GLGX513NNNSx7b5PQsBF1axdJevbAg2Oxk980=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kxx45KUH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VnDoE2Lt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kxx45KUH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VnDoE2Lt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGdIF630844
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SugCbW4EHZST98apkBDYWKHzfAPSUQ+l2lkHVbrQCWY=; b=Kxx45KUH46KLyTlc
	eWFW31/aIjfnpD21RYa+nOtGhr2R3y6oXSNCkf7iCQ2e36cMTbwQ/LNoT1u5yf0I
	AOb9G1Ya8B+0iOB8bP1RWJjTEvm/YAmuzrXLxzROaSSksFtTqEzBvRU3GiJijnUF
	wdlaTpAWta/p/2cBpYKgibNymztyeR+sxX7dyBLN50m11pVpuk/tNW3JA+uKolGs
	uFdKu2e6GDE6B+lOmfoGFB1152tW5VWhNdCLWFUKL0zJt14pnXbIXYj42t1HamOa
	7R1L2xyE9D6XvjFx3b4MBQn88kYQSTdOqVDvz06IeTHMNaLdJJF74Lnz60+bJrvq
	wS5ULA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k1mpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 10:21:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so16603651cf.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 03:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739711; x=1788344511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SugCbW4EHZST98apkBDYWKHzfAPSUQ+l2lkHVbrQCWY=;
        b=VnDoE2LtiEGfLLp+uEo7UgRadS4r070BoOTAQi2L9S3xD5K618ChW0JhSiy+DAOHkA
         JPHosiycnalSPVAPlR6aMZPxeCZnE9aT1UV50lczIBjpSlbZqWR/ezCJX+IJEa2gHaSu
         SEvV2Rzl4ApZq/lZn0vIKSFSQxk8PjgSDQHWsFJDeYpxHdytRejPqIgDv8SLCerShJ5P
         ZlBXpRoZoWV2CpZSbrLWWKPEWV2VCW9375ah5nmNxzv5qWZnTKHu4VRb116v9KBHtKQn
         xtaFgtowNp738xoNRzVccyB+TKFtZ1uCJQuqMniavuhOq0YP4qnDuzV+4JqSw7SRGe5A
         D85w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739711; x=1788344511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SugCbW4EHZST98apkBDYWKHzfAPSUQ+l2lkHVbrQCWY=;
        b=rZTANuWYeVeTX1d/aZ4sckx3qvefd0gyPZRy6ARw5thG6MUKTpHzlJMsaWMyiN9iFD
         1A+v/fpw5JRcXkEsbUa9O/FT5b9dpTkVSdQQR4Ugn27YTVEqe2C+vwsODXNY7S6jm1PG
         2WSUXxlH7eK912m03Bjyrdt734pXPXkCEVK3wLloeeAyGcOfX9+esZ0xFB6Cni9awtqW
         YVZ1mvUzWjfhBw21ymByBJfhkEOiPz8YLnooofFaSQkPkPdQ+K/DyVvPRBm1vGzfDIO9
         6+NvakXlIxpcFZW1crOGdOJxB6aIpmvCSeQRdzvbUH1pmXZov7OQZtL9HCpJWusjodtb
         Xz/Q==
X-Gm-Message-State: AFuF++mL4sRDm8JkEE0SKn/GVGmjn10vYEF1Mk4qigWXtSv02BWNMS5i
	llo3+bbqKgZJYoprOr1qbrOO+4bGjjs8gJX88S661AXX/3bcK+zmAGNN+0J1yQDTwz3nmmsSrWo
	KsH9LzDu4KWH4wiJDf50RT1m+zEG4HxkCgBuPb60IjFpjk6dqllyTl4t89mGEdstE
X-Gm-Gg: AR+sD10omvbIw4eWP2o+vICO580/BSzZ+ldX1OSqHzDyHe24FXmppzVWlIRTA047a2v
	TytHwgfHwPXzOb89DZ3r5EtYcCwf76lavbBYDFtfek3LUKbXjTNZeS+jufRiUrkzccBmdwh7Rao
	5THhsn4baxo3NJQj8yswMjnvsFM010H9EfQTLyeMfq8SSwN1wArrKysQa8C7JUwVgKVCk+ddie4
	twao0M7YMetTrxFOLIM/Yo6BBCUUa6v8Pzg6HpBm1kdwjqCKCHKitmefwMtJoz9l/9Yw+5UlZkn
	wazLT0AZrYNRjmKXVphMEZItD+0zRy4q75bT5CVkd+bwSdG+8aCP2kz/gL/wddc7L1SExBXXiLC
	eRWgIQukNxW0uuqKCDLYgEtc=
X-Received: by 2002:a05:622a:cc:b0:516:82e2:7788 with SMTP id d75a77b69052e-52e2ec1e3c5mr121116261cf.1.1787739711401;
        Wed, 26 Aug 2026 03:21:51 -0700 (PDT)
X-Received: by 2002:a05:622a:cc:b0:516:82e2:7788 with SMTP id d75a77b69052e-52e2ec1e3c5mr121112741cf.1.1787739706168;
        Wed, 26 Aug 2026 03:21:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b106dsm479830766b.43.2026.08.26.03.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 03:21:45 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 12:21:26 +0200
Subject: [PATCH v5 05/10] dtc: dt-check-style: Introduce 'stricter' mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v5-5-fdd16ca6e771@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v5-0-fdd16ca6e771@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=82AwuC/PlI8zq2Zeq5h4UdQdCvohPXD9NYgvBA91PGs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjr4oGCEX8E2/VMhVyv/lcqsWyaDMHRi5xah1i
 6BdDPwzKzqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6+KAAKCRDBN2bmhouD
 11X5D/0Vbr4XaYQ+OsxqemvZ3B5OfBZI3l12/7A+TOmQxbcRMBUrcM45BB2NAuOE5EhIuRGE5D9
 r2ATsQ9Z4ecSH1VboN+V2FQTObb+97CPMnTEPDBxzSsqfi59ixCMhhEy+xjnl1QM1uR3Em8Wz8J
 hldaqRnCrUYTh55kLrn8PvCIkkTQIyr2fL7NTLaCTNHQZO1EQG27nXvU60GIQl8CYSXziryQdpQ
 ykIYeThwCX5whW7p0Fhmug9ObrO8iNgM5AKy/8f3RRhEplKUzUEcGceAOgJokEb94o0NPld0oHj
 LfhUEXzvpZg2HBlfMVt6rgeeVfcBjKN3ALPXLvzSmPPrJigwyyrcY5f1q66fVov1ATDt0VSfIsg
 eVe5bISQgR8HaAGHzIyyp1GTWNfMMaFNAl86wbkQWwWoq0SUbtBQsmhS+Ld05lGVuaNIlZiwOd0
 f+fVZ0/ruCRG45520YEEV1YQ7qaindTRyHw7QO2GrLKxSffia8ARnmwVYyyVzOECEObEVIIBpG9
 7Vo6y8IAwyEIUCmG2K21VG++LVJh9M5Sp3+CgE3EGugUB5Te13GeJrZJted6L47+gvkDX/bz2aK
 nBqzzagpZ/fJOwGnFth+EEfAnqJW8G7wSM85eIKa2F7kdYaKZFiaiooNqkHO2690VlrsqTqSGwj
 v+8mFqeHOTxbQhw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ebe40 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WUDqnpqoxdndseS9DjUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX49hd5aD+2FTx
 k5yTZ0HMUNkUtkl2onEsXQYwsTgsyKQELjPHbXaOo0qCmv4pHLrPqiYskKJkE1bgk4x7UdkIFUd
 cQecwb8HJm+/H0J1+JaSSyknyQ/vgLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX7X/8iqqxOfft
 vwaqlRNxQVFFRv2WboyP0eoaN3uryTGQhOg3PwVlPC5udpbvmXOe4+0Bb3IuzDHxznZUhtnwz4L
 mdN0drZcmvBHk/DS6UfuWN8E+b+Yxg5lsgLo+FbG/6Ayn4z2FrlcSrLJ5qVC3Vnst0n4SLEixPP
 sFJcjUwJcOOxtFYJXJZqMwC07pneeh1ZTtsv7r08XyFvVO5jgJ6De94hvOhEXR2r094cndBgGBE
 qAP5iuiHXJoxLrU4KQhNy6RaRYCMY9fLWtwJc6t68hfj4LB/3elzRRj020D0gIVhW6V/Rv/jxT0
 1/Xujjblhrbt2/cBoKMIwZR/UUqUQXRxBCyND2YK2SsMnRZYKVt3NeHZJuYQy4v3apXeR5NaqtE
 lM4uZIfE1XNurKgqSVZaC2PwJ/aruYQCClHCf4aO0WZ7N1kOht9hHVUuJIhyVD+jtlxnSOdB6O4
 hU0PdEknDhU0Hfa+geQ==
X-Proofpoint-ORIG-GUID: NekDKUUWySnRNCRnu72ZR5woBkrdcC-y
X-Proofpoint-GUID: NekDKUUWySnRNCRnu72ZR5woBkrdcC-y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

Two rules, which are enabled in 'strict' mode make little sense for DTS:

1. line-length, limiting length of line to 80 characters: DTS often has
   a bit longer lines, especially for interconnects or heavily nested
   opp-level.  Checkpatch already does not warn for exceeding 80
   characters.

2. unused-labels, discouraging unused labels in DTS or YAML (not DTSI or
   DTSO): while not harming this leads to many false positives, e.g.
   unused PMIC regulators in DTS.

Introduce another 'mode' of running beside existing relaxed and strict:
a 'stricter' one where these two rules are moved for DTS.  Intention is
to have in-tree DTS passing 'strict' mode.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 25 +++++++++++++++-------
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  | 21 ++++++++++++++++++
 .../dtc/dt-style-selftest/bad/dts-unused-label.dts | 21 ++++++++++++++++++
 .../expected/dts-line-length.dts.txt               |  2 ++
 .../expected/dts-unused-label.dts.txt              |  2 ++
 scripts/dtc/dt-style-selftest/run.sh               |  2 +-
 6 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 8b3c9e2fa987..a1034f6b9caf 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -5,12 +5,14 @@
 # .dts/.dtsi/.dtso source files. Enforces rules from
 # Documentation/devicetree/bindings/dts-coding-style.rst.
 #
-# Two modes:
+# Three modes:
 #   --mode=relaxed (default)
 #     Only rules that produce zero warnings on the current tree.
 #     Suitable for dt_binding_check.
 #   --mode=strict
-#     All rules. Required for new submissions.
+#     Most of the rules. Required for new submissions.
+#   --mode=stricter
+#     All rules, including ones having false positives.
 #
 # Two input types (auto-detected by file extension):
 #   *.yaml             -- DT binding; check each example block
@@ -319,7 +321,7 @@ class Ctx:
     def __init__(self, lines, text, mode, file_type):
         self.lines = lines
         self.text = text
-        self.mode = mode               # 'relaxed' or 'strict'
+        self.mode = mode               # 'relaxed', 'strict' or 'stricter'
         if file_type in DTS_FAMILY:
             self.file_type = 'dts'
         else:
@@ -332,7 +334,7 @@ class Rule:
     def __init__(self, name, mode, description, check,
                  applies_to=('yaml', 'dts', 'dtsi', 'dtso')):
         self.name = name
-        self.mode = mode               # 'relaxed' or 'strict'
+        self.mode = mode    # 'relaxed', 'strict' or 'stricter'
         self.description = description
         self.check = check
         self.applies_to = applies_to   # input types this rule covers
@@ -1060,20 +1062,27 @@ RULES = [
          check_node_close_alone),
     Rule('line-length', 'strict',
          'lines must not exceed 80 columns',
-         check_line_length),
+         check_line_length, applies_to=('yaml',)),
+    Rule('line-length-dts', 'stricter',
+         'lines must not exceed 80 columns',
+         check_line_length, applies_to=('dts', 'dtsi', 'dtso')),
     Rule('continuation-alignment', 'strict',
          'multi-line property continuations align under <, " or the value under <',
          check_continuation_alignment),
     Rule('unused-labels', 'strict',
          'every label must be &-referenced in the same example/file '
          '(skipped for .dtsi/.dtso since labels there are exported)',
-         check_unused_labels, applies_to=('yaml', 'dts')),
+         check_unused_labels, applies_to=('yaml',)),
+    Rule('unused-labels-dts', 'stricter',
+         'every label must be &-referenced in the same example/file '
+         '(skipped for .dtsi/.dtso since labels there are exported)',
+         check_unused_labels, applies_to=('dts',)),
 ]
 
 
 def select_rules(mode, file_type):
     """Return rules that apply to the given mode and input type."""
-    rank = {'relaxed': 0, 'strict': 1}
+    rank = {'relaxed': 0, 'strict': 1, 'stricter': 2}
     out = []
     for r in RULES:
         if rank[r.mode] > rank[mode]:
@@ -1201,7 +1210,7 @@ def main():
         description='Check DTS coding style on YAML examples and '
         '.dts/.dtsi/.dtso files.',
         fromfile_prefix_chars='@')
-    ap.add_argument('--mode', choices=('relaxed', 'strict'),
+    ap.add_argument('--mode', choices=('relaxed', 'strict', 'stricter'),
                     default='relaxed',
                     help='which rule set to apply (default: relaxed)')
     ap.add_argument('-j', '--jobs', type=int, default=0,
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts b/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
new file mode 100644
index 000000000000..bde91a922477
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: Line length in DTS
+ */
+
+/dts-v1/;
+
+/ {
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		foo@1000 {
+			compatible = "example,test-line-length-this-is-a-very-long-name-indeed-yeah";
+			reg = <0x1000 0x100>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-unused-label.dts b/scripts/dtc/dt-style-selftest/bad/dts-unused-label.dts
new file mode 100644
index 000000000000..90802ae107e1
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-unused-label.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: Unused label in DTS
+ */
+
+/dts-v1/;
+
+/ {
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		dev: device@1000 {
+			compatible = "example,test-unused-label";
+			reg = <0x1000 0x100>;
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
new file mode 100644
index 000000000000..8ed08c309632
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-line-length.dts.txt
@@ -0,0 +1,2 @@
+# mode=stricter
+bad/dts-line-length.dts:17: [line-length-dts] line exceeds 80 columns (101)
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-unused-label.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-unused-label.dts.txt
new file mode 100644
index 000000000000..4cdcaba3ba2f
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-unused-label.dts.txt
@@ -0,0 +1,2 @@
+# mode=stricter
+bad/dts-unused-label.dts:16: [unused-labels-dts] label 'dev' defined but never &-referenced
diff --git a/scripts/dtc/dt-style-selftest/run.sh b/scripts/dtc/dt-style-selftest/run.sh
index 8117dd9be90a..5691301d6a4a 100755
--- a/scripts/dtc/dt-style-selftest/run.sh
+++ b/scripts/dtc/dt-style-selftest/run.sh
@@ -26,7 +26,7 @@ run() {
 # good/ -- must exit 0 and produce no output in both modes
 for f in "$here"/good/*; do
     [ -e "$f" ] || continue
-    for mode in relaxed strict; do
+    for mode in relaxed strict stricter; do
         out=$(run "$f" "$mode")
         rc=$?
         if [ -n "$out" ] || [ "$rc" -ne 0 ]; then

-- 
2.53.0

