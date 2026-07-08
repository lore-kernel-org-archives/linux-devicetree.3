Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A14E3B38B8
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 14:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521663; cv=none; b=NRAw7+e8CPyXqKyqQlKnvAVrz9zUOGxlmjJDiOtfy9SeGxBCkNd1aUqvmeer2Ib/Q8boCO5rvC02tJygPH3QwRoxSAaPa/BCBemKtDSevU5iSoRSwGqNjSq5ZPgmqNPIhVLL1B57FDNCAuHVliHLfLUeGMzQOnASTCEuryl2BMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521663; c=relaxed/simple;
	bh=mvLf2VO5gkvRQA+OlmI770eNxRUlkZPnEmWKeYHyiQw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GuQHNhxxd7OX44fcD8wpwM8SOpHynkjZR2hIv6ZgIRTLTwv4vTIUFWzMSIj2+GvfwYYxo7OG7M/dkkzEO4ZsW21gNK1N4bnYIhvZDvrTTJDF6d3XW1SZcOa02ge/gwWJDsBbMqbPTF7daSBno+jez5r4MgyM7VKrO3uA8/h1wiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JJRRQOm0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F73f0U0G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JJRRQOm0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F73f0U0G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668D7rQG2677967
	for <devicetree@vger.kernel.org>; Wed, 8 Jul 2026 14:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f1TnfJqS1AipREtUbwrb2yRIUV0zrh4oiQZqHC1Av7A=; b=JJRRQOm0ZCA+QvpU
	6uAsaanw8mh3uZtMlVyJn1GtBsZgfGAQaf2WnF52L5Y7c5fw8rlEgRmxdmfFDqfm
	7XrOn7BwMerNhFIUEEkRDBYQjbKEhkghr4YAXyrUyPvoo8fe5HxwCOKKbplss4dv
	oAIVzVFEInzx0JvIjVn6lYekHPeauks8mFP6Jwd2xv0Fjdu+w/ddc2dXg8nUpMd3
	92GkPZWe2R4SIBKrkxGV1GCx+MFsOyZ+hk2EyMSqBl39am1vXer9tc/98PRaQDU3
	4gFtjqEDqbFjF9VHVOjtnXFN1EM3Ps7Wv1h69Pi5vwrDrQpp/i2BY3KU4pNMFMRx
	CQT0Yw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9q5s8e6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 14:41:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1e6f602cso14980521cf.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 07:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783521660; x=1784126460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f1TnfJqS1AipREtUbwrb2yRIUV0zrh4oiQZqHC1Av7A=;
        b=F73f0U0G2O1o4AieR043VXN+3qLnQJzK53XtWbmNQJIuVqj6wEnBC9Jwj2MXM7y+jY
         h9eron6vnQRy8SqaVWdNBl6QZ6Fhm+rhoS6xcyrOWCyfxCCoJfBJdbDEyRacxOXkEMg8
         u3Z3ct9k4iIiecErfg+ehdXc4vB6Ub5UfEEZGNtM82EiXzjTmoJy5GEf2tcEg4xF1W3y
         /bI3IctFSwNpbhQWguZxfV4znaVgnNp+8NY4mRnFPtVjEMB6eRpc+0KyXXl+wAxsweUR
         2Nebzk5/TNRu/+MVB/XbB/8nyVXwiEIZqDDoSGz9oDYJT4jSVVYT0rTYx+I4uzZo3gFh
         MnXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783521660; x=1784126460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1TnfJqS1AipREtUbwrb2yRIUV0zrh4oiQZqHC1Av7A=;
        b=eCcjtAPduWka/CgRFOB4mSf2/9pV2y+8lCPYq9ug2ydFxEx8IMrDBXO4lQtUdKstMk
         WXbPC0TTWTC8gw/k1UMF5D2mBylwbR67KR8FuxbsV+G92X7HGWCZfaqs9BzwQ32+nDti
         6IKAbQvHekOqyV1TKMrJFqXO5vkyOzDe4SkQk7oOLLs/k7AZksXz2NOYjw4fygAL3zfz
         6iyIAy5Q84QSB/dUtlA5c3jAPkuDyP/LIN5CypyL3vuz4YmT9YExCP5Aoa9Tnettvmd6
         1vHu15u4eFmv/zXjOOZnG6bnp34wl7YRMXZ1HQuxYHL6wpuVNAGK4hq+J36cjBw1h4bA
         DSKw==
X-Gm-Message-State: AOJu0YztSntyOizBbxZoNRjTDAouEg4u88eyXI6/3LCLSOSlKNCc0Xa5
	SBPKajU8xAPDzgxonN0ByhwDse5E2uBQ8JsAln7zymMhQoxAcUtUb92Jn76zh7tQhHubclvMbII
	CbZOVYnnA7lcluPo7O9tPi46kacZt+7kD3/jDnmwZyjI4+/naGERJ0CL0AKxoGtVz
X-Gm-Gg: AfdE7cnI6AAe4CvQoI8f0wL09cd4H7rWntvUfD6JcWjQ5f9od1NrkbyvjgJUoZGQMQ0
	v12kFv7TAtagZuFGamqq6z4BSv9pHz9h9fp9seTa8B3VujqRTPtbC/zd7waUU8UptfnJ/NzaVWN
	79p7/OCYmIkWcOQykuKph4/Y6Av3dOX8cGDBCZWF4Rpv8hQp6Dv/6au7gOP5d6nnRHuN71qaMxJ
	sYPnahiokt0wQqRCAZtaKwARkOHjWdSn2V3k3TqrLHBL9m1gk4mboBV3G5sMmmpA3toe2GGDfOW
	//MFuLSTirfwA1zd/yrqi9zujWZLRMZYp5Dcf2wkRBptJ5Q/FBkUh8fp9G26hFCFVllvTX9EcHX
	rFZeNJEMUl/Bi56q3ijoV08EfoyNrvVPmtHM=
