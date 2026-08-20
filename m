Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 981C5448397
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787234490; cv=none; b=L+QS84VwEkjYUsedW9+nMnh99SYWlSDVQLzd7M89JtQ93Dj/DekDxLNoksteFgTouaoCLLFSLUxTZa4GTSI32ccdcSvjHJ90G4DQjJqQqBd5vYJLrH6jUEedCsqm1cxceP4G2jqUsO7l2PeaJ9QTaY+ScadlL3WOoNte+ioos/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787234490; c=relaxed/simple;
	bh=+wQnLUS1bzjWsYlZ2cICJ1ntSL4y9AaqokE1Tn/QJfw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R2M0NDQKfTKU/zvl/xbaKYuAgLgrR8GQbsmJ+eVXacSsWeljRG75A1Vpfh9i7xj9aXqJrwI1AkRkSfByCfNONPeCvslOuDhgCB4EhI0oqpTpKYgDZiOmig0d5gE8t3aAV241SbaZK5/rcpd3+j992u/JD+I72O5Eb1nUhJNrw2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZgot0mj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZgot0mj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso8665605e9.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787234487; x=1787839287; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjaxkW/OOljfbKs/Hgq4W4DJoOyPrHgU6kH9d26E7Bc=;
        b=PZgot0mj1u9yDmWLCnPfxb4OCAqaL9kbNg52FMasmFXXOw7gV4RWDJvX4h0X5fqlWK
         wRzFeiuvk2/NSpH+XKhyyJMWQng0yxjWDtcnDULMw4pqDEpMfSUzPOkK4WbV3/PtJpvc
         ubGGcPwvkGEJhdjNSR2BJ3dXzgF+e3rgatlqCxX3JCpquXae2GkL7NsvjT2t9bjBp5Ig
         rKxQ0oXdarNrcMuP4GxJciSzv6Z4Qg61mhLiRvcZNoPibg3JcXdhwk0LjW7xb4wsShX6
         CGggQtA8anptPBCdtg3OMWLJv87B4Ob6UpOyOjSNWHe7M6o4SDZszsSOngS2hjEp7z+5
         4rzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787234487; x=1787839287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjaxkW/OOljfbKs/Hgq4W4DJoOyPrHgU6kH9d26E7Bc=;
        b=dPNbnpP1HJ9BtUveyokQq5m0mnfnyy74J2Gvt01vaHXmFqEYJZDn+D5i513cU8nrg5
         uMraGthh4tMkJCaJ0HSz/H+tChoJCJ2OlV7cKikaxWlXE4x3BhSH9fD2xRyxEFw+aei4
         WxuBEWsqGwB5JcwmaHROGuqiODnBO53OolkZ11tgxTXHLl/FM1ySj0nEzCtLO0vVO0U8
         OchIP52nspSM12ScvOfEblAE0kEzjD90ugLBfpdR411HiRQl42NV+C08FvPNdG0oo1n8
         GrsmTqcuFe5EhqPH5AEE4wpcNqO4vGVPMAdgF62dx32l42a33xd3It+EevRaAZnOKQP3
         TfMw==
X-Forwarded-Encrypted: i=1; AHgh+RqE/GXKDqTdtxCxxzNvGd/0B6+CnMJgOByFzIAf9rmPlbjHBe9QBYqgY9zTFCZ/qBQ5he/NNS2cxtYZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzxUa/9zI1giqOVY0yvZdyHyRZ87WOJmGiRMW24ClCH9nRwwLMy
	we13Q+U0AClxsoiC3q2/BL1LeF4zepvg2ryvcMacT7AtGVAqg06eUAMr
X-Gm-Gg: AR+sD124RAs3Z5kW8A4mLxHv14rAo6CjG7ch0bKirbhMjosdtyT4ktmkDrcB2OosFMn
	DTV2++/GSPorWd9kcc3b5OHNkn3YNVojY388hBzGKjoRbVtuYalpghevbQ1xZfb3CkfeNQMhZiv
	C5AEez7JNMsfM0y7zWoRz8BWcWNSjoWcecdrz2AcG7AcbDaixApB/15VTh5Ti2z+xBSDsku0dlG
	c/KLc4GUwY33KxAnU5mSG2M8/5Pfa31NKzzW6oBOi9c2qVJ0dYyzwOUkr3kKZmf6TXCviwPxvaX
	E9dXRktb2sRM2yWlWHwLMydn+uoAn2GZW7PjNZGMcGuPySGssEaKWbU7MGW8JS5hVDnRn3SRRdd
	GDBj7s9e/Bg6qxIhvaUhI7MBnio9zC7JMQjjxVHQ5zos0AruTR0BeIKcY8YivMSmsMxolnuZUYK
	i0mEr1le72FRPpzM08iH/dsYdygNHQmIjsP5zoDgP0hT8cGbnDGbwIX2yG/qzhAY4Ae4UlE5q5G
	TH4m6QGHKtVtnjAj1FPcXf6Q5hktCLH5iPB5Lw92COcqpKv0qD5hYfOCg==
