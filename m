Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3542494A08
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 13:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320637; cv=none; b=RhgwpiSutRLOX0bagAMwVfnxeBiEEWNaZCALXHvAHmB5Dev/e3tfM/b7MwxYMVlX/o2RlwNeR7mmRBbVKl5vRcQrWUw3unR7d05rUHKSWuuUQrGGc7neRBbGf22U8d91jqtbzxWKK0FgjlCDPqvuS7+OhgpfJxVTEXqszgvQYR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320637; c=relaxed/simple;
	bh=AH6oUfHnmcXsnjm+DxjEoBqd1Vb5FnHglP4xh9aXyJo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmaVh4xsax91jT2+xaP+OovU8Ba2WV/v3v6KnoHLORR4uG9JvHUO9v4UBmKhmIrwsqugyYeXwGwfSbEj4NipoxmbKuLqNHPKeaxvwLwORCTNzeuQ1D/wiM42yqGehaoGY9UfJtbmcOLR3I2RrUuiBjrzf/JklpIBBweL9wvpIlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dZeQPy5o; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dZeQPy5o"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso636797a12.0
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 06:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320635; x=1787925435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4G1vL/8vEDUkF7LKjkQY5Lqad8PP0uoAQCy9KkC2pcc=;
        b=dZeQPy5oWrPmBZoAC7p9feIB7O2ObUy6iBDR+P06GpkVb/USsyALQ/i4rLEhduOSpb
         1V9sEsFOlRVKiub+uNv7KVAW5gCKXDIW7a8L5MFoY8w+d39rOHWVUr8wQOmeH6xDkT1s
         j/1AnnbeBIqzR8nsNJ0pisGbDHmVhGU+9qJKcITbXuawUSO97YPommA//1kL/6JItfnO
         xO5SuRz4wRFgQfqiv6XAnPj4r93ugOe79ZBzkxr1VM3JT29cpmqOUBKde9XzK3buEjfL
         3Yvxks2kdiPLCuHFzxNWAfPBgkR+7FqE5brRUO9R0V83Ba95eYCexdkiVQ3BLraZfOvv
         k8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320635; x=1787925435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4G1vL/8vEDUkF7LKjkQY5Lqad8PP0uoAQCy9KkC2pcc=;
        b=EY0yfrmZNkWivomINHBVxS+fj4ajMaeNvnVgqya+cF67eW6ROb5xHZkd112JLmhHBY
         RYfGV9GAlwNBSQZcmNeh9LqfGI5Q7/PCVVqtDKX3imNcf5daNLyzkluNa2jyt3gvSDmz
         t9cn3xYRR1OHBq+dwwYCyvYTXCtExErSajWDPpCewPTBF+xKyROwbxSjk9Ex+5GXyW7n
         /MUk/pq4lFBPiiIl++KIP7Ek6Whi+3DA0v09OMrvrlUAVN4VAzdNt8OaX+J+QGtkUcMB
         kwelTf4s5rO/D/EqzU9e+acuultpgNAoCtUdcy8vQNZVZYIA19gKuSn9xy+00YD9pIUc
         OIUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1fVrmFvxR8kRJdpDLFmnqrLEtPHGL7pLwJnYRWxK6NJ9Njb2cty7OE2eHqM59GIYTJegbGJRRBk07@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/uIS3hHwwkl+TErYQ4c8TmuOk7VmbmRbkaOjZILic2Jli7POR
	esv9MHjYtZIVFCR7fL7z6Vek0a1NS9IM82VMBgEKYgjdNJhe61BZ4Ijn
X-Gm-Gg: AR+sD13Ysso+b9NjgZ3L9LdzVftNGmf+f1KzW3eTCe56VSaEwW7lQcii5Jeea9IRZOn
	SX1zr8ifhJhjzeXJN4+/f7t+AtLQ9jM1uLmHsqfofbjnie2L8YrmDJbagTlm84NIrVVVo8CYDDL
	ygnQJtQiApQklBbD050i8al8hLMDNXohOEDZtc35yDrVaQRpNf2cPYxc5FRAOWbNW77+V8uJS+u
	N5/SVIm8Cof+gsrfXBFJ2iUw3wxh8fY+eLOUEztYdsPm03R605Qtd3wtz6rZS/j+AWvcme6Q+bF
	D1LP7rd1Uqt7qprKUNDPyuJpWwQYlmNtR6ucAJMBhLO9FDmyuw7w7k3C6L6RcnUF/A1fKBOb0OC
	qu8wtaFy7Qu5NciUYaEAzOF3LKN27nSnid5qU6I8HFaApXBxRc+1ldigP7WztmDl8VRheQdLM+7
	ylqnlWcbL4ZPHxjCm4NoLcvmfLW1KjsLkyPGMQ76SVrC8HiJJFZU0xOn7rU9PYYYXMcyGMxRxZa
	9P2kLyzzk/VFEKOgh6nOegx88PHVQUoEO7kIfmBOLzeVMWoJ1a7huzYYQ+I2tAhJm6t8a9zqP0f
	eZivl8dZJg==
X-Received: by 2002:a05:6a21:9d48:b0:3cc:fe21:bf6c with SMTP id adf61e73a8af0-3cd3009d046mr14054819637.11.1787320634827;
        Fri, 21 Aug 2026 06:57:14 -0700 (PDT)
Received: from iku.example.org ([2401:4900:1c07:efb3:773c:1c8c:24ea:eff6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327d01ff056sm19972277eec.19.2026.08.21.06.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:57:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 07/17] rtc: rzn1: Fix malformed MODULE_AUTHOR string
Date: Fri, 21 Aug 2026 14:55:58 +0100
Message-ID: <20260821135608.275233-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260821135608.275233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Fix a malformed MODULE_AUTHOR macro in the rtc-rzn1 driver where a missing
closing angle bracket on the second author entry creates an invalid format.
Correct it to the standard "Name <email>" format.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v4->v5:
- Added Tested-by tag from Wolfram.

v3->v4:
- No changes.

v2->v3:
- No changes.

v1->v2:
- Added Reviewed-by tags.
---
 drivers/rtc/rtc-rzn1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
index 09631a3a5134..a7f22a491d61 100644
--- a/drivers/rtc/rtc-rzn1.c
+++ b/drivers/rtc/rtc-rzn1.c
@@ -524,6 +524,6 @@ static struct platform_driver rzn1_rtc_driver = {
 module_platform_driver(rzn1_rtc_driver);
 
 MODULE_AUTHOR("Michel Pollet <buserror@gmail.com>");
-MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com");
+MODULE_AUTHOR("Miquel Raynal <miquel.raynal@bootlin.com>");
 MODULE_DESCRIPTION("RZ/N1 RTC driver");
 MODULE_LICENSE("GPL");
-- 
2.43.0

