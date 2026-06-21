Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D683C07A
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 14:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782052791; cv=none; b=Y70jsHHRCL4KB4mBBdIMSJWynjvdHb/KXQpcyisxAiMUO23DhRds9Qfz+j8oMstuZqwH4xBPxXn4qjRWWDFR5yd0EsFDGGC5qz/vhV95BJXYaqB9PmZO19yWIkdqmy3K0Mz8OwSvMAd1BoSXMdTgaiPTKLonwVagCTw1iFPLrn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782052791; c=relaxed/simple;
	bh=UlCH6re1y9Fapb8X6Rc6PiyK62fkQbehVv9MCHAlc1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fh6248n+M/ojzsIpG4F7y5ARtwfvoNxTsnZEQYOkkhXXf67YOAsst7wOe53aIGHwVBGj4ZJfeRNCWco9HPcTPJdDaVgY8uiSTeW0i4GbD7WT4sirNGKhPwK29nY3d/sX1W9dGCkr7GQEfVnZq53hUHf5AD9D84WM2NiUdzPtK4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eFGXJOZ1; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eFGXJOZ1"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c89636920a3so1182980a12.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782052790; x=1782657590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sw03Q+FDlzlLHLnjuioG37OR3sMNfP521hE1rg3xAcY=;
        b=eFGXJOZ1o5IzRy3aW6LbTXKKxdO58ZJUKwYVuxXWsSVLzinb9RonAm3hZMhwlatxOe
         rmxyi8ScdM3H73D9L9gjw5vmfXtO/MF74TRb8mysXAbTcvqxDggjAfxDjcqyOYg0/IpV
         2yvyMAglB8MHjDnqUL0WRVa4qcRCsh9uRBNZKkn1V0ARXXJpdUfisHA8h1R10WD2BAoT
         pwPUmxEJ/JfNnMT06n0cvGr7hYPedHTNPFe0/sE5MZ/CmKIXrRQzKIgw00b1kE1mgOIT
         b5ZcN7k0TbTWokItHps7n1/nlfUWNT84Idc7MKHHAvsiaOVm5oci6aHhxPb0asqGlqkF
         tfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782052790; x=1782657590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sw03Q+FDlzlLHLnjuioG37OR3sMNfP521hE1rg3xAcY=;
        b=Cd4FxtYNGqmHMxHHuaxsNZ1IWKOLHfx2dyQ03+G1Q9+ct1Z2+YdmFCV2gLDwN8TapK
         E/qbK5DlNKEoInC7NpbRpMyB8A57HMAFMyTBbmhideHzh81zkmZbImc2OPH0w9lJrC2n
         SnokWctd6FlzHuQ+DFzZrUEsoy4/rHFGir0Fv+TMudtK2zbGnPrgEQ+Lfu1GdXGuexOp
         NZprJPkmdIHWgCpwrmyKS2bkhJCx6mcscjw7muxQq6nml8cbhQhIRc8Z0bJn0LBusLz1
         QSkeMguCvjZ4uYJBHPJSe15SRlK5lhe/OW7iy15rFkdOEo5TVdkskE/acWhRZwyCw1uW
         eBYA==
X-Forwarded-Encrypted: i=1; AFNElJ+XmSBLImA641fkyqfStfkkdxxhxixc3CH2MWUHV3zFOM6LAv5pM0gytFdctA8ooMnSIo2FYBsawlIu@vger.kernel.org
X-Gm-Message-State: AOJu0YylR0T5cOPV2a0xRM7k+js9FlWqQO+a/0s55vIcYQyxzpE8qCHG
	j0D4iWkldZCIEAjrgEReMkziHgRv4c7mkjmnHVNs1j+f0JzqNP1vWbFI
X-Gm-Gg: AfdE7ck6kyTEEb2c4/jo66FxxKxxs53NEtjD+3DL6V5AxcaRzE97/Bqtr8aSxvVEF5d
	p7wLjRHXodCnlCmqRHcJazb/zg4II/2v8oAHKKhTvhsTwDhq9frMdbYI3rbiwXCBl0Udw2VX8iy
	767I+RRM8nQ3GO6Wz2hALLcmtoz1B2ZrKCvRSVEyZMeoCQ1TmGhiB4HqkseKH56/4hG5AnhY4Yb
	Xq7Tkh91z02JVXF4z5Kxy7b63mMfEeZJ1nlsPjxyTtrUJcqXLXkEC0xMug5kzhIDziNokyuWZ88
	3Ixlu/Euq4I1Uj/GKEDIMUaj8/qp29JSHq5ReAq+/AlbXYU4E+eubcMhfvdNiEJKWTKE1YZbzK7
	/PMBtVrDH24usRQRAN7PrGK93r2kP4SZLBnPa4FX2Qu9bBiWbhZPHvJDj2NFFp0J4lbER+uJrOI
	PIyoXQ9bc=
