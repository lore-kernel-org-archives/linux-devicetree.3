Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2677248EC90
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 11:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633368; cv=none; b=ExmuuCfh/0f1+K9jY315EpK3E70kYJKx9RyOiye928rQb2IRr23lGJrWw0CmaEbOHfLfpeaFywZue/QWqmFMD6s3sHspC2OoCJSXC5K1xmOWiswMusiq8LY6bfAr3+KblxLb8U439s3J5P2kgRBI7XRzMKzfVGx8ctkWtX6LJdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633368; c=relaxed/simple;
	bh=oWOjt1/BP/ZrdTdhWqbWJnrKsyEqrYi+/tyFuMPW57g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tIgtHPjocFTcBA7zbYgYx9pL/rdpcipWIlcRrCL0/nTTznC240Bmt5pvFXVlDbyGjo+y2mHT6B6Smt2p6H4X+g55p0EX6CWl6Bq8S/xjD4LLsP5aF/UBG2n2TaAWTKuRKzzvKV+r+F9JdBUJ/kVZTsUGiQSkGch7hJvO7KGmnnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnmrbSx4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnmrbSx4"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso1722930f8f.0
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633365; x=1792238165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qv9bAeFxVCYRZjcdo00nj7An4pwjaNEncFgD0tELhn8=;
        b=UnmrbSx4gwCsF6GeA3tG7jLc9IjrJin8eP5Ex1FFWcTOsnL02w8GVhG09VYoz/vRPS
         BKfUIF5k+DD4gOUmz2TTfxUpiAbj6ib8uK9MRnEwzIPuuQedEprfE0oPq4m2aMujrkTp
         t6BVKVyjWYCHYv1FbSTH6J0wZtiO7sz2boIuZ+9LFuTKjuv7+z60mRO7DkVk62RJYRHd
         hCBn158uaBHGcYqRMwcUG1GW7cvgtayeUdetUW6P1FpNuhX03vVWfwMyl9Sw4YL7AZNa
         +odSCtIp1DTPqc54Rfad/NUiJVw6658nFgtriLX88ZcOUK3mrmk3UoVYxfS1DQ+V8Ank
         Hf1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633365; x=1792238165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qv9bAeFxVCYRZjcdo00nj7An4pwjaNEncFgD0tELhn8=;
        b=cpDYN9h1BSNsKWxJewrKRJietODxKHqm1fIEUcsgqXKp/aRZArsmteU1JpxMRC8dol
         +ICN13M1jDEZ7ISboDaFKN75Jfvh7vQfN0xHNIfH88YETSzUPn5kJy0EtpUQi5trmlBW
         dGOgmKNs7PPNQhafVtPsTojXgjitXWbpRmf2qH1jR9H30vM/QaEadkRp0QtiEd6bdlIO
         KDJ67sFE3Bwh/u7KqlEH4pIcV2XiyeaW/4YdGDIIYaahAi/cUY6dR2g7BlBl1/7Uwgr0
         //zZiCKHZlC0ONJVL8drpJx4AA3hXlSYQJO2ZLJqKWtDtr7cExW2Wxd4gCH2ZqvQDpRb
         xtJA==
X-Forwarded-Encrypted: i=1; AKwUvBzzkHKWYgEYPygmgvCi74jqWcM1KuZ8jMZZsaTgqOlnUIPnZBESx9gyIdW/3mc3B2gVkvvK2HFvUmlz@vger.kernel.org
X-Gm-Message-State: AFq9FYJFqHFN82p8FQNb6hMCKmU8uKkpP/RU5DP643+dfweycX+I7dgj
	s/tnMcNg1ARQMgnBsDnSot8xGtuIstIzZrV4W7DxKKso4Wvwj9IS+1he
