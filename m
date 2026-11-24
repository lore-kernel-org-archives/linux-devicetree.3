Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795542190;
	b=2QaORj1Pu/kqvE9MREvQ+5zCVbNPF4eqLXPn16BH8SPf5P9GEl1uM48+fT8e1ShRbJKu
	 ldOCmZTj5h39jRSVQz2sorr0bU0sALhPT0VGxIAqc01kOjhDFPP+xM51zck+6k5NmP0YO
	 hw5Nol0ol7Mui8aOcQI9pxL/PgMd6iRhqnU90i3CJaYik66hJog6cTEjukKHNWJkyqLgQ
	 Zgg6W8om2ha6SkGL+lK7PD+3nA1oOaZJUjx5uLaYYhinxTqe0vs7XEAc4GQmJYRtyTnxw
	 6bSQOiJ2PYh3Om4GMdq/k3n0JMosX/G0XjBiruiegUNuGNGfJSXd6aI0JymH5UB8ZyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542190;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yS20vV3nK7x1IYanLSn1Cp+mOl1KPhIWpaQIakns+H0=;
	b=12610AsvGw8ISdgJ8QGKmmVzlr7JApFk3lE1tEBIJwfhY0SZv8bB1R09UGhnP005Y/PE
	 0ObsELLTwV3CahoPrmmwnE/kZBBaouDVos1kkdCt/O7URSbWq4lsBkDHKWsaZtpxk7i8B
	 z3XobktaCe0kKsNv21fTzezPZoi5Aka0BIbLy9OkuIXNZwHYBxD/vpmHZ3JU54AweMpEG
	 Kl41kCSPWey9P7Rl5IvdpWXJhW99NHZOJ69h8KP+nce7ZirFcmAeBUy9hqOhZkqH7f10/
	 Cp7Baj6aVq/AbDdSTrBHkK/7rXANVwJcC+A10EyKLactAIt5N6bFZ7Km3R8q7L70/hA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGdOYHQB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BF8606A321;
	Tue, 24 Nov 2026 17:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YGdOYHQB
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795542189;
	b=BeYwPP70vZLqbtYN6C7PtlOnCjYYTdUsIFLuntWol2KiUHOWcRaMHd4i+bGURG4bqLvp
	 xIcMLdKX3251UIssXE6ntqA14ke7HHu3Uj7QaNKKBDYPRQvxGnb8Glg1TlGQiyw8KQbsf
	 dLOirJOSc2+JzRfK8psqz+EX9qW2p9RCHU5YaBwz56l4sjr65k1ULmhJNmDpkaurvlFvH
	 Y1BrCWzPn3zkNG6UjUnheIIf8DXMzoFzluooOSxG5YVxt7jJJ20jMhFWnNIr0OKZ2f43A
	 StDXhR1BSdjQiB+9G58arjlmSZcytNGFazeyHisIUNe7tXStomrzv+0vBsGHsqfqD3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795542189;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yS20vV3nK7x1IYanLSn1Cp+mOl1KPhIWpaQIakns+H0=;
	b=OSxU0EMVBZvl9dLAkoAI6Zg/EnBQdrXZ1rl/PDbtg3XVPocBQOGu4PiqU6X+QpRulVUp
	 yqrg5usJZPJM2y83p7XsmKLysUWCwYwOM0foxT1DsqWC4S55AiD15mTechSTNJK8iEib8
	 ec3oFtH042YSirxiF3bRHJy6KAURIspJx9sd+2PN94T4wHIiNq8rAxDkHhuaDUkOIdWzn
	 96q1sUF4ZGDRUK+v7E+jpwZ7owH7qwaIFf774hgLb14QwKwOZ8dxOvpmMH/Ge+xxfZL9y
	 HXbSlFR7x27khEkbwsElEFWNYJPAQhmIazl6ayclaaWWCkJ6BTJEmxHscy7tm7kmzaw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EBEC1F000D1;
	Tue, 24 Nov 2026 17:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542189;
	bh=yS20vV3nK7x1IYanLSn1Cp+mOl1KPhIWpaQIakns+H0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YGdOYHQBH1EBC18YtoQWKusqirrg/e0qUEqpTsaDmSa8MlvBLhHTEa4u1XAMBYjfo
	 HEhxL/UeuIBkVVkvEYhilsZsu5tRiH1jmcETBDliZTKlcVLZk/ewCM69mN7SbrrCF6
	 3GT64Ogb/S59kjW0o6+GQvFuvq7HbslzdWiSY1nwJtGhqTf1SWtR6dDafGVnA0ZHk+
	 CWc7//oFrBJ+eLEqPanjTrLVzISl3uF7Nms2qVuRKi0MfNS7pJ1pmuWrdonAts/2jU
	 p54OMzYWMDRU1l9kkMaHbJ7qewc5yDaNOyyJqk/82Jo21FDCG4sIIqNckOKczvCjuA
	 9Z7TocXHTBJuQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1DF4A4CB20;
	Tue, 24 Nov 2026 17:43:01 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Date: Tue, 24 Nov 2026 18:43:02 +0100
