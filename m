Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395308;
	b=p8SWPfwYQY1zKpXjUuTP/8b4vIFBLFMCMM9YJiTMPYpILd8zWoJaIalFGFyW36v7h2d3
	 1xXobbe7wu7GlTBDNGE1/oxgsHjUSxfz0grnqAxNE8KYxfQ9UWsM2x+o6QmJHRqTPmuuR
	 BD8dT6iy6HfajbIIUtsBqTAxReC+lzAYcsdSgR6wAL9qeQNtSjCBOAxyHmX40mELM8gw/
	 3xMnxNf6HM4acO5bWHHK6NEcBq9Un1+ZidNyd67dNhi6UkTgyaEBM8CdVw98Ou4SM8lAJ
	 c6SI59Inml1FSELMLOx/aLKZ4ZyqKGBkxCMUBLS/KbrqTPfdGiRogwhxpIQXdZ/p/QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=t9e5fiKyui+gLN6NGnueZPdNy7gU/9XjTaWNkCYpwsg=;
	b=KMhkxmgeHygQYlix1pWzEEd6+rDE2tgQREYDxb2R6wgyBgg7LZRHIigl8cPe9oE5CcpS
	 JlXkTeh7ToBgQsXq0s52qoXy/Qj6r2p2KvrfOq1mOTTevpR1vBOay2r5T2xWgabM5hk1z
	 Pf5uw/t8zRSRCh1xutsmayAugg6V6wnsxmDPTW4NDpoC+pp22np9DtUutr0O0UzDOWjA7
	 LUaZdYMk+MJp4CNI65Pz1LnhfX0UqQvywRD97gLcI7a031IDjb/GGIBukEMNrl/M4J3l5
	 HTKS/7E1XS+2PdyWrUCJ6oGosCS6gpW7VMseVGpGDqTv470pykp9uTj6HFLM1r2HaZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RuJghETV;
	arc=none smtp.remote-ip=209.85.221.72
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BBF60A381B
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:08:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BBF60A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=RuJghETV
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490d2ac331bso2576400f8f.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794395306; x=1795000106; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9e5fiKyui+gLN6NGnueZPdNy7gU/9XjTaWNkCYpwsg=;
        b=RuJghETVeeglRlTDhW9yv6qcnhi3kpQ4YQxKe9LGrBC0p5eivBcIP2n1PGIFrWpV1L
         hlrbYMi0zgfqKZ5LpO9modY4fUHOYA6I3qZfvHocCWMLVjzLRI6mhmJ7/gESH+MdHCFA
         1bliSantHi5Xj/2TQVBO6fhlv76xKcH4wpCHYDh5eFTdwfI2B/y1j4ovP3uFUg7cN3CK
         nTMaJ9SkaoEO5VVdz7S49wY3j0iFflUJCif9x8DJHRnt8xEFsvRtnG9ehZT9yIO5FmIE
         f9bjJWkSijIclRcFn3UFjhNMCjMmnnW9qn5NGxBiowBRR31c5LkDW5zhqrBBk1PG36qG
         xwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794395306; x=1795000106;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9e5fiKyui+gLN6NGnueZPdNy7gU/9XjTaWNkCYpwsg=;
        b=wTQgytUm0gZtMQW+g/vbl5DY+chvMhyWDhw0ya+FYRlO8PKp2EnWAHnNrvFCYMLen1
         69OyWVz3Se1m8+b5vhl8iIou+jVvJ6tEhOz5yk83BABOi0UtdLgI39BC7F60a0VYFarn
         QYZrXj3pqNaySgWG8vtnj9FGy56UUJ3SuO3PaNKwpStOQfK62L/wY0t8mSWzE5azLTtN
         Gy8OnfJvtwuWPBj1Z/qStLvL8BK3CWKkFQY8P2SXXspDimpHWWwiYLeL9rO55jXwyx5t
         QzbaWYl46HstE0qpaYtgKKQAqaWW5TYixHZZ2uGIZc3YvlmDJ4VEZkWohWedJDOErs4g
         iqaQ==
X-Forwarded-Encrypted: i=1; AL+hErFcGkkJvF0t5PLEd570IMD1Z8ag7yNXo5hA0MAF8lAPJSO9UMeID52ICGO4zbWk6orC4oJ3u7SFj/Wo@vger.kernel.org
X-Gm-Message-State: APuU4Z8KZYkGdUUTbdogQXiTn+kn2nXGfEsZKsdczCBzXt/Zcd36m90Y
	OoE/1SpFxWbFWIWYg+dPhlgv408ROTjSQnBK/oAK4whKH6HJ7UE6hObCQHNdVFnbn2k/XOVewAO
	Q5wMS9LwmQVNq0PYQQSQb+Q==
X-Received: from wrsb1.prod.google.com ([2002:a5d:45c1:0:b0:48c:753a:6283])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:adf:e194:0:b0:491:6a7:b4ac with SMTP id ffacd0b85a97d-499c7b1aea4mr3063798f8f.56.1794395305902;
 Wed, 11 Nov 2026 03:08:25 -0800 (PST)
Date: Wed, 11 Nov 2026 11:07:33 +0000
In-Reply-To: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261111110738.872947-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261111110738.872947-4-vdonnefort@google.com>
Subject: [PATCH v3 3/8] dma-contiguous: Expose rmem_cma_ops
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, m.szyprowski@samsung.com, jenswi@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mark.rutland@arm.com, robin.murphy@arm.com, hch@lst.de, 
	ryan.roberts@arm.com, sumit.garg@kernel.org, sudeep.holla@kernel.org, 
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org, 
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, op-tee@lists.trustedfirmware.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Expose rmem_cma_ops via a kernel/dma-private header so the upcoming
lendable-dma-pool reserved-memory handler can wrap the CMA callbacks
instead of duplicating them.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 kernel/dma/contiguous.c |  4 +++-
 kernel/dma/contiguous.h | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 kernel/dma/contiguous.h

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..22d6e54aea35 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -46,6 +46,8 @@
 #include <linux/cma.h>
 #include <linux/nospec.h>
 
+#include "contiguous.h"
+
 #ifdef CONFIG_CMA_SIZE_MBYTES
 #define CMA_SIZE_MBYTES CONFIG_CMA_SIZE_MBYTES
 #else
@@ -578,7 +580,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 	return 0;
 }
 
-static const struct reserved_mem_ops rmem_cma_ops = {
+const struct reserved_mem_ops rmem_cma_ops = {
 	.node_validate  = rmem_cma_validate,
 	.node_fixup	= rmem_cma_fixup,
 	.node_init	= rmem_cma_setup,
diff --git a/kernel/dma/contiguous.h b/kernel/dma/contiguous.h
new file mode 100644
index 000000000000..9b1fdbfc794f
--- /dev/null
+++ b/kernel/dma/contiguous.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _KERNEL_DMA_CONTIGUOUS_H
+#define _KERNEL_DMA_CONTIGUOUS_H
+
+#ifdef CONFIG_OF_RESERVED_MEM
+struct reserved_mem_ops;
+extern const struct reserved_mem_ops rmem_cma_ops;
+#endif
+
+#endif /* _KERNEL_DMA_CONTIGUOUS_H */
-- 
2.56.0.542.g3ef89b7020-goog

