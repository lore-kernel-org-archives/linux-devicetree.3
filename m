Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BAD34AB00
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 16:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774627961; cv=none; b=XbzoS8lxxVo2cC5pU6WN/WAdRDf1LxOP26qblc9DRvM+m0GCOck6n83MNSVsoJEMKQRnyrxNvznl8W1v+CYwM0o6ogxyUHeONCIg8cYcZuUAekIo5Cuomk63r+ViDHsZYoyoeLLZHvGnzuCF/pgDjqr18/HeIrcQLBCKA/tYs4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774627961; c=relaxed/simple;
	bh=MNrAIbdMcQ69eUABsCEhZ1TvMsJSWiKNRpYtVmTWOy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RI9ovgdUGzML/FrdbIId7RMZX+sWIPiuxDSiILJiJNnfSLI2Kst5fJUeS0t0zUT3lGllGXHFgTh8mGjTmWoupTO6XXQ9lAmPXoBzyrL9LJ66cJh2BQtQGKFXj6brizhN2ahmKw/A4X1Ck+RgEQB/VI0/uOJsahzNWtDs6m7Xj5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yxkqqcFt; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yxkqqcFt"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-66b05026e82so3780315a12.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1774627957; x=1775232757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w2+QJfKRcmrV5A3/+Pu8IIk900YGksP7rXJkNHvnm5M=;
        b=yxkqqcFtkVnIE7yUtU9TeoTOn4a/BDIAqeE0eeysU5YmP3eAMs3pzVvQWA91+HlzJ4
         LO/xEATw0q4h9J53k3XsTDKVKd9WC/vvVvIvnPUkFfz6R6/5hyq67BvkHOOUxnBuvNvt
         LzFswgiNe5BJLKrj+BSiYthXwBkWnLfb4sO8wWiiBLOi381j9a16kcgQz7JZk3Kd8tOS
         Qjn5sW+Spt+J3PWBa0HbKTwYeexu9doECP9oCYIGOEe/44n5dtnYWTbCVKXsV5KTJy3W
         +0XMrSB/jRkSCsb0dJ9I+TtCX5nx4xi8y0iFXsV5tJMPwYhC134HDnVkgDskG0A80IO3
         uzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774627957; x=1775232757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w2+QJfKRcmrV5A3/+Pu8IIk900YGksP7rXJkNHvnm5M=;
        b=AK5eSHqkwxgpNYJwdb6OjnihwSTqsgHE2bNG4EnHipYc02e7utOrNgvtYuslGKuCIp
         I4FE1Yxcr7KB8gOAIFnN59H3eS6GCXy5akFr1zpao+9rVExu/D1bsafoR9k6vXJSb8OR
         qa0gah6gkxfDm676T/8hTQz4/hQHy2ujUfsqGTRgjmefCOW6EwTBsw6omSAhUAcSMa4T
         aCfx0lZr2glGGvJbtsUA6h+xlj3FAoIZ1R1oTRFxEjznf4t3HiW+bbeXKByX+pBmnMbK
         m2/ryeGDmK/0FF4KdiE9p7NnxnnE/Nyag38jxUVV6xzs0jdX7g5s0hMIncSgJoPLpdCl
         0Htw==
X-Forwarded-Encrypted: i=1; AJvYcCWlFXLMPEsxFz6ivjrEXqUDeHQ0HrKlzoSIjM1xf6ISMa5neimMrnVz0rFiD+s34dOJ7Xs3u+U0LUgB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1BMK7NCu2oXe63XjjOqHQECymVUW2meNKOJceiZsshp+957aN
	3kuBHrum6O0ykcEB/rHcr+l4Lx1JXDF6bTnCl1e3LwvtB7NsebZF1zzpA43pOkwdnJE=
X-Gm-Gg: ATEYQzw7zeg1nXXUSInKL7TtZIjaRsTKR+Tl9TNJX3bT4RNhOlk1/c6CQ/dx8l06bw1
	NfeZcWSMPXcclqTugMe/yuQDjAZTze9SHQNprOKBvPfGtMnA53jaU94VjzCEjHmC1dPwGeJ5gw+
	rjhkqvjB3a5/Vo3cBIpl5zF3hJVQM15r5wJOx6k4tZfBnBQvnyphD+CKJTvl1DMfvNCu4WZNHVE
	Z23DVIp4W2oZ4WlVnJIiTlGlkISrQnKqT+vspM7M+blxFb2oTclEJNQ3yQPFPKtpPsl1wCnpXBy
	TQaNnGTEZ3tIYprDxEUCex4Z1OaFI4EFI4LwPcuYFl/JCPxenKKBOnoiB2fQGxVJ6+HZ4voUQjI
	9twGdAMHwtb0SS4WrU5BxZxKOrHpgFNwiWJJNKDgW5R95AenAJwYZ0bGKY8IbPiwWo9JU7ODSiu
	h8OnXfZv160G/i+lo3t0Fl3cCYTg9dF7BctOqqW9tGXLuhzYVbPijavAoM2ATIS5QkqzsFrSFXr
	LZbATq6RCzO8tQo
X-Received: by 2002:a17:907:388b:b0:b98:4850:3b89 with SMTP id a640c23a62f3a-b9b508fb15bmr201044366b.37.1774627957321;
        Fri, 27 Mar 2026 09:12:37 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm273518366b.15.2026.03.27.09.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:12:37 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Mar 2026 17:12:25 +0100
Subject: [PATCH v2 6/9] drm/msm/dsi: add support for DSI-PHY on Milos
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-milos-mdss-v2-6-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Marek <jonathan@marek.ca>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774627949; l=2987;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=MNrAIbdMcQ69eUABsCEhZ1TvMsJSWiKNRpYtVmTWOy8=;
 b=5SR/5qTBYNIDCGL8cuTNXwvhzYkYevnNbG5tqBVj6DaWvC5VwQFqUBefrvK3PQwf37OLko88/
 49lWJuZx0jPD32kD0ipHchOJxdTUSFwUd9ONcju8pYJK36i70aOoZXK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add DSI PHY support for the Milos platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index c59375aaae19..1fb3899b88bf 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -571,6 +571,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_5nm_8350_cfgs },
 	{ .compatible = "qcom,sm8450-dsi-phy-5nm",
 	  .data = &dsi_phy_5nm_8450_cfgs },
+	{ .compatible = "qcom,milos-dsi-phy-4nm",
+	  .data = &dsi_phy_4nm_milos_cfgs },
 	{ .compatible = "qcom,sm8550-dsi-phy-4nm",
 	  .data = &dsi_phy_4nm_8550_cfgs },
 	{ .compatible = "qcom,sm8650-dsi-phy-4nm",
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index c01784ca38ed..21a59d66e8dc 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -61,6 +61,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8350_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8450_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_8775p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_4nm_milos_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8f4b03713f25..984a66085dfb 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1436,6 +1436,29 @@ const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs = {
 	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
 };
 
+const struct msm_dsi_phy_cfg dsi_phy_4nm_milos_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0xae95000 },
+	.num_dsi_phy = 1,
+	.quirks = DSI_PHY_7NM_QUIRK_V5_2,
+};
+
 const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs = {
 	.has_phy_lane = true,
 	.regulator_data = dsi_phy_7nm_98400uA_regulators,

-- 
2.53.0

