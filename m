Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66458423771
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331847; cv=none; b=uONZvugLVUwqENE99XTNgiGsfX0NWyhiu0wVzONeengZK/EYc6W+xyIFX7pmLbccgnMGBZKEHbPB4RVOMT2VXwICzgv22fGuExpyZNkBzEg7jmEuy1TJGTR9WVOm+lIGqoCSjdl8IX4A5zC1jdZoy2lOsho5wOY2FO0XWHV9Brw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331847; c=relaxed/simple;
	bh=nes5Ub0CVzx3uPNgKUdF8tABxjL0sxWA9i2pa2yoepw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lc2SGAe2SzLQmaUKxOITwbaWwcdleHE4fULOO/lbFlp2SJknnSy8UXG3nKSXTpF1n1CZOg5lvMYXvKOOdQBaMnWRF+nkxm3dsVpT+6ln9F8uwxop8jelk178bJ4t0WDF6C6Gm9hWuY3BGwcSd9yBe1Qe1uM5u3HlSXFNwhWYY3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=aTea8ABu; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="aTea8ABu"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51c2808dbc3so16767591cf.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783331842; x=1783936642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VeGmm6QMVZmwdVqoSMin3z7nkFa/KfiO/8uXP9FSNB8=;
        b=aTea8ABuBrfF9rsApj0si8ieVdGF6X+jhyRQEXRe7dR6P52HWrDstHBUmdRWo4PG7+
         AC3rxZtzONdDeqV7zW66i9+QljEnjO7ti8c8/Sf8iHSlX4G9NMM4XhXkA96P+1Yyfy5M
         rMnLtNg4MnZ6+MUqc+zRwj7IFevd5M3gnO3Vva+1FDuEyHbF0iVo84to8HfsrLkoZ/SJ
         jyun/QoS8gSy83sD8tmg9vBkT+PnQPnNJjV3+YTtw7xywk7T88UYbzA3Pd/FkfmiPT2W
         OSp6+B80GF2z+aovhnvcochKamZqACA0FhPhDq5QvS5gaUEjAMHcAunQ389j15p72HJD
         fu1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783331842; x=1783936642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VeGmm6QMVZmwdVqoSMin3z7nkFa/KfiO/8uXP9FSNB8=;
        b=Yly/W/fetXIP6Xt9ao0pFN7n+DBiNqE1+FozWHYd78dgNNwphd6eiOVtOknjTAuu2y
         uzIsx+4a3Smb/n4CjXfCX6yNsaLU2hBe6ELRJp3pabcgPeO03nAop7qKF3cFnuni/794
         FhlRMdZvVk7Msl0J7qLKSGyqDgwhU294o9UOjMBgtAdtcZk6Z2k8cKYPI6nZrIzX3WD/
         ODmJt9Ktn+N2P9JRZUsFsjzBiRvJshPm77tYgrQ1+UQ1Z0dtwzdNvk/zOlaDmG3OvfZV
         6XL1Bv+pwniNRtdONyOt+13A7Qc7fW0WtPeLkl+kzmMJ8AgKD8LIq4pZHa5zuQN7Ksku
         Lqdg==
X-Forwarded-Encrypted: i=1; AHgh+RrbbzzZYL4llFFcX2yBOkdICcAjGoOlqKQPhhfdfFK94+3QDqQjdZPFU02wx1qrTlLgfrf/hXLwv43U@vger.kernel.org
X-Gm-Message-State: AOJu0YxxRADZ5u7E0PIAQz8eq8reS8CS0taMunDLcmi4Pp9vqMZSgF4W
	VvUWuVFzrqZ11k+mG3eNNYNO27Adl4GyiYd76Z/bwbjJEt4lgFXS0KcBTJ93rvu7qOM=
X-Gm-Gg: AfdE7clhof832IBQ/rKhDNqeA7smqE70SFGzOlnS9aDAQ8lbSLvuFIxE4qnw6YbfAfd
	OMXRE3BR5yOtCMN5Ng0gioay9AvSqR4PKVqS3rFJFhxDeDc7dAbgnIJtwnB2tQfeP5PzS2HaSDc
	Gw869JPMI9mLv5CWcl9DkVSwFOOOqN/XgVhzSv8cBDZpNP5IrFno1hQbwCnhDbXba9ks6B967wp
	+MMbuhPWEaCtr4u+iPQv0KeMkOr5BiMp1kLnNC0xeSE2susQL3BPIFK0wm3w2Tmsj3B1l1BCgoB
	2PczOd09h3UKDeBYl69KJQZh0HlsuaDfx7iEbXJA7pRQl1BDo7fdKpuWX00tlkDdrQ1zmLT3F64
	QLiDTj5gI8P7qxtwg1QhhckKd1MmMJETeCbJy2NT9T3gfwuOFQgV6bf7/7XcYwROZPfa5CslOKb
	K0VzgL4RUsWYIUSxaNR0lsQg==
X-Received: by 2002:a05:622a:6f17:20b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51c4c1f65b7mr72917671cf.8.1783331841685;
        Mon, 06 Jul 2026 02:57:21 -0700 (PDT)
Received: from macbook ([62.182.99.136])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41db4fb5sm83880041cf.25.2026.07.06.02.57.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Jul 2026 02:57:21 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH] of/address: Fix NULL bus dereference in of_pci_range_parser_one()
Date: Mon,  6 Jul 2026 11:55:57 +0200
Message-ID: <20260706095651.48839-1-ccaione@baylibre.com>
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
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/of/address.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index cf4aab11e9b1..b57b1adbad44 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -753,6 +753,7 @@ EXPORT_SYMBOL(of_property_read_reg);
 static int parser_init(struct of_pci_range_parser *parser,
 			struct device_node *node, const char *name)
 {
+	const __be32 *range;
 	int rlen;
 
 	parser->node = node;
@@ -761,12 +762,18 @@ static int parser_init(struct of_pci_range_parser *parser,
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
+	if (!parser->bus)
+		return -EINVAL;
+
+	parser->range = range;
+	parser->end = range + rlen / sizeof(__be32);
 
 	return 0;
 }
@@ -792,7 +799,7 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	int na = parser->na;
 	int ns = parser->ns;
 	int np = parser->pna + na + ns;
-	int busflag_na = parser->bus->flag_cells;
+	int busflag_na;
 
 	if (!range)
 		return NULL;
@@ -800,6 +807,8 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
 	if (!parser->range || parser->range + np > parser->end)
 		return NULL;
 
+	busflag_na = parser->bus->flag_cells;
+
 	range->flags = parser->bus->get_flags(parser->range);
 
 	range->bus_addr = of_read_number(parser->range + busflag_na, na - busflag_na);
@@ -976,8 +985,8 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
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

