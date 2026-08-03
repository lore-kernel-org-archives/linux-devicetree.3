Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9E83A1D01
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747825; cv=none; b=s65JChX04/0cgdRvc0hvqRGteglSplaAaXucdOLJOYk3qeKVCtw7qYCOexChAaDD4zFs12V5ouPEsZN8zOwLcq1I932z0DXHbEbLOxdF8VykGdrJ7vKgOMJl6+eQG0kh6loOwyQLJmjIye+8pHk02nyzVPDjRjzPUeMEHEXzd3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747825; c=relaxed/simple;
	bh=bxJfZeWHN8d9xfT0Pz6+sjsZZT55J2s8dKumTqudY5k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rfBXfUbnXYELPAyi8GcuoBCbZihGNV/Zs+NYA5QZziq5v9yCmb+sopemuGRV3ldc/GMXlctUQtdVEZBWLXsP2tT7SxnjaAmtF5ktHgUzfKcdfDU3CQbyXwCRipxrozdzfwhmMNh8ozq+cljWHO7GYLGQ534KeAvywLzbkgrf+7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SEJoxLQs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJqPSLp0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SEJoxLQs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJqPSLp0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736bFVo3956941
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	re2yLNzdC2NiAT0YKDMOTDWap4+skaHoSOY7mUAbLN0=; b=SEJoxLQsXiESUNGl
	Fu56agj4rksp/e1HWHnMnYQLKWWkNHwRBpdG9l+A++GC6fFYLPPlHYIjxLHVjA3i
	6zQrWUOQw+b2dN6XOZOHht3OVSnU0GfnKKCPjrwBGtk7ggPsCPbjwGp9I2e73l0y
	7JXxchNMIXFWiK6fM0OSUsi/YnIn+D6wee6q9p+hSIVX5GkRnMRh3fwYGK3dSRyC
	HTpIe2tR/yxN3/8k+B98mBbyfydfBJi7JpmlzU8ITgEuZphGJbN0IPGZA1F4F2No
	kA3sAiDBWMZZvrC24bFYOzDPgJDc+huJwM33QhZ5tkXTYeNFw7YvtUE0sBerJBwE
	pCZgeA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvngnbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-520a00c7a03so58197031cf.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747818; x=1786352618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=re2yLNzdC2NiAT0YKDMOTDWap4+skaHoSOY7mUAbLN0=;
        b=LJqPSLp0XO+2zEJkIAh3a4iN+Mr6lNp7VhTnylhlIeWswHlxM6NHL2YPnykkP+CUHB
         kwhFXsA/sNyZQGKjXwED5COT4fF0fj8zV6zY+HQbpk+qgWN3INXhJUaQ94x5Hor3i8ey
         1ypbVEk03z2hjZBfjSfsiDuWUCPLlm0h6lycWOj2moEbG7QuVr7fprwO/f0fIDFZ4w2B
         Qd4kRHb/im+d54qxXGHJ10wp1I8yhsqGFstQ/heOnEVgEDS6BMN3jWjtxEXXzUSaEiFU
         uWon6raY3zz3mc79kRRyxxxI6HJeatR7WdD2vGx7f5S3zFJZcqllP4eYY180ixPt8Bm+
         MgPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747818; x=1786352618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=re2yLNzdC2NiAT0YKDMOTDWap4+skaHoSOY7mUAbLN0=;
        b=aUV5ySBFriYoWEC66/UvQTwl5dPanhI9kwnt8BHH3snrkhlrGc0WOQnfDtVdEAymsV
         IsD6qNuytfCoGaUjerFehz4JhkEIxvtVUHdsbQe6liAK/x6XJP3xKxTyEAO8FFsHGR20
         C9/txZT7PNw+xdNVoUgEHc0E0tWrticFFu1QvyqlV1xKvq9hTvJY7x+fae98yqfV8sxs
         raeLj88gC3vjC4Mv0aEOm7KOT6ZuYDdpFgg7AVAFVf0jGEv1fHSroHrWPnezDiAiTnAB
         MA00wUxeQdhteV3NnjN6EWNd6Kpzyl3EJUlm765oBtAwk8T/AQUUbMvQXYMs/llOEdeH
         nSDw==
X-Gm-Message-State: AOJu0YxTixsx2meBugVbtdadorjg8i4WKLVC2nXsldaICy70AyCO4ptw
	XkmYesdf9DyMc04jaWsCL5uvCYBHPpmbX0Laj867fftNJj1zkjV3LV/gvZCa6ZVTA5kH+IfuIiN
	MZNz3s894CIbad+BCYLJkB+WIj/V7tXK2beKSnlp6SyB9Vr+CMoy2fLKC/VJSRp8k
