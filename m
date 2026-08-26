Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9023E37E2F7
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727991; cv=none; b=sr/o7iPGoS7+RGlNyO0zV7pHA9JNx10GmFI7Brjhig/WFr9G605Y+ATIzC7VOCj4MCW0qiX5J7bDuaAfK0eXMjkB/TXXGwTAIqkcLBaxcMdklKGT571VDzIaCYUom5tKaCH0wKKXRmkxe6Qvll9KTBGwLLdwOiOaFnF9j44kpxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727991; c=relaxed/simple;
	bh=CJO/5TjSH1FPZRQjK994oHgMixcpNr+/g85rykgD/Bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkR8kUdBcu/c0hV2THS7Ula+R8nUfb2AuQZhc48XScbAQ3ctbdduV5qTE9pprIpwKYdTUb1M+zSOJdQ03n102cq+nNNk+O0Zzk3v19bS04CvgwvVp3WOt5yG9apl4KZFNLBqnNDNj2MTQfZRRwTp7JQuezZlPng8uphIYPVwhwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKuugM5p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lfb5APP/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKuugM5p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lfb5APP/"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Rk363783810
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	irz+8vRlMSOrOiiDYL0GKSC5j1v910wn/cL/Cbp8a40=; b=jKuugM5pA5uifeeY
	HOJzwVTP0IkeuApy3yy9vyykVMdwgp9Qye6mMAU40UK6H1rSiiv3SsgCf37dUzT6
	JUwNmYjMc36pHE3zxrMUv9v6ubrGxa75+n8h4haGS1LcTilNSpq9BtLztmQId7Ts
	ZZmVydzrJp8GZNIVg7F80Uwb+CBtUE3F3qAYq15GIbMT4n9Xwc0fPd4sN0EfcJgS
	zF/vVc9pSruNkfLNxGdX5HLWHewCEfYV3ThLGcLDEVIADDPhRP435piWtBXuSrYf
	qThvOpGcgP65VUKOY0IPqZOEO5qAfqLkReQFpSZsayvYB/m5rQEJokVabwwqMYTk
	k03FGg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g8hp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:06:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52e2d1bdce2so6961301cf.0
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787727984; x=1788332784; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irz+8vRlMSOrOiiDYL0GKSC5j1v910wn/cL/Cbp8a40=;
        b=Lfb5APP/E8qxkdk9RZPiuHSGibOsuk0+0JwPxD87xq+uUxduZNhJjXX3GT6mMtxVb0
         W5d7H+iLPgssFw4jzx+T0sLoVM3ADLtzzVQrVkrHZvr5mFub/qX/yIMDMPUR62kN9eYk
         mVt/ES6DguyhxcwEEKvbayZ4Fxlqz7dOvTbr6PBtCPNPu7pqBGPm7o+TG5pGGzf5tdpk
         C0yeQiPGsUJszb+D+X4pIfhlt2nWWbNj5buOWN1bgAlbfcoPbUh3vpsbQpDFT0F31TXc
         xFN1zGnKPxtsqZHgdBXv2xDKhRdn1xNbKbPtwGX7qiclFGyLSB7uZ4eyf7QNefbn6dZz
         vYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787727984; x=1788332784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=irz+8vRlMSOrOiiDYL0GKSC5j1v910wn/cL/Cbp8a40=;
        b=X9U28ASEl137pMxYFK3fMbe3lqrWsw/WEwB+7SVhsSj13aA0JwlCbMtUM7xT7MfXrk
         hmGdYHuSmmoNRDO40lVTYTPdl9prvqAclesTpgvLHM56ujwJQGq4M0FbyBQbFLQqtkZD
         VPDGXaDFNiaaV9cH68c6OBqnmF45zHN3dEseIuowF9YO8VeiJrBzG60pazRE1IAmkiLg
         2W+oGTOpvEpZeZjsnLOCB7DYI3AMYYyUL0UyPxDkbgSyYOAxPVklU1fRAZcjoly/1INs
         ssl1zlDMy1vIXOtzlNUHyb4q9RXFFY8o6n+DbIHNkgCXzaUeLqCPaTyiJs4a3eg2Y4RR
         FZJQ==
X-Gm-Message-State: AFuF++lgSF21f1emiFr7rWQOTU4DArper887S4aUzzPGqB1m5pFL1zXX
	pROselV5VCv3rVbgbYSbXFqWqNeAtBrQj1V3m1PAdilXEQ/2gfpFhhB0qAHAN3vzCwbJgcIoGzW
	gv7NKbUqlZp7t5zePAMmDIzvMnQLhtI9yVANVFChLWghLgrHz5qIeiBCREk/75nhZ
X-Gm-Gg: AR+sD10qfh0Gc6yoiHJH49RjplIZWbteAiI07vPoTaVl/LF5dxMuhigmQF7XlQS9gF1
	fJ1OzcHtZrXHGF9nAq9AKtiyRsnsFjcJ0wUqZq8fj/qAHONhuQqOTi+UYiMDs7v2rpWZgy0OGQ9
	r15A+9iNkuHSLu3ROwW7kNQFCEZTwLzXeV6JMYB+hLeRGo0OfFGiDNgcgXwL2JEcz+MdibvdrJC
	X9Z+kBgSH7ga7onWrDnIqg4ePIkdlkH9msXrggrqc4CxJutfGFkJhG3KX3UXc9vEpcjXE62NnmU
	wZTrb2Q1q31FcR4fqV76oJILxpRgR8kZeLUBRyzxfJWULPFPiG2fVXPoOIB+bpmkfDml6/oV7d+
	4OdEYxpCRM+12QnZBCVQ5xYI=
