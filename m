Received: from smtp153-182.sina.com.cn (smtp153-182.sina.com.cn [61.135.153.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744892F1FDF
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 08:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780907903; cv=none; b=lVa5b55LpKTw6/BizKLZM2QkwMNzI7P2gLJ73FMTYCbDHk9xlj+vLG/tXDVOoWRRpqtXeKa7zYoeVmUevxBENw+5D3lOGCLgd5z7FdEvMQzBfYLdDFVO+FgdDvBYs04Og2ohZ3C1kfkf7RET757aDnYgbEXOxcE/95N0BdJv2lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780907903; c=relaxed/simple;
	bh=eNkE9fThA+Yddd79uMmDbx3+986LsI7yJiUpq9sLT8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=NpFz3Lcl8rwHEs7fzrMkdWFpsUwKrbZMuX+bYNhKRsQvza+F+i81vtGFBsMMndeAf/80hrdujbrXlfOfS9tBg3z+FEK8pR1IEiLy1LY43ghxRGkOziEcSNZ2bz1S5w+u2yTNiH67mZFwidxwhN2axfjDeH09iGXVaSUAwsqCeVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com; spf=pass smtp.mailfrom=everest-semi.com; arc=none smtp.client-ip=61.135.153.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everest-semi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everest-semi.com
Received: from unknown (HELO zy-virtual-machine.localdomain)([58.38.107.94])
	by sina.net (10.54.253.38) with ESMTP
	id 6A267EDF00000BB8; Mon, 8 Jun 2026 16:35:46 +0800 (CST)
X-Sender: zhangyi@everest-semi.com
X-Auth-ID: zhangyi@everest-semi.com
Authentication-Results: sina.net;
	 spf=none smtp.mailfrom=zhangyi@everest-semi.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=zhangyi@everest-semi.com
X-SMAIL-MID: 8E193D818EC3496CA065561154769EE9
X-SMAIL-UIID: 8E193D818EC3496CA065561154769EE9-20260608-163546
From: Michael Zhang <zhangyi@everest-semi.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org,
	devicetree@vger.kernel.org
Cc: tiwai@suse.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Zhang Yi <zhangyi@everest-semi.com>
Subject: [PATCH v0 2/7] ASoC: codecs: ES8389: Fix the issue about mclk_src
Date: Mon,  8 Jun 2026 16:35:35 +0800
Message-Id: <20260608083540.12581-3-zhangyi@everest-semi.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260608083540.12581-1-zhangyi@everest-semi.com>
References: <20260608083540.12581-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

From: Zhang Yi <zhangyi@everest-semi.com>

Fix the issue with incorrect modifications to mclk_src

Signed-off-by: Zhang Yi <zhangyi@everest-semi.com>
---
 sound/soc/codecs/es8389.c | 2 +-
 sound/soc/codecs/es8389.h | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/es8389.c b/sound/soc/codecs/es8389.c
index 9c816491648c..638eb1f0462e 100644
--- a/sound/soc/codecs/es8389.c
+++ b/sound/soc/codecs/es8389.c
@@ -609,7 +609,7 @@ static int es8389_pcm_hw_params(struct snd_pcm_substream *substream,
 
 	if (es8389->mclk_src == ES8389_SCLK_PIN) {
 		regmap_update_bits(es8389->regmap, ES8389_MASTER_CLK,
-					ES8389_MCLK_SOURCE, es8389->mclk_src);
+					ES8389_MCLK_MASK, es8389->mclk_src);
 		es8389->sysclk = params_channels(params) * params_width(params) * params_rate(params);
 	}
 
diff --git a/sound/soc/codecs/es8389.h b/sound/soc/codecs/es8389.h
index d21e72f876a6..13ce241774dc 100644
--- a/sound/soc/codecs/es8389.h
+++ b/sound/soc/codecs/es8389.h
@@ -116,9 +116,10 @@
 #define ES8389_TDM_SLOT               (0x70 << 0)
 #define ES8389_TDM_SHIFT              4
 
-#define ES8389_MCLK_SOURCE            (1 << 6)
-#define ES8389_MCLK_PIN               (1 << 6)
-#define ES8389_SCLK_PIN               (0 << 6)
+#define ES8389_MCLK_MASK              (3 << 6)
+#define ES8389_MCLK_SOURCE            (0 << 6)
+#define ES8389_MCLK_PIN               (0 << 6)
+#define ES8389_SCLK_PIN               (1 << 6)
 
 /* ES8389_FMT */
 #define ES8389_S24_LE                 (0 << 5)
-- 
2.54.0.windows.1

