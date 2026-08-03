Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D2B3B8BA1
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747829; cv=none; b=YWbd5MEQUx8mdcyV0V79VJaD15FGgK1V+zwKvQKtDXtkQizgOLb25yTWJoLRDNtYi8EDyrwH3gW5UmkPwGJksrHGwmWAk5b4GVl9TEj/sqS3J4V+NJ7QOAdZegVgl4a8T9QSiySckdT2lbr/BfnGR+1q/NJcdsqfY/0DLhyNWAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747829; c=relaxed/simple;
	bh=Av2HS7fUExlNg+81qDfD4hRHsNSti9gi7XlyddTlo28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELHfguq+U0o6F45pSPkAehovE/kSShUjsKkYx8RwmEpcBWxKdJ0K0rY+U71fPc6dHLPSqKr1d0OMU1JbVNji2rOUyHu+9DsHFbNHQazIKCbL16j71aG7uDwGRwvp+UIj0mC4cwo+tNr5nc65OeHpy+voMBVQjo7xhAQ3dUyR2b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmyV86ei; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jB8Odrc6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmyV86ei";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jB8Odrc6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6737Dutk4041882
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NPks+x60BCYOO8XRSEJcDRXMlkEPWzK7NZ574fiVVUk=; b=jmyV86eiwh/zujTK
	E/6s63FsAw76KAW56f0Qlk+TN/CC/L2Z1lICEcnVzxjgTokr8bdNAyTaM/vfMSlP
	8DDQ7uXvnxFq304+nPYWa5ECQXj0Q/XIaGnYk6E9phGdffQDPsRcJguiGHXK9Bl4
	7N/i7+LGkj0q4Br14hE6lD0+JS7s54DabIwh0Yu28D77mBagnkXswYiq+jAmYvXs
	5frjF7ZtVvSSrCx7Lbe8ZGIVF6rXty7BRezRTEMi4Iu/yuGSdIRmjPg9PNFzLLtQ
	x/0TT3QdiP3GF2ooELD9OAoCa5nHQZLq89gZCOF475cWAX6izrTsRNcAdT/2+IRc
	KHcKdQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvngnc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51ebdfceddcso34630171cf.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747825; x=1786352625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPks+x60BCYOO8XRSEJcDRXMlkEPWzK7NZ574fiVVUk=;
        b=jB8Odrc6g+TU2eJtQPDGwuhbScx2R7L6/Ti4/yGOf9PThxfGGpyS8FPZBPqQfNRHDW
         AiP9w0Zf+C9MJbfYUmTntvbAnU4wQNxsGJ/JU8wdHqeVxUTg/0DbCHzfRbxEiPqubjia
         jwY8TKTod9dXkqanN42XX2n+flS4jQ62mz6GMWqJuyDg1eRPTMCmp9stqkXynmUfTrTJ
         x0/xQAvJiRTYOyXnLE4f+FPUH12l+zPp5lU7S1FRp+d8ujdYJmPgozmiC7k7H+Xi20Dh
         VfG5bCciQBQNaj0CgewHuFeASv9Vc0QA+/Q/JY8Ij2rb74PEahU5rLfg7Deggl2Skykw
         DA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747825; x=1786352625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NPks+x60BCYOO8XRSEJcDRXMlkEPWzK7NZ574fiVVUk=;
        b=SCdxwQQiGxFrjfgTgARYdr1aF7WPFsVW3hH17KcvfSzHVi9mWlDzXCYHr8V5gWvIzh
         53VDFYWtVmTd8g+WlI5/I1UXo9wLdJ7Ckzfz1/0zj6QrSXaHP0E7JDpJFsKmweYUrbDR
         7SFA/oCxiIBh9uNmqEPabaWPQXdhIsSbPuq6xDk6ecOICcYWCMzJVRhlJM5xGZT1MsjC
         DLptFJRjXh7dTqWIysSWiMCo2q7ktNwVenwB2fPNaQ8Q6yvuWphncw04e4MT+NgEVnjj
         is4huWC2L4KxlsInEI5VuGkhN7GqTOT5Ri7dwfLUnsbgoU/CDGyXcIP6rLxNRzi8GLg6
         u1lA==
