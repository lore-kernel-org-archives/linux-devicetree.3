Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605993;
	b=Z1c3v2cke79FZKF2NWhrvd9YhPF9MWskwCClb7s3tzEQ9gC0q60jgRKDttOTiuwxF0am
	 ncRFf5M3U8xkBPKN8KlJYO7BihHbd7DQoLgn/WVgJvtSQyMqskMzyT/dDIwvPzVpMHVsU
	 dR7Y0fCvgYrVOyVOcAnO3uUJCWFwKlbGCKdl3QkKf1GS1GPjNgP3OquJJQb2IxRlquN//
	 vz5X1RzZkuEMcrHEMl0sA+7pym6VRJUy+BYi4nNk/kK31MEcX96soAq8FHoBOgR8sGixk
	 iMUJMUv4ZczRhL9RGOWAROVmm9eD/YboouONOQc8rX0wMd0Wdv6hWuChPWsMrIGiMzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605993;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
	b=VRbECcnmDsdddKqYj8UFpZUVKEM084p42DwclPB+m16tYZSlj2QYASlyUeueuuTyh3WT
	 eUr5K9vwWQgAFIOm5kiDvf12wSmRiTX4t4XU1bKOFp2FlY8vNkJruwhBYEassxGdpWkse
	 LxSyAe1ZuDZ+yyNCIiIxbueI7mQ41SouMuRqiOsGEoaJNWiK53t55ZH1SFdz3YDKrQfjx
	 lAYXuNJxDlZLVpNbt/PJ/3hx10Z+XZMlZqPYUjl7ifIfnYcPHeL9plTccxNl4OZMRwUUF
	 fFtTTMZiy1qELiijC2sHRkmrsLSCgwgAtueQomOujmenosl/WjO+TTs3ZWTW5i31p2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptHjGKmw;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1F5606A6B7
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 11:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D1F5606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ptHjGKmw
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b8a2518f7cso6604742a12.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 03:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605992; x=1796210792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
        b=ptHjGKmwfr/RLAGTM0/nWPiOARrnjjxlnXWjBYDz5gvePjmj/X0xVJSsS97aVEh996
         vlTAOWHsG9Ww6x8792xg0M7X5GIYfR6BnaKAtrdS32ulrQq+6t+Swszer1FImvPeqq36
         y4Xyb87/8SLnqDm3b+yVUh4N80TmVA9OU0pMX0Fxg5R5zlijNU71pAXeDyw037a6Q6dM
         95g+40hLWi2P/dGixwoR+kE5U6q15Nvj5t6C19t91fQa2l0rc3Ynozw/OiW0kJ6hB6cQ
         MiYoK3WH1/U4PHGSFZYtJ5KWrdA/eDeIVhiN8iI9MZMpKCQe5o79a/rvU07kI2FfiNkg
         HoUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605992; x=1796210792;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+V+MlFiMVbooH1RFDYNaob+l7nWjCw8PYj3aOGxI4TY=;
        b=2GEwyYLg1SRLrXc0riu82hdBD3NUHnj98ArUgDzh8oHfO5vr5BUrEnyVtaiZOQv1qE
         lqjiQ1+DRXrrteB1J9aV8siOMvsWZ4usZcJDYSPTUIWCQ47lBVsWvQk7z3WM+AjC9g0q
         zeEsMWbrMKeWDRQ6WO0lBDc5RtYNhwhxeqoKUSK0ZB7rWfLGtTdZRANv0uhFUi12s3kU
         3KzaHFYT9uVqR+H3IjrByxT+URqxLKgko0soX4Io70lXlAPefTd74OAcItq6aXj4mP/V
         yyvY1UCMsyaWVpIDVmTG3VoDyj65vfqB+8tXIOq+FbB7BYrcXP3O6b7u661BuRkLQAEh
         EkjQ==
