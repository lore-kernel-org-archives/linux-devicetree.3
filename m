Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873358;
	b=b+jF8A+4V9t3C2rAVxBUcf4KJor0rgUG8tADDxPwitZDaJQHdrB602YfSHIYE3adLMlY
	 DSJYTyDlfuRtuRlhkBHPL0J6JwcTfGUwtd6NYNtPADfXIPoGA6DspxvVvskBqbxJQVkl+
	 8uprG55S07fSLDd0xP0myCAaKIjLXpDiO7fcg+qnc3Jl0C0NayASwjkXvJBeBmSFBTpmf
	 fdLAMXWUEhoFQj82iQxwKjnPmEdhWyw8sLCWnon+1J1BrUazgh83ylU7/xDHgc3dNZ2tU
	 +lBzGyfVJXOw2Az7HHqK5Z0wcEEX7bqAz+OrtpelcOA9pbXUBFJLmJ5D4d+YPEm6hWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=;
	b=uT6c6tFxi0mGhJb0QyEpszdnhUoL48PYGtbvcCNuvevto4QwcKlNz+GyZ0eGtZACb6NG
	 9IMp8fckLizfvu69PR8b+X5Cl6LS0X8rUmtMVLgkJTobeCJeA3ZxU1vtWTSGa9JfcL/a0
	 qDoFDy/OFaikePZ5YVHdUbV5RIFXLzApeYx5UJvjMMVvJ5T1nLpaVb5FxNuJfN103lLYY
	 HmXXtlW8bO6FVFs6IzeUmQVCW8euKt0Aa3V7q2OY/QiCY8CUPx/CyCcG5WyF8vxRc0iv7
	 /gQ2MWLGT0dIGactUUNjMUqFM21p/vw3NsN1m19/r2pb8HxyOrm2RwYKDaSu7xxJIig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LYinJJ9O;
	arc=none smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D518C60A2601
	for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D518C60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LYinJJ9O
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4af7283bf83so795907b6e.3
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 13:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873357; x=1793478157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=;
        b=LYinJJ9OhXaxF8nzrRZaZGfcRFHV6ojEbInxF9zFDfV7aLGdG13HR3sTV8U37eCrCs
         9D/caXOr1rohavrMjioauA72Q2ZFYMAW71f+MQ3RS0xHmR6VgJ29k2E+lzMP6ZgyhMGk
         L1Jz1uR/DVBt+8D6GqKdxfy9Jiga30QFLM9Mm6FM5fg8Id0vt/YWh5xJRAee+UfUXqCB
         KDcCCYlckUHboX1NdISqh9E/cxZMA6CZlamQB9regu5+TY3Jci7HwPgWrdixLtsr0wmr
         9JLsb6anBOsihnmpOuFkivWHcc1Gm9enyuMR33YdWIy1YCP4JiIcD4xXWpAlK4SYsapG
         SjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873357; x=1793478157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vrSlKbe3j7go2XMIzF6jdkgisHGXRGalcYQ6D57kGdM=;
        b=WhfN0QKLd6p1Zg4QF1LQgfSRQS8Kh1ESoawI5T3z2+yjFmdBjmHHeQAeVlNty8s7mJ
         9JZf+e++55TKkRkBm4jgBk7tBSl5QD4yzCeAxNVeVCaCFJCe4nEgpTRnOiPemnzbloBw
         sVjJTaaFPO9TEJIg4O+m6BcfuowqqPm7Q3Rh8Y9sHy74sd9Mo2c3gs9C11jkiZlrJqDO
         crZCbmkB7mbdIkKj+3ap2f1RMJK3XwZCz+v/y7vGSzMiaB2eGgxbTnTrYkySEuxGzSB7
         dFvkSjeohh2APHXQHe0OKGqf0wMD1ZUTzkIS/u1ZneTvtl8Yv94mXEg8jdhen2fWqjhJ
         tHhw==
