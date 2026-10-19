Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8ED4B9216
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403849; cv=none; b=nytNgQ/qGlcpbHO9Z60DFFQEJ7DWwSTv2YT1Nz2MiBgUfAuSoT4vjOzVjFuoMlHanbp3FhUJvB4BN7y5QDGkgGCaNa5GTdtWUDuWbZpWhVYzZ4TUSysvS81qz3VVN0oipd+JGrAUaAwOtQ1zSxLxK1dZ+h3LDAtLZ5U/3ucv4bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403849; c=relaxed/simple;
	bh=kRMD3LifFT0eTo3gIXvJVRlHOZTJ+JtZ12j0BXFmzmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mNrvw9Mz9TJLvrsa05DqxhWPXzmXtXVZYCfnG8te89esg/FgoBWtBGT8jV3ByXDKLkZ6yoAo+yR73QIE5DOgntsp9OOcsb/WI/EWFvfbNu2fg4EkFpPimC+ptqLxapbtAB+lNP7EP040Auf5wnJzyd0M+jmxpS3LsHP+ubv/SD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iy0Vs66Z; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iy0Vs66Z"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1286785f8f.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792403845; x=1793008645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
        b=iy0Vs66Zb/VhXRtLZkYyu9M6Ictt6ZZet/Adhz/cSz+U5B3ZmNJAhvssIi0k1sae50
         7lHuqLl3Z5TAJZtKZNMVmKbnu8XtdT2HVvud6TgcbBvypQDap04Oi9VNMLqlSghaDK3v
         L0Mu8iecxa2eElNsRyOFeQwakEzJsOuDtvSQAe8Q5Piz2OztdxAMvKNs0HcghZXF1cu7
         v3MHnxIX37N+f7FhdBiCF6SqkcYbB0HJfOmt/rLD0hbDlP5yNE5ncvoz629i63TzVD8p
         2DUtvJyNSE6ezcsszfcm4Opt2Y488/TiQyo2aCqQUR2D5UqeFr2osPYo3BxazyIklIL9
         mQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403845; x=1793008645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klRLuslgHZkHfKV3cIJoQTmbsYS3GX5KrVERzHwo0vI=;
        b=NZLjem4FJZmmItJkQmLfEUVzb+Ou2CILUhhdI8LNyRQQZCs+CNkXonGk7nnGYvh0n9
         vdVR9gi7VMDcX1kqKUMtBu5rtunO89XhfHTozQDMTDtKipJNBTNkFCL2W4WPETkibO6B
         r24OGbhCa9wuq7s0OXVDI+DBrXwnJiNvJibzqnfhQNeZwtSPOyhh4c59B8wbX5NCDDYm
         Qn/Fo8XHn72yxwtlG6D4IIvCp+eJWChQrEQhVO60IuClbC7hiflMkClKrPz1vEocSSdx
         7sfCaiHfE4qGSvT8a2C0x+YGbaG28tAhnfFo6mF6QufwVb0S7LaQEEmFeOhEbRwPBuJA
         T2ag==
X-Forwarded-Encrypted: i=1; AKwUvBxgE0plUgndvDVpV8Wj8yEBU8vmx4gk8e3Wy6hwM11IB0zkF+j3XdL3nMHJAmge+me4XZ66hjVB6URh@vger.kernel.org
X-Gm-Message-State: AFq9FYJtq39W3LkrBsusWvX7bA55tXHb2nNI3+c55AbTjgeA3LlcnUtr
	LbQJmj3dcLKjE2xsIjfLNf7GIMc+T64v63kGyY97nNYHb62iuvwaOFra
X-Gm-Gg: AYBFou25WQb0MouyoKUYsBvqRivHhyrDNweQz5oWs43t+1BBGEUspua0/qRznidREjg
	IcawjkLHHknD60+w/tTNYChs+YUbyrqSVE5y0UYyxQ/kQ8V0L7X3wHI2YKt9ekUtRDMV3gszH9z
	YgISdLrY6GbHGcD/dPuDpxZfghcucaBQhmicC6jgObzs6laPPsibEG/DvuuFkyDrDG7FcLXfM8H
	4S541iyBfQ9FStAOI/QWafobjwV5kMRCU23AWVQnyH8AJ15oUEeY3DzQ+9hNBFx00kJ0XP14EAh
	VfVML5p9gdQnntQcB+F2EanHkXI4gd8VlWQrDFcFqaVpEx4Zn1NXswe2TWkacoMBd8qttVshnr3
	4IOfEIXfTeUd0bJYm5N5udQ6wvDrA7XPWIuhHCrdy78uoeTp5EhGKWqhazJ0yTbL7qF5IYtzXCJ
	yjiP23a0FuhQfruWh1porbSVBc5fs0AK49NtFaye4MqlFv2O7AD2R83ADWI9yhjuyGAnbZCXASP
	ET0H1Sd1akXPvb1pfxtAJQajxWe4g==
