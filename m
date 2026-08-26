Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AB33E8C74
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787742991; cv=none; b=udtnUFsSmUL0pw9dIY9jmKzcRiHRTHQ8y1Gwz0x9/xJUthhfVULlSvb3Jg1ToSr9DbsDxyxWBRlL+fEyvUimqUbKCsYXNYcM89A+3G9wT9QvL5xgxAoXDTdXrQ+Y+R8LdKFWXpK0ZOwPLu+chTKx4rF2BiBM/IoN9JSF4y6savE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787742991; c=relaxed/simple;
	bh=3Nd0Fr0aGx3HpTw4jpVEC5Dyy26W/9GDP5cqSBbH0Dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ePrPPNNkSXHtQpDdw7daIhcl21iaDrLjVzcY4b7qEicVtM0F8nE6Zm7LfNRM9eJFYfKeXvcb3ymKRdjdbozgquoSDk/r6KvxdGmmoP5CJ7Zm1iatR6G1NFell9RClY4cSXd74E66/NC5NX99hYr/6Ahiqco/bxxuMaaNfZuDPXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q9SQ7yQ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFsyiFWs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q9SQ7yQ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFsyiFWs"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGei9121437
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cAyDyrDvctbLkPSbfKW6yU7FKAJafZWcD+OUPP/lBeU=; b=Q9SQ7yQ95CFpMaUp
	3OBUT5mBZwDo49k0sRVD1S/fhPZfOS3Zu7l8rufBD7a0P9zUVZTKPwAv3VjeiHaf
	gkfqeXg9aqpTktG9HmwZ77MrdtKD5HJ7+ic4WA4qpKQLP1q4cABIf0TPKkQocXAW
	o51BkuAAeXdU/XmPXxZNF1+aCWXcjAFk1n2KDZuxf/4EWbYMH2QHWphb4ODNZSEe
	YhP2fGuaR7afu2gyh3mToiB6diDr8DtlaD+EUBrHKxsFf3Vn7mhb/I6G/IXpNZ2f
	Qyis2OcUmXnfmG6vIF5vBsUw928xf+qOfDgdTlknJj30BjLj3PrW5N2brFvQZyrG
	QPxsRw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9smx9g8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 11:16:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f39a46efd9so17263106d6.1
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 04:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787742977; x=1788347777; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cAyDyrDvctbLkPSbfKW6yU7FKAJafZWcD+OUPP/lBeU=;
        b=NFsyiFWsgI0sWE5V4veS9F6fZe29/vzoKPxuTxWnGlJ2XbFw9OMr8TOCgDvyR/dRRC
         Bh5chR6tTnrdiCXkvt4ZSMArg3Vjf9utBO2vKy4oY4TogLVTYztcJEt2mc1ULWSg0tYJ
         b3G2M8eGsK9muyEAe5mbomp8YMExgVCrQWConh0ex6ELhNk0AWSjto6whRHYK7jd0rVT
         m255ueS3X8qdC7/nRKezZWynOhAdcPzswD3kHuGDDv0OksS4SDhbVtNmUoAg4wadOkc1
         uTjiBx/S2bFCxfmUIPSu6PufJ0rL7v4TDHkJywgrAEp6NEvclhqFYPq88diA9FZGyKIB
         uwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787742977; x=1788347777;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAyDyrDvctbLkPSbfKW6yU7FKAJafZWcD+OUPP/lBeU=;
        b=maI43xMUr+l0mx17Udl/R70QrjWRkfA11vsEOCu6Cx5FNpJNBQ34+JyTkfod3fqoqw
         NVoLevXnInEHy2t6b3W2LBge/sCeV5pOnqRF83nJtaxYN195QT5LP+OwHvPMC0Sg7mf5
         eExrN+FXPNWWHmeYaYykE2ikR3Tpa540UvKaWstxsTPu9EBB1C3XhDX3xliYAWb/E2uo
         qP3jolB88rB0+XDE+JhM8kZ/Ryd1lSsRFTCI3yK1/KEv7hGK+WR03/ctJy2t+BVCX88l
         tVc2AD9UjRiLz0yzjHaIB2A2y8bsVWaBXr2yr2I5A+bXjZ7mKN9DQnQJt9y9HW+J1/wF
         2VmQ==
X-Gm-Message-State: AFuF++lmEdhygL2pFP+kXSP5u4eQ7vyCh7LY+bgIi+jzG2HiScnx8job
	/tFqyPROH+qIyWeBSEf9IAH4lLabHHw/b/Q2W5YntwZqttvSl4H0IjqiyRhI6jL3D4ROr/JbgUb
	P9/NCL9X7q5soWVJ2ghxAoM94vmPVMVbBMdeSa/OPOIwEP1ErxoI2stqYdkDY+/bd
X-Gm-Gg: AR+sD127MLtNGCPAJB73TedjAqjcR/nbVmFIbhj4dNDwP4x9ro9n/evJccWLMZxhu5F
	kJnYs/jqKfqsdLBEYONKu0eRqbSchKO0njEtguQtnzFsZiiNKKbMeQRdtma8NGs0OmbeAzxTTMx
	apJR7CVrPdWrlW3lYLQiDfwkfU15F462fynyj7cjXKeDu3BnexvtoB6YhmaVuthfOMnNA66rUhy
	imfiZXW/1lgKArXYwcjSZu6+76nA0twpFZLPZJ5uNc9EpoNQaNbNQ86M/yykRUQfsnzYQI1FAFo
	qlkoVaOdHZTwM5NmX+ZHAxfrphopuPyZ1HT6EhKbabd4ZEe/NxNA1kP8GlYtnBO5JWnAJVrMX2X
	CmsWk6Jze8+x0xNGSc0Ftm3w=
