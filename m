Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C913EC804
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896552; cv=none; b=KfRxNUUfanGKPPsaTroYA/CvQIzg4EEIc4CT4qp9vGxcV/HJI5zuel8Xsk0geuoNei4/1RQm6HsrkAtyYZN11FRMk0uxXr/59uPxuXXEL+eaSAirPPTR0EKHKVi5UN5b2C3in8+3JUxBJ8e/j7BDhoK9Mg+fcXfO2CYsIeoRwac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896552; c=relaxed/simple;
	bh=HLAKvhJkzr2wMQTL4lMwFebMpdVfGJZuNPiX3c2LAO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=svpjZhXTwK5oi/GDwIAj/XmHtq/0bbYAYT6UB9vh65jN5fD23g8oFN44AAj4UoC/U0J5nSALjOxn7zX+S3fJl5jU/PJ6/wtMfAFvlWnvz7TmsIzL5Q0tGdwbtwdcV3Ykel1QSGRcDRx8mrqPa02a4RrcS0v94pNvVHJDQL24tcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwmiRQ3o; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwmiRQ3o"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-398b9f722abso1158475a91.0
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789896550; x=1790501350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hr//weXOOHxuEsChSdCH6E1epplNkMkMoIIsD/MpGSM=;
        b=RwmiRQ3oS+nI+MC/PGwh2+OfOmGABNSPzqt4f6i+RlD9znKWwRMJhBlw3dR8KXm5w4
         Yr0cPtrp1MOQVhF+qNIY3ajZzWKjjX+eUpGawvxpF26iTzb0zmDYKwHwaiuoQWvRbSVy
         xxMbmHteTL1u/ZAEVBaV1K8NtpfJWbJT5TZSHMnmaJDEyBU/t8RFyNPRUVIQFocKObhu
         T+ov6XhLivsJSpo8T5DwTt94/aZxEtEeDzcYx9CqifPzvwFzFxVa9n0Wq9QOV5tDbfVc
         noF5/tJ0Bi0tcd4oJwt/zajaRDQp2fHJjYZucOgPMlz8k9O+FIcH9CAO2ZOx6lJ8mPD3
         uYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896550; x=1790501350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hr//weXOOHxuEsChSdCH6E1epplNkMkMoIIsD/MpGSM=;
        b=HPA4A7OGWgVF0qlbb5U6k3MW0DbO6mT4Gl6mAhGygHjwUH3ZT38rxT6UiI4G4izTwg
         T6VC86bV2omUeOuLXi+LCnICGklBvwXpzto66tL+hF6Mp/Sm5lmHX3v1Ej+/+g17bDs3
         xXH88mCyh9ZcLRnBo18ezAHLKd4mLLjVGRTU9pnf9zst1hADZBRkQntDXGi9X2nF9OrP
         DD+sETWCdMVNafWb8RfYFcVo23fIfLyhXZSf+27Peh+czK/xbdzg/EzPVGI/ESYUt+Us
         ckI8EKbUGFkwNQHcHApRFa8j8RKymkoN2uwF69nfVK/LUnjD2nBBMm7WseJbAbh/V65q
         Ql6A==
X-Forwarded-Encrypted: i=1; AKwUvBxcfhkbEuhAfJ7app51pTYP89V/m0LhtXQupuMBQ9Isx0Jn5JvXpq5ksbNnq1Sc8xaLfZ5EkzvVTeYH@vger.kernel.org
X-Gm-Message-State: AFuF++mT0tJjIoKJuJdQLNJk5PoYiqL6LNI3WUdq4mt1ijq4Wj69GUNZ
	L152avJFplzuj6XRaoiDUx1+wDv/KJFaFLu0139O7McEX+aQXBTVB3AjNtCFuilno+I=
X-Gm-Gg: AYBFou3s5o+U+BQdeY3iJAT5B8GrEMdcoMK9Kw50UCIAlFCXNvyLxDUz2Zodu2x2OGe
	rCMJujv0UOETY1TiJSvqvdgJG+Y6tivITnDZ+axM951NMSbS9Gx5CHxUsMuPL72PHm54Kx+EvLl
	GtiWOkGRiJK1hL5P+ZwqREXjfqzE0Mvv6FKbhPQpragG5fGnI48wTcysDONDEGG1CLEwbKAajWk
	LE7khtm6jksWWSRmzvBY+hRf0CrRKdBF+6WXhNSVjm5ZKwBsyfpRu1G87FTDojldhjDsdnRdlud
	kAmSKmVuq9xFX/YwIKOfSRsYwe2H1VQhlqVjxry123VljyswDunUwvCcibpY7sRVHIBHcGW0Jr+
	hFQKei9v+albh+oY5a9//Tj9ftq+8CNHwks29hQF9msB5q0wuW2t5HCitz6lolDlJoxNvpTPTGF
	Y5BJgI6sf2g7Ym78LDx+SCOW4NDhpbwRFec9GZAzngbx5u16iQ3yg67YeGf+blUuv0IIS2OIXHl
	BqAwR4XY0w=
X-Received: by 2002:a17:90a:d648:b0:39e:6c6a:4b70 with SMTP id 98e67ed59e1d1-39e6c6a5518mr5665139a91.58.1789896549933;
        Sun, 20 Sep 2026 02:29:09 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c64csm8154917a91.10.2026.09.20.02.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:29:09 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v3 1/5] of: reserved_mem: release dynamically allocated no-map region on init failure
Date: Sun, 20 Sep 2026 17:28:48 +0800
Message-ID: <20260920092852.614973-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920092852.614973-1-chenwandun1@gmail.com>
References: <20260920092852.614973-1-chenwandun1@gmail.com>
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
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org [1]
---
 drivers/of/of_reserved_mem.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..f55ed3b5aaa4 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -112,7 +112,8 @@ static int __init alloc_reserved_mem_array(void)
 }
 
 static void fdt_init_reserved_mem_node(unsigned long node, const char *uname,
-				       phys_addr_t base, phys_addr_t size);
+				       phys_addr_t base, phys_addr_t size,
+				       bool dynamic);
 static int fdt_validate_reserved_mem_node(unsigned long node,
 					  phys_addr_t *align);
 static int fdt_fixup_reserved_mem_node(unsigned long node,
@@ -308,7 +309,7 @@ void __init fdt_scan_reserved_mem_late(void)
 
 		if (size) {
 			uname = fdt_get_name(fdt, child, NULL);
-			fdt_init_reserved_mem_node(child, uname, base, size);
+			fdt_init_reserved_mem_node(child, uname, base, size, false);
 		}
 	}
 
@@ -518,7 +519,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node, const char *unam
 	}
 
 	fdt_fixup_reserved_mem_node(node, base, size);
-	fdt_init_reserved_mem_node(node, uname, base, size);
+	fdt_init_reserved_mem_node(node, uname, base, size, true);
 
 	return 0;
 }
@@ -627,13 +628,15 @@ static int __init __reserved_mem_init_node(struct reserved_mem *rmem,
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
@@ -659,7 +662,7 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 
 		if (nomap)
 			memblock_clear_nomap(rmem->base, rmem->size);
-		else
+		if (dynamic || !nomap)
 			memblock_phys_free(rmem->base, rmem->size);
 		return;
 	} else {
-- 
2.43.0

