Received: from mail-pz2-f0.google.com (mail-pz2-f0.google.com [74.125.228.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39E5386C3E
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 03:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.0
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784949489; cv=none; b=m135jJUN/tC+VENKoq91EdLU0iU4ClAosVaoDg7FBFhTEi2wdeYAjVA1sDZbEAqLGcvtVQ1H8Z6/K8oqt+j9zEdYcV+tX0Xz8HWZE5lPLOuKeRfJlMuT92etCbQe2rTy5Bw18pgbyXeNdx6Qr3TaoAPJY/cZYO3v6ezkaxoRnns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784949489; c=relaxed/simple;
	bh=qBlMtjoJcxolZr+biObNXORMiyzxuZ3oViPL72enT0k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rr+wl15FC4Yx+G5nvs4yvIf65tvUB6t64TAz0FqbuwvJdiDhBt5rcAW4z6IDq+YFMQnb9FuTWxz+E4IpnmiXlVACO4DHj0M2XhVWgaBmd0cSrHsKp/R/B8Vu3hGPj+96Us9Pcv7QjuKeS1YqnS76C5/lpjDv2a7Dyohcu0tt5/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVMBAipi; arc=none smtp.client-ip=74.125.228.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVMBAipi"
Received: by mail-pz2-f0.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so634580a12.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 20:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784949482; x=1785554282; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G9jy5raEKPdDIP6H9Rn1M27tE88CgVPDyIdAEUIQ/3U=;
        b=TVMBAipiE6BfVB843+HdenXDb7ZgjdD4lZBoV0XMUErlancIMowVsSB4IbgnLQdVem
         3ab69bmTrjRPYxOnBbRXqIu5sO8NIJgoW4iO8UXkun2Z8fOG3Ulf6Z6tdHzDztivez1c
         jw9uuOf16ENIKMteQO6886OdYXSujKMV8V3VewoMr2ZZ0BXHFOs3mUws4EF+XsPKI3qZ
         NvYQxDsutePwydKdrTJgp5h9SE2kDJTurHz572FWwsuB/vFwJQqPSwDOS90u1ZVuqmbB
         mNTQPM29ZWcCtqvc3H0lmPxcr9UHL+aLu/7BsR2OAxsMNlyACWJWxGP6PrH21YiQ8fza
         MIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784949482; x=1785554282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G9jy5raEKPdDIP6H9Rn1M27tE88CgVPDyIdAEUIQ/3U=;
        b=BelAiSe0mQG5jJ7EPYzifnUPC+N1xT/umZmIY5ZOpBSqgeY/AH9hcqfR2tpqWGgvZg
         Gl7+rFIWZszMnUa/SEnTvK8zxgHT4HXN7SWO/G15Q9Ki7YKvhiKs0WCmq+ibz8PWjnmN
         m/57f3RJvo5guKkbrxCG9Ku67Tx9eGJEqJzvdd/YRM46DUhdDLAiOMDGibGfJlHDuLG5
         OofeymKMt+9+6OCVbp8FpmremBtgtfBDL6UWPK8nbbW4IQL+k4foSZn2/zaUO3MgLoiN
         vRaX0aDyqlOfAbySNH2dyOOq1gL9Dq7oY0yty8HM3ZSyB9m2B/2fs73/dGM6psfNLJWl
         /dbA==
X-Forwarded-Encrypted: i=1; AHgh+RqMUQV+T6WOSJf8yi7WuBNzKCE1HYCE8kXy8V7QEzrv2CuLF7vzlxlL41LYB2EM+hes2WFn+WgcBy7Z@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxqu29W3id1b9Ii+ZfxX8MK/vDJ1KBM0sRhytlScz17Dsbsz04
	54HWfqxV8gdEpLnhjPddlY1xgYLzvfIGWwjZ3+iupt37dEg2L1FwwV2b
X-Gm-Gg: AR+sD105LxWb/2iU1cbey0EyOhF69iKbhegAIKNkoR5r29KQl514DQfpmI1Xoy6MQYj
	ogy+ECrcuafx1S+ZEdgcNHJG8vJCEtacn/iNga3c9tlzuHSmTTxbZ5Qc7c9TULxE8FA4F2M7pZL
	Kqbht4wUMr/6N3Aioour09OtPcBTiMnEJRMpPsRLEF8VLTKEuwVoym87MkeMeFdWms1AAnzL6We
	lEMQzEKaumbanNDq7So/qek/BtDjxyHci4MPqRg4+wdQ3Q3XnHX/HT+q6PlBuOIOePXgJUzb+ra
	73Wh7yyUN/qdzGGcycFTmSAbA26KTj5tRh4rADnbtH4evWqqYpvO03GUEeKI+Wxwm56pHfEh01u
	sIfhiJ2iQixygKi40QA76AlqskKQbSGRouxdPtiYRZSc56JJXQI1wGtvms8XeUvjmRw==
X-Received: by 2002:a05:6a00:35cc:b0:848:44d2:72a2 with SMTP id d2e1a72fcca58-84e5944c07fmr653876b3a.27.1784949482608;
        Fri, 24 Jul 2026 20:18:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::403c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53432834sm640542b3a.50.2026.07.24.20.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 20:18:01 -0700 (PDT)
From: Cody Kang <codykang.hk@gmail.com>
Date: Fri, 24 Jul 2026 23:16:38 -0400
Subject: [PATCH 06/17] clk: spacemit: k3: parent eDP/DP pixel clock to the
 PHY PLL
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-k3-display-v1-6-f22a10a52867@gmail.com>
References: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
In-Reply-To: <20260724-k3-display-v1-0-f22a10a52867@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-clk@vger.kernel.org, Cody Kang <codykang.hk@gmail.com>
X-Mailer: b4 0.15.1

The APMU eDP/DP pixel-clock muxes were parented to a placeholder, because
their real parents (the DP PHY PLLs) did not exist as clocks yet. They do
now, so point each mux at its PLL and let the pixel clock reach the
controller through the clock framework.

Signed-off-by: Cody Kang <codykang.hk@gmail.com>
---
 drivers/clk/spacemit/ccu-k3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index cb0c4277f72a..afbbbd797826 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -937,13 +937,13 @@ CCU_MUX_DIV_GATE_FC_DEFINE(ufs_aclk, ufs_aclk_parents, APMU_UFS_CLK_RES_CTRL, 5,
 
 static const struct clk_parent_data edp0_pclk_parents[] = {
 	CCU_PARENT_HW(lcd_pxclk),
-	CCU_PARENT_NAME(external_clk),
+	CCU_PARENT_NAME(edp0_pll_pxclk),
 };
 CCU_MUX_GATE_DEFINE(edp0_pxclk, edp0_pclk_parents, APMU_LCD_EDP_CTRL, 2, 1, BIT(1), 0);
 
 static const struct clk_parent_data edp1_pclk_parents[] = {
 	CCU_PARENT_HW(dsi4ln2_lcd_pxclk),
-	CCU_PARENT_NAME(external_clk),
+	CCU_PARENT_NAME(edp1_pll_pxclk),
 };
 CCU_MUX_GATE_DEFINE(edp1_pxclk, edp1_pclk_parents, APMU_LCD_EDP_CTRL, 18, 1, BIT(17), 0);
 

-- 
2.43.0

