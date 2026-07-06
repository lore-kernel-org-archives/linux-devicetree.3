Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB2A3AE189
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 15:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783353243; cv=none; b=iuOOpbxL7ndM8CxG5LVgvMeiKA544P+Ak3oea0MXSXZOnNfUbYbanPK++dfX0A7KAepJWPRpZT4InfU7ifsArsGybZMY8rOd5hUxrXIlTLFNe9vOej79i7BxAZAMUVs/VzswTTVUrnVacer35Oq9lRGn8fMEnbvXMlCZBwXDT+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783353243; c=relaxed/simple;
	bh=oJ81s7SDDKFcbSHgXy3Q9MIhOTGmqJ6R5Nxg/oWAFHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u+7SajLUuaHVMHtV/AYReQeKEGvGK64za4kWTpP8F42nsYKwdzHbCAxz05/nLwQ7v8qRqI5WS7VmusLvSZOOWJCLuLwd4rluf9L02vlvIbh2pWkh9eWYSrX8q+h4MPtVjvbyjfsZovmuBD7Trvc0JbOViyRmRrcLe6CTfAaR9AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzDWfbTu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RClOyAFJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzDWfbTu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RClOyAFJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFBmN947469
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 15:54:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+8LmIxLh7/sKNf61J02VYwr4brwNai5KzQ6Ap1e/8DM=; b=JzDWfbTuHVPh3399
	3q/sBt2UI1W9A4bxkG4tvz9xkPL1Cg4lvPwlNvxWA1CfNYEsHclwz6mhfHNVIha7
	rWEdpYohiFrDe3n74Esuhw6srg0pI07Hldco8MIXempRMRKceq944zpYKwbz9eWo
	taNLkDGCWiqWYEW5jC6wdkGCERbpj4zsioVjxOgQEIvvNQh3Lk3zD5Cq9aFtxhXX
	GEqktGMqTvSRDj6P+n+3VbGqbUrHgQ0Qf79cg6vwa1KS/3p6mmuU1E7adKcu9GEh
	sF/gHyAjXWT32OZuS1w8P2hUv+qoBqBeewDrrqll9JwI5AWGEyq5HYGgyjZnjPO+
	0OLN5w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h522cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 15:54:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6a2f5995so530084485a.3
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 08:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783353240; x=1783958040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+8LmIxLh7/sKNf61J02VYwr4brwNai5KzQ6Ap1e/8DM=;
        b=RClOyAFJjhppfYdbKW70Ru66blfN+Tku4IuCbeSb8KD6Qlmq917F/QYjyx/OdkK+WN
         cRur6057yBC8y2ylcntN+TCw3/sfmH9gblGZRgFv8o4LsXVi+euiJkFUh3EPmjTbv+Ua
         Ng4nNre/05XXMWz5s3ZaNbcIvaROC5PnmOgDOcSv4NzWznfPCsOxSVnz4FtdKGgdEn2Z
         r2bt8CqRyD891zch8esZLNiv8V7mpt2juyfJpwJ//+XDn1t+2YKINpyGzgZGq40UPQ1B
         aZU08SIA5ISmib+YafTYRjpFRvjIh4cXoZ3ZNHDnfJ7/jxINXjgtHaw/678i0BsQ2Xyt
         2zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783353240; x=1783958040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+8LmIxLh7/sKNf61J02VYwr4brwNai5KzQ6Ap1e/8DM=;
        b=AfLkYluVd6oaisIxhMwRTX/EOqZP1F3d+tpt1a52NCwpgOWCVSIayAmMATklq5zDiY
         Q2UbiyDFOrMnpMtTIXtBWjjZiX/5zvfifSeRkstKzCjVQ5gWKGFZqEMesPk2Ls8Pnoc6
         l86/GGP/xDoJTXUXvzZwiiRHytw8fvTa9aEVH1WhI4hAkbz3vENIByiEHG8/IhgvHNkD
         1klE/ek0i2op9KMADBAK/TucSy/kj++Z4xTS09rRS87eTuicN9gnwENvvpsnHcO+E+yd
         xFP8MNzBtK62Smm6HtyToY/nNhv4xZXKpYYfZ/S98YwVLaTwUllNp27TpdIg4BIhDbkB
         C4dA==
X-Gm-Message-State: AOJu0YzOm/u5kESSgWnS353GbBw7sEburYxTeO6WTOe1saRdJ9IY0P1y
	Bd9OL8qEt5OkRQ6tmPoeAqhkn3YZaWS5rE2oQc3X9TElWulhCvgqwXt3trnZ1sIJkjNzdt2F3o2
	bjo7zuXEBHccbtfMHLAL/8ZVU299ppJ8UCwPc5zSWigAVhYk+ExlVsZG2wTlPwshow0wWnBMy
