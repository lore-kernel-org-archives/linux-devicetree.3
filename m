Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595407;
	b=4EaU7M7y5a3NgfMo+2sOzR4YLdftPucJOI48gNk6BvgD+EjnSbuuLjikMFiyW5CLzPHY
	 cIRWk2/Bvl9E77MAf//z+8r3ia8qu2MW90rfqEQRO/z7XVan/58fS+ApLa1C+eD+u0N/A
	 qh4IFXREdM88rB9vRgobl04Ws1CTvTvZP7xiV8QrGwSvCzFI5V3RxjNoAHLFlcADnQlZg
	 sHm4Gd0FJaexGZ9d5f420NEbsw4E6EQz2w7q3wQWW6I+ihF3o46TLQHaxSa5sxw2Fx5gY
	 xK1RwxZFR1TLC9eOnt/JERxjyYbvbqBZB+VCBp0yf2fMQByYkv+0LltYStpy93AMTQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595407;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=IoDg+6sqbvUXMf1vHdHQLEEmPOtq36GA//34shPshDU=;
	b=VLa0lBaAuQFGtpsZorA81okyvm0IjCBmqL73BQ9lph0D67F2Tq+s6xBEOOwnYABSlXzX
	 efbsGlP+OtkXvEb1ZsS/yXEmMR/qSS1zWHXftHPBkj6Tc7XBdW6FluMLhhm+U/7XORkpk
	 NrJHI8AvBUBab2obLntSghVpUgI+yhV9jj+PST/jO9kqrVe1GeTDPMLL3DMtn1sHRT7vt
	 mPg0Aje8AwnUeOQOSAMFQTTGkG8HiKtn8BEATxuvAuSlCsVA4sdiuD/XDPpWi8WUSnfjV
	 iWpDF4y3LAK/tUKnrJqQ1DUy3WUmHACcM6twfiSZK4yHz5LeZKmKqiCJtwhGGS5kUDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8fhbLDD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71CC606A319
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 15:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8fhbLDD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1761F000C2;
	Wed, 21 Oct 2026 15:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792595406;
	bh=IoDg+6sqbvUXMf1vHdHQLEEmPOtq36GA//34shPshDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H8fhbLDDPNiI2ncHf3xu8XiCDPdr7k4iXQCmaLsdskqFeeRwR0Fn1ykfY7a8cMBNb
	 r2LE7Wy2NE48KduOkNmAoJjYN5PzgaWZpt9NI/HARuGEXXIelMsoKN/koGjC5BSrSj
	 ydCiCUzpsFWTF0mnG7ZaPE2s+wcLu5/KNADT9ag9kSWgtB3IEImFc9CilXFlBaiakN
	 YLrfulL7/QGaThRS+tUYu5pxutwgZkGoS92X//CeOAWuzJ/b/uFH7wPmIT0KeV3OkS
	 /OG7p5q4qAA5VO0F1j6L2AbCTaO9/1VorXhDJxYsZFeDjOVme6bxxCBRYfU82vCEJ6
	 ihCA5hGj19MBQ==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 21 Oct 2026 17:09:52 +0200
Subject: [PATCH v3 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable
 method
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
Message-Id: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-1-7c871f1755db@kernel.org>
References: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
In-Reply-To: <20261021-genexis-xg6846-smp-v7-3-rc1-v3-0-7c871f1755db@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Russell King <linux@armlinux.org.uk>, 
 William Zhang <william.zhang@broadcom.com>, 
 Anand Gore <anand.gore@broadcom.com>, 
 Kursad Oney <kursad.oney@broadcom.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

BCMBCA systems booted through CFE can release a secondary CPU by
writing its ARM-state entry address to a 32-bit MMIO mailbox and
sending a wakeup interrupt.

Document brcm,bca-smp and its single-cell cpu-release-addr property.
The boot CPU does not need a mailbox; secondary CPUs do. Add a
Cortex-A7 example showing both CPU nodes.

Suggested-by: William Zhang <william.zhang@broadcom.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 36 +++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584026..6771b85f757b 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -255,6 +255,7 @@ properties:
           - amlogic,meson8b-smp
           - arm,realview-smp
           - aspeed,ast2600-smp
+          - brcm,bca-smp
           - brcm,bcm11351-cpu-method
           - brcm,bcm23550
           - brcm,bcm2836-smp
@@ -471,6 +472,20 @@ allOf:
     then:
       required:
         - secondary-boot-reg
+  - if:
+      properties:
+        enable-method:
+          const: brcm,bca-smp
+      required:
+        - enable-method
+    then:
+      properties:
+        cpu-release-addr:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description:
+            Physical address of the 32-bit MMIO mailbox read by CFE after
+            a wakeup interrupt. Required on secondary CPUs. The kernel
+            writes the ARM-state entry address before sending the interrupt.
   - if:
       properties:
         enable-method:
@@ -712,4 +727,25 @@ examples:
         cpu-release-addr = <0 0x20000000>;
       };
     };
+  - |
+    // Example 5 (Broadcom BCMBCA with CFE):
+    cpus {
+      #size-cells = <0>;
+      #address-cells = <1>;
+
+      cpu@0 {
+        device_type = "cpu";
+        compatible = "arm,cortex-a7";
+        reg = <0>;
+        enable-method = "brcm,bca-smp";
+      };
+
+      cpu@1 {
+        device_type = "cpu";
+        compatible = "arm,cortex-a7";
+        reg = <1>;
+        enable-method = "brcm,bca-smp";
+        cpu-release-addr = <0xff800568>;
+      };
+    };
 ...

-- 
2.56.0

