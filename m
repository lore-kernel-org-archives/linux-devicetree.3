Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CF536B07E
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402654; cv=none; b=BlaLmy0Adldq21Xq5TMBFwSaJTQW2505hA4BAXr8CSI+PsBp9S5dpbWPSW+q3YAd1Ov5aGScjXgmNuVJ91q5vbxk2zPrSEOEH6neszKsh84wtpEuH1k94up3hJS/wQFNC21/Nma+oaJWpQGleAkGxfwuGV094wM5Iil+mhz44jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402654; c=relaxed/simple;
	bh=WeUvgemHKksYGxuMitCOutRZJO5PJ2Fdf4PAHkwxyB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQZVKQMHnohW4Wl/hY6pHG0AEFbzRY10DCKZUcXo1bOxnFQSrLQ1obuYWsWgmzh2YrsmYIU1q6ZQiCuS6YQJORI+wPOlg9NXv0lm1qNAgg/WfPSlXfwTvoOOfzUerqL7ORqOoNH7Ig8m7n+lnrYXXESllu9aumxJc4jtqUxpdbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZyifJGD; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZyifJGD"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so30770515ad.3
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402652; x=1779007452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0p1tPnU7aXFXjhJ/ud9Kouh0tfwhorNg//3KttLCIYI=;
        b=HZyifJGD9IOKnXSX4fE+LNsAdDTtrnuqXz6JnZkRem8eFk8mbjerQ5GKsi09JZQWdZ
         UaMdqGWfvGmRgum9ZSk4qtC3SH5uV5cdjy430K6euFdGdVgLQPdDE1rHMCoU9NLIzo/L
         FtzcQbvEncdyTnMEPRlPwlUCo+3H+GU4yKylvQXxFM8iL/IyYaAXN71aOjyfU6+OkK57
         mFuXnCpdVQPOsIYD5REEma4a5Wn8CH1kYr80zPvLwnINVrfQA2oapUR59H6S1dOllUIo
         cZfHBMD16qt+Anc9chwzwr1dxcrnb9FMByoEZDTszSeDqNae/vEd5ZXNaANJ5p79gLzg
         2Kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402652; x=1779007452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0p1tPnU7aXFXjhJ/ud9Kouh0tfwhorNg//3KttLCIYI=;
        b=dL/mgXVpMug86Qwy/GeS7PDHC/APk6aGTaOHGzHtRP6eUJ4CwIjb9gAnX2jk7NUdBY
         6K8VAb6C2z0d5ogXj3tkU+d4xaqzU9eLacF2rF5pLvKBjxuKk6+TIl5jbYxHOPHtHCfZ
         06D/QW70SDY9C5Zv2V31ZU/SvDGvCTAfx6WE0zYcCYJVolJbg23A/SZeP3bGZfhnWsn9
         QxHdANxOXIJ2xxAo4r33aPYYvyzuZdqtfGKrpwtpOzWV/d9dOim/umSlSmnbXISq2vQC
         GoMy8hhYguGWYbww0wYWVIuJQBF2bga+GJZtDYkgJhAKFJIQ1JvPmCVpLZ4fbTXQgoFb
         Kzcg==
X-Forwarded-Encrypted: i=1; AFNElJ8D2nAK7oxMbVmxHwpoXl09RiPH427PtmVr+svkkGU6iwbXUY7BMl5gJgbghQxZnC6gNeAK+Uoqg7pq@vger.kernel.org
X-Gm-Message-State: AOJu0YzbBu2RbEoP1/OA29P9NOAUcRIsWAy2XD56/GayxwEsM+px1KXn
	7L5fRluYb9MEgp9zmQ3BpGapGMyqmMYCVMA5BMXERySuPUopdogghqNp
X-Gm-Gg: Acq92OHdGVhPQW31aEtr02uXUHfrR1Mdic6++2M0BNuqNLPfI7mAYp26JzjSR1aKAc8
	VD+laWG7CeJnr+RsZqRwGr5fYp5M/ScgGn51hrQUZ0bCBa6FdvKtoaL/fwA+s+cjRihajC5mtid
	qsZvPJFf1Wk8Vred/QPzgokeIMprzYtV/jhorvk6i64Rm2S7g3Iye57lFModje3L1S29DoRiUXD
	CtEA7ejf5gdWlvKr4MJAOinOu6nRDWBI3L7hff5ZN9RiJ7B0Rwhu5I1d9aO3RDNXOyv/VL01NOf
	p+ik9ePdMVejBlurRBkU7ounCpJEn4WhnNiRKF0j030yyKRlGvUEsYNNM0nNouuLUu8BFJ3WzYd
	AlvsW9CVmw2teTq5aOOU2faf8HfGUQy76Sr7JnTloEd7ctlWlze2HarwCRlwucMFoVX/oDAkxyV
	mk4KRrsPwvfGFTFGFCAlEtyCHW3O+QJn1L9p3BU9d5pC5+O27kP/2lLcikoZSStezWmEuM
X-Received: by 2002:a17:903:2904:b0:2ba:85:5827 with SMTP id d9443c01a7336-2ba798d3e99mr143113545ad.26.1778402652107;
        Sun, 10 May 2026 01:44:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d3ffa0sm70471005ad.25.2026.05.10.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 01:44:11 -0700 (PDT)
From: phucduc.bui@gmail.com
To: kuninori.morimoto.gx@renesas.com
Cc: broonie@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-sound@vger.kernel.org,
	magnus.damm@gmail.com,
	perex@perex.cz,
	robh@kernel.org,
	tiwai@suse.com,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 06/10] ASoC: renesas: fsi: Add shared SPU clock support
Date: Sun, 10 May 2026 15:42:59 +0700
Message-ID: <20260510084303.122426-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510084303.122426-1-phucduc.bui@gmail.com>
References: <20260510084303.122426-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Add SPU clock pointer and reference count for shared FSIA/FSIB usage,
and initialize it in fsi_probe().

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/renesas/fsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/renesas/fsi.c b/sound/soc/renesas/fsi.c
index 06ec5709216b..55a11f1fe8aa 100644
--- a/sound/soc/renesas/fsi.c
+++ b/sound/soc/renesas/fsi.c
@@ -295,7 +295,9 @@ struct fsi_master {
 	void __iomem *base;
 	struct fsi_priv fsia;
 	struct fsi_priv fsib;
+	struct clk *clk_spu;
 	const struct fsi_core *core;
+	int spu_count;
 	spinlock_t lock;
 };
 
@@ -1984,6 +1986,7 @@ static int fsi_probe(struct platform_device *pdev)
 
 	/* master setting */
 	master->core		= core;
+	master->spu_count	= 0;
 	spin_lock_init(&master->lock);
 
 	/* FSI A setting */
-- 
2.43.0

