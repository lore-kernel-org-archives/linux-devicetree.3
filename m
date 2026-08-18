Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157AC4477F1
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045084; cv=none; b=tYbaKvju6jCCwLWUlUw2iz4Cfk/G7m2p8hV0X9HHaMA5ttlUHcttcOdplgTXaHZDDaV4Ed/jkDOLsEiNt809zYK97p17rLIzlXENjAvEIY1ytJfmThIA6gHPGLe0Zk8VasiObuMFAyhEN36KgGzKxJUPH7UWhjAEJhpTt1a0Gpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045084; c=relaxed/simple;
	bh=HFaffslyAq00MYKaOo8bzVRYd+um+ZFrtT7zrTOOu9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rZe7/OVlTC8k05L3JiVz1Dp6PeedHlQsQz7ByAN90987EWUn2Nj69iKDJoHLKcP22lxkiIYeS9+OPUfdgyVohEEJEoILyjm4XkNi+a8qy3PIAHlX5Kbcvm2PhPdIv0ZkMqgnsmrQZP1FOms98FSsSpIKcaVYprhVtlY+aIhb7ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIrbF8lR; arc=none smtp.client-ip=74.125.227.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIrbF8lR"
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2d0344e1ce9so26009205ad.1
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045082; x=1787649882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgrzyPwZN4L7nqoNRJuB9G+jUytRArcpJTaiildA9bE=;
        b=BIrbF8lRamH1grc8/bNpXeeYnlJxpNeszUbFqHRk6JcRHV3S20AbFK5H0DqlY7QR3H
         3vAFXf8WgRLUdPT4j1ZAPdufbilFhXm5/JCCRy5Rc6l+KytIycWC7/Pu07uKUlPJXkRx
         wJvpGf5OqIKGd0vrSN8hOJei7IvL4DXsssvJtoDxe6CssxffK9HflGzBxn5sVIJYx9bI
         yQnr0wWISMvg39bEPcAI/yp/amQ9Plh5KosgvBPZpYjHQjrc34R2k7LWYJckOqH9xTE7
         dsRg/cErCZBfhRZUeg+RdAZrBIs4djaUcw1pb42rYeykvNRxmnp9f/Nk/bzk+zEcXFLt
         ubjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045082; x=1787649882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vgrzyPwZN4L7nqoNRJuB9G+jUytRArcpJTaiildA9bE=;
        b=G5B/+sNzGiaPgC5z+HKeDS88aOotmpo+CJHP1A9Kb7RRyUw3qOFMuHw1SDqeTmxfWd
         ZTLToC/+hSvScRQ8keNHyqG6IO06/0Q20XSRBAsvaD9izPNVw7JyrZq8oqIeFaSUNIXX
         U7iK+SL8P+gTSJhNLx5qjXCOs6QDBYLf3G0tKvWAEVzi6QvD+ZkMgMEnrqwwy2fsixjx
         CbitUDxXqsJ0WgoSiApx7OppO3Byd1uyuoIUgDg8VNzSntFJGI5M6o06zR8NjDuKi1Lt
         p8LpK9lTdX1uWJOZ7ImpYWOp2EnztrAQx4Llg/SFUZLR2l9wgzxTKE4DY2HQz8x6s5St
         1ibA==
X-Forwarded-Encrypted: i=1; AHgh+RrxaaVd9muA2B6yv/R8BfiYKo+9N3XYqId7j70GuXu13sqfde5hrmDSHKsxEOmxqxyN/dJ+lgFV2Mya@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb4MVbIjcgwDftPZkAeQQ8Zp4VV2o7HO+y7tjsGbcBkQ1Tu7AB
	VZ14yw0iZNWBx+OxWJ/jz63hzuJeZ+Rqfi44zLnYkASboBCquf9+KxHY
X-Gm-Gg: AR+sD11UK0tzv1Mt2YTMhGRCK7Badtkn1638pYIDq5FR0Q8jhVsR0smyKVPBoQrrA0R
	2WlzdEojaTXjrn020bNgNMOvpE30tayi9mU1VC8DQfDMbPIYA16vD9SoXmf+d3NIyAQlzeOtH3b
	QP6zPU6GG4jQX2wM2aTEiJ91n1dD7o479eA4yv1wchrz1ESElqjwrl2ilOX1CXtrdki2O/gw2SC
	2AuuinsYE8wpnj0m9azpj07gXBwsRkZZbmC4chAn9tJO4mfq9JmDeXFJZ8KUEEyQef19ranBSUq
	cyfYV4B69Ll8bS9SJbF5L7bVnt7HhGj4Q3P9HHwPFDkCYH2elviokxBu5mVPDW4eruM+TCJ4oq+
	0Dta2XjSUsQjWqsGIWT1cGiV3DKwLym00aOsWbM6RsQzLqB9PcTRCJxjZHN68MK7DLsx5R0WrX2
	/JPRBUvQlTN1bynYQ3nwhfI+34uBoiDt6+XagromDXUf+IdjZA8JEeQLItaKeqXjObj2ad9Ied
X-Received: by 2002:a05:6a20:4321:b0:398:7ed3:a001 with SMTP id adf61e73a8af0-3cc71af5f13mr34124324637.2.1787045082245;
        Tue, 18 Aug 2026 02:24:42 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc13c036c50sm1855975a12.26.2026.08.18.02.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:24:41 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	saravanak@kernel.org,
	rppt@kernel.org,
	m.szyprowski@samsung.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: akpm@linux-foundation.org
Subject: [PATCH v2 3/5] of: reserved_mem: reject statically placed regions overlapping existing reservations
Date: Tue, 18 Aug 2026 17:24:18 +0800
Message-ID: <20260818092420.2859026-4-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818092420.2859026-1-chenwandun1@gmail.com>
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

memblock_reserve() permits overlapping reservations, so a statically
placed region whose 'reg' overlaps an existing one is accepted. When
initialization of a statically placed reserved-memory region
overlapping an existing reservation fails, memblock_phys_free()
returns the overlap to the buddy allocator, corrupting that memory.

Reject the overlap up front. Dynamically allocated regions are
unaffected, as they are allocated from free memory and so cannot
overlap an existing reservation.

Sashiko found this issue in [1].

Fixes: d0b8ed47e83a ("of: reserved_mem: fix reserve memory leak")
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Link: https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kernel.org [1]
---
 drivers/of/of_reserved_mem.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 9fb2e4c29443..767ef702392e 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -158,6 +158,11 @@ static int __init early_init_dt_reserve_memory(phys_addr_t base,
 
 		return memblock_mark_nomap(base, size);
 	}
+
+	if (memblock_is_region_reserved(base, size) ||
+	    memblock_overlaps_nomap(base, size))
+		return -EBUSY;
+
 	return memblock_reserve(base, size);
 }
 
-- 
2.43.0