X-Gm-Gg: AR+sD122Z7J1dFm8ImXJ73bDOzhLjTmOvQHF3JIbRMZZ4ucLlM6MSAZAEZA+Gpjc2bF
	0L8pymmqgGUcR7eJfQTUSXXWO3Mg3t6HtVIS24Ns+oszHu7MJ6gxTvS7zq2kwq+MZ7HFyRhPB3d
	/LUQ95/3DkZjnZF7kLDGN1CE5In6T8i86JVROlrN9I87nsh9/lRKykYlcAFbQEh3nGXQD1lr9zi
	Ko3JYA9/Hvkooc10xeciQwwoBWHcNVMwSskA8fAcvx15Q8JlQdokJW975INdC5PiZx5+6U/oe2P
	pf+QXPGqK4sC3PE22FHpqpdCNTALDFHOagrf2Mz+mdv4d1ZM16C539MD+2aHSwYx/P1B5uE70mM
	Xv5tU2Sl4dIsqk9a/mCS5iZlY
X-Received: by 2002:a05:622a:c07:b0:51c:1132:c7f7 with SMTP id d75a77b69052e-52b56770802mr198512091cf.29.1785747818327;
        Mon, 03 Aug 2026 02:03:38 -0700 (PDT)
X-Received: by 2002:a05:622a:c07:b0:51c:1132:c7f7 with SMTP id d75a77b69052e-52b56770802mr198511391cf.29.1785747817760;
        Mon, 03 Aug 2026 02:03:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 11:03:06 +0200
Subject: [PATCH v3 03/11] dtc: dt-check-style: Handle root node in overlays
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-n-dts-style-checker-continued-v3-3-6c9776928cea@oss.qualcomm.com>
References: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
In-Reply-To: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5489;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=bxJfZeWHN8d9xfT0Pz6+sjsZZT55J2s8dKumTqudY5k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFlY0b76TIfd78UN23Icd/FRa9UNqorxI87uS
 TTdNKyI14CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZWAAKCRDBN2bmhouD
 1448D/49DfH0G0G/HbH1eiOJwDNcMzIlZiPPy8tEqt9C2xMe1WC4JPDuEKnz4t+qitCDUDuCi3U
 K0p03VjHrsSAvd/4cmYqe9oRmnyZWD4eq1gNAQfrPDoVbu6q5cwjbxn92xyuSDjhxglgcpkPSDH
 smtmaesKPzdtDRkI6YNTPB7n0pG+JEc34iKiaiiqzx4BafKeNxlkfoGxl7ivp5OwfeJskZUnDoU
 h4ROAajKk+2MP1JeclWtf+00sOzr5UZB205yzqm2qmoJtdWsrVSev9X3rqbETXDdBSfrowiAwG+
 IdZr72bzVgmJCYnY2vNxYY7cngIUAtZXf8NyFPOSj2WXM8XEi511B7rYBphhZbdJCgb5LnLIjln
 JRtaT6Zfj7rTUffbNclqTCtptDEDc+ZCWi4T9TOVzAfUldBv2+N42VD++wNxiNANu3wb7Juk8mh
 eoXx60yTkkcsn0LLOxSecqqja4DjdeY7YMuHth0CW0YIUXWxsMbIlkygxfTsNe2CF88uEbr5SHt
 5nCENBDF9K4bhqjaCv7BSspTyErJTVKKrxXkhjMaHQNTF7uPdDB4QINzyAQIwDGgyNubGjoE/Kd
 h3KEe6NHMeVdvd8i3XGnFbuxT6OzfPQbUigTrKPOmngLklezicK8XI3qerQCGDq2mMQqmtgLsiz
 zDzUJsNN5x+N1dw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a70596b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=TW557SpARfm4JLRhbCUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: Mcqp1dhJ5Q65eMMev1vk7Bh58wqbeOLB
X-Proofpoint-ORIG-GUID: Mcqp1dhJ5Q65eMMev1vk7Bh58wqbeOLB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfXxGoIqo1sLotK
 8lpbYGZOelZDqMQqcYQEzmh1384iY93LBCPYFYOjqizCqEpPm/eptokC6G4XLRTizqWTBrzJftT
 iaMEHU4YpOfBJevdsey+zBiTUskwCzY/iL6vER9LCIbuUNkYY75U4mWU5/8n7MqYROfsGFPqX2R
 HRvEnKko5dLViX3Mk5eIvjrS1wDm1o2iRM43AMvRe/Eb+zNfk+xxra03fImFE6HNfnHinAKihge
 zxedlZokvOyZ8MMkZuTod5XG5P55wS9gHCxKxsIdoR7t4GoG99jESjqddUF4OFTLrWy9AUvMI1E
 lnmB9FDLWsHAxaWqRRPVGfWvxCObFfQauGN8nnIrVWXRl+efuZvCmlY2Vfp27HCGGxcHUCDedTl
 MIZVdT4yzXp9COfjPbsXsIV0z6TQD8xEWzHwZkNXAJ95es4Uh84ANnCGdvnFzEYNV5kRG+t4f9P
 4uXZxRANTaCoyrzMlJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfXzbAwOqBCC7YX
 J33/c1lKeagrMfuh28wtQKpGsgjuX8+KJuJdrLLfAuiukpwtkVoeNQiRLU2T6Va57IKRJe6ZpLZ
 uCYDF20AOLeGCID2NZSCkxjg1O+rz1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030080

