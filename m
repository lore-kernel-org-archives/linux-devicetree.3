Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A92347C7
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 13:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781444303; cv=none; b=PMVyPsvABqpl0DWeu8ssA16vE+QiKWQ0+7DWVqLE2g0X8tQM5vuuY0QyNJDq3H4hiPeYi1yCq/RPpOgfVU/xch0DUiutoD/KHj59NEq+YZkTVM88ZSHDPHy0M3e3BSqVvZ8Tv+AAkGvrScx0BMDN3/Mp+fHgkif4LLTX3OZLKUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781444303; c=relaxed/simple;
	bh=3//J3IXeNfUzMoDCuTxRvW58QnePzpiWhIeu+N4INTg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tzehy2vjQZ2E0OE/WOxBWEwh3GQWa3CL5S7HxOYFpcbBnb0+CiznDe6ToNhbY/UtCGk65zLTdy/CW765Q7DB2e2f8I1CSrreWsT5Uh1RLqu544CLR6zWOb0gG5h78FRgEjZwHSsdp6BIZLkMZJd66tPRAtxqubFl2FzyjN17pTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKApZ1+P; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKApZ1+P"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2c68190ade4so1926375ad.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 06:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781444302; x=1782049102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDhya8+d2obk0J/tUcXA0uhwpMeVjjk7JMQyIxi4O3c=;
        b=VKApZ1+PpdgGzDbU6qfwuYGGEgJHKY3PrQbxd+4A3GYyCqgcdvbj2B7bfh6GSUdAJ8
         eskyHYpaJ3+nEGbJEwvsaYjMvnFP3gOG6dfsvqOu3mny5HssLwlolh5dUZp8biHukig8
         fbMdb7wAUmVeYC4SgOpH923uzlUm15XaloN8o9Xmte9MMws7nGufEgNEli6haJyqWRMy
         FMO1TnsO3rLcpPgGxq3znzELF+b0gbwVpswvrzaLwfWsH6OwCZZSBx283KJZqUpLRnjU
         JqZFnJsI8xBmZVODVdlXdDuPMeIZQMWqxypIAYyOoZqVVqhltbLgYyZfG6MjRYzeMSoK
         n2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781444302; x=1782049102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FDhya8+d2obk0J/tUcXA0uhwpMeVjjk7JMQyIxi4O3c=;
        b=Up/0FkIQTpymEvVY6F9b0TH9IwZpstjL1c+vp9Mk+7sgLtcZnbeoUPtXkE5jIclmDv
         CPzL04obHDZJFXGM63eQ0hERn/VFBAnhiE3Zp3N+DoS9D+UbxjmrdMgHQMl8Do/KtFJP
         iJh09d9jHiraYHnGprxqs+zFOTorzhn/6/29RVqo5EzbuHxDuJ6VszoeZ8Q/UIdY2CgT
         90Ls8kRb97H8wEbFord2+OwgKApnD+YXks6mijj4dv66yW6QU3YQfs54prxamPI48UXZ
         pVqei0bDw1MBb2Glsi3sINcVJLtPVLHMnj7KBwmbpTFsrInhJtXBPq+EI3LF3dbAJrlV
         YNQw==
X-Gm-Message-State: AOJu0Yx0TSKYgwjBVJTQQxkfPg6IEx0yOa7XlwgdnJc55+t+Uz/n0abW
	wJh3UgHYD/WvdFjyeaRRpaevJ4sR8ymIEjN0VuqO2SZj3FKqDaP902IH
X-Gm-Gg: Acq92OG15mabN7PYIzPsRUv/T52P4/OJs1YMpspzG6t8zpx/X3Wc6H7o2wd/94eqo97
	+q/vDT/03BmkQR23x5UdBmdPB2ZxcWNoNwDvELbFGuWUT+T6x2iOMA7Z9RetMPF/Zs00Imrr1bD
	BOP7Jjnse7cX1iD9YAFQpdH4KXz83zjLeS9KlNsK8YVvuYroEoMTxlNXItY0wdat5e+xMtRfvL/
	n1sIutim89AP/5lCcTuZPVcGqkIeaO6qDVyNqDMOf2KFSwBqVpLlq7olF3HmF6dZJiuv0pBVTDi
	xwFQ0dRlTryT1hLtPXwpsR5rZXNRBYt0mslKgqFH5Bh2W67vfOI33wLpSD/XDfDAlRuDHkrG4P9
	U6lkITgdcFDEFHQ3xbsbWHUOQd58kc8k91pV6amfYkFMtFaqwRZ6wjns8kfDYBKt2BTFo62YyCd
	kx8mU2spFoiqMAawt8JA==
X-Received: by 2002:a17:903:944:b0:2c0:af09:f3d4 with SMTP id d9443c01a7336-2c3fd9ebc4cmr87998615ad.27.1781444301849;
        Sun, 14 Jun 2026 06:38:21 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e535csm69043585ad.6.2026.06.14.06.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 06:38:21 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org
Cc: devicetree@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH v2 2/2] of: reserved_mem: print skipped node name when too many regions are defined
Date: Sun, 14 Jun 2026 22:38:07 +0900
Message-ID: <20260614133807.2165124-3-ekffu200098@gmail.com>
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

When too many reserved memory regions are defined,
fdt_init_reserved_mem_node() logs an error and skips the region without
naming the node.

Print the node name so the skipped node can be identified, matching
fdt_scan_reserved_mem().

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/of/of_reserved_mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 42e3e2d8a2b8..7b1616b9c6c2 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -641,7 +641,8 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	struct reserved_mem *rmem = &reserved_mem[reserved_mem_count];
 
 	if (reserved_mem_count == total_reserved_mem_cnt) {
-		pr_err("not enough space for all defined regions.\n");
+		pr_err("not enough space for all defined regions, skip '%s'\n",
+		       uname);
 		return;
 	}
 
-- 
2.43.0