X-Gm-Message-State: AOJu0YzLXFaATKPpSi5Lc2onATu7A/zEtNuwbytvM4h0djsIwVsgR6mH
	2Kxnkm6FdVTLCkg1sPl2Mio8L+OjqqPHvIFbNtqf7KNhH4MPVU5uIFCWNq+xt7znn0rACqWzzJx
	ceaXmqtgvW/1L8ci2D+nSEIkxmzqfLM6nGYNgfLr6wJ7q+l/yZmz/xDKsH/z0g1F1
X-Gm-Gg: AR+sD10M1gZ1rRFGmigB+cKfv5QKdXCbkYb4nrmb/P01vaLAvvgfsKJZpsWiuwfhIJU
	+3cDh8LOrFIs0jBdInbHjCoFyRMGB2XbuJrSDhp36pLrVB8TZTGocs2s/SK8zV0lYIRntk2ZSL3
	WmAHdAGUxZirHkCVqfoppvMOX3vtkALzWBr9nbG5zVyyriN9fR9lUcyqKCtxWMp+8/tAF+iiRXX
	9V6+yrMypJEuXGWoVXmrrNXGLxKcYn+5XTv6/peYCa3FOxlaXiw93fd8l5w8IItp6oAmXPIZNH/
	4vNmpYlBy5CIh1QTwTBqoRyKKIzId8WKCRFmahh8m5IlFIxYdbm9xhhhB/DmqNROjfqW+3VyMK1
	+famzlIeq37o9gF8uFp7ryj0J
X-Received: by 2002:a05:622a:1aa5:b0:51c:a8:51cd with SMTP id d75a77b69052e-52b5669ddc1mr165929681cf.1.1785747824465;
        Mon, 03 Aug 2026 02:03:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa5:b0:51c:a8:51cd with SMTP id d75a77b69052e-52b5669ddc1mr165929121cf.1.1785747823851;
        Mon, 03 Aug 2026 02:03:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 11:03:09 +0200
Subject: [PATCH v3 06/11] dtc: dt-check-style: Fix alignment of values in
 continued property lines
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-n-dts-style-checker-continued-v3-6-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8500;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Av2HS7fUExlNg+81qDfD4hRHsNSti9gi7XlyddTlo28=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFlabo1mGLd1kMsbMy7hsvPDJ+y0EDPxuDvA7
 qk5d840DvWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZWgAKCRDBN2bmhouD
 12fOD/wPklfAeaGs8rQgVKCU3DVZZAWG2K4v2B5mWP/M/vkeA1cz2mseX8+bzv+bKtQcm10GH0J
 NkSO/NZ7pVH6BTqL4/X9p2WdiR3+S08+4NSVIMN2oc0il8jrPObV9lCPEsX5ZLFzB0zDvP+nCvy
 E8Mnxlr1uxknccv/3lVSdQl70jdJGGpT71lkaLB6NFVmpbkpYGRfKy/wUsXWJVXAvlZaM8bhjLN
 ulDiWO63/FUsbZkb2ba8pshj4M+zjKfLXl7qa2M7cJNlWW4K/mkS0kBdiV3UNlTlcHNZb5bYWRe
 QM31jlXZJqas855set4b7BvMEJxllUvHXqVJ3ZcL7MbGRGK2fBhDtlNBsvtyPxYEZ+vc8IU4Q7T
 kEQIOQM4lK+zrL31KihK3mnSyDCQVsHbF1uM7Nnbj+5xkhAeHVZT/2sN93feW0XXQxEIqMnl4g0
 BBDHHmqpbMU9jJL5BwVV/r+VYtrd8XNX5y1iNTTz0U5DxMQUgDYFaZHLnGJ6bIpo5MUdm9emm4n
 fo8StmG8rtgaJa4eA2LN6nnN0Ux88BM6m/TM14qe1e1hICNd4hWuYHDB5rpFOE1DDYMguArGH1p
 NldkK+KmOaEg+4nq80AKTEqcs+FiGxpKZagHru7ifOizKUmCnDoFiRU4DAZsTb0JzBzWqvl9Rbf
 zExG06jLXs8veqQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a705971 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=JHzK3u4RkIQMqoYOWxQA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 8L1mjRmsCwTYW8E66NTtrimrQoOE-gTd
