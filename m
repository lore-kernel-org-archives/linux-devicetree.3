Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DAB3A6B88
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485702; cv=none; b=kAr6p4Yw4Ku5LRjvq32Zohci1YV62f2NYMXGNdp3WSKNZFS9dFV1eUWGGwkmk/J8xVT0dORM7kYf4Fx/QSZIslLkCp/LtuvhkiT6ecmMK9DnLiN7nnTQSHF5u25mDFEQcmuRGCmmv+ln//rZrB8YvgQN5kYWoKiSkLy39CPNBz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485702; c=relaxed/simple;
	bh=a5IbzyKjLis3eRn8I8yPDJONzC7VptAGC33I38MNFzs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hockH9D5Buzyd46xQ1MbHlBhAoyXGGjga71UME19eVsr7YC9HoCYMEEnPbV5Xr3Ud1F2IXKREM9J67H8/Q53cKywiJVrkR5v05BmRLkwiCezmmwNfGQqVE+it7kMEzWOeSkXOdi0WfHYwobEFHiE0mKtlSGyAp/TimPWEbZ7qX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfUUeuA3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfUUeuA3"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so3776275e87.2
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485685; x=1779090485; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AuVuUjraHty6myNY4pFBrvXQYP4/ymaERtjyOYr6d0=;
        b=hfUUeuA3gyVafmmLNJovBUH6vaUYDH6soWYf4ieh3dofLwV+G4CkYIJ7KiFuxugo9i
         AHWoy28unYV+FBrzFE2J+VjJ3IvgUfR9h6mD88lPFDPuO8sWg/r5pBiT3UUSNY2jWhdx
         vXr0eTiQLw3p6Ep8Ljvcnm2AdWuzW4My26Xo/50bAa/MUUzqRWJF/iuN+meUKvU9POux
         p1xPyVKsDVbfPlGmsO//P02bIFZQrBXdfzQqQmQwU+ukizuDjtsvS4NsTl/Ugm/1znSE
         ivhMueHRGZnb/TDEijOOnT3F4F8+6B5LnNgeb1mPlio0v+IwATRVYp6NOj4Yu75/xGXH
         q7qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485685; x=1779090485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3AuVuUjraHty6myNY4pFBrvXQYP4/ymaERtjyOYr6d0=;
        b=W7TR8r4j6Y/LZqeynFCFzISOKPH74A0zrjSZMH+RPf2sCz5mVOCIPOtHcmH5EcJYFt
         XBaSUJQrxDGp1fWhIXXA07pyKLO713IBe2JOjWVs4eB1FQYER+OQQkY/7XxnC6fNcxj1
         iZksNue/R8s4k1Y2Rkcfq/HHajq+GZuo25KTlIirdh/epQ8Eebx3TtyK2FR+VTTaySXk
         8b2+xSfojqRyD99E9hhPw473X158YfhWHAO8/NnO603yuYJxUaQh3NLoH/OowqPnpNNI
         PtCZ5+Psyr4/uAR8I0aY79ER/tDV3jADucj375XmIZ4Mkfhpr7plvINX6DoSZqogdETP
         tmNA==
X-Gm-Message-State: AOJu0YzPwWFQVxPZVLoIzKxQE034bRzFsc3aq7tkJHaIxPDSiIZM/KYa
	XPuR6iDzP89q9QreDyXOG3r7va5AsIpxowlJrLER07hAC1lTMKZwaVIE
X-Gm-Gg: Acq92OFt57c719AomWSUYtzGYVHg8W7XWMoI2yVvSrwujHrPvwwtB/ZdUqYiI3V6735
	r4XgQF5ogNX8BT6muITCPiToJJO+Q137kyrcGprKaMezLLN7n0PZlcuoOLWnsUcyqMZqSe8WyyK
	xHM1PhnOlHlG0wA0e8qACL4Mzd6mAB+6D1N7FrEa0ZD/qHMlmCzeuJ8AS8B4fMJi8JAYxN5KDh0
	/2Floo4bt+B9kTnM51fB5jHp2w9L+XbJnbUbzW0nN7sHSdwRa1tgNGC9CgTMPIaT1nsPNexa0Gf
	imH3sTl0rdfiIzJ+oLgq16SSf4MshQkj5wrpUpnk7IXhSvjPA55OKjrHmA+FPVqkrnzWJyxMKIO
	PRr/ZwrUfpIAUq55oyh6lOFHbEn8zSUNhF0MbP8xt+4CrQHNiJOkUKpYA/LHj2IVi9cxGlUYTGw
	SMXyfvvaPZtHJb
X-Received: by 2002:a05:6512:3c93:b0:5a8:88f8:9eeb with SMTP id 2adb3069b0e04-5a8b6ca29d0mr2370612e87.11.1778485684961;
        Mon, 11 May 2026 00:48:04 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e096sm2386670e87.38.2026.05.11.00.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:48:04 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] clk: tegra20: reparent dsi clock to pll_d_out0
Date: Mon, 11 May 2026 10:47:49 +0300
Message-ID: <20260511074752.24745-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260511074752.24745-1-clamor95@gmail.com>
References: <20260511074752.24745-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra20.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 2c58ce25af75..551ef0cf0c9a 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -802,9 +802,8 @@ static void __init tegra20_periph_clk_init(void)
 	clks[TEGRA20_CLK_MC] = clk;
 
 	/* dsi */
-	clk = tegra_clk_register_periph_gate("dsi", "pll_d", 0, clk_base, 0,
-				    48, periph_clk_enb_refcnt);
-	clk_register_clkdev(clk, NULL, "dsi");
+	clk = tegra_clk_register_periph_gate("dsi", "pll_d_out0", 0, clk_base,
+				    0, 48, periph_clk_enb_refcnt);
 	clks[TEGRA20_CLK_DSI] = clk;
 
 	/* pex */
-- 
2.48.1

