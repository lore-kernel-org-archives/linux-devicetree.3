Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618273;
	b=yb8QOt4m4ksEWsj1+2fcpGhbSzpiyJfooJv9EHq19xEeySonbHdcrfvd0VscOOe084at
	 fKuI97W0/P4x3lcFW8+9785cwULJZ9Hjk5HJjDy7GvMV8PMOasbiE4bYClJ3UJ9c5vwFY
	 lmrrfrNKmgSF05eovCbyrcWCZXcKxl1e4iWdPeapXm8FQZhxLQFeGfrbykw4AdQEi2Iey
	 XcRW/VIasU0QDVNUY9q1WASWxbJz5YKxwHmeOcekhrBUIYwepa+QAg1skPSNaHGJSVh+b
	 uU2/pkKPmtQUL0crDL9dRu0O20HYyWOZv+BZIyQ8U6/OA14FPD1fwb7Ovu15TvliNtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618273;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
	b=CRpyYxVWiRbqZsotiY+KTURSZPvbyAX5bT3vzufnyTH2FAbT4chUKxG+parUPsDixhUL
	 Wud/242S+QgF1nDhaPecy0g78adpb6kyQ9eOcYWl5Rlj+VFUgTJiqK1fsh3w+ErdPzVX/
	 ItUIUXi4jQOTYsTI24bf3tig5oEsfTxO4cY3rbYXzaAfCsGs8CqDdLfhXvtNFVqdPCOLf
	 hWJcYUFFLRhRIwRAVaYzfrKk5D0r+B+zPx8I76PDcTKMcz3Ta/roEv2wNwdl2xFnBfJTZ
	 v6w0mGPYZtzoZXHKlU1W4yzj2qhqTwIk4dPk40Fp4IjGOYwh4Pb/UWmLi4p7VqnWhlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NPpSuRlX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kkdvSISR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8E1606A333
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 11:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C8E1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NPpSuRlX;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kkdvSISR
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMHr1821122
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 11:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kA7vRuxICWw
	iYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=; b=NPpSuRlXxddOHdI7fttzpZFA9fe
	0M51XwzH1AcMfO9hmt5MFhtqTPjan6HaTaVSykGgZcf8M/3yQeh8WlakFtxhgxtm
	wdzET/aRt/8a4s6AbL6fpQ7sJOJcZw1PBPHpJ5iWkquM8I/7TgvBJ7RH5OpO2uCI
	8MPTErBhYHK1bb8si9IL7K+//Ue/u37N9a2yIGxIh0ggtT+fU8K0K4w1n2R2DIG9
	ahJnUCdDbpP3JQ8IjBNCKNCCmZLHoOCNhIWE331T6tufhZ1ECFbZLhD4Uha84BVX
	Eyt4eC9SROAP8w7PteKHx4J7hyFmhKIaJU0okcLC250xCUpRjXVZj4WmWvg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hdce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 11:17:52 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso6917331eec.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 03:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793618271; x=1794223071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=kkdvSISRCasBYcLoKVAjp5C2F11QyxqaQbGsZNXHUMpiFFKSMnYwryD1l3obVSwife
         pkQsbM5zS4rzO34p354OUmnwueyadMxHCF/6b+EdnM8Pe+RyBEySFnstqPRh3NozFKmf
         zp1lT2Q2X+jz9eJlt8LhpvmBlSE7/mnnzhGVBUUTlYWRz09jcY3Zf2qZEJ71XcAF7Y/e
         xLaVtAc3El76XSLVMF9LWg5QKFA4+3r4PPaiykuuTHNh4azYLUbB66OYNbBB+rrAtckV
         BCbalAEUiyzKLTgH632NA325fSJSaqWCf1mLIejL3skI5KBdfghizsnIcxptFAtcaWMV
         tKyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618271; x=1794223071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=DDcBL1DA9L//ygM7YRwJBv4KijZYVttWlCZ6h63Qpfa2+yWABSFvnraHOsHT+zlT2C
         nCcApFeSERz4D1TcElSubqN0280SELqLrPBhW+9Lw6PrB5+E2wMRk6RdbWHnPD9o390P
         B9QpM77gc1DzhwDsK4c/GBUOW2qTJn7MrKxVo/FE6M/oEBOCFj2VxPx7JZqWI8NNDijY
         IHbhtQbHxfWncJA96sbTrSRqyHR7S4OgVVLqPEIFa3AmmDc57EGSLI3veRa4FSf1+n0i
         Egf82Qfw3rX5+FhDgQY/7v+vs3b7e2dIgqzzngWK2P0zY2Rjm3IhS/hUvWfX9U1XkLmm
         x8ZA==
