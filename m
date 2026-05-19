Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCCB36828D
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779214910; cv=none; b=pPnJkpXVr6la5clkGN26c8yu74t2iVxxSMvJJ4vrwjRq3DeI5owZOgs/AcOnLPPni9tTyx5GGkxal1ZotlpOVmFiPyHdMJ7UDwEniu/dXpLoOHS/xhTGSphKlyL1Bm+61BQCFB72ZZTbQWaIIbL9vPRwGXe+o4Zdj1gs9UHm3Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779214910; c=relaxed/simple;
	bh=XkhpJJhTxaR1mdX9SVljopSCxme6ARb1aPmwShm4dTs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P5ZNfIQaXHKHKceahYzEO1B2G+FB5DLTm6beiAGt5IeXURYhmJbizd5A0ZrlHrwP8/41D2vINOr3pEyxVee1Ky1JWC6y0OcECIsmRrX8d2FWU1fDr/FG1WFQoYcyPffDgKJWUTjAhbJ/YE6G66Fm3PiuV9AXUpE1dNj87Q+kRu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2/682VB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=flOuue5T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2/682VB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="flOuue5T"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEx5sC2868093
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 18:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qezk0Iam8mPwaTXWCYu//VmCdG3zlrpj2jPYJFIKOoA=; b=a2/682VBSkQ1hrtV
	8g0jVpJZveoCFQISh0nqmXE6OpF0rgoZgGgk7A3sNpxOUAdYJsd4COnfypk5QytB
	zal1FDZnZCXSQClZsxeVt4+Ffh0F55AADZ8lbAMHlOlOo3ExQEl7zmxBPVgDcEu+
	g6rPihxej5H0SgY6vuL6C0D0rwa4HkZo+ZUPKMTEEKfpOz8OI++hBDIDYGj441MZ
	YmUZs25sL07HYiBc2nTRsG5zTJasJ5BakGUox+6b4q9uH2BuS2PMLjfG4xXmkX1S
	tLvKlLhIUYjYkpB2emsyHJytOicBNFIbM/8qt6es5wb4S7AUKe8ZGxOn5oAGIbu0
	KlrIog==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3w8wpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 18:21:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-368f2d76b04so3675085a91.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 11:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779214907; x=1779819707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qezk0Iam8mPwaTXWCYu//VmCdG3zlrpj2jPYJFIKOoA=;
        b=flOuue5TolFoydTx2FlvM5z1DOUov3KVpEzxNJ3+GPUcSDolLFoNui3Nv9DW7pxHS0
         GI7iIvqGFzk6NrsrcU4IbFPjMwB86V5nfvyX6S9xPbFwhxzh7d79tyXG3t2jL2pBf2PQ
         HuN/AoqnAIxXlfO8dTsVM/hswk6TdpWJ5AAEZvkcS/e9RbpKDYl8DxzA3lYlq/jt78lw
         TPCsJg1xImmg8SGtibIe6Qx27Sn4OUV5ZH2dpzBmop5ALxkYtdGCD8jljdqv92y1b05B
         tgjUiWZ+RC7jR8GvbElQaAs/pC1pjFnhMp9Jfn0RnNKb6cFzwviluY+a+wDTxG+zEnS6
         D9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779214907; x=1779819707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qezk0Iam8mPwaTXWCYu//VmCdG3zlrpj2jPYJFIKOoA=;
        b=Ur+t5HZ3YMn241nyamTfies84tq9ldUxdPuRs+C23mv3Gt2VEIan53gCGELhkcjJaJ
         t/uGNM6mXGR4LSwwH0mmpOkq6rH4HbeUlezQQSNL1vdhueSXAmjlwNwOt2Ssg4sFLqar
         gHYv3xFUKIENAnDOzC2sRvbZ8UGFl1n/T3tSyFPQMGE9LEdqe4CQ1TpvE7z6fFNfgWRY
         eqPdV++ATVr09Xi9f2Nr2GD3ECyju1+dNI4a4Zc+hbYJHkET2QWAZ6YLJp7fv4X+Bamo
         4BLr50ntKaJy899eS/jRPoInK7MaLDrQXMJj1wql7osLETF3oxAgk79Hy15OEkcQukOB
         pBiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9lR85w9Z/EEPHfdfsH2wjNTpgupns7JS2bE/7xT/d0tIfioLbVamGxMCbcjfkt3IOlmCjB7LuFminJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyEvXtoFSzWDGxDSf13HEjMt0UDg6A4kbcuOC2yxE4NiVRHK8qC
	L5GtvxB0N1xA4S7rTo7GquaF/GVlR79D3f2/njdk4FnFz9jEtO3V56Tc5R3jF4b2kqPN4CPcmpI
	4LoOP9tmGmvuuAqVpT2Y5UpmMh0uhzyNKUyufizyXQ4SRHUQe7nVzQ2f9ph6kiF65
