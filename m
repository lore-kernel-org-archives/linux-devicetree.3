Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8202D137923
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782655131; cv=none; b=tCCMcTjdXK5wHaO+lKyxajqxAP9wCmSabqTbGV+4rFR/zzdwO/x/JSIoaY2w3TS+b7sWgHPK35N/5xcChdKWkL/LD+ocgIt4i2uyvBuo/dAcAWv4rQ8qzzFp7S8+mckQNnZz+tV8oi9KsIEA6pfR5ABpsnInlYeMgcxuP0nyaHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782655131; c=relaxed/simple;
	bh=9nfGQP4teklC2UbOs87lLDNzNa+cjcMEwFzwbbp0g0A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=myWOxqOLeOoipQSNzT4gNnuNIY9MaudfVVHJmlz7xOt2wm6afbbLpn8szO+G89ad1RQv07T91g/VpciOVHXtdfKv549Vu9qYeKQ1cbbd7Lek5c/ORDVw4l0uLAhE6IM50FDx36E0SJCVO161Nj1fho/QA6OgI/NzTqBNEiBVrTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bqRVeLI5; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bqRVeLI5"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2021083b3a.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 06:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782655130; x=1783259930; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cjtrf4ic4bCNm0DXGgm1A6P135a1jJ15V7q2kOVLkwU=;
        b=bqRVeLI5mvoxZYjSKV1MiWTG75qX5VD3hgS4Odl8hYnj3u1HPuKd6eQpfB3MH568X3
         ANRuQyXsB6xIH3cu+yTW/UDEM0xFsZInjM7csbEbIJMwsYN9wT1UjhIJp/Jx7jxNEA6y
         5dM2DTJ8ZVCU/dg0EjGeVRmo55Yvcg2089NLHfkTnz3m6IXSsx3CycENpt+RHI5Ep4La
         8hlO3vXfxHOa7PXgpX8P2vSgiy7Uclr99yeqpG9B/jP0ffhXJIyLKYRxn6jcYxzXgqQG
         qyGhwbt+/MmOBOYuQ7OHJ33MuW+HQdP615BcYhz2nLe/ke3mM2JD/OoJ3UwD4/CLaOCs
         oglQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782655130; x=1783259930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cjtrf4ic4bCNm0DXGgm1A6P135a1jJ15V7q2kOVLkwU=;
        b=XVmwPtFzyrxhH+iWofITFLxKNCO2dXtdr+LSeXKk20nT2OGAYlS66xm/0LvlBQSVFz
         0ymeIBX+KViu+RGQyQ9prILHTLZskt9hvGEL3BkuxAgzXv/NBo9quPEecZ60jvWd9VnP
         /ki6p+YCIxhQFrYVNF42Fg0tPi/Slict3bpQ2vcYv3BfHc5p2G2DVlnroMnfAwOtoUUa
         2EkJke4H9fNxTU9B5YhPIznC9OTiS0rVVXZvLQs9iphKig7LWnwl2SjEG9daBaL/eB9H
         YoxDV/tkyVKlQsZ8JBNnzO4j0MWJIvYK7uz4/zVk+VIxN/7kchY8Cct4gmdwAvSxEz7e
         N/qg==
X-Forwarded-Encrypted: i=1; AFNElJ8mwG3F4okdhRZNzQJpZMLBcJ2Xj7HktzToIfaSTEGskC6YXPVl7TnPNMQFd7vUhvFDm0Arz3QOkpLy@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn2B74ajBdGIYqe68ZPngXRzvZvxWurUZRQxxwWMTb50+yqfJ8
	TuGWIROZkLuEUc/azwFWX9sd6tR5EZSFtPWyw3zhwb8pBN1p1okxrEdo
X-Gm-Gg: AfdE7cmiQE3ze+YKlm5NJ/pE+jlFFgYAFgCUwt3bvqYsUs41JSB7zWAJmBmSQMqTHTw
	G7oFotEpNyWIxpKHu/RDKvpFSOba19pg/WeRVq3n/f8554h56zNVQkjSNUvfUqOp3onDgmwTxhv
	CB5jXaF4al1woKrwYFbiX0cn/M56q5Ijz/Uy/eBK3+PWS4hEU9CpWsGljUNUyaS31IxrSLHa6EY
	VIbvygj9FjjpGKFnXjmgZNLz2Hnq9K4EXSLzWF7k+Smp1sqr6aNpNKwmtwheoPTeYLYbrQMdHwL
	iqpxw3BTslTm/0giznpuSiAZX68s8PpIwhgrXO8Biu7/4w9vBY+UqbCwNOFFF5f215Z3MtRAGAv
	7ZahLprkaBvSw8516x3EI9KpEczFGh2wxlXk1ilYAIGAUsCeqIM1jEngiCtb1UnZW0UdWvKSucJ
	VLHQ5Xe/UUj+mVWbQktA==
X-Received: by 2002:a05:6a00:12e0:b0:845:35cb:2d9e with SMTP id d2e1a72fcca58-845b3848d09mr14203826b3a.0.1782655129864;
        Sun, 28 Jun 2026 06:58:49 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23d7sm10041108b3a.30.2026.06.28.06.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:58:49 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	devicetree@vger.kernel.org
Subject: [PATCH 3/9] of/numa: remove redundant numa_nodes_parsed node_set()
Date: Sun, 28 Jun 2026 22:58:17 +0900
Message-ID: <20260628135828.1393120-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260628135828.1393120-1-ekffu200098@gmail.com>
References: <20260628135828.1393120-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

numa_add_memblk() now sets the node in numa_nodes_parsed itself, so the
caller's own node_set() is redundant. Remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 drivers/of/of_numa.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/of/of_numa.c b/drivers/of/of_numa.c
index cd2dc8e825c9..230d5f628c1b 100644
--- a/drivers/of/of_numa.c
+++ b/drivers/of/of_numa.c
@@ -59,11 +59,8 @@ static int __init of_numa_parse_memory_nodes(void)
 			r = -EINVAL;
 		}
 
-		for (i = 0; !r && !of_address_to_resource(np, i, &rsrc); i++) {
+		for (i = 0; !r && !of_address_to_resource(np, i, &rsrc); i++)
 			r = numa_add_memblk(nid, rsrc.start, rsrc.end + 1);
-			if (!r)
-				node_set(nid, numa_nodes_parsed);
-		}
 
 		if (!i || r) {
 			of_node_put(np);
-- 
2.43.0

