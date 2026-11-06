Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962467;
	b=MIMUwlU0FswIIpMRSUF+5Ig9FxqGs/gXOo3LcKD+pfbZIt+nQ2UJ81Fj/58VxLP/l+eq
	 OpfJMSsTl3QSRHzsHmqtEoLb/AwmQt+7Y9mggTEgha8BRy2PSjBRHspgxwL0IVDKXekR0
	 xw/cKPjgJibSIDIY+1B4kzDUSf+pqUbQviWzemwOoeBP9KFbOryWipmJAPYVAz92wIkW2
	 1zRcrvVKgKcFU6h8DAN1Yue1y8cmv2IPGGB5H5NpEsvQMHm8xUcZkANy3EOMVReq33T1C
	 91WUJcPofPvdhYssSDpvFKVXufHUZN+jrCNrGJAXqd4reTG6O3h9s5OY3KZHzp+6xrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5NEqsMSr3pHjqorQElx9gtqmjSxhKtX5m0i+RDOSZyI=;
	b=N63pVEIny1qeeRNrCfgqOQS7rFdLu4HD30uUO4qjaHtZX8+dsBg65jXFLH2WXNUZeiIa
	 PAdn1MJwmmDJ3NHrqB5hQX5+R/aWXDF2hP7hmgHXz5Z/1ICdbc9c5XZCd64yu/nkepFU0
	 F5d3NDGqwBaEZvnEf0tMCx0NIQLn4J4+k8TCItCZANVSDdlMDTsDDywobIlgCNDXlRija
	 CzqpRjbN0ZMg4+QVFQrwhhu7dBBEI/GnR61zN4i0f+2EVCX1H8WpLsIkb5qNGMHzflBwK
	 +R/oP2R5qOLPnCkoyvqhsTF6anpaYlKjI9C3Ty2WsujDoyGmZFEcWV7y4Ts1qZC74GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iD9Dttiy;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32DCD606A332
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 10:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32DCD606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=iD9Dttiy
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so6199815e9.0
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 02:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793962464; x=1794567264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NEqsMSr3pHjqorQElx9gtqmjSxhKtX5m0i+RDOSZyI=;
        b=iD9DttiyokGWik/9lX7kkjGlj6NpUKTvyqyOFRbsvGvAn3SQU7WzguD5EG9JtCHUg/
         /hNC5Ls1yAVelLYySciMLDUyIUeKEUde4sxJqCXcaSc6mNWV/ifUyug7cPQBR03EW4hQ
         SyANdz8UiuD+iTx1FYEEl64Wk+jgc/rsM5YK/dzKMtevh7f5yfZHOo6dGGXrNw0kciHe
         3q0QDYP8XfkG7rQKkfqMPUlfwy13zlF2E4qWDrgrCdsUubVnGcpe9bGw2Bh1wyM1eNol
         5djgFmvx6dEPXbOnCkTQa1C5ZoBtfr/3yCyeWapWOqcPEf6y4x6V6UK/I3T+Vfr2WDOf
         k/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793962464; x=1794567264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5NEqsMSr3pHjqorQElx9gtqmjSxhKtX5m0i+RDOSZyI=;
        b=MrmuDhKshUCYaLR7A6P22PeOUIFV3j3OGzybsqWi0En5hsojx2FpvbhlVym0E/kqAO
         BmNUQIxPsjKsQ1qJSuA2p4bSv1ikjP9P/TLQl8sTQcLkVPgABqqQoLRx84NOq4xhoFkv
         Eb47M09r4rvfjyOCFhdBaVRTfPr5S4Odp6MtEYpKyPTTA9YxbH0WCf7981rVeFp1Bu9N
         YyyKPaAuJBS+TUr82mrvzHlP1J/r90MZk67KnHhyCZS+dEERroSlYL3EWdVcXaNOXLKi
         X/ZMt11DcnxZfz68g7Pk0YATiP3eDci5gideGD7IEUbaCXczLGoZa1MkSOKfa6jstK0l
         z4Iw==
