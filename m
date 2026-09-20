Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80603ED5CD
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 09:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789896559; cv=none; b=IpKuOuhHsVWPqeNVQU7ZpH30lzju8heefRkbQPRRNtl9P00wNmowAA7HG0bdIkGwTSJ8I98nEktbcEEh4QxmKR61YIH00EQ4NyMPQoVwk0NsczR93nlDmqazg1dYc5unpjdqq90MUCIJFnVdPu3pvDlvyxc2xXS1Bt79YxflMVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789896559; c=relaxed/simple;
	bh=Lq1oWKwyKwiD4aqiQeQgicUxGO7xLFEAUi+XFe1Km0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IvjglK8DRLnwo3e/isVx48qDTmVs2oYycOuA4EwHic8cn9yV83rrfolycYSm+m1/vJXb413GBwSkkSkPNgxf1T5V3a9Ioks+Vq/VxuAKTbLyjtSM6z/JI6q8g4Pdgtocs9tyveiHSS8G4e5L3yIpun8jWMkImE2ok09sVPAXb54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hQv1Axiy; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hQv1Axiy"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d6f230d1easo2222095ad.1
        for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 02:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789896556; x=1790501356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E32DKEy2LsQDqopReHm9os4YgHCG98q1Wgi6cD5WuWk=;
        b=hQv1Axiy+nQXVklIYJMAy+A++UVAIpYpErjViYR2rUsaHMy0E95xlcrwoBa2Vp5DwH
         pwwsZFKuCbCiHQY/RPifuXDllmshbsleXAWHDQ2u36Hrv1oDKa5+FLjqYEH/BewPBMDJ
         ato1vtJkvVCYE3aDPWu72sL9XQU2C/WtXlUKgWZtD+SUUIqZhNzCwRmTrm3rJqnt0rsY
         XJxo2nByVUzSJITpziesvKmlZtdKR6bIvpYRZcz59bPIFlbCOn9ZBvWvBf26FhAWnC+c
         ZD+f3lALLr/oTIPKMEETFwpDoV+VyJZc46+BQm7mjybAdT1GrHWxFBJP8JZ0fmIL0ekn
         xJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789896556; x=1790501356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E32DKEy2LsQDqopReHm9os4YgHCG98q1Wgi6cD5WuWk=;
        b=ZIVclfLxW0MAhO4zaLGZYZIe5QPi1jlE4+UkPDKPhRf+Xx5x7VX59hWTyESboXDjm9
         oQtrlgL1SdK4nTIChAKC4BHZafs/+/VOVzZy1OHAmSpNYKEAXlIMB8hd8ZoQdQ+4oNwh
         P/MOEowT+G5o1PuN1hXnwDeNT2ltDz9IWPHVqIek7/NmHyopsGg+9Ds1Fz1i0SqnBRW2
         wdhQUWjWmkTOgUtazlNxLwwbaZCWl4ue0swyxx/0ZGlpFQPlw+3tGbfIAuh0sWbkUWYZ
         jyenVRuBYMVNa8q0lz0XKKmKPab3By8N+I5MxmHkGIf3l3iJbiHMXLDgfxJEZLzVsrON
         J3Ow==
X-Forwarded-Encrypted: i=1; AKwUvBxYfL160mFW1k13uGcVsTgTc77o7uDWP2OpIztHuBZcxdTXY420QLhVnmQJcoQPfzN9GibmoTXeeG8G@vger.kernel.org
X-Gm-Message-State: AFuF++l0TXcBciokKTGUm+g07RcdBsdVQhKXsQP/pAtuscCiFClGAjCH
	yCOw+rfEVMNA3GGCuWQKmVaJxGh7KlLkGCSj6S3rJ5B209jcdSlkveBj
X-Gm-Gg: AYBFou1bABnYi6Lb9rHz5qnHYXZe9hviZPOmxHNgTgIiVLro6HPksKb260s24oSAD9Q
	NAcaZ5qm6ONeD8Mk/u8klJBxUbzZ8Cag4tYyGcTIkiRtwh4v+srLGV67lMdl9PV7yLE/VBK3LgX
	6CMUPJ51il6mTZy26fTl4wjz3MjycuI24k+eLvUy4n69ruwqxclWhi1LZ1JVVdrZvZbVzvkx26W
	KN04Nl7OITLsroYhiXBGpZU9hQdG8yFLKag9w4XP8P5r8D0Pya9N/ACMjxKU9u4Lwco3ICeOzIe
	A60ROB7PBZ1n6gGwgp+ibAu29j7TkPsLZ9KyScfFimV4DQ/4LIaMokgi2Zfx2hQ2PREi67uRCfS
	Hu21pcns0/g5HKBbmh5n0Sa59nZegOfoHNoZNzrZYBX9zLgYH0WT/nhraEWjp8apWOlm6d7EDLZ
	GnD1j89sSQLq4gygcVYGZNk88BO+HVqfqaI94m0jC8l9FB0qf5NP2/1+Y01uKAfEr/yIs1FEnL0
	zzjPxoaYsYbWsLRG5KoN+8=
X-Received: by 2002:a17:90b:3885:b0:39e:4c7e:bc4 with SMTP id 98e67ed59e1d1-39e556f5d26mr7972845a91.18.1789896555881;
        Sun, 20 Sep 2026 02:29:15 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c37c64csm8154917a91.10.2026.09.20.02.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:29:15 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v3 2/5] of: reserved_mem: retain static no-map memory on init failure
Date: Sun, 20 Sep 2026 17:28:49 +0800
Message-ID: <20260920092852.614973-3-chenwandun1@gmail.com>
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

Static no-map reserved-memory regions are initialized after paging_init().
If initialization fails, MEMBLOCK_NOMAP would be cleared, and the memory
is available to the buddy allocator even though it was excluded from the
kernel linear mapping.

Clear MEMBLOCK_NOMAP only for dynamically allocated regions, which are
initialized before paging_init() and can safely be made available to the
kernel linear mapping.

Sashiko found this issue in [1].

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260814090305.4C8741F00A3D%40smtp.kernel.org [1]
---
 drivers/of/of_reserved_mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index f55ed3b5aaa4..2c64d85cabc6 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -660,7 +660,7 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 		pr_info("node %s compatible matching fail\n", rmem->name);
 		rmem->name = NULL;
 
-		if (nomap)
+		if (dynamic && nomap)
 			memblock_clear_nomap(rmem->base, rmem->size);
 		if (dynamic || !nomap)
 			memblock_phys_free(rmem->base, rmem->size);
-- 
2.43.0

