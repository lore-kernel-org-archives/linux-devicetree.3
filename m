Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335535;
	b=Ba/tWsQVsDpD3pJZSojgdVjcPAEK0lthtuPAEAM7c7f8cO4Y/j8Xd+1ORYtWXmnnqSkA
	 UHr1bt7DB2oB71fL3R2duMqqDgTaMBeHdzADlRuLvE+Uriv+W6rrkk2BU02mGCxnJBKa6
	 RQZvbKMg4+OwkVXGsAo3RSafZyCmTwaJKgJYSVq6K1g9ZN1ZnlWcrMGlsOwWGlvOxJvwD
	 xQro595m0Kj/6CUECFsCmqCBUUZTFjN+w+FxIDbzUh7oHg6hi1uOzxK9NGC3j9n89SCi2
	 FT6d4AT6AsDVIO1JTVygL5v3OA1dAWdrrVsRU0dnwEJxiLEgRUdubueWB1joK8Ns/Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AHE53nOdyArdfub2fhYvMnd7jTxi+4oRR0nTE2xoxZQ=;
	b=VbHVLcj6eWw6pVHd8z+BVlAkgeKMV1CSnXNAV0O3uFTXIlgMS2Byo1rxN6QIx1pOF4e5
	 vZHRZegpqP00DxdAy8/3WiStQJ8DGhM0Cf/itHdLYjxcxEUBXupVklI6Wv6NF8hKVmA9f
	 H6Y30cnR0z3QhN/7n8Y/PrZ60loNB+8Nk6F0WRlluA3ZtLfMS4HQDDlZtnfrdp2X+o9fz
	 Jikzo4iPvmnJ+lhC5RjQXfVD+NI8L/FVQYnfkZ9f0QmAZ2Bgefqm39kEfNyGXcFCLuBMH
	 l9wcahb/Jsc9Ymj940JZuq4/grdaF4eUN0lz+cH8+fTMKZg976oxDhQUl30aHITvddg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rRLESNLw;
	arc=none smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1168C606A332
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1168C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rRLESNLw
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so2825072a12.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335533; x=1795940333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AHE53nOdyArdfub2fhYvMnd7jTxi+4oRR0nTE2xoxZQ=;
        b=rRLESNLw+tkeDrCbI8lLRwfvOCD+Rh1FOk0HRpZ8GNrqRG82+9cWYAjuaeZ4T4TRNi
         VabL4nDJYIArJxTAaWE3fSD5eAT12E5X70SRk6ieGy3w27C9helXm27rME1SbHSfNtj+
         VviEc5ufEcHpid1tR9XW258IyVJiK8mIE0LFl7991ZO9LQKLlsu7IpE2O5Zzwc1xewSo
         3ZXp+abBE1gYSq6Cjpo8Cu/gdxSi9eTG5XngInAfRVApcv5TS7NbFKggpCk6McTm2g7v
         eeEZErN1s6taVAEZbHrQ74hgkyB54y+MfhAxHmF3HRI/B+9Z4LGV0+46NORJZT5kDTwd
         fC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335533; x=1795940333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHE53nOdyArdfub2fhYvMnd7jTxi+4oRR0nTE2xoxZQ=;
        b=lCMOjZCwNvKOjckdheLlPKyDJeI7znXe2HVey5DWzLsGYl5fd6VztuX8e/fSpNr9S0
         Khk5aN6vni6ps0bhkV3wvGATsErbNDsKoJc44PtseOR1EEZW8bo0k8NNnEEZxIWd8+Y6
         lW4xKhQp+R1tHFcBi/0ZGFgTxmCH4jybVAFMxR/PV/kkwfEE6YkFjch0SzRS56x46nFY
         EWm405FwFn9CpszFIs9SYW0o0BDcpA7+AxD2icx7wp1zRnH2itdV/zE0/J59mefDjbpU
         hf9SBWUjiqh8bfqFVZTH1tBSdWjfAG42qZJtEYCqScF7ooqKOBbSDzxXQg0kwNf68SYT
         bszA==
X-Forwarded-Encrypted: i=1; AL+hErFHR4aWkhIRcubVeGClFIh9+Rbcam70N7taI5ZeKYVEqDSjKFsvEYsKpw4XFXkZPDI8b7KPcww5UpBX@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZF6Dg97by5Qn5Uv1V7w9/paLM1iS1cReaZ3Y2t10j6AyPUo7a
	qDB7FcIDbn5EJoeXODFRLoD/RiVV9qfWm4AMpahkM/cdMyR6RU11sYoa
