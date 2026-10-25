Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792912521;
	b=kjl+jmTiUFEKrJfNm/ykNeaDTqu4pCp+t93kOndGuvWIpPVH73JROUMmGx1jicbQ5iRV
	 Np27qRl/eQA394dUgMRY4i2+x05u/tUGsqHH3pQNJW2R24i00C++3j6GYh9n02/tMLbYX
	 ZO9NYXa7Ee0Amim/FKbIxffHYQ5gTWlvVW7NFbKzu8szAtW6AvVipa2tFRit9WLKYvDvl
	 0F8mdoxxe4X9A4pbpgRFXYOfBJpUM2hBG8y8JRfUOEFq/G6eW6lHigl2FG6apaqbKc4Eg
	 emU+0SyWS6J59mU3icggAPXw6ktVROOiSx84PLOlef6w6NkxluCVuIVpLZjhoq+W85Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792912521;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=upFaLG2iVsKmYKDkUH1tY+pUQEre31IXX8yyMsymuXA=;
	b=LRF3Z1UdY4jkO81Aiz4nrp4tmZ33VpuDeDxqa4oN+gN+lWvt8mf3zi5sBQhXOLMfYT+7
	 GE6D8qKVGTv5+e7nFV9cg0rk9TNzlkthbz3y5Fi4MAQE3qr0t57iZaCNiykpF0AS5clqc
	 Pg0+b4xF14AgH2vIy0u2Hl9DtlHuuQdzvFLtwkrlwl7u/7BTR4p1tSHOIwdVTHd8RuC64
	 O57NxvPMG8DMKHpqhtyp/19lteVmcXemcUvKPw1aqdBFhVq4uv1slBgx7nOkP9p2cc6wT
	 qJXjBfYbV9mTEJgBMdYSXFU7b3qFf4kdSeTrBJUhsSvTJFFsuHStERU3HdnYO7UlBlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndycJccN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88156606A31A
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 07:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ndycJccN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5759C1F01828;
	Sun, 25 Oct 2026 07:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792912521;
	bh=upFaLG2iVsKmYKDkUH1tY+pUQEre31IXX8yyMsymuXA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ndycJccNFMYCbNOVCMubwiOD4Uvi5aon6iaBegf3wa0C3p7RUMAj5M/vibtCc+EXS
	 6fBpQqaXOcdlpP36nriTGpTg+yCPPsxmM0hXhQFxDVIy50SDJbqkuKCeC9i7whumOj
	 JkCo2Oc/3U3BNpT0eXDUbScqBYfFqfe+bMrfONzRobJkp8VaXdFp/TUviGQaq3tzSq
	 2vDYOj91dhyjFDiINcgPCuD0WIt4DtKfd5jXePB6MW08HvEQEy2SCgndXUjww0RJqf
	 3Rjy2dzS9ObcgQ59CtsU+Fre8/oTPOW0Oa7REkhD3/U5Rsp7qqOL/KXPMOkuZGnJJ3
	 abyo9ILqLRyqQ==
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 25 Oct 2026 08:15:12 +0100
Subject: [PATCH v4 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable
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
Message-Id: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-1-b352ab54f46b@kernel.org>
References: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
In-Reply-To: <20261025-genexis-xg6846-smp-v7-3-rc1-v4-0-b352ab54f46b@kernel.org>
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

Document brcm,bca-smp and require its single-cell cpu-release-addr
property on each CPU using this enable-method. Add a Cortex-A7 example
showing both CPU nodes with the shared CFE mailbox address.

Suggested-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 39 +++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 5be89c584026..577a1d352449 100644
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
@@ -471,6 +472,22 @@ allOf:
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
+            a wakeup interrupt. The kernel writes the ARM-state entry
+            address before sending the interrupt.
+      required:
+        - cpu-release-addr
   - if:
       properties:
         enable-method:
@@ -712,4 +729,26 @@ examples:
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
+        cpu-release-addr = <0xff800568>;
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

