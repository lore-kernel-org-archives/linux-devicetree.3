Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA5D2F25F3
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785660353; cv=none; b=UYmIsCPDxIZhtXCvSxJHiRxVlwB5MLQ/Rk1tHCYRoNbRSyTTkrgZIJZCKLoWPpJgl3zrRyNhOkcIKS5kTJ9SDnTUBAnSyiXevSczzkW4i7tWxzmS/3SSWzsI6IXra2eHZuxBRvHQv0UXHnXrBV9JJ7/AZoAZh6Gn+pPrhXVeIEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785660353; c=relaxed/simple;
	bh=am9YiYspNqv8Or5TpjO2ccdLeK8bXVI9s3r+4hapet4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LjGSEDxgpcQzc8y1lzJ8FPZgCQlZkOx/xmQqyTxUKGy+ofQTE8afuxU4ztg9RZn4j2xcxKJfJj9IQrpnJ3MsO+EgNDfmKPrfZp3Bzz5yHPv9MG/G246qTy9HFTR7GOT2P9ymmXMs22VEI3i4XlufmOMRir3OmJZP1bL73WOmLx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rm41CPO7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8JzHGxQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rm41CPO7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8JzHGxQ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6727ldZ51402484
	for <devicetree@vger.kernel.org>; Sun, 2 Aug 2026 08:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oPuIPjhJGmX4YB/fmDXBUae4004dgC4qm+Vs9UKqOBg=; b=Rm41CPO7edauzIP7
	njXr1ItT66zoweo2uoDH4TYQdWWvwBjVwvWoU3M/EboPfJpvURNY1VNLUTU9l6kk
	UXv6Q3NqoH9m3vNbIKaaC47PVhZwxfgCQZR9g/rwG56TFbFXVlFF7JNbPbfVAaD8
	AzygqmFFMbhTUrZ1GemTRufjykKWud8FxImfbSXzBU/XZIgDwAqHaHQbkoE/cxH5
	gElgTqiwypH/F0g9e2+3wC7YJpS0SjXR9eFnJ7cnYEu2dSyvv/1n3jUk4yZniH1m
	XIQxK9OZJTb+VqNwsZe0Ml1nKs1v5b0/0CvhgIAitvLkW6AqcpChUxci3tAooGWB
	t73fTQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q52jen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:45:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5276aa86d00so24617521cf.2
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785660348; x=1786265148; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oPuIPjhJGmX4YB/fmDXBUae4004dgC4qm+Vs9UKqOBg=;
        b=Y8JzHGxQYxYfzTC/aa9C86/VirobxvxUvboKFrJUY2YaGLxsy2zgKoqxwJqfpWoUkJ
         eZG3jMQdtY+Gz0NGPZFrVbEz9aswBp+7H0Y8SQUjD+OvgGtN+8rwUk0F5Od069BjtwYv
         rnWQ5feII1GJ52AXSy8rLTdo9vCKFPZBc9WVlkj9S4DuXVirYyIPLK17rgG7gWozoYSr
         msEBvL+YefojO0V79//uEBCYGsVG+1DysVNqKS8dCg0zbe1jn4KrEfhQFJqDUUUx0BdS
         Db+eS3yfgCiBIJZ9Ae7d9t8+ptSdELx9/aFhT24DvpaU8Z3hCupbkqKHVf0MgOHC4t4s
         doSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785660348; x=1786265148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oPuIPjhJGmX4YB/fmDXBUae4004dgC4qm+Vs9UKqOBg=;
        b=BvJwXavUC2umpcoQ7kY5t4MVWxIwhESE2IZsqveMTA4SdyGQdR3xAroAJEkoJV6Z7R
         w+4axv/SrRJsaymR3US0nm+CkfvOWgFbyoni5+820pOoC9dzXRCv0USUsKU00BKwAs0z
         4XzfEnb8etb7qNpqV4mJY982D4ecD68d4tUHRgnsiV0uJIDFHOZ2JTbIocQKCdl1RqDq
         GoQsRkZQISf8aQunavFSOAzWOBEV/JfYPe1u2IrA2lSZuwJezKbpNS4NfoyXIPpgh5rJ
         CuX31JGfe6a3HOvjGuimYdI10vyPfXF4z6dEyVMNoAptUk/mXO4e2aP9dYNCtvL6i6tV
         xIiw==
X-Gm-Message-State: AOJu0YxK+6fdonHT2pen3IABgqQxph5NIvZQQE1nGzueelouQC7gNSpV
	zlRZfcfhBHSVW3KuwS/dgvfpGfoRr8wRBCorLg0RvRq40/Fxp3DOzSPCJ5ZNN3QG1vZDfrzfvsY
	MlJWF7hULbI43WYzbozf11NXF7vllNo8387LKXTw1Kk9xqpPWavk2CGKsqZfQN/02
