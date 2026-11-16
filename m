Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841840;
	b=DkF0vfKrV3MhU41Zd4rQ6oXX+2Ke68fdAX+MsdN9XY8GoFmX56POX5aZsPCZVcMktMhk
	 fc6MXI1MTbISYaRHyeNozdl+SvfxH47CY1LZSKxoG75Gi4nV4OL+rXbPal5FGry8U8aot
	 JssGk0cNCm5xEoHdzp6xG2WL0EbGXXhNZNcw6aiSRMJIodoOB2AHtQFS7s6MRxBR7rHKb
	 KIiz1+jODfx189fNhWDUNSI5Oajw3oaeRCWS78uG3aSJqqFyqQ8On4L/6+IoWw82gjeP4
	 iw/TNTp6YXcsdLN2AHNtymGgml65Ks5dV+NM5NHnfWnlc2Hpd1iYd7DwXD+mCIVJbnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HtudfLKjbr/2/c1OhhlQVNFuLuefvprrOWVYAN7fjDI=;
	b=CrLjW/xP6bIn6n9Sat2gDQIdoS50p9a6Js1zfM/CLp3f3+mslaozlbOw78OI7hOfp8VO
	 4UsBlzyg5G0Ox6cO7ittYrtnpMD94dcj6YmrPqVsa6L6atdBymwC5HYIGx3F6KfemDjGm
	 bLR0jG9/jDpNQGzeR7LDowtv7eidDJosFtZfKz/dXlqCfnyjclpU+nkOyqSkIZky5pKEe
	 Ip+60pv5PACirWg4ViwRAHF13GnzCKUluriXQX3+60K3cYD0Uowq2f3CvwmpqYGE8rT3l
	 UqL47caRH8cr5hib3FzPz/MgnLK1M7bfDJVWBkV9MpjeOdnCDiXswW5dEMTml/cKfsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqDnQ4ZJ;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB280606A885
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB280606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqDnQ4ZJ
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d28f75d62so705269566b.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841838; x=1795446638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HtudfLKjbr/2/c1OhhlQVNFuLuefvprrOWVYAN7fjDI=;
        b=mqDnQ4ZJ7zwYwP3nxgwnhXAcWGsxhZ565e08TvDBYxWTwGtag4ShjHfVvPPb+MTgvv
         QrFw2XAUHp/Tpp7lkczRLqwEtRmfMB85y3//HcE7VQNBXNNifzO9CO/ok7f88Sp4y7JM
         ueUN0lATdB7mG4PCnHvr6gZAI4Y++2n8kitfyIEdJft+4qpO3rag2JQugk+daMTtPAGj
         d74TMw1XH3j/k7btnmVLAL2TgWZL5kCme3KCX3YbYGj1h8E4Cb3UY66BpmtZLeebbWDn
         OGUBwKIp8pXHASL4AAcGhwXHmSSREqYk/P2Ql57B6FpNKowNylEKCE1adQKBmiXgpVrZ
         CcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841838; x=1795446638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HtudfLKjbr/2/c1OhhlQVNFuLuefvprrOWVYAN7fjDI=;
        b=KRZZ38JsqhPPd8UctzUlToGxg9QtNGTXnwI2xz1Wrm4C88ktDow7Rw/qtjvTA4xxo3
         bBL7Io2rMrydyl2hNHggID1DQmq2QdNHqLw24imc9cHE85RHZEakAuSaQ/f9gDSdrVHI
         PPMQHCsH82pu/cWl+1XwGjoEldR6o9e5lZ8BEUHsU9UCu85WN0sVvrMQkL+oyrHPWRu4
         6vLJoUnbDashLM7ShljrVD4kW5Qo0ZXdF1/nHQ3COFc2tKh5Alh81RklH5FSQIb8UdUK
         jwA/DuksajN0uMVkeCNyT3jVPU/94imTbxenIpw1gJQldeVZvjChPOcb6QMjRgTxBkue
         gBuQ==
