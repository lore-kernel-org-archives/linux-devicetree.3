Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CCA42E405
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789905859; cv=none; b=Bbab6JXszR7k3BMSRfOEgX0YtHnwLzjHHsYkt3f5CTTQOteZsWwFA21j6ey7Rw4kA+naYCsCSn5bOBvQGIYUD14+yrXX9BmoRyZtTFs+FnETLtNfT5bAri90VcAzCDwHovTlHPU4by3YUEegSmGEZzL8bZ7CEEuEYU5j0VFILCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789905859; c=relaxed/simple;
	bh=vuxpQQHSHpogoXgcj1g6nYIyqWnif7Aqe4zqMtU2VSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eAsp1fB160YkxLgieTpTd0KG1YZTEyZJKGe1lRxa3kpR1+AtEvFjyorHCY/z6cewq6/abVVZIKuAqoOp7ZZ5ob0fUjvvbJhm84F6suZ1ogdSgSrfk50+QroVUYw+6jK4MyTMIq8+2m4ANU5ad/1pFbZrS8SFtXZqIVCmDxjr2B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mIyOgh5I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJ5V4qwo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mIyOgh5I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJ5V4qwo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBnptI974577
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=; b=mIyOgh5IA5WtV7T/
	92dSrsoTNguH/YzjbHn8bddUBUnFIfb6GCPXOg5ZsKfATvdemxL9cEfmIG2yp5nI
	79qm/m6LXqFSg4JmwABanhuUVOSqhRGVv4f5neLrfIWgpPHL9XPUg5zj2sdwTAXj
	I2CfadCjsEKKd9d/DxfKbg3Scrr7MoDmK9AW6KUVnPAhv7FEzV47jIDu5EncTDch
	Wq5NNj858uLKI5HsUeOOy9TaXj2kXVzvYOeuYGdMbCyWOaxeBY4Z+r9I8JEG0bTX
	oHNUZzPLGP6fdhi4gUIGfzQQt7Cg2T8v+v5HfNFjY+cGDTObUca7fpS0H2A+UgvI
	6f7ODQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskjk2tc4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:04:17 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso3811140a91.3
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 05:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789905857; x=1790510657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=;
        b=DJ5V4qwoMv/ioTXuvY7HoFEcRorTm74Lr+kP3VN9+6XBTkWJMJWjq9MOBLih3dh44k
         QbSVV1KfPXJ9GhanBcfiyXnOW+U/kJNf+dsMZpwNULUCwVT+BKxRErx+deFHj27iDWjr
         yDFE6mLIln8W2iBfAm940InXwdhtKuYdHN0GeseyNAz7W44a/864f105231/nu1d/ENy
         USBLIkDtUFB933Q1DWOPJDkHAQlZiZ5fDbM7juoUTrveSkV6ntrS3DyHtu3jKlN+NsIV
         TQ2it3zgRfU+x+cVQK96ZXW46kJVb2+MAE9Lmwwv3j/ujXjJ9S1vlWpbUndn1ecqTEEC
         /V1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789905857; x=1790510657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=;
        b=eKPAyeKzoGLNPlQE8fqgGvs8lE+qkQs9YokpNw+TC89gStDNmXWOZ8YZh/Sb1OCPBP
         5dt2EyljZSij/kZVFt47/PFQoIIp0ATLNM9lmnle8hVKNty/jegSxUq9+/WErAgpWApn
         qSJIOIsHKFlCQs7wvTX9f2WGkBP04/EUd1Bvcyve642kQCTMyOCyJ0phGUlXNoimkD7V
         0ClAcT36+NPp2tu2ISoi6YSUsEAD1pgWf626uaHoSOXP12aAlljU6OIeI5yv/3q52nwK
         7rkplIa0/e+MRJO/kBR7HkCbg7dLMSbi/ijooB1XcIUFuePTp940gVYdiUiT9W6TDWvt
         yFiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHajEn0Th9NParxkjCUhsMcKtcFQKM2f2ZF3yP4Iz0dcFbVq4W6XQBo6p2j3R9gZ9t+9THXEhiFYgT@vger.kernel.org
X-Gm-Message-State: AFuF++nuAFpz9L3gOsBLBvBPRn32rrkd04UIhqRCGss2vc3D1gO2fGhY
	TN6JQ7/tY9ZwcQQFLW7DHOU92nfinrWrCp75/b71vXwCAmh3XUKpJn4PJfOn0nVFCC+W1EQf1Sx
	txbUhgTLqqB2MtHXMjgXZLWn9oC5NncZNc6U4g1PzfEdM0nIsGBnj8LsO+gtm00SX
X-Gm-Gg: AYBFou1Yg41mG+bV7AfMnmpNtFi49KKiiDXHxqVAuzTTt4cIHkLzlBjZVXm8iMKJrLV
	1YLZLKUjQXIRPqUYEHiP8kfW79jCLfeetqgLyiv1bsQL/BGQ0zerOLbKI9UKV7ZKSIrkVinl688
	ccUAD8q6vbfgDGRY3VA6n88bnvD+gEsz/pplMVedf4qSEZpoVDhcCNkMHzq7WXPOSYrqNSDO0rz
	fGB8TjgnKy6bJfnvoVW6UMuB379BsDAlUgX4EXMcW6J8fte36ESuwcS3MYCjF3kXGIiKzotq4zh
	K1+fo+xCkFIkdwBrmjWM3l3ko/yGjRc7lfSnghU/4p2dipTCwseRnASLLXqvAyqLd/H1mB1mqxG
	OIWnoV+T96cm5jyrtAYwwkFALEqlO/SF4WsE=