X-Received: by 2002:a05:600c:810a:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-499b06a5900mr69779915e9.1.1787234484906;
        Thu, 20 Aug 2026 07:01:24 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0e473dsm137978275e9.15.2026.08.20.07.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:01:24 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Thu, 20 Aug 2026 16:01:10 +0200
Subject: [PATCH 3/4] phy: rockchip: phy-rockchip-inno-csidphy: add support
 for rk3576 variant
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260820-rk3576-dphy-v1-3-70e25e8d5e78@gmail.com>
References: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
In-Reply-To: <20260820-rk3576-dphy-v1-0-70e25e8d5e78@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787234481; l=2615;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=+wQnLUS1bzjWsYlZ2cICJ1ntSL4y9AaqokE1Tn/QJfw=;
 b=XRv4bYGUPy5NgXnknSaQfkAZF50U/hL3221UfrFWTjnlCf2d2GcHd/mP7Ahg+k/FZpJiTdbn1
 BCk8pOhvhK4CWsuTIuMT1WMnZ+fZOwGi0nmY4Yq5JBX+pTCoh8PJt+o
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=

The two RK3576 MIPI CSI-2 DPHYs can be supported using the existing
phy-rockchip-inno-csidphy driver, the notable difference with the
RK3588 variant being that each PHY instance only has an APB reset
line.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/phy/rockchip/phy-rockchip-inno-csidphy.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
index c79fb53d8ee5..24aefdcd6361 100644
--- a/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-inno-csidphy.c
@@ -30,6 +30,7 @@
 #define RK3568_GRF_VI_CON0		0x0340
 #define RK3568_GRF_VI_CON1		0x0344
 
+#define RK3576_CSIDPHY_GRF_CON0		0x0000
 #define RK3588_CSIDPHY_GRF_CON0		0x0000
 
 /* PHY */
@@ -119,6 +120,12 @@ static const struct dphy_reg rk3568_grf_dphy_regs[] = {
 	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3568_GRF_VI_CON0, 1, 8),
 };
 
+static const struct dphy_reg rk3576_grf_dphy_regs[] = {
+	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 4, 0),
+	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 4, 4),
+	[GRF_DPHY_CSIPHY_CLKLANE_EN] = PHY_REG(RK3576_CSIDPHY_GRF_CON0, 1, 8),
+};
+
 static const struct dphy_reg rk3588_grf_dphy_regs[] = {
 	[GRF_DPHY_CSIPHY_FORCERXMODE] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 0),
 	[GRF_DPHY_CSIPHY_DATALANE_EN] = PHY_REG(RK3588_CSIDPHY_GRF_CON0, 4, 4),
@@ -403,6 +410,17 @@ static const struct dphy_drv_data rk3568_mipidphy_drv_data = {
 	.resets_num = ARRAY_SIZE(rk3368_reset_names),
 };
 
+static const struct dphy_drv_data rk3576_mipidphy_drv_data = {
+	.pwrctl_offset = -1,
+	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
+	.calib_offset = RK3568_CSIDPHY_CLK_CALIB_EN,
+	.hsfreq_ranges = rk1808_mipidphy_hsfreq_ranges,
+	.num_hsfreq_ranges = ARRAY_SIZE(rk1808_mipidphy_hsfreq_ranges),
+	.grf_regs = rk3576_grf_dphy_regs,
+	.resets = rk3368_reset_names,
+	.resets_num = ARRAY_SIZE(rk3368_reset_names),
+};
+
 static const struct dphy_drv_data rk3588_mipidphy_drv_data = {
 	.pwrctl_offset = -1,
 	.ths_settle_offset = RK3568_CSIDPHY_CLK_WR_THS_SETTLE,
@@ -435,6 +453,10 @@ static const struct of_device_id rockchip_inno_csidphy_match_id[] = {
 		.compatible = "rockchip,rk3568-csi-dphy",
 		.data = &rk3568_mipidphy_drv_data,
 	},
+	{
+		.compatible = "rockchip,rk3576-csi-dphy",
+		.data = &rk3576_mipidphy_drv_data,
+	},
 	{
 		.compatible = "rockchip,rk3588-csi-dphy",
 		.data = &rk3588_mipidphy_drv_data,

-- 
2.43.0

