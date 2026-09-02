Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BBC463B74
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346282; cv=none; b=DkooAG8VJruTGgOLPUxPChQYpMaz0nXAHxFBvnDmz8YocdjsEx+zENKqMRymS6m807dHlBnB0lA9TG87QUA9sQuZ5QtLeXGviG9iq/tGx3nPKPKQHW+TAHMEZVpM5V12NclGfF2H1fjKz1qzu/N3Y1p2KAg+7UEaXGMCtQT9joQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346282; c=relaxed/simple;
	bh=Hjs9VwVCBCQIR9TgAq/HTqzG2ZG5eMRL2SHfgwqwO1k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tfLDrXtqlCtkP5ZfnRxurJc616g89JEaMZPDWDqX9ddzjiqT1YRAXP66XwfL1bv/NYwfZSdif7HPhMC8fKHyENCiMX/RM1Rdx/wCpI6GRPuWVgYwoUhCQK165y2vIi/tcJzPPneP9BNS33puTYnpBUxGo3ZMtWVdiOCXdIMc8is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kiMguIVT; arc=none smtp.client-ip=209.85.128.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kiMguIVT"
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49b0d7a07acso9706715e9.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346272; x=1788951072; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E9YJxK+goKseFQhyyU1kBZycBjFaImkJiX1HLmgsMgs=;
        b=kiMguIVT7KzOSC5cABj1WESBPpg0uMN4MhvNtNig7Fb9XE8B3ecCYb3o2QdVVPXKqG
         ROlh2StWi+idCLz9/0WmoQX4ydjGS//oNMlM91JijcdjvK0FkqPTOKiI9JDwf68RxuUU
         UhvVKyNiRnvDcIGAHgmF7rijYg8y0RwzvwUQT07P2383dCGQkyiMcTzXH0AnQubrAOpY
         BBTpVRatJz9umvvihCsfGbtY2BMkZ+jnDxBb+lTPK2Fa1rjvhpHFF3l9+FJNj04a+BS2
         3efI9ttI3cKWZsO3duUXbFIoUejmdck5Z4DUmNqtT+GTzkINisn4QZX90LMeUl3EV1xq
         Ou0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346272; x=1788951072;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E9YJxK+goKseFQhyyU1kBZycBjFaImkJiX1HLmgsMgs=;
        b=K/yyYjkgh8oSauRwmeeqdC6boLaqFDjfcTsxvMUoYvbZxQilRuUCw22zjeVf0jTgXd
         h4pxkby3oveLKB11USUtqO0AbLBNmL+99/kNqiNMdONforsV9hxXGyWQhaHwKF2xn0Od
         uzW961EyJiypDiTg89+hxUik7ZULlK9Ofx5s/6T5Fd/axIG7BeLAiePcmA4hJgIo82y1
         JiAGieXxvbJgfntGMQ4EQq8uKkHa2/roEZvX45qRx7ufIPtdvZkNk3wL195Nn8xi1JEz
         ciAabkVNKfMiOOYO2RrsyD0s5TUYnxqDeEL3VReSD+hlNr/7OULz/t3JkwkHFL/O93Uc
         vt9A==
X-Forwarded-Encrypted: i=1; AHgh+Rp/JbK0Pl1yoInnuIjJ/d2rLQCvSeTwXM9oqmTZ2CCzd4Pj1Ci81ktxQ3VCXwQiOQV2qIukCCaI1AtW@vger.kernel.org
X-Gm-Message-State: AFuF++nvKCDfMs4fBs6RvQgfdLk78FuItIPXggxwYCCsWaAeyMaJWlrQ
	JXORDb0N8ApHNRcLSr/ehtJU4ujT5vDQuDc4XrYFSzIS72kxnE1mODeF0RkzS91y7HBgjz443rt
	DoXa7wAMKAxGXxzdBTlW5oA==
X-Received: from wmik9.prod.google.com ([2002:a7b:c409:0:b0:49b:e83:a666])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e44:b0:49c:dcf8:5216 with SMTP id 5b1f17b1804b1-49ce57e7f55mr71897835e9.6.1788346271508;
 Wed, 02 Sep 2026 03:51:11 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:06 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-5-vdonnefort@google.com>
Subject: [PATCH v9 04/10] set_memory.h: Introduce __set_direct_map*()
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

set_direct_map_*() implementations verify wheter the direct map can be
effectively set. This verification can be costly. Add an "advanced" API
__set_direct_map_*() where the direct map is modified without any check.
The caller must have verified it is safe earlier with one of the
can_set_direct_map() or can_set_direct_map_range() functions.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 88175c3fa751..5a1917a3fd52 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -34,6 +34,15 @@ static inline int set_direct_map_default_noflush(struct page *page)
 	return 0;
 }
 
+static inline int __set_direct_map_invalid_noflush(struct page *page)
+{
+	return 0;
+}
+static inline int __set_direct_map_default_noflush(struct page *page)
+{
+	return 0;
+}
+
 static inline int set_direct_map_valid_noflush(struct page *page,
 					       unsigned nr, bool valid)
 {
@@ -70,6 +79,22 @@ static inline bool can_set_direct_map_range(struct page *page, unsigned long nr_
 }
 #define can_set_direct_map_range can_set_direct_map_range
 #endif
+
+#ifndef __set_direct_map_invalid_noflush
+static inline int __set_direct_map_invalid_noflush(struct page *page)
+{
+	return set_direct_map_invalid_noflush(page);
+}
+#define __set_direct_map_invalid_noflush __set_direct_map_invalid_noflush
+#endif
+
+#ifndef __set_direct_map_default_noflush
+static inline int __set_direct_map_default_noflush(struct page *page)
+{
+	return set_direct_map_default_noflush(page);
+}
+#define __set_direct_map_default_noflush __set_direct_map_default_noflush
+#endif
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifdef CONFIG_X86_64
-- 
2.55.0.970.g62bdec98f9-goog

