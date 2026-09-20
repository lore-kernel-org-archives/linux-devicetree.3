Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09473CD8B8
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 04:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880148; cv=none; b=cVDywWtzhrDfjlf3SU1ZFg+uQ7QrMfBZLMYzqyQZRQIaPZ4fr+tkTJAKECIxGnTP/O3PmDCBoKOOhrNDw0sAroIn6uJem2opCoVluoGzKGwKLfmXuZBwnHaKpgCH9FIZ62RO7AkOSCM9FQkd6Xc4yEMZST1/o0Vj5r+G11G/8ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880148; c=relaxed/simple;
	bh=kMBkAaHfXaz58m08vArU+hc+2lbzFG3sRy/QCWibQdk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SgQbtFPwzFc43O5pb1WeSNJONd+JnjYZvMQWyO3ILin04/qOkI6Hwzg/DTYjOg8PAYSN7aRcRtWYj6/GhSc0+Fif4PjVGJ/UTXtVArzVWpKsD2VbVUP1/n27PNRs2+17fqF5PZTh6PBhKiPgWk/I0HqUUjLkojvtg8pghUwW1ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FI+a3251; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FI+a3251"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fbef5018so25454945ad.0
        for <devicetree@vger.kernel.org>; Sat, 19 Sep 2026 21:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880146; x=1790484946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAVOL9koiJ+YcQGa1QFT/np1LbpIAAvGvOBmeTVIdhA=;
        b=FI+a3251o47vrl9qhpBO9pRnUVmARw/dpGb6QXeAsUaxf8JWwC2U6py7UuzwTjKSpT
         8DneJxtc4/U5OGFg4ylGhVdrfcJzdnl+4rsSlnBpKvShj4qVnwbFy+uLlCj1C42TcZgP
         bfJKtAtA8d0+q4Lj5Ibkx07j04BwtRe+NV8vvYcVUC9YHNtRk2IDAWoTBAv/BPnf4O6X
         uWRMw9qaS/u4sdkmDNvIFOxtGtfqBgfNKHeVGeg2MuIUGa7yhUMxaYuCwOd+klSbsSCn
         NaepW2dklmjRRaPGspYfMPaGbzLAqvx9NNPY39rfS25i6jBt0enUDuZpamBvPK3+hkaa
         N8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880146; x=1790484946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SAVOL9koiJ+YcQGa1QFT/np1LbpIAAvGvOBmeTVIdhA=;
        b=ZcyJlfztyrqYqNkUUwko7S86ZEA/egSTmcknwcgPrC4qrhqin0TJa0dA9yxiNf4Edh
         2GxPc0Jt2+2GFWL48IVXhzY4RVUNe0FxDirNnOCN676G3oqykztCuQUFkP/z/ipI8f4A
         JJxM9QN3xYoiG+Qyva5I7MT94GEqhB+Y1BDnxmoo70tGTeaPTzDrA0KpToUVN6e4k7wp
         XoO4OHeZdH9QSo/922lx5pzo4VVspUzGV4AK/n6B/d1h+asemY93DWi/OBukDeggIHss
         a4BQeGP7MYH9cWGyNB2JLuFf//9kucUUIE9imvHsGOqsrvRpKTemVTOfvXxRrlBXRsph
         oVvg==
X-Forwarded-Encrypted: i=1; AKwUvBzNqAuVKzfNMN8IyVmkyEiuaBRWVxzp8DWtUHB78SbZGZRj3l/6QHL1g4ty1TCizgXIBI13NAlxzOKp@vger.kernel.org
X-Gm-Message-State: AFuF++kYV2rkjxveMzfLoAtkD2hxttw8H9+YDv2GCk6LeWV80jboUAUO
	SMXwB01Nxqis+surhNOfMHcgBTK4FVxqYglVm8UbXbkJa+Z10kyAzBvC