Detection of overriding/extending a root node should be a bit more
complex than comparing node name from regex, because overlays use often
'&{/} {' notation.  Check for expected syntax before creating DtsLine
and store it as 'is_root' attribute for further logic.

This fixes false positives for property order for root nodes in overlays.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 14 +++++--
 .../dt-style-selftest/bad/dts-property-order.dts   |  2 +-
 .../dt-style-selftest/bad/dts-property-order.dtso  | 49 ++++++++++++++++++++++
 .../expected/dts-property-order.dtso.txt           |  7 ++++
 4 files changed, 67 insertions(+), 5 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 96deffc0d8a7..d9f76d6d9179 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -77,18 +77,19 @@ def is_preprocessor(stripped):
 
 
 class DtsLine:
-    __slots__ = ('lineno', 'raw', 'linetype', 'indent_str', 'stripped',
+    __slots__ = ('lineno', 'raw', 'linetype', 'indent_str', 'stripped', 'is_root',
                  'prop_name', 'continuations',
                  'node_name', 'node_addr', 'label', 'ref_name', 'depth',
                  'closures')
 
-    def __init__(self, lineno, raw, linetype, depth, indent_str, stripped):
+    def __init__(self, lineno, raw, linetype, depth, indent_str, stripped, is_root = False):
         self.lineno = lineno      # 1-based within the block
         self.raw = raw
         self.linetype = linetype
         self.indent_str = indent_str  # leading whitespace as-is
         self.depth = depth
         self.stripped = stripped
+        self.is_root = is_root
         self.prop_name = None
         self.continuations = []
         self.node_name = None
@@ -228,7 +229,10 @@ def classify_lines(text):
             continue
 
         if code.endswith('{'):
-            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code)
+            is_root = False
+            if code == '&{/} {' or re.search(r'^/\s+\{$', code):
+                is_root = True
+            dl = DtsLine(i, raw, LineType.NODE_OPEN, depth, indent_str, code, is_root=is_root)
             parse_node_header(dl)
             out.append(dl)
             depth += 1
@@ -550,7 +554,9 @@ def check_child_name_order(ctx):
         for c in children:
             if c.node_addr is not None:
                 continue
-            if c.node_name in (None, '/'):
+            if c.node_name is None:
+                continue
+            if c.is_root:
                 continue
             if c.ref_name is not None:
                 continue
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
index f31abb6ceae4..782cd55ec283 100644
--- a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
@@ -5,7 +5,7 @@
 
 /dts-v1/;
 
-/ {
+/  {
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
new file mode 100644
index 000000000000..81ac2b092b96
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dtso
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: Incorrect property order
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	compatible = "example,test-board", "example,test-soc";
+	model = "DT style selftest";
+	qcom,board-id = <8 0>;
+	chassis-type = "handset";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			reg = <0x0 0x0>;
+			compatible = "arm,cortex-a57";
+			device_type = "cpu";
+			enable-method = "psci";
+		};
+	};
+
+	pmu {
+		compatible = "example,pmu";
+
+		status = "disabled";
+		dma-coherent;
+	};
+
+	soc@0 {
+		ranges = <0 0 0 0xc0000000>;
+		compatible = "simple-bus";
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>,
+				     <4 5 6>,
+				     <7 8 9>;
+			compatible = "example,intc";
+		};
+	};
+};
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
new file mode 100644
index 000000000000..a78b8c042aa5
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dtso.txt
@@ -0,0 +1,7 @@
+# mode=strict
+bad/dts-property-order.dtso:13: [property-order] property 'chassis-type' out of canonical order (should sort before 'qcom,board-id')
+bad/dts-property-order.dtso:21: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
+bad/dts-property-order.dtso:22: [property-order] property 'device_type' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dtso:31: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
+bad/dts-property-order.dtso:36: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
+bad/dts-property-order.dtso:46: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')

-- 
2.53.0

