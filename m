Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42907472092
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346281; cv=none; b=sZueRNQx6UvO705E+GaByd+uCFdxNO5q96780oeNA+Jj8cj30pf6URqIKkHrrmioItMTu77Ln5vBTgjp8OjdXPdH0ZFAp5ixvj3RafqALi67tHuwNw0Tts7ruxtAMKzoNbQ1hb0AXJCZFerqWCTsZ6fE32oX28QUHGnWZeFW2L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346281; c=relaxed/simple;
	bh=5C0s/9UucVAGmXDEl+xwewW/gLO4zg1pKiD4RPTspKs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UKnFdaElUFs7TLHkUsHKcdb1eZCWsXUlj/D0LYemhMzUzwxjUUVCJOSt+UxP2NBM0uuShTl3B8hoTNH0Zca9Im1TvR6wuPAx4416jp4ZYAXhRWwobtfqPf9kmg+gJEQ04wOzp3zaL1IemMQYjaPFTzVBaaPrKGjAJh2nkExvTsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M5iGUe1g; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M5iGUe1g"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a60a4f1ae2so1177585a12.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346273; x=1788951073; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0x2qbND6Sa3WNSOYkn6lqr5Ld4Ihzkg79AVpCRYTR1A=;
        b=M5iGUe1gc0hu7UCXVuZQ6eqxeK53tIsgVH0pkcje8+eax6BHdYwFfRWJGRlAB4BPGQ
         XVbtw3L5t1VXi+9pWMrXUesFJgS1nhFpbQ1oewj3KIt6kt+QmtW4jHXHzOwNW69IQ9W0
         8nVrw1NgRHiZYl9or3IGCAQaRgpzQTKP5tD/X5b9FM4pxlWB/gejhrdgsTHme9i56P04
         un3E8AYBjomzrSBcGxv/eKQ0rUpxAEC319HUjySf/+Jdp0JZ4v0QdR63jbUX8wtWe+7u
         jX1+ik0c5yPMnZqQGZByUYIPbAEDyKLW5grqvg/6F/ayDR5HqHojiqE/PQxfz+koyg3n
         MMZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346273; x=1788951073;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0x2qbND6Sa3WNSOYkn6lqr5Ld4Ihzkg79AVpCRYTR1A=;
        b=Daikrc2tpgkJzX5gE57QtrM0RTp5D3xrywiHe1Q4fOEwJc7uVs5QyYd9QQCChIcoNh
         Y/SZr1dFdpsrTNjcUpV85giLKPjhDG2wYNvVSXa/Dzqf3KgpJif2arsPA0UoplqdAgUz
         okvtybxqlOGn7R3aXz3RJGlx+junczqa9zAOIuouVkxazYBeC8FdgCbP5HlF8PfluHlI
         0xwiMNvHkI8XBD/IGjCTwdH0EOdHXoFlZi1yO98exNuXCsN6EtbZzWY7wwqi7uZuEE6b
         0jBt1f9Pkuf1Mqm7+2ebS3hloa9qCo19awl9RGqTMH5kW5FhNeQXvpSln1QbuR12miss
         3tkA==
X-Forwarded-Encrypted: i=1; AKwUvBzjnQyuNdHFdDQlLO7qD9oRqBwigfjva63741g81kLXZuiTJMt5af+NNX1zBglj87DRCHlS9EnPCYss@vger.kernel.org
X-Gm-Message-State: AFuF++nI6WYiZfEhhekSNMM+FRneVvWIO+le/NlL7J03/YnFCqAoJ2pl
	u6BB4C/iXE8FN7EbWPECz+KSQ8I5DYSCsiwFsTmEPU1msMwr/w/eTVYUha7tusSRpQ3o1ynP1DE
	bv5r/bCl83QMiEhmKAXXGMw==
X-Received: from edyf4.prod.google.com ([2002:a05:6402:684:b0:6a5:e070:f1f6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:46c5:b0:6a3:f47c:969 with SMTP id 4fb4d7f45d1cf-6a68224ce3emr2605259a12.3.1788346272605;
 Wed, 02 Sep 2026 03:51:12 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:07 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-6-vdonnefort@google.com>
Subject: [PATCH v9 05/10] arm64: can_set_direct_map() if BBML3
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

Systems supporting BBML3 can split blocks without risking unhandled
page-faults. It is therefore safe for them to set the direct map
unconditionally.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index bbe98ac9ad8c..58898ae53f5d 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -99,7 +99,8 @@ bool can_set_direct_map(void)
 	 * Realms need to make pages shared/protected at page granularity.
 	 */
 	return rodata_full || debug_pagealloc_enabled() ||
-		arm64_kfence_can_set_direct_map() || is_realm_world();
+		arm64_kfence_can_set_direct_map() || is_realm_world() ||
+		system_supports_bbml3();
 }
 
 static int update_range_prot(unsigned long start, unsigned long size,
-- 
2.55.0.970.g62bdec98f9-goog

