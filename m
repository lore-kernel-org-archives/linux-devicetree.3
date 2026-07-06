Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB73BE17F
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783338516; cv=none; b=np/B+GIn0joV8pO707kMFrP10pO+A1RMzOkBVV4Ciw1BOn/VwvIpxMglzQDirp9L1PjGyOtk/rc7GywRP4GbdgkBwV7hCclKgDebxx3Phv+2h+l0Uq0VmTJjdrMi7HsTF5vRhWBO3WVUSTT+AjJOM2+Vq4YGFlbzjfnXLMU2QR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783338516; c=relaxed/simple;
	bh=Vbjk1r1UF7aP9dlEuCuiRg7mgnpt1lUL6ZtGktNqaVE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HH8E8m0Cui8RY5oOFbWPD1KO+VQypt65ksvmRxf14kFOd6R8VA6myvWrmFNdvm2OQGvV9i0FGogNPqWPv6TwNNZfayPgquyrSccMIaIVqeE1pJHdO6DSHUmOCO+s0lyMAIeEvI+8Be9E7mUunfPmlSxIFjxL5jTaWzmY4hDqH2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QySWGiAR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QySWGiAR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493b27c7451so35490955e9.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 04:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783338512; x=1783943312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YiNWA4XhuvaUhqi6Oa/oDG6LqIOrOq6gKP3C+ylBpDs=;
        b=QySWGiARAVUEuXhbuoM2qW/nuf+sLVQcemmkOpCzme/1BFM9pIA7rNyLyiywYCMZ0d
         99ZQdRhR7uGIK5dSs0jcxvQSg9MtZikR7ESEt3lTeHTI2+ZRhK65gfGMQx/7aqikDnqt
         sIgi45Ams2vv+LdtOLXxhQP4Z9L5dbGV8jeQsRgsX4iIqBqldv/Jr+JufOO+GZnURmxd
         euKYGrVI0tTb9z4ho3LPQs64JH5h2UBnOJ9pKSbcF7WEIxC0+AlZQdQ00SN+Cy3S2La9
         XLkiW1u7fHRYlZn08gdjRLZgV+zZAt8Xm0FL+N++hFTh2AglQmDsEhStGg8XIp+PVz+e
         dXwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783338512; x=1783943312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YiNWA4XhuvaUhqi6Oa/oDG6LqIOrOq6gKP3C+ylBpDs=;
        b=g56O6lSIEuwX06j1du1zyO0RZ+2VK3FE7C8oQHOyhRtjt8WS9Alhxv0XYlbEknnhV8
         ACFKks5WA8qWBnWWsu8kp5dB/v1IEElQj1WfCuISeSBrouDe4+JfIuCj1pEnpnJ6Es4E
         PXSE+EpYqu/jxAD6VkBJaVeC0C+xGLxAhEvRrS0Fza6ZtOmFAM3LAx3oBUAdnqQQstCt
         ZLdM0WaeMrBFSVy1ZIbBJ+HqqCcx3Kq0iuM+9xaY+jlpsV99SKsKz31yPQ4bdYRN4GjN
         QUnZyNLwIRUD7K8udRESjHx450UHEuzeXYVhbcUZ0JYe77+pl2DW29nIe3Ro8666w9ck
         fblw==
X-Forwarded-Encrypted: i=1; AHgh+RqP6tSuX06+/Ktb/zOS6KPBVodFKFum157fR3a1bL8wfXzr7Cp0Y9ZQM9bwJz7QJNY4t4nLxLo0wubu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw59iLRs5lGJ7d9Ziys/oWuPCbMwk3C/FKSX7x16W3HeICEOKGo
	Ncf5OP4GK/gToCAs/AjK9a3onMhLwvCdX/R7H0fW94n7CrL5Ty58xNxKo/6TiZJnMTs=
X-Gm-Gg: AfdE7cl+5ExTBPZcSyI5cSMYL+pVa2xFmYaUagFcwHuBYG3+WMLA3x97Ll+nhc8UfNN
	aC76DwGBjuzGbLd1jOMB0+rmT5EOf40EEDjmCBme7KgjHBZ94OAPtpfBTuT83gMX0P2mOYEVlA8
	QaWAdEd2itafCZ9qjQLhI7nCgxR4FjK5Tg6DZoWM5t7ey5xUw5+rh+tpPzpaEYdWUK2oSnYIJNL
	0mDcbRlq0U0Ha226N9FnmQSH+uC28wRZWvYGBliWOp8Z3lOWbyOLIl4rzHbz4CpiitWVXD5W6DW
	syHi2zZ0YnoIGRdxKOYojHad4xUDWVF99Er3BIZmGOux6luKkbTUUn24BElgOYjmr3EXbxqVbhK
	sPzoHbQE4M5bJ6nD6cJvEOR4qvsmgxaHBClGFeXH+GM6HkQc/RllznQk6INtVvqerDifU5iUpdI
	8P//u+ynTqWAVu2j8+MpUikhcKauiwQgrnYWJShDcHS9wci2Ss7NE/owO9