X-Received: by 2002:a05:6000:4b1d:b0:48b:437:8fbb with SMTP id ffacd0b85a97d-48dfae72117mr23703513f8f.19.1792403845319;
        Mon, 19 Oct 2026 02:57:25 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm21740089f8f.42.2026.10.19.02.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:57:24 -0700 (PDT)
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
Subject: [PATCH v3 1/7] drm/tegra: dc: Expand available registers layouts
Date: Mon, 19 Oct 2026 12:56:59 +0300
Message-ID: <20261019095705.91062-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261019095705.91062-1-clamor95@gmail.com>
References: <20261019095705.91062-1-clamor95@gmail.com>
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
 drivers/gpu/drm/tegra/dc.h | 49 +++++++++++++++++++++++++++++++++-----
 2 files changed, 45 insertions(+), 7 deletions(-)

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
index 0cb0515968b35..7005df32f485f 100644
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
 
@@ -451,12 +460,26 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define BASE_COLOR_SIZE_888    (  8 << 0)
 #define BASE_COLOR_SIZE_101010 ( 10 << 0)
 #define BASE_COLOR_SIZE_121212 ( 12 << 0)
+#define DISP_COLOR_SWAP_BGR	BIT(16)
 #define CMU_ENABLE_ENABLE      (1 << 20)
 
 #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
-#define  SC1_H_QUALIFIER_NONE	(1 << 16)
-#define  SC0_H_QUALIFIER_NONE	(1 <<  0)
-
+#define SC0_H_QUALIFIER(x)			(((x) & 0x7) <<  0)
+#define SC1_H_QUALIFIER(x)			(((x) & 0x7) << 16)
+#define SC_H_QUALIFIER_DISABLE			0
+#define SC_H_QUALIFIER_NONE			1
+#define SC_H_QUALIFIER_HACTIVE			2
+#define SC_H_QUALIFIER_EXT_HACTIVE		3
+#define SC_H_QUALIFIER_HPULSE			4
+#define SC_H_QUALIFIER_EXT_HPULSE		5
+#define SC0_V_QUALIFIER(x)			(((x) & 0x7) <<  3)
+#define SC1_V_QUALIFIER(x)			(((x) & 0x7) <<  19)
+#define SC_V_QUALIFIER_NONE			0
+#define SC_V_QUALIFIER_RSVD			1
+#define SC_V_QUALIFIER_VACTIVE			2
+#define SC_V_QUALIFIER_EXT_VACTIVE		3
+#define SC_V_QUALIFIER_VPULSE			4
+#define SC_V_QUALIFIER_EXT_VPULSE		5
 #define DC_DISP_DATA_ENABLE_OPTIONS		0x432
 #define DE_SELECT_ACTIVE_BLANK  (0 << 0)
 #define DE_SELECT_ACTIVE        (1 << 0)
@@ -493,6 +516,20 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
 #define DC_DISP_CURSOR_POSITION_NS		0x441
 
 #define DC_DISP_INIT_SEQ_CONTROL		0x442
+#define SEND_INIT_SEQUENCE			BIT(0)
+#define INIT_SEQUENCE_MODE_SPI			BIT(1)
+#define INIT_SEQUENCE_MODE_PLCD			0x0
+#define INIT_SEQ_DC_SIGNAL_SHIFT		4
+#define INIT_SEQ_DC_SIGNAL_MASK			(0x7 << INIT_SEQ_DC_SIGNAL_SHIFT)
+#define NO_DC_SIGNAL				0
+#define DC_SIGNAL_VSYNC				1
+#define DC_SIGNAL_VPULSE0			2
+#define DC_SIGNAL_VPULSE1			3
+#define DC_SIGNAL_VPULSE2			4
+#define DC_SIGNAL_VPULSE3			5
+#define INIT_SEQ_DC_CONTROL_SHIFT		7
+#define FRAME_INIT_SEQ_CYCLES_SHIFT		8
+
 #define DC_DISP_SPI_INIT_SEQ_DATA_A		0x443
 #define DC_DISP_SPI_INIT_SEQ_DATA_B		0x444
 #define DC_DISP_SPI_INIT_SEQ_DATA_C		0x445
-- 
2.53.0

