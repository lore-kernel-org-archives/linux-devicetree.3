Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786C83B8BD1
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747836; cv=none; b=t6sMc2Yi0r34Q7T9xWArX0qRDuphR9o6FB5qYpfswYT4v8lgWGxNsdR80SesnYmJ8YKoa69Axjagab0rqVj+mOzE3DHjFNoOtwd/n823z0EN++qkea39yQCokSdHRz62xffd3GYd5yZkIHI3f93mMZbgWW8junlDuj5wHhTHotc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747836; c=relaxed/simple;
	bh=CzfpFIb56BTA1MD8PYGLw3B1Wg3oKe6z9y1NI0KLVxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tCCMFA9PuoCZUDULJGJbl80uGctB3Cu0zQWYnSOtjKzd4Ke+7opcDZ+MvjByibgbyosUybpEjbnPI/e83MvKLMeTJ+CtuB6kx/UgfKMc1bjIgQ29p6xSy5vMcNii2F8mzfJZUlj0Q5kjSZolU2lk+TJuReVDzEksV3k2CeuZB+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LW81/z5n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aC2tBUvx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LW81/z5n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aC2tBUvx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736T1RP4014138
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ifxXees6xj2l++WoYb81ui9QOjZbwC21AyE9dOKo02w=; b=LW81/z5n78ykEscV
	zrgRnLG/NW+ez4MPGRAwLPP+CZnnbtrw9FfgBxGGiPCMQJxj/rD3j7DirWnpP+v2
	YPrP64ihJJdIAWXDyAZ2ZtrRXheyRARAtdYrrRq4sdzcVf3F12J8h3cqprtumGzr
	Hx5iOhHceR3pWuemDsU3kmco4ttjFYUoa6evII6OrgM10MQzWU0h/x2mT7sPhKaJ
	UQfOufwrOIJcC6bbbecPNiRFUIt1l2h+fgqfyABulrvPB6s1cXq1ayBw2Uqs3Tu9
	+tYMnclCsqgtwXlMviC0lMoAogypk8BCc5rSA4Jkt7eD7AQZovPu4wa/1bhc0iHR
	Uiq29A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrt8p4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52b4f6ac06aso49369051cf.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747829; x=1786352629; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ifxXees6xj2l++WoYb81ui9QOjZbwC21AyE9dOKo02w=;
        b=aC2tBUvxYscmao82HiOcjVmxVxNHpeyPSQpcS8Kt6Aczd+IZGh5anqf5tJvOaRaE8g
         VpPzVdrsYIQswOwpJaruiJoCHsMWyyYkKtVUex+Ip4p4H2HiVw48hY+hwEB8YYzUImzW
         /ouBSvbgeB72CwJp/rvYw1On+5vDNGcfwFgwmF9WbezLdEMUgUHDBCaZif7Jmh3Cx/eP
         D3OjVj4XX4D/5U7wJ7Kbj1lqiPhCUnDgcSBaMr5jW3Jekzxk6Y/g044/hIXGqvxYxdQ/
         WF1NMedPhlh6G/o4LSGZzkzZG4mo8MQ5pqsyGEYpPomoFgvsaPn6ULIWEewF0OAjXiHr
         iU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747829; x=1786352629;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ifxXees6xj2l++WoYb81ui9QOjZbwC21AyE9dOKo02w=;
        b=nFCMmujqK26HdRcLNidKxj4eW5WdoLEWy5owPj9OncVSLOXXNydVgIe2bNvdWBZGbR
         G2denz8J7RVCXf4G+HIWwOecVMau2/Odnaes4Sggsj+vLIYQSApLeMthFppOLuztbJSz
         PpUL4aiRJ7//ta2crpRp6ODVaS29qSsejgcw5Qic/6MTHy1+31ayymmMzhbo1lRtcWDB
         nynBqrW1f3rFFg4Nv9df0+uaC20jLJZ2xZNBDBNVSl/41iFEyUyuc0jjldHgHa4ddy82
         wUkL+kpYu+untw93G9RCQlb2/f4A0f2urZ+uMSlUQe/QsA0FjGqkJGTIym6tDAZ3oDJh
         LKfw==
X-Gm-Message-State: AOJu0Yy9jtodhtCvkGqRkRJmph0YdbhIU9ekW7SB4DZPzTnsXVQrDchn
	i20Akyt7XCk4fyQ8Nx0ZSBCEADdzWeDvRCOIX4MBrfA9amSPYrw58dU4t20HA/0ZjQOC/3fW1GF
	ZqimpNfJb1Birt91f+RBCx8quFVlaUygRZhGBrVNskLtFALjZW815nLBYiSPCeJcm
X-Gm-Gg: AR+sD10A3VkXg+ogJGDirDy4esgKhR8QLPWPwcGQx2+0fH971wrtbOCo7RESJdCRvyb
	iJjJKeCv4rjVRu363yqIMVuY0/31n2g18DW1BzRaoNAGbjBs7CSK8cu79JQa053WQ46cTnsEYa8
	ujruIx9nU79Cd1vfEIqiy/pdRFtqZ+w+jbgN38d16FFLB8BtmI2AX4oOPh1XR6UPqnKKq01xKp6
	joPJnphlRhvzW5UVQDiod5h0FZnMXT6eIDW0jUBYCPDy3X9OE91nQFoK6CSn/Ns6bPCfRxOelOp
	l5fYckFI14mJJ58FBF5KZQYtCkFATnLOfCM4jVmwul+8RFk7vuA9Y9EOpgjjPfE+cNwnDdEPpSR
	EXliyNhHeX+ELlQguzSW58ZIs
