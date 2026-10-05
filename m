Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995A72868B4
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 16:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218764; cv=none; b=LuS62ukHiwwbwC0L7ChN0NvzK8lS0DtuMcFx4ZLvXs7z15YvzN4pzWxwqmx9XYkc3S10xKzjBlFZYtkafCRpSdU6YISMVhJvV8YUfyMKSi9ZRFvKykRnJBDGGZw1Q5/QUELaAeDK4lUuc7Bbppvw3wDn2gNC75gwnagVvdkeAXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218764; c=relaxed/simple;
	bh=vuxpQQHSHpogoXgcj1g6nYIyqWnif7Aqe4zqMtU2VSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hup3uELeON13YXSzW6C2JJ8T7CjyeO2eBWs74xrbhJWtaAvDylkyiBeUTqx5B48ob7Zh8TIBBXSGJC3wYrP4fLaEniylZqBwgdP1UMkDQSmt8DwUpRuRO0T+JqQgvOCwy02T4cyozZhr4rA8/SWD1hLnUrhC8vwcbQ2uDyV55MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RVdadjHK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bAwVzQdz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RVdadjHK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bAwVzQdz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695EPRJw3142428
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 16:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=; b=RVdadjHKRDFdePLL
	+B3B6fED203OnFhhjYuocbbf9WN2gYd1eD6mUm3oA7wa7T/vR0qimuJJ+Sxf0KTi
	hjdf57cxmIAnK7zltI1nHqPImNvutUsX2IjrEchEBypCl29TpHHt7hmNWYGkDJJ8
	ctCptH2n/6imq4Sfr2gvI4pB5xUZ2QlX+v1BBG/n12NIKGrZIl6pxwjkjD5YMCid
	htIrsvqUDthHhKnhOBauqnjROKe85EQaCYZu3WukUXZCjvqfexj5RlthcvE4iPJV
	/sj/14kFVKwMOCJqhsrG+KYQEDmMKo3OVA3Fo1d77j5FDhP/0YmiFEJxqAMXorXT
	zvEInA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49u41h2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 16:46:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2d83bb68cso17667845ad.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791218762; x=1791823562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=;
        b=bAwVzQdzi/K7UAvO3VtT1FcKRerQol2DmLtgQlvJLIAQRYUGzFaJ8mWHc6H6XPeCEJ
         fhP1Ip5odVQ2gre7q1fUiLOmNNFyVHTmqKoKdfBUg54HmI62HggEnnYQeEZ6ZkSZ1pSK
         eOxipafOBS+q3pgp3bzUzd16Z/wU6NRddyG78sddAbEelqqT14zYiGKNzzTDOewK5Yt1
         uUF1Hqu2fdZrc44/vdeMFDqPUwjlhTR0oKhl0PapRF81ZDlgJ0WnXaU5tbYHZWqmDhhI
         LjZkbnf8p1YJ1m6wM5lZ0DD0brTcLzJe29sp2mc/CaXHarhtGXPm+tIz+cfStGYpPEu+
         KM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791218762; x=1791823562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=312B9C6n0UKKu6NJESvzkUE//S3M9JdnPEV0pkxNzjc=;
        b=BFgn01C4NXbbFs4f9rTEscullPBQilHUlBt3VJaSbIPFmvDysTeHDA4gfYc/kiRvvM
         sWHUKINKsJdEAz8dMJnHmSF2TwQDAcp4ZIS9zqPaYiKnIJ9PI+CzrdYzVmvdrDUujrB9
         ZPp+iBLM5A8pTBtU0yLwrp5msR61qVkV0qd+auKYR6LwfAUdtiIv1mV9djtkbEUSXBbf
         NYBxCY9GSVWva0MUbOhZ9MP76DEVZw/SL4HdU8aXjblP4xKq6iTgTToT06r9ndtaEdA9
         b+LoUZgVcjRh9FcZxWwFOjQ7JvrbVeRN4nqoR7VKhW3bTDZa57A3s1dj7bNYJmv8IpOx
         75sg==
X-Forwarded-Encrypted: i=1; AKwUvBzDpBgr+7609Ag2W2gWa4iogwGPIqbe/F3CsmjfIigXXVDq9SvwulEo1lVD/1QcFgZ4SD+g83dCEghS@vger.kernel.org
X-Gm-Message-State: AFq9FYJqiwmnvlwDzhubMpUBSDs/JCTYquLOqMfDp6+vQzxQlWIj2rif
	YbyOcgCJpqIyDFQ6PTA9DZYUB29/eb+gC3k6lAbp7MW/LKRZ9zfjCW1uIlQN20dWZWdXlsJNjGL
	2dSN72JGOh+id2oNW7ingyhka5oh5elR8i8mpQKlU/BFf1PbXJs36APSiP+9npBty
