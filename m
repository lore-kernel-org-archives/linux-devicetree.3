Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571A5400990
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786435808; cv=none; b=UUbjB22wvG6U7BvoZzD1OAYnX3YPvMvkCw5xADLaguaoko9k2+y8+GM5LrpE+F77pQ5l+y9s2Z0fcjq17YPttYZqLrPj5JG8uQtE+IyGL8JvlmIkXUa5ZZVgHvUbSreKKcCHuGyd8JCIUruD8wffwcAy57bsyHZsm7EVtRkm1Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786435808; c=relaxed/simple;
	bh=jbgbQxiggxyOWFNcof9c06sLtRb8Ukd/sZvwJ1H9sBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Iof46aybm8t4AeB1VC1ngu/OYZziRySUYcexY75P+XGEX16SrdxVBUzepvh5qB6G/20jCRiKqHS+UvMmwGJuqm36vnuhFxdbKs837Pmw4O9Wwdpx8n0Q7kDpYYd6mkG+vJ7o9/ZGjg2BDKujpAsYSn8s6IvhHWNAESpoJ85Hevg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bas4mpym; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bas4mpym"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so24611845e9.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 01:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786435806; x=1787040606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72tHxGeDmqo/wIaZhKN/J6u0CHloZDvItpIiDg7V9Wg=;
        b=Bas4mpym4X4Eo1xCQrWMiWheFeWRHbit4rDqWv1mBOK+kMd2fmqDBrKO/5okDRqaap
         NV0THx9zsNcLU04hDeFlASJ/6YJD4stRhfoGVa0lhe9J3Yg8u7C68v2KYOTLBhBXezV+
         TyNXz9jXHG37C0Gdlb5oMZlfqgbFLM3JnQxQ8UscBhhZ9CPkd9/GaoC55hYyTr9BFF/o
         DmqGvIUO1ddeoicGCNIRIqoQOPDNYXryns3SU2ux4SzwY50+UyXJldYmd17NGY7YPGvy
         7R1b5vvQ0X8/AF/0MIVWes5lw5xN7upCrLgTD6MU8EiRGCCee8Xn79QR6UH8Jk88mi2Y
         wpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786435806; x=1787040606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=72tHxGeDmqo/wIaZhKN/J6u0CHloZDvItpIiDg7V9Wg=;
        b=QZIqQoj1T496Vt2dwFfCGCt6zUSzN/V2pzOY3UE7GRN14GJmfbDEO20EHIMnJp3+OS
         TIiNVMSGLCc4v8OUvD2TT7/5Q+W1Ie+TUkFpsFK1FQDgrTsFXt1y67V5hXiaKNDhnXwN
         3wbFiKFzuw+2Ihy7L3+Y1kl0A4s1EdmdvH6c81ERqoSmoSuWpWO5Ow7t7a006Miyp0Eo
         P+8mYLMbfy0dGMTcUkYtkC5THSa4WFesAdzSX+GcMobNbNijpWioC0dCiptXjGmjoWDT
         GTZM8Et0gZ8WW68sB11s8ibwr9cuySRRZKfkE/Hp/+bFDYWFo3ntRfMPUNta+yuiTccD
         0Bcw==
X-Forwarded-Encrypted: i=1; AHgh+Rogg35TOBYB8142Vu+t5jQta2DH3zLEDY2B7zWsvxZSfl4iMwiFjRfGEN6Ix6j0q4pZj+T9f2uOxdKb@vger.kernel.org
X-Gm-Message-State: AOJu0YyJKqHckMC+RR/Dxp2Bx2XmBnRJr9b5pUlxaLGl5BYNwcKeyT7p
	51rKyRzhS9CDlRaBAThXfMyF4dJr34BsHCQOZxedmngWZiWFMimoeNMR
X-Gm-Gg: AR+sD10fxcMgGXpGKwEjpUu1lsmtzOU+HmwCDGHoyYNHt4VhK6NQuxMRxDUh7WJfg2d
	4mKvC4KrqW10A3wT9/ITWaB9hemGUhNP5ZY8YBKHGOYNPaWXPSWPYfdsWExwYS9jSH6UbAweL+P
	/uvGzScWbmUvXRNsXHzz9VwXjUJn1jRyLkX0g8sAZVc1YcOWSz1/rAg3+su9xT4ovRTSc50TuF0
	atNatmZO7B5rpc4BXPjQ+t5kmm3Y23hGn5DzfRPQi3db1Px/i2ZKUkW8OmnK1FjxqklKexTg7rR
	IPb+3mXzffp+jAhNzPEJtk7PcggXb28pE0zSGu+DDaUgPnyEPRyd4ueU8lDgV0fUOHM63HM+8pe
	dg1kMfgsBkaUNyWdHxCbMnAL8zb/pVUwrpcSvd2exxmfcbr6Z0+u54l7kax/2R94eXWDihcwbvX
	fexo2OrtxLyYRRedphs7sz+M+mdHDZleNQH8fyoeZq48rH6mpCuAPSKqyCSXOgrXTya9PeJQgR/
	7LGGjmUA7X/ueIawqfu9YwHZbeV7iE2GIbA6VeDTLZ4Vh5+
X-Received: by 2002:a05:600c:c162:b0:499:484a:7644 with SMTP id 5b1f17b1804b1-4997845f3e7mr23581055e9.9.1786435805464;
        Tue, 11 Aug 2026 01:10:05 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-3-207.retail.telecomitalia.it. [87.20.3.207])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49977df9489sm45336675e9.1.2026.08.11.01.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:10:04 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	John Ogness <john.ogness@linutronix.de>,
	Manuel Lauss <manuel.lauss@gmail.com>,
	Haowei Zheng <zhenghaowei@loongson.cn>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Rong Zhang <rongrong@oss.cipunited.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Gerhard Engleder <eg@keba.com>,
	Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 2/3] dt-bindings: serial: 8250: Add Airoha compatibles
Date: Tue, 11 Aug 2026 10:09:47 +0200
Message-ID: <20260811080950.664379-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811080950.664379-1-ansuelsmth@gmail.com>
References: <20260811080950.664379-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Benjamin Larsson <benjamin.larsson@genexis.eu>

The Airoha SoC family have a mostly 16550-compatible UART and High-Speed
UART hardware with the exception of custom baud rate settings register.

Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 039bd392f876..9a3f596f8a0e 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -105,6 +105,8 @@ properties:
           - ns16550
           - ns16550a
           - ns16850
+          - airoha,an7581-hsuart
+          - airoha,en7523-uart
           - aspeed,ast2400-vuart
           - aspeed,ast2500-vuart
           - intel,xscale-uart
@@ -113,6 +115,9 @@ properties:
           - nuvoton,wpcm450-uart
           - nvidia,tegra20-uart
           - nxp,lpc3220-uart
+      - items:
+          - const: airoha,an7581-uart
+          - const: airoha,en7523-uart
       - items:
           - enum:
               - exar,xr16l2552
-- 
2.53.0