Subject: [PATCH 3/4] dt-bindings: misc: Add FPC1540 fingerprint sensor
 driven by a QSEE app
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
Message-Id: <20261124-fpc1540-tee-v1-3-6c6985f05b06@proton.me>
References: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
In-Reply-To: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795542180; l=2873;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=r+50ATdWgwMvyyU3S4K6ZQcnyzT6AuxDtEZt9y0AbfU=;
 b=fJH/tEfkZk9mLQMLKJcMuRw42M4pDgfk61eaJPpnbpTy2RODsXCpkaF6GfE6TD9RrmCm/15p3
 vvqFRRYO8xrAsQcW6rr2OckeP+bLxi6uAp9C1nkvRDG6ElpmgbRUiRs
X-Developer-Key: i=armandas.kvietkus@proton.me; a=ed25519;
 pk=wuqmImJ9sKlDVcwALOvfGhjj7G8EBjjM4TpCdmlrAf8=
X-Endpoint-Received: by B4 Relay for armandas.kvietkus@proton.me/default
 with auth_id=974
X-Original-From: Armandas Kvietkus <armandas.kvietkus@proton.me>
Reply-To: armandas.kvietkus@proton.me
Content-Transfer-Encoding: 7bit

From: Armandas Kvietkus <armandas.kvietkus@proton.me>

On some Qualcomm phones the FPC1540 sits on a QUP owned by the secure
world and a QSEE app drives it. Linux only powers and resets it, takes
the interrupt and loads the app.

Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
---
 .../devicetree/bindings/misc/fpc,fpc1540-tee.yaml  | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/fpc,fpc1540-tee.yaml b/Documentation/devicetree/bindings/misc/fpc,fpc1540-tee.yaml
new file mode 100644
index 000000000000..0c2ec847c2d7
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/fpc,fpc1540-tee.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/fpc,fpc1540-tee.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: FPC1540 fingerprint sensor driven by a QSEE trusted application
+
+maintainers:
+  - Armandas Kvietkus <armandas.kvietkus@proton.me>
+
+description:
+  The FPC1540 is connected to a QUP serial engine that the secure world owns.
+  A QSEE trusted application drives the sensor. Linux powers and resets the
+  sensor, receives the finger interrupt and loads the trusted application.
+
+properties:
+  compatible:
+    const: fpc,fpc1540-tee
+
+  firmware-name:
+    minItems: 1
+    items:
+      - description: Path of the trusted application, without the .mdt suffix.
+      - description:
+          Path of the QSEE common library the trusted application needs,
+          without the .mdt suffix.
+
+  vdd-supply: true
+
+  reset-gpios:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  irq-gpios:
+    maxItems: 1
+    description:
+      The interrupt line read as a GPIO, so that edges where the line is
+      already low again are not reported as a finger.
+
+  memory-region:
+    maxItems: 1
+    description:
+      Region used to pass the trusted application image to QSEE. The whole
+      region is shared with QSEE because QSEE reads past the end of the image
+      while it starts the application.
+
+required:
+  - compatible
+  - firmware-name
+  - vdd-supply
+  - reset-gpios
+  - interrupts
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    fingerprint {
+        compatible = "fpc,fpc1540-tee";
+        firmware-name = "qcom/sm8250/xiaomi/alioth/fpcali",
+                        "qcom/sm8250/xiaomi/alioth/cmnlib64";
+        vdd-supply = <&vreg_l13a_3p3>;
+        reset-gpios = <&tlmm 24 GPIO_ACTIVE_LOW>;
+        interrupts-extended = <&tlmm 23 IRQ_TYPE_EDGE_RISING>;
+        irq-gpios = <&tlmm 23 GPIO_ACTIVE_HIGH>;
+        memory-region = <&fpc_ta_mem>;
+    };

-- 
2.56.0


