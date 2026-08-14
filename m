Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF36436BEA
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786695305; cv=none; b=Du+O6CBak2UPL/kuzQEI070tjHyXAQKRzqKVzEwMkXYg7ylhrDDx6/9TR3gAs/zkrOscQB4xrF9ZhubV7fP9x4Z+WI+YkJrou5N80d3hiwGUCONS/H2t4zxGgzHDgj7J3dnOOZ3bZ22q9cym5Q15UYfbq2ovIg4s4zEml7kYuq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786695305; c=relaxed/simple;
	bh=rFFNpVYOrMT3Qp2yvuqi8mrntpoQOyo34lqRocpDQdw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/ATuQj401ejCF3n40jvAZdVaUhoyzQARE7BVaP0JyDW3LoTOP5cEKLQebb8m4ypBM4b5GL8Y3iyxH8dO9SOvAvKIpbxX/H0A9fGs+abTBY0OPWgLQEE9J9eQr036Gu91+sQwCWx0l5dN+UEMQ+J5TAn4Rl32KodBxcK34FK/Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOkQEXn2; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOkQEXn2"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-c96739a46acso352036a12.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 01:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786695296; x=1787300096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0Dek3piBTzvrC20sVx/LLDc7oP2Vk+2MRJebwHoj0TY=;
        b=hOkQEXn2eJCIIKBnnfZLhAOBM5dMr4bOITz7gf+/4lYU8HXtj7wml792SrGUyvl9t2
         K8Mbx6cnL76tKXSYTxwnEjN3/SdBS94PXwu5oUnN3lxe7Pjrds77Kq4UTQ/Y2MWOXd7J
         MJIJP6F9NjSLI2F/LTFAKWpVgm7zW735Whu4eLsXF/4g3Z2R2ZwQy21BK2yH4XlPOgB8
         ZAFbNmknHJa1ONGyd6+ANd6dHRZOjxtmhx85Ryz10UP+OmMtO7PSgAygCQZfcykd7Kxk
         IoMSQxkeTj/lwakBn4DZ37zqnRAONj5wYs4vXkzGccp6sICzTlWQ+vvsmiDtJw8nvBPb
         33Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786695296; x=1787300096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=0Dek3piBTzvrC20sVx/LLDc7oP2Vk+2MRJebwHoj0TY=;
        b=PXu5vlvTXUpN6jnuWTp8hHgEwgRd1T+BvDWpyqWtb6ij1atnaYCY4H+YCRjGjGd9ke
         4F3gsg06Znr26vxOfHZFxsc4SP9VPcwlX5YFZKI1wubS0ssdrWgl5C4wkXZDrLZpevg6
         EUkSZB/lM5QR6u/pHE4y9MB5+pimalWZ+9v9B9RPiBwirDvpNUORbwXsEmzckeFTPoW1
         3rkpQqu2Xlb94jeuLrVCQ+fEKQSR7od4j1RKLk9edK1bPHuWMCYml0PNjz0R/raoTJd9
         VvXHRolApgZOgViSRxlBlChdRxi+ZyYA9JSaRQj9BsJ3U9O6/g1H2z/zgC32kMBXxziV
         u37A==
X-Forwarded-Encrypted: i=1; AHgh+Rqugb+lxw4fkJI6pHBPwLOnbEuqrSACPqR/gAdUEgPE/CgxzHbDuW0AMuvhg9Gy8WfkQnCMwIo6Ean0@vger.kernel.org
X-Gm-Message-State: AOJu0YwEI/r89fm33519nZvM0nYapVMnvkz9vpoLY5J1iVghJhxaQszK
	q27jVSuDnS7AQ5NkQ0iiNZvxEQCI5VhcWvpTpJhJdFDbHe3uQIgYfA8xUIH8Uu8mhdt/Sg==
X-Gm-Gg: AR+sD11IbZLHOrI26hFLxUiOdGqewrdHmWR/hDTjbMdVv8pmCC4wAqpnHgjS063+frA
	X9lkpOolU93/okAk1ajAWCuGe1AY06l3DV++yAYMrSG2mVxXlYo6COIV8LLkYA5RYsu/9YnrxIv
	+6Oq774DZpSv5PMjzl9jzO/GY8WZnl1qFJ45bbIK4IzJyePiT3jqCY1djO1qXEYNGkd4v4/SRiT
	5gvKK5NlM5jDOx5ZFHLYfAvzaaveWT/5u9uf4uTAUmZfdK0G8/uWwRte+Oz643reWm41mt7xHlx
	TVq1VmHRpxQ/0EeBSh4ebW0tbg/DbADcubeZQVbsOpvDEGA+JpSHZFTHEDehXXRA/gXWTYko/cZ
	6lJCX99AH7ty19PDF0rKUfCPaumePG1x02L3BhdNS2Hp79SyfwqJ835fk/R8T0+k/ZW/EwE9O6X
	UdIMduVGydimcHARC2MQk5COJoHw7HBH7c1N4yK/ReMyuQY5BQM+1sysf1PGjJxa105vHX2LLhd
	0ZDu5gWt2A=
