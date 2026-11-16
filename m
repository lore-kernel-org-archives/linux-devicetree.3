Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841844;
	b=xBbUaFaiVLn2V+6Ej2lmacm4r2tF6GlabNwB65mS4glIz/6BmD2BfgHN577fEeoC/SCN
	 nS+WjG72UR37kgQFBy5A1xqBcjPDf3LQjyPALrl2uHicEt2O0fJoZknZNQq21JiyiruMi
	 oVV/q0z84aNZy5I93N/+gmRvaBDsMz85/+Gc0pIp74xTVvxtIPBS9N6zGF7Skuz2MdaP3
	 IirAQD/AIxsoJJKn82v+bP8s960+OehJEv9Dagu7rD9o6qEAGifs+a7d7a3zdn2UPtBh5
	 0TymB4suXWmYM1kqpmAJbl6iJ90Y/wb/nKzYdmiDETpflEWht23yHMO4sOTj/Rmsl4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841844;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mbvLcy9HUv2G6MMG8rNmvtC6ROCR4D1d+RS6v72Z6yA=;
	b=oKgsKi1mNK7b8WAmFg8No3WiZEhr2G1UozIKzN3tldddJMapyIpP1lreWScyeCNahPmK
	 WOhGTSSwS2qfRQById2DiTOku930Sr/qyqsqJ27/kUTT+igy7DuxMfEAYJV5LlvaP6cdy
	 w1ZmcVT38f1N4oK6pKJTkrXrzWTn2XRSlIiZVA60rn+FCBKfUq5nTrpQe1wwJVyRM4LL5
	 UE3o8Q7NidqiYRdJqEmhZj7vrv7L12gZezIiCL/4WG8fl0P/b98qnT0yNPEdlgmSJXkPr
	 mVvaTn4G9Az+LEO0B4U7rYSDF4ua9wyqfC/HSK77OpPkj/599p1DrsAx5iUPZxjNRmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TFN8p1e/";
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEDB606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEEDB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TFN8p1e/
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50e26763a4so131544866b.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841842; x=1795446642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbvLcy9HUv2G6MMG8rNmvtC6ROCR4D1d+RS6v72Z6yA=;
        b=TFN8p1e/uSzKxrjcenNwkH1QG5fZ7s+9FWDCaDpCd6eWIWq7HTDxfuqFQuqLs4XrAl
         TE7DT6E+SExpy3/sDwNYKRzlo3ZaISXpZanItqvbsUFxn0hNX71BusAt1CDEmqQHZdnD
         RFm6e+XgA2WAe+OIn2dbVE3RHhF47VlpqXj4xatsl6nOJjf9csqCHT3Vu3nNSDdHQQ54
         YaGrQYjz4DQuQf8b2tgWOm4NJ+2wFbXbaS9aByDDs9NPF+47zIo/a1tvASJ++aaFpRXc
         3IFKGdcALDq0konLECwZIKh2OIXUVWkoK9k1P2tS8iDJGZs9DwmuFU6Bl9th1onY1hcM
         3gCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841842; x=1795446642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mbvLcy9HUv2G6MMG8rNmvtC6ROCR4D1d+RS6v72Z6yA=;
        b=czAh1g5R+iBkgL5jlFoQZm2D6Q/Tcax5QqWHqKB2OaDiPPw19iqrh7+5EyH3dNAHeJ
         b1OVtR3sQwY4J6F7gjUf9P8MQtOjDTyimKO634O1OkO6CtoWVkqePkyGGTh9U+9iUyxc
         A8stNkKrc1pKrB9eJ6C5knLEJfyHCwYhBrUQ5ggEqsz4krXS5BXEaG8Th12DJagdW5pk
         nPGnefUx06cSYaTDDsC9e4sJma4Vw/x2hS5gQzh5WY6/vc3/UFNzQatSjKLXLhY+khZL
         yvFnHv6xzFmpv0GvECzfqniVlelbSELwq3UFhmW2t7cOUByXjFHS9u2HsO8EZqVssces
         Flaw==
