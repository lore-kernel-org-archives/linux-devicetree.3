Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C614F4195AE
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 17:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783618906; cv=none; b=PHUyqHXBmJnszyvl39I2SPgtdVI55yaFwjTt9R8ermNcSjDJnKSQL3FfTeYgEQU3cOaud8h1UlYVktmd91gMEJKQ3rG8UKwq+MVMSjcY0J6ZoWWYZjxzopDP1JRxZvQvwxXDBr5fJIzaVjlJ5QanH/hda2mH4f9IFtUWFrihvus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783618906; c=relaxed/simple;
	bh=0uDbwMAVvTZVeF4og+Wu8eubaQ3DdGiQkZQqjF/ekDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOpnWt9hAJxW5S7Bs74s3VeLkwpY3FdGvFT/EWYIFz3cwkHyTeD4J8xkfL1CHKikLv0ZApWfBN8KklV+DTN+Kf9hWi7zOXNFtErphUGPul8gZIrfDCdVwkN5GARKM0j3OVD6j6EU7/AZ2/ETIl9w2oLs+h25/n3Wf4N8icrwgY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KufXyDhh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOwEq6pH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KufXyDhh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOwEq6pH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HWxKO2563481
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 17:41:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JEWFIY3gmKz/g++62zXk4CVgUhXh1goNaOWhffCyCes=; b=KufXyDhhCstXb3gu
	wbgDGjwPXG+NKTa5NFzh7y3oMgiX1jkEN3v9pH0S8OLArz+0tQ/uTC4o8zkb4g0U
	o7QvseuYefldk1/MXVPlUkvvBK7PrYcavL+0MQAtQwyoK20ZXoNOdEpqcG6cYZhY
	r75Pk3IGUHzX9MDWw8VmXVgD5URRUeosXi9gwY+hs3h8Yc0LWOm/Ki37pR0JfE3z
	bP4q8+Ut+qwL6Gno5xtnVpGmJt07RzdYh9LG865flWjS6BVvgrve3vO7/xt95svk
	rU9GrPw/nYEkiulQqkh442PY/dK2jT4awzra59CxUnKFQnixbxbi56GaV0bO1Kz0
	tQXRaA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeg3gnq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 17:41:42 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c12e43b98so425031cf.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 10:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783618902; x=1784223702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JEWFIY3gmKz/g++62zXk4CVgUhXh1goNaOWhffCyCes=;
        b=bOwEq6pHM8SW6Ncwmwd3M8/6/0ICP20GGSeEF3n/8j+mII355uwblPLxXoGGR5z+IP
         zEzq+IFAtxMVWNvYD63Jyi3kwIb513zslxwmPqYUX4T9Yvd6m6hMwupv+VVQGmLJ+t2N
         CwU4OK94JwKijv/3f1c/B5ilPPz65gelZ/hG3KUBxZaaTDDuPpBmCvu2dstckUkHdkpf
         D/RBbiimKcYdv3/bc3+hI/Reohk/UtVroyjq5lPI0geAdKJGSDjhp1Mjbx0r1EHb254X
         hVNw59ePBVVVJkv7lmU9gmfWHqmG2E7Xkz/v7ctKwEKBMX3x8+Wdf3TwXDIU6ERSgzin
         u8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783618902; x=1784223702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JEWFIY3gmKz/g++62zXk4CVgUhXh1goNaOWhffCyCes=;
        b=KDeugscJV6MgJBmi0+u9Vqius4ahKp5EU4+xyeBeIzVFYAVwvH2nCQ2QkJbR3NzZ72
         +T1NG6fLWYb6+sUsf7Nh9ftwIgjsXlXuA41/JA1kYsoiLw7CHp+3bhgS4zvmLP3dK4pQ
         MYF7Dh0H9xGr/H8lsKoA/zkMvRJZN/cCiyA8dwHzqyf0MZowYRuqOMfGYJZFKZfrEB9d
         qtEsd5PwDYb2Yl9LM4Sh2lzVsglnfQOfr4duYlWHrpwmChh0cWZayUmoX+k4i1UVaRSo
         s+LZ+voC910qZYybwsWZkoIwecBcaJURhKRaAILqTDqtc+bTKZk3CeEwP1GxQNUtLeW9
         klEA==
X-Gm-Message-State: AOJu0YxVJ/PRqY/ZW8E9QPn+XYTCzihaF/HPeMxDpQcRLr9pwiXZ/2C4
	Bm+ReZH7RoP6G1h5PKE04JGuJxRbeJ78hSFyxhfORNRLzO/n6GTej/bQH6nudwzW07ti+gKeCQP
	osX5Ikvv/UIo7N5CwFXTDWpUkn+aCxcFDdPnBFQ0NmdtB+g8FyWtewqXT44UDybS4
