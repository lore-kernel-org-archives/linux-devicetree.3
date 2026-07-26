Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD103C7E18
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785080866; cv=none; b=BlrOr5zCGN0T/3HOvfTvkVi0qZywr3KR9hcNgr0ofaliDBU3ounTitms58cC6DDmE2X7oEplz8xr2NXy6PULygufkfBQ4Joa/PcJ2LpiWtozx7yNs1WN324WVm7kbu3R0lfnO2MYi6OIphGsA1qfzQ//cIL7MnAM9ZmHUvPgliI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785080866; c=relaxed/simple;
	bh=am9YiYspNqv8Or5TpjO2ccdLeK8bXVI9s3r+4hapet4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aHlzPJ3drIPT/qYSm5TOxDVCBmHzGh0Rkv2oowykKNpf8luWisDO3OE6mYpyluD+kdxxnsgS9f+XO8wux+3uW3+vrchf9lKdxIWnQPh95RMXD5KRnk63kKZzKKCG03BOxOV3vT9b+C/WLCvLF34MSz638Q4DdecB/qMLeMXZFkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B+jv53c4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LOlEj7A1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B+jv53c4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LOlEj7A1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QE35R4993508
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPuIPjhJGmX4YB/fmDXBUae4004dgC4qm+Vs9UKqOBg=; b=B+jv53c4UcuraVLT
	TjvHxWGTtiWBhQ4m300SGt1C4zH7KKDzALrxYSlMrjk85HJcknOHLV87iCG/vgIJ
	lM81jtJ9t/i3STWs08ShZRKD28nrg0rSDZ5qU34Mfuo7m9rdMwOrllBybm/cqjck
	zUo3NXD1CnlG1qSmLroM3TCriJC4aw08dpgZkz2p/YA66mvr0d28uStpurncZnk2
	ew33VW8HWGYFao8DpdbQe2UKI/aQs7sdCVwVRP+N1h2ntdFY4M9GPG2fGJAGlNLR
	irxghcXT58ItmT55MVY3D0bw7Yrum1JDNlEP7s6iUo7hKNZsLx2Yc/7xdvGrvBiC
	V4Bq0w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fngysrewf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 15:47:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-529ae8e96e8so9559601cf.3
        for <devicetree@vger.kernel.org>; Sun, 26 Jul 2026 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785080863; x=1785685663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPuIPjhJGmX4YB/fmDXBUae4004dgC4qm+Vs9UKqOBg=;
        b=LOlEj7A1GMpKTbA/xrfSyfy7DAiUy0wfXwMksZ4+x3qymaUr18Qd6UQMC+lgaHwxWX
         YYAiXwzWaIaFxPTafhbPrlcNm8oI1+9ixu1bZMmj0sUnLJs4iZWT2SEpkl3q/xvp3fUF
         xyaKDX0TtQbJ4fj2RrT4Ac8pGktNhVhdg6ovy8R+Y4kPnWzoxfkPCDQkrq0MENBziMOM
         AAY0WVuIP+e6wps6LSy04As6tFP+rAbbSgR4q+/vEzC8QjE0Lbzb31bd4E5Zkp4lt+GX
         VDwOeWgmtymXH3fcAK37/3hynFgjkZa0ALzAWbnwglT9p6pOVf+fuf3ixKeVU0i7ghYi
         /juw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785080863; x=1785685663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPuIPjhJGmX4YB/fmDXBUae4004dgC4qm+Vs9UKqOBg=;
        b=ck/LZF6V9jnUlwTa6zCrVj/DmWBQYyRAjtfLs/t3drN6xvBwyHLIG52AYVSsCzkizs
         hvYunK/154xVPGB2r44c/qKWPIpaCv5hMncZ5FcxCQwUeyKMzpCYE4pkOJriB2NEJAMl
         QC5ILV8iiRvxcDHgnjR03ZVxCCaGXg8cYU6NZi8eHfhW5LAi2aMAuAauJHwXgj/4R6gC
         BSDninERX+PWR/vdFx22hUEvHZHsvCbqRBQZZuij/Wgr3yatYTo/+Urv1Yh5oMkrbEj4
         RxU3iTdVoEBUUEvXcimTsZ5Abqapvop8j9HC16iJeUfioFkHcgMeON649JKlf24Uqu5y
         M7IA==
X-Gm-Message-State: AOJu0YxzkF/98Z1/Ncf2RSjkrpU7jBzw56ubAxF3/uYbeVLEgiAXeLIS
	oe084kjiV0m/45mIK8/sTp3js+4TkYZf+iPauqiyWe0TgcXfT2uiHiXNvNkuYZniS1oa9Gzra4A
	ro7qOKEYlKY1vUs+E4G94IqQBBhtzJlHjpa0AYVG0/vrBzGPGfQqeBBrPc2z4nCHN
X-Gm-Gg: AR+sD10Shi/BuWzS60Husk16ZMYMC5R9pZohFD4kFk1iX7Unzq4ZASe0yKYsBx38SOI
	960SVkF8UjSEFY9aySK6hja0shWisK64McMkNw5snYCQ2jlEMDIf/U9iaIyypISDL0GezxRnQAH
	xJqwERrtcZfg7JXMkl4XADsrZftzxi5vUc+5PySVjZLkwAYprCMpi2EKpfAGn3MnEeiBcGCkmwl
	vTem8XTKEdQhHkbh6kWp1pi4YpVYivndMniZjw+rRnj1P8yYw0Wvb+IEuiUmfzznRtYIgBRP+Qd
	94B9vhAmpHPF4Ihil+PCW0YMRxamJrCl+SESiJKGJBknIBK/ooRpoJJ0hLgWvGyrZ704mPhnzvV
	2ipyqZRQ5nQQYu4Y5UN3OFWVe
