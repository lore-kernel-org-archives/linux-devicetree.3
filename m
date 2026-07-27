Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D511E5201
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143806; cv=none; b=nb+qLADP6BWIoX8Z51TEGY2b1X0GcLrAIjxh+kdoVDeogdDlGs0FLyUJX1uVyD2CQbgCW3T6b8WuZAR0CGCZmtZvCRPPV9lkVZfqb8Bcc6glnR4by1OEMNebx5iQwfbkNjZH9lE0SaTH9zujVbkEcHbCwazPdIHgJ5lNp/5zrRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143806; c=relaxed/simple;
	bh=yhY7mLjZfGOCMMgNPHfCV2Pu5mgEkzZsyZuduXNnUDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c14rC7XhnpR8mDVGt5Ea7reoqYeUizE78wsNAerMzJduapVp3gWgRh8xDN0+4gA3dfK81DpG8vo6CdhBv1XOKixwdaB0GrPiYeWjKKOUEhuSJoxBo19rLg8MZRlHCdYCQXzeBbDx50AU4GNC+QxoodAdk0gCU6n8zaZVRKO+9ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QRO9AnQt; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QRO9AnQt"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1741640b3a.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785143804; x=1785748604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=QRO9AnQtiL/N5oCZUTUwUBbxAecrM9HbCegCYHkjhMD4KGUHjgRUqV0qp06l9q5Pod
         60zbWwwMfzOh6UqtT6OWQu9OZDIG7qf/GcU9xe6GCBnGpjrjodApSeREl/AsUa60AnbQ
         IMig0EtubX0ynso470btb5HKssGCcFSLOeTB8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785143804; x=1785748604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wxBpcLwQpOW2vKL5WhYL3BFfyuddH3BZqW5fz8lS/T8=;
        b=FVtwOms7I77kxZgcIDqLRzprY5cLSIAKzVauCRnQUfKYlIOhVbo1nrMxtw+hc1xiqq
         Y6Q6kCsW53Mc4BZco/htE7NNY4Q4Sc7QcIk3oZX1yqRlOT1CCjrj5z2Bk3aagjj4UgmO
         mHG3ZHlGogYVwN/UCj6pj98B7L93vkJaPgNvgIeqD/2L+uBd7ZHqo2rtakp7dEMx9RE/
         MIZomKgyP4ViSW+soPuvflpFn3mkLjbnS72VTdPtK/l3Cn85swCNtWyxtzURLbx0lAq1
         yZ+9k8/D/J27oCFLELqIw6a/dSumGdQAXeplCwK2xPMy4S1bMxVs9jhrOcDqhRK54nhW
         ZslQ==
X-Forwarded-Encrypted: i=1; AHgh+RprviDnu6AM+aO48EIy5Cg/9qw5tIxPyne80L8quCgfGsargsfbv7cN/2Cs2+i37NbfhguLRqnfZOA3@vger.kernel.org
X-Gm-Message-State: AOJu0YxKopbf7KtZ34W0GvwiRtgaQUboccj/5tVngKZ839fYuRylk+NS
	FiSqPvVIthxaqdH0UO7VvTAQDHzaa7HosvIebW5caKJVwYdxC4D3FtjaiOWwo+fS5w==
X-Gm-Gg: AR+sD11NC37mJV81I2/7u+KukpTYqd5V8vd3aDwqW8SjjG2VTn/7pbX05NIVCSkiDEX
	PvgALDicCs6toYx56/ZWmuF+DcT4OQ9Vrp485BXQuEV3yN2w3PYDDBpp1KQHpga2xIAfbNc6XGM
	1zgpwVI29LaWqErwcKMksz7XUeqv/4MJ+DnKyXGDPuznHoVbWy6o9w1WJXaQ4FeM1CP7gIcTC44
	65+IbQwlRcGc898XmLHPMAgnQrJQoc78EWmx3Ll3iq83U9MJQ1azBJukA8f9NFUspGvUS2Ih1Lz
	y5/fn4FqcPliTpbShVZ2/52APYOkeGLvRRJMdxuE4cGBGioOh4F6Pdk8xCrQaDfnKi1IcHLlPXu
	W8uAvSg/gG7zWNHwqqCy9flUGCrdh1yxccAlIm5nDkhWIs1vHvKCBCChOfVF5mMBTrbhQL55dWK
	ggP0lo/BQ4JWGL8m062olMPmVfXISiVlBnf6+nEB1Vvdd0BaIdwgTFx27NIA==
X-Received: by 2002:a05:6a21:e081:b0:3c3:6928:8b25 with SMTP id adf61e73a8af0-3c67da6f7dcmr7155408637.17.1785143804308;
        Mon, 27 Jul 2026 02:16:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:440:c713:a2b0:6f14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb662329fsm2870049a12.9.2026.07.27.02.16.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:16:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	YoungJoon Lee <getfeus@gmail.com>
Subject: [PATCH v3 4/5] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Mon, 27 Jul 2026 17:15:53 +0800
Message-ID: <20260727091555.1023910-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260727091555.1023910-1-wenst@chromium.org>
References: <20260727091555.1023910-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..556e806b7787 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -505,7 +505,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.55.0.229.g6434b31f56-goog