X-Gm-Gg: AYBFou1k3ewkWiryjly9708InlMSVyDjznRC5GTwu/6hAz8gfLKAoYegdw0ipuBrz0I
	saEjlcWr1zpAeHhQGryhL7bo2z8JTzLKuuX76G7xPD9MtVS3cu+bk4w45lVDgUG7u/z1Vh/BrX2
	bSokj+Jm91tFSR78DghEyJE/wXqbZtWZYc/KJbMf31AfdPNw7d3Ki1YLM/G+JpsV3pGWe7ipGpw
	I+mOS9ETuyamenvdb0r811gHOp1Tbxm9vFTPXU26yudit34RuLdjPeOTMRsF0BTwLIKmkENdNSu
	JM190iIk+2KimTQQRtc0+6oEDJ3xYTYe9/Ui8C2VSrH9KhUqATDUU0JrPKySoNc8xSx6vg2hxDh
	Aq/i1ULHDrGPDe/++mb0fv1oELdRBhOVDTIK9S5+w2Tfw+En4YxP4VfJuAwieoGZh6T1xTfNnyx
	T0uJ5vjuFqCiP+NVgWfsVAF55CDOmwJ2N6zn+SVhB6gToOPFVERVgYbtdlvT0tSojs8o6t8crUm
	PPPoWP6T3VfoBdfzAg6/IiIC5TLK5NRbl+iWpz47z1odYAAWNTbb1Gn+0kPt5UNBCih31Ep5Qhg
	7Pbr42Fns0E8AY/xJYs8cBZNxaiJnuDuPymxSlT+K2SMA/s3c4M29t1N/g==
X-Received: by 2002:a17:902:d4c6:b0:2dd:c100:3130 with SMTP id d9443c01a7336-2ddc100319amr56593615ad.44.1789880146239;
        Sat, 19 Sep 2026 21:55:46 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:55:45 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:43 +1000
Subject: [PATCH 04/28] ASoC: apple: mca: Fix PD link double-frees
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-4-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2173;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=l6ILyllDJHogvaPe0jQmA0G3c3totE6rg0ScLhCeibc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+U5j3Q8K1d7n3zG7LTOxmmXz5Q2XzaeunGxT7HUc
 45m1SaHjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GukY6xgxcHEKwFRPesTwT+HVJhMTvqn60VdsGRn0HgazSXQf/Jq76funXvH8tlWL1RgZWk4ftrd
 /oNc+ddnUN1O2mJZWhlTNltBy1Hz0+n246IQNHAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Add additional checks to ensure MCA PD links are not double freed.

Fixes: 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index be702b2942a5..66196c6a9273 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -303,6 +303,7 @@ static int mca_fe_enable_clocks(struct mca_cluster *cl)
 	 * the power state driver would error out on seeing the device
 	 * as clock-gated.
 	 */
+	WARN_ON(cl->pd_link);
 	cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 				      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 					      DL_FLAG_RPM_ACTIVE);
@@ -326,7 +327,11 @@ static void mca_fe_disable_clocks(struct mca_cluster *cl)
 	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN, 0);
 	mca_modify(cl, REG_STATUS, STATUS_MCLK_EN, 0);
 
-	device_link_del(cl->pd_link);
+	if (cl->pd_link) {
+		device_link_del(cl->pd_link);
+		cl->pd_link = NULL;
+	}
+
 	clk_disable_unprepare(cl->clk_parent);
 }
 
@@ -392,6 +397,7 @@ static int mca_fe_prepare(struct snd_pcm_substream *substream,
 	if (!cl->syncgen_in_use) {
 		int port = ffs(mca_fe_get_portmask(substream));
 
+		WARN_ON(cl->pd_link);
 		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
 					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 						DL_FLAG_RPM_ACTIVE);
@@ -423,8 +429,10 @@ static int mca_fe_hw_free(struct snd_pcm_substream *substream,
 		return 0;
 
 	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN, 0);
-	if (cl->pd_link)
+	if (cl->pd_link) {
 		device_link_del(cl->pd_link);
+		cl->pd_link = NULL;
+	}
 
 	return 0;
 }
@@ -1145,8 +1153,10 @@ static void apple_mca_release(struct mca_data *mca)
 			dev_pm_domain_detach(cl->pd_dev, true);
 	}
 
-	if (mca->pd_link)
+	if (mca->pd_link) {
 		device_link_del(mca->pd_link);
+		mca->pd_link = NULL;
+	}
 
 	if (!IS_ERR_OR_NULL(mca->pd_dev))
 		dev_pm_domain_detach(mca->pd_dev, true);

-- 
2.55.0

