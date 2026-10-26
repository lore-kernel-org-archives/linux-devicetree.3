Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793003871;
	b=vJHzx3/1Ilt7AIrsASUgecT95USpEbKYFlY8ueRuLYQLc15YAR+GTYWbuV28OCfaLXbY
	 LJSeXMDbMBvI35RzwvC13SRPkGpwJBbXun+Dgq00q//Vwq7vt7gG8uXJKCtHOFSuIif7f
	 dnsPDnl67NLsudiSp0tOTmvsOjSGoRTxgGecMBMmZKVsQmLZ2UxmChZ3LVKuceR988nYu
	 +nscqvSUhlGfExxRBplNctHtK1mEgg7KAdO9Y+ps/0K9em39KPRJHE01sAVsIjI+oXhCH
	 8psCcOMj+o5FE6E+2xJRWDNpwBHZfs4DsRcF9fXpdAm4sYrNkrX9ozoyp7uc/xRmo+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793003871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PVzvJsl7BLFlmP5S+Z1OR1o7F1Ju7Lk49SqRaWPcnEc=;
	b=JBAyuw7jRFh1XHnEIpF6R7t+e/mAZeb2sCjCjCAb9wOGYiwAvx0/tSNpnvq6aLo7lzyy
	 ZblcOmqBNK+hJeH3qlYXDrKeV6Is6xqPpDMGNwVWr+DE66ns83v3I5nFV0cY7isrBfWbr
	 hQgL/mqFukPPPjw2IOlvOd02vBFWWAgcH0Uxm8ovqPiK4Ap/qgUNbuW+l2F4H2kwndPrx
	 P1/HRs3776e3bHsEkSSJJ18m0xy8yrKMhjrt3q70P2RjGONYGGth8ks/XFcvIaZDftvrE
	 /yaQ+gTUqdV6HCHkgMamemKPlrDNIFgBmusxFfPlADUdiqjr7aBjgCNp7oGMqHLyIHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=z4ezabx1;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F13D606A321
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 08:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F13D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=z4ezabx1
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so15986105e9.3
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1793003869; x=1793608669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PVzvJsl7BLFlmP5S+Z1OR1o7F1Ju7Lk49SqRaWPcnEc=;
        b=z4ezabx18eIoRMVxS9bqcLmnphuqgDGaaiWYxtzP88EJ2F29LetBPN7fnpWCuSn/vX
         yzjil+XS5a8aE9zYNqRgMUxOJ+JRBo6HjOIxMNpVzyisutWN2q3x0JaJkJsZxNqop6/l
         aaE2sB2YKvg16xm/qsEVt+bmeZUKtOTA8DPfDmTFjVYFNXJEMNXw8MR9WEDWLT0UO+b+
         kekA0ZaSA0baZV28NQCUi1dWUw4/LMv4aLD3POZkPIFYoE57NoiZb4rHOxOj6kHFhZo0
         I3kPzkYqHLJMl5edGXuDjJeVxyvIcbyJPzM7SAHStDAJKXWlZepZteHwfw2R7oEeHZL4
         U8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793003869; x=1793608669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PVzvJsl7BLFlmP5S+Z1OR1o7F1Ju7Lk49SqRaWPcnEc=;
        b=jCkqSNI/TTDSO46wv780pSIJubWw5bWdw85oZuU9I5yziGpt8nVeWX2hE3JjaVSnmx
         FIJxR56AmCNIuhbHeDZIHBIgadRVkpBfx940LsCYi73F7VqYfOp0yT0EaktOfOjEPWbz
         zfWGosXBvu9CNkYksVHcz/BfVP37XL3NxE0dtQrYMNSip/N4jfeh8CbEXikgK1iEUdjV
         YKrqlM/EB1ESYvNcX9kVN9nPkijCXDlNWEk0aCxsJ8bNlUbdJRcTrZajppup6lgUI1eZ
         kXGM9t0Dr4Q/7X2qn6ip9/kmKNvRE+BZ5OB1F8WPpJ5XOluu0ddd7Ic8qukEQjcporqb
         T2jA==
X-Forwarded-Encrypted: i=1; AKwUvBxSr1JbS4WV6biPOnz3HpA41riUa4koBJJuFTaZlO9B2WyeDSwqipkAAajFnZUVh+imEWrRqdURi5z0@vger.kernel.org
X-Gm-Message-State: AFq9FYLMYZedHhzS5bxqY9CcuwhhYgU2sirf6L0x2oNc5UK2YiT2JIug
	tUOroYHezXHVs3iNEx+VOPVmnF13Tla01Vqr2CTpPwPnecRBDk1WqxZXqqMyvyBrRfo=
X-Gm-Gg: AYBFou2lSF0eKk67Nok97f2isAvcmtzycFyGjHfJ08obptYDF3A759siO08lDdyFcLx
	QUrjcFrlCBTgpPsiEyyzyej/5EvYA+GCeGo8Qe8FdpDVAHChUSjRSfZ9VRcw/A+C7oRrTALycvN
	RiJNzt/In7SI2HiOZOWoF5XTRq/l0Y/DZvcDFnde39og/FHeihDDp9hwJI8n2LDYxug5FuG5GF7
	5aqsr9LfpyHJnLhy3b2FyocTqcqRcIaUwBGUrM63dGR5Q3Vggr9RouydvClABUXGwu+HdnRmUIH
	5RMDX5ZtLmM6ehrL0oexq1z+IPdomtNakd/QuG/wE/1lRNQGKR6jvVEfs3cT4/AiwHb6X6d5865
	4PpHVADutMioVssn4fzkGwDiIL1L+qRrD5Ns8F5lA12z5MhOD8OJOILt2bjuX40yrR7YlZpBqu2
	NiUruKiVtnDI9gD49geJbpFDeRYHgezlIiY8GUMCOdhKekmt5XpgvCr6fjKn612ZglYzdOoGNFl
	K1pZpbz9oAqeniyIdGg/kotUWl8xlmFPKuWKGwTzOlQJ/HYPeFN4HBuCcyP9Uyt2HTUHdzoksNY
	twn50oY90qdErg==
X-Received: by 2002:a05:600c:3541:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4a35acc76eemr102904505e9.34.1793003868610;
        Mon, 26 Oct 2026 01:37:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:6dfc:5715:ead7:7540])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8dcfsm15091889f8f.50.2026.10.26.01.37.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 01:37:48 -0700 (PDT)
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
	Joshua Crofts <joshua.crofts1@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v3 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Mon, 26 Oct 2026 09:36:30 +0100
Message-ID: <20261026083631.48406-2-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026083631.48406-1-olivier@mgcrea.io>
References: <20261026083631.48406-1-olivier@mgcrea.io>
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
---
 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 60 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 2 files changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml

diff --git a/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
new file mode 100644
index 000000000000..7886836b10c6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/ingenic,x1600-adc.yaml
@@ -0,0 +1,60 @@
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
+  measured against a 3.3 V reference. Its clients select a channel by index
+  through "io-channels".
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
+  clock-names:
+    items:
+      - const: adc
+
+  interrupts:
+    maxItems: 1
+
+  '#io-channel-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - '#io-channel-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    adc@10070000 {
+        compatible = "ingenic,x1600-adc";
+        reg = <0x10070000 0x30>;
+
+        clocks = <&cgu 28>;
+        clock-names = "adc";
+
+        interrupt-parent = <&intc>;
+        interrupts = <11>;
+
+        #io-channel-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ecc22d1149d1..fd4bb5c6bf16 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12925,6 +12925,11 @@ F:	include/linux/mfd/ingenic-tcu.h
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