X-Forwarded-Encrypted: i=1; AL+hErF/cvFceQNTthpn9udrJZZcFOpvnsK9DVNP4hHiammgy+n8LPv/z1polD7SlTCO4gJtyKoUXAMIbC2+@vger.kernel.org
X-Gm-Message-State: APuU4Z9I0hghVrbmH8IilOw42EWJJoBkSF8lHTosr9fdAColTZ0W07/Z
	bB2Mjylud3ZP8EhaYekLBOc61V6I0MN/NwHYZRqWsv5N0VD6ZaL0yAx/
X-Gm-Gg: AZFdTZcEdYSUY2q+z7Lh3/iuVcSX4zLciJ3A/po+S6Ke9wA23wX5DeeOcasPmyQ3ozS
	EiSs+zkp/w/wdR6nrYOJj+4aKjgWCWaB8FKIpFHZyaEMQ+80grZw5jqdVOxsybausKvy2KSLhDH
	UfPVG8hLfou53ILwLLy5pj+407Ojp6VLAM6HorKW3nKl6vThBtbk4ZNSC2npXwhHEE6sQDKj6oa
	+OG2N4kdBAU1bkqaZ9iRJL2+YBA88hmQujeoVF33w+YIuQAKpooxhXTJJwmhdXupa9SMS1HaalD
	JbDrQljhUDZUlQrR8S1AGYKD7GffrjgACDPvLO8UmnUqpa2czd7F4z4b0jG7+KXSdvw9AJzG8uY
	lBHWxjWfJbXK/lBiXN+SJoebr7lVu3/iRnRujyI+TVBAUY4E3FWZlVHTmSc32AFwghBR/4tuMcI
	yVdHFpagt2e2S2kLa1WU46xZN3m0LBWGT0RRT423iMwhIqTgNW+2jSgQqRAIFudlluF5mp5u7if
	8OgYY7771RpxFRMYQJJgvfgNZM+H1T161RdMOF7geuIwua4d7r7NeeikgxlZEdvJe9ohdAYFMBU
	J0ibb3rBwhpUsS+/wBiE31BmmYvuS7PQVe2ckolyxOvYrha+W2ukJRLEQVhJvgYXk0bJNbCvIah
	yvad9CdwUpQ==
X-Received: by 2002:a05:6402:3222:b0:6b2:2339:370d with SMTP id 4fb4d7f45d1cf-6ba37ec485cmr14832157a12.39.1795605991602;
        Wed, 25 Nov 2026 03:26:31 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:31 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 2/7] media: tegra-video: vi: Diverge Tegra20 and Tegra30 VI SoC descriptions
Date: Wed, 25 Nov 2026 13:26:08 +0200
Message-ID: <20261125112613.237333-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Further investigation shows that the current maximum VI clock rate is too
high for Tegra20 and is better suited for Tegra30. The correct clock
frequency for Tegra20 should be 150 MHz, as it was set prior to the
addition of Tegra30 VI support — a value backed up by the current Tegra20
peripheral OPP table. Tegra30 supports up to 470 MHz for the VI clock,
but this rate is available only on higher-end Tegra30 SoC variants. The
highest clock rate supported across all SoC variants is 300 MHz.

Diverge the Tegra20 and Tegra30 VI SoC descriptions to account for maximum VI
clock limits, setting 150 MHz for Tegra20 and 300 MHz for Tegra30.
Additionally, remove the APB_MISC workaround for Tegra30, as it is Tegra20
specific.

Fixes: 071fa83ded5e ("staging: media: tegra-video: tegra20: increase maximum VI clock frequency")
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../platform/nvidia/tegra-video/tegra20.c     | 22 ++++++++++++++++++-
 .../media/platform/nvidia/tegra-video/vi.c    |  5 ++++-
 .../media/platform/nvidia/tegra-video/vi.h    |  5 ++++-
 .../media/platform/nvidia/tegra-video/video.c |  3 ++-
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/tegra20.c b/drivers/media/platform/nvidia/tegra-video/tegra20.c
index f8d2b5e1b4131..c8a8fb3cbba0f 100644
--- a/drivers/media/platform/nvidia/tegra-video/tegra20.c
+++ b/drivers/media/platform/nvidia/tegra-video/tegra20.c
@@ -825,6 +825,15 @@ static const struct tegra_vi_ops tegra20_vi_ops = {
 	.vi_stop_streaming = tegra20_vi_stop_streaming,
 };
 
