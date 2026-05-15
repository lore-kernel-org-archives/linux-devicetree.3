Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DA33F7AAA
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 07:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831922; cv=none; b=ICF3aIXBcdMjdDegVwiN/GkUiK3OvjWld+fIQm96quYtmS/6tG6+Uj8q63R6TsyLqIG1I9Stax82xzAddBuS4JOyWq2rUfBLL//ZJSCftxdB1V56sRUiCZZxDLukL+gXGA9HgzbEzG+js3iHYR+BgTjVx+KHckoDM+DhmH6AsBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831922; c=relaxed/simple;
	bh=0BPD+9vjFSgd3h65DskY/GMiR76jSb75S9E/lfiLFRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EETHr6RA+b7VDzdd5HymytIVMObW8OrMCffp2SJoYnskICUcNfdMIfcN3MwToNAppKjaCPfqBW/m6BMZUfiMPcNKkmKsrsmLvmJfXR1ISlgkEtWk7sjsye8QPTJEka89tfDBJh8WkVqp6OMp2XtT3hU04HKX8zEGgiG6dDuHKZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqiQOqUZ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqiQOqUZ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3660daea6a5so4905173a91.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 00:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778831920; x=1779436720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2RAe37c0Y+mS2qQ9ryuy+Bjx4murGSjLzlq4yUfzjU=;
        b=sqiQOqUZt4W/w8b38r+A8VFw+bAeidEnSjTS99O9bJ83X//CaF7tb5p0GWDdV8NS8l
         OPMXaCkvBocRe/cpvgiiYs160Jxr+z6Pr/GJ8LZkcPEFF167XCsAQSBVe5K0vv7YtatN
         4KNuY7Bp4iCD4aEwjKkjyX7Lkzf6nfauMiDcCFOcu1qYyOnOWlg2U73uij+zpkqsQJly
         9sNtjhUdrZ+yV64tYEUU8/V4KHainugmzRBEzUB6/puyQ0f4Uf94pcyfxMFKCXsVPbII
         7AAjgEPehz1MvFoHOYPhACMyvPHlluJsimj84ewIphwxtRn0rV+YreskTbDHhwBQ2i7y
         mqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831920; x=1779436720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D2RAe37c0Y+mS2qQ9ryuy+Bjx4murGSjLzlq4yUfzjU=;
        b=qgWLaGYrux9HUsajvZKiV/QFT/dAOFxcrkQEmemZEtgieM42Ebgxw1UGHDHsykVfGS
         mYr3YSPQu3U+mM4rrHiY4TmieTOsjzENuuIJRFyhVLRIUB9AO956kQuUNNyj37w+bHyw
         bArBub6gngKRsMieVEcIS9DEl/ia2alnwVpOTQ6gXwgtzsxxKOnYXKpmQQwzSiKsYI29
         HU8XqPd0evbSAfFgo7aLG0OoihdyOfVCzF4hFxAXyyLRB4toyHoXchHucOqZoLcBzf9D
         n0DVieGX+WVRpglJd87OLEtO7Uq1nXFSwB53jKyUx+WaWlFymYGoU29kww+G5JrN3ORl
         PW+Q==
X-Forwarded-Encrypted: i=1; AFNElJ8lCbbp0/bdgIVDMFZaJui5fEt49t0SCJ3dPXnd/M/I7KEV9H20Kyyn+AlNA8FUVwFcUWnmPhVBK7UA@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5m8DvfmfFmiWqgCWDqjisuxr7WTgBz+FXtipNy3/RzDtT1wt8
	Q3ZmCHqDdiRJds+jNi/ql6FwUkTMSbdi2E8CVn3gcYgA3jfcqMY30o6G
X-Gm-Gg: Acq92OFRD5477ZT7RaQOo48d70cIcjYIdbKyhHE70iJj9/by8ZFenhSyY0OC2RpCfRN
	83YcYWMTdALUFWTakKdi3zUry9tcUECdlZzZ4RYhBDp6UcUHZKlWtr0lNHFd6/43nL5xKNtl/0/
	55XjSZJJTKK7UH1doyvULH5oOh7RUou1h2tSg9oWpsXS4N2hwOudF4T5/O1pw2UueUKgcxLAVvz
	C2kXqJZ0lM+6BT9sT/UzMnxV1Iv9mK60w6jTmjisZy3Vav8v4PDXvThh5K3lXFjUosNw54H39kT
	uvpDMqteUrt70nD2KPf3l8D3ZF6sfqzPjIHXm2x7jMreVybw5WbN1gywvmg0Fod9s/Xo8IeP/CR
	xyb8vY8uEKa9O6winj0HiX37uCDMGRPA0mKZEocU1R4D9mg8i94jSyc/jnGhqnhn6Qk3M1tGMRL
	gI3kRuQcZoGggdTWv/9P4FHAEa4D/yPJP3XfDy+tFG
X-Received: by 2002:a17:90b:3845:b0:368:763a:17b8 with SMTP id 98e67ed59e1d1-36951889325mr3054654a91.2.1778831920063;
        Fri, 15 May 2026 00:58:40 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36959c7eacesm542040a91.2.2026.05.15.00.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 00:58:39 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: jic23@kernel.org
Cc: lars@metafoo.de,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pramod.nexgen@gmail.com
Subject: [PATCH v4 2/3] staging: axis-fifo: Fix alignment of wait_event_interruptible arguments
Date: Fri, 15 May 2026 03:57:35 -0400
Message-ID: <20260515075736.172172-3-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260515075736.172172-1-pramod.nexgen@gmail.com>
References: <20260510083219.70224-1-pramod.nexgen@gmail.com>
 <20260515075736.172172-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The second argument to wait_event_interruptible() was indented with a
single tab instead of being aligned to the opening parenthesis. Since
the fully-aligned form exceeds 80 columns, break the condition at the
comparison operator and align the continuation line to the opening
parenthesis.

Fixes the following checkpatch.pl warning:
  CHECK: Alignment should match open parenthesis

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..1c34de020cf8 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -246,7 +246,8 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		mutex_lock(&fifo->write_lock);
 
 		ret = wait_event_interruptible(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >= words_to_write);
+					       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET) >=
+					       words_to_write);
 		if (ret)
 			goto end_unlock;
 	}
-- 
2.52.0

