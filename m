Received: from mail-pz2-f1.google.com (mail-pz2-f1.google.com [74.125.228.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7613B43CEC7
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786695313; cv=none; b=sebzhaTeq89R1vDjcGB+bYE8c8rEK3j+GZXXPmfG3p6NK//dJ1b2E+DBCWT/GNVK1TM8M+V5yby53jFVj2AJJe40QnQ9YohwonTnWk2vz+UNzrEzq7GM+1j/Hjyr+Fw48xfbn0aX9jygRSk1D5Ywt99HPOWk37TWzlzXkZ5E48o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786695313; c=relaxed/simple;
	bh=aSEEaJv/2lAIxCCuT2cdazWa/Ajc5fX3gFyJrjyqtKE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YOGoJ8Lzl02yx8ycfaMp8BUchk8yLW6xfIlX/DbLJ1N2KiectIvUllQZhozMtHggogi7AEjwa+9oej1QsHpoIIHCWwjLVMl5Xj07hC2drQDK3+jINjoUFLYlAaXVHdN1VFSavHENQx7KQciqsZIpkBta4z5ZVZM/OkMpTOQ4l5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RORxvn8G; arc=none smtp.client-ip=74.125.228.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RORxvn8G"
Received: by mail-pz2-f1.google.com with SMTP id 41be03b00d2f7-ca034c989e2so405921a12.0
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 01:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786695305; x=1787300105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wjrvAKO/KlFzs77oHO3Q4F1Bx7OPbaNI+ITdVO/CFaw=;
        b=RORxvn8GuCBDZPfrniy50aGi/B+SCFoMljXoPizKeBnsJVxzSlciXky2YVoNq9kmjj
         lc4kBEUtk+OPYB8DbUKTen2qyVTjOq4J14zBjtn1Ewb/BvG2eaWPnEIwVItrX+hVxhsH
         M4cTkg4lVccpPmJFNLOgK0eWd94MOabwyvWvPLZGuTlxvE0fmaWwD5ba8tHW7LK+MAZN
         QMoC/XYa3RPY9YGvZYNUy9aDNVVzmTJOPWwgUrcsUJq6tLchVdADk+e/GHTzYfXKMceT
         bmIq5rzQSnEcOBzmhrKs6mHNg9MdTfH87YuBTDXCR6eCoKaif7jj79Tg+xqWMGuCaoED
         27gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786695305; x=1787300105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wjrvAKO/KlFzs77oHO3Q4F1Bx7OPbaNI+ITdVO/CFaw=;
        b=VAzb3TUJEsO/aqEbi6NV/XZiIpCTfdGxvoHkAuq0lwANt/4/kluvHa68kib5B1ri/e
         95JuZkX1niwUKff0i6DVHXza4+g0WiNIzOQTb3/uh8dLBCWbCerdO4k0G+NsbfgxZi1F
         IQdatooXS2XjnCUi+WVawHLd6+XdfMEy2jXGO7tetOCOHMTUBlUaT7TrBCcZI9fJnPLh
         61CdgbfaIiHgW0uNSTacik9KrkV2pwutMFipXEMcBdXksRIXSyqrq0j4E/0rCocJeDtv
         CFPcRe/f4jTIIjFT6IkApHFGDB9DK/6PGOdKfsJPQ9tHoXD5WM0JRSyaXhCbIkMjMcsi
         M2bw==
X-Forwarded-Encrypted: i=1; AHgh+Rq0xZliIcMHPGoNZwOfjbgicYCVoVgiNNGH5GpVxRPLC2uUx1nIFnIfhUyatb+2JB2u214ZW+Ht3mi2@vger.kernel.org
X-Gm-Message-State: AOJu0YwkDGxcNTheyoJY99n8NRKSRnj97hlqO/lnD7C860Lgrec1ibeK
	+O2t3vPPxl9KNFGYzq4iZGDW7jagiw+uP7bh79zQ8otBqAg1IeHJ17gf
X-Gm-Gg: AR+sD13/VdvELkaAGOQDwaSs8Jw9Uzmho60Q+TGLnYVJoPaL6kHKQbzD2UmhKyiQhul
	oABwkJOEmXpCRkXSiiigxOKR62zYokLkQkLw5RZ5AAHL5rXArmM0GDmt7dP7SL9sjEBqBMwAKnt
	T/qhiBRDHYG6HvE18i4R6w/iOx0QUFZiIci+LUBYS+xHFOCXVKdIjiXzbU15BlqAk08AIlLQf7A
	awcaMZvUr22JL2Y3ftCS7RuJl96pmuJbK03avmgAw4HhB8AGUw4MRfeoLmhpIS6vv4jCYSxUYpN
	7P0SBfzcfuHV0w22cYyzBWj+MMZqtWhB7yRrMGmHYMaI0n6TNxzpSf8IZRQY1HFztNfu3h3ZJXY
	3puEsJ1EnzM7EIpIHvlL1QDQo/2IURBM52yE58MGOey2xFST0ss6bpoNfvZd7DUs0cUP6/Nzhfx
	1fThd45YKoD7W8bp59htC1C6anNYPJJzpHihnWBq9/aapib2t/5xxLsnxnAem6RkNksomAdtmoE
	nzVR1TFtSU=
X-Received: by 2002:a05:6a00:2e20:b0:83e:b443:965e with SMTP id d2e1a72fcca58-84fddfa8bddmr3868914b3a.3.1786695305262;
        Fri, 14 Aug 2026 01:15:05 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517cfeb39esm149986b3a.4.2026.08.14.01.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 01:15:04 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] of: reserved_mem: release dynamically allocated no-map region on init failure
Date: Fri, 14 Aug 2026 16:14:43 +0800
Message-ID: <20260814081443.1061046-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814081443.1061046-1-chenwandun1@gmail.com>
References: <20260814081443.1061046-1-chenwandun1@gmail.com>
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
regions it only calls memblock_clear_nomap(), but leaves the entry in
memblock.reserved untouched, so the memory is never returned to the
buddy allocator.

Fix it by freeing the region on init failure when it was dynamically
allocated.

Sashiko found this issue in [1].

Fixes: 7b25995f5319 ("of: of_reserved_mem: mark nomap memory instead of removing")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://lore.kernel.org/all/20260806100605.2C2C01F000E9@smtp.kernel.org/ [1]
---
 drivers/of/of_reserved_mem.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 67cb60616fc6..d09c29184acf 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -125,7 +125,8 @@ static int __init alloc_reserved_mem_array(void)
 }
 
 static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