X-Received: by 2002:ac8:59cd:0:b0:51c:257c:8166 with SMTP id d75a77b69052e-51c8b3d7022mr29593261cf.33.1783521660272;
        Wed, 08 Jul 2026 07:41:00 -0700 (PDT)
X-Received: by 2002:ac8:59cd:0:b0:51c:257c:8166 with SMTP id d75a77b69052e-51c8b3d7022mr29592891cf.33.1783521659732;
        Wed, 08 Jul 2026 07:40:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15da821c58sm52543766b.48.2026.07.08.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:40:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 08 Jul 2026 16:40:34 +0200
Subject: [PATCH v4 4/7] dtc: dt-check-style: Expect first device_type
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-dts-style-checker-v4-4-c175e6401150@oss.qualcomm.com>
References: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
In-Reply-To: <20260708-dts-style-checker-v4-0-c175e6401150@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Test User <test@example.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Golle <daniel@makrotopia.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8217;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mvLf2VO5gkvRQA+OlmI770eNxRUlkZPnEmWKeYHyiQw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqTmFqB+G46NBSeWVLZw7j1bMqMC791WUIUmPGg
 GS4LBZfvvWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCak5hagAKCRDBN2bmhouD
 13kZEACXtZJlcAqILS2uVZna8+JQ+h7JPfaEMzbQ2lqIHdO5C70J1ITOdmM+owYfONbTZ4oaRrp
 3CTiqhgaQ4hhRAVBhFJBG1cIbWV+jWkNeP/bpKefcZf2C4fnsYFFyXCxj8bktMqNnbSUmf899Hb
 lACYD8Un3ZY70N8dQXBgvk+PUQsCEkIAP9geoKakEiM6qOVZ8adMixPUEddOYgIb1MSf5EXckzc
 uB77EgmzrVmTCCTUMjszjaL9GIntiEduiugL92fNuj05FKGNLj/j4jZGAr43JyOvrQmXMcGWRbZ
 25YRMq/fiNq7iA/rdzR/o98q3MXSA6XUgrBbOtlqPewrAXvnqo7FGzmw7b9UQybDc3JVBCoBgR5
 mUlmlAYlIhEq3BLwZqwUNr3Qw27syfnGak24pmAiFb5e/a4VGL1/a6pVOzzLMcoDcJRsPW6puV0
 m1watz5E6RjwVFSK4x7b3plFKrlyLdrVvTClfm1UOMlPq8W4q6yXYc81rKmAaI3u/saGtVkY7v9
 Ffavxae5I+XD6rZHdGMjf3gMea2Xafr6SdiOVSei5I4PKrDNf583ywzNEcfazpyfNzftnPMopTk
 izcdG83jUK0Lk7i8LMqXTm8ULkJZoeUawEVT8SVxdP003BIiY+a98hngZdj3sozaWCsW4DSLrWk
 NH6cIkjk5tjgmsA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfXy1VIrtrJTAiy
 CpYLKdQ7BK3t2qrG7xzrT+Zb/34Tn1lRt0AKGKTgloM9/63+w7n/PvdCk4MnBRC9nufNGq+sRGd
 dz76tRYiwmCpdrUxgE6ULdZC9yHWUnCzJovc2xGiLV/3a6+d5O0gpeDLHZcN7xLg1Ldn8cAtEJl
 T2l1/8gfIJXM+cMSTe5sZK+N6sfinHgIxJ9K+mmRN1UsPn+L7aCJ8LhB4tdd0xqIa8zC35u44d+
 0YBOd3KDl3W15GlaKKf+u2lzJNWq5g3ZXz6so8pUApXsMVoC9/+4l69OZnNpZLrgj/1oxvc/1HJ
 fOazRs7y3nJ2xkrjHvTEzTBP600S0HyPA8ZzltLFiEp97MdpzwKUG9eXzllR0eNETjSBOuOhIvr
 1/zqUcfWnFLsfa0dcTNI3lx3N7D70+B4wd7pk13izilXOQLG3FDsCgdRfkvTppA1dnXCqVWbp4K
 Y30WG8FTYXQz9vreuqA==
X-Proofpoint-ORIG-GUID: R0p28t5QpuFHx6vQIyPCtkV7ALVr-Tib
X-Authority-Analysis: v=2.4 cv=NfTWEWD4 c=1 sm=1 tr=0 ts=6a4e617d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1X0JdhQAAAA:8 a=UikGyXCc1Zc6WlGwHegA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDE0NCBTYWx0ZWRfX4/sWzrdK9Z81
 83sXnlM14QP/V9itp4QScRPEqhSpOqJBMKnn5ACkiB82sySa3j+U7F1QXVS+skRv628ycFOQNfO
 X2pCB166GQKlAramgBzfVnXN89Fx4TU=
X-Proofpoint-GUID: R0p28t5QpuFHx6vQIyPCtkV7ALVr-Tib
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080144

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
 scripts/dtc/dt-check-style                         | 29 ++++++++-------
 .../dt-style-selftest/bad/dts-property-order.dts   | 43 ++++++++++++++++++++++
 .../bad/yaml-prop-order-device-type.yaml           | 31 ++++++++++++++++
 .../expected/dts-property-order.dts.txt            |  6 +++
 .../expected/yaml-prop-order-device-type.yaml.txt  |  2 +
 .../dt-style-selftest/good/dts-property-order.dts  | 41 +++++++++++++++++++++
 7 files changed, 147 insertions(+), 20 deletions(-)

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
index bb9ec5b82319..23cdfe78b189 100755
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