X-Gm-Gg: AZFdTZeoAzlCCO8vHGqVtsHJz81oL98UEdL5+RXNBGjKIaGHak+UfLnXNzf+qEgIqhH
	ubvx/ybIQXABNco8N76KTPyvpbaqv9R/KEGrm2IgBG5QesQh8Tbdij8LdeYzhq15abWY82TGutc
	S8O4ZVe5PA59J4XsjqfmZJx/lGj8ORtNiJxBxtPrWeZ/MUCe/X5HhdZsz49klKcIRSGb94t7zfa
	64gx9JxkPwgXvQqHAcO1qmbb0vYHymUfCOe8lzHZ5qJFALQEFQWhWNP0TXNcf7RgNCxdQJAVdKp
	MKS+JGMVd7ISpc/fyvK7WvqE8Nxog04XuIMH7yjDpvFvHqfAqlPjY/apRiGjvpt/pRTMttpVVta
	yflDtv37n0SmdcTfOFP1JnRtj/gERnGH+RaaMzpMawASmpXZXwEjQNQtsxzaYsEmc8bFMHdrHIE
	EF3N/TkSCwRlwkLy6KkDPG0Phxce3/2g/tkK/Tzj5MdLlX5MlPGxpKPFJEDOpr0bLBaPGMH33Pb
	+HBhfOMu+6InXQSR3JSAoPZmJVG15TLpp8WZZRsUhsyQTbB94fJBEpIZWirTZ0Qpmqd7hWI/9wk
	DtN3XK6dH4J9l/i4n4yfcy115hZ79PNRX1otRAxIKmJvbl8VCoY9APTKe0cEx5V+tWU4jRelLfM
	F34J8dAIVXg==
X-Received: by 2002:a05:6402:13d6:b0:6ba:a614:2fa9 with SMTP id 4fb4d7f45d1cf-6baa6145b92mr373973a12.24.1795335533285;
        Sun, 22 Nov 2026 00:18:53 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:51 -0800 (PST)
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
Subject: [PATCH v8 05/12] drm/panel: panel-lg-lh400wv3: Convert to mipi_dbi_write_seq_multi()
Date: Sun, 22 Nov 2026 10:18:13 +0200
Message-ID: <20261122081820.53199-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

Switch from the internal panel command-sending macro to a generic one to
improve code reuse.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 91 ++++++++++-------------
 1 file changed, 40 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
index 63efeb434be13..02150330f1735 100644
--- a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
+++ b/drivers/gpu/drm/panel/panel-lg-lh400wv3.c
@@ -37,19 +37,6 @@ static inline struct lg_lh400wv3 *to_lg_lh400wv3(struct drm_panel *panel)
 	return container_of(panel, struct lg_lh400wv3, panel);
 }
 