X-Received: by 2002:a05:600c:4584:b0:492:3fb5:3a17 with SMTP id 5b1f17b1804b1-493decb3dc8mr4634135e9.2.1783338511859;
        Mon, 06 Jul 2026 04:48:31 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it ([95.236.170.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63172fesm623599205e9.0.2026.07.06.04.48.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 04:48:31 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Carlo Caione <ccaione@baylibre.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] of/address: Fix NULL bus dereference in of_pci_range_parser_one()
Date: Mon,  6 Jul 2026 13:47:17 +0200
Message-ID: <20260706114731.57353-1-ccaione@baylibre.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bus matching rework made of_match_bus() return NULL for nodes
with ranges/dma-ranges but no local #address-cells. parser_init()
stored that NULL bus, and the range iterator later dereferenced it.

Reject such nodes in parser_init(), leaving an explicit empty iterator
for callers that ignore the init return. Keep the DMA limit walk guarded
by a non-empty dma-ranges property, and only clamp the limit when at
least one complete range was parsed.

Fixes: 64ee3cf096ac ("of/address: Rework bus matching to avoid warnings")
Cc: stable@vger.kernel.org
Signed-off-by: Carlo Caione <ccaione@baylibre.com>

---
Changes in v2:
- Validate na/pna/ns in parser_init() with OF_CHECK_COUNTS() /
  OF_CHECK_ADDR_COUNT()
- Link to v1: https://lore.kernel.org/r/20260706095651.48839-1-ccaione@baylibre.com
---
 drivers/of/address.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index cf4aab11e9b1..fd2468b89579 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -753,6 +753,7 @@ EXPORT_SYMBOL(of_property_read_reg);
 static int parser_init(struct of_pci_range_parser *parser,
 			struct device_node *node, const char *name)
 {
+	const __be32 *range;
 	int rlen;
 
 	parser->node = node;
@@ -761,12 +762,20 @@ static int parser_init(struct of_pci_range_parser *parser,
 	parser->ns = of_bus_n_size_cells(node);
 	parser->dma = !strcmp(name, "dma-ranges");
 	parser->bus = of_match_bus(node);
+	parser->range = NULL;
+	parser->end = NULL;
 
-	parser->range = of_get_property(node, name, &rlen);
-	if (parser->range == NULL)
+	range = of_get_property(node, name, &rlen);
+	if (!range)
 		return -ENOENT;
 
-	parser->end = parser->range + rlen / sizeof(__be32);
+	if (!parser->bus ||
+	    !OF_CHECK_COUNTS(parser->na, parser->ns) ||
+	    !OF_CHECK_ADDR_COUNT(parser->pna))
+		return -EINVAL;
+
+	parser->range = range;
+	parser->end = range + rlen / sizeof(__be32);
 
 	return 0;
 }
@@ -792,7 +801,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	int na = parser->na;
 	int ns = parser->ns;
 	int np = parser->pna + na + ns;
-	int busflag_na = parser->bus->flag_cells;
+	int busflag_na;
 
 	if (!range)
 		return NULL;
@@ -800,6 +809,8 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	if (!parser->range || parser->range + np > parser->end)
 		return NULL;
 
+	busflag_na = parser->bus->flag_cells;
+
 	range->flags = parser->bus->get_flags(parser->range);
 
 	range->bus_addr = of_read_number(parser->range + busflag_na, na - busflag_na);
@@ -976,8 +987,8 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
 		np = of_root;
 
 	ranges = of_get_property(np, "dma-ranges", &len);
-	if (ranges && len) {
-		of_dma_range_parser_init(&parser, np);
+	if (ranges && len && !of_dma_range_parser_init(&parser, np) &&
+	    of_range_count(&parser)) {
 		for_each_of_range(&parser, &range)
 			if (range.cpu_addr + range.size > cpu_end)
 				cpu_end = range.cpu_addr + range.size - 1;
-- 
2.55.0

