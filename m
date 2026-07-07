Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB762C11FA
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 08:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411363; cv=none; b=SNK+8k30QBhcRLwFhE8gEReI73TKdBJL034JBLKRo4UJaRb3BE6ijinEkX3SE4Lu6PAatjVSKGiDgNTxWCnTXmd51q2ItZ3QqCJBvX42+8dy1NT2XAmKrvHw2CP6M5tZDdqaCWSGacLtwGu8Hypt6zHJXkT99ka41YDapUf8EZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411363; c=relaxed/simple;
	bh=05mTt3WzwqVURtsexFxJaoPg02cIOnA+8A1NAYyBuZg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2HMEWtY7y+Srcwzrt6vZJCCJMEg6eQCu1vFipq+9Awrp1xC3vOIFMnfOndtROFPhEmmjZtclj01fI90fSOZLY1VXF+SBlrcwMPhODjSfw01T22gvIW0xDXwArDykP993mLL+piSWbA7J4Vx3P62OnvXcqS4PVCvej56tQ0YF0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hva6BdC7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8p9yI66; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hva6BdC7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q8p9yI66"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66749HMD2451195
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 08:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+kTw63aCltmhjLTw8lsJ8qVfHy0eXwaijmW
	Z0RC0Bws=; b=Hva6BdC7JkOfqsmoY4tQtnZaR8mVlqD5DiprI5O2mYsVi+i3bp+
	EWwRgSSK3SnoJkbd8X82/WwIH6ZA+CjpkQsRgGKzOPVO8cQnzDyl/OktVodQkW75
	rrTAi+uFuq5uhqZ7ZKNvP7SQAYKGZk0wVSDToONy8GyHbbL+6rEFhkJCYppqEVah
	Uw6M9gwYia4QCu0c14JEsgTNjnUr5YfIlEtC0546wjxNmYD7+Gm0hG7HkGrWxHiH
	HLjOULIPyHuy7sK6hDOdUu8M12Zf7ri2Ta41cRlhqW48mCxyXNdNL90bprjUI9U2
	Ivns1aUujaQx8+vB3/EFVK4SR3NCCZWuIrg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8su70v04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 08:02:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845317fa7e6so6118930b3a.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 01:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783411360; x=1784016160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+kTw63aCltmhjLTw8lsJ8qVfHy0eXwaijmWZ0RC0Bws=;
        b=Q8p9yI663aotuSB2RgMUOzidUGnLZidXnoL7j/FLM8rEXd07M5PWvFbc+plo9XNd57
         PHVf8V4wCHr0jdr2K1w+VwZNwsQlj+05j5oUcZrVvBK4f4oU3TXhMXMtXvmm+Qg2claz
         gXraS+2yRNVvpg7soOOgiVW7urdrh2p6vc9F7PtYXzYuwzmafdex5u7Pp+KL0SNaaTHO
         RXc0E1KPP6CNkzYk3r1Q5kkxo1UfvHqCQGfuSnR6XBE7zjl+9/qrqV3dGE2euyI0ulO3
         4KdGprrZvK2+YcgoH0rwiQzI2yj/Yq8Q5TjemRuYDBiK2xwqYFTQLvO2/cByPk0wz5xY
         q/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783411360; x=1784016160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kTw63aCltmhjLTw8lsJ8qVfHy0eXwaijmWZ0RC0Bws=;
        b=iq4cSbClsm37inpA9hwj//xdglCh456JEE2o0pciH0ormbf33u4tSpThDqyX5Rd2Ej
         pCljvYe3I7DU3MSeAhFA0cYU4Ot6T6fLvpdRMl4cwqx24T3vzZjZWMfmEibMr5tF6Uoo
         Z8xgT/DNWDa79O9H/BWFn+EXJvAqRB94FnMgyM0SMfY//NOsQEV4da2lgYavMOfGSQD4
         Q1T6oFAF/+jJsx26jrXvJD7TU7aoquNCAVqj/Dkle7aF+vlWgU200CFLAI2ZcEoyrQvZ
         a0eFMe4rnWCEbFFqGxD9jE9TyU44xcUUIAWW1mTuuHgk9jFYjh04rdfTKGetm2gVAgad
         8eJw==
X-Forwarded-Encrypted: i=1; AHgh+RqthrPfsm9zCUVfCD/vVw0uzY3kFcEwXFXQ+DRgg1BUWOjN3WBM5X57kLTbxAoTStzn/9DNAl3NHd1W@vger.kernel.org
X-Gm-Message-State: AOJu0YxjD2ylUVi4c0kWtYn3l2GnNOLk9dPMCWyfZKV1gTGU2iMUEuq8
	0bx21MCJwcjXKCGya8rhACBIK10mbcu50141Dm/zeho/T7ZcwoLCjdw2rP7YeD8QNqb+/D/iV6u
	A0nSkgwLIKZ81KZ6G2nVT6j0lsfefZoQFPgvXWjqNHlIU6oBLtoCrWNaAXt7HBjHVQCBYlh35
