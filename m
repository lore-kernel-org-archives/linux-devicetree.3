Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313B1382F23
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660362; cv=none; b=WQl3sZNsU6VJ+dsowwkdW+XIlKoOzxYFOXmiAb2b9yHv+9FpK0reZo+wGcMD4T99ccaGNt0KMSZBUB7yiUqwPy/NHh4s0muJ+fT+Y1OQBEBmmLDlMHbksmVrym5cclYd/o5C1a8UYgA9aI8u4u/E6oFZ0wQY+zlM3456SwI3p0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660362; c=relaxed/simple;
	bh=YRlOMyo0lZZe/buwHiEDFzRrib4qkQ50ezeLCpdCJZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIzAQ3JhfYY/Ijxm7qqwfQiC8S7/Ot0Byt8yURtr5rH8qTfCH0PdU3qH8p3EsEBlIH0DrxeNq1wrQDQM1Lj1uPWM/27n3335Soo/3363WWJANY7g8CVkcpe3J9ijq83JN4XW17TodWTG351tdacHQ8DMEmOY9i5w4hHKcRAYi8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1cwH1yW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f2zWMs+1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1cwH1yW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f2zWMs+1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727lZGl531848
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/zGVau8Sj6cVkJ9qLuM4TpSFpYN4/V5igr7XsXog/Ss=; b=H1cwH1yWMJ808w2z
	1YxY3UFfWgC0CwdKvV3ZvbFT3sysGh0xN5KbSGONJQx09CDlQbZaH0qlKHEgV/hL
	34tp/SgWVC0qAvp0H1/eBIZu6qEAE++KM4vXYSO9E+43K6sMgsO6262eVfrWtD9S
	lZsuUgE0gHX/tsj2TTgz2CVpgSL78VD49CG4S1SuZSUtNSPCgPfK4IRJsdtt6WHy
	j+b+xGp7CrWzxS6LdubpqlebLAxbrCn1bxGTKRX2JpURMvIdPnNninWg95UOOSBg
	37x5MRopP8o0jKgAXe2xDSJbUULhjzR3keYzMGDTa3N1UpHoqf9YXtlAsk1HwFDN
	Y04fag==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9ygjb30-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:45:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfe3fa93bso21874861cf.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660358; x=1786265158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/zGVau8Sj6cVkJ9qLuM4TpSFpYN4/V5igr7XsXog/Ss=;
        b=f2zWMs+1dAz7yOgi+14M9wcjjN0tI71gaifg/di5JxFIdZXMgTZgufwnDlSIMsS30T
         Z1wLmhIeFYa1SUTFKtELZF6CqeafMdj7iO3dMeyL1e2odv3oNbl8SG9g9SyhOFFm7t0u
         IgphgYEHFdPqm/1v4wery37ujwQXZaLv3iJsdpwW3GrJmcxPigcv0vbETixXKOgzLwMe
         L+Zlqj6PxZ+DBZqW3QHXUNb3sUaYhzi2Ql5aJCrNDp0AM7THL/wcYR6ZYiarvTP3AsSE
         5pMfS3YBNendgm+Jo8noMR5PFRuLDDUwbo0sDJatNeCiHmJBxg5JcxHSxnCqq8BUvHYg
         RfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660358; x=1786265158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zGVau8Sj6cVkJ9qLuM4TpSFpYN4/V5igr7XsXog/Ss=;
        b=XLffr8Ficv/l7PIPPOS5cGT68pSR1MOIzAWmTRPMMAZ0RYIEk79uZSlv5UTVEHJ9Qu
         bVGmyyzooFclm8BQ93WHSGuIPZMQUEMrk8PWw1omyZWFBM0b3b8xpttfWIxMewja0UvO
         WJhKVWPzwNZo8AwTbu2+ZjJibKiYi12D2OX/aEZGtIkcX3/d64ewKt5UaFAwUu74OdXD
         MqfjjyDDvGlIk+UqNIjBP4/8PZ93nof95btDgzAlpgM13nXvP93B1D2z7TnRrbeE9gnK
         UfWdCeaFkybauM/V/33Rv6X7l24Eh20aDdlFS7TA2N3952vSta/OXYPt5Kyb8LbHZ1qU
         Fxlg==
X-Gm-Message-State: AOJu0YyhzY5YWUehdDPU459bnBEWofC03af0U+EK1pBUmrwCA0By8DBo
	jcGdnLscBLRMEK8Q+4y+/rpl0j5HNICPdmC95PNGVVsToqLdsvdtVHvML70n3W9rfMSyx2PxPyQ
	oXDd8JJut+FJJiIOOEXq6BgUtcFC97geaGqmTgz+q9bkTWpMWlTYQmxhosRzzCpUH