X-Gm-Gg: AYBFou0my7fApM1aGus4IAOkio8SaMPFja9lfN5iAQN7neAZZHJgMvfLoq2+wN6nshU
	qTSyU4ufpz67b3G+2fdxLpqsIHK2y7xC5lrr7ZEdY0MioBB4jSRJSJP6OYIl89CFud3UZmCRuD+
	UfsgKFgH3uBLW1+dDebci8YNIapBjbVQR4YD8AVYrN12nnmZTr8IP+lskTjx2/VNzcAkSdPExWd
	8aM7U9UsFHp+vWElL5bhDNQsRJWXRjqldu2U3AzJoskokNWUYt2c5VXdFJoWQKALQIxTGc47X7/
	Fdnmm4niP8nTVRCBhFq8/jJ+2pDccBWP3WIOoi7SJN0SgK7sXB01Oeuay0ioy9ABlL4HxwUUsBH
	Vq2D4lwnQCm25QoxEpAsw5VwglgRKg/3BypCsoTUn2CEvPK3aVq4KmmS7OdTbUn6YYfGdc/Ucqz
	boxxLdaOPGgjRcihRNyPcdBvwWgKpQuN9ChtEIpAtGfFcBcZpTHJ4E8hb5fKWqt1FExQ==
X-Received: by 2002:adf:e00b:0:10b0:48a:fff3:f9c1 with SMTP id ffacd0b85a97d-48db9482030mr6898560f8f.20.1791633364955;
        Sat, 10 Oct 2026 04:56:04 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:04 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	chunhui dai <chunhui.dai@mediatek.com>,
	CK Hu <ck.hu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/7] clk: mediatek: mt8167: Correct HDMI-related clock definitions
Date: Sat, 10 Oct 2026 13:54:04 +0200
Message-ID: <20261010115539.9237-5-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010115539.9237-1-l.scorcia@gmail.com>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the mt8167 SoC, the tvdpll_ck clock is used to clock the DPI1 pixel
signal that is hardwired to the HDMI interface.
The clocks used by those two blocks must match and they have to be changed
according to the mode clock appropriate for the display resolution. Fix a
couple of issues with the current HDMI clock definitions:

- The hdmi_ref divider references the same register and offset of its
  parent tvdpll. Make sure to flag it as a read only divider as its rate
  must be set by the DPI driver only.
- Both hdmi_ref and tvdpll_ck derive their clock from the same tvdpll
  parent clock, but its rate must be set by the DPI driver only. Unset the
  CLK_SET_RATE_PARENT flag that is implicitly set by the FACTOR() macro.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/clk/mediatek/clk-mt8167-apmixedsys.c | 2 +-
 drivers/clk/mediatek/clk-mt8167.c            | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
index 3e8611991de7..a7d38c194759 100644
--- a/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8167-apmixedsys.c
@@ -87,7 +87,7 @@ static const struct mtk_pll_data plls[] = {
 
 static const struct mtk_clk_divider adj_divs[] = {
 	DIV_ADJ_FLAG(CLK_APMIXED_HDMI_REF, "hdmi_ref", "tvdpll",
-		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO),
+		     0x1c4, 24, 3, CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY),
 };
 
 static int clk_mt8167_apmixed_probe(struct platform_device *pdev)
diff --git a/drivers/clk/mediatek/clk-mt8167.c b/drivers/clk/mediatek/clk-mt8167.c
index c64d918c37de..a14f0736cdcf 100644
--- a/drivers/clk/mediatek/clk-mt8167.c
+++ b/drivers/clk/mediatek/clk-mt8167.c
@@ -75,7 +75,11 @@ static const struct mtk_fixed_factor top_divs[] = {
 	FACTOR(CLK_TOP_CLK26M, "clk26m_ck", "clk26m", 1, 1),
 	FACTOR(CLK_TOP_CLK26M_D2, "clk26m_d2", "clk26m", 1, 2),
 	FACTOR(CLK_TOP_MIPI_26M, "mipi_26m", "clk26m", 1, 1),
-	FACTOR(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1, 1),
+	/*
+	 * The tvdpll_ck clock should not propagate rate changes to its parent
+	 * clock so the dpi driver can have full control over PLL and divider.
+	 */
+	FACTOR_FLAGS(CLK_TOP_TVDPLL, "tvdpll_ck", "tvdpll", 1, 1, 0),
 	FACTOR(CLK_TOP_TVDPLL_D2, "tvdpll_d2", "tvdpll_ck", 1, 2),
 	FACTOR(CLK_TOP_TVDPLL_D4, "tvdpll_d4", "tvdpll_ck", 1, 4),
 	FACTOR(CLK_TOP_TVDPLL_D8, "tvdpll_d8", "tvdpll_ck", 1, 8),
-- 
2.43.0

