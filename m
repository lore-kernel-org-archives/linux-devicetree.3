Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99563CB55A
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080877; cv=none; b=AS72U8oNlzEzsSfJR/xGshTeCNmbfojWCL7ifRgwqIoaANqL5CKu2h2PV2Rzxfk4+tqleaxB68ONY3DWV3vIF66VSe12I4Zgfz0QTK9P6gPPPKbw8xemc/eWW9Tx/+LiABjjQho47IXOb0iyEKrDY5B0W1tiC+O3CF6SshKR9rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080877; c=relaxed/simple;
	bh=ITfUJ4Yy1ctLwCcf1/dhOr4LPqSYQe/Z8LtzYzocTfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eShglVMA6yfq5KI7wjd3UCrLyR+0UWwb7kiLWEP8zPN01/WjMyreg8MqNpRfQZGFWa28nDN4fZFXTNJDi5lXW1qLle4kyVBrDU+wd0+tI8yixx6dIOJdN45F51iP4cAM1vQjy5B2m9eEa1WYnnwCsiOrBR2JrLXOA7A4fFkjJoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FOXr7tMh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WaS23tHR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FOXr7tMh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WaS23tHR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE2w7G1973941
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z3WcPghVRSGUumOSVTTZTJh+qt2xNMVcGz1JhaWDdow=; b=FOXr7tMh4qnVwxHQ
	nAcG7jazdvbINxFFq5m7LbY0ff4dbWjIUkM/8Ys8EP1Xar7pTD6t74ZkEyEbxKv8
	vcqiwk/MQPAhGStu8/Ox86FwOXAk0X6pxHSZpzo6mFRoWeoa9upl9LRZ9Nim/Vr4
	PwLV2J6FJpZNu9ex80CYIjwyOk7ziEXgFsUHJr2zJyFJz0nMG5awYXWV69xreU24
	KfrVAhobZFGOzTRXzOhyvRxdT0/Jb0AN1cfJbzlwaEfwX5Lx/cZy/jFQMLKOFhzq
	GRpe3NY+sHR0spiV9kXBRSFXmEKJhUgMSHFXiwgR6KVOTCZjLWl6KL1Z537eu4cX
	mviQNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmjufuf84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c19493ac2so31584391cf.1
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785080872; x=1785685672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z3WcPghVRSGUumOSVTTZTJh+qt2xNMVcGz1JhaWDdow=;
        b=WaS23tHRJ4s/5/bnd1qM0zneTQcEeO3xETz1aYBt6nltc+Mrhy4NEIxu18i8Fed1ff
         Y+h2Ok/Rb/oAnFd5qR2l41zbm8IvbM3Xyju7MYNrCTd3P1zJQ50R9pnik68M7366biaO
         EmRZWO8sYXsGSlhX/ItlnNaUidUzfyGgzcrQm83NG08XJcgZ+nYRXRM/j7PWkX5xmIov
         tYnnHI9xZiZSrID0w87N1MbZ5cfdu6gWOmM+brUuDIBEDojxXFtJzfJx/UShpHNCj6Q+
         HaFIqKLpfZhUCrUNZazNRPNXZDLJrYeUG7FDJJc2Ab+DPGcsnlzVhNmD9zwuR9ku1I8D
         Ba5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080872; x=1785685672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z3WcPghVRSGUumOSVTTZTJh+qt2xNMVcGz1JhaWDdow=;
        b=c1zXnoMKP9VUEUeK9lYr6ZdLO+WgdcpPLn6t1pWtucIbjGASZ/OIV7aZ9gH1zsjXKR
         a59N3QfyCz3XP8SMXfEdAEhdvxjHLzYVIdqeNtXymsvzV/n67XShAlg3g8B3Bl6DFgba
         VpAG9gzNCdmjjujMYAjblQyyPXqUKKvp5aAjisLiFcRL1GsDctJYi/fXkhFglOL3BPSm
         ysaMGKFdxawdByu1qHi5UzM1PMpcCuBGGc/YUHNlOi23Ynd+1T6zkKEwTsyNMqEOtv9V
         Sy+LIwkruzG7SZd/3j0ecnGH2oEVmgV/pqumBB6CYduiOmqTEHFn0l+8fCoE+iyVkIhP
         wYgw==