X-Gm-Gg: AR+sD13U01ps2KlLS1dcw6NTT0h1rvMK3OO2gb/cyrtxMkGNtP+BWS4GUDseiajPF6f
	QSoDLwjoeqDN4TZ1ti6qCXwTqkjwVrVT14Y2ncfbjl+Pqw2LHnWa1jEu+tYza5/BvZwsir3FuYJ
	eG1DJ2Bolp74v5KetTClUJ3TvHjag4ZYgWyl/AM00R7Q63IfwxRqE83FzbuC1UJ3MVI5GEW00wm
	tjETmRAkMizmQ18VpxS2FPsgz3oB8YrfNS1oP4nx6PQYIInwax0ASEtPXLBEStXc0YI576r6R15
	nlrsVjYl1NRn4fqXUbOhvcZsGCjj0jGANpZQPNsggF57PzJcbgfxo2hQ+aSn8oAgQaXiFrxPjbM
	+xJ0RJiV0daq+a3llyAlBgIzO
X-Received: by 2002:a05:622a:a06:b0:527:43a:2f30 with SMTP id d75a77b69052e-52b5676021bmr114737591cf.1.1785660358249;
        Sun, 02 Aug 2026 01:45:58 -0700 (PDT)
X-Received: by 2002:a05:622a:a06:b0:527:43a:2f30 with SMTP id d75a77b69052e-52b5676021bmr114737291cf.1.1785660357746;
        Sun, 02 Aug 2026 01:45:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:45:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 10:45:30 +0200
Subject: [PATCH v2 08/11] dtc: dt-check-style: Introduce 'stricter' mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-n-dts-style-checker-continued-v2-8-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6851;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YRlOMyo0lZZe/buwHiEDFzRrib4qkQ50ezeLCpdCJZ0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOx0//2Jkv9MS+AW1gI07Vse2cwfPEbFdf+7
 Mn7SHbLOM2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DsQAKCRDBN2bmhouD
 188jD/9i5rqq87zTGeLYKXjND33PaAU35ZzE+3Vha0DVZi0aTsZVoSkS9Fu2x1Svib4BwFS+pV6
 qZVmAtTOGi4bn5cDH4T9n/ffOhanWgjfBxeY+USGm6tYXgo55SSKrBmMHsHPJwqUOad4VSDiYps
 We9TA6OxAc06QQ7xwXAPY8OMl3ikKV1RnGWaJ4RMDKEEDzk3aOfruQzoH+vgDPgtwFRhsWVjag9
 4aQajuDhswh2jkblf26lYTuZsSp15E3EJowTzREe4mQiDaA/7blL65tokRoWqLerOvBriCGXogU
 70THIN33xXgwQ1iC/zKjdZFk0PZgG6dnYVfjtwoIqyG4DxZU2V/eJ7B5Y0Wr78AUn1ug23syT3Y
 tJQaFRHnbWEkWgONhCy/7sNakQE7nlUCcpJtqHuHfsy7+weVzX0M+FlJerX7xqEPjXyTYWVq+1s
 gTIXPCDuG3T++pPi8N66pOMVnDmsf868ko3toxkwQACSpE9j9gUHHZL8rSEXMnCp04TQG4gUZwr
 ENMMa/hSkbhLoy3ACieOP/SqH0B9eAVKXRlcar1l2gDurcm2b/+HMFDlzEwkdo7xyzl34kLie2Q
 sKOO45r20WgYoNzp2qszgjmTtzVhJCIApgb6iMU81+aKdnnK+/TbrqR1myl6vwr4mBcHqGQZpo0
 +gqtoGVUpRWds+A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfXxt4OuAZY6XPe
 tW25EKu+TJTO4bSULBi5CpGv+CfGXHkQ8pi6xwTfYqeJtOsG60H/SNdXp5HGyP0IlRE+TKO+Jf2
 79zXGNJFIGhvQd80LiTCBaaZl3deeE4=
X-Proofpoint-GUID: haOI-bwDVEIZFWxsAS-VtEi7tRh2jiH6
X-Authority-Analysis: v=2.4 cv=Gu5yPE1C c=1 sm=1 tr=0 ts=6a6f03c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=F1kASC3mFAX3J9PECjcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: haOI-bwDVEIZFWxsAS-VtEi7tRh2jiH6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX7eWPpU+ujc7+
 HtB/N9jb7e5q7km7PSH2hpAoM/FN7SKnrvcnebBIJbHIOX1FOFQbi3wetlJCc0k+COw83BhkRLV
 ymnsMUG0ENr7HCwfw6HxtcvtWcB80S7FkEepMx4u8AMHIjmsB6qDcUEIXz9v4LbtOaBphagYAHN
 DEmwP1b8DvpLrnt+yHCTg7jobL89jLEc/3g6o4vVN9jbkN2/4Xj9coR8eeTZIKhBxWm3IXPT3K/
 nw/3uH7Q0p34Rs3t4ymZl2qBYCuC1tB29luvXvBXPlhpB4pdE3LYPxrD2o8BL9CIRMhI8qEFCHJ
 Nn31rddshVVycUkmzlvsqgqsnYHoxxpo+3CZstfQfwcu6XysWGgERAFPR/Ve4d2XY1B2TniGVD6
 e1sN0YXSbO7zzcieAH4sE9DmQQUwF2rWXUpGIOV0RWMLeq5k/3vk6ToVVV0UTyn1Vp+P51dzbYy
 OJc390Eh/wPjLabLFMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020072

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
 5 files changed, 63 insertions(+), 8 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 54e96ce04b20..56d8d0c217f2 100755
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

-- 
2.53.0