X-Gm-Gg: AfdE7ckyjJi5iJeJk2GJUnXOoA9WAeIdexm/8/hS8NDwwMZZTHIMK0L0XzNx1i72X7B
	xPHN2UTgveefJj8Vi/q1oArpZOzsbwIIlV2qH2Q6M6rSsGOzFuh0rvH/qOwacVMofClHaq62Xhi
	1DT1Jcdrk+MASAe3txKPA48rpOd13btFQa88MgEV824aNj/+3QHDMoLUquuNTVezcCEU67O9A/d
	wiEND9b2mt/iXBPZzhmaKLPh4kGw4Kiim1Ev6s9A+wZ/2G57yaKyq45iM5aNzidaoRIvCR31SUw
	R4w3v04Gq3cpvbRg+aJNStRGYNUrYOMIR/+fy+TicOWRVif4hZU6Yx3LWMimCz9jKWPjuRQKqVY
	GhrSWQdpjbPCcyOKtiFdk1bhp4C1uixClu9I=
X-Received: by 2002:a05:620a:4041:b0:915:de68:1802 with SMTP id af79cd13be357-92ebb55f41bmr141878085a.41.1783353240443;
        Mon, 06 Jul 2026 08:54:00 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:915:de68:1802 with SMTP id af79cd13be357-92ebb55f41bmr141873985a.41.1783353239895;
        Mon, 06 Jul 2026 08:53:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm23174169f8f.31.2026.07.06.08.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:53:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 17:53:43 +0200
Subject: [PATCH v3 4/6] dtc: dt-check-style: Expect first device_type
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-dts-style-checker-v3-4-03ffacff9226@oss.qualcomm.com>
References: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
In-Reply-To: <20260706-dts-style-checker-v3-0-03ffacff9226@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6911;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oJ81s7SDDKFcbSHgXy3Q9MIhOTGmqJ6R5Nxg/oWAFHw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS8+J8CysXHa92Qf7QD/hPo2x5oS/pmc2Nh3UE
 dXokdGX5fOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakvPiQAKCRDBN2bmhouD
 15j+D/40icC+prlesmEtWaWDWamWo/WgYAEjqJlsraL1+SSfIqUY+Y1Um6J2wu4yxLneizy4eHp
 RAN6jTE0whwCSnKyi7aId85zMPo0EfrpWlAXa4k5iMIPqaTr1Us6o9/PdgvL2JMO40kQwU4OvC8
 KZqe4w2QbiS870SNDpHrof+cXnY3nCalXaaekpiu5VgGEr+HQzko0eru2R8KIvgIe8e/sTbx5Po
 G+OrHxaELc/OjlJ0sAuGPKeUa0G6W0Jek0woDg5A5vM+MYFZz4zdjvxZALSruIafDG6xKRYb496
 sCR6+WrHrSAJ5JqLIQLbY3GpOEsyZ7wOG6Ejs7H7psCBw5dPGNygmj9Sq6fK/roQwFfBDtzkrou
 OOb7FKmTOJ7nZpZZNgnUFwT4oJiTXb/vABb3l4u/f7N3AO+lpjPXa8Pzcku0Nee3XoAS5hwg75/
 AgvVLM7VtZCOaNVqbghL+wPEz3RtKAuaygT4gcZ5I83GMk8SIflI5G+JFv0I2AHauOrD3cZHMFY
 ruQspKaezPHTdFCo63/jkhqHlBMwti1buYz6f8FwNUnsf4hIGU/QQgZ8o+GGfLykuZl2DHsPOc/
 aci85PCjGFj5x+yTQXSTOag2o8XqSGEw1rcBCZyKptAgb691hTz4i3Zk2ayeFCKloidoQIBlbM0
 tWg4B8+u/Edgupg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: yr8j77XOV1oMYLlvwQcIG6cj03N6bhfG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX2RsL2aSfUMit
 dgAf0p/QwXXdqBw95+yGuDup3lDWXvLI2IYyv3Z9FjmGMCIhDL/ZzYEK+ga1pgMWlQJDxcW4cuD
 mikJu18lCvx0sWmy+sGY2Efd7wWuHwo=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4bcf99 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=bSJRGe3a1YP7llcF9EoA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX01dGiS4qFL+Q
 pvjXyGTYEErc9r/mzJmxztL9knqoyXRJAQ/8E9BlfHPM979hoV8oETrKMcvvbhzzLnWz4QRzCev
 D1cnjeJw0KAcMoE0lck0K4NvUM0x1xWQ4a22i0JyPg+jd8fNLBr2ql9keZJOj69pccPs4FozLzZ
 dMzz7BHyLgTQs7JSs2gLM5SkYlOaZdXzPpNwk6OlopytC51hSL5yEd6eFsS0qe5rH5KnK+Dix8h
 /2rYVNzZRvwbX3lHz0n9wwTMmzcSL/I9l2AOaylPVOHIJjI1QZb9kMrOBLCo/hFIevBEpJrAwIv
 6HmACVDVSYzFh8QRcfIKvtQU5gNJb0upoDXs3zPWvgoVpi4lLj1EeLsqhDRoAbPDu4n7b7wm0Yq
 fmKHbXUvYitoBtDfbvlf9wwo2MQlVAwAkGHuNGrmcqZcQIeKW8U7tFJOwmcDaXsorNIL4GfJnas
 vaB5V6/BJMfWWqjbiRA==