X-Received: by 2002:ac8:5dc7:0:b0:52d:6c36:db32 with SMTP id d75a77b69052e-52e423f7e4fmr35355141cf.41.1787727984418;
        Wed, 26 Aug 2026 00:06:24 -0700 (PDT)
X-Received: by 2002:ac8:5dc7:0:b0:52d:6c36:db32 with SMTP id d75a77b69052e-52e423f7e4fmr35354701cf.41.1787727983907;
        Wed, 26 Aug 2026 00:06:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab82sm366812966b.31.2026.08.26.00.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:06:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 09:05:58 +0200
Subject: [PATCH v4 05/10] dtc: dt-check-style: Introduce 'stricter' mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v4-5-022e60091965@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v4-0-022e60091965@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CJO/5TjSH1FPZRQjK994oHgMixcpNr+/g85rykgD/Bs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjpBd+c/4d6U5/utMaRPgcRM33drTrQjNG1ahG
 iZxuF+xYYKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao6QXQAKCRDBN2bmhouD
 1zV3D/9YiCbJJJhl8DvNKkKOA93hHiAoQ/nENhoapOP2A43WVBbwY7X2SwEaYhd7+MHYc44x2vt
 oWhcQurlYnLYm4lzlyM+bSrzivMU4nknz8C/DHqRw8SthoIK+xfbXXH3r+Wpqq6NgoI98qCPTSF
 NYj3C2xAzI6a6z6Hikv8QxTEp+ye86xReha0ExZYps8tN9eUe7Wzi0DdiygWPMe0LC3lzGIkgTV
 lJqsFIEPRh3GPCsqD2p2xC0y++T9h3Lj/DVSNlqzBarAUoftEET1w1abwEzdFK5zmctfc2EVGz6
 BGvN1wQiTT78xSPtJxRTjEaLrkDxEsQSrYriLvZBjVA40t6G7IMUnmOc5x+HuRFJYRDvZbCEj+y
 mGHeWAIRqmxMZHK7aOAsNLYQFfsvNbYoAwex7+sWSK4YikZI96JL67s2a+P7hCPkZJYO+7ZrETK
 HvIYLUZAVbqRnZW/ulHdYqptwVNom0mauiuZ77+L8j8IbeRXSsMl2nYDjqhAQv1XAa6mynUCP5g
 SYL76Osuug0bNh9VaMcFakDTbUfRxbghGCAUynn+W1ReeSedL4t2G/alWmOYT2N9TRi9ycMnCuK
 meXI8nvC6kNtdAu0+KPxI77fiqdLknZTad2DiD1s7ELi9Q29GgJqsCeS8Db963iYe+fP8FcU50t
 kOpW+AkNWFm0uvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: BYHqhyRiDUCRjSSYBpQp7owqNbZVWtch
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX7eE1QNP/F3Kl
 P+nq2tvEFD0G+uXW12ePi0iYd1zhgZh/w3LDVIFULMqfjPxcrD1gq0vxhHGWOxoG+CmvUvNKkHt
 FbhK8gY5Tt6lmberYrfRj0k4t5jY3KUjJJDiWZJsUKj/2l1FQhjNyQRG9/W9m9RpaIQaB6r+16s
 lKMwzwzgEwVPOGOOhhJCT8Sjdeto4/lno2VGAHnMTNByuKHhxO7SGRiGTHt8Gd2HUYDrSHDVTD4
 yMgpMwMasfJkajpF+4N1s/2cTp9EGI/6VKL0gK7VPQr7jjROPcXr0TB9qQzsOx6LhMRaMEwFKWe
 thZ1qxcHkRP+JZI/HTFuF+irq953QBSalUYdXdS2CGmyLaCK4aJflHeaPm7JVLEEP2LGhEfkzMm
 zNocmxFLaImMmY8jb+zFU6mGFqdO6wkSyxTAgikee0w0kiz1Wu95rZ3v3LA+NI6Wax2nq6NCKQa
 qPSvitc+pHzq9JZpBiw==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8e9071 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WUDqnpqoxdndseS9DjUA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA1OCBTYWx0ZWRfX3jlM2YnUiVkN
 EGYnLzD4ic/LIvdGeDuppJJc5M44znfN7sPVC7RZ6McoRf2QKGkAt/3OcsgzqDWMBrUmnIZuosu
 VI6LrudPrqS/B7+pY2AYLepUblkK+M4=
X-Proofpoint-ORIG-GUID: BYHqhyRiDUCRjSSYBpQp7owqNbZVWtch
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260058

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
index a8a3b6e0f7db..5da3df25c3fc 100755
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
@@ -1059,20 +1061,27 @@ RULES = [
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
@@ -1200,7 +1209,7 @@ def main():
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

