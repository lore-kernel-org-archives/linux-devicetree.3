Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790EC35A383
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777619741; cv=none; b=dEFHSw5WugQczl6l0hhUl5sbxgGEZWUoZStNuuAV/gnsJnby6OsFIcCEiOE8zOw30inY1/tYRq7i/eCqpo/+3LnddkufbYqljpDM8LCN4m5mdGr/tjeLAJseRZpoZh+qFmfFeq7/Sbsrimm4zJZcraJSvTze9LG7TKUYnHVQX0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777619741; c=relaxed/simple;
	bh=+OinyCwXS4Y2vYMDBUiIEDzwsNrg9k3i/PQu3jWxkfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ad7bz/ydwUKsC8W7n96UL5ErCFhVUNWKLv5HREEzMkaQ3qHjsURHgSVfWlATVrWx70AQd+WLhbOZjnPNO5YwnSHZejRhCvmZAqE6600taQd22ejwQ+0ofSU9UOl4Q6cQoVJEAx2ZgnIpfuk3KDGJ9mFZVFUWppHZRZiDfkf92PY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=ybt+hLTy; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="ybt+hLTy"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so16197125e9.0
        for <devicetree@vger.kernel.org>; Fri, 01 May 2026 00:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1777619735; x=1778224535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DcRaxEDDkb3JD3v/suj0HVGZb78w7Xi1M1DpP43HiY4=;
        b=ybt+hLTy3nA9dLJAnFQWM+tQ/HSgP95TwFDTB+/8ngaBlbLznTw1HFrWP7QiXSHjNp
         g0PR9yDXJ/RjGAw/1gIJpMoGY95AUJkhg1iLt8EsQQtBI/dQp7kHLQK3EYqViHj/nkfa
         zaBKTJbd58Dpjn0kTaVbwnSXMsjkcxmQ55VSvBv0hezPUiQ6X5DeF+dJa0142Jzt4wYu
         pupwU7iX8M1AdgUFZDfulu9b4fSFXxSBtIP+R1Y5EYtZDCUFDJwv3WnnOBNUfJ0CBjrX
         0PQ67u4OzSBGN5p0fhhsCFYeRsalKJsgkmDqKdBwDKKnCOC+/+UHDaxYOQZukaQEj5+7
         dhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777619735; x=1778224535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DcRaxEDDkb3JD3v/suj0HVGZb78w7Xi1M1DpP43HiY4=;
        b=AoLenCc2sT6s15Na2/etgZ9hkGhjcX2VbdxadVpW8YLNdkD/MX4bDkJ4o2CYJ4NN3+
         gYDKJbBD3r8gQT4JidPeAfVoqAYsNx941pSuZbx0Kb+Rz24mTSMUMoqUE6foeFnqiCX3
         fRgs7sgTZ9Z9b62471wJfiaNU3tUxbAPSAp2d/CbWLyg1H2ul8RqNjezWb13RlkYkWUe
         6fZiet6YYfBHhmqcFgy6gb5Fcle6pA4K3HPtTbFa9r3R8g7jrabBrvnWqgTR1tuJjJKa
         15ZyhocPDJinbixt19ObXWkccTB6BOXhNIUHGi/2mVa2cQEPCFT6W793d6KIaX6ZyK3B
         OXpw==
X-Forwarded-Encrypted: i=1; AFNElJ8tDLj6tTre3qGnror9C8R2fdpCZKtlqGmkx58+JrYJoZv+ybjDAIes1JOMolZ7Qc7JKzBhS1/xVcFZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn7iyd67rm2HF/n3tT0AMSDcIYiEa3pP7JZwzHWLDzxJwEaPQJ
	jyJIvhKD06RJnlNUY+Dv0HNaQgLeSenS6+h+Nz/5n3mICmQqZzqQ5YlLAsYQcfvdsXw=
X-Gm-Gg: AeBDiev/CWSvUhAiHM1sTobJ0poEpk5iPBLytNNk7owTal6ish/iWUKSQad7SS2t9lP
	1YS5CCmC/Av6QGW38j6QnlIvWRd6OUERNqpKt7+9d0g7dMLs9QmkCehI9lK6/B60iBk7Es1Qfhq
	ICDhUETkmJEglsUlnbd57uqBuAWbecqwE/zQsiO6gJ1OvnkKlxiqcnw+w8ZB1h4uAFf0kjEI7Zt
	qawGZV2Gy7NlJtIArxgERu0tg4CbvMc0SLayLvnjBNgBpSat5EsKXGQ2ZPLDYGxHjuJI1WckkHv
	bJNYGsgG4xUofcoAs/+ZwBr+Y4oMzJrMYQrQN/JkwCG4A0dsoeJpMj/P3oLQShx5qM09ZTm/hV4
	jRDbIaOfF9SisVPnZDfNUSuKYFMLlq9EIjxusSjgDr1Vi5PioQJ7p6tgB/mQj4nVz7jW3lNK2WE
	tm/mLAY37nfGYKU5mZGpuaF5p2DPzJch4wt/+aAZ+uvsOXFbMAPPQPJCLz1x2Hg8DgUR+M0V9yv
	mrwxCw42md/mTg53Yg=
X-Received: by 2002:a05:600c:c049:b0:48a:5546:61a1 with SMTP id 5b1f17b1804b1-48a844683edmr73734095e9.15.1777619735065;
        Fri, 01 May 2026 00:15:35 -0700 (PDT)
Received: from [192.168.178.36] (046124199213.public.t-mobile.at. [46.124.199.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eba8487sm29668085e9.11.2026.05.01.00.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 00:15:34 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 01 May 2026 09:14:48 +0200
Subject: [PATCH v3 6/9] drm/msm/dsi: add support for DSI-PHY on Milos
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-milos-mdss-v3-6-58bfc58c0e13@fairphone.com>
References: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
In-Reply-To: <20260501-milos-mdss-v3-0-58bfc58c0e13@fairphone.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777619720; l=2987;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=+OinyCwXS4Y2vYMDBUiIEDzwsNrg9k3i/PQu3jWxkfU=;
 b=SiQkl681uapJJ+uqBxGlRfO5q1AtnuHZPJC8JzrYe8Fk7kRLJyIsRWb0JSIR4rjf1Jv9SL4hj
 nPMtRiI/fR2DJlUQXHXfyEcjYDMgmdMJtNxhlZFToLqesXQZfRTZIrJ
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
2.54.0

