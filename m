Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17649440657
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346281; cv=none; b=sd9oZovkjr0uSYvU/kNpLvlQevFtPysy58xOv5Ww1hqfdU+o99b7eSp8AI8D4z2DHPsXpDSwfSEVLFwuJx72TdQ8t8mxoL3zNGCApMVDr6x0aeMZ3rNkPjW487V3Xi+0qd4rwc92hqIA9WVLysMrfWdT0tSg6A2IjSkNbpIm4M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346281; c=relaxed/simple;
	bh=NRJjfa1oBWJjVwi9irw8swmUSNokXjGSiq7EU4Eu/kY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dy75SHzG1W/iO2AAHlt4hN8G3qwDjsRqIzljzlREOXbesGjEwvN2REk0ab64biJsTbNl+xrR9mLQqUMl5mzRKu4QtiTjnl2ZavPk+bhuVSDRotW13ChUqjB1fdQr+GPlNKEBYBahKlkD+CSEj6PExqSrczQAD+2+9sYh03aw4OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cO7KfsSB; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cO7KfsSB"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c217f249fa1so87663666b.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 03:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346271; x=1788951071; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nz0QJrsFl6sXg/0SkB/zVAyOBBHBg8ebGgd7F8eNZsM=;
        b=cO7KfsSBhWdHUdklyHVOD8n38JwBqFaDAP4bFvmqCT02FYqDHQbd21SZuC+fR9k4ke
         ESqExeNF5vdjwoxAo/77kdmphTpAlvF6Jx5KnDU21W3ZWNJEtwwY3Z3lCQd4PAGznQbR
         wsVcX3DqMPThOg5XJNaskHeBI5yYOueLDKtoDLVOi8IUgpdfGPYyVuZHVAAKfYC1TkYM
         epye+3GTc9bFSNHkyvZC1qpGZa8IDHWrBTAkWavytV1TQdBGGnNypQlJ/nr3kQale66W
         eoPv7tZc2qDD1NYn/Mn3elZsMffypFBjb44jLK8MPaBtwWNZvJKgrrbgeyy5ppO7H8OQ
         Hu/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346271; x=1788951071;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nz0QJrsFl6sXg/0SkB/zVAyOBBHBg8ebGgd7F8eNZsM=;
        b=I/TVP4FzFE0DqxSpXK1pBfBcA8xDl2PSOhLEXGFDwDM5jAxG5+XN9V8oWX0Wlf/qg0
         tu305ZPP8abb3Fx8CK70gVKqOxtJlHN3G7z8DHw0gzBmKCZaJ8z72xBi8zxkJlxxOa98
         A+0r3nF7ZWqHK4DRzpXnn3bvQnHn9mvTKTCsDG8+ESxjQ7xGVCoB/cvVw2yblaqLwZdL
         qhlCMkaJq9YlX1lOFBB0Ok1yWCh/1A23ovD1TVGzP2zcYyXnEdViO8NXFt0BxDhYOz+Y
         qibUFk5t2wQzgD+lrRFRTgK2enn7J2wZj5f53H2aYB21lBtYXeezi0U/MECAvSz1ZH+S
         xbWQ==
X-Forwarded-Encrypted: i=1; AKwUvBw5wrjBb2EF8/iaXC81CIWcJUWJGyD6OcauTYG9M2eHjwXUywz3LWu9hrLjUHoYCohdDEgtGbdCmnrG@vger.kernel.org
X-Gm-Message-State: AFuF++m5TsuvF5GcfuTl3o7A/BWvKwuq9iuL9/sFSXKfcSkR79HIclbL
	p0XwWeNZhehKGysZJeq97W0shytWCBXYxrH+1l9BE9j1stit5XGKGYdFZXCLNZ3iN65KNJc13QO
	6CFRsRfAirduuveDzXZS/1A==
X-Received: from ejcz24.prod.google.com ([2002:a17:906:2718:b0:c25:3006:b1a0])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:807:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c25d544f52fmr257827266b.4.1788346270231;
 Wed, 02 Sep 2026 03:51:10 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:05 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-4-vdonnefort@google.com>
Subject: [PATCH v9 03/10] set_memory.h: Introduce can_set_direct_map_range()
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

While can_set_direct_map() tells whether the direct map can be modified
globally, can_set_direct_map_range() checks if a specific range can be
modified. e.g. if mapped at PTE-level.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/include/linux/set_memory.h b/include/linux/set_memory.h
index 3030d9245f5a..88175c3fa751 100644
--- a/include/linux/set_memory.h
+++ b/include/linux/set_memory.h
@@ -44,6 +44,12 @@ static inline bool kernel_page_present(struct page *page)
 {
 	return true;
 }
+
+static inline bool can_set_direct_map_range(struct page *page,
+					    unsigned long nr_pages)
+{
+	return false;
+}
 #else /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 /*
  * Some architectures, e.g. ARM64 can disable direct map modifications at
@@ -56,6 +62,14 @@ static inline bool can_set_direct_map(void)
 }
 #define can_set_direct_map can_set_direct_map
 #endif
+
+#ifndef can_set_direct_map_range
+static inline bool can_set_direct_map_range(struct page *page, unsigned long nr_pages)
+{
+	return can_set_direct_map();
+}
+#define can_set_direct_map_range can_set_direct_map_range
+#endif
 #endif /* CONFIG_ARCH_HAS_SET_DIRECT_MAP */
 
 #ifdef CONFIG_X86_64
-- 
2.55.0.970.g62bdec98f9-goog