X-Gm-Gg: AfdE7clDZb88a7NYePvH4roGNSWuvDsPMHQ/Je4OC7kt6WZMSp7sqS/5rIKVSDZlfrN
	c0i/jwsq8tLpvs6V4CgFcj9UEXOwyn6Mf2Rwv1OsGVrC0KupUUm0fp/1z7PSD/qmaCAA1sYUKO7
	MqqnITjSw+emGTr9t+Q3tunPVio3XTy1SagA2Lc9+VMolxPw79q2k9/FsNP6x/aE2U0cu7GaXXJ
	PEv9bKIvjfDfzwb0nYx0oKDrx7XmmkTVxrBHb0CHGIC+Fk6ac3ILRGv3ofULWMIp/wkxOrXBfNC
	y3PBi47CAEcAEEwvsrVYKESsF8DPWU0QDkBaoDlR0xHnxzVx0HpNRj5DOaC8FXcSi0vSZEGY9eX
	LY8I/zCtlSP82FdkvCmJ2sVJp2SqvavdF
X-Received: by 2002:a05:622a:1824:b0:517:78c7:d93a with SMTP id d75a77b69052e-51c8b2ae64cmr89107571cf.16.1783618901710;
        Thu, 09 Jul 2026 10:41:41 -0700 (PDT)
X-Received: by 2002:a05:622a:1824:b0:517:78c7:d93a with SMTP id d75a77b69052e-51c8b2ae64cmr89107221cf.16.1783618901248;
        Thu, 09 Jul 2026 10:41:41 -0700 (PDT)
