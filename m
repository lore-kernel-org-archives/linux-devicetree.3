Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73952329E6C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 04:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783052065; cv=none; b=frQGWFx8zpJ8bOgnKA+A1R1yIYlkyAbIAU3mK1DidhmNOGiNGp0SXJYbGX3c9JeveCgWNVpAmpVxXp0xY8ZpjgFe8WWchcGwxwovGsQmjr1DzZjMsnh4GaugOx+T51kEGkJ/DlZtRfRiZxgiNstOfQurS9B2WGsnTzrV0e9xYgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783052065; c=relaxed/simple;
	bh=nEIvCy8bce7i6AHYUcv85WFR8DpqIbGKo9btYibcvnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5RADnXniHJW5EDrob3lrni3W8mwTQ/1MLgJ2lUJOZGOhoPGoDomUvaLimO9WTPuerjp/7gP/PXVvM0gV4UJKknImTmXSGYNdHKNY1IPHorZPrjCwYpDZgunvtG+BzPkFKrvLlLxGSPTgrLOEy/+aWAVwVfIRhBQAuUKwrv0zX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPckKJLF; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPckKJLF"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84592b55832so92349b3a.3
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 21:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783052050; x=1783656850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CRhdKC6J3CGktR8i9gPIvTyx5V3X0kO6yzDSERAhYeg=;
        b=kPckKJLF9XYCvyjQ+cIjlfFKS0wH5InyJHKxFI2KfLfePm0RvOThk6kOD0XJ8Gbiid
         0Kz5hhs7KHg1Q15gTAfOTxUIoIglzvXRs6OifjYY68CTAeIbj8OljPB17ZLENrO+YhJt
         J1RN6vB/vB8YFdyqVCmJbE+7uE/sIPvrzGOuIThug3qrXRc8KRML58+AX3VSJdmVbIGU
         VWrvTsdxdhbRo6WgitbyWliKukSv6VIRlUE6RMmZK6oNi9RZbD9PZEPymTB4uukmqqlg
         aqonjObNe5mU9xoDNEmzqMJNT7DjBBxLJ2i+GC+k2tIWKQshzLrI0ljJ33Upn7LDKwZe
         tSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783052050; x=1783656850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CRhdKC6J3CGktR8i9gPIvTyx5V3X0kO6yzDSERAhYeg=;
        b=j0cbC5FOc0rRt+qLuwzWiOtC3El9OjCjRgvWSUlv208z1X/YYfEV3KY3cBRn5gJayK
         0/Ylgc/p+xwPCuzieFPrwUBQxqJOC0dpxpSZ8EqqT5Qk+DOkdawsJ04x+RP5q2qfSWUy
         +OyaKjNOcbP0BTLU4hdkp/6+QcJdrKq/cJHNuF3HDh5lAZuPHuFZEz3VJakscf6ggY+S
         sDxi8oP9Viv+o3IC3hujjSkhFWgg+8r3KThxnawYo2LHsQl685uy6PnoHqANpwIVVyYA
         Lwo5j7ROGSO2eqlfgl6OnJv+gVUL53IAtlxHkE3iNFemhEugXCoWPJeWF5PQppMW8Wj3
         slig==
X-Forwarded-Encrypted: i=1; AHgh+RoI89KsbHyfK/hFwI6jC0BRJEUHUVIj0BCWl5wuCpQqIiyQBjUWJyMRO4Pg6fQmqHc/KvKM1Zm8KWWJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw55jwsCbaiQ5yudIkVZAkbaXa07ygT4yz5DnHk7YF/yQJSRmTd
	UckuaZxJLXPYTweIAKnUKEpO5p/3WNTm+hitDYQPscW+AyZj8WmPV/eB
X-Gm-Gg: AfdE7cmVy8vDb7hMce9vH8FzIShf0e1Oe3YsdGLan6dbW6LXJuCfMriernWAQQ2HooF
	GiB+Yc8QoTSpIVKVv9jj5XHd4GTPySKOsnWkIbrecEV/iAxmxvuhP/b+rKgzICsq4fN9lzAgris
	TK4/EnDjOoFTvsYvHvqK38ezPic3Nz85X2Jq9PZTNJGovAHm6jARNgsgiqWRDLdZIfbXRl20s9R
	wbwR0xOb64D3js3leNlzuCsDMPBSu48mQ3FElQJ/foRG3LH6ltuJlH+sG9suDOaINTO8wPr2vQh
	3xhvXUv0UnAf40OT/vE6uYH818JvmJrxOvvST2z/Iimb0L69eZbg6234tbx/m1/fOtYfcgGzArp
	HRdsdRPi8Ds0PSObs4K0RQLrZwUpj9vhbcN3jdGBx95/IZ6gffqsKLenHIxOwzQIs9/r1IJ6Fe9
	1wrA7+N3k=
X-Received: by 2002:a05:6a00:c92:b0:845:4126:222b with SMTP id d2e1a72fcca58-847c0847e56mr9523742b3a.28.1783052050061;
        Thu, 02 Jul 2026 21:14:10 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94bd7esm2207768b3a.38.2026.07.02.21.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 21:14:09 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	akpm@linux-foundation.org,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	devicetree@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v2 3/9] of/numa: remove redundant numa_nodes_parsed node_set()
Date: Fri,  3 Jul 2026 13:13:23 +0900
Message-ID: <20260703041329.2797584-4-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703041329.2797584-1-ekffu200098@gmail.com>
References: <20260703041329.2797584-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

numa_add_memblk() now sets the node in numa_nodes_parsed itself, so the
caller's own node_set() is redundant.  Remove it.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
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