X-Gm-Message-State: AOJu0YztoRLIyq6vqISMH+A0vjHET06zX7YAbr+MrauQ0GD8v4x4rCMt
	Sk8oDcZ5/Y6rMQ9iSc+zynqdZlwwMapPoK30tYCGAK4YVrwXohLCh2NuAJjuIvTTLr3GK/UHu6E
	MuHz+5m+6SsXj2O2XK0aW83N3NZFheMnWhPpoLz9qObZ7fniSCPmvqTLQvw+or+Q9
X-Gm-Gg: AR+sD10oWpbnK7ji4Ojunq+NxEbpXyvUDRtGrTXTLgb1D3+MXcO1su9EoDkqEpfQIAy
	iiRiHTcLZejOuY/1ZABDvXVFvOWckAS7bXmVtNY3VTsTXEYwIrBAS6H04jWmD53/6wORKPPwQts
	6umXrHDdxp0OOZtsygsYREiEtkgf7Sbw1R/qbkZrkqnMYbQxYCnjXRrG/F0e1YSj4q+EMoMv/Cf
	wevDX5F+G6vFJjCWAwDlE4xJAReZDvlEFVWl2T74xSdc27O71wfufOLttElL6u3LHrJk+I/tkym
	8Z3RvxwwxNyh9cJHOAAVb9hPlFqIxPZH6uZok7lFHNComgubXT/qd8hHNXG2LUDVPAGCzf/7JvD
	0iymEwCVd39WdN2f1ayRNhlTC
X-Received: by 2002:ac8:5a45:0:b0:528:3ae6:14b1 with SMTP id d75a77b69052e-529a86ac925mr58655231cf.43.1785080872447;
        Sun, 26 Jul 2026 08:47:52 -0700 (PDT)
X-Received: by 2002:ac8:5a45:0:b0:528:3ae6:14b1 with SMTP id d75a77b69052e-529a86ac925mr58655031cf.43.1785080871942;
        Sun, 26 Jul 2026 08:47:51 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9ae5c3sm236848035e9.3.2026.07.26.08.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 08:47:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 17:47:27 +0200
Subject: [PATCH 8/9] dtc: dt-check-style: Introduce 'stricter' mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-n-dts-style-checker-continued-v1-8-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6891;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ITfUJ4Yy1ctLwCcf1/dhOr4LPqSYQe/Z8LtzYzocTfs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZiwVYT5Oz40kBLhLFtQZ7e1qVhoT5UbidAGL1
 vGe6c2hxOqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamYsFQAKCRDBN2bmhouD
 13xIEACLuQx28uNvrgvmHuVHggDLZj+uWvhP3ELncWaeguqvAV91aIvHodabqjDtLSRrYc8rJCG
 pX/pMXdyDklg4duuUjSbdV2eOc5LNZjgVdIfS7qGCvEvTcPixtfX5ISQVh72tdXZdaec1ppb3cG
 S14k+DpR1zEUv5LACUYXVgbOjT1Q1EgNoTp5VsV+KefM6Aqcdhp1eQpSbHjxLsuvEktBkt+wvrP
 6A0zNbTeqgbN5dNJfG7lq5nHGV6mhkampp2wn/Ch/lM9E2ovwerGYYpia55n8C+vwX/FfoZ/3AJ
 wbmgg0Z5Ygn9w2AmbklpuQY3bGssBa5vzWNLg9pX8xv2X5xqPMf8aNc8oX5kv+ohPI/nWOiyR34
 ruzHPPy0yfup0hEzVkvMAB+b2i05+KVIGG22tcZ9ERxk9038sGb5W1XwuoLP//tTEGF26QXBj/k
 A5XI8CZzmeh9b4wZcClsHrOhk3UYygj5oeYw4/2QtL18+JGF1q+lGXYtIwgDw1GSUORbh2TYKSF
 abq506pJzPt0LKOahOsX8efXzPqBIbXQFdvQTNkBJHzHNpWIhRnp31GBSHhqRPvmoGr567aq9lO
 V3aLs7a8r/eRgnGp6l+q5SbVxuT/UkY1YfakorGASWzcwKLTMfhs/09yTBXyrYYIFoMCupL+kMB
 uBWlZuEbyt2+BRA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: spkXD-EoUnDEhgKrKwMbtLVnDu8h3i2o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfXwpeSRoDtsdBU
 hogkvLGl8zA/3LrTUB/TP4wdi+DRq81uGrxu5iMSaS/0UoDmd1l5lUWMeuW4K+7xiso9mp9R9VB
 KGSOS6Yc5GYvVchz5/H5GVb19vfA+4w=