Received: from [127.0.1.1] ([213.55.184.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039bcdasm55174048f8f.21.2026.07.09.10.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:41:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 19:41:32 +0200
Subject: [PATCH v5 4/7] dtc: dt-check-style: Expect first device_type
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-dts-style-checker-v5-4-fcc147cb697d@oss.qualcomm.com>
References: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
In-Reply-To: <20260709-dts-style-checker-v5-0-fcc147cb697d@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX1O/Q6Ycb13QF
 LV3g8mD6Kr57RpgEgW7SW5ARfucIM1+wHIc0QeM7fvwlRnjticFATafzuOwL2Y8f+utguW+5sJi
 ZiPlUr7F0Fm6O8JgU09K3zfjJeWf7cagu73dDlVAY3z94ycJZJVZ98WR0eXI3tZRrmtyrciPS79
 4Vzi4F2qIq/Y3OCHULYJb+becRBMPNmWcve354cHwqywm07D2yAvlchntArKUKZjwUbzqBzUnUb
 e81FwZVdKW5GS/U8phfHeaVL/EVDw7nFG5A9283X9vMUQLBOVO+jC0hZh8+4OJvFtEbUaLfJOlR
 r2vqh7JUesMKvDO/qPuEV7MNJ7/wuMSPVofjEqp1cgkTC5iob7vzMpAqf4MsBSlhBCbOyTqgrd7
 e30voOcsqCeO0cSqlIJumrPpZ93Ltj1hs810kZPaKB1YWdDv6z29McWVLXuZVqlysKdkdHyztB0
 +Civh2MVTiPfqnH0eCA==
X-Authority-Analysis: v=2.4 cv=ZcMt8MVA c=1 sm=1 tr=0 ts=6a4fdd56 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=nvVmADDuAioZMzk/ZEnfEw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=48zBhpcJxELL0NsAqQkA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE3NCBTYWx0ZWRfX6vXjVIe27obJ
 sJNnM3mGCrFMjXKCqmYEJlMOe/AzyvcvNNr5APIBn5+57HHvl1O9cbi50kpk1NdcxaXEpIztuTO
 xZ4lgc/23XjkmiU7wyVNoiUAolB/FAM=
X-Proofpoint-GUID: veBlg2tPmSaBxMiU1UM4W5BpEJoPNgEZ
X-Proofpoint-ORIG-GUID: veBlg2tPmSaBxMiU1UM4W5BpEJoPNgEZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090174

A few nodes do have "device_type" property which is mostly, but not always,
the first property in a device node, when applicable.  Adjust the DTS
coding style rules to actually expect the device_type first and improve
the dt-check-style to handle this correctly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
New patch
---
 .../devicetree/bindings/dts-coding-style.rst       | 15 ++++----
 scripts/dtc/dt-check-style                         | 33 +++++++++--------
 .../dt-style-selftest/bad/dts-property-order.dts   | 43 ++++++++++++++++++++++
 .../bad/yaml-prop-order-device-type.yaml           | 31 ++++++++++++++++
 .../expected/dts-property-order.dts.txt            |  6 +++
 .../expected/yaml-prop-order-device-type.yaml.txt  |  2 +
 .../dt-style-selftest/good/dts-property-order.dts  | 41 +++++++++++++++++++++
 7 files changed, 149 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/dts-coding-style.rst b/Documentation/devicetree/bindings/dts-coding-style.rst
index 4a02ea60cbbe..63648db377e1 100644
--- a/Documentation/devicetree/bindings/dts-coding-style.rst
+++ b/Documentation/devicetree/bindings/dts-coding-style.rst
@@ -114,15 +114,16 @@ Order of Properties in Device Node
 
 The following order of properties in device nodes is preferred:
 
-1. "compatible"
-2. "reg"
-3. "ranges"
-4. Standard/common properties (defined by common bindings, e.g. without
+1. "device_type" (if applicable)
+2. "compatible"
+3. "reg"
+4. "ranges"
+5. Standard/common properties (defined by common bindings, e.g. without
    vendor-prefixes)
-5. Vendor-specific properties
-6. "status" (if applicable), preceded by a blank line if there is content
+6. Vendor-specific properties
+7. "status" (if applicable), preceded by a blank line if there is content
    before the property
-7. Child nodes, where each node is preceded with a blank line
+8. Child nodes, where each node is preceded with a blank line
 
 The "status" property is by default "okay", thus it can be omitted.
 
diff --git a/scripts/dtc/dt-check-style b/scripts/dtc/dt-check-style
index f5276b5fdd46..d19ef26c2213 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -565,28 +565,31 @@ def check_child_name_order(ctx):
 
 def _property_bucket(name):
     """Return the canonical bucket index for a property:
-       0 compatible
-       1 reg / reg-names
-       2 ranges
-       3 standard properties (no vendor comma in #-stripped name)
-       4 vendor-specific properties
-       5 status
-    Plus a sub-key inside the bucket for fixed slots (compatible, reg,
-    reg-names, ranges, status). 'standard' and 'vendor' return None for
+       0 device_type
+       1 compatible
+       2 reg / reg-names
+       3 ranges
+       4 standard properties (no vendor comma in #-stripped name)
+       5 vendor-specific properties
+       6 status
+    Plus a sub-key inside the bucket for fixed slots (device_type, compatible,
+    reg, reg-names, ranges, status). 'standard' and 'vendor' return None for
     the sub-key, signalling that the within-bucket key is computed by
     the pairing rules."""
     stripped = name.lstrip('#')
-    if name == 'compatible':
+    if name == 'device_type':
         return (0, 0)
-    if name == 'reg':
+    if name == 'compatible':
         return (1, 0)
-    if name == 'reg-names':
-        return (1, 1)
-    if name == 'ranges':
+    if name == 'reg':
         return (2, 0)
+    if name == 'reg-names':
+        return (2, 1)
+    if name == 'ranges':
+        return (3, 0)
     if name == 'status':
-        return (5, 0)
-    return (4 if ',' in stripped else 3, None)
+        return (6, 0)
+    return (5 if ',' in stripped else 4, None)
 
 
 # Declarative pairing rules: each is a callable
diff --git a/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
new file mode 100644
index 000000000000..f31abb6ceae4
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: Incorrect property order
+ */
+
+/dts-v1/;
+
+/ {
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
diff --git a/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
new file mode 100644
index 000000000000..e2c69e9ff452
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/yaml-prop-order-device-type.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/test-bad-prop-order.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Test fixture with device_type
+
+maintainers:
+  - Test User <test@example.com>
+
+properties:
+  compatible:
+    const: example,test-prop-order-device-type
+  reg:
+    maxItems: 1
+  device_type: true
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    device@1000 {
+        compatible = "example,test-prop-order-device-type";
+        device_type = "cpu";
+        reg = <0x1000 0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
new file mode 100644
index 000000000000..4bc21328625f
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
@@ -0,0 +1,6 @@
+# mode=strict
+bad/dts-property-order.dts:15: [property-order] property 'compatible' out of canonical order (should sort before 'reg')
+bad/dts-property-order.dts:16: [property-order] property 'device_type' out of canonical order (should sort before 'compatible')
+bad/dts-property-order.dts:25: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
+bad/dts-property-order.dts:30: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
+bad/dts-property-order.dts:40: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-prop-order-device-type.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order-device-type.yaml.txt
new file mode 100644
index 000000000000..9350e2b80f75
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order-device-type.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-prop-order-device-type.yaml:29: example 0 [property-order] property 'device_type' out of canonical order (should sort before 'compatible')
diff --git a/scripts/dtc/dt-style-selftest/good/dts-property-order.dts b/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
new file mode 100644
index 000000000000..0e183e3459cd
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/good/dts-property-order.dts
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: Incorrect property order
+ */
+
+/dts-v1/;
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+	};
+
+	pmu {
+		compatible = "example,pmu";
+		dma-coherent;
+
+		status = "disabled";
+	};
+
+	soc@0 {
+		compatible = "simple-bus";
+		ranges = <0 0 0 0xc0000000>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		interrupt-controller@10000 {
+			compatible = "example,intc";
+			reg = <0x10000 0x1000>;
+			interrupts = <1 2 3>;
+		};
+	};
+};

-- 
2.53.0

