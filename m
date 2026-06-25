Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226A719C54E
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782380714; cv=none; b=bx7rNLu/zv4Fq40n4gu+aywXbtkMYclQuoutlfa6OhBZbylSwQACyOG4Q+2ZV6soATn6+gsnIj69zkOqWsXF7FdyH8tWPjku2Lufj8kNn4oDpeIN/obyYi/YQvtWQeFATWvN5kRCblNKeIx2OU6MoZB1DE3jncNbM03/nVsDA7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782380714; c=relaxed/simple;
	bh=zXLgj0Kf68P1a9/abYjox2woZH0s7TjULccTcbQsBf8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfDCysDnXBmO1sRBfdPZei+5d8bZQHaX+rltfOutA4SHp4DEnrtY8/9eDJqZc8IBlELMW8wkwCDOI34l00FB2XRYug+xAuTSI20G71hMSQai19j1pVLNSkoGcAhHlXyu3TAASM5R2DV02fAzMhdXjTnpmpWjYI4JVO0CdwB0s7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gr26P2gI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gr26P2gI"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c7f11150cfso7004525ad.1
        for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 02:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380711; x=1782985511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3I9Z8wqgofyuO3+w6/YgxBgJq5JW6cTK82PfLZ4BPc=;
        b=Gr26P2gIRf6RJw3WAoBvd2abGaLseMgL2wh4WB7bk8mf5PcXqSBsi2tXQrqpH82P88
         Xw/bb0OfopBzQRpC44zQnCA0GHMSoPmzQi/G25O3qvyV/kvj5BvtB9tJvxoNMedt2eYZ
         wgKfYamAFS7ZtzstT2v9p7bfq5ykIzL3aR3TE52ASohKQXIbTPSmA4LKwgUwVQqbtnCt
         nT6tEftiyFDk6LDEo1R7gA5fkYeqsRMGqyceqIvKAPVrgHnHeCGX4PGtr1BARjngsZOm
         6uGayV9prYB3+E35l94KO+/p7IeM+07C8snQ6SZV6E87s/RyJwl04OtypIysGzgHoNB/
         VvFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380711; x=1782985511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z3I9Z8wqgofyuO3+w6/YgxBgJq5JW6cTK82PfLZ4BPc=;
        b=JHjHVu+gAfJpdF/owgejRleE0xFCJd50yGs+nw5CTtVlm2Bf81RtGwE5FFnBQIEZmX
         6SJ+CnBPlp+gSqhVtxBWfmB/OI23iU1HyJZEdJ0dG9gtWrMRcg0yJ0tEyBGttokeCDat
         cvTmyYbc0j2SJlwQUU7GYfLBmmFidf/l9k16XpZAKbhfe33t8FVBvSzeCL8Tqc/E8TBa
         45W3w/ie5nwkd6srvFeNpnE1/mM2tmS5c8ifIY0KK015SuJPc4OaYS1o2ZQ11mNHU/Xk
         gh4+mj5ObCX8o8u4Qjaue86PgPwXN+U7Cah5pzjSgHuuHlu5KE/CMZ8QPyi+l7PqhGYX
         c7hA==
X-Forwarded-Encrypted: i=1; AHgh+RqqUJeVZxxyPxgIQfR5GsGYL9NUHnfMiT/0F9TIZy+PE44LicNaeFz1s++0MDdvwDebRKCgOYnpj90N@vger.kernel.org
X-Gm-Message-State: AOJu0YyTLbeCFhoZrD49EVEFPlkI0SvWQJSTjeY6ZJZikZa4IVEdtSl4
	vmtzyQFF37YlnyDd2v/0q08wIGmgz/JJWhnGMEvymA+XuMbitIK+lehH
X-Gm-Gg: AfdE7cnk6JRV2jdEzZ5AqRQ/mK+smOl5f9OeBmsNojhUs95BCuHD2O9fIbhZsD4Wb6X
	uSivuyTvOWe30NFlv+UUeiEJvKxmR5F3PHBCihb0m0W6H/GpqjRMbUBZQqrqsBcIdUvS+EvQKsH
	X1NHMcdbYVytKOBJL4VdSidcyvA6BPv7gIY6XMVI2RJpOAt7WLmQAFFrucvTEV3UFaJOHLo3/M+
	mpxG7Q/qDNJ7Lp3CWAr0O7JGp6o4F0NV6TroczY8NMHOlAS4ItnfEDeeLDnIyo03A04h80GB30C
	M7iIiXsyhaYb69DyGZdZ+lgKIxTIJyWQWllGu5VXxSxrvtGGkxuFwN9OpMcLzpnPibrmixDxxc4
	M8ecQzmj6S8zyrlKWy/a9xag92FakoJVxwjckj6WJTMA4ETYMYtoxLCZeylV2ZmBdvjAtddi/fA
	eG8t6cncx9k5yeDQwiw1Sc+kxWoP0C97EoKLJZtpeXwi8rsJAVQKo/WtXBG+aewQa1LQgrGQNbF
	Q==
X-Received: by 2002:a17:902:d4ce:b0:2c0:a746:7b16 with SMTP id d9443c01a7336-2c7fc73b753mr20074445ad.22.1782380711366;
        Thu, 25 Jun 2026 02:45:11 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8c26sm16614995ad.1.2026.06.25.02.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:45:10 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: zhengxingda@iscas.ac.cn,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: ychuang3@nuvoton.com,
	schung@nuvoton.com,
	yclu4@nuvoton.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 4/7] drm/verisilicon: make axi and ahb clocks optional
Date: Thu, 25 Jun 2026 17:44:46 +0800
Message-ID: <20260625094449.708386-5-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625094449.708386-1-a0987203069@gmail.com>
References: <20260625094449.708386-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Nuvoton MA35D1 SoC integrates a DCUltraLite display controller whose
AXI and AHB bus clocks share a single gate enable bit with the display
core clock, so the clock driver does not expose them separately. This
patch makes the axi and ahb clocks optional in the probe.

Signed-off-by: Joey Lu <a0987203069@gmail.com>
---
 drivers/gpu/drm/verisilicon/vs_dc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/verisilicon/vs_dc.c b/drivers/gpu/drm/verisilicon/vs_dc.c
index 9729b693d360..fd1f5fe67a68 100644
--- a/drivers/gpu/drm/verisilicon/vs_dc.c
+++ b/drivers/gpu/drm/verisilicon/vs_dc.c
@@ -90,13 +90,13 @@ static int vs_dc_probe(struct platform_device *pdev)
 		return PTR_ERR(dc->core_clk);
 	}
 
-	dc->axi_clk = devm_clk_get_enabled(dev, "axi");
+	dc->axi_clk = devm_clk_get_optional_enabled(dev, "axi");
 	if (IS_ERR(dc->axi_clk)) {
 		dev_err(dev, "can't get axi clock\n");
 		return PTR_ERR(dc->axi_clk);
 	}
 
-	dc->ahb_clk = devm_clk_get_enabled(dev, "ahb");
+	dc->ahb_clk = devm_clk_get_optional_enabled(dev, "ahb");
 	if (IS_ERR(dc->ahb_clk)) {
 		dev_err(dev, "can't get ahb clock\n");
 		return PTR_ERR(dc->ahb_clk);
-- 
2.43.0

