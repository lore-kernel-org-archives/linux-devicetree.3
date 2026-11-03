Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679510;
	b=P9l/jruYY6UnOXzPIEgav9izp1hGHx0aJvtMOfHAS8utkWhqj2C1KA87r/2BbSld43JK
	 XYkCG5qehnbCTqzbFVsm2TSeYn6UlYS07246k7TdBCh0qUzVWPNRaGZqewamy3v8L5W9u
	 GpP7idKdeoxScH4KxwJQSSk4ilW+7pVoaPfw2uptJmKCWvV+6kibabU3JAET6W3bwKwUf
	 NNBobzH1cU2d8BQfWGKszD0Lj/gzFKAzDCjycgSox8yBUyn0JglAj9GoFBHVNsHvaBm+P
	 SgMIq06CsMqLDLgEL8WldWRjFYtZE+Z31rX9G9c0qDbMzQQahhwW0uYMLLmolJWLzJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679510;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
	b=csCuoKdHmXKAFy319+Xt7crt+JGap5rBR1B45Csm7LSpmbJt3y7anpEBAMAI6YA5dKre
	 mF6xzBT/IoL1eJWbZEXBva2/Omnk2/P5pgObs2blgV/GBi/18KZ8+0jOKVWaiRu7xo6rW
	 ElRE0uC5UV7ENcai+j5x2mhR96g2SO/lClO5S4vXpix1isyjGXc/ZJxJwQfXvKUkomya8
	 0eAuVbQt1N4uDekn/EmY91TjM3Wowhz8BKl2H92fVSiuWRUwSoXQGuFouP+Uf9xkELbMz
	 sC1UN/Q86Bcc4jZaN8SuryWnve7ErmibfvI/fSLM7wThGqcLSE+FXXYLsTBh4fmDs4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gL1FLBrJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clvyGhB5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78AE606A335
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 04:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E78AE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gL1FLBrJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clvyGhB5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32ocmq2608996
	for <devicetree@vger.kernel.org>; Tue, 3 Nov 2026 04:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kA7vRuxICWw
	iYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=; b=gL1FLBrJsYgHsyZl2GKn2DigmGW
	r2OpLEPVUWDvF3Zg9yWSSqjvV0KVLjsocQCl9suKn2683H3Y0UCEIfitjhMKUZPG
	1Xy3zILY4bbvcWZBsM/JkDSlySrakWs6gVeCCwWs/7uPfGgUUs6TbjmVY2TxnZtK
	h68rNPyL0eLhejZZHFGguDB/114I6XyIYhSI4jvCto2w/TtEtR6btydhSHZwOPd6
	F3iKS0zdwja06+vhMdwAphVWpTZGSOE4u08C0KSyZHHZ9tc+a9ugd+LqpupPQBtZ
	JbqNc2EQnPmD6mAy5TDNIIp8+jIp9ToFuINcID/LT+ie6DULeiCo6E5WcSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d89d8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 04:18:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so15950275eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 20:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793679508; x=1794284308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=clvyGhB5TprZZJsZiH+tr+NjrDlQgpCUwuRCPtEr4uCWtl8HMZdhKCMTVyzOy3sgK8
         klpOaNkFhtU2VztLA9I1XeNFvGH0ie0lI69BE3tUKw5miVX/BCePu4M5fupis7BfwI0f
         T0YXI5YeXjZ59+/Ul2sPSxy1p2rpm5hYh4oQ9lJq0OXp20Lv4HRdpwVSTECYOdxl56QO
         bARujjDPFsqSHXZ6KLoyGxBi44NyeQ3eCmgKKkVnkOry1lLboir6fuwx1koaZf8NV1RU
         SY2uzcu8CCfYwy7uE3c3shOKVOAcgwU7hC3sG8LK9PjkgE9vvFjOhdM2MmAmeoRcMxa2
         P3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679508; x=1794284308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=C7AIEO9aCfl/h67GXXqJqrHXsCFFJ7dKrcXAdH/zwPYKffMuOfA6X6jjrBIXu2vz+L
         D9J68w5sXV7VEyo/x0EnHBRnmM+nC+tCtyK4ZN6hyxRVrPjhHOe+6YmsBNjLWujMnrjI
         k9LrxMDeyWZM4m5sn4Y/dgqVnEZAgm1xieYgwZYVggZ7y8fNv8hC6vrvqzcViWnBxNCo
         EawhpjhhwrwSIlfUjabGnCqs3OdDluClxkVDs/obpnruAGi13qSanJCckK7WgKTnPaHj
         HHD/Aafm8OnYr9wDVtxIIJ0u+IehKzHF2AjBxo9qRn52pAtqQZL/s/on4DQ+ao7f9c27
         ssCA==
X-Forwarded-Encrypted: i=1; AKwUvBxbpGZfFFrv9D/F2DOvniDAL5/2XDemdNL0eR0FJLWvST/bdfJrgKUmx/rJutk8hL4VzlxrWRRWwxEk@vger.kernel.org
X-Gm-Message-State: AFq9FYIvPdxotRX8RWJ/jADc1mdVAT3Akr7Mu/8YvbgVA7lnoGvUbmwQ
	F61+Aw0Kqgirvtu06SjtEp0IZiJG6obsidaVTjAt0BngjeX5bm8VO6ry5N4aRI4jk8gjkyIQy/j
	Q4wFe8Y7LctWMXQBKVi+38s3KHrugcnhryTxCIBTgesaNUFaWwvkO8nZf2KAe3RVh
