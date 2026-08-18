Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626413115AF
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045088; cv=none; b=mitmihbtAQfGS2DhZPNLZCeSd4LJy719Hx7sNY6bIYQAEZXcVHMqzyoKxx66Q93ln02tNbFDgEeOoEiQWaflzRCZelouzMDcJrnlNHMx0XbFStEyWAo++vlv2jAluak/3aSejeNgYWE5sqgdVix8TbxA1eMWxntJTMZvfLdnZIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045088; c=relaxed/simple;
	bh=Nctdu3GRXgFPqdYGuio1jU8JKaStTeEWL2DxwYXyFUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sVpKlU4l8qZdAHJVQJB8gfWJOFBXgOXS1cC+W46PCs+VEW3p5aHs5mzTcqic4K4uCIdTYLJp4eaipP+Bi5xlzht5MsfV75fjAYp3tWgJkQYhguy1dGtbJ0vuUEHTG5MAqrp9hmZKysvsTN5zsh36kL1fyrhwqsmeFhyMK9EHjkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=doABhiRp; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="doABhiRp"
Received: by mail-pj2-f7.google.com with SMTP id d9443c01a7336-2d561173f9fso20422305ad.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045087; x=1787649887; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXih3fn/TdgHOmckkY8kxI7AN967ZoqRDpC349A4Z68=;
        b=doABhiRpLQz7lEFbaJzHnclIWxz1RI+wF/JvjU2l/1HAjS9Tde/9zzuwX3Bok+CZgI
         czvrDkPN2q0PnM040X/98DdiD3DDfw2R/0q7zEZpuYSGxm7LPq4BLzyLHUBO1UrzoLC/
         50zW+bmyPXULpLorGvN9xwYVtlexbeMM+rX47ECWqIcntGhVu5x9gM7uHt284P5XXwU+
         aqtofyJBB1BKbX+vkfxBrJ2ddQAhGpc9Jdcdz2yKJ6C/PrCwcG9JsZrsX4GKg+ZOovBu
         etUPI/iDLV7VohQOzp7P6ZM31a/7YISGDjPFlsKTdBNbv5rxYlpVwQAWOW9B3TeRk6gJ
         Kujg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045087; x=1787649887;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vXih3fn/TdgHOmckkY8kxI7AN967ZoqRDpC349A4Z68=;
        b=UM+z6hUzgJsqMYTFE6UUKMHXuX/ZVdwG8boedIIHwhL43i3pQYlbP8HgPGrvTL9B+v
         lvf/ysBWJKklDcCcR3PzHv0bIRsTjZ/eqMnBt9oiLRCsxkFajfaaZwRCDFfpGnM4aQTW
         N5meP0pZ9iJjAoypsm4VQx60Yn3RsYy7iAWQhl0SfOpToZJotEDphAswsNP3U4eM1Ubn
         sBFacwhPJBRbLPpmWwDyNrv3xmS/Aimlf6FZAIfSnO7/9TzhqEbKTL0Eggk40kJbQqvY
         GK7OvhFlZf02cWa6L10VMpL/F0ObDercqzVQVsbjdT3BjnMGW4ZGIfLSF1YZUck17lfJ
         aKEA==
X-Forwarded-Encrypted: i=1; AHgh+RrTFIdBsAmB1VvFlY04Nk4Je87x730jHd+v+JnEDGBXy2YKHAIbySMheYTIoyTBRUd+4Sksv3HnWxFH@vger.kernel.org
X-Gm-Message-State: AOJu0YxOpS2BZbjVplSMEUokuQ3NHeymNq/5CZeYR9VwEozeS5zsg0fo
	eM1VXFaB6sjtgiiwk9qg7fAuOD6lLzF2MbGH1s3gXFRjgg509oKAH36p