X-Received: by 2002:a05:6a00:6c8f:b0:847:8449:2ba6 with SMTP id d2e1a72fcca58-84fddf90cc4mr4930621b3a.8.1786695296460;
        Fri, 14 Aug 2026 01:14:56 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517cfeb39esm149986b3a.4.2026.08.14.01.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 01:14:55 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] of: reserved_mem: skip init for regions whose early reservation failed
Date: Fri, 14 Aug 2026 16:14:41 +0800
Message-ID: <20260814081443.1061046-2-chenwandun1@gmail.com>
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

__reserved_mem_reserve_reg() discards the error from
early_init_dt_reserve_memory() and returns 0 unconditionally, so the
caller counts the node in total_reserved_mem_cnt and the late scan
initializes it without checking whether the early reservation actually
succeeded. A region whose reservation failed is then handed to a
device assuming the memory is protected.

Propagate the error so failed reservations are no longer counted, and
record the failed nodes so fdt_scan_reserved_mem_late() can skip them.

Recording the failed nodes explicitly is necessary because
fdt_scan_reserved_mem_late() rescans the DT independently. It cannot
tell from memblock whether early reservation succeeded.

The failed-node array is bounded by MAX_RESERVED_REGIONS, the number
of static regions is not bounded by it, so on overflow the extra nodes
fall back to being initialized, which is the current behavior.

Fixes: 8a6e02d0c00e ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 49 ++++++++++++++++++++++++++++--------
 1 file changed, 39 insertions(+), 10 deletions(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..f20747725de4 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -32,6 +32,19 @@ static struct reserved_mem *reserved_mem __refdata = reserved_mem_array;
 static int total_reserved_mem_cnt = MAX_RESERVED_REGIONS;
 static int reserved_mem_count;
 
+static int reserve_failed_nodes[MAX_RESERVED_REGIONS] __initdata;
+static int reserve_failed_nodes_cnt __initdata;
+
+static bool __init reserved_mem_node_reserve_failed(int node)
+{
+	int i;
+
+	for (i = 0; i < reserve_failed_nodes_cnt; i++)
+		if (reserve_failed_nodes[i] == node)
+			return true;
+	return false;
+}
+
 static int __init early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 	phys_addr_t align, phys_addr_t start, phys_addr_t end, bool nomap,
 	phys_addr_t *res_base)
@@ -167,14 +180,19 @@ static int __init __reserved_mem_reserve_reg(unsigned long node,
 	base = b;
 	size = s;
 
-	if (size && early_init_dt_reserve_memory(base, size, nomap) == 0) {
-		fdt_fixup_reserved_mem_node(node, base, size);
-		pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
-			 uname, &base, (unsigned long)(size / SZ_1M));
-	} else {
+	if (!size)
+		return -EINVAL;
+
+	err = early_init_dt_reserve_memory(base, size, nomap);
+	if (err) {
 		pr_err("Reserved memory: failed to reserve memory for node '%s': base %pa, size %lu MiB\n",
 		       uname, &base, (unsigned long)(size / SZ_1M));
+		return err;
 	}
+
+	fdt_fixup_reserved_mem_node(node, base, size);
+	pr_debug("Reserved memory: reserved region for node '%s': base %pa, size %lu MiB\n",
+		 uname, &base, (unsigned long)(size / SZ_1M));
 	return 0;
 }
 
@@ -306,10 +324,14 @@ void __init fdt_scan_reserved_mem_late(void)
 		base = b;
 		size = s;
 
-		if (size) {
-			uname = fdt_get_name(fdt, child, NULL);
-			fdt_init_reserved_mem_node(child, uname, base, size);
-		}
+		if (!size)
+			continue;
+
+		if (reserved_mem_node_reserve_failed(child))
+			continue;
+
+		uname = fdt_get_name(fdt, child, NULL);
+		fdt_init_reserved_mem_node(child, uname, base, size);
 	}
 
 	/* check for overlapping reserved regions */
@@ -357,8 +379,15 @@ int __init fdt_scan_reserved_mem(void)
 		uname = fdt_get_name(fdt, child, NULL);
 
 		err = __reserved_mem_reserve_reg(child, uname);
-		if (!err)
+		if (!err) {
 			count++;
+		} else if (err != -ENOENT) {
+			if (reserve_failed_nodes_cnt < MAX_RESERVED_REGIONS)
+				reserve_failed_nodes[reserve_failed_nodes_cnt++] = child;
+			else
+				pr_err("too many failed regions, '%s' reservation failed\n",
+				       uname);
+		}
 
 		/*
 		 * Save the nodes for the dynamically-placed regions
-- 
2.43.0