X-Proofpoint-ORIG-GUID: 8L1mjRmsCwTYW8E66NTtrimrQoOE-gTd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX8pHmcjFlOehX
 EMKR0ffqe6uLYE7rD3iTC5Z8VTX5yV6Xk156913bUNqp83VX9Jnl5FtxJOlAXmin8aqtgjTaWDf
 WLahfEVh3zODjOsNZCG9sO3KrMLOI0CZ909timw8MVDvjFf74uyLsCC+cYgwuuMfFsp89EL1kHQ
 s/6q3rMdfj98RzMC1KuCFSwj6WQpOLr40QZ+pn54Lbob4RBohghJodoo4vB0llYXPfqWHVMRdj4
 l2vCGno6wQ4NIVtaPxv6vpfQ5QgYz/dbfeMSwTYShnUG4PCUtUnMS8P0WylagLNw91xlX5/uPbS
 PmXJB3E2qmiIp4qRk475C5s52aNjW703Mr8AMmZjj7Qn85N1eyAzFpSh4gYPcRcnmDPu/2MO6t+
 +8Vd+U2eKsidNBqak+tZuGqjaOklIx1sA75EUqsKlZqBpaijn8NcU/RMGj6xYuJgVv1gVCygorr
 KUPiprUC2pi2FF+hdNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX/AdxxwFPYNXk
 a0IQannKLQZ2J5j3+AO4eOfWKohCfptYKIhug3xsVDTgZVPnGF7s52l+9a1fkPQtHNkSBuiENB7
 lD7Z+KY+hulduVQTLS7sFdyHJ4yc7kU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030080

Continued lines in property assignments should be indented to opening
'<' or '"' if they also start with that character, e.g.:

  reg = <0x1000 0x100>,
        <0x2000 0x100>;