-				       phys_addr_t base, phys_addr_t size);
+				       phys_addr_t base, phys_addr_t size,
+				       bool dynamic);
 static int fdt_validate_reserved_mem_node(unsigned long node,
 					  phys_addr_t *align);
 static int fdt_fixup_reserved_mem_node(unsigned long node,
@@ -340,7 +341,7 @@ void __init fdt_scan_reserved_mem_late(void)
 			continue;
 
 		uname = fdt_get_name(fdt, child, NULL);
-		fdt_init_reserved_mem_node(child, uname, base, size);
+		fdt_init_reserved_mem_node(child, uname, base, size, false);
 	}
 
 	/* check for overlapping reserved regions */
@@ -556,7 +557,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
 	}
 
 	fdt_fixup_reserved_mem_node(node, base, size);
-	fdt_init_reserved_mem_node(node, uname, base, size);
+	fdt_init_reserved_mem_node(node, uname, base, size, true);
 
 	return 0;
 }
@@ -671,7 +672,8 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem,
  * reserved_mem array to allow of_reserved_mem_lookup() to find it.
  */
 static void __init fdt_init_reserved_mem_node(unsigned long node, const char *uname,
-					      phys_addr_t base, phys_addr_t size)
+					      phys_addr_t base, phys_addr_t size,
+					      bool dynamic)
 {
 	int err = 0;
 	bool nomap;
@@ -697,7 +699,8 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 
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

