Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8092D44F55E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126937; cv=none; b=MN9+eJu9/jeRwbvD8TMMOVTL4MQESqbMmtqof1QdLTuJFquCJVe9S9SmuB/CZrPZohvLv3R6uiA0Mz+pi7B+r2teYJ2v3JRpwuJN7K9sGrR6XYopgGdwJG6bs6jCZpTy7z9OVMatDWMcVThWpSIZGvF+8YFfnlacvFNIuKombX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126937; c=relaxed/simple;
	bh=JtqoWAh0Zg9+ND0y7QMxPVQunmz6Fs5ddvkEb8RR51k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h2TQye/rty8WFoJgTevXrBNA0wcRHAyrgUBZbAdLjIeYj1NUJIl6YnEUVvqnBHbp0vJv6EsG+HTKHKlLBGLfxGUaUPsySwYtY6VP/szDfpwq+9ixnyFWMPHzjnc5lXG+JHBy6LxE8GvnUu2q4Pp9h3WqEE9jRftyhGlLfBXlnE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AmKRu9vm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EaLJ1JFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AmKRu9vm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EaLJ1JFV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BAqDmm3251362
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:42:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SBLLE33CBXhJ0UrOTnAm23LNHgKdPCZxMEIjtLRg6zw=; b=AmKRu9vmcsbz3b0r
	OY8J6MzNQTPJ+ldEQ2pTSGmaXFCtfz/ZKXh4iGPaPmk310o/Xhg+ZZhfveToCCmw
	NkbDftggrWllnqwj9rhgWeiFqy99Y0he8yfv8J5VTWhfcgxRsPXucJPIJ626pnw7
	Ri73hUcTlTK6YG2WT2oDScjAT5k1aMYxzsDNqyGntL7AOmxfuZ0elXa7uoghhwEY
	PR2VHL1+kYuqgZlCqSQeso54TvIACPNl6fhuReYaffcT+3PgRkzYmAM2VY1+Ciel
	vQli7ytwIKQNj1+ijKshZePrWtVq7KQ9cAXe3U26f1ArUqn4DNiYGHcbV5n/SWYf
	Lv07AQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfh8w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 11:42:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9382f9430deso149601285a.1
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 04:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789126934; x=1789731734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SBLLE33CBXhJ0UrOTnAm23LNHgKdPCZxMEIjtLRg6zw=;
        b=EaLJ1JFVC4AbpfOG2s3EEcc38HPDiI56pa7lZNVf4qGZJnRAL2EjnL7BcJ4BaNpXn9
         xjsEp5lCXH/NA+OpJmdwWakHDtSX0Z//dcpSNpzoCl2497zaifO2hoPGOID4w+9HIe1x
         UD1+cyXSUCGIrfSNn4GxRv8h2NawxmjfogH/IQIPHbToAZ3w9m9KKnKYKcfqBOm3gVO7
         1xGF63HUEo8iPZOnEHZsd569n1dJSen7KLVZM2r9egLdrSPjbBOnY+ckK8jOMNPYdaJ/
         R/4Pv9flt7jJRFDFUh+o09GtMT4gK7eLZWEgW+uMq1EKtQuf9lssGwZyIs2G4Futf+jN
         2H+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789126934; x=1789731734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBLLE33CBXhJ0UrOTnAm23LNHgKdPCZxMEIjtLRg6zw=;
        b=cOy7Mac6XTmLrMSGZvBwgrUaO1o8h3eTjzunrOpueoTN/LBLI9qbmAAzAXnXyBUA9T
         W6MGZgzsCx7mxgomdB4z/CPShOf+ctUv/jLlJqjQwKeUisjl3be2PJDZW2nOMNfy/jPz
         FNLJyZz2jU13vNUKFxId5bXcmXQkLx088u2hDFIYgzUBfKkLZqmXEFOm/W7a6eiqgI6/
         4sYeigbfI09aVZ0mwmYX2Q3dro9kR6kJm2/d/laRmwiKKqRlYgjFN4P+mncVe0XOOYvI
         YrN45p1lxOt2BfiqJ92BfZE2YyVUI2WWgSWvNEgduvThJ0/kwJZ0/VrjcV5XVGjbV/Y9
         CkOA==
X-Gm-Message-State: AFuF++lIi0ATGcDh6cK9jPZDmd5+Di9TNJzdbut2G70S7rZW4Ymr05po
	/WcSf/Ob34Ynr1qQpau4Y5kJlTRdxyiKZ9cHnxJiWMPtCejWm9GjYbhU2r07rXjnwCd5BGo9tfD
	5ncCANXUg8joSVs+i/moPQG7q7J3qBlF4w+Hgzi58HcF4IkwE9+Gp0QvxZYLAmyAb