If the continued line is part of previous phandle, then alignment should
be to inner values to make it more readable, e.g.:

  reg = <0x1000 0x100
         0x2000 0x100>;

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 22 +++++++++------
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   | 23 ++++++++++++++++
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |  4 ++-
 .../expected/dts-cont-align.dts.txt                |  8 ++++++
 .../expected/yaml-cont-align.yaml.txt              |  3 +-
 .../expected/yaml-value-ws-multiline.yaml.txt      |  1 +
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  | 11 +++++---
 .../dt-style-selftest/good/yaml-cont-align.yaml    | 32 ++++++++++++++++++++++
 8 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index bdf36ba9e274..1c67348fb526 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -928,10 +928,11 @@ def check_line_length(ctx):
 
 def check_continuation_alignment(ctx):
     """A multi-line property's continuation lines must align their
-    first non-whitespace character to the display column of the first
-    '<' or '"' after the '=' in the leading line. Display columns are
-    used so tab-indented .dts files (where a continuation aligns with
-    tabs plus spaces) are compared correctly."""
+    first non-whitespace character to the display column of:
+    1. the first '<' or '"' after the '=' in the leading line, if continuation is with '<' or '"'
+    2. the first value, if the continuation is still the same phandle.
+    Display columns are used so tab-indented .dts files (where a continuation
+    aligns with tabs plus spaces) are compared correctly."""
     for dl in ctx.lines:
         if dl.linetype != LineType.PROPERTY:
             continue
@@ -942,15 +943,20 @@ def check_continuation_alignment(ctx):
             continue
         # First '<' or '"' after '='
         rest = dl.raw[eq + 1:]
-        m = re.search(r'[<"]', rest)
+        m = re.search(r'\s*([<"])', rest)
         if not m:
             continue
-        target_col = _display_col(dl.raw[:eq + 1 + m.start()])
+        target_col = _display_col(dl.raw[:eq + 1 + m.start(1)])
         for cont in dl.continuations:
-            if _display_col(cont.indent_str) != target_col:
+            target_offset = 0
+            err_msg_explanation = 'to < or "'
+            if not re.match(r'[<"]', cont.stripped):
+                target_offset = 1
+                err_msg_explanation = 'to the value under <'
+            if _display_col(cont.indent_str) != target_col + target_offset:
                 yield (cont.lineno,
                        'continuation should align to column %d '
-                       '(under < or ")' % (target_col + 1))
+                       '(%s)' % (target_col + target_offset + 1, err_msg_explanation))
 
 
 def check_unclosed_block_comment(ctx):
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
new file mode 100644
index 000000000000..2087dac23d96
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-cont-align.dts
@@ -0,0 +1,23 @@
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
+		reg = <0x10000 0x1000>;
+		interrupts = <1 2 3>,
+				<4 5 6>,
+				<7 8 9>;
+		pinmux = <0x01
+			 0x02>,
+			<0x03
+			 0x04>;
+		power-domain-names = "foo",
+				"bar",
+					"baz";
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
index 92778540b056..d4662acc7b8f 100644
--- a/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-cont-align.yaml
@@ -26,5 +26,7 @@ examples:
     foo@1000 {
         compatible = "example,test-cont-align";
         reg = <0x1000 0x100>,
-            <0x2000 0x100>;
+            <0x2000 0x100>,
+              <0x3000
+              0x100>;
     };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
new file mode 100644
index 000000000000..a4672206859c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-cont-align.dts.txt
@@ -0,0 +1,8 @@
+# mode=strict
+bad/dts-cont-align.dts:13: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:14: [continuation-alignment] continuation should align to column 30 (to < or ")
+bad/dts-cont-align.dts:16: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:17: [continuation-alignment] continuation should align to column 26 (to < or ")
+bad/dts-cont-align.dts:18: [continuation-alignment] continuation should align to column 27 (to the value under <)
+bad/dts-cont-align.dts:20: [continuation-alignment] continuation should align to column 38 (to < or ")
+bad/dts-cont-align.dts:21: [continuation-alignment] continuation should align to column 38 (to < or ")
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
index c0801c56d5db..eb9a84d5c222 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-cont-align.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
-bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (under < or ")
+bad/yaml-cont-align.yaml:29: example 0 [continuation-alignment] continuation should align to column 11 (to < or ")
+bad/yaml-cont-align.yaml:31: example 0 [continuation-alignment] continuation should align to column 12 (to the value under <)
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
index 3df55b1762d0..d25b5b425e3f 100644
--- a/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-value-ws-multiline.yaml.txt
@@ -1,2 +1,3 @@
 # mode=strict
 bad/yaml-value-ws-multiline.yaml:25: example 0 [value-whitespace] extra whitespace inside <...>
+bad/yaml-value-ws-multiline.yaml:26: example 0 [continuation-alignment] continuation should align to column 12 (to the value under <)
diff --git a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
index 36fb4eefcd83..1a1c07c09a41 100644
--- a/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
+++ b/scripts/dtc/dt-style-selftest/good/dts-cont-align.dts
@@ -18,9 +18,12 @@ interrupt-controller@10000 {
 		interrupts = <1 2 3>,
 			     <4 5 6>,
 			     <7 8 9>;
-		pinmux = <
-			 0x01
-			 0x02
-			 >;
+		pinmux = <0x01
+			  0x02>,
+			 <0x03
+			  0x04>;
+		power-domain-names = "foo",
+				     "bar",
+				     "baz";
 	};
 };
diff --git a/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
new file mode 100644
index 000000000000..2e7b8582bb7c
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/yaml-cont-align.yaml
@@ -0,0 +1,32 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-good-cont-align.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with aligned multi-line property
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-cont-align
+  reg:
+    maxItems: 2
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
+        compatible = "example,test-cont-align";
+        reg = <0x1000 0x100>,
+              <0x2000 0x100>,
+              <0x3000
+               0x100>;
+    };

-- 
2.53.0

