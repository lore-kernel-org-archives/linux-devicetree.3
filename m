Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7279466B13
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 12:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785932436; cv=none; b=V15ET0fWfmdOC+Z7sRmhvlh5ooCnHdrJlQTRQIZvHEQ6eu6GxWZ40aAlsXFA9wSIllg3GNGrUkYibsj7AOqn74wSCqVfeeLa9COgk9Vk3YDnF8SPcEn0A41l86ar28umwQq6RvZkUPaOfKJ7M0xC7u7VmJ7PR7IRO9LLiEu/PkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785932436; c=relaxed/simple;
	bh=3X7WL8xkq/xgDF1Yg+6dXU2AAPke6iAzEkoxOpEOTPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7yopyZth2KmFYOM8jD9Z/h/bZaxTGf2p398/W43x1ajp9jptfJd0QlMhiTkgwiJ+Fjjp4Lv9WIjfqAa3UZq19PHxbQ/c+f9IbXwwNe3cWrHnhsvXRnywjoT4kgb45XHeYisZ/ISM/9gy7iYkoeNYoBvfLW5AqivpxyqaCrm/2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=fCBwq3wj; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="fCBwq3wj"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so8353235e9.0
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 05:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1785932432; x=1786537232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bz6C6stmStVMzEFUIQDnKapYsxwqb3V9iw0SJh4YNFs=;
        b=fCBwq3wj4guwNRBMmDZfWUE7Bj9psC5iB5Oi7PQe/nQNva27tSl9rKiEAyJbn4YKLA
         55lpxiuMlIpYfrN90FNge0oR4BaV/+sAbEppR3kX4b5tyLjzogJOvIhK4r6p1oLNWzEX
         6MvcIlnAPWRcFO4ss6/HdVE+cYxB0nlz9rCwtCsHmTWjaI8HHJn+1rvXdjYCl7X1g3ia
         75lZ739clNp7l3GK24noAho8uVxooNXj74MDAofZuSyLRk3a9d0ekeDcMDy1Zbr0NiLs
         KOgUITKL9BsTRlurbumXAfFil0rMZtKyW+BZFG0lP1rNjpFVSk2Phx1sR6D5WRIMDMnx
         pfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785932432; x=1786537232;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bz6C6stmStVMzEFUIQDnKapYsxwqb3V9iw0SJh4YNFs=;
        b=lCINwfL5LpozcJmz/ev5VeA+k3zjS0tl/Wj7lTeyWQzQTeJNzsLNN0wAQXuGRT2AJd
         18r+mvY+kQ3u7hm4Ao6E4xOxpl5ealX8HFzJ3VZah8sfoW0KP6rnd+Io0saN3ip0NqcV
         1mypq4yhIdNUWnay7o5nBsu7ZdG33nzeFKkKaJOVY1FPCDWs+I8JDGP6XePa7Lod07LV
         hlWRhlUXGrJQvVhkoS2pKvOiEwfjhXWhCBvLGKsZg9w/sNr+ZnCtM8XGXu4x4C48f79a
         9nQqwOzR3WUTCL7ow122jl9pyALvZ2iH3fiLXOgDY8RqCBwdLkoqgLUwY25Ov0FfERKC
         JckA==
X-Forwarded-Encrypted: i=1; AHgh+RokJpDuqz6BrZ/Huwc6RwwNfrMspUzzOWzvFApKTz+sg1/xYcjCO29VMAkzQnRXfjDQiqhh2ZNQfBhY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4dvvI806L73joqEdVMYzNt0gF5+RiXzHdfjAgtP6B2BvfYvPS
	c9PQB9tuTi/+WF2+If7l+JLXVDt3a89P10vxYdTBKM7H8ZE5fPcO3gcLeu2WpLNm3D0=
