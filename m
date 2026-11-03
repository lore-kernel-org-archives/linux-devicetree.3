Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722430;
	b=OG7eA1dyhRouSL1hogVa49zTgK/1Nl4oUqs4mseIQ8RoR99VDim06BH+koixWG8VtDHq
	 HRrVmqdUtlgCbG6uJbTZNM83e1pflKEX9hJSeVsMBm2uWBDexy/dY2/3hY+ftuzmnVKSb
	 QNQMQAICShUK4zLNR4MiMclUrhVyRVGMk6/+hju4R4qS1w/i9eID/3JB4YkcJdqpBD5Jw
	 yGqDPRCmLjeibmnT8nHyn53H+ehR2Jko7J2b1O10alJ+ooGiKcrhWjP9hvUPyhGP9OFr1
	 P3c1Z0Si7PM48zp/tQ2Hc9SDHLKlREq+Ew0A+ujHY9+Lye+yBhIkmD2eV++y4/8QP4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=8TgKeJIVrgmoBWpLM7/N2L+4iRLrEXSCOV8xYhwdq8Q=;
	b=QeekLYDSxvQ8QYFjuRXlV4mpJ6wzAU8aRnjXnCgZVEQkXLc9z/LNp6DKcnH79o0R6ydX
	 RMYoHoOE8p6xzj8Ve9GccgmpJumlQ1X+uAMSUocoYhq9+67MMYd1bV8+gNXyt3Go/D5OP
	 qb55vhXfNgpgeHqbRtbBlDhKDpSTJCkuto08AKDPcey6Cxm3gAcp4hmdFMRul6k195sby
	 lAYq7uujOIGgC0Z74fyFRsdVrok4XVx38Ziwx+APtH/E+lNBHPs6J9ne+yeKlczQv1ckO
	 gqpt2iuLnxXsyUsfFzgpwx+yC3vAoZ0NQSpjsl1hzrMtBzeINCG8uuYLRoTfbc7RScQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=UWGxLFmj;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA8C6082BC8
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FA8C6082BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=UWGxLFmj
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35c76e9614aso5968697eec.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1793722429; x=1794327229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8TgKeJIVrgmoBWpLM7/N2L+4iRLrEXSCOV8xYhwdq8Q=;
        b=UWGxLFmjEJH25YV8WULZmSGR3aTaPZPjZ8drG0V9+g+OqlPcFXxB8Le7r+0h4TlXeU
         R+u/boeh/9CNcC2DIycb+dNBr8+UJVWj52TInRYZKwUwblvPIqImXofUzWNiyVWxAZtd
         Q6ShUvbXvFBsYScxp3416AF2I53A/Ds/Y9sxXnmqIEziV0ucbTHOY2zT0ruLks4OAj5p
         08TiOoKXloOYgjh6zZIi5MaU3AjVoRLzhPXrcjCMQwbao28jQSboelPYNfvf2byiZUH4
         RofyXcGb7/cB8GcVqpssw2cFrJpVeD9VBuwnOMFCJ97UVZlzag+4dpRAj9qvvTe85ygI
         DEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722429; x=1794327229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8TgKeJIVrgmoBWpLM7/N2L+4iRLrEXSCOV8xYhwdq8Q=;
        b=vduEYpiKM3B3ZXO2WPmaTRxQ+BdxN5dkh8t8K5VZ8Q2wc/dDWoRERXpRU5f+RZst0a
         2DtDa+NMJrA46ntZ/qy/SC09tLrwH0RpxP6SM7bfkFzKfO7BJXDpCNrmbvGZXdDGOiP0
         u/6Bax6j+pLACaFJo6KPFpGTC017iYGQSL2QdUj3Zr/gqjFmbJmOXIu4YMkt//zcI1XS
         JGNLbq3ZoQT6CAvp9prXkWMq4L0kfiyTf9p02quYRPCJE6bqXcQOshUiHoLtAxusxyeP
         P2qgSlALA2HOvTO9fVlwwqJQQtzb4y4p250P2l6KG1ufey26Ivh/U/kXwG2mDlBaretH
         5Z9g==
X-Forwarded-Encrypted: i=1; AKwUvBz9j+0MekLq7M/F2M0BI4JBOHXt4fDrBzm1wDZ/JnOM516no54UnjoGbN8vFIigyDuw09YiLqDQlvaI@vger.kernel.org
X-Gm-Message-State: APuU4Z/pWU1XwxWqwaJeuM9ULAAO/2uQG1e2AB95LRLDaHImyzWGzG1Y
	mBh+oFq0KehBqYhzF1fD74D1/z114VVtibDEK5RO3SB6qgifnj4lPYH7SjFiZ5LKuA==
X-Gm-Gg: AYBFou1aq+cvCsgbaVbctA908krC3KQjIUK3eCwg5XQ7uP4ht6G4/uWAsmNgdbYtDeC
	fhpMaX9WNvQAbSij/hpVe0MA9NTvLx1UHf5DDVwnS3LP/AextgulRfgtzXoYdKsIl3/WBR2t/B8
	6DTMYn3IxFpiore29EH1E0B/rXrMvi53p83bcFEE7mwCBicg29XyuJ7th4rOBzgN9UCzcFx9NGb
	69wGMCRSQyZ1sC3Ug1HBdB/yK8tFKDt5ccEdZQJS/b/jArzC9c22QnI2R6Rammbt28c5OPhe2AQ
	bim+8GleQlxfaN/rWbx7RHT36h1G2ArFOk3uDGszZNWrccCOEFTp2wJw0BROSbFD+zHMloAQ1Cx
	MHUhjyMrBB7x8+pu0krl61hY6/Pz4SAyLG0DPxBzwYwdXFXrFfkb5dzZdIYZbDSIHkzeeJ1N++Q
	4PEyLl5qdXN2DBq/5N2JK81IsUPq3zI8m4nc0A93UZxbwflhQ/e8UuB6Jc8LSB3Gzt9mkiKEDw2
	joTb9I1ioWf6VcAuxnE/SYCzyIJS0kQK+Sy8E2NyD+5JPfPz/cGL/C1wWkcpfuW8wlbKFQ3CZrb
	EC8nU7iIgQRnRvPmq2a3MohZqw+Wge4G+C1U3UpV