X-Gm-Gg: AYBFou1dRZ/rcJO0Knn0QWAEMJgWyeYbG1FdpxgbJIAG8vzDIPyFKZQR6YzDLND+pty
	B6tdoF0na07OVi9i0+oBz8qCuZB5xOumxOSDCKYJRxuC3pCU4cKhLXjfCSjIOG012k6OetdG9Ye
	lbTahNtGMBbH7wUWfv3gaJz9qyLyi8212uJlMSxPMe0aahpIuo1JQr90ttm45uCaA+FVNfPl/bZ
	JhISwA+mXQ4G7RYUKHOuTlOGrvu0yNCt+/b/vb5ZAD06kKYLTAoxOHdBzgv9LYFbOCwKXs5+h6+
	m05kfA1W+nDXtXCBPu3fGQ67LNVQcF0C5ioId/unwP/75Ntet3jPc0/tj2uco3RVQ8P9TmLKGsn
	UuwJ2i+oQ9hnqj6bFSqq2PJ4=
X-Received: by 2002:a05:620a:371c:b0:937:11c9:37f1 with SMTP id af79cd13be357-939ea0a4b10mr500795885a.16.1789126933725;
        Fri, 11 Sep 2026 04:42:13 -0700 (PDT)
X-Received: by 2002:a05:620a:371c:b0:937:11c9:37f1 with SMTP id af79cd13be357-939ea0a4b10mr500790985a.16.1789126933196;
        Fri, 11 Sep 2026 04:42:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35bd1esm5501948f8f.31.2026.09.11.04.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 04:42:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 13:42:05 +0200
Subject: [PATCH 2/2] dtc: dt-check-style: Handle multiple blank lines in
 continued properties
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-dts-style-checker-blank-lines-v1-2-85e779600d98@oss.qualcomm.com>
References: <20260911-dts-style-checker-blank-lines-v1-0-85e779600d98@oss.qualcomm.com>
In-Reply-To: <20260911-dts-style-checker-blank-lines-v1-0-85e779600d98@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5066;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=JtqoWAh0Zg9+ND0y7QMxPVQunmz6Fs5ddvkEb8RR51k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo+kORqeSnk/dBxdMu25kUs+Wk55ZhIaQXZh36
 sOnD9FvpRaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPpDgAKCRDBN2bmhouD
 11XuD/9E46OmGtUnAFKWRN3Fi7XHeN3UOxuVyt25pbnkltfXVdrqYoEGwwn1yvQpNStHYivAjED
 Rs6c++OxSRU6+kcbuOfS0xXF6sMUnrJDYszzmhqtEQ102D9UXVnjDS3W3SdGIbMazo9c6bB3C9u
 eYTgWSFgOZXroS6rlogrPYVM6oNkUsyqxzBu7EHH2T70HirxQWeIrYfkWZ1weSLhrCXksiReixC
 WRvcG7Fal6celPm+TwV2UMQdysSrvxnue+MZmgatY8bOXt7rQUaHDb0d0GAU2LkfTHJ0UBIFczn
 9lygomzg5xP+0COHJNYKECDJiIvxLXW9TSVHbaBLkNt29EVa4oZ09BAnoWb2EEGDFSg+zWdR4DW
 eahLjDayZEZPCDypOf0IctOYFRrI+3vypbdofZUA3oN5X25W9Vwnke4hU4r3UgA0Fdleat0Ekv0
 eiHQf7CjGLUxLT7BF4HGsQMMK1tCBc8bY8nc0sP2jJ2r9ImAKDwYOE66GBPt3Dd0KgNbJQtg7T2
 cEeATqPTe22qoULDuFrN3qrIQm1Rn0NgizPWGA8RfaU0yAxsrSFvCJHQzBLbJ4wqs22/oLXVqJ0
 5cNdYrPg3V4T6A6fLh1KrgeoCuBebMO03S0jUsqI4fqw79EG2kWGJ7FYbvJsCz6ts9g2oi2oiwa
 SKJlri62OONQeiw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE2NCBTYWx0ZWRfX6oHU8qLbjRHS
 35eUXgS/ijZNVFMygYCeDoNEaSTh3MjM/dEwV4tA5ewB/F/d+ynv8GAyKu69IU7sWlArDJ1/pCH
 2HlIVCTlkZCGIFZ9bmDYfFp+DCz9jFu3xXmdTAOCl2VujdyQN/DEvEn4qUpu09QLr0rHl62N6jR
 ezvJAiYEa7ioJP/YIxEILrh1+U+sxoapkbOVEGslzGrxUyYHI+IiBovKmVvBRhNNA4fdr5TypZV
 jPN7n61c7lCQytM/AgJGLKDuJTC3G4Bo01Kp+7uA9T7Ul6WoCJDXdn8jqzKzlZ/l+pFhTx8QiDj
 csdjGtRv8G3Tp/Evjzu6fD1bM8s080zwDfj4nFJEF/Emja4/S2EvMz1xzBA/fRvbja35b+qq32s
 WrvJVi+Ibj+qCa5vJnZBmR73nHVSswjXOO7PAWzjULvzNww2qmzPM6+Lq8I2T8NG4uTDfHu3Uqo
 HCaqP3Kem0vSIKThIZA==
