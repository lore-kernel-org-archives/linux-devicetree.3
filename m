Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDE940926D
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 15:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783525113; cv=none; b=AH7WW3yjMKPdS1xf2gAzsd0KlE0rflbTK1PVmOMAx2/qaIFhSmoMjXyIjdY1Ki2rL9aDTr0HPRuBO7D09m60qTFjG5905zWILNAmZNa9GSOfIMoNTiMUsDkwH75/q+wmXDAhDN0Ae4WrRdTx79yyPZ7/isFMzMDyxXhzlou5iPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783525113; c=relaxed/simple;
	bh=jp/3N5Agf7eCCJsJNwDYCLTyVl2tbpreHebJX8abW1U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aAclUqw23DtlTMS29Po1DpkIp3Cb33u8Rp5kesc/6Fuda3eZvQ9/N974XvVXPIvLVznpx0nCFbQkSFuuE4mI61PNysyhT23V1Oyn2CMeuzwkK6Z0ft4pUCclTZpVnf89VVLbT1JWSnvBByMrx5AHEJ8m9Buok56tfsRP5M980WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=UeFvW53Q; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="UeFvW53Q"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47d6c634f45so643118f8f.3
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 08:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1783525110; x=1784129910; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aX3VKusEpXR9oPYMG8wA1f/3Abd5fn9FdmFI4yazez0=;
        b=UeFvW53QO/fKzqaHfcpUhAgiXcoP4oiuensEDtKUJu2dQecoWTE+nzYI3rL6nWAs3/
         O+uaHNtVc98gsXoJFZ4Ntbm3jMedsBQBHNbDyFxPcPS0ypKQDSSuvI5bj69XoNvaceiq
         rBs9WpI8EZpa/UULVz/9iCrX/BYYCTtsW9wiKl36ULWhVIFqUzDc8HPw0/IzMDDiWwpB
         EaK7GOV0/nGHNIRqemYaUuQSuuZSW6wtuEShGtOiZYRxDjtIJHg8S/xanb4YJm8mQOjN
         9b42yy8S7fMrcZjRdcn+f0mCsVn5gGGwJE7RbNKC459mpxJ51l3gMITXyYR3q+AS0lJR
         rDBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783525110; x=1784129910;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aX3VKusEpXR9oPYMG8wA1f/3Abd5fn9FdmFI4yazez0=;
        b=Rn5kcoRLxPoSDRhsYlx2fo6xlVQEYAo1ngmk4QnkXFU99rYlQle+wbSvP5pWA9K5vd
         edj0pTOXrdxY4RiY/iyxuBQTkNQl1zuA961zcEDpGZOBqGciWVCm8dB8ViNPjKeap0ha
         a6fssFs0pPc+0YDwXRQz7p0dIlneiMGCyXbBZaDFqSgxmxWARyINxfbRRHcUfQvAM5M5
         /qTT6X8HGylSlZpch1taKpNIcmhwmU9WLPonN7J7+QbEQG/DS233TjoG3dl5w5kejBBV
         zWVo8sFdGfYHOGwiOQ38IJXt5El1jCAZWhRx/PLpRuk9VKBob/2HG85J6SQGSkrRvPct
         8bdQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq+5dd8HVYhjH/TE24rMKtxwOLpGGOzWZ2myxpcejDA6C4O3064ssaH9HlonqTGvLWo6LGQyBUhPiVf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3bZYBdVU3Px2BBkte0IXICjYep5M3FuJJqNk+Uh9jkpDzJK01
	+wuz+o/MF3PO/6MHrzwme9mb2S/hKQAA+YVe+wU2WRnb3/zLU8Eqqoo8GKeXXa84Xg/tqlVA3Vh
	5ZA42gOo=