X-Gm-Gg: Acq92OGMmw/Su30l5UAnVhrB21Icagjy6nq95gpx9hXwE7iEKe+nMvebJr7V0ZT/Dsd
	51jvFuL0uOa+P1L0LAotoZQsRVb4bmFCIJZXi1NTZeKn4nEtAakyGnCLc6VR/q/6x9EWrCemE6T
	EkiU/+m3I48fnwQ3hA3xB/64CN9f3Ami+z6uOpOIpxM6b1lxijTKpMYT0IGEuKv5qIgUGxI2WF/
	ko/1a6YGvht2hEGm4mmHxBmKcBgjVwy4EIzwJ44g6teHExF1aUDpI6F5S6s1IFcd2TWcCCVYpVO
	26V0NlZ7hWl5dyup0ombreLsTfVWuRWhOYblKPg4JfbJ8JwTTe/lbnidxu2vctkMpSeQiryb2yL
	/t6O2p9kJx0/jukQkIr3GMe21q1aUcgXgAr8i0zzTzMgqaZ7iFOn6VQ9aBInQju2I7mXrci/MCw
	gsdodMmU7c37znL30ZelP8dV4Ece/nS9FC8yNsJDBp3g1p136f5hXT/Fjeu+24Jw==
X-Received: by 2002:a17:90b:3505:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-36951b9adcbmr19549478a91.20.1779214907411;
        Tue, 19 May 2026 11:21:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3505:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-36951b9adcbmr19549458a91.20.1779214906886;
        Tue, 19 May 2026 11:21:46 -0700 (PDT)
Received: from hu-viswanat-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369514aecaesm15434362a91.17.2026.05.19.11.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 11:21:46 -0700 (PDT)
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Date: Tue, 19 May 2026 23:51:05 +0530
Subject: [PATCH 1/2] dt-bindings: regulator: mps,mp8899: Add binding for
 MP8899 PMIC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-mp8899-regulator-driver-v1-1-30d14421b7f1@oss.qualcomm.com>
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
In-Reply-To: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
To: Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779214899; l=2158;
 i=vignesh.viswanathan@oss.qualcomm.com; s=20260518;
 h=from:subject:message-id; bh=XkhpJJhTxaR1mdX9SVljopSCxme6ARb1aPmwShm4dTs=;
 b=eQ0oeWLfLTdgtsPRQonmNwadLBpKtMzTW0ghXVu+hct9bjiTwXb5i++cEH29mqlZUG1yhfWMI
 TB0nWzExm+lBWG6xd+oAkdEuHFK6w/lSfgH5SJ6QpxD07cXGeWR//A3
X-Developer-Key: i=vignesh.viswanathan@oss.qualcomm.com; a=ed25519;
 pk=/lHspsTTqZQg546ZudgrbywCsk3Whx/C0XNVUevaKNk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE4MiBTYWx0ZWRfXzcc2uDaQ061a
 lI9t1lXJjUJOHqQrY2I935L7zQioqJ0PwTLjiZTnYrXF1n0hQ7LJPbgwOk2gU5IE/fi/BiAwolm
 +dEkbhbAUZqfQh2H1hPONY8naAMlZT3on+XEXvdx3c3siG9Bv0J7zRmGd4TxqmkfAFfmu/zw4f3
 ft5o6OjRMjFZrQUjKJBhJy7JkMDqwmkfX9KkTLB3hpYYhW2Cr31gxBw52Onn1//Vt1z3wrEn1sg
 ifcjuIw3F/vFitnu8y1khoKQUcGx4w+gJMKGIDqS9dqu9qeO/PZkYJzEHOw6Ek31ijKwGCjBLSJ
 hxKiwQVcNv9AWZP0bsgipsCkdiybpGOdsHgAlI/3Ltxq0QXBTBgOIOMyypFDtePvrTengiP38Mn
 CWW+0udMVJ8i4qds9pfS0IF5FaREfYYt1Awrh+UJIC8uVDmwoJ1k28KObYLYBGmsLMmKXvX1ca/
 MT+aJRXZVrfmOModBrg==
X-Authority-Analysis: v=2.4 cv=Q/viJY2a c=1 sm=1 tr=0 ts=6a0caa3c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=sHb7p39yKR-EH3ZyzjsA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: s5oaw_2sgO5A5x8h6PrLHvRMKSgBcgla
X-Proofpoint-ORIG-GUID: s5oaw_2sgO5A5x8h6PrLHvRMKSgBcgla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190182

Add devicetree binding documentation for the Monolithic Power Systems
MP8899 PMIC, which provides four synchronous buck converters controlled
over I2C.

Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
---
 .../devicetree/bindings/regulator/mps,mp8899.yaml  | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml b/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml
new file mode 100644
index 000000000000..3225c92db2c8
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/mps,mp8899.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/mps,mp8899.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Monolithic Power System MP8899 PMIC
+
+maintainers:
+  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
+
+properties:
+  $nodename:
+    pattern: "^pmic@[0-9a-f]{1,2}$"
+  compatible:
+    enum:
+      - mps,mp8899
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+
+    description: |
+      list of regulators provided by this controller, must be named
+      after their hardware counterparts BUCK[1-4]
+
+    patternProperties:
+      "^buck[1-4]$":
+        type: object
+        $ref: regulator.yaml#
+
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@68 {
+            compatible = "mps,mp8899";
+            reg = <0x68>;
+
+            regulators {
+                buck1 {
+                    regulator-name = "buck1";
+                    regulator-min-microvolt = <550000>;
+                    regulator-max-microvolt = <960000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+            };
+        };
+    };
+...

-- 
2.43.0