-#define panel_dbi_command(priv, cmd, seq...) \
-({ \
-	const u8 d[] = { seq }; \
-	struct drm_panel *panel = &(priv)->panel; \
-	struct mipi_dbi_device *dbidev = (priv)->dbidev; \
-	struct device *dev = panel->dev; \
-	int ret; \
-	ret = mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d)); \
-	if (ret) \
-		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret, cmd); \
-	ret; \
-})
-
 static int lg_lh400wv3_prepare(struct drm_panel *panel)
 {
 	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
@@ -76,57 +63,59 @@ static int lg_lh400wv3_prepare(struct drm_panel *panel)
 static int lg_lh400wv3_enable(struct drm_panel *panel)
 {
 	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
-
-	panel_dbi_command(priv, MIPI_DCS_EXIT_INVERT_MODE);
-	panel_dbi_command(priv, MIPI_DCS_SET_TEAR_ON);
-
-	panel_dbi_command(priv, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT |
-			  MIPI_DCS_PIXEL_FMT_24BIT << 4);
-
-	panel_dbi_command(priv, 0xb2, 0x00, 0xc8);
-	panel_dbi_command(priv, 0xb3, 0x00);
-	panel_dbi_command(priv, 0xb4, 0x04);
-	panel_dbi_command(priv, 0xb5, 0x42, 0x10, 0x10, 0x00, 0x20);
-	panel_dbi_command(priv, 0xb6, 0x0b, 0x0f, 0x3c, 0x13, 0x13, 0xe8);
-	panel_dbi_command(priv, 0xb7, 0x4c, 0x06, 0x0c, 0x00, 0x00);
-
-	panel_dbi_command(priv, 0xc0, 0x01, 0x11);
-	panel_dbi_command(priv, 0xc3, 0x07, 0x03, 0x04, 0x04, 0x04);
-	panel_dbi_command(priv, 0xc4, 0x12, 0x24, 0x18, 0x18, 0x02, 0x49);
-	panel_dbi_command(priv, 0xc5, 0x65);
-	panel_dbi_command(priv, 0xc6, 0x41, 0x63);
-
-	panel_dbi_command(priv, 0xd0, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
-	panel_dbi_command(priv, 0xd1, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
-	panel_dbi_command(priv, 0xd2, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
-	panel_dbi_command(priv, 0xd3, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
-	panel_dbi_command(priv, 0xd4, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
-	panel_dbi_command(priv, 0xd5, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
-
-	panel_dbi_command(priv, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, 0x00, 0x01, 0xdf);
-	panel_dbi_command(priv, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, 0x00, 0x03, 0x1f);
-
-	panel_dbi_command(priv, MIPI_DCS_EXIT_SLEEP_MODE);
+	struct mipi_dbi_multi_context ctx = { .dbidev = priv->dbidev };
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_EXIT_INVERT_MODE);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_TEAR_ON);
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_24BIT |
+				 MIPI_DCS_PIXEL_FMT_24BIT << 4);
+
+	mipi_dbi_write_seq_multi(&ctx, 0xb2, 0x00, 0xc8);
+	mipi_dbi_write_seq_multi(&ctx, 0xb3, 0x00);
+	mipi_dbi_write_seq_multi(&ctx, 0xb4, 0x04);
+	mipi_dbi_write_seq_multi(&ctx, 0xb5, 0x42, 0x10, 0x10, 0x00, 0x20);
+	mipi_dbi_write_seq_multi(&ctx, 0xb6, 0x0b, 0x0f, 0x3c, 0x13, 0x13, 0xe8);
+	mipi_dbi_write_seq_multi(&ctx, 0xb7, 0x4c, 0x06, 0x0c, 0x00, 0x00);
+
+	mipi_dbi_write_seq_multi(&ctx, 0xc0, 0x01, 0x11);
+	mipi_dbi_write_seq_multi(&ctx, 0xc3, 0x07, 0x03, 0x04, 0x04, 0x04);
+	mipi_dbi_write_seq_multi(&ctx, 0xc4, 0x12, 0x24, 0x18, 0x18, 0x02, 0x49);
+	mipi_dbi_write_seq_multi(&ctx, 0xc5, 0x65);
+	mipi_dbi_write_seq_multi(&ctx, 0xc6, 0x41, 0x63);
+
+	mipi_dbi_write_seq_multi(&ctx, 0xd0, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
+	mipi_dbi_write_seq_multi(&ctx, 0xd1, 0x00, 0x46, 0x74, 0x32, 0x1d, 0x03, 0x51, 0x15, 0x04);
+	mipi_dbi_write_seq_multi(&ctx, 0xd2, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
+	mipi_dbi_write_seq_multi(&ctx, 0xd3, 0x00, 0x46, 0x74, 0x32, 0x1f, 0x03, 0x51, 0x15, 0x04);
+	mipi_dbi_write_seq_multi(&ctx, 0xd4, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
+	mipi_dbi_write_seq_multi(&ctx, 0xd5, 0x01, 0x46, 0x74, 0x25, 0x00, 0x03, 0x51, 0x15, 0x04);
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_COLUMN_ADDRESS, 0x00, 0x00, 0x01, 0xdf);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_PAGE_ADDRESS, 0x00, 0x00, 0x03, 0x1f);
+
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_EXIT_SLEEP_MODE);
 	msleep(120);
 
-	panel_dbi_command(priv, MIPI_DCS_WRITE_MEMORY_START);
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_ON);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_WRITE_MEMORY_START);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_ON);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int lg_lh400wv3_disable(struct drm_panel *panel)
 {
 	struct lg_lh400wv3 *priv = to_lg_lh400wv3(panel);
+	struct mipi_dbi_multi_context ctx = { .dbidev = priv->dbidev };
 
-	panel_dbi_command(priv, MIPI_DCS_SET_DISPLAY_OFF);
-	panel_dbi_command(priv, MIPI_DCS_ENTER_SLEEP_MODE);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_SET_DISPLAY_OFF);
+	mipi_dbi_write_seq_multi(&ctx, MIPI_DCS_ENTER_SLEEP_MODE);
 	msleep(150);
 
-	panel_dbi_command(priv, 0xc1, 0x01);
+	mipi_dbi_write_seq_multi(&ctx, 0xc1, 0x01);
 	usleep_range(10000, 11000);
 
-	return 0;
+	return ctx.accum_err;
 }
 
 static int lg_lh400wv3_unprepare(struct drm_panel *panel)
-- 
2.53.0