X-Forwarded-Encrypted: i=1; AKwUvBwT22A9guE2TP0m9+295YP03RG5nGp+QIZLRbBU2qMCRJH7HMheyTHHW6//wJVm9WmznBM++IVQYgDB@vger.kernel.org
X-Gm-Message-State: APuU4Z/jHAjilae048q6Hc+Idd9wN6PRO4ocEJPbVAkzo8upf27ivKqL
	bWFl25s8NinWWocdWTBdUJXPEcmQyLW1541bjk1aT3UomHzE7SOztEoJGHC/epuPgkF7ZAnnSdI
	a3uhQxYqdJnao0tkRhNQi8/mDOd5WRnlH5YKNlY+JF1oPPLhEoP1rkn1mDn1/guZl
X-Gm-Gg: AYBFou3mElwoqIuAHXquvueAzritmLtRTH91YwdP1w+oMCUdvWCrS1RegKaa0qn4Zf/
	rmdYTNKmjIRLcs9j/PoJrPrXJYxHFbmb5JRzGjQfe3q9z1ovNx4XtMLeGJnDbe1sVjUfS86hVA4
	CYSmT26D6hDzDLmXmSDShu52GcskqEmugLrVmaHkTQmT7J+vxGp0XnG7kj9+Dah3aGHEeZd0IlD
	LaEMH9RrN2rPXFLAwLFLD4p/MPdSXPFIUwWL610oGANFUCNsHtMpcAeUACgqKfdOXUs17QyE8Fn
	Jvpf+ZM+saWNVnP7BLPzwU8bclm5P3KnWBYKu1KYYvkd8ufTcLul0oy6vqavlj+TKUUAe/UQgz1
	SHx+EfJc9G4R/p1IOCgj9OjTqTsTh0lRyvu5NkUOZsijSJyc963xZ/IKZdoi7YFeQe7FS+B8m8o
	krrh8y9NvkviOdtHH3zz8mrZclQ0FtAP//
X-Received: by 2002:a05:7300:4f24:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-36a422224d1mr13572826eec.2.1793618271176;
        Mon, 02 Nov 2026 03:17:51 -0800 (PST)
X-Received: by 2002:a05:7300:4f24:b0:368:40c6:3a01 with SMTP id 5a478bee46e88-36a422224d1mr13572778eec.2.1793618270533;
        Mon, 02 Nov 2026 03:17:50 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a5eee0f20sm16492078eec.17.2026.11.02.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:17:50 -0800 (PST)
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
Subject: [PATCH v4 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Mon,  2 Nov 2026 19:17:30 +0800
Message-ID: <20261102111732.1678646-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
References: <20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 3AKKPdqcyymZYa7OVmwR6qbLBFehIs3g
X-Proofpoint-GUID: 3AKKPdqcyymZYa7OVmwR6qbLBFehIs3g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX6q796D3/+V3/
 oPTsTj/NuM7FHHn1CsonlsEn58WyISIsWp3fsSM+eWdTa/Z8fWehKKsMoUYk/MHOWHWTj8P78Jm
 bXhsKX/J6x5/npclXQQFxv6RQHyH92I=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae87160 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX2h5ZjG0BFYWb
 YqIwm6yqh64tMJ/7FYF01VvCkaYlLQgbS46YPwTyRbZyZHlK8BDonS8UAfSEuxtFaw0dhpXD6oi
 1D4waUV4FWPgpbJfXbAaw8xI6AJGono4Rzv7DRglVACKo6LVZ25cGzy1MIwwyuixyF57lwDb2M4
 mySbtmdLyD8jcD2xZ3TwjvwMfTpXmdet8m0akGpDtgQ6C8fWuYPrhPP75u8UWSSrGfxOANrmoTi
 E825eBV1NkmmG4Bdns8gYQ+ahQaqlv+eOufIMSgy+gvQsf0ZCtu2tTwGpe+nCiAmPvo8bkVxFnd
 nxPQp1O9Dy9W8PlOrZe8t6IyYry7wC4N6t9sjs+VH/Pyxss3UANTkd0ZucvBTIUZWmKLTbXASn8
 oUNiRM0Euy6U37b9ILDonCPrgRd1nu5snKI7rJpUmkSO+3ZtN2oRNq/fRttzBvbwWiLlXcP0Fpq
 adjSckt4c6fykTmj1qw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

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