X-Gm-Gg: AfdE7cmfwz4dZFM9IoWZJQMN5kxLcERj54dGX8PxT6fGXIwmAntvNmA4A7XUgcVPmts
	fYpGandKMb8StYT3jRdQ2Vr4BSSbFtkujqHSRprDylfFfuyuRJJGWf8kVpyC9bIwI8G3BymhDzQ
	A8UsYabkh4SNd+cSzzxhp01rSKyiFt5ofNme+uhpT1aONdhxursBBPqFvtNyVZL8EnaA3a97ZeV
	8yPgWqHrbv9srtOonRTaRx/+aS2oDh83efVp8ML5jobZK5Fy/7WvP9xLcqIzbayd+GKyxVrhOaB
	t59fN9N0E2NVEEaUCHWgSHja+LemIkYRlIALGXWc8Af+h1+nvDVyECncBHuWcNiEl7ge3aPU5xV
	FbQhsUAeWef4AOQovRZ+drwJRW9fLVyQTyMItaBRJKPzhOhP/eEqcJzAZBRplKlT9AwR1DC0=
X-Received: by 2002:a05:6a00:32ce:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-84826d69104mr3873758b3a.26.1783411360038;
        Tue, 07 Jul 2026 01:02:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:32ce:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-84826d69104mr3873725b3a.26.1783411359467;
        Tue, 07 Jul 2026 01:02:39 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6ddc974sm5061005b3a.60.2026.07.07.01.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 01:02:39 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH] Revert "dt-bindings: i2c: Describe SA8255p"
Date: Tue,  7 Jul 2026 16:02:29 +0800
Message-ID: <20260707080229.3795971-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA3NiBTYWx0ZWRfX7Z4vFSCHo1Ui
 8ChFSj3JTdDCGABE/Q/RRlVwUR8ap9b0/K0++RPzD5TIQCfRswz0KL5P3yROQPRVwZ7S5/AOe8f
 b51tRX38pwccJhMHNWsjApKThgX3UWIBp7ka8pws41/FPv9dyhynthK/bEbKEqmJ2jIIYPzg8gm
 fz4AUssoUFvMwV0exSgispLAmwfnLbpuYMDmWWqCNG+bPn0Vqnu+Zz+M7p28IV+ndHqOx3k+f7Y
 AaItijbcyOnq35UUSjRdtTnBFQ676f8M4oiYEQJVL83VIOmPxg6XncB54MIv7AfLAg3+ADpMlrS
 GBNMD0ZmBmvc4/gj8KlhROkJ4Tk22NFKaqyswZEn0NZ0CALsejGxZ/HxTsgKu98K+sbQRrbFQ8x
 JgJOwnKknnE8e93INz1lnsogUaRjW6a9C1D7WCh2gIFxRK5wR0ZLdu8qREUir90S+hDvzrL9W9x
 n9gU8mjBv1qaeWj26gA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA3NiBTYWx0ZWRfX2xUKncqzrEcX
 LOkswzjrcaNZ2E3pFQPiheFeEj5bnnh0X4eSW0Aa8o5M/GFfBqaYsdDXACCivSmhaIz3PiJCKvI
 OxejApUPLisnqcsavYNq4j4GuLXWquw=
X-Proofpoint-GUID: 4Ej3joFkUnnAyXxQDk9z0cnFdsMpUXX5
X-Proofpoint-ORIG-GUID: 4Ej3joFkUnnAyXxQDk9z0cnFdsMpUXX5
X-Authority-Analysis: v=2.4 cv=HN7z0Itv c=1 sm=1 tr=0 ts=6a4cb2a0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=uNDNTEcSI2xEzEqYS60A:9 a=OpyuDcXvxspvyRM73sMx:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070076

This reverts commit fd359c0272bb4078f3a7ef34c1d53ee0deb59900.

Compatible "qcom,sa8255p-geni-i2c" had already been defined by
soc/qcom/qcom,sa8255p-geni-se-qup.yaml. Revert the change to avoid the
same compatible being defined by two bindings.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/i2c/qcom,sa8255p-geni-i2c.yaml   | 64 -------------------
 1 file changed, 64 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml b/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
deleted file mode 100644
index a61e40b5cbc1..000000000000
--- a/Documentation/devicetree/bindings/i2c/qcom,sa8255p-geni-i2c.yaml
+++ /dev/null
@@ -1,64 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/i2c/qcom,sa8255p-geni-i2c.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm SA8255p QUP GENI I2C Controller
-
-maintainers:
-  - Praveen Talari <praveen.talari@oss.qualcomm.com>
-
-properties:
-  compatible:
-    const: qcom,sa8255p-geni-i2c
-
-  reg:
-    maxItems: 1
-
-  dmas:
-    maxItems: 2
-
-  dma-names:
-    items:
-      - const: tx
-      - const: rx
-
-  interrupts:
-    maxItems: 1
-
-  power-domains:
-    maxItems: 2
-
-  power-domain-names:
-    items:
-      - const: power
-      - const: perf
-
-required:
-  - compatible
-  - reg
-  - interrupts
-  - power-domains
-
-allOf:
-  - $ref: /schemas/i2c/i2c-controller.yaml#
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/interrupt-controller/arm-gic.h>
-    #include <dt-bindings/dma/qcom-gpi.h>
-
-    i2c@a90000 {
-        compatible = "qcom,sa8255p-geni-i2c";
-        reg = <0xa90000 0x4000>;
-        interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
-        dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
-               <&gpi_dma0 1 0 QCOM_GPI_I2C>;
-        dma-names = "tx", "rx";
-        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
-        power-domain-names = "power", "perf";
-    };
-...
-- 
2.43.0