X-Gm-Gg: AYBFou0T6uyxLpDIn0nsed1Nvg9RnFzKW5c1uetEaeaxXkBiWOmZHAjMcsmJKjuQELw
	jXEyrI4exKQN4wG6KoAWh5/Q/QGI08cFBEapaovzRD+2T77RHQJhjdaL9fyA05yBlc6w+vNYNNH
	6wqRndcr2dp5iK+Izd9dl9azXLSwi5a2ul0S0JXlNYwLf3a3z1BgQkxlDmB8WsnfMmS505rPSSg
	yLqL53SlXv5eq/3Um/73wF3Zh5uOJi1NVqG4l1JpAqEuXYYq0jJFTbU957f5NzPU5qh0uqb9c7m
	Oe7wrL901614AgLe0Zud7ptpc90MqwfSKvOD9mqmiygke2T2TOtwc3n+GOkHgwxzaQwXBjdUM/Q
	xdxy1mzXExm07t9YSPOqOH2T8VybbBdRw6Ug=
X-Received: by 2002:a17:902:e5c6:b0:2e2:d77b:e584 with SMTP id d9443c01a7336-2e49b652159mr106114175ad.13.1791218761883;
        Mon, 05 Oct 2026 09:46:01 -0700 (PDT)
X-Received: by 2002:a17:902:e5c6:b0:2e2:d77b:e584 with SMTP id d9443c01a7336-2e49b652159mr106113895ad.13.1791218761385;
        Mon, 05 Oct 2026 09:46:01 -0700 (PDT)
Received: from hu-vdadhani-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a55b6161sm10665605ad.1.2026.10.05.09.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 09:46:01 -0700 (PDT)
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 22:15:44 +0530
Subject: [PATCH v5 1/2] dt-bindings: i2c: Add Qualcomm I2C target
 controller
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-i2c-qcom-slave-v5-1-6254cc7c08d3@oss.qualcomm.com>
References: <20261005-i2c-qcom-slave-v5-0-6254cc7c08d3@oss.qualcomm.com>
In-Reply-To: <20261005-i2c-qcom-slave-v5-0-6254cc7c08d3@oss.qualcomm.com>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791218753; l=2790;
 i=viken.dadhaniya@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=vuxpQQHSHpogoXgcj1g6nYIyqWnif7Aqe4zqMtU2VSg=;
 b=qlo/yCL/da/k8bjEDYuBMYX8DIv6a6sleDD8q3TXdZR3mAF8G0KYj2LBdEmYA+ZbNAkcN8WRj
 Wukk0S5AI/mDx0fb2LyC1o8vBh3NvLCfosD8tAAlALF6Oz+bIt/eOi6
X-Developer-Key: i=viken.dadhaniya@oss.qualcomm.com; a=ed25519;
 pk=C39f+LOIGhh/02LQpT46TsUSXRvBn9qXC8Xb26KJ44Y=
X-Proofpoint-ORIG-GUID: d1r30NdWTiXDooRQNMlPbd_tvscVW52v
X-Proofpoint-GUID: d1r30NdWTiXDooRQNMlPbd_tvscVW52v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA2NSBTYWx0ZWRfX1clZ5jdZspHM
 n/EU6HOODoQs/7vE8N5TuuhPdsGBfEd+/TrVriZ3Fc4mJ8vw6LZRz2as2xJNj/s/8zAFccf9NxP
 sOOMX4Q1adrfKuoZgamKUIE76K0fueA=
X-Authority-Analysis: v=2.4 cv=LuEHWXdc c=1 sm=1 tr=0 ts=6ac3d44a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=64-jBHeFNbSwsrqMnDgA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA2NSBTYWx0ZWRfX3zfElLdyAVvs
 7LjrmJSu2T2bs3gAzTlOM3RGd40+C79QO8OZ1FYI8izmsfdFr/GZ7mIZMutbvLvinFbsgjKnHY1
 sXplVUu6SrtXVFM7/8f5RGIP+yVB1+pDn+kJOtK1uIgiLUTGSlngRt0MbYGwREt49rKYFhiTe2q
 zvJgjJs2zCzB8cG+TXP6M+80GGcxwT04d0ryh/5vW89obOMQkelU7gcbR7MEZKv6uKY73SnExSp
 qqgJ6wJ/Q1pv4B+/aq7GK0B+U94R5plJ/x9ub3zpoat2Y236seI8ueuLP22g0TsT7UfHVebHAYL
 KmqfXTN/9WF/7vn+S+gnpt8ZWimJ6Ddc0lGs/Zjon7Ozlb3t3gh2dH9LdJtezadcukiwklfGOcb
 cws45glot7/KVlnDdIjtdUM6YdkdnM55vGPrGKyRv/j+wVJSQMZlAHKhM+In8g+K2NyFc8VWc4U
 kU6gJ58X/mpQhMVm+Dg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_04,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050065

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