X-Forwarded-Encrypted: i=1; AL+hErFJyTNDRbgor+vMTYTQvphiEzKYzXoBI6c8JX2Ta+7U2Nhx0AoSFx4Y+xx9eFA22Y5Fd9e3+rjJELgp@vger.kernel.org
X-Gm-Message-State: APuU4Z+FHK8QqfhPpYWJjVlxYo3WTvkUGCooY/3DP2DVilEDtbxq/mZO
	UvXWmM12MlcxnLTiG74ft5C5Y9510w5YTysVacW5LLemk+zSPL+VA2Yb
X-Gm-Gg: AYBFou2O6EaJna0sL0rNlCH8fvJwfp0dy/p7EjQUeOiijbwZy+OjpavrXa7Izb4rUht
	vDne9kG7IVGshoL3FAr5DRy5kBXP2SfFQCzYAdAu0kv6dSoIR4cvDpcC0IQP+kixdKZaakYgC79
	f9PGBQ+QxlIcHN1dnG9dgVp8hO4vopO5fB+iP7PTOQNjLfTCCh4QmA95ZDrY1VQmCYxu+sUWQrL
	uV8LiKZ9/lypgDdv6Jsvib28Dg7r9TIrIKsT6SPf0983Dc9+izBFwLQ2piE9zmGvjc0KagO3F5a
	p/Y3dz7NBnI8UH9JOpiOItFT02t6BgshEy4GDDaN4EZCHb2qAoPIGA7zsr2qhqDmeeawaqr+bR6
	K4oVPAhfw5xi8sFD8lT/8SVDI6cVd/6XtONHXRusiwuSH55HQt6fzRvGOhTSNFB6xKv+qSpVN1u
	eTsv3N/s0V4lAQxrfOPVUG43JyjMzDGHjid2yA7NqTMQ5b606hxJu3VNuXat3GxO5oMNUWOE2qi
	R/MucgrFqGS1nNMa2g9iz01ifIgxGgcQJEVCClN4uL2yN4Svu9Ob9Xm0ElVrWExrghlglv8Tz4P
	JMhaiqvEu+zZidrSJHOmXPyzo2g/2cjKBdujZ3MLPCWOlJ7/w8h5E/l96KsMtuO3+hMar6Jut95
	v/uJfHaUTiZI=
X-Received: by 2002:a17:907:8686:b0:c40:b59:1b with SMTP id a640c23a62f3a-c5096389f41mr846550366b.44.1794841842225;
        Mon, 16 Nov 2026 07:10:42 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:41 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 05/12] drm/panel: panel-lg-lh400wv3: Drop redundant disable() operation
Date: Mon, 16 Nov 2026 17:10:10 +0200
Message-ID: <20261116151017.274764-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Squash the disable() and unprepare() functions, since there is no need for
host adjustments between them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
index 63efeb434be13..c6834e5312089 100644
--- a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
+++ b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
@@ -115,7 +115,7 @@ static int lg_lh400wv3_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int lg_lh400wv3_disable(struct drm_panel *panel)
+static int lg_lh400wv3_unprepare(struct drm_panel *panel)
 {
 	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
 
@@ -126,13 +126,6 @@ static int lg_lh400wv3_disable(struct drm_panel *panel)
 	panel_dbi_command(priv, 0xc1, 0x01);
 	usleep_range(10000, 11000);
 
-	return 0;
-}
-
-static int lg_lh400wv3_unprepare(struct drm_panel *panel)
-{
-	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(lg_lh400wv3_supplies), priv->supplies);
 
@@ -175,7 +168,6 @@ static int lg_lh400wv3_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs lg_lh400wv3_panel_funcs = {
 	.prepare = lg_lh400wv3_prepare,
 	.enable = lg_lh400wv3_enable,
-	.disable = lg_lh400wv3_disable,
 	.unprepare = lg_lh400wv3_unprepare,
 	.get_modes = lg_lh400wv3_get_modes,
 };
-- 
2.53.0

