Received: from mail-wm2-f7.google.com (mail-wm2-f7.google.com [74.125.225.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0173E316B
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141430; cv=none; b=ilwEbjgpntceqFVzAz/OXqHSylszch2lLYZtm9nLH8ai8rmawBBo9xHT5YaDxdqyc2dYvOvPHDU7hpGC0RhuVO4V8oMlHGIEj7rJQ8UKrz+DHXdVSSWcXUK9F+fPYKT15zwI45L9OH/6tXkhU1fCpbikReD3/zEfNcAoboZWxQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141430; c=relaxed/simple;
	bh=SE4iHUmmygV8d5dAiedzXyPRnoeatyyoF18gCk2cotA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FRM8eVXhb8t6BJz8urSG+oZ8hj/2hGBU1nL0OLOsP56fNLxZknjBesuCghVKQW0WE7V8++uem9BU/zawshQCH0BfeXsbMLIfXpk9HdyOUys7dFzJ2NNoaBTGCD7L7IT+hJqoMeb9O2cSEVfia0/iXYlsdnLPkjXngkO8fZvsZpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Lo0WnNMY; arc=none smtp.client-ip=74.125.225.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Lo0WnNMY"
Received: by mail-wm2-f7.google.com with SMTP id 5b1f17b1804b1-49557073245so9905185e9.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785141426; x=1785746226; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Le5LNF3GXnmmSEnZA09V4Sl/KGuJxnaW6brzgtcTzH8=;
        b=Lo0WnNMYOP3a3TJdCkNhnAK1E/phQpuSwO2AjsmtpUpmbs/W4tsufs0OrehSndr5Kr
         4ADqolafT/OqdUajR/Ck/p+P/vrAurvzqaDreL9B46RpEgoowCy4xwM4PP1vHl/PhCd8
         mxLs8dZBOi5W5oM3ZpjVOAaPCb65wqUIrXe0PSjN/QyVTJE4eWKGJb11mTXtwBr8u4Dk
         PCbP2DQo9zZ/M7KHWz7wjoIpEtsb6NikIgT0nuboe8PjrFigSpiZ1/CqYlQXmC5VQH3f
         0xoXtoq2kl0rsheSNqEAH9NAcNlLS4BKu9l3kG3r5svgbWJT5g8+lyZZmK33CNtQBIsH
         O81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785141426; x=1785746226;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Le5LNF3GXnmmSEnZA09V4Sl/KGuJxnaW6brzgtcTzH8=;
        b=hcWpyzStg6/IUw3CN6olKWAjKxT5riJkh1bFkgmIDlGsQm9cN53vbxIa32vknAuMCE
         qicJf+G01hFdMC3Hcq5b193uY6Y/IiOI7x7DKtSq2MMUoWl+TaqnHgSHKF20UDRG0CTh
         3vFWmKhzhZnz5rV314KTAMK6quj1puLh/mEsaBSG4HFeTBKMeQpFndmPZuOpNbEOYAgz
         qSOsURRJd/1z7L5s64XXrDss9s2wiqFSsvQZI876xEH+76qLWStfo62hgtI1VbbG8Pmi
         Txq7ibaY6zogdzJJdAG4wb9+kwqIwkyTaCHH88yCzz0Lb8wheJQLnGQjpy3aOzE1X1t1
         yNAw==
X-Gm-Message-State: AOJu0YxK8/ulgYQKF+HlJ+H/lWRmI9oEOq9t0HgfaSrRQiqZ3QrZF5OC
	1UDMNR4i87V49j2A1T7IaH4CpKNwWrD9LegouUlj3RB5sFFKds6TIXgOQhjj1X8GnLU=
X-Gm-Gg: AR+sD130jEhc8Nz5sUM/uKSuhESxZ/JVsHa7n2GvH+Tzs5GOk9QHek7GwF2n5EtuCy2
	QjX9wXgqJBI8vSmuU0w/Wg/0/4lg1a1T2LNOc2uzPTsCw+pmP38FEv7WctaOgOOQ59lBCuplZbq
	VyPd9hmrRGB0kTUyAu+BYSF7gd3Qi6srW4vbamE8uJQ+lGcGN9Xhqt2DIYIM62ATKp6ciLmGvWK
	YT0ZTwYZL291n32eBwmnx2w8SohSMrzPYluMQXQvWWsqHV5ktiQWipqx+rJfDvwOblE3G8W8GAD
	TWVdHJTbpsCEy5L6rTT9bNvfBMEiDbIbfuTvTgDj9wjygPp8zo9MHK+RYcbna4HcGKmeTij6k+J
	PLnKbcGdcaj/AB3DHcLxPQIj8p4m9QH3lNYJw0p7X1j6H98EMoXS9kBTHmziLWqRmMbc0a1SizO
	sAfN2ehSGZLUiPf/COQJfPeA27S61rXqhPscNGehtHOi1r4wRB7+AwF6YvmZA=
X-Received: by 2002:a05:600c:4ed0:b0:495:6713:9a40 with SMTP id 5b1f17b1804b1-496b56f99b4mr91104315e9.18.1785141425917;
        Mon, 27 Jul 2026 01:37:05 -0700 (PDT)
Received: from [127.0.0.1] (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b485ff2csm256820125e9.6.2026.07.27.01.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:37:05 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 27 Jul 2026 10:36:59 +0200
Subject: [PATCH v3] of/address: Fix NULL bus dereference in
 of_pci_range_parser_one()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-of-range-parser-null-bus-v3-1-be01b708a4ce@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBAAvyJ77kJIxahfKT0Y3bQrEmW3KYL4d
 6MeZ2BmAyVhUmiLDYT+rDzHDM9HAf23ix9CHjKDNbYyzjqcA8rll05yizFNE/qk2ITaeR/K0hB
 BzhehwOu1fr1v1uRH6n/nD/b9AHHaGON8AAAA
X-Change-ID: 20260727-of-range-parser-null-bus-9f87bbf440ee
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2

The bus matching rework made of_match_bus() return NULL for nodes with
ranges/dma-ranges but no local #address-cells. parser_init() stored that
NULL bus, and the range iterator later dereferenced it.

Reject such nodes in parser_init(), leaving an explicit empty
iterator for callers that ignore the init return, and make
of_dma_get_max_cpu_address() honour the init failure so a rejected node
cannot clamp the DMA limit.

Fixes: 64ee3cf096ac ("of/address: Rework bus matching to avoid warnings")
Cc: stable@vger.kernel.org
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Changes in v3:
- Drop the of_range_count() hunk in of_dma_get_max_cpu_address(): it
  guarded a pre-existing corner, not this regression (Rob)
- Link to v2: https://lore.kernel.org/r/20260706114731.57353-1-ccaione@baylibre.com

Changes in v2:
- Validate na/pna/ns in parser_init() with OF_CHECK_COUNTS() /
  OF_CHECK_ADDR_COUNT()
- Link to v1: https://lore.kernel.org/r/20260706095651.48839-1-ccaione@baylibre.com
---
 drivers/of/address.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index cf4aab11e9b1..499d37ceae21 100644
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
@@ -976,8 +987,7 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
 		np = of_root;
 
 	ranges = of_get_property(np, "dma-ranges", &len);
-	if (ranges && len) {
-		of_dma_range_parser_init(&parser, np);
+	if (ranges && len && !of_dma_range_parser_init(&parser, np)) {
 		for_each_of_range(&parser, &range)
 			if (range.cpu_addr + range.size > cpu_end)
 				cpu_end = range.cpu_addr + range.size - 1;

---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260727-of-range-parser-null-bus-9f87bbf440ee

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>