X-Received: by 2002:a05:622a:28c:b0:51c:7b11:41b1 with SMTP id d75a77b69052e-529a8874526mr56444531cf.77.1785080863480;
        Sun, 26 Jul 2026 08:47:43 -0700 (PDT)
X-Received: by 2002:a05:622a:28c:b0:51c:7b11:41b1 with SMTP id d75a77b69052e-529a8874526mr56444281cf.77.1785080862972;
        Sun, 26 Jul 2026 08:47:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957f9ae5c3sm236848035e9.3.2026.07.26.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 08:47:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 17:47:22 +0200
Subject: [PATCH 3/9] dtc: dt-check-style: Handle root node in overlays
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-n-dts-style-checker-continued-v1-3-b05b8f897670@oss.qualcomm.com>
References: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
In-Reply-To: <20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5007;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=am9YiYspNqv8Or5TpjO2ccdLeK8bXVI9s3r+4hapet4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqZiwRRJ579QA3mnRMGek84DlU6Dq3Q6XR9t6Bw
 T9s9fg+RSiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCamYsEQAKCRDBN2bmhouD
 14u9D/4pq7Ebvy+c/iHYu79WHugUW4/axevmh0XusQPNDQE4UBkI58JzYUsV0WcnFAyLeF8YhJy
 op0CBe+0wAFOZe/cFPDuQKM8OqYdIbo0NVf9GTY7t5+ePaeKPhdNHba/HtI9/BnIYGY5tDoOrkj
 9Kw3HMsVpiAfA+4df3Ay/980W3p6dt3u9M5X9vSJIhVu40N+mLm3oUOlkHA7+iw0d1Od063uO9G
 lAS9l8LVF9i3glIuUgk0ALqG2Gl+NP4RSxXh3STuCU00h31kv3nBcX2wz3sUOBsOM4X7YukZ4iM
 WCudb/Ox4XLe4CJIUBds2RRfsrzmKjHNTVOzPLOS/eZTsJjR636srEjVxCVqCeDwaoLRPZz3XZu
 xxaMyLhJKXtIIOfovyqpUsqz/akcgSRJMnzzLUF+IC0/Yfo1431BivPorUpqjFelZrbC5/DNT8E
 hmVtU6KwKDkjZ1T8yYCD72iqPylMYOHe2PGFcBi2ZcfmJ7hfpLdYAvxPdD7dLyHpf6PWUl3cPpO
 cmlTT+UwacWsw4wKME+tYqeo+4D7N9msvnSMtgv1SujswOwM+yqSRyywPPt+6ndSGg0gpxRqCwp
 IvpNYj8J8jG0jHJHRw67G6Y44i27pikp+ZJBEBJzbuwQrqeB6l0SlIUNbTHeSvW8lIblnhybr0t
 2+DLanlOL6ftEng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX1ZBLZ75Mrume
 /VHaNBSKWPk+sFEMzLywRRbENrlgQyZEmQlStrVpyCS/Ju5a8GWs01oCSsUn7Oj9Ylsb8UYOOnn
 igRIk6OGKQEeWeRJL4PDRkoG7fi4OFATd1cvGL0mv+pbRM3/5fPpcsezPzpyG+1kCbESPRNOy7x
 SeQ0QWRF3iIqPKQPIB1tcBwQvsBAOWvgqMBpA21C5xrQFvBwe27zW4UX6C4g0VeJD90q+oKQTjg
 GnWubysMMXtpC08rJwsbywPhHLGUb5HQf3KlmhCJamQUz7qYPoulqauAGQXKfUvg0UgL1jeXWze
 POB4G8lDs9C/P4kU7JZz5q82cnm+kxO94NpEA341s1gUp91Fa+RXQ3sUqkD4fbEkarg20Y/iQ9h
 W7cKNm6zaPbsrO28JfRQY27D3Q+D0NdKjUHaC6B+tS0FNq7550CUM9cpwZmd4ZL2s6+Yb0hGG3F
 2iQpBWBiZFK/492MT4Q==
X-Proofpoint-GUID: HeWqHQ9HgMUdPQIHluyO_v2QfbetmzEt
X-Authority-Analysis: v=2.4 cv=DNG/JSNb c=1 sm=1 tr=0 ts=6a662c20 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OYAFLQbGvi7cyiZzXxkA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDE2MCBTYWx0ZWRfX+os2hKXRfjJ0
 unKLNR9LeNYf1re/kyh6U/3Tw4BbeI7pGXsdTGk14tvxZvucCMopavevJ0bwoVVxXOTCSrq6e2e
 /Z948XhzpYiQRO4c5ciTqQg+4WDdnWM=
X-Proofpoint-ORIG-GUID: HeWqHQ9HgMUdPQIHluyO_v2QfbetmzEt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260160

Detection of overriding/extending a root node should be a bit more
complex than comparing node name from regex, because overlays use often
'&{/} {' notation.  Check for expected syntax before creating DtsLine
and store it as 'is_root' attribute for further logic.

This fixes false positives for property order for root nodes in overlays.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 scripts/dtc/dt-check-style                         | 14 +++++--
 .../dt-style-selftest/bad/dts-property-order.dtso  | 49 ++++++++++++++++++++++
 .../expected/dts-property-order.dtso.txt           |  7 ++++
 3 files changed, 66 insertions(+), 4 deletions(-)

diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index 96deffc0d8a7..1937c6feb57e 100755
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
+            if code == '&{/} {' or code == '/ {':
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