X-Proofpoint-GUID: fzZmQYPtRv4e7L_8yjNKfgwztrUC-43S
X-Proofpoint-ORIG-GUID: fzZmQYPtRv4e7L_8yjNKfgwztrUC-43S
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE2NCBTYWx0ZWRfXwFukE7Gc6O2k
 prTnLXb3s6dfFKXcsfRjyjZjiemMTrqBQb6wS8FVHBukfMgf8bABVR3VTnQtLK9V/sWvwQzGO4E
 ebT6zBnCf4TBDk29q0OkOxnpXhAjWrQ=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3e916 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=Xe_wEYWaqU9zfd8rzdgA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110164

Properly ignore comments and report duplicated blank lines in multi-line
properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         |  6 +++
 .../dtc/dt-style-selftest/bad/dts-blank-lines.dts  | 37 +++++++++++++++
 .../dt-style-selftest/bad/yaml-blank-lines.yaml    | 54 ++++++++++++++++++++++
 .../expected/dts-blank-lines.dts.txt               |  6 +++
 .../expected/yaml-blank-lines.yaml.txt             |  6 +++
 5 files changed, 109 insertions(+)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 0dca31a0dddb..52597c266904 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -440,6 +440,12 @@ def check_blank_lines(ctx):
         if lines[i].linetype == LineType.BLANK and \
                 lines[i - 1].linetype == LineType.BLANK:
             yield (lines[i].lineno, 'consecutive blank lines')
+        prev_is_blank = lines[i].linetype == LineType.BLANK
+        for cont in lines[i].continuations:
+            if cont.linetype == LineType.BLANK and prev_is_blank:
+                yield (cont.lineno, 'consecutive blank lines')
+            prev_is_blank = cont.linetype == LineType.BLANK
+
     # Blank right after { or right before }
     for i, dl in enumerate(lines):
         if dl.linetype != LineType.BLANK:
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-blank-lines.dts b/scripts/dtc/dt-style-selftest/bad/dts-blank-lines.dts
new file mode 100644
index 000000000000..f2e99fb7bb29
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-blank-lines.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/dts-v1/;
+
+/ {
+	compatible = "example,test-board";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	interrupt-controller@10000 {
+		compatible = "example,intc";
+
+		reg = <0x10000 0x1000>;
+
+		clocks = <1 2 3>,
+
+
+			 /* Comment is not a blank line */
+			 <4 5 6>,
+
+			 /* Comment is not a blank line */
+			 <7 8 9>;
+
+
+		interrupts = <1>;
+
+		/* Comment is not a blank line */
+		qcom,calibration-variant = "foo";
+	};
+
+
+	interrupt-controller@20000 {
+
+		compatible = "example,intc";
+		reg = <0x20000 0x1000>;
+
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-blank-lines.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-blank-lines.yaml
new file mode 100644
index 000000000000..a58cd534a003
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-blank-lines.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-blank-lines.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with too many blank lines
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-blank-lines
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
+    foo@1000 {
+        compatible = "example,test-blank-lines";
+
+        reg = <0x1000 0x100>;
+
+        clocks = <1 2 3>,
+
+
+                 /* Comment is not a blank line */
+                 <4 5 6>,
+
+                 /* Comment is not a blank line */
+                 <7 8 9>;
+
+
+        interrupts = <1>;
+
+        /* Comment is not a blank line */
+        qcom,calibration-variant = "foo";
+    };
+
+
+    foo@2000 {
+
+        compatible = "example,test-blank-lines";
+
+        reg = <0x2000 0x100>;
+
+    };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-blank-lines.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-blank-lines.dts.txt
new file mode 100644
index 000000000000..97617bc42a17
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-blank-lines.dts.txt
@@ -0,0 +1,6 @@
+# mode=strict
+bad/dts-blank-lines.dts:16: [blank-lines] consecutive blank lines
+bad/dts-blank-lines.dts:23: [blank-lines] consecutive blank lines
+bad/dts-blank-lines.dts:30: [blank-lines] consecutive blank lines
+bad/dts-blank-lines.dts:32: [blank-lines] blank line at start of node body
+bad/dts-blank-lines.dts:35: [blank-lines] blank line at end of node body
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-blank-lines.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-blank-lines.yaml.txt
new file mode 100644
index 000000000000..8a8db8d35b1e
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-blank-lines.yaml.txt
@@ -0,0 +1,6 @@
+# mode=strict
+bad/yaml-blank-lines.yaml:33: example 0 [blank-lines] consecutive blank lines
+bad/yaml-blank-lines.yaml:40: example 0 [blank-lines] consecutive blank lines
+bad/yaml-blank-lines.yaml:47: example 0 [blank-lines] consecutive blank lines
+bad/yaml-blank-lines.yaml:49: example 0 [blank-lines] blank line at start of node body
+bad/yaml-blank-lines.yaml:53: example 0 [blank-lines] blank line at end of node body

-- 
2.53.0

