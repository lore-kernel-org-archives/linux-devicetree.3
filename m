Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B9630F94D
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782224981; cv=none; b=MGqhXU9vjqwAqr/EijsbAzDC9T2t31jf1ninwreTbztevICH9LuO7V1VMZXWmvoADpddLoezK4oaKVsYW0C9jWc3m0gZtu8HONzhs2I/k0E87hy9yd2YwHijJWv6oM9N9tNDrxNXrVr8+1wNNAc6WG5isywRYxTB21KmZe8muKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782224981; c=relaxed/simple;
	bh=GZKq2FfK37SiUz/vGp+DtJDkIGd6OcTZnhk2iAU0hY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eu7Pm7lu2wcYTHrAHSjMRfGFp49UqTv2uv9S9Lr8qCI+epC6mO1iPjJDVXDJIGJZK89hjShg6kQsGpZBDhZDXaBFplMjsQBHmXx2t9tOgZOOqTjK549cPpDPY9w502/CC2/FFDu5EkvsPAuPjrSN+okF0JyNczQ1w6nBJu7SF2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Tow8fW1R; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Tow8fW1R"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4924593f45dso40675895e9.1
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1782224978; x=1782829778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AysfAqLHKC4SKWa3K662dSCe3xN/q/avVvGvjinHOPI=;
        b=Tow8fW1RwzOohOaj3yisLIS5PYzAI5/TEZQJpTOADFfAHzsHSrnSdE4b4H8iPfkKLd
         fJsAFb8AV9zaF3EBN/b4iJ9S9v0em05Tf5RCWfzEot3fS00v09rIdic+4xh1dMSaAxJL
         SWrifITfnEqIqDHTxf9AlvOeJL390dAxXeXli+9T5Fvfc34qM1hAjwykdQuy+ElFcDZw
         HoaWOt+4Sq2TbKiOkpY1ITSREwyshuBWhOxQ5SXw5v6y0TD27jEkgbxo1M/zEQgOy8Mn
         PtQ2BjVLdwOu2oXVAs8qbK7V2Uf4/E7gN3y3jn0kwCMT8DiBJDYl8lfYBDMo4p8DWCVD
         B+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782224978; x=1782829778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AysfAqLHKC4SKWa3K662dSCe3xN/q/avVvGvjinHOPI=;
        b=dtbvj1VsB4XH0ngpRWQIEsyyl/Ror1+V+eYAZFqpxjyQRpz73tzdvX5bORF+brOAuV
         v4QXYfURDFrSi54uPNYg5vaeRGNW8QIdpvp/vyN6x4s8yJTx1lG7kI7aQdlRFKS/qP8W
         ALs6zbIhrTVxC+HROqGsJ3GtgJKIbsts0kJ5I8mTig8fKKorom/E+DLg4Neh3GlHfT7+
         rr66UGzw2jE5+Scc/sp0OpmspDyFyIRXQyhQd/Kr5wKVQ459u9OSmr8HpDPFU6F0m/Ne
         Y0GB7p/yf+pv++Vtmomt+Lo6wa+kCXslHv6pQOmEhtR8l10W/APRv+R5NcnlkCzqr4Rb
         skZQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KUVFIdt7ahXp3P5Bj5qLmKtiKBIq7mapcR32Skt4+WEPvbIhTHcw8bgWPiXNK6T0ZSFLsKZHvcijR@vger.kernel.org
X-Gm-Message-State: AOJu0YxApQXthjkri9Y4NLOxfkaodxD+8O5R8/Oag1/xETfJfgw/vbaN
	Nw+jzKnlocam9t09LQTWEOexFZys1/cvRyXIyhgsTBZmvxOH6WKTjA22DByYjKADluc=
X-Gm-Gg: AfdE7cn49H8rsY225gvVhCTugtmpLWAbB5HtHS4YUA/uwTVr1bEvqN2gBmoKrBqVC8m
	YtQzmtJfPFkQh18D+tIP3WgWZO0SZSLF7bo7nLP9g9r7WlFrRRXXRgnKMQ9VpXI4+lOmqr6WFqv
	kBOt9URGaD9vYPdSU0gCQr+gbWVTmqtLVpcD0+hv5GHd1EpP2h22qFQ2m2EJINrIfRracaUagtB
	lrPUYlOkocmHhnGwMCe4Ik7ERXgAzT0i/YS4BKEOWknu0sfTLt3fRQilkeT1hnHS7cvx7VOiUKu
	c2lwKhk7ILc8uL1BNLopMsZVOg1bDsznbb5JFqw7zQDaT7aEnKOf6fefW7x55td10VBOzCMGFp1
	O7X8mrg4VNFlGQ3Vt8wu9PkEmfjjEBLwyrlWyAIi7Q7Yktg9u9Oa0EosL3AF6eeruB+/uH/INuw
	+8IFEX7CDPeIqbx5RIKweC8fKpUIlOtr5HJVcyP8aYtJTCUUItsXVJoMN178FzoBfbypZXKbsXK
	PUyMZXmiUsP4I1UuJ44ratKIsHl
X-Received: by 2002:a05:600c:8b2c:b0:490:ba0a:1178 with SMTP id 5b1f17b1804b1-4925b3b1732mr44346605e9.28.1782224978401;
        Tue, 23 Jun 2026 07:29:38 -0700 (PDT)
Received: from gregwork.sec.9e.network ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49240efc160sm362507805e9.2.2026.06.23.07.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:29:37 -0700 (PDT)
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
Subject: [PATCH v3 1/7] dt-bindings: serial: 8250: aspeed: add compatible string for ast2600
Date: Tue, 23 Jun 2026 14:25:39 +0000
Message-ID: <80d983887dfdfc7e70a6db95f8cb95b7312f3044.1782224059.git.gregoire.layet@9elements.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1782224059.git.gregoire.layet@9elements.com>
References: <cover.1782224059.git.gregoire.layet@9elements.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The ast2600 was using the ast2500 vuart compatible string.
This change makes it possible to have ast2600-specific properties.

Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index bb7b9c87a807..3cbd0f532e15 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -23,7 +23,9 @@ allOf:
     then:
       properties:
         compatible:
-          const: aspeed,ast2500-vuart
+          anyOf:
+            - const: aspeed,ast2500-vuart
+            - const: aspeed,ast2600-vuart
   - if:
       properties:
         compatible:
@@ -287,17 +289,19 @@ properties:
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
@@ -305,8 +309,8 @@ properties:
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