X-Gm-Gg: AfdE7ckVoAbRSQfm1bAeIMUctWpyZ+nT/OwX7b9Zzlft+WFUDqoV7qrg6OHRgCW8jtj
	E9u6jNVdM15guAo2xJScdgmBVUgylYwfEaenosnOPUdk7xsaG9CX9gN9NB2AW/wmjcecC23hAT6
	gcpijHntBDLPGm1df3WZUYQeGlumcAzUwzqG+41T7jG9kY+SuViltM/J+HnIRC6HVDW+WQ00eC0
	NHpxUDyc/AKiay55wKFy7CrFblDhEdnB7FYer00JI3OafGj9v8Iql2XV1T+V1EcbF+ooFR6EOMB
	FTzlsn9R1bqsfkTEYDKaVDASnsXEUzSvvBLEijEtsKAawy63ZCiwaO/9wbe0isIkQi5CJDj+pHi
	20MIVwU8+8+VSc+pz7I+fmuT5M/vi5cL7AJTVLU2D5pwdGFbusgpZJrT1Ph2Ry8RXohVoYi4nZb
	1U8f/Ka+8oj5y38nBhejJAUChNJh6KXCnIfbh8eiuQYgn6L1l4ifazOJUeD9b6UAwSCgm6gtQJj
	s1Rq3Eookt36u1Kh7/Yw6UGi0RjQbWNf66IIio=
X-Received: by 2002:a05:6000:25c8:b0:474:9dd3:981 with SMTP id ffacd0b85a97d-47df07314bbmr3555871f8f.26.1783525110073;
        Wed, 08 Jul 2026 08:38:30 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm44254136f8f.15.2026.07.08.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:38:29 -0700 (PDT)
From: =?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	lkundrak@v3.sk,
	devicetree@vger.kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: andrew@lunn.ch,
	jacky_chou@aspeedtech.com,
	yh_chung@aspeedtech.com,
	ninad@linux.ibm.com,
	anirudhsriniv@gmail.com,
	linux-serial@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Gr=C3=A9goire=20Layet?= <gregoire.layet@9elements.com>
Subject: [PATCH v4 1/7] dt-bindings: serial: 8250: aspeed: add compatible string for ast2600
Date: Wed,  8 Jul 2026 15:35:53 +0000
Message-ID: <cbe59dfba231dcd55fa86233dc076b017d67463a.1783524645.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1783524645.git.gregoire.layet@9elements.com>
References: <cover.1783524645.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ast2600 was using the ast2500 vuart compatible string.
Make it possible to have ast2600-specific properties.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 24 ++++++++++++-------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..8f22121381fc 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -23,7 +23,10 @@ allOf:
     then:
       properties:
         compatible:
-          const: aspeed,ast2500-vuart
+          contains:
+            enum:
+              - aspeed,ast2500-vuart
+              - aspeed,ast2600-vuart
   - if:
       properties:
         compatible:
@@ -106,6 +109,9 @@ properties:
       - const: ns16850
       - const: aspeed,ast2400-vuart
       - const: aspeed,ast2500-vuart
+      - items:
+          - const: aspeed,ast2600-vuart
+          - const: aspeed,ast2500-vuart
       - const: intel,xscale-uart
       - const: mrvl,pxa-uart
       - const: nuvoton,wpcm450-uart
@@ -287,17 +293,19 @@ properties:
   aspeed,sirq-polarity-sense:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     description: |
-      Phandle to aspeed,ast2500-scu compatible syscon alongside register
-      offset and bit number to identify how the SIRQ polarity should be
-      configured. One possible data source is the LPC/eSPI mode bit. Only
-      applicable to aspeed,ast2500-vuart.
+      Phandle to aspeed,ast2500-scu or aspeed,ast2600-scu compatible syscon
+      alongside register offset and bit number to identify how the SIRQ
+      polarity should be configured. One possible data source is the LPC/eSPI
+      mode bit. Only applicable to aspeed,ast2500-vuart and
+      aspeed,ast2600-vuart.
     deprecated: true
 
   aspeed,lpc-io-reg:
     $ref: /schemas/types.yaml#/definitions/uint32-array
     maxItems: 1
     description: |
-      The VUART LPC address.  Only applicable to aspeed,ast2500-vuart.
+      The VUART LPC address. Only applicable to aspeed,ast2500-vuart and
+      aspeed,ast2600-vuart.
 
   aspeed,lpc-interrupts:
     $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -305,8 +313,8 @@ properties:
     maxItems: 2
     description: |
       A 2-cell property describing the VUART SIRQ number and SIRQ
-      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH).  Only
-      applicable to aspeed,ast2500-vuart.
+      polarity (IRQ_TYPE_LEVEL_LOW or IRQ_TYPE_LEVEL_HIGH). Only
+      applicable to aspeed,ast2500-vuart and aspeed,ast2600-vuart.
 
 required:
   - reg
-- 
2.54.0