X-Received: by 2002:a05:6a20:2d26:b0:3b3:241f:66c6 with SMTP id adf61e73a8af0-3bb34459436mr11795909637.26.1782052789606;
        Sun, 21 Jun 2026 07:39:49 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc5d04858sm4606714a12.28.2026.06.21.07.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 07:39:49 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Williams <djbw@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	devicetree@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>
Subject: [PATCH] of_numa: fix return -EINVAL when numa-node-id is not found in last node
Date: Sun, 21 Jun 2026 23:39:18 +0900
Message-ID: <20260621143919.4176646-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the numa-node-id property is not found in the last memory node,
of_property_read_u32() returns -EINVAL, which then becomes the return
value of of_numa_parse_memory_nodes(), even though earlier memory nodes
were parsed successfully.

Commit 7e488677a54a ("of, numa: return -EINVAL when no numa-node-id is
found") meant -EINVAL to be returned only when the numa-node-id property
is not found at all, not when it is found in an earlier memory node but
not in the last.

Check whether at least one memory node was parsed successfully, and return
0 in that case, -EINVAL otherwise, so the return value of
of_property_read_u32() for the last memory node no longer corrupts the
overall return value.

Also include other minor changes for readability improvement with no
functional change.

Fixes: 7e488677a54a ("of, numa: return -EINVAL when no numa-node-id is found")
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
QEMU-based test results

DTB memory nodes defined in DT
  - memory@80000000 (0x80000000-0x9fffffff) numa-node-id = <0>
  - memory@c0000000 (0xc0000000-0xdfffffff) numa-node-id = <0>
  - memory@e0000000 (0xe0000000-0xffffffff) numa-node-id = <1>
  - memory@a0000000 (0xa0000000-0xbfffffff) (no numa-node-id)

1) AS-IS (before fix)
[    0.000000] NUMA: Faking a node at [mem 0x0000000080000000-0x00000000ffffffff]
[    0.069152] futex hash table entries: 512 (32768 bytes on 1 NUMA nodes, total 32 KiB, linear).

...

2) TO-BE (after fix)
[    0.000000] NUMA: Node 0 [mem 0x80000000-0x9fffffff] + [mem 0xc0000000-0xdfffffff] -> [mem 0x80000000-0xdfffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x00000000dfffffff]
[    0.000000] Initmem setup node 1 [mem 0x00000000e0000000-0x00000000ffffffff]
[    0.076854] futex hash table entries: 256 (16384 bytes on 2 NUMA nodes, total 32 KiB, linear).

...

Tested the scenarios below to confirm no regression, and all produced
the same result on AS-IS and TO-BE:
  - all / no memory nodes tagged
  - untagged memory node exist, but not last
  - empty / out-of-range numa-node-id
  - memory node without reg

---
 drivers/of/of_numa.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index cd2dc8e825c9..13f2f6d238c9 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -42,7 +42,8 @@ static int __init of_numa_parse_memory_nodes(void)
 	struct device_node *np = NULL;
 	struct resource rsrc;
 	u32 nid;
-	int i, r = -EINVAL;
+	int i, r;
+	bool found = false;
 
 	for_each_node_by_type(np, "memory") {
 		r = of_property_read_u32(np, "numa-node-id", &nid);
@@ -53,26 +54,32 @@ static int __init of_numa_parse_memory_nodes(void)
 			 * "numa-node-id" property
 			 */
 			continue;
+		if (r)
+			goto err;
 
 		if (nid >= MAX_NUMNODES) {
 			pr_warn("Node id %u exceeds maximum value\n", nid);
-			r = -EINVAL;
+			goto err;
 		}
 
-		for (i = 0; !r && !of_address_to_resource(np, i, &rsrc); i++) {
+		for (i = 0; !of_address_to_resource(np, i, &rsrc); i++) {
 			r = numa_add_memblk(nid, rsrc.start, rsrc.end + 1);
-			if (!r)
-				node_set(nid, numa_nodes_parsed);
+			if (r)
+				goto err;
+			node_set(nid, numa_nodes_parsed);
 		}
+		if (!i)
+			goto err;
 
-		if (!i || r) {
-			of_node_put(np);
-			pr_err("bad property in memory node\n");
-			return r ? : -EINVAL;
-		}
+		found = true;
 	}
 
-	return r;
+	return found ? 0 : -EINVAL;
+
+err:
+	of_node_put(np);
+	pr_err("bad property in memory node\n");
+	return r ?: -EINVAL;
 }
 
 static int __init of_numa_parse_distance_map_v1(struct device_node *map)
-- 
2.43.0