+static const struct tegra_vi_ops tegra30_vi_ops = {
+	.channel_host1x_syncpt_init = tegra20_channel_host1x_syncpt_init,
+	.channel_host1x_syncpt_free = tegra20_channel_host1x_syncpt_free,
+	.vi_fmt_align = tegra20_fmt_align,
+	.channel_queue_setup = tegra20_channel_queue_setup,
+	.vi_start_streaming = tegra20_vi_start_streaming,
+	.vi_stop_streaming = tegra20_vi_stop_streaming,
+};
+
 #define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, FOURCC)	\
 {									\
 	.img_dt		= TEGRA_IMAGE_DT_##DATA_TYPE,			\
@@ -868,7 +877,18 @@ const struct tegra_vi_soc tegra20_vi_soc = {
 	.ops = &tegra20_vi_ops,
 	.hw_revision = 1,
 	.vi_max_channels = 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
-	.vi_max_clk_hz = 450000000,
+	.vi_max_clk_hz = 150000000,
+	.has_h_v_flip = true,
+};
+
+const struct tegra_vi_soc tegra30_vi_soc = {
+	.video_formats = tegra20_video_formats,
+	.nformats = ARRAY_SIZE(tegra20_video_formats),
+	.default_video_format = &tegra20_video_formats[0],
+	.ops = &tegra30_vi_ops,
+	.hw_revision = 1,
+	.vi_max_channels = 2,
+	.vi_max_clk_hz = 300000000,
 	.has_h_v_flip = true,
 };
 
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 98411c3f4a037..52384af92d8a6 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -1408,9 +1408,12 @@ static void tegra_vi_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra_vi_of_id_table[] = {
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-vi",  .data = &tegra20_vi_soc },
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+	{ .compatible = "nvidia,tegra30-vi",  .data = &tegra30_vi_soc },
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-vi", .data = &tegra210_vi_soc },
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/vi.h b/drivers/media/platform/nvidia/tegra-video/vi.h
index 44893c5c6e651..965357ebaf0a3 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.h
+++ b/drivers/media/platform/nvidia/tegra-video/vi.h
@@ -291,9 +291,12 @@ struct tegra_video_format {
 	u32 fourcc;
 };
 
-#if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
+#if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 extern const struct tegra_vi_soc tegra20_vi_soc;
 #endif
+#if defined(CONFIG_ARCH_TEGRA_3x_SOC)
+extern const struct tegra_vi_soc tegra30_vi_soc;
+#endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 extern const struct tegra_vi_soc tegra210_vi_soc;
 #endif
diff --git a/drivers/media/platform/nvidia/tegra-video/video.c b/drivers/media/platform/nvidia/tegra-video/video.c
index 2e84385708bac..d483fb709d127 100644
--- a/drivers/media/platform/nvidia/tegra-video/video.c
+++ b/drivers/media/platform/nvidia/tegra-video/video.c
@@ -123,13 +123,14 @@ static void host1x_video_remove(struct host1x_device *dev)
 static const struct of_device_id host1x_video_subdevs[] = {
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC) || defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra20-vip", },
-	{ .compatible = "nvidia,tegra20-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_2x_SOC)
 	{ .compatible = "nvidia,tegra20-csi", },
+	{ .compatible = "nvidia,tegra20-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC)
 	{ .compatible = "nvidia,tegra30-csi", },
+	{ .compatible = "nvidia,tegra30-vi", },
 #endif
 #if defined(CONFIG_ARCH_TEGRA_210_SOC)
 	{ .compatible = "nvidia,tegra210-csi", },
-- 
2.53.0