X-Gm-Gg: AR+sD11qnUkcpE1imzDSTOdxjViv8DWOKvau22duJI+mWAz3kblJsAmoX0ta6WIRSy0
	+yPFVRfbmGL+S3PuaIj/RUVPU/+l0wSxr9FG1/OrCedWIg3DvpQz/6hLc1hLPt0E0HGXM/RCd2x
	x6tUYqDZuhLNUL0/DDAIE/SdvsygHgehf+H264Vfw4EM14QG1fc9NXz24Y74RMv5D35/hAP5aXr
	qZk5esiRqf1jMivn0DoRImOmUNlWSULiMld2KEhM/b1qV7zfMYS8PywNUlMsdYE2gWckT7APdDu
	7miEaPDbEjF274nTvRSD5NOIa9eaQ9dK303Bwz+GO8oVC7C4c96iX48opeTqFrWnVCrT3znAGhr
	c2AbRJ+PtJC1oLO4bfVFAahVUNmXEfi63ghCKocJieXGbldvdVfnuR8L27zVMFhupJ9ojejFvVh
	K3Q+NxLNal4zdY593taluEJ+PL3EyH7XRXPwoVBDzzSHQa0Nzb4aTSOQK2vSGZzDBe143LcadIU
	WzvrI/t2mZHBHeNJRoKvEKjHP5TH3wADvp0mPu7j4O9j5Tom6Oueg5hvVneF/mM0gKB+OeNirR2
X-Received: by 2002:a05:600c:198f:b0:492:4e09:9fc1 with SMTP id 5b1f17b1804b1-4994e7cc5a4mr72969715e9.15.1785932431891;
        Wed, 05 Aug 2026 05:20:31 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949f68f95sm196663515e9.0.2026.08.05.05.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 05:20:31 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	tan.siewert@9elements.com,
	linux-serial@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v5 1/6] dt-bindings: serial: 8250: aspeed: add ast2600 and aspeed,vuart-over-pci
Date: Wed,  5 Aug 2026 14:19:48 +0200
Message-ID: <52d5bce1cf8ec3ff0b27e7313655cf7ffa2236b5.1785932211.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1785932211.git.gregoire.layet@9elements.com>
References: <cover.1785932211.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ASPEED AST2600 has 2 Virtual UARTs accessible over PCI.
The ASPEED AST2600 can be used as a PCI device.
2 Virtual UART can be exposed to the host via this PCI device.
These are 8250-compatible register sets and can be used to have UART
communication between the PCI BMC and the host.

This boolean can be set to specify if a VUART is used over PCI. A VUART
over PCI needs a syscon phandle. The syscon gives a regmap to the SCU,
which is used to set the enable bits of the PCI device.
On the aspeed's chips, the clocks phandle already points at the SCU node.
But deriving the regmap from the clock provider would misuse the clocks
binding. An explicit syscon phandle states the dependency directly.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 42 ++++++++++++++++++-
 1 file changed, 40 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..8dd4b7af0c0d 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -18,12 +18,34 @@ allOf:
             - aspeed,lpc-io-reg
         - required:
             - aspeed,lpc-interrupts
+    then:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - aspeed,ast2500-vuart
+              - aspeed,ast2600-vuart
+  - if:
+      anyOf:
         - required:
             - aspeed,sirq-polarity-sense
     then:
       properties:
         compatible:
           const: aspeed,ast2500-vuart
+  - if:
+      required:
+        - aspeed,vuart-over-pci
+    then:
+      required:
+        - aspeed,scu-syscon
+      properties:
+        compatible:
+          contains:
+            const: aspeed,ast2600-vuart
+    else:
+      properties:
+        aspeed,scu-syscon: false
   - if:
       properties:
         compatible:
@@ -106,6 +128,9 @@ properties:
       - const: ns16850
       - const: aspeed,ast2400-vuart
       - const: aspeed,ast2500-vuart
+      - items:
+          - const: aspeed,ast2600-vuart
+          - const: aspeed,ast2500-vuart
       - const: intel,xscale-uart
       - const: mrvl,pxa-uart
       - const: nuvoton,wpcm450-uart
@@ -297,7 +322,8 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     maxItems: 1
     description: |
-      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
+      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart and
+      aspeed,ast2600-vuart.
 
   aspeed,lpc-interrupts:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -306,7 +332,19 @@ properties:
     description: |
       A 2-cell property describing the VUART SIRQ number and SIRQ
       polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
-      applicable to aspeed,ast2500-vuart.
+      applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
+
+  aspeed,vuart-over-pci:
+    type: boolean
+    description:
+      Enable the VUART over the BMC PCI device. Only applicable to
+      aspeed,ast2600-vuart.
+
+  aspeed,scu-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the SCU syscon, used to enable the VUART over the BMC PCI
+      device. Only applicable to aspeed,ast2600-vuart.
 
 required:
   - reg
-- 
2.54.0

