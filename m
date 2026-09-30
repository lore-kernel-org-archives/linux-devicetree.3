Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DD33B42C4
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 07:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751963; cv=none; b=uof1kMJS9AmD2GM+yhwLMol1DivdeOssZFQ74XYCHeRKHHYXmUUoE9WYflKA9v0qe0oergLwN4Ydv+o3T5ExomHgoP/e7WO9lf8VOdx6hE2G5nui00hML1izrieHWqYknzMcACiDqAS1gMig3rJDD5HKhtpg5rtjvSR/85xtL9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751963; c=relaxed/simple;
	bh=JJGLHM3hPZ+UMs4RGoCV5Erf8UQ5+s0zcBkra5RR7XA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxFd82ZBmRpcF22yJHaboqSr0dhNqY6zBtnCqKKl41sW65s2sFlNAEV0ToldWdKqehOFdAa8EWPY0XNXEmQkZbMgoFRwUma24Tv3VgfzJSYEUrIXCumFptizyI0zKdXhGlBve1R8PakIr6jXj/Q6nu84El3J6f5tBBIUdwnAlbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H7EDd9Dn; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H7EDd9Dn"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso2562177f8f.2
        for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790751957; x=1791356757; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u+ufq/9OYpFWz0jYyxkMsrt/5JaGVR8WMolNjJI/6Zo=;
        b=H7EDd9DnT1UkPvL+3ZSD8yrw73RkLRA1mAExBnr5oFYDk/jFShGatpvuKqRyDX5nAq
         fzBc+DUX1ptIggMoxOJrI1ea3c+vzindDHnART6Pzo3S408l5LJrW9OMmniVG/hR6cPk
         KkZ2l9C2+xRpFxInaCe53tdLwAndCXsZdG7mZFRiZoHdh/ImoepXPF18Clwum1voS70H
         reM6ln/JgP4Jt1JMEE6YqZfb0/W1zZydc1cSlLxvdKmlvJkX5n3SnlDO39hu0ioslcTP
         GFeght9IBTDfr3/Id3lgZhomKGvm7yA5X86vqMr62Il6/B4i1QgLEvTR/q3iFZ1Jf3iz
         z94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790751957; x=1791356757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u+ufq/9OYpFWz0jYyxkMsrt/5JaGVR8WMolNjJI/6Zo=;
        b=U/eTdTp6viybc6G+N5Hq5ChKKDGgkS7/klw6xQpaOHQBj45Ub9FTCIi07C4ezWa2eN
         cXAEnjh8N0gUYehf/jJzQgQLL7gHWAlP5vH3QWBftXstNArWOBUnf9GzV/KcfgYi5TnF
         mVK1vp0Nb6Vylv+bCYCGc+fqglE9XdoQqaiDcb/DbZpWQFy7Vc5zOaFIcnqKlk9LGPtZ
         wV56vErAFTnDj6vKU/jniz4yHkxlWiUQYswXl2ZLObnrenT0dI6SluDZreIPCrZpvs83
         fEW5TLvDcNClMyVHFPhZWdV4HyEIbIGJ4uc0oQBq3fsRxbkc2shJgWbIa/KHimpgbtc0
         5b4w==
X-Forwarded-Encrypted: i=1; AKwUvBz3C7S1u2fr9+3d8GOFExVxMbgzM0Az6+sas2yE4jLKFGa4Ww21UQYABqBUQ1taB7bmVdeLlNWXZDyc@vger.kernel.org
X-Gm-Message-State: AFq9FYI5GwaJxBG1DYDyXQ5RFBezDE+jMbzwEESw6BNH25b63L2jZSg6
	Z/NengY2EIV/LonIs7uYoRHyNXEkbKwPeMQDBd4c2Wbg3Iy5P5ktTGT1
X-Gm-Gg: AYBFou1hUNdrz9WvO93T6TLQtd5EWoxxXnv8LCJVpeCOY4P0PKRDwvLkigbmlKODyDY
	mlSLXgrm8BLPUzjm459hcjCC4Z3Pk+K51nvKT+t9dr/KTqBiRt1qcMibI6xbxCca1+e5LUU1lxB
	6GC0/QiOjjpO6ZA4WWvMakSplY1GZG4puk/meJj4tXc2htP8Ps3+7b9EVmJSo0/4HkenxTqN6El
	RA8nJpJqtuZpZIKCm9z7jxNCxBjzDIUnfahBqUivdBGtcj1qebA85lgcZ/5bqoPNwonaWuCpQr1
	qqPVc8OHJmhYJC3ilDNn6L8fhBHYlsrJStsLNZQIbsnZdMa382d/bcD+cdPbhCfJMxtKOWIVl/m
	Ws/J6CBKGxSu8XjUYnB2Pi8Rq/ivgfmhnZZjh/7sQH0Uizbuqpvbu0EUPuoLSakmYEj4MRsp3Rs
	cKAlP1Wm8A7EmIw5dTqYE/8tgkAzfcOobPM8vjUdsW+Mo+tq8E/+hLGihpFJE/EIJyJuJAksFpz
	ZilJIu7UDhpI1HnUx/lb6VDGxi1zuA=
X-Received: by 2002:adf:e191:0:b0:487:aa6:c90d with SMTP id ffacd0b85a97d-48b0244dde4mr898761f8f.1.1790751956592;
        Wed, 30 Sep 2026 00:05:56 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f5bcdsm1145150f8f.27.2026.09.30.00.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:05:55 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/6] drm/tegra: dc: Expand available registers layouts
