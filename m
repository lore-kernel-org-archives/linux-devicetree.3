Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA84F398902
	for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 10:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776074849; cv=none; b=UPj5+3fNl8QmQNEtrqzxlP+L29kihCP60GRvmswnGPEVYkyhSm2ciBdUI7pVkrsfued2M+ZmJwm/DuIiOFkX+4uFdAux+bBajYBqpjly+4ZGtA782xrAgB2oJr4vZ/LLvoRStAEbh9Se6ycf1UI+BrBjaucIgPN4UPnTus74H5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776074849; c=relaxed/simple;
	bh=Tp7bU0NE3+YX8R0YS0oLWp9a65H5IctfRXy2H2MEw8w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcHMgoIYh2I7LocMweJVa5cM4Z55/ISL4Em/2L4lZVlncJMrS8IPVdthmY1F/8uD5aAPtzvQ7K9bF0H7GuZI19887VgaOb2a1xJWSqae0OS8kl8D/J+g6gsuFxxKUg3MBIIE2QKvKpZp07XuVN+/meapPetwVkuZBI/fxH0BM2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4Ol3YWw; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4Ol3YWw"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c76af7b0f94so2855099a12.1
        for <devicetree@vger.kernel.org>; Mon, 13 Apr 2026 03:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776074848; x=1776679648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BKAxSP/4ix5smOiePDg7BRwPz1GOM3xb3FVW1Uy+aNY=;
        b=h4Ol3YWwLPMAljplto6B4F3jkTn7zWRREKm8ad0BSpHL4tpR6PZB/qXPNCfymzjgtP
         phAzHx16B28N76lHr0B2j2BWP6IieXzQqlEeSVDbR88qyrAwEkeoMsXsTRt50h0aZmQO
         N8qTpq4gjzD0UHQPlQ4v4+aXmVNDNHNW/lzBf8fPDE4quaediO0kfo1SKBQnAkjX8nRk
         wtEJr6Psm88GiQt/r3Tka601hnp/iax48zgd1J/vnC5u93ueRCut0ncy0kbvyW5FCTR5
         5YpR7hz2Tf3HVDDuHaOZEGQM00mDPVWfQwNg+tp327knrXekwJY6JNU7XwYeuPOQdX3v
         ZdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776074848; x=1776679648;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BKAxSP/4ix5smOiePDg7BRwPz1GOM3xb3FVW1Uy+aNY=;
        b=hIb4LkTs4hYWM/p4PISB0BeHujmGo3Vp84T9X+H01Kn74cp0qIMkM+FosbRuDTN8Jn
         S1KSemSD9QuSi8JBWGltVOayJcjiOWtFoQRIMlPy+xV67D8YNklIFPZf1iHRz+DMCHo1
         igsQrwuWVXb+nLfVm3zOkQvN09PvXpsHmG5d0Ad8ieOVXxXwB/V1B5Hhr/aUSmFp/f3A
         BBxNuZXx+GWAMlNR5m71E7SYMy2P35BEiR62xDVwbCpFvHyisRBk07muEtcIbzZk0Zci
         jYO7OJBcxuQM04v+dGkf+mlNFYBKnVGQk54GudOnLeohtyvyw7SlscIx+NZNDEuseUvE
         /Xkg==
X-Forwarded-Encrypted: i=1; AFNElJ8zPvE1M1BLqVZAD7Tn4+/dMaE4k+XQj1d5LQzwd/Yh0pIpXTZh/lHtgnX553TBfxxygGEksM53VtyG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr8b1RIiN9hTtdcsWdKyVJVu3egOUyomlbR6H+jESdyqgEI887
	5VWMuASeNSPJc1wRCyMMCkoniHF8Z+2Pg2NO4rE0nkP9MYjNpTsMznfg
X-Gm-Gg: AeBDiesJfL2ARDX5Ezi39SdX2gMIumbUVLIMDpOVF/XbEb/PyoKJfZ1XfYxVpcNNpVQ
	6TWG9OWROqyknV+4gc8fBd3M80LP+c2lgijz1/0RGlExpuLrJpGUb3YG+JgeNWW1t2kRxQvoPV9
	hvUtnXhJV7Naq6wQjQWCHtS2v+u/J2fMc0BDtw0dbJoYu3/r24GW0CdPLUT8SLTGm3Bxj2Qn6xU
	vnabubd7ytZLgMJWS2L28p0uDBGLQBc9X6l7d07TP2eRjLiQhGEpuJQVbmMS7LOMaHjq2TMzYnW
	Y4znO7SR2TJSlsIzkua50iMbEHz0OSvfeYWZbPKdUBzB0jwRzqZriBhN0SCFyMjO6nzwXyIDcKG
	Qj1zSm3KjhgibucKYLlsi7MIddSz3jOnxAcickx8c8s6rNfYK5VX/hKWGJ3lQDaS3RzOyWnB9za
	UTp/KvdOueKM8DeUE5aIB0mxhHD6MU0rfcDdsPOeuvIcnnZwsMPtrcMVDMLA==
X-Received: by 2002:a05:6a00:4218:b0:824:374a:1407 with SMTP id d2e1a72fcca58-82f0c210956mr12547467b3a.16.1776074848063;
        Mon, 13 Apr 2026 03:07:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c50a8f7sm10232140b3a.56.2026.04.13.03.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 03:07:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com,
	broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/6] ASoC: renesas: fsi: Add shared SPU clock support
Date: Mon, 13 Apr 2026 17:06:55 +0700
Message-ID: <20260413100700.30995-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260413100700.30995-1-phucduc.bui@gmail.com>
References: <20260413100700.30995-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add SPU clock pointer, reference counter, and locking in fsi_master for
shared FSIA/FSIB usage, and initialize them in fsi_probe().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add spu_count to track active users of the SPU clock.
 - Add clk_lock mutex to prevent race conditions during SPU clock
   enable/disable operations.
 - Initialize spu_count and clk_lock during driver probe.

 sound/soc/renesas/fsi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 1491c2f2cc96..196ec7bac33d 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -292,8 +292,11 @@ struct fsi_master {
 	void __iomem *base;
 	struct fsi_priv fsia;
 	struct fsi_priv fsib;
+	struct clk *clk_spu;
 	const struct fsi_core *core;
+	int spu_count;
 	spinlock_t lock;
+	struct mutex clk_lock;
 };
 
 static inline int fsi_stream_is_play(struct fsi_priv *fsi,
@@ -1961,7 +1964,9 @@ static int fsi_probe(struct platform_device *pdev)
 
 	/* master setting */
 	master->core		= core;
+	master->spu_count	= 0;
 	spin_lock_init(&master->lock);
+	mutex_init(&master->clk_lock);
 
 	/* FSI A setting */
 	fsi		= &master->fsia;
-- 
2.43.0