X-Gm-Gg: AR+sD108ljz0igiMO8/YRl19BP9qH1r8vMSzQunKqt37z762FPAuKmazKWZFXgL7fn2
	OBjtCLTTAFJmS0aisUjLLueqviQNwBKtT/VrAY0Uq5/KnDRnReOH+0TV/2tnnZqYTqwxcAWnz2P
	M/jmGtDfJn8SnL+4iCXs0QUGq2NdG1laUHly3My1R/GlO9Y5roVAocONdnuNlizUkUVU91MutuR
	Nm2Wyy/69sqFT1E9wi3rjj1YRoNMEggnigdlKnTQ5MDdZDxvkI6uIz+mvf73AkzEumQZV5uuKEV
	BeLS6v0ffxDSIOLITJ1bHX7RvKmb6ygh1dIB8H49blMB0UFYL3ijce+/XWESvEhSTH5xnWeTJ7x
	C9r7oWnNg3UKSlM+BYz3173knaL/YZGlaYp1ASH60v+shGqf6fH3LfZYwbaUoIA26phn/4ehCEx
	oW38rL55DH1bhoCr90N8racUBX6n01dflsfVf2+ouCQWq1l0VTIzn6/dRmHatktnntrzN1VBx+
X-Received: by 2002:a05:6a21:4685:b0:3c3:875d:705e with SMTP id adf61e73a8af0-3ccda96659cmr10292610637.19.1787045086651;
        Tue, 18 Aug 2026 02:24:46 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c036c50sm1855975a12.26.2026.08.18.02.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:24:46 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v2 4/5] of: reserved_mem: release dynamically allocated no-map region on init failure
Date: Tue, 18 Aug 2026 17:24:19 +0800
Message-ID: <20260818092420.2859026-5-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818092420.2859026-1-chenwandun1@gmail.com>
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Dynamically reserved-memory regions are added to memblock.reserved by
memblock_phys_alloc_range() during __reserved_mem_alloc_size(). When a
reserved-memory region's driver initialization fails,
fdt_init_reserved_mem_node() cleans up the reservation. For no-map
regions it only calls memblock_clear_nomap(), leaving the range in
memblock.reserved and unavailable for normal memory use.

Fix it by freeing the region on init failure when it was dynamically
allocated.

Sashiko found this issue in [1].

Fixes: 7b25995f5319 ("of: of_reserved_mem: mark nomap memory instead of removing")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org [1]
---
 drivers/of/of_reserved_mem.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 767ef702392e..ac5db19dcc93 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -136,7 +136,8 @@ static int __init alloc_reserved_mem_array(void)
 }
 
 static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
-				       phys_addr_t base, phys_addr_t size);
+				       phys_addr_t base, phys_addr_t size,
+				       bool dynamic);
 static int fdt_validate_reserved_mem_node(unsigned long node,
 					  phys_addr_t *align);
 static int fdt_fixup_reserved_mem_node(unsigned long node,
@@ -352,7 +353,7 @@ void __init fdt_scan_reserved_mem_late(void)
 			continue;
 
 		uname = fdt_get_name(fdt, child, NULL);
-		fdt_init_reserved_mem_node(child, uname, base, size);
+		fdt_init_reserved_mem_node(child, uname, base, size, false);
 	}
 
 	/* check for overlapping reserved regions */
@@ -567,7 +568,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
 	}
 
 	fdt_fixup_reserved_mem_node(node, base, size);
-	fdt_init_reserved_mem_node(node, uname, base, size);
+	fdt_init_reserved_mem_node(node, uname, base, size, true);
 
 	return 0;
 }
@@ -676,13 +677,15 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem,
  * @uname: name of the reserved memory node
  * @base: base address of the reserved memory region
  * @size: size of the reserved memory region
+ * @dynamic: whether the region was dynamically allocated
  *
  * This function calls the region-specific initialization function for a
  * reserved memory region and saves all region-specific data to the
  * reserved_mem array to allow of_reserved_mem_lookup() to find it.
  */
 static void __init fdt_init_reserved_mem_node(unsigned long node, const char *uname,
-					      phys_addr_t base, phys_addr_t size)
+					      phys_addr_t base, phys_addr_t size,
+					      bool dynamic)
 {
 	int err = 0;
 	bool nomap;
@@ -708,7 +711,8 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 
 		if (nomap)
 			memblock_clear_nomap(rmem->base, rmem->size);
-		else
+
+		if (dynamic || !nomap)
 			memblock_phys_free(rmem->base, rmem->size);
 		return;
 	} else {
-- 
2.43.0