X-Forwarded-Encrypted: i=1; AKwUvBwjd0hTIj4RnmjN7tZlnlPYXcArP0/zvYsHx9NGsvZembKFP5jvaOkwRskjFVPoPdTLOX4ykFNppB/Y@vger.kernel.org
X-Gm-Message-State: AFq9FYKxZODPSFzIM6qnkKPdc7elBDmt4ktd98BvT6g3OYejQFKVlWh0
	0H1iwbTH/oeN7Zb9NTU48kiNcXpXA0KHm+dT1B+UQCB5k+Ss0UL7k1Dc
X-Gm-Gg: AYBFou3ANvgOxeJNbr0vY+kPMlBSlL2ZQpaNUPvdR9KRzcEazJHd/dJTXVpQ8E5t5BB
	ks3OxmtAFueodus9Td5BGPefZkJa5ZA/lfWzlRUrkjt7OY3wQBibjo9ZnbtCWGEY+M0cDb/xYP+
	38JQHiJYv0MzJQfsCiaAC9HQlvWb9m5uVfZXplLRSIJ2sryiFFdW5aOtK3Zb9UKT/ujbYkFMco4
	2yLPXl9OsRnem4OI0N0rJBy5pZ35nMV9xZienuar5doJzgoGMy50wkRZLWNXv6ptX3FCzVyaziV
	hFYouOgZu7e02wByNlt8O7LtvWQKAsHCxLzze2+wSXTmCGLlpGoN+UPKDigla2UCF+XuzXvJ3dp
	1nE8KH8S+MPSq6plYhZctfkvBo+g4Lnm7Nf/3yUCHxdZUncjMuvHmbyD0FlmM8dC1u3Ny/d/YIX
	5BMZoMzMct8oWj0RgrjDNpu/d1qD/JEkgRQZSeQmKnjKybjlrchJsxe4d350Mw/n5qASCLVgxL/
	7rOMrDUo1zTjjbT4/DgG0sAIHpD0iy9zhq87K7xlo9c8U67zH5e2u7qutULbB5uQN6OXWVB0h/Y
	lT0ugUvyJgwQKmG9585febxQ+sKTmVXM2nsvJi4LFwK3piILHehEwG1N3Yt7rsxTsqS5flCeWn6
	0HZea8nJHfFeyJ6y0HPQzrScI+GkXV2dh2mBUAHW5ERoLv1CD+5+kCKF3DE6bqP9z6Sam2RhreY
	waAmNs
X-Received: by 2002:a05:6808:ec2:b0:53b:8f8f:ae87 with SMTP id 5614622812f47-55c003447bcmr1551104b6e.36.1792873356787;
        Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:24 -0600
Subject: [PATCH v3 2/4] dt-bindings: serial: snps-dw-apb-uart: add
 Allwinner H616
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-2-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The H616 UART has 256-byte transmit and receive FIFOs, but its DesignWare
component parameter register does not report the FIFO depth. Its optional
register layout also differs from the generic DesignWare integration.

Add a specific compatible for the integration and allow the standard
fifo-size property to describe the capacity. Require the documented
256-byte size for H616, retaining snps,dw-apb-uart as a fallback.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/serial/snps-dw-apb-uart.yaml    | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index e2ca126d58ba..0f8fd0485879 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -13,6 +13,18 @@ allOf:
   - $ref: serial.yaml#
   - $ref: rs485.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun50i-h616-uart
+    then:
+      properties:
+        fifo-size:
+          const: 256
+      required:
+        - fifo-size
+
   - if:
       properties:
         compatible:
@@ -60,6 +72,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun50i-h616-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
@@ -120,6 +133,10 @@ properties:
       - const: tx
       - const: rx
 
+  fifo-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Transmit and receive FIFO capacity in bytes.
+
   snps,uart-16550-compatible:
     description: reflects the value of UART_16550_COMPATIBLE configuration
       parameter. Define this if your UART does not implement the busy functionality.

-- 
2.53.0