X-Received: by 2002:a05:7300:b098:b0:369:3e30:c665 with SMTP id 5a478bee46e88-36a423fb4a1mr19744790eec.33.1793722429179;
        Tue, 03 Nov 2026 08:13:49 -0800 (PST)
Received: from [192.168.29.54] ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47214021eec.6.2026.11.03.08.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:13:48 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Nov 2026 21:41:55 +0530
Subject: [PATCH v5 8/9] dt-bindings: beagle: Add BeagleConnect Freedom
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-gb-uart-transport-v5-8-f8e326d6561f@beagleboard.org>
References: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
In-Reply-To: <20261103-gb-uart-transport-v5-0-f8e326d6561f@beagleboard.org>
To: Jason Kridner <jkridner@beagleboard.org>, robertcnelson@gmail.com, 
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Eric Biggers <ebiggers@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
 Ayush Singh <ayush@beagleboard.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Markus Probst <markus.probst@posteo.de>
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2828; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=ctwlQBerNS3g/Yt080ihEXWMF7uGR3U1I4sIyvz57mc=;
 b=owEBbQKS/ZANAwAKAQXO9ceJ5Vp0AcsmYgBq6gfgvOphjMnPHOsN01/GZeO+0IVHUDn8iPetU
 U+y0np3kUiJAjMEAAEKAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCauoH4AAKCRAFzvXHieVa
 dN90D/4u7mZpwH6BYAMaIb0yMzePkyJ//eNyoIO9lrY8b2dabHrgbP6Jvdc4cr3/H8VIJrl8SZ/
 Gj6D+gl9+qPTuKrrtCHTq3YBeR6N2+BBRwA2M2ue0e7CGvTqpAGfWxw0uST3dmehrcA6IEAA7vN
 Eo3vXY1m2TGWP0oO1QmozMFRdC+ggAheGscK/RD1KLVdoVxDUi2XK/Ew7O9tHKj8l0b11ngx3BQ
 PvbWFld6WztEydvahSNqiSPdXME+Q4avkXgQnRuuoGwAYyCYUp7YutVShqfG19468R1cXHP1NCO
 TUtYXa84nSdS7X4oyUHW6ztoY8kkDOcTTcev/elaIdF5ovkB2uv69STS7Y+WqUHEvGF2zMIjPrE
 8id+k6MqJHGaYUiblndwpLiOwEEUOclEAaOCripoHzVAFsqqfRhjXH9bUhg4nWcRVfGrDlnt7le
 2KQpzXOyrszIJN8iSR0cHlC4Mex/1V8AGWbhWRk3gFulZv8s4NXF9pooHdXljNrtAXtg3DFQiGM
 h0l3r2e1ZmOYbqEtOasgNOZeEbdmtsR3XCuCtq8m5tOAnQsHQ+Bbhks+cJelEGJgs8Eg+iz8/r8
 Nd0OqybG6e1nx24JZ3Zn5wuFxUwX0/BW4RIhF6Z1zX24Ntw1CQIyOvG48lvOyYElei40wmo5Elh
 YZdwWTyVZ46OIxQ==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

Add devicetree bindings for the BeagleBoard.org BeagleConnect Freedom,
a wireless-enabled board based on the TI CC1352P7. The board exposes an
MCU that can be attached to a host over USB, UART, SPI or I2C, and is
described as a child node of the corresponding bus.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 .../beagle/beagle,beagleconnect-freedom.yaml       | 62 ++++++++++++++++++++++
 MAINTAINERS                                        |  6 +++
 2 files changed, 68 insertions(+)

diff --git a/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
new file mode 100644
index 000000000000..81dfdace33e2
--- /dev/null
+++ b/Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/beagle/beagle,beagleconnect-freedom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BeagleBoard.org BeagleConnect Freedom
+
+description:
+  The BeagleBoard.org BeagleConnect Freedom board connected over USB, UART, SPI or I2C.
+
+maintainers:
+  - Ayush Singh <ayush@beagleboard.org>
+
+properties:
+  compatible:
+    const: beagle,beagleconnect-freedom
+
+  reg:
+    maxItems: 1
+
+  vbat-supply: true
+
+required:
+  - compatible
+
+allOf:
+  - if:
+      required:
+        - reg
+    then:
+      $ref: /schemas/spi/spi-peripheral-props.yaml#
+    else:
+      $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+      properties:
+        current-speed:
+          default: 115200
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+      mcu {
+        compatible = "beagle,beagleconnect-freedom";
+        vbat-supply = <&vbat>;
+      };
+    };
+
+  - |
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      mcu@0 {
+        compatible = "beagle,beagleconnect-freedom";
+        reg = <0>;
+        spi-max-frequency = <1000000>;
+        vbat-supply = <&vbat>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index c9126dc205db..521bc6c67979 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11522,6 +11522,12 @@ L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/greybus/gb_softsvc.rs
 
+GREYBUS UART NODE DRIVERS
+M:	Ayush Singh <ayush@beagleboard.org>
+L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/beagle/beagle,beagleconnect-freedom.yaml
+
 GREYBUS SUBSYSTEM
 M:	Johan Hovold <johan@kernel.org>
 M:	Alex Elder <elder@kernel.org>

-- 
2.56.0