X-Gm-Gg: AR+sD12SOtEBoBQtqROZDHDbkiFFegnSR5Qr7PJwZHLBlQBNM61ehj8uuf3Bvw+Etrt
	GdXaNVjn8S/WrNeF/tzLG7iSWsanaabyBlfDWmM+n3jbnOZNKqDpCniKk0Txl+7y+exnNgmLwrE
	AU6Wrg8t45tNH8NHEcKDwvf28TACUEjanVGFnInjoWg7HaviU2hDYxLlxKkneNYoJXaV0AzgrRC
	OV8xqP9uYvoR70jdurKD6yxmHq17heRPGvsIUxrnW+g2pu9d1dpD9pFOYI5waBHNhABlc6e1Ltp
	MY0Who5xDWrUOk/AnANP2v4VQ30xiyVec5j4MtFRKpPV23Zmx0DOX8OD+wnLFkycNdoZOKnwKhY
	iGv16YlTecz6lbcjvCit8MnIN
X-Received: by 2002:a05:622a:141:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-52b567da7acmr119891621cf.39.1785660348235;
        Sun, 02 Aug 2026 01:45:48 -0700 (PDT)
X-Received: by 2002:a05:622a:141:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-52b567da7acmr119891461cf.39.1785660347817;
        Sun, 02 Aug 2026 01:45:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49808191ef9sm139198195e9.1.2026.08.02.01.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:45:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 02 Aug 2026 10:45:25 +0200
Subject: [PATCH v2 03/11] dtc: dt-check-style: Handle root node in overlays
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260802-n-dts-style-checker-continued-v2-3-6c5dbd1ccfe4@oss.qualcomm.com>
References: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
In-Reply-To: <20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5007;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=am9YiYspNqv8Or5TpjO2ccdLeK8bXVI9s3r+4hapet4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqbwOsVMVOwkNXptWuSbKgfKrqiVfWD7tePV1yK
 jbLEUZzNkaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCam8DrAAKCRDBN2bmhouD
 1zQCD/96v0RSoqzg/dWvdDv3qY6yc/3S/XbBexATgXJFWGDg0Tv11ib8N1Q90oBwpznbGTUY/6Z
 SEkl8n3jObfEOi5brEupK+if3xOG9p9OWK1q3FBBvV4iX387dEXt56VR9l+ItoUKwpDHdURr6Cr
 0txRtcSAewnPH0QftYuYztX4HgNF4ByvuF9XejcJ4jrYI093zhG3as93V82FkkONTlh8Uy88YLf
 gz9yRjaXA1H//HEzFbzbcs2neVokQLzeuRFNLd3jmJqayGKtT5RY3OM5F8eWWtm2SnV92vh93GU
 yZazcUOaKrOBbskboAArEYpYHrnp57CpFiMBVflL4/rTR5/vIfOE5Yq7mNaonP40EHl3A8D7Acm
 WpmR99YxVTW3FiWB03AWExLjmMTsSM9A5nJ3MvXiqSnBSF8+pkB5EAnaleaiYfRnH7L3KoYHt5s
 Zj93vGlL9FQx/qxLTTwMu85N16oDkSgDimqu4iFC+0C5PTwuTP9gjgtLvXUvDOxL0u8d8sdZbMW
 nT2tDYCamhDu4l9VeUTnXdJJQweWCU/i3JZ70fZRJnBMT1h4v8tLLD/L0NQiM9diCU5IjB9ZgkQ
 hk5b2kGoTgWqZjRKHn6Cx3OJDjkX32kft5n2+U/cQZ9zQiBjg/rH7eiT/af8NaGAMbHRNK3E1cR
 MgkdWDYzT2LE5dw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfX6PC6z9HoKgJd
 MOOzqBNY8oErjCQXhBkvlurfIywOtr5tCs3lIHwNRUSuB3EdJOHCFpYiZxudmDHCKBkh+lvRp/f
 sl00eAC0UMtFDfwoUij+50pe8AcGl5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDA3MiBTYWx0ZWRfXx51QGNb4fbkQ
 YenX1pQCRyDyNfA+jpPEbBoCzT9/1X0PtiIE3yHE2XQlkD9rolprQ80BxSxc8IxA1juR6DkRnhM
 xYsoU2FGZ/mT3H+up2fgtrmeVOYQg5jTDkszrsAR3QyjGADr60DbO/zRwD9nfvwmcxlAFNBXVGR
 Ng7I7tga55y1WFMQ9fC9hiQL5hjmxr++53916PyOBjxKQcjYmmokcUrq4HfrtGUNyuduAXsHKrm
 JcTpCwcPBJt+SyIe75fNWnwiKgXF6vT2u4BnH7kWpeoj/jPYxurMN33njoI/g75liNxEhiPPxkV
 PatyHaxCV/B0ao1GsjZa2WjenIturRMN6O1/6Ghw+VTmVlDFZMgo96eKwOdFioGauGVS2j0fdYu
 L3qD76grQxnjX9M21XE+kjSFYzNZX5bHbrQ7Ouc0iklva26JPl/p5UER1qzyroRh0i4p4RSoEdj
 gJ3yMwmue2XLkOFqKGg==
X-Proofpoint-GUID: DBtxuIAOUmGNtn_6pvqoCSo-9VaKN4uz
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6f03bc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=OYAFLQbGvi7cyiZzXxkA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: DBtxuIAOUmGNtn_6pvqoCSo-9VaKN4uz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020072

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