Date: Wed, 30 Sep 2026 10:05:30 +0300
Message-ID: <20260930070535.47130-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930070535.47130-1-clamor95@gmail.com>
References: <20260930070535.47130-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Expand existing DC register definitions with additional fields in
preparation for adding the 8-bit CPU interface.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c |  3 ++-
 drivers/gpu/drm/tegra/dc.h | 54 ++++++++++++++++++++++++++++++++++----
 2 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b0bfa946e6979..5c67928bcabfa 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	if (dc->rgb) {
 		/* XXX: parameterize? */
-		value = SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
+		value = SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
+			SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
 		tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
 	}
 
diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
index 0cb0515968b35..5679e1ca0c2a5 100644
--- a/drivers/gpu/drm/tegra/dc.h
+++ b/drivers/gpu/drm/tegra/dc.h
@@ -274,8 +274,11 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_COM_CRC_CHECKSUM			0x301
 #define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
 #define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
+#define LSC0_OUTPUT_POLARITY_LOW BIT(24)
 #define LVS_OUTPUT_POLARITY_LOW (1 << 28)
 #define LHS_OUTPUT_POLARITY_LOW (1 << 30)
+#define LSPI_OUTPUT_POLARITY_LOW BIT(8)
+#define LDC_OUTPUT_SELECT_V_PULSE1 BIT(14)
 #define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
 #define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
 #define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
@@ -303,9 +306,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS0		0x400
-#define H_PULSE0_ENABLE (1 <<  8)
-#define H_PULSE1_ENABLE (1 << 10)
-#define H_PULSE2_ENABLE (1 << 12)
+#define H_PULSE0_ENABLE				BIT(8)
+#define H_PULSE1_ENABLE				BIT(10)
+#define H_PULSE2_ENABLE				BIT(12)
+#define V_PULSE0_ENABLE				BIT(16)
+#define V_PULSE1_ENABLE				BIT(18)
+#define V_PULSE2_ENABLE				BIT(19)
+#define V_PULSE3_ENABLE				BIT(20)
+#define M0_ENABLE				BIT(24)
+#define M1_ENABLE				BIT(26)
 
 #define DC_DISP_DISP_SIGNAL_OPTIONS1		0x401
 
@@ -451,11 +460,30 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define BASE_COLOR_SIZE_888    (  8 << 0)
 #define BASE_COLOR_SIZE_101010 ( 10 << 0)
 #define BASE_COLOR_SIZE_121212 ( 12 << 0)
+#define DISP_COLOR_SWAP_BGR	BIT(16)
 #define CMU_ENABLE_ENABLE      (1 << 20)
 
 #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
-#define  SC1_H_QUALIFIER_NONE	(1 << 16)
-#define  SC0_H_QUALIFIER_NONE	(1 <<  0)
+#define SC0_H_QUALIFIER(x)			(((x) & 0x7) <<  0)
+#define SC1_H_QUALIFIER(x)			(((x) & 0x7) << 16)
+enum {
+	SC_H_QUALIFIER_DISABLE,
+	SC_H_QUALIFIER_NONE,
+	SC_H_QUALIFIER_HACTIVE,
+	SC_H_QUALIFIER_EXT_HACTIVE,
+	SC_H_QUALIFIER_HPULSE,
+	SC_H_QUALIFIER_EXT_HPULSE,
+};
+#define SC0_V_QUALIFIER(x)			(((x) & 0x7) <<  3)
+#define SC1_V_QUALIFIER(x)			(((x) & 0x7) <<  19)
+enum {
+	SC_V_QUALIFIER_NONE,
+	SC_V_QUALIFIER_RSVD,
+	SC_V_QUALIFIER_VACTIVE,
+	SC_V_QUALIFIER_EXT_VACTIVE,
+	SC_V_QUALIFIER_VPULSE,
+	SC_V_QUALIFIER_EXT_VPULSE,
+};
 
 #define DC_DISP_DATA_ENABLE_OPTIONS		0x432
 #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
@@ -493,6 +521,22 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_CURSOR_POSITION_NS		0x441
 
 #define DC_DISP_INIT_SEQ_CONTROL		0x442
+#define SEND_INIT_SEQUENCE			BIT(0)
+#define INIT_SEQUENCE_MODE_SPI			BIT(1)
+#define INIT_SEQUENCE_MODE_PLCD			0x0
+#define INIT_SEQ_DC_SIGNAL_SHIFT		4
+#define INIT_SEQ_DC_SIGNAL_MASK			(0x7 << INIT_SEQ_DC_SIGNAL_SHIFT)
+enum {
+	NO_DC_SIGNAL,
+	DC_SIGNAL_VSYNC,
+	DC_SIGNAL_VPULSE0,
+	DC_SIGNAL_VPULSE1,
+	DC_SIGNAL_VPULSE2,
+	DC_SIGNAL_VPULSE3,
+};
+#define INIT_SEQ_DC_CONTROL_SHIFT		7
+#define FRAME_INIT_SEQ_CYCLES_SHIFT		8
+
 #define DC_DISP_SPI_INIT_SEQ_DATA_A		0x443
 #define DC_DISP_SPI_INIT_SEQ_DATA_B		0x444
 #define DC_DISP_SPI_INIT_SEQ_DATA_C		0x445
-- 
2.53.0