X-Received: by 2002:ac8:5dc7:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-52e2ed58474mr122196461cf.20.1787742977037;
        Wed, 26 Aug 2026 04:16:17 -0700 (PDT)
X-Received: by 2002:ac8:5dc7:0:b0:517:146d:2cb5 with SMTP id d75a77b69052e-52e2ed58474mr122195971cf.20.1787742976609;
        Wed, 26 Aug 2026 04:16:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm4577843a12.13.2026.08.26.04.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 04:16:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 13:15:57 +0200
Subject: [PATCH v6 05/10] dtc: dt-check-style: Introduce 'stricter' mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-n-dts-style-checker-continued-v6-5-f270b1e81f8e@oss.qualcomm.com>
References: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
In-Reply-To: <20260826-n-dts-style-checker-continued-v6-0-f270b1e81f8e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3Nd0Fr0aGx3HpTw4jpVEC5Dyy26W/9GDP5cqSBbH0Dw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqjsrwED/PIj1SIr12/lTGGIKqjD8NZ6Jv6c9DN
 mB76nRipTKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCao7K8AAKCRDBN2bmhouD
 16OyD/4567ijsXhqs7RrCGE5TJryfVbSP388JH+KKqALidFOxyYZqEKBkqPwG0Gs3w2HkWGlw3J
 GDzPr1ukqg+jPdZtTPdpYq7rIGb/sLxgIpDzvYNbetbC+LWaU4CWaS5rtKupCsO8LsuufnKtpQA
 EMBs/RpZo11AHFfpYWDl+7dM8j0UUVHI50hytUNZgjjislPuCQK02gXPhvgqCCyZEyJK7PkHGWw
 PWo6QtnvGeo389YHCcsZM7SNhyWP3rZvEhRPiObvTV2y3tAu87Q6BQdVAaEVTvfWjO7jNtio3Gd
 S92PwqnfxRojvrZhaqGaMKciMA+vNUdFf4WMxEIqzbaxQuyWe0CRHnhhnaWINHU3tzqoZl9gfjk
 ZmADLAk1iRWUclE9mTt0gQ+NYpOqPZirMbVt14rOc+IjxyWQ6jMcrJ8eNsEPuLd7AI5Q+g3OJdw
 DihCU8+fU7iTiF2nsDXsw/XvTvpMqYAcpCOGPjwHKxQyNRIpm/Hyvl3pK/GYbvjxTzt3FPkyXWF
 Am/gTeVYH+SguiK0PhvMw+Cw9y8T3KjkNoZpxjwx95vKQNxFntqHwxEsXe7cO+ingnZxGcfDUB8
 qiMprEMLjiZYLVtPKYtGq6sVNDK89vc8vsSSEr3fQGkA5kHDRq3Wyd20pK+5YbXHWP5qEhr+lWK
 8PeLpGeRxA7OVYQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=O/oJeh9W c=1 sm=1 tr=0 ts=6a8ecb02 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WUDqnpqoxdndseS9DjUA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: DnmJrFd5Ufsy7SNZ0t_yaKLlOU5hPvXk
X-Proofpoint-ORIG-GUID: DnmJrFd5Ufsy7SNZ0t_yaKLlOU5hPvXk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX+b+NaWGvBkgL
 ZKh5gSem0wxbVuAa/U6YcYqPHYxa01HlzreyUIoiBrufWBnZJKcQJzyWDqBG5BoMqwaJnKBW+01
 9ajZKB+lVoLGe++iP316HC8fT8QTG53hfDghdbSFTSOipgRnr7A68Rp5MFttaKjd+8+SYLC1r6O
 hIQA8iJMiUk0ZcET1DgE6X7Zzsg/NtLg2UoJGr2ZUXeP5JEjz2fido2+Hl7e+mIxftwwrx+vWpP
 GpqSWX4h+0O4fRQ0RClsVgmOB/r2eLdLid5PBuPxQJ6cXILSXlzq7rGY4/yDaLA9sllMYMv0fYd
 kB1h9wQfte74TbDhpzOTH7j7VZinmHv0DeHsd2Y3Roi/NUX9LxISSITYTN0+bZavsk7g0egUICR
 yz5B8uJ8ZQF5kZebbQjkPLjrkP/zYwu/1qnUTcyUrH2no9VDgZJEEVmpMRZPZeUU1b37nEnygwP
 NgsUu16YNDqmb1WullQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA5MyBTYWx0ZWRfX/A9gDW6QIWiq
 /KP9pmu1jAFmxcILrYNTySgMW/M5dax802mRLdM6uaOTeapovevp1UyHkB78Cbf2LITpLG9zhqO
 gQHUochQvvNLXfudD1tPUsaehe6hfhM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260093

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
index 17332018d70b..b71e6bf815a7 100755
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

