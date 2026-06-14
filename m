Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1013347C7
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 13:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781444301; cv=none; b=qUhKyUPC4XGlgPeUmr5IZkJ+oBfxmr0yVnRrvXps8ETUzhaHDsEwHiAamzrs15aF+R/j9f+Z9BiV2kbC4Tz6rKm5odnqqqd3ZkWcaCPwj/kv7aZTWR3UrHgzbh8hAy1KZXP8ECFTUcV4LsmkLxWEsalPYQYBlaSpYte85LFm4Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781444301; c=relaxed/simple;
	bh=vUtmxaOuhmglCIWFIlFxCZZnqFsBK8grd7j+HBnx0mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ukI6GUxsZ6R/7k/aQYZyrawT8eaBGvof7YBvxs14cZBxoZDVO8Y9m+N/xDUgZBA9bTPp0TvrosfGDfJ7/W6NLJ7XPfZo9nht6L4420Rjwe/w5d64zqQ28Z6/lXOlPcXV1qVfgqRatF+ecaG7Vde6F6tuaamqK+LtLcF3ELGHvsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJZaTFCh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJZaTFCh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0b9328c4aso18227655ad.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 06:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781444299; x=1782049099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQ8BUL4nJm8stdQBbatkJhRPpAhKyxMmORcJxHam3+Q=;
        b=LJZaTFCh7RGpao0OaMB+0uVNvacF8xIGJS69SAivG++aHG2UEW9+UOKU/fW5TkzXkO
         4P9olPSotNWegJOMWIb01Q+MsOg16YgFjCnWX056jc6Akgxp7QA6OdnPaiCombEcAVfK
         iwTFCbxWBfxSa09GI90xWH1lNueUl4V/s2xstU0ahDWI3R2usu83aLjFEHMBg4edx6pB
         LJRmmkxPw/G7XuE4N2rx4INHDPj2V0s6AHlbmnVT0frdTF7kljBewfRsf/TGGWGmG8So
         uJyPekjwK03+ivrFJYQl+Yj7+4O1WQKgpHYtrPqHALVSEl69PBJRTxtUatxmXH/tTIvP
         w0Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444299; x=1782049099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xQ8BUL4nJm8stdQBbatkJhRPpAhKyxMmORcJxHam3+Q=;
        b=seGRCBJrbeMiGqdhUeIYnWt1kAfn9N6XqIg5vxStA+1NCPgTuget4YQHMncjY/FlG1
         uOdty47owBOdIbGNPLG+Qg9mYY6RXMzfauF8uYAJYuh60DX09GRrv7OjuiDRA1VwmOOf
         rEqQdF19vdJCBne0pVQoLkJ+lyU8u41EsnB5QCbkEB4/EZQ1wMSnIBWsKr2vNLkDZF27
         gHctXhlVwYj0ywrR8rMtlR+W3C59f2+dYud5y8L56oXfu0YjscP0bfAkAPs4vJ2IFF3T
         zHG641S3TOCWwzpra2Ae9q4HRG2Lynla6xhh0GKwxb9qyDQEbrBSpMXdtSb9DubepYgW
         5/dA==
X-Gm-Message-State: AOJu0Ywzqay1HyLOSfCVcS/tAQN6SQ6ggGJmGprT6IJ/wtOMMWFm7yqz
	tSmYCrrESVOvu5Gxy/HiiceXbKGwpbI6D82mFTO5kkGZ+x6Ee8T7ctTf
X-Gm-Gg: Acq92OEhHOJPKSTSdbXzxSBWd9Agw3aOdSGoy9xeoUR9Inntjp13q79DyBJ9KIE4mel
	t1PZ0fDWdjVmstgzAM1J4lMBEFSRHHx8oz8gULB4PwIuGNJBu2Um9YIo50Qk/r1PkdF6sdJ6k3N
	4hxO7ZTiuJv+IJrLEUXopP8fCjzRjQZQa/F0uecsz34+Y4Qsg2g7ohgkYMLy87pxKoxxI+5N8IP
	niHsCGh4scI2SODGcevA2mKUSDWDKMgeqD3IzEfir2anLwZGmSB3Orqtg4EXml8/RdxpZBjPOwh
	5fdEOsvbjVJd/eTcgMIpG24+C7y3UF1BlL6NK/96SxdV4yq0ypveVncT93ilm+WF7iecpk7Fc2u
	id0e4cuoEzlwBDmJUzNWxlHosnfrdD5N9uQWKpcCofZvck3S2ACZNBatmaqbbDAj8DgLb9DqzFO
	8Gh493VWdcPTNwDPJjgg==
X-Received: by 2002:a17:902:c942:b0:2c1:ef9:450e with SMTP id d9443c01a7336-2c41216d3f6mr118002335ad.27.1781444299366;
        Sun, 14 Jun 2026 06:38:19 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e535csm69043585ad.6.2026.06.14.06.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:38:18 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH v2 1/2] of: reserved_mem: prevent OOB when too many dynamic regions are defined
Date: Sun, 14 Jun 2026 22:38:06 +0900
Message-ID: <20260614133807.2165124-2-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614133807.2165124-1-ekffu200098@gmail.com>
References: <20260614133807.2165124-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On boot, fdt_scan_reserved_mem() saves each dynamically-placed
/reserved-memory subnode into a local array of size
MAX_RESERVED_REGIONS.

If the device tree defines more than MAX_RESERVED_REGIONS
dynamically-placed regions, fdt_scan_reserved_mem() writes past the
end of the local array.

Add a bounds check that logs an error and skips the excess regions,
restoring the original behavior.

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/of/of_reserved_mem.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 82222bd45ac6..42e3e2d8a2b8 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -359,6 +359,7 @@ int __init fdt_scan_reserved_mem(void)
 		err = __reserved_mem_reserve_reg(child, uname);
 		if (!err)
 			count++;
+
 		/*
 		 * Save the nodes for the dynamically-placed regions
 		 * into an array which will be used for allocation right
@@ -366,10 +367,17 @@ int __init fdt_scan_reserved_mem(void)
 		 * or marked as no-map. This is done to avoid dynamically
 		 * allocating from one of the statically-placed regions.
 		 */
-		if (err == -ENOENT && of_get_flat_dt_prop(child, "size", NULL)) {
-			dynamic_nodes[dynamic_nodes_cnt] = child;
-			dynamic_nodes_cnt++;
+		if (err != -ENOENT || !of_get_flat_dt_prop(child, "size", NULL))
+			continue;
+
+		if (dynamic_nodes_cnt == MAX_RESERVED_REGIONS) {
+			pr_err("too many defined dynamic regions, skip '%s'\n",
+			       uname);
+			continue;
 		}
+
+		dynamic_nodes[dynamic_nodes_cnt] = child;
+		dynamic_nodes_cnt++;
 	}
 	for (int i = 0; i < dynamic_nodes_cnt; i++) {
 		const char *uname;
-- 
2.43.0