X-Forwarded-Encrypted: i=1; AL+hErFFApNHpOupQ+81hUhyzDw4vj6fMAgo6d8KD/UWYseE0iFrPkIpAjkGpKkn0+EIXJHTjI4KZcxLlUUl@vger.kernel.org
X-Gm-Message-State: APuU4Z+akTqzei1TC829u+sXa9dUXV49cmgC98olxNTTCAe8zy1MqziE
	rNjhO1A9BTQRt5JTK2dMA8Fcovii7ZoJ8U/QS8/4lcnB7Cu4oBBfrvOn
X-Gm-Gg: AYBFou3TUEE/OtqLDzorYkyZg5Z3u0rL/bZujISZ7kZhqR2Yt/UxSIgX/8E2zok8+UJ
	+cbyeOylAaEURm0NpqDCGXU7KFZsvjrbvDNrP1zggIzosE5mgBAcv7etvyqqQvoQhNPLtzVE52P
	EYhhGMZAx+1YbhGkiSaViGlUkJpdSQ7SLgIbhz+O2j2A6FuMT4GpyXMGd6MV/U4husFHKLRnWz1
	zKYj7YZFj3Jhaa3vJkvwpUFLQdCN2/3ztxnPoYl6OWStpakvSexW7wSbO51l0wR9n1DXJ7syUUX
	UDHu2kDUHpblyUji60K7esTK1+FwWfEmpnnwRcWdF4IR4A344EWOyLZ6p7M4ouzowZ1h82lOnRz
	YUS1z5fnrL3TuaqU0F7r4ZvF4BkJSvx9lmutcFO5I+BwxGbhcn6psRBMXlhBvkqx6ZTyrBSQb/H
	59/BDnqxxWbibT8Ed1949RNFAV0A+Ij613FBJhYynH0ZbtKoHcR2jZLzd0m36LB3fYj2K/5OyOj
	uL2pcfj/WrgOY7GapcXrvij3EGBHETtCsXNA6JdgCpU/CIpKFN7DK0jU5hC9mqYTx/95OST+TVl
	oi9cMuPXLwmETB004LfNk4S0kswowu2/LGjVg4YMD7eMyUIGYXZwEVOLMQYD9ZLjtm5gig36Aoc
	sgW0hxJBxMw==
X-Received: by 2002:a17:907:3e10:b0:c26:19e3:e98d with SMTP id a640c23a62f3a-c50963fae20mr823362866b.45.1794841838314;
        Mon, 16 Nov 2026 07:10:38 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:37 -0800 (PST)
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
Subject: [PATCH v7 03/12] drm/panel: panel-hitachi-tx10d07vm0baa: Drop redundant disable() operation
Date: Mon, 16 Nov 2026 17:10:08 +0200
Message-ID: <20261116151017.274764-4-clamor95@gmail.com>
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
 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
index 318ece68b7806..153717ca6c90e 100644
--- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
+++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
@@ -177,7 +177,7 @@ static int hitachi_tx10d07vm0baa_enable(struct drm_panel *panel)
 	return 0;
 }
 
-static int hitachi_tx10d07vm0baa_disable(struct drm_panel *panel)
+static int hitachi_tx10d07vm0baa_unprepare(struct drm_panel *panel)
 {
 	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
 
@@ -187,13 +187,6 @@ static int hitachi_tx10d07vm0baa_disable(struct drm_panel *panel)
 	panel_dbi_command(priv, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(50);
 
-	return 0;
-}
-
-static int hitachi_tx10d07vm0baa_unprepare(struct drm_panel *panel)
-{
-	struct hitachi_tx10d07vm0baa *priv = to_hitachi_tx10d07vm0baa(panel);
-
 	gpiod_set_value_cansleep(priv->reset_gpio, 1);
 	regulator_bulk_disable(ARRAY_SIZE(hitachi_tx10d07vm0baa_supplies), priv->supplies);
 
@@ -236,7 +229,6 @@ static int hitachi_tx10d07vm0baa_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs hitachi_tx10d07vm0baa_panel_funcs = {
 	.prepare = hitachi_tx10d07vm0baa_prepare,
 	.enable = hitachi_tx10d07vm0baa_enable,
-	.disable = hitachi_tx10d07vm0baa_disable,
 	.unprepare = hitachi_tx10d07vm0baa_unprepare,
 	.get_modes = hitachi_tx10d07vm0baa_get_modes,
 };
-- 
2.53.0