X-Gm-Gg: AYBFou1KvSO7iYKJPzID7nqyC1AWuMYkK/PfpnWSp+HaFQFHEy6ppaEVhIBbVn1HvOP
	R5oZ5A/rBxXO4WmoKOw5T3d8lE+H4I5SbC8WkVH+YhfEgAEtvSjW2XO2cGerNurGILGenAPi2aO
	Uc3ipmCjpNfyhq/5Bun7MP8YWtslRxcxrvAGN5ICHcKaMPX8ppQBbaW7eOzTY21P5z6CD+Kt7cK
	fZig93TGDc1kYws1R+S41Du8Dh0SgrnkH9M6DK7sPoCJ3vC3OMyerHMz1pHnejgAaR0l3gPcDVi
	QdWD6WI/pBLLRLyg19IYwxavrkDELyyj4y2AXG+vxpnsnVwXBwmLsEpKVyb78yEWmauvLcCAqQd
	v0zCt7E3r9+xKphCHwuAAwIm+dQF7UYLSJQbs2gpjdznIG+x5ckIholPfOkR2MPuvM815sfyxLL
	azvANJ8hMdzuWjsLWvtTQPRaFvWHxm6tw0
X-Received: by 2002:a05:7022:170c:b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1aeabd0fbb9mr11594659c88.38.1793679508188;
        Mon, 02 Nov 2026 20:18:28 -0800 (PST)
X-Received: by 2002:a05:7022:170c:b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1aeabd0fbb9mr11594623c88.38.1793679507479;
        Mon, 02 Nov 2026 20:18:27 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm21701617c88.9.2026.11.02.20.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:18:27 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Tue,  3 Nov 2026 12:18:05 +0800
Message-ID: <20261103041806.1885974-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
References: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae96095 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX9ObmYqNEfbJ0
 n8cpKMU4s6d9n/5PATdgrl8M0PuuDEeKXVg0UyBWghPj/eWQ91byZHL/GocJKDbzMt1QZvSlKC+
 AOO3+zW9SI7xSkEv6j66nIs/9QB56tc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX9K7cB6vY8NvQ
 JXeHbToFZQfpv7OHUeTTFiAqoykOoUevZ6Ifctg9W1IyJ4glFSJBn4leboj19ln+sHoOL8XieLU
 R/ZrGFbEGDxU3/J9GIYX32DD2pU20lBzXJj7zqWAFiUET6c0wKp3abSMx3pSo/19Xgunzn17Icp
 oBsnc5P6ov4wEx8WyyQ23g4hZprJcdzA3LfRq5gkERCNNOmfiWBTPmHzDrkjjOArp8Hh9Y6H8WU
 LaIOnVq18aEm8Z5OE7fN0/1GLF3XI+E0g4+ntMpyS2wWBeUso2+BxEh5NPq5ygF+S1u6nwB0Zek
 n8RvAKh6sT0HVbFI3reowdLUCXfc7/+pEpNZQFpAaLLCwTXNCYovQzQm4Ll5E74IZXynLTxXZdr
 zZO2Rvqvp4tQQt3eZvxE9ZuOC/4AYC0Hp+uaIYx8aSI5xxdmqJrC+RXQb9Tdh1sz3Ke1KbTqI/I
 1u/jt/E2cpVzuDXu3vA==
X-Proofpoint-GUID: PCfYVO86FzbCNqvFVq408BYEcz0CNLQ5
X-Proofpoint-ORIG-GUID: PCfYVO86FzbCNqvFVq408BYEcz0CNLQ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030016

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/usb/onnn,fusb15201.yaml          | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml

diff --git a/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
new file mode 100644
index 000000000000..09f2e964d3ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/onnn,fusb15201.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: onsemi FUSB15201 dual-port Type-C and Power Delivery controller
+
+maintainers:
+  - Shawn Guo <shengchao.guo@oss.qualcomm.com>
+
+description:
+  The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
+  controller. It runs the Type-C state machine and the Power Delivery policy
+  engine on an integrated microcontroller, so the host is not involved in
+  Power Delivery messaging. Over I2C it reports the attach state, CC
+  orientation, data and power roles, faults and the VBUS voltage of each of
+  its two ports, and accepts commands to initiate data and power role swaps.
+
+  The two ports are described as connector child nodes, addressed 0 for port A
+  and 1 for port B. A board that wires up only one of the two ports describes
+  only the corresponding connector.
+
+properties:
+  compatible:
+    const: onnn,fusb15201
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt line shared by both ports, driven by the I2C_INT pin. The pin
+      is active low and stays asserted until every pending interrupt has been
+      cleared, so it has to be described as level triggered.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^connector@[01]$':
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: usb-c-connector
+
+      reg:
+        maximum: 1
+        description:
+          0 for port A, 1 for port B.
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#address-cells'
+  - '#size-cells'
+
+anyOf:
+  - required: [connector@0]
+  - required: [connector@1]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@50 {
+            compatible = "onnn,fusb15201";
+            reg = <0x50>;
+            interrupts-extended = <&pmic_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C0";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                label = "USB-C1";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

