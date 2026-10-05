Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356C64E0B81
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 17:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221176; cv=none; b=h2tN3AXjsE79Hs9y44LgLLgGN2pTI8gNDMvsx9sW2JWwFjEJNw3mdV0at9TxDyFCR6HdNHYMYYb4FTDSlX66jV9CxYoCWX9QKgOAwYmX3g66ekbzp7tha9eNNRQd44XVuH5Dh8zyhv1RGFu3BpcK5JwOqVujamTYO6aquZRPFuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221176; c=relaxed/simple;
	bh=RteOrGLlQTXAnYWg5zjbSnYFrD1pgoJ54/qMOu/aInU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S4iBSDMKwUHDR2Ph42xeGP4iWTxe6M66GkGeBWrBRq4WueffgXovYRaWToCfdixyGKLg0A7MVNVuKTHJPNOWJbBqp4IIe4s/3B7Lm6iFdTbMsjjoqnzcz8gpsCovOtLE+MYnkW1dxVeESkFQ2ORJdp3zhfgvQ3hq8gZkM0cfvYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ssoQqnrS; arc=none smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ssoQqnrS"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aa8d882so1549931d50.0
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 10:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791221174; x=1791825974; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mcdQtERBvEEEhQkX7i6RjlhDSgKxE0CpVxD5Gi87UTw=;
        b=ssoQqnrS9oZqdE2wLjqbCqYpW3uaMGwbUYtTR216b31V+vSNQf4RrWELEdaNBW/5rI
         VlSL41I9SIvlDz9b3p/lZsNNzV+lMNaf88UKyEMxK0gZ8NrtJEa3mflA+SOxOJdZlZWO
         MbNr0cHJ1scG40NKwLqOsS6kNtvzCl5JCiJPAn9VVnXnQWzZO/+ONpwyefwbRsHRi+p3
         RKhKgnK8UGBhyKXLUhbbsECt+eIdWJl4GSwLbwCO/Z5ATOSJMq2i6pW3qKpO/6frWPZa
         E2qbmBqoVULvaUyT8rhV/4rQTSjoF7UET5fvpKWibY1yF7GocBYDvzUUV/7xsUvaJj9s
         8RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791221174; x=1791825974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mcdQtERBvEEEhQkX7i6RjlhDSgKxE0CpVxD5Gi87UTw=;
        b=GoHN2wbw5BWPoTqR+ENBehpdpY2hjbMP0W7o74qUdBKRdwnm4oo0zmP4mXIsHQxsUL
         ZA3+mmPJY0eHagTrlG+gJU3Z+p7p8+tP/i7Q0LXWiItx8GdFlnBfDu0GG3yadOm2Lqu6
         M8Ohc27jwJ139ub9zmDjNlAfoDRNYBsfliugn19qr/pYrVX8vQmEXgXdEK3T3TstIpiL
         EYdca1f1VL2H5pyEnBuxx9P0o/zPpbndONAplLKvjrXBSVltpADpo0xakfCS+iRXpAF9
         NktkMgVXG5KIQ5vF/2OuHm4ah6L1OcxKmuLvaBDaArDLIYmXKV15M8jN3ppnHQ/fuL71
         Tz4A==
X-Forwarded-Encrypted: i=1; AKwUvBxyt2A/Mm0qf62xF+nmpFSVGfgLel21k9GAPp9hu43z+v3JWqusuOcNaV0lpFTmIdlFquiOP2Bb7EIC@vger.kernel.org
X-Gm-Message-State: AFq9FYIc/MiEhpkNtHFFPVJ5Qy3Bv1rTNMsJ8ideR3xa06tyTMagwy+i
	9j9d4JLm/G/UviiR3QcpKwUYJdwbtglldxkLjnr5XYxcAFu/g2HPiEK6
X-Gm-Gg: AYBFou1S0kqXG05gdBhk3Px7b3SHuwZH/00JsDlSiVLkjrDwHXbfXOPnofNLdTx45n+
	q2uFgH7WJoSxeBpKO/6zkb35cvdLZd4w56TZvX4X/wJt6zjiV/ArkopMYjK2u7eaVDhFwAJnvQs
	nPFnwHF8DMDmV9BkF16VkOTLX+2CSZr/JTTbNGC7hvi7wM3YA2h2Ol08Kx3HM2NN4x21o6ov9i9
	f+/tO4oN6wZ4rU6N09cDiPTXSeKrhkOpobqsIdha0JyWJ/J+lMdxZnYGmULK4FEIRCL5BfSJTPq
	GdzGYClbx7dk0wIT+XUWdh/Pn5ouSOKPedHpQiGUBentun8giDecxkepzPaEr+22XtCQB9H7t3n
	0YNIUoM23syXRkg9Hq8dAA+HzxDH/4nWS90U89tMUoFwTvJY5IZccGdmzS/duQqMydrex2e6HRB
	Hje4bIRBv4uB5157Xg8crqAl7Tdyh4pJs5547jvg0PHxMJtI8OID180eJMjHssPidmcCK5f8Rev
	jJ6hpPl/hnrbVzwfERa8JzJTTeIyjcmj1R5yiyP7A49EdFYx1FYQhuepe6ng4DUjNflod0xqf96
	NZOc9w==
X-Received: by 2002:a05:690e:11ca:b0:675:5ce8:f037 with SMTP id 956f58d0204a3-677abf9bb0cmr4946331d50.35.1791221173929;
        Mon, 05 Oct 2026 10:26:13 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.237.181])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677c1b1b585sm3449969d50.5.2026.10.05.10.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:26:13 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linux-serial@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Enzo Adriano <enzo.adriano.code@gmail.com>
Subject: [PATCH 2/3] dt-bindings: serial: snps-dw-apb-uart: Add Allwinner A733
Date: Mon,  5 Oct 2026 14:25:37 -0300
Message-ID: <20261005172538.398522-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261005172538.398522-1-vinicius.eduardo.pedrosa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Allwinner A733 UART is a DesignWare APB UART with two SoC-specific
differences. Its baud clock is the bus clock gate, which can't change
rate, and offset 0xc0 holds an RS485 control register instead of DLF.

Add a SoC-specific compatible, with "snps,dw-apb-uart" as the fallback.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
index 86dc25919311..aa8cab5ba3d3 100644
--- a/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
+++ b/Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml
@@ -51,6 +51,7 @@ properties:
           - const: renesas,rzn1-uart
       - items:
           - enum:
+              - allwinner,sun60i-a733-uart
               - anlogic,dr1v90-uart
               - brcm,bcm11351-dw-apb-uart
               - brcm,bcm21664-dw-apb-uart
-- 
2.43.0

