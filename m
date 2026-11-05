Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793885096;
	b=w875VStxktWjNcx0wczXKDuMO3SJ4KxCNWyWbFltqcRmE3M53hmjjSaSnEA24Lsik/Fx
	 l3JrhTTjH50dOgraIFRJU4+SSW0AHlZvV4HI27HP0P/CjR81kr4oe/dsoL3YpbO9q9I0b
	 aUvDiL2RuCeUZlLW6JLeUy8wsoEPOy9GT3ZZSnTwu5E9BGtBIfavyGQesz6BCW/GiTM3Y
	 HPd6JElgGmsZ6NGmo+2OBDeiHEYBwmHBma47BnpATILFsNY4KuYt5BmmD4RdFlkqtjcgW
	 gT+RUq4qUf+2RXkMiDK6CcJqZAerM7sNnD2zaTJ2mVU4PRGfcmS744GPTbrBjQewFxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793885096;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=lQK/52zyoZ1KJbfE9QA99o3oqHEpIh9THpXBfDC5/d4=;
	b=B+meetBgs6RVm+jsIILGbZlUilAL5pg1RZWt7qJkAQkV3qTqtx0W6lIuvz1PnB/a/sqp
	 NRxmJ8FifKANf1bCpTNurYxxSOykZV6duEFzzY6mHONoRp6NPRs1AxppW9Q0Dttwrg5/v
	 OdYt2f66C7QCIluxffuIF2uXteeeM2pEx9oKwCiSxl7GXq6/1lCoLgc9sKas3jIsnyhib
	 /Jgh6kCr9v5S9mMY7rChZ+DycOcaSV3XwmDIT9MYFlnqCmymfF3weK/BIKVregjEOGvFN
	 U+aE58lClO7cgmHW9Ggfd8x0IVYPQI4x73oalrzDW3Hga0uATmlsrgO4WseYxvN+gEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9GDNgPi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB79A606A31B
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i9GDNgPi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF801F00919;
	Thu,  5 Nov 2026 13:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793885095;
	bh=lQK/52zyoZ1KJbfE9QA99o3oqHEpIh9THpXBfDC5/d4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=i9GDNgPiT8vmuuKsFHPR3sOSJBusnsqYbZDloIIikcf3FmlNWiPFmKXXJyZy5YoGT
	 lRlDR4gFEG/fV8KrvTqfcKPJ0eoLJd8ClSKbj7dZD2jzrkUIQiGMzKQ5TM2S3dU4Uq
	 hVZzkd6Oy6WafDinDyzVqeDOM9Yndv3SCX4/u4RgrfihV6ykofwbC/4SYwec8OkYa2
	 tvHu9K5xBR4GlnZeAubQTCGCGXHMX0Yu9ZpuC0rkxA/kKc8NHP994clcRIYTw1gLrB
	 LxmcBehMW1IlykAN95l8U8HwVS7qGGfgwtwnhG/7ODyQqUIoirlJgrDJRU/jgEQ8wK
	 M/lMgrOTnTH6w==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 14:24:46 +0100
Subject: [PATCH v5 1/3] dt-bindings: arm: cpus: Add brcm,bca-smp enable
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
Message-Id: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-1-4103df2588d3@kernel.org>
References: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
In-Reply-To: <20261105-genexis-xg6846-smp-v7-3-rc1-v5-0-4103df2588d3@kernel.org>
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
Require the mailbox address on CPU1, which CFE leaves in a holding pen.
CPU0 is already running and does not need a release address. Add a
Cortex-A7 example with the mailbox address only on CPU1.

Suggested-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: William Zhang <william.zhang@broadcom.com>
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml | 46 +++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 96136b70dacd..b83c7785f656 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -263,6 +263,7 @@ properties:
           - amlogic,meson8b-smp
           - arm,realview-smp
           - aspeed,ast2600-smp
+          - brcm,bca-smp
           - brcm,bcm11351-cpu-method
           - brcm,bcm23550
           - brcm,bcm2836-smp
@@ -479,6 +480,30 @@ allOf:
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
+            a wakeup interrupt. Required on CPU1, which CFE leaves in
+            a holding pen. The kernel writes the ARM-state entry address
+            before sending the interrupt. CPU0 is already running.
+      if:
+        properties:
+          reg:
+            items:
+              - items:
+                  - const: 1
+      then:
+        required:
+          - cpu-release-addr
   - if:
       properties:
         enable-method:
@@ -720,4 +745,25 @@ examples:
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

