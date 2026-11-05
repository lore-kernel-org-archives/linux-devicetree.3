Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914411;
	b=Yv8cH9PcXj20HYUoqk7xxbCVXfXf5ZSq5T0Al2n93Vvbq/m++owbti2JHpZh/D6BYOjR
	 hWtGX/gaMVve4tyXaVLT7TWhhmWJjnZF9iLx2H7upFPoKTxCZQoXDRjtpxEafg0T6vqG1
	 8WiIalFonbYHzxHs7JKzZB3AoRcTSJzgoctYjIf7o5CMY+vF5rRT856e3AnuWy4lT4BlX
	 CE9eb/bqLKlkcfm7bfQfmCDsKWJJEqrePBr0WAVihg5BJhOoAH14RtzggBk3xzoQbSpOe
	 6aZapLgUJPVni1RE7qaz+bPOawZjFnjDoudt1/aM5nlSfnA8WVUD6SxIGjBvYPTT1zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=92o1r3unVdbWRpanlWf2vvjYntsWPitLGDtBwxmza24=;
	b=RN9hv/knSg6uJfCX7c5XNYQKE5mf1T8eLQZqJjbVctgeGXdJDe3pxlh/BIeKwcp/c1Dr
	 OdiWGfK/HcKy02PpJwu4lq5tA4hRdNDR5YMOr8kymNKXcI0FYRnzeWYzNsmkRFt3gBas2
	 41dk08wXIJVu5IINaxVhMYWxHNFo0GR1quaTEJFLzuDG555pYd/rS8DArriT1UJye/51P
	 XkEOj0dtL0XBhCQUoZavewdQ8nKjQPY2eIUo1xdnAYIF376Om32f3NXb9rMxVSOeNMTXo
	 vSyelGq4057xUEiUFgqiw+f4QGgzvYswFUaDaFns8/z54v4V47BpXJbWhc8Up16qAkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C2tDiP55;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C24606A32C
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 21:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02C24606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20260707.gappssmtp.com header.i=@mg-crea-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C2tDiP55
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so19564575e9.2
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20260707.gappssmtp.com; s=20260707; t=1793914408; x=1794519208; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=92o1r3unVdbWRpanlWf2vvjYntsWPitLGDtBwxmza24=;
        b=C2tDiP55ntEzCyjE4ep0O7QdsCE3tAErlxQy8pD+FUet+BE6r/Xl+endo6B7ro0tlA
         OL/1Ju7mKCz/oulfSwGbpbCY0p4GqEg9uObBSTLm3MWfmCjAgeSUZRdtY7tkx2kUMWwe
         WBu3BwGrCYXkCvjfTb5kdi7fHjQwV3JyZli+czE2QWFlaqd2jQAjM0ru6Dwo5mzVt7Hu
         Nnwz/L+Xe7mWqmfgiDHAs5TpfmHSj7Sz/RY0k6kJbp4G9ewXWJ2oRcRTf3Fez01EJ1OK
         3vV1HsMuGPKvYW0/IL7VQkWX0lZShj8FsPaEeiXwgkDu6ipNfVV7X28Jjgl4acCUZyCM
         78Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914408; x=1794519208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=92o1r3unVdbWRpanlWf2vvjYntsWPitLGDtBwxmza24=;
        b=w0kVCVhMTcTj/Kdxh52Y9Q9NRYmRcPRj6TVyFFxHfw43BWsSmk5jy4INXZZlDyRIJY
         3xwQLnToIR4mM+Hzosi9TzX08kQSbZcDocbSFBkR2KzOvBBmQpvFUsKYKtYqpo0PsJG2
         acST0cC4BL54GNy1J/olFcVF/CUSUfm2Cb21ZDJ26iBBbCDxUUT+osE6Vfh9Yv+vriDB
         A8u9wrePFZZm4rPfsHkH7ts8Szgu4XJsZqho3/lw6H6En4j0EBBHRsEDocDZjt/+cdUr
         DAgFETupBY6xlEU/STUsMhtSKMeBOKewG42QVHAowm+SSn7blvRA6J6qiM889RQmwRLH
         UB7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzWLhE8buh1FmswdcntidmSu1C58dzcQtU60l+BE+2BpCJX8/Fd5cEtzKK8yfSrBazYgRH+GP6I2D0g@vger.kernel.org
X-Gm-Message-State: APuU4Z9hHQKTU0OzSzBXJYpap/j3kmhDKGVH6PLABdFK1CIaeTKaL9Wv
	qg7+8CEGVJurn5ShfexIlRTB2jJlPW+w44kyzgm1twHm85uBtzRP8GgHurJhy0+jFoo=
X-Gm-Gg: AYBFou35rW+6wDboVxQtpfTfPb5HB2ctYXXeBGRehryDvDfBHzR+NnUEwrju5ueL1f5
	8OE+CvNvSYXoyO1gv/QHIBKZM1t8wKUgcHoVNW8l5pU803CJpRvXuBXPu8I006S2ZIrL38GDROx
	f81NBUGK6+RWwJ4v+j97RikgXDbh5eB66Y/IlTN5Up8vgVLqJiPP0Bc+I1kLgaJej7AxbvL/4tO
	1kvoMzaBW0O+rLiz5SRV4ZSyfg1T81JUW50rvzMPttuwQj6xi7aH7nBnAWW1SLrguU1lQLv+Ntp
	G+oS5UohtsDG4lEINlkvJ45frS3b+2GP5vFa6/Dmw0n4Ar/8RDnCVImughc5rc9nryaAp9Fwur5
	rDvWb4OniIYPwbcOOiMKXCIU0vuQK5ByOyBemhuJBba+pP7fHqgNtVIOJoL4+b6R1AnmOoeRHyV
	c82eCs7buTK89m06xmSgzT47sTwTK2ssjXRTxyPsAQzLLlDg4LS7XrANjMSDVsdFQeLqAXPiFm6
	qFpE8+SD9jgQXckYSwcMuJbrVnHJOLUtrjhWrZMcw0LxaAtMGq+X35VVEd2QSTOAW1fbEcq2mb3
	+uB3VxlRmzpzwtizLAaf1BVtI6CLkEaANL/MyzbEB6ZJRUZET5m+YN67ofc7+Q==
X-Received: by 2002:a05:600c:a015:b0:4a2:1612:6367 with SMTP id 5b1f17b1804b1-4b6df11d637mr5657585e9.15.1793914408338;
        Thu, 05 Nov 2026 13:33:28 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:5c25:f8d1:d9d7:54c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b411de95b4sm107798385e9.0.2026.11.05.13.33.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 13:33:27 -0800 (PST)
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
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v5 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Thu,  5 Nov 2026 22:32:09 +0100
Message-ID: <20261105213210.87457-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105213210.87457-1-olivier@mgcrea.io>
References: <20261105213210.87457-1-olivier@mgcrea.io>
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
Tested-by: H. Nikolaus Schaller <hns@goldelico.com> # LX16 - driver only, no real world test
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