X-Forwarded-Encrypted: i=1; AKwUvByCgf6ceARS7Y4Aerz9BacZYizCDNs0q6Tz0HjZ2uGUKYjui5Gh6PZC2/c8ooAWQTGG7zvyiII4qnaF@vger.kernel.org
X-Gm-Message-State: APuU4Z/ACxm6PXEdfgRUYTCOcLSgAa2d75a4MOWLMY6kTORRr9GiLRE2
	2P0OCUWbTtEh6LADHsDzmG4H2GmfA8BOISqo9EXUNK+6qxnttzD4NextBE9+hrDqV4U=
X-Gm-Gg: AYBFou2LSiMFY+5/gCjyX3S8PKEh9CmbSuw5IkZTzK6hVv6DAfALD//fU6wKK4iqi/p
	DNYDxqU0uc0pnUuIy21BnsWKvV4aVNkQzwM07z8HyZ9p4Md8bk3P83HHoN5genwPrV672PdbPCi
	U4QZiL81QHml0itzefYRnGVrF4+d9KD+kuPDtQRiSGfNAyMITEhibAgmlHvt5tmKeHqAW0QSRVf
	QoKQu+KuyPmns2FTs4M2dndJjMXN1Wi3fPye7da3g1W/wvnhC4ExhTlMFEiEXi23IrbUAhi+jfR
	b4qg4jsrTW4g5jCIYxKRoVgDMidiumtq6Fo12PJBSDgBPHFqYqGyiXzWMquQqcihm9Bs9DB9Pi8
	P6MDuyw8I5wV5SyGsN+yIM0XKmi6hlPspGW4MZ9D2kSq5Hb9eIzUBMY2XwkA/vQM0V6mCY38m4h
	08xpFCEuKdqdvOsFq9gchFHQjNStOA5IiswPB93MxRYSqS7lzQGxDhKTo1y/t9r4Q2zKUgUJlYS
	cXR2b2d3qHsQueYgiWA8Qwz9JHG+WSixCQVIiDqaLg3HV0HpGGhwr2jhgAT/StrrWGZywVOqo1i
	WOiCYP8xdmdOZCWmPNMryVdujJB0AwpwBvMhPYyDy/EdWp+weRIPgd3EmTuwyWw=
X-Received: by 2002:a05:600c:4e41:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4b6dfe8f3c1mr33593735e9.26.1793962464578;
        Fri, 06 Nov 2026 02:54:24 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b571f46538sm125584065e9.5.2026.11.06.02.54.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 02:54:24 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Joshua Crofts <crofts@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Fri,  6 Nov 2026 11:53:57 +0100
Message-ID: <20261106105358.59616-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261106105358.59616-1-olivier@mgcrea.io>
References: <20261106105358.59616-1-olivier@mgcrea.io>
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

The X1600's SAR ADC has four auxiliary channels and none of the
touchscreen or battery engines of the JZ47xx ADCs in ingenic,adc.yaml,
so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 59 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..f5d4726fdbae
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/ingenic,x1600-adc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ingenic X1600 ADC
+
+maintainers:
+  - Olivier Louvignes <olivier@mgcrea.io>
+
+description:
+  The SAR ADC of the Ingenic X1600 SoC, with four auxiliary input channels
+  measured against an external SADC_VREFP reference (typically 3.3 V).
+
+properties:
+  compatible:
+    const: ingenic,x1600-adc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#io-channel-cells':
+    const: 1
+
+  vref-supply:
+    description:
+      The SADC_VREFP reference. If absent, the reference is taken as 3.3 V.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@10070000 {
+        compatible = "ingenic,x1600-adc";
+        reg = <0x10070000 0x1000>;
+
+        clocks = <&cgu 28>;
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        vref-supply = <&vcc_3v3>;
+
+        #io-channel-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 0017755f593b..4ab4ae67f788 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13176,6 +13176,11 @@ F:	include/linux/mfd/ingenic-tcu.h
 F:	sound/soc/codecs/jz47*
 F:	sound/soc/jz4740/
 
+INGENIC X1600 ADC DRIVER
+M:	Olivier Louvignes <olivier@mgcrea.io>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
+
 INJOINIC IP5xxx POWER BANK IC DRIVER
 M:	Samuel Holland <samuel@sholland.org>
 S:	Maintained
-- 
2.39.5

