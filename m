Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E314973BE
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 11:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791633376; cv=none; b=cHMYvdwCOimGkRTRbkcZo+6Bk9tVBVGJJq/hN1E6fWr4DbpEviqOJmXCp08/kE/MFbNyMMj5w0FNH1Sxd6rqaVQ3P6O8ixm0FbLISK+IyFwRYjQm5D4/OYBqvnvJRW3zDBZUU4BjoZWzD3QC6QgrpuMMG1Oc23kUYAGbYnsrA9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791633376; c=relaxed/simple;
	bh=FsWmx/ObrGOwpry4gMTdMfUvKRBXwQpqujcqAmfgbec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eSNduZs7RZjhrSg37XNwNMWNGLYPz9JqzrCJJATRoWW1TjI2B1YxdddEjVIMvrvK+1vfkbgr/M1TEOy0oCuf9nesMYOddJmtC9hkmga5YT7GChH7VIgPIclq1QKWYl/yS6OwsPo0wJfnF+ncIEsREJgLF4jACWHPXNKcdXBlxi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oyOOqCeH; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oyOOqCeH"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a172eb31f0so4073315e9.1
        for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 04:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791633373; x=1792238173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qd6y2NiBciAjRKr5ndbJ7uSamNBWAtmvHRlzXouwwJA=;
        b=oyOOqCeHYt2nT2ehy6mS9StH0zpUWaT2SvYbcrfvAXtfRtW5MDgUJF9yTovZ1o5nKu
         fDbWqh5wGIk/ReEqi3R+3T8pJ0YyX6LBw26+UZE8Mlp95TmSxiPKTgzyMm28AzCK93wD
         d6WCZH31PG/9vvvg47RBM8KJ9uGUzv2W1Jxpxb8blOm1KMS5eLnL6DnhnP1RH9Fx9cet
         DUUVpA5z/+1HWvz8yRLVigM1JFK77RZghtEXllqkPjNwZkycsgl+OyAroMUR/U8c91fv
         94LIzYusyjpLEeWs6aMrzUNtawZ4WI4n3ttfQe8R0TNpv3UWGUpuAkcBsJWWhwOnlyvR
         kvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791633373; x=1792238173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Qd6y2NiBciAjRKr5ndbJ7uSamNBWAtmvHRlzXouwwJA=;
        b=PxpZrqb4RY5qAf3ZTZRXsomes/cKdUMxZPjEdECazWjkrOoZ4pAgtZo5kD2RF6Ubrr
         XhWCAQhBubL9kH++Vb7KxrlJ6ElXMI6a03LvPMBWGIEuMgyMvbdrA/unroNS+tu6ccKx
         kDn+mindsEvgRndf+WheZwlPVo7LmXnkGJRX3RBbEyD2tJAYpqNP3pT26DmwkFbUvVdE
         oaSFpDcuIQCHXnrccuvHCyv1+SKnF3Fcx1m7+d3oictK1PcaZGkx9exywwrMWmn/0TPa
         7Y9kPfSY4kFhWAX2+6VauFhsH36ARyrK1hMUe2ILNEcUkNvbmzNlNsyNgN2P+GPkDgMx
         SxoA==
X-Forwarded-Encrypted: i=1; AKwUvBx7/8tWMJcYRC++CxTw0zRM4zx5pZhKfEPAN2BepMcxZR9iabocMZAo5637LakvZW+jKDtqoQwk+zbv@vger.kernel.org
X-Gm-Message-State: AFq9FYJcLBeuW8qkRqhaQiusKFAwA5Zh8QiJgtPySxKgA2iLl7JfvDGo
	j2tNd4jFY3t8v+dlhWMcHsZ53xJeLmeZSwyVJlX2ENqbeprhs1FBWUdS
X-Gm-Gg: AYBFou3TJ812hKOyRre3ztztksdWsbLAtRqIdto7qTpbBZ5xaQs4h2PyBYID+6Ifv16
	6MM3ggz+AdXJ3/STA2D1C+Q68ShVPP6kmiy3niOWDrUpqnjrGzyGlu8jscxw0xrois2RRDDun1l
	Zn5ksFCBrDCIn2Tnk1r+UcrsYLuFWIjS2lPJsZSUnu0JoevmCEM0lAzsHbg71MaLRXmXCxcIQr2
	Hq/RLX0U+E+CcL0FJCx9pw30Qt25V4KGu7cnVjuomPfdoqpm1t00pUkoQpt1cc3IBUQlIGj9/b/
	ljOFlTbo3zf8camCcOXFiNRhgOwZ7xcAV+l/wkDOrBg4yWTQLP0ouaO1TnQ6aHWgjnjrulHTaul
	ShqZ7oI+wFDvxKyuurN6elOpUDGJ0e4Hdg4ijvaZgLiNic21b9UnVFea74pnl3/GpZlox/vUVGG
	otWflJ1zQ02krM//9gaoAi68eSl38dVlWfIHFt3vM89lmT3Ta/mO+X0wazp5fJcO9JBg==
X-Received: by 2002:a05:600c:6749:b0:4a0:1a7f:2abf with SMTP id 5b1f17b1804b1-4a18e49d633mr79294265e9.7.1791633373147;
        Sat, 10 Oct 2026 04:56:13 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aca657sm8746340f8f.43.2026.10.10.04.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 04:56:12 -0700 (PDT)
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
Subject: [PATCH 6/7] drm/mediatek: mtk_hdmi: Improve the secure output bit toggle
Date: Sat, 10 Oct 2026 13:54:06 +0200
Message-ID: <20261010115539.9237-7-l.scorcia@gmail.com>
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

The secure output control bit toggle for mt2701/mt8167 currently sets
bit 0 (DEEP_COLOR_EN), 1-2 (DEEP_COLOR_MODE), 15 (HDMI_PSECUR_EN) and 31
(HDMI_PCLK_FREE_RUN_EN) in the same operation, but only bit 15 is actually
controlling the HDMI_PSECUR_EN bit, the rest of them are already being set
in separate operations later. Add a define for bit 15 and clean up the bit
update operation.

Fixes: 0fc721b2968e ("drm/mediatek: add hdmi driver for MT2701 and MT7623")
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c      | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_regs.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 9896eaf81e7e..781177a1f190 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -63,7 +63,7 @@ static void mtk_hdmi_hw_make_reg_writable(struct mtk_hdmi *hdmi, bool enable)
 	if (hdmi->conf && hdmi->conf->tz_disabled)
 		regmap_update_bits(hdmi->sys_regmap,
 				   hdmi->sys_offset + HDMI_SYS_CFG20,
-				   0x80008005, enable ? 0x80000005 : 0x8000);
+				   HDMI_PSECUR_EN, enable ? 0 : HDMI_PSECUR_EN);
 	else
 		arm_smccc_smc(MTK_SIP_SET_AUTHORIZED_SECURE_REG, 0x14000904,
 			      0x80000000, 0, 0, 0, 0, 0, &res);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
index 2050ba45b23a..e0c35277c553 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
@@ -219,6 +219,7 @@
 #define DEEP_COLOR_EN			BIT(0)
 #define HDMI_AUDIO_TEST_SEL		BIT(8)
 #define HDMI2P0_EN			BIT(11)
+#define HDMI_PSECUR_EN			BIT(15)
 #define HDMI_OUT_FIFO_EN		BIT(16)
 #define HDMI_OUT_FIFO_CLK_INV		BIT(17)
 #define MHL_MODE_ON			BIT(28)
-- 
2.43.0