X-Received: by 2002:a05:6a21:b89:b0:3dd:a197:cf30 with SMTP id adf61e73a8af0-3dda197d7f6mr6614212637.84.1789905856589;
        Sun, 20 Sep 2026 05:04:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:b89:b0:3dd:a197:cf30 with SMTP id adf61e73a8af0-3dda197d7f6mr6614165637.84.1789905855983;
        Sun, 20 Sep 2026 05:04:15 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55aaf1csm12109622c88.3.2026.09.20.05.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 05:04:15 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 17:34:01 +0530
Subject: [PATCH v4 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-i2c-qcom-slave-v4-1-f7e1020f3bb4@oss.qualcomm.com>
References: <20260920-i2c-qcom-slave-v4-0-f7e1020f3bb4@oss.qualcomm.com>
In-Reply-To: <20260920-i2c-qcom-slave-v4-0-f7e1020f3bb4@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789905847; l=2790;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=vuxpQQHSHpogoXgcj1g6nYIyqWnif7Aqe4zqMtU2VSg=;
 b=cD/isAtcvTnIdN4rCxFt5vNkUpdNJkaupwoJvyxs8k1coPb97PAwRqJiTWapxKDPtfOgGWB9B
 ZtdV/dhZQi6CPEPQq+AlaJY/KgPuapgecMT7U5YHLlR1J1NLlY/h8xj
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Authority-Analysis: v=2.4 cv=H6JOUOYi c=1 sm=1 tr=0 ts=6aafcbc1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=64-jBHeFNbSwsrqMnDgA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE3NSBTYWx0ZWRfX57dXlTyln6w8
 lr6YCtk7ig0qKswv5QDWyOpsOZ5ZoiMCwxS9+Cap2+FOqnt1AF2Rory0t/nJzINPZxXk4dxbybu
 eteOmGx0GiUTAN16pEYN8oYN/bXsa8pYa1QE044qNW2VqKKcAMEPsl9FLg4vPV9h3kFztQkCi3A
 YvyUhq18fv54c73BpuTgkI/eNvN0ZiQX0f647Eoulz38iv1QcN/rccCKqmPXOJa0jgEAMy4X159
 YBauIu29znoW22FCx97fzTIeWU0gN9vgGrNNy5qMIpFvYlkth1BTlbgFlhyMRcrZwCl618kZ5rf
 wryIGDBMIqjjAl7A+qJsZYZPjyql9ZX/XJkPOV/ikSDXlUIReR4p0Ehcb9bVsZe1/cqXK73W5xE
 66y69O5pYGDwBKnTLTcBqsoRAgxrXymDg2HEbVapHx+80w4Lnv5SJGF9VtYALm4m2wdPpEZzJp8
 XCA8gAy98llN/gdccMQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDE3NSBTYWx0ZWRfX40U+RCKwnXUI
 1gf1o7PD3SYaOnNcA5JytUJQKavkj1+NSQNFv2u7rKtgLzFitM6dZBhd17CcG2Zl0CfSxlMZ/X8
 D3Yq3dV0wuMIrMTC6wXoh13rvKdVn1A=
X-Proofpoint-ORIG-GUID: yRekFmt6vMy1xb73_m7lrCDc-aMu2oXH
X-Proofpoint-GUID: yRekFmt6vMy1xb73_m7lrCDc-aMu2oXH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200175

QDU1000 and related Qualcomm SoCs include a dedicated I2C target
controller that operates exclusively in target mode. It is a distinct
IP from the Qualcomm I2C master controllers (GENI, QUP) with a
different register interface, so it requires its own binding.

Document the MMIO region, interrupt, XO and AHB clocks, interconnect
path, and optional pinctrl states for the controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
---
 .../bindings/i2c/qcom,qdu1000-i2c-target.yaml      | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
new file mode 100644
index 000000000000..9a6b08f0ab0e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/qcom,qdu1000-i2c-target.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/qcom,qdu1000-i2c-target.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm I2C Target Controller
+
+maintainers:
+  - Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
+  - Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
+
+description:
+  Dedicated hardware IP found on Qualcomm SoCs that operates exclusively
+  as an I2C target (slave) device on the bus. Supports FIFO (PIO) mode
+  for data transfer.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qdu1000-i2c-target
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XO reference clock
+      - description: AHB bus clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: ahb
+
+  interconnects:
+    maxItems: 1
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    minItems: 1
+    items:
+      - const: default
+      - const: sleep
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - interconnects
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,qdu1000-gcc.h>
+    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
+
+    i2c@88ca000 {
+        compatible = "qcom,qdu1000-i2c-target";
+        reg = <0x88ca000 0x64>;
+        clocks = <&gcc GCC_SM_BUS_XO_CLK>, <&gcc GCC_SM_BUS_AHB_CLK>;
+        clock-names = "xo", "ahb";
+        interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
+        interconnects = <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SMBUS_CFG 0>;
+    };
+...

-- 
2.34.1