X-Proofpoint-ORIG-GUID: yr8j77XOV1oMYLlvwQcIG6cj03N6bhfG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060161

A few nodes do have "device_type" property which is mostly, but not always,
the first property in a device node, when applicable.  Adjust the DTS
coding style rules to actually expect the device_type first and improve
the dt-check-style to handle this correctly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v3:
New patch
---
 .../devicetree/bindings/dts-coding-style.rst       | 15 ++++-----
 scripts/dtc/dt-check-style                         | 29 +++++++++--------
 .../dt-style-selftest/bad/dts-property-order.dts   | 36 ++++++++++++++++++++++
 .../bad/yaml-prop-order-device-type.yaml           | 31 +++++++++++++++++++
 .../expected/dts-property-order.dts.txt            |  5 +++
 .../expected/yaml-prop-order-device-type.yaml.txt  |  2 ++
 6 files changed, 98 insertions(+), 20 deletions(-)

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
index cf61e92d0568..d9080297bd4d 100755
--- a/scripts/dtc/dt-check-style
+++ b/scripts/dtc/dt-check-style
@@ -558,28 +558,31 @@ def check_child_name_order(ctx):
 
 def _property_bucket(name):
     """Return the canonical bucket index for a property:
-       0 compatible
-       1 reg / reg-names
-       2 ranges
-       3 standard properties (no vendor comma in #-stripped name)
-       4 vendor-specific properties
-       5 status
+       0 device_type
+       1 compatible
+       2 reg / reg-names
+       3 ranges
+       4 standard properties (no vendor comma in #-stripped name)
+       5 vendor-specific properties
+       6 status
     Plus a sub-key inside the bucket for fixed slots (compatible, reg,
     reg-names, ranges, status). 'standard' and 'vendor' return None for
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
index 000000000000..9e55d683a071
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/bad/dts-property-order.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+/*
+ * Test fixture: Incorrect property order
+ */
+
+/dts-v1/;
+
+/ {
+	memory@a0000000 {
+		reg = <0x0 0xa0000000 0x0 0x0>;
+		device_type = "memory";
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
index 000000000000..433afb731dde
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
+        compatible = "example,test-prop-order";
+        device_type = "cpu";
+        reg = <0x1000 0x100>;
+    };
diff --git a/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
new file mode 100644
index 000000000000..7b1a6bae3741
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/dts-property-order.dts.txt
@@ -0,0 +1,5 @@
+# mode=strict
+bad/dts-property-order.dts:11: [property-order] property 'device_type' out of canonical order (should sort before 'reg')
+bad/dts-property-order.dts:18: [property-order] property 'dma-coherent' out of canonical order (should sort before 'status')
+bad/dts-property-order.dts:23: [property-order] property 'compatible' out of canonical order (should sort before 'ranges')
+bad/dts-property-order.dts:33: [property-order] property 'compatible' out of canonical order (should sort before 'interrupts')
diff --git a/scripts/dtc/dt-style-selftest/expected/yaml-prop-order-device-type.yaml.txt b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order-device-type.yaml.txt
new file mode 100644
index 000000000000..9350e2b80f75
--- /dev/null
+++ b/scripts/dtc/dt-style-selftest/expected/yaml-prop-order-device-type.yaml.txt
@@ -0,0 +1,2 @@
+# mode=strict
+bad/yaml-prop-order-device-type.yaml:29: example 0 [property-order] property 'device_type' out of canonical order (should sort before 'compatible')

-- 
2.53.0