X-Received: by 2002:a05:622a:1cca:b0:528:3b5a:67c2 with SMTP id d75a77b69052e-52b5666d931mr185585921cf.1.1785747829463;
        Mon, 03 Aug 2026 02:03:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1cca:b0:528:3b5a:67c2 with SMTP id d75a77b69052e-52b5666d931mr185585251cf.1.1785747828941;
        Mon, 03 Aug 2026 02:03:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 11:03:11 +0200
Subject: [PATCH v3 08/11] dtc: dt-check-style: Introduce 'stricter' mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-n-dts-style-checker-continued-v3-8-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7464;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CzfpFIb56BTA1MD8PYGLw3B1Wg3oKe6z9y1NI0KLVxY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFlctvOKe86dSS7TbLN7Je+5UfpJk1YmhEU+e
 QkWEqZaZu2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZXAAKCRDBN2bmhouD
 1wX4EACEW3B+xq8hmtx6/2VdoFSeEEUoxx/VYUF+AgcmyKYf/YBRlSghenEo/QZNM9arDa4uw8x
 LbslnTGBqSSbiNFv8MSdaqclC9dG2gZkD+Q+wyVCtbzMYS4krbKXyFkT+4VnzG9NzMMWzMehW36
 lXvQ78IItW0rMeVaWfPKe1vcPd/WsLQBSB1q5kY6h4U0CysSkQbv9GHxW+EC2m5QntZjHDQ26w6
 daM/3g3YNyfkY0rNnvfeHAKWnMDx32GLuMzRDym4TBsL/Gy9e58SeP2ibvjUHu1lsTzOaZLO7OI
 ov3m+V4Nk9x9DJYqOCd8cRZJ6m19qSmOrMN6kU+Cwk0NQuOULQEbl7MGeH1zBvPrKc9ogrfYZm8
 zCsmmGQs7Y7SMc/mLA3ZgB9H42KasfDp+jgVH0Iso4NwbMWa3QvNcoD5qL1cBC+VXGqzwVKVFyX
 /JzzXczWA2gmnENbeR7JSweB0tZdBawu3BcV8NtdaC977lGWTXMNgO1pWDQIbBRwebHUApIKnzt
 dhP9KEc7CLgX5eQbpN19VjbhjgB5W99gAlq16SIW69wwVtVoGm/AOlvSBkvYpEuNQJkj5QfPj8X
 e3jjKae7jSMccJ9jC5pxzGMDn5T+eHU9kmhhVRrtPaRmF+MiX39FervgcrKXFiafkv8CFkO1ML8
 /WSChdATdIA0BpA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX3qSDHFWxxU7Y
 UU5an6wJd+QC1gBoYv3RjqxsAgA9dKoyI2bvMq2fgO3tukCbjtha3fPQ9LX9fHpUcBfnKSbT9us
 DXuezog9LpLCqVn0WzM7+np4SXeKgQuYy4YDPAA2fHeOcGL6U3g+q2OayZQJObBbKhrWYGX2ERZ
 wwBtVyDS8EKjX2PpmHuhIoTTKOwYcm6L3PA9xAcFSL9jc7SmGthVtXzu/n3HgWvYmRg/VF36VpZ
 oLwqeolfX0mF3OpO2NrY5dB5e7AC/YzSxdxHNHurjts1E56t2tiSldLE+pc4x2zE2Wm4oogXqRs
 exR0rQyCnKuvJGlzuYF37NVKKi2WmOEJCEcT2LTB+Cm2qa6JX+IIWuJmH0zflLPQ1w3DkUUgMrA
 kcyLJYaHbDWF9bc7Mp7Ff/GMLiPwQ2shaivVWs/yYxAuR2/x7rJ0rdCAh7fA3eAoEjn3e2gpFHJ
 ddOJl8Gxzq999K3y9ng==
X-Proofpoint-GUID: mpnU90Rh1MqbrMEjS6g6tPWH0VIxAcWa
X-Proofpoint-ORIG-GUID: mpnU90Rh1MqbrMEjS6g6tPWH0VIxAcWa
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX701Wu1CCrtsV
 k8IV6G1dOpdcRZzkI6K+8WIqPCbYIkwfrDnPanNJL433TkZbnVmVcO0bhSGhRco0VqacDYDFXGP
 9t+5nCUqAa8l2QIpk2/S7DuaFECk+dA=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a705976 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=WUDqnpqoxdndseS9DjUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030080

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
index e3adaad1be63..1430c675bd95 100755
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
@@ -1058,20 +1060,27 @@ RULES = [
          check_node_close_alone),
     Rule('line-length', 'strict',
          'lines must not exceed 80 columns',
-         check_line_length),
+         check_line_length, applies_to=('yaml',)),
+    Rule('line-length-dts', 'stricter',
+         'lines must not exceed 80 columns',
+         check_line_length, applies_to=('dts', 'dtsi', 'dtso')),
     Rule('continuation-alignment', 'strict',
          'multi-line property continuations align under "<" or "\\""',
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
@@ -1199,7 +1208,7 @@ def main():
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

