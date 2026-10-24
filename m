Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792815247;
	b=1OwtPalUdU0OIeVUBstRHNeijylwSHEXvVZUqxHuASUh7TJHPEqgqqiCAm2ZKvDXaFdO
	 R6KqZ9bRo/TCSqMhlsnZrzMTAY7hNGzQUQbDW5NEG8DShpTp4bmJvUtBcb57s7SJOGXWB
	 j3OEeyz2fie0HP4Mzw+d/KFgTXLmXXSN22ErJNSOsql1TcT2HfaA4jSU28cbyFP8DFizA
	 EKxg/hLmD96gKcY6osXpZL4pLAA5eG8oHIbIMaT/9OurGQzRscvdE4QMnPNXM/vbTOKlA
	 B1JZgYoP0iIIK3aiK7Dlnh5XlgLK8u7ui5FPVDT7Wyjy9T7b2viJFwiusHenmAVeicg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792815247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2Wi9nFKnE/c4EPmrilG/KSDGcYcdbtVNJ4lOGd9J52s=;
	b=1ojfLPeWPooBxAdOG6lnYaE3sXd5X+BoniqHqOqSaMIflnLSoz3+9i7hN7/Vdezt5YHx
	 cT9umMCfV0wpqGESPqo8so43Sw1KWz/T3UPx4LbhvDQQlqUuEgfpJLWqeksPXZYi00pWM
	 Nu3ExV8t//76TFeQ39/PHd87JcksZjeSbJIATsn6CXlArMnRh2TnsjsMv6RmqGX2kgTTi
	 yXrUHlgUn5dmiw4GKarGMffPxIXvY+RGsLV5R0zRW3bb9ZDepJ5nSg3bwP06bhHLChNrt
	 hqaKuYJDn/8axN7zoEC1H5sIaqSgd0ykv/2qeZCc5vuQrvWRx8svrlQFjv02CP6S5Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Os21mwMz;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF29606A333
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 04:14:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFF29606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Os21mwMz
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so8634365e9.1
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 21:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792815240; x=1793420040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Wi9nFKnE/c4EPmrilG/KSDGcYcdbtVNJ4lOGd9J52s=;
        b=Os21mwMzsXCBmyGzcSB//pxKjuPPNQtlMHyV5HZEUycbuYFqplMtYiil/yIIRDD4pG
         ZMktH1avkIIZQbOBscNlCJXS3t5TwzwSKx0D0Vuf/RFdmXjn/UDizoPF8yIA5X2mayuI
         tIqo7OKFrmQ7wEzGip7I2QEQfMgwmGKZYMuzp0ktOkKyz8lL38MwKqAV6N7bwMpyh11u
         MCclCuNeyrPpw82x/LYLrCenNArl2/8gGzvUa5sz3eb/lU450+Dde5i12jvnMAOKKSms
         brtJ54qv3K27dCno6dJLsRGhttNn84om/r0VBYapQ5TZObqGQvPMnJ/c7AOAmE43axe9
         SdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792815240; x=1793420040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Wi9nFKnE/c4EPmrilG/KSDGcYcdbtVNJ4lOGd9J52s=;
        b=Qf21j2W0DGLMSeNbUGm7b4jr+0qEwtoCutwfyZgwkRP8SPIui565fWEQBWzvhXnI/B
         juTUkQ8ULCkroRCT5Ol2dTKK+5UAI6PJ1NYYYAFtGV1uCBwB1M++LkRAHtMlJ/fTJ/Nf
         AvWppuSK8vgetkvSnhfzibS6Kysq0cpOgZAW9Tu/BUoE8w0iXkodp6Vmacv77aTSbfIV
         xdYMo+Ff4/p2yv+ZIEy6CgMGWsP9xoru5g9H3Q/KwC/hg2DY+WBo9g7rrc9q3+rWwb9H
         PZC4oDgfeL92Fmzb134VqrybIqIGz0Ce22sPMb6fXN1Q4634hSuL1zC2CODUEaFjeklV
         mn2A==
X-Forwarded-Encrypted: i=1; AKwUvBymkRTxXXpQUDFSCoV4M+70w5q+ZXITMzDX8rz3IjqJYu8t4Zvg+yc8Rp+DWATzIAKdKVm4fM/3wE8h@vger.kernel.org
X-Gm-Message-State: AFq9FYIi0D9WkHbMi0SIkUoY0grDaqAGYxYW0Zzfz2mE2Y+QC98iCuFy
	KKGpGMj+tK84LuAgtMb0fOI6fTR1pN+IeQDuQEqcGoLCGGbsxw21HRhAf7lC4oxi2n0=
X-Gm-Gg: AYBFou0J+6lfquGbfGQRVJWINfJYWAaH3mLX/jGGzSf09Kk5hGgMZxNz5v2N5n09o2r
	8OX7ItPxF/oHo+QOufE/bjr7cB9dGfnoKOTdg/6S1kVScR3puGJBX3e6mh9rgH5/gR4jhNHbvyf
	G7k9aLcJr9p7JVABO8UGPzmV7vrPQeWxWfVnv8wLy+qIkl8jXZuW7wfLIgrhgMPTHCsb38jobpr
	pKL+lVivU4Qrx2stKlZ9IZKtl70dL4wIugufy86wA/TtgLrnAcLvouYlpM0O8KL2/wL4u0nA3AW
	dk6JkICZtr2eu5r4cGC9LDd1HODIXUmNH9AQ69zl9aAjVTya4/d3bFZRMOs6SKziRvZev/WE7GI
	wmEFJ6RLUc4rKrvPzj9ZyaDyhCt75F/FYlqR+8d+JIFdpjxe8izNV/qEP/6UNzcHaln/qx5KaJX
	XER45jRZIMz/6cQjUWqcs7oew5rh1sYbaQ8Tjhs0UKtSpx9H5TQ7R5vpomuczdomfF2c1SgTsgR
	JOeOzavBLyjj5E0g4eE5cdB5WN2/Y+E8xHL+guT+g6g2w1CizczFQGVfhFn4ayIx1a3jDdMD+77
	PP9dz/W2bkE=
X-Received: by 2002:a05:600c:8581:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4a35da23c55mr463285e9.14.1792815239806;
        Fri, 23 Oct 2026 21:13:59 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2c0458sm26332265e9.11.2026.10.23.21.13.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 21:13:59 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 1/2] dt-bindings: iio: adc: Add the Ingenic X1600 ADC
Date: Sat, 24 Oct 2026 06:13:56 +0200
Message-ID: <20261024041357.34346-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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
touchscreen or battery engines of the JZ47xx ADCs in
ingenic,adc.yaml, so it gets a binding of its own.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
Changes in v2: none, resent with 2/2.

 .../bindings/iio/adc/ingenic,x1600-adc.yaml   | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
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

base-commit: a3b3580713f3ac5a32dc2874ee546828977a1d68
-- 
2.39.5

