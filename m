Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39E73CAA25
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 10:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779444235; cv=none; b=SgVFS9zd4rdUHZrL1MQSiyuBhqicPGMiq497yDdsJA8hFJJHZNXuhdgqYygNEHyp6/RHQTDsuV+FScMBf8/oBBS2FAMfSOGYFQSNn/Yn9Fywfdhd6hKXBgNoxM1hRQMFwbqCVgtoAVLBHdCnD5Hj753XdOuxbUMa8iy5mm3LHHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779444235; c=relaxed/simple;
	bh=wlWvomiauZ7B2iJ3h1A1PnZrGVNV+2V7Wo95ZMBDObc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CH2do5gGdlHrQX25EHYx+WG2cYYj7rf5tZyotwxHl/eZDQIAZ2FUJhODxmxAamGJH8kboIS08LsDU8dsQEbb5nTspJJJEDlLk3DeaaD39hXMgX/vWhQb/7tLsIDMfeHIm0PK95r8JRIFzpjvjdXNP9vAdLWQDIDlSqLfgt655xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YjDYoiKO; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YjDYoiKO"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2b4650d5f5cso28847015ad.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 03:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779444232; x=1780049032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ieAL7FXG9N2pPYlycZklbhAMC0pexNuJqkqoSDsbdHQ=;
        b=YjDYoiKOLoDN6c6IpccmhF87lmEMiUMfSu5lMtQIPgmCbTbq5mWubHB+7/ZoadiRE1
         V+QkVjP+GnRSd4itNYGgAA8KMLDKCum64BrOGW3Un4nNz+jw4HWuNbfDRHFJwLYd8KVP
         wKrz8LJpkahpvcY48V/vF+66dgc/iPB1s7+Ck1H9RpG5Mi1taZflg4riBujSOYdpewnR
         l42SPU1riW11RJfByzxH3W9MYc7JYyukZvIyVaNGc4F5LKM00DgIHxB+9n9UBhm6leKD
         qbHotJ3kCy65F3GTnHyk8oOndLtVw8RxqPXCZ6NdbPDHFSJDnlwcu90MkEujggczRC+F
         A1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779444232; x=1780049032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ieAL7FXG9N2pPYlycZklbhAMC0pexNuJqkqoSDsbdHQ=;
        b=oxAj+stx/CpFTMQ9WMxwp/29/4pyECH51bmesVyx3hz0LOH2Tt806WvwSrs1e/anq7
         37sTaEJWcbskHuYGZyOzT+UpDDY0wLNWXMRkC6pMzZH6/Hyck2Qiu0j1N1T2GZP7bkyF
         junhRW/Vwed2ry/wEB4c0xdIvikIUO/lZVb6HPGCk9tCdkx3YwLMO83VTXAXYyUJCOeI
         qUZ79xmj+J5Yds/LJSzUiaFTHsZsqZ1zBScFV4gvfgEbMDxzp0Bwu/uLg9La5n82v1j8
         PzT0BG2GhpSKj76Mn/gLblkRk9smfZbdqnEhKO/3lpL1ePut6xXPA9UbmyTnLfelAN4O
         0/1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/XxpyINeoHW68LoXAJ+syIAF6u1gjxCx+BFb9TOGaH/1mFSwvpqG9NWmXrIVA953XrhnAaXpsgaY8Y@vger.kernel.org
X-Gm-Message-State: AOJu0YzsKshsw1G98R3rymz1zaPbzrPvt7fn2tz9t5SFEB6eeQKeaZBm
	CTRkvFqEVay2DR35LN2cBgG6MybbBWdx4xy1fc3g9tz8j5veWvXItN2r
X-Gm-Gg: Acq92OEp+Nk6VZd/dln/7yMzpsun9UqQ37t4/o5vkUxILPNlc/460R4w/8NM+zBY6ZS
	jUeb0ZkAaR3cOoXJj14xWkZdKwnXIGxBZUFLHfkoZ8udJ6HPdZCOPoehImZW61+x6D0JR37TVb8
	JnvPtZfp/rENN+UlKBg1xk6OoAT8b32hwvIPHL0lYHeo2yXMPclZp0EJ2n5HZaZoASYzPbDGNJf
	Qu7G9DV74ZPi5IXy9ogi2y/s4SS1ZVwAph/amIBvQv1mw2en4z3mzhSEMidqfcxT0uM0N2DKEOv
	fhWy2E3JRWTtCGqAWq9fs5wtPpyG3gv34yOvpcBOooslLRB3lv+fhe3KfX+y2GMAQ9GaM9tQZj8
	8J/t71/5wkpIW8lQh219I5gOAlxfkmzKySQcScfuNIRdgQm98CMNr5JrSf4H3khsWPUtOK7+yJP
	20qk6yLYKIO10mhnn9a3s7bvoS86hgCafyzRJbRO7ngO2cTduzpxGVJumX1Q==
X-Received: by 2002:a17:903:24c:b0:2bc:9f51:2922 with SMTP id d9443c01a7336-2beb06c45e1mr28671585ad.41.1779444232060;
        Fri, 22 May 2026 03:03:52 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56f4343sm18683455ad.36.2026.05.22.03.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 03:03:51 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
Date: Fri, 22 May 2026 17:03:18 +0700
Message-ID: <20260522100318.73474-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522100318.73474-1-phucduc.bui@gmail.com>
References: <20260522100318.73474-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the 'hclk' bus clock before the 'clk' controller
clock during runtime resume.
The bus clock provides the register access interface and
should be enabled before the controller clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/rockchip/rockchip_pdm.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index c69cdd6f2499..8f78f7bc1806 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -422,16 +422,16 @@ static int rockchip_pdm_runtime_resume(struct device *dev)
 	struct rk_pdm_dev *pdm = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(pdm->clk);
+	ret = clk_prepare_enable(pdm->hclk);
 	if (ret) {
-		dev_err(pdm->dev, "clock enable failed %d\n", ret);
+		dev_err(pdm->dev, "hclock enable failed %d\n", ret);
 		return ret;
 	}
 
-	ret = clk_prepare_enable(pdm->hclk);
+	ret = clk_prepare_enable(pdm->clk);
 	if (ret) {
-		clk_disable_unprepare(pdm->clk);
-		dev_err(pdm->dev, "hclock enable failed %d\n", ret);
+		clk_disable_unprepare(pdm->hclk);
+		dev_err(pdm->dev, "clock enable failed %d\n", ret);
 		return ret;
 	}
 
-- 
2.43.0