X-Proofpoint-GUID: spkXD-EoUnDEhgKrKwMbtLVnDu8h3i2o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX01HZYDd5BZwP
 xatgo+WoyHbZ2CfNFfRv53U8ylRyYtVdow/a/HYuHFqGINAv4LCnYimr7o1tNbI7n0FPDsWv/cV
 bDthHwAGNboZZpdNRSV/juo+5vShkvb8eeB/11U7Fo5Xa7Cj6EmNv8pc9TCsMo8bE0qELW41xul
 BDuJGBuawiI2VuAZYwVlgwVQr580TkZ0JBWyFLcY2mMVqdS3jOf39dTpjxFTnzs+95vAW/xUvLq
 kJjedrRH4jl/IkmqJV5CVMVKtvS5s/JxLef7ZZwFUQ98D4fkHCOzSR4ZT8HtizXSJNg8gsZXFJi
 oXK4dTfcFbUwR3TcoF7Op1o+f9JwSMKSPecOALWyZ2BVOzmT+W6vk1YgnJB6IMV6vVmAF0JyDqZ
 jvpycFrX+MeuUX8C1AXYy8CbqwuwRHgXEXi5ezDPoylPVP1cq3SoEJDvNega0lTrFsNV/o45Gye
 1LqbZ+rWfJqEbzLBO6g==
X-Authority-Analysis: v=2.4 cv=F5ZnsKhN c=1 sm=1 tr=0 ts=6a662c29 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=F1kASC3mFAX3J9PECjcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260160

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
 scripts/dtc/dt-check-style                         | 26 +++++++++++++++-------
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  | 21 +++++++++++++++++
 .../dtc/dt-style-selftest/bad/dts-unused-label.dts | 21 +++++++++++++++++
 .../expected/dts-line-length.dts.txt               |  2 ++
 .../expected/dts-unused-label.dts.txt              |  2 ++
 5 files changed, 64 insertions(+), 8 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 8c049c04b865..7e1d80ceab78 100755
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
@@ -332,7 +334,8 @@ class Rule:
     def __init__(self, name, mode, description, check,
                  applies_to=('yaml', 'dts', 'dtsi', 'dtso')):
         self.name = name
-        self.mode = mode               # 'relaxed' or 'strict'
+        # 'relaxed', 'strict', 'stricter' ordictionary mapping file_type to mode
+        self.mode = mode
         self.description = description
         self.check = check
         self.applies_to = applies_to   # input types this rule covers
@@ -1042,20 +1045,27 @@ RULES = [
          check_node_close_alone),
     Rule('line-length', 'strict',
          'lines must not exceed 80 columns',
-         check_line_length),
+         check_line_length, applies_to=('yaml')),
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
+         check_unused_labels, applies_to=('yaml')),
+    Rule('unused-labels-dts', 'stricter',
+         'every label must be &-referenced in the same example/file '
+         '(skipped for .dtsi/.dtso since labels there are exported)',
+         check_unused_labels, applies_to=('dts')),
 ]
 
 
 def select_rules(mode, file_type):
     """Return rules that apply to the given mode and input type."""
-    rank = {'relaxed': 0, 'strict': 1}
+    rank = {'relaxed': 0, 'strict': 1, 'stricter': 2}
     out = []
     for r in RULES:
         if rank[r.mode] > rank[mode]:
@@ -1183,7 +1193,7 @@ def main():
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
index 000000000000..d1dacc5c76fb
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-line-length.dts
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

