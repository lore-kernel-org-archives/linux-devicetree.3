Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296DF3346A8
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422883; cv=none; b=umaIYBjoJoVbg0qaSxixOzIV9F0agKFbAZ/+YQLHQJHX0vU068VMLUdjftSCglmrYt91QLinMqZMHbGLSR1ah9i0R8OchmNc7I6G+asy86Q5OiO6Py1q/4VwfZwAPO/9HXjJKJtolycdf3UAnkwcX7/gYkr2bqbyfs6uXNIysB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422883; c=relaxed/simple;
	bh=BHdR2rhdb02n7Y4FeM3rUvnQT0LRIy0YtN8g2BB7ndE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ghVTbT6zIF6m4mtZk2B5HkDl/HJUQeoVtdKdGwBxuPxuetA3Rt8M2EoBNh6q/HurxZi2ke2jb2wofpfnNA6nd15MJ3ELQVmZxx9nM54eo79DqAwKMAPDTVqU0DabNpkw4ha1u7rnbxJBnc5lScbMbPc9EECjvG9LspdF0Z/iQ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J8vjEmJO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J8vjEmJO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cf8d550bdso528770f8f.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 03:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776422879; x=1777027679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygVjvsrCVifGe998ocxbvA31BcxZVINfBDq3ZvtuWQE=;
        b=J8vjEmJOIV7R+I2lhPB0jlBCM/yO5o6PKDQu2v8hnAVgL1Zb+ju7w13nuilIppeWyR
         y81/+GH1+wL1qD9QAuqhnpcFAHYCDuCz+bFbfhm31TCPAwOnwOmJMJ1SUSLWWFQy+B1u
         5pZi5zqK/UFTUDbFWo7aKwn2mL0VE6Q9Q/N7+t+RyRs9iABEE/Gtl9i8ZjQV6Hd9jDuh
         OQEcjRlQm0D86STSMdUYTvX4lTHrH74l6r2/Wn+CQhaVprbsG/gl5Pi/zwZbbLkD2CWz
         6sFY2tU/wsOteQlegY+RhPKbhO+jWM+tkCtyRjIFbYeprOLHprT/LyXgNhpjtJMajJcS
         TyYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776422879; x=1777027679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ygVjvsrCVifGe998ocxbvA31BcxZVINfBDq3ZvtuWQE=;
        b=HZGsHyMxzwhGwFeOay5m2TmtO30D9YZMGO11gu6J6orQ18Bt5Xm2vhOARHjSaZPfHv
         drF6mHCDhE2OoQLGLxzsC2SvdTeflr/1sY/c+dmVnbfCYOD/4Esw9rEPR+71ekL0inc3
         iqPxAeOYKpVjL83oDoa0epZtCyNhjCxY2rctRdRZzlllb8sLSg2NaCiN5vfakQBoFQPH
         gL8oKpdgQ1uLIGk+3DfrrsiPfqmuussuDa6lATp4guNvn5vf82bbGMbans4+OqH2ghcL
         cV4cdlyc8ZO90giKOn1JquCvjaOyjjTrSla5pEvxKxDVE8JqSBOG6545LMzEKhVVxWOi
         IGAw==
X-Forwarded-Encrypted: i=1; AFNElJ8OJfZ/r6FzlpnePQCzXfl5nWdZDD0I1m8QsumNqJiY8uIszcvvzmG3eWuDlz4sU7ScMmOj/2xR0PtW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0X0Oh04J36Qg88MByXEjJ0dCSTgNZxbPq+cw1I4xw5PqtB2ue
	wg2BQgkj3OxTB/htzvUYNQi1rwfewyzCfwKii9f+4ttlACeXTVXT8OxK
X-Gm-Gg: AeBDieuQEOXpZvBS3/g/iBVugR7XgchOhC66ZCuC/sKE0Vvli/k50HYiUAWbJDMvU41
	rsDKRTVF+yhgRexCPLdgOctp9Q2pnzkRqDble13kpSKlaCuL9LpMbxy71SSZfgHoOkurzpTzleO
	hoOv+NT9jOs6gUb6hS4harvr7Vn75muWwwdnLyWSlzpze/cXySOJsWWZrFsiEbzRwgiv2Gqfp/k
	P8RJwrhtbzzkF/29hgE69u/GEWhe+kNB0PxN68KrTTcMvVzCelR7QL68MipYyBgJtjeZIByqaIk
	gBIgcrPbJ8FG4s1A/JM3X6B/knBhvbMa2+IUJsLoCiYDWGlnDCIumXg/pYVgkXw1i2BW6lzYr6J
	9KTeGVfO9AZrbGAdTN/oxdXSPEixR4Jy939Nu3AcIRilPmBB2PvgR8Y0DRQq07+zUCk2MbVz561
	7M5ex3f76gZJFeT9237hMs+6ns6QmvVA==
X-Received: by 2002:a05:6000:144c:b0:43d:6a0c:9571 with SMTP id ffacd0b85a97d-43fe3dd339emr3441556f8f.11.1776422879390;
        Fri, 17 Apr 2026 03:47:59 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d5b1sm3732966f8f.30.2026.04.17.03.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 03:47:58 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Jagan Teki <jagan@edgeble.ai>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Marek Vasut <marex@nabladev.com>,
	"Kael D'Alcamo" <dev@kael-k.io>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] drm/panel: jd9365da: Support for Zhunyi Z40046 panels
Date: Fri, 17 Apr 2026 11:46:31 +0100
Message-ID: <20260417104740.259689-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417104740.259689-1-l.scorcia@gmail.com>
References: <20260417104740.259689-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Zhunyi Z40046 is a 480x800 24-bit WVGA DSI panel based on the
Fitipower JD9161Z DSI controller found in the Xiaomi Mi Smart Clock
x04g, apparently in two different variants.

The Fitipower JD9161Z LCD driver IC is very similar to the Jadard
JD9365DA-H3, it just uses different initialization sequences.

The two initialization sequences for the panel have been extracted from
Android original firmware for the Xiaomi Smart Clock.

Variant -ctc uses a CTC LCD panel and has been tested on device.
Variant -boe uses a BOE LCD panel and has not been tested.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../gpu/drm/panel/panel-jadard-jd9365da-h3.c  | 313 ++++++++++++++++++
 1 file changed, 313 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index c33c611e03c0..7da064567248 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -46,11 +46,22 @@ struct jadard {
 	struct gpio_desc *reset;
 };
 
+#define JD9161Z_DCS_SWITCH_PAGE		0xde
+
+#define jd9161z_switch_page(dsi_ctx, page) \
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, JD9161Z_DCS_SWITCH_PAGE, (page))
+
 #define JD9365DA_DCS_SWITCH_PAGE	0xe0
 
 #define jd9365da_switch_page(dsi_ctx, page) \
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, JD9365DA_DCS_SWITCH_PAGE, (page))
 
+static void jd9161z_enable_standard_cmds(struct mipi_dsi_multi_context *dsi_ctx)
+{
+	// Enable access to DCS and internal commands
+	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xdf, 0x91, 0x62, 0xf3);
+}
+
 static void jadard_enable_standard_cmds(struct mipi_dsi_multi_context *dsi_ctx)
 {
 	mipi_dsi_dcs_write_seq_multi(dsi_ctx, 0xe1, 0x93);
@@ -1606,6 +1617,300 @@ static const struct jadard_panel_desc taiguan_xti05101_01a_desc = {
 	.enter_sleep_to_reset_down_delay_ms = 100,
 };
 
+// Sequence retrieved from Xiaomi Mi Smart Clock x04g kernel in boot.bin
+static int zhunyi_z40046_init_cmds_ctc(struct jadard *jadard_data)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard_data->dsi };
+
+	// Init configuration sequence
+	jd9161z_switch_page(&dsi_ctx, 0x00);
+	jd9161z_enable_standard_cmds(&dsi_ctx);
+
+	// GAMMA_SET (pos/neg voltage of gamma power)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7,
+		0x10, 0x04, 0x86, 0x00, 0x1b, 0x35);
+
+	// DCDC_SEL (power mode and charge pump settings)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb,
+		0x69, 0x0b, 0x30, 0xb2, 0xb2, 0xc0, 0xe0, 0x20,
+		0xf0, 0x50, 0x60);
+
+	mipi_dsi_msleep(&dsi_ctx, 1);
+
+	// VDDD_CTRL (control logic voltage setting)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc,
+		0x73, 0x14);
+
+	mipi_dsi_msleep(&dsi_ctx, 1);
+
+	// SETRGBCYC (display waveform cycle of RGB mode)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3,
+		0x74, 0x04, 0x08, 0x0e, 0x00, 0x0e, 0x0c, 0x08,
+		0x0e, 0x00, 0x0e, 0x82, 0x0a, 0x82);
+
+	// SET_TCON (timing control setting)
+	// param[0][5:4] + param[1]: number of panel lines / 2
+	//   400 = 01 1001 0000 -> 0x10, 0x90
+	// param[2]: scan line time width
+	// param[3]: vfp: 14
+	// param[4]: vs + vbp - 1: 11
+	// param[5]: hbp: 4
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4,
+		0x10, 0x90, 0x92, 0x0e, 0x0b, 0x04);
+
+	mipi_dsi_msleep(&dsi_ctx, 1);
+
+	// SET_R_GAMMA (set red gamma output voltage)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8,
+		0x7e, 0x76, 0x68, 0x57, 0x4c, 0x39, 0x3a, 0x23,
+		0x3d, 0x3d, 0x40, 0x61, 0x54, 0x64, 0x5d, 0x62,
+		0x5a, 0x50, 0x32, 0x7e, 0x76, 0x68, 0x57, 0x4c,
+		0x39, 0x3a, 0x23, 0x3d, 0x3d, 0x40, 0x61, 0x54,
+		0x64, 0x5d, 0x62, 0x5a, 0x50, 0x32);
+
+	// SET_GIP_L (CGOUTx_L signal mapping, gs_panel = 0)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0,
+		0x1f, 0x0a, 0x08, 0x06, 0x04, 0x1f, 0x00, 0x1f,
+		0x17, 0x1f, 0x18, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+
+	// SET_GIP_R (CGOUTx_R signal mapping, gs_panel = 0)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1,
+		0x1f, 0x0b, 0x09, 0x07, 0x05, 0x1f, 0x01, 0x1f,
+		0x17, 0x1f, 0x18, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+
+	// SETGIP1 (GIP signal timing 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4,
+		0x10, 0x00, 0x00, 0x03, 0x60, 0x05, 0x10, 0x00,
+		0x02, 0x06, 0x68, 0x00, 0x6c, 0x00, 0x00, 0x00,
+		0x00, 0x06, 0x78, 0x71, 0x07, 0x06, 0x68, 0x0c,
+		0x25, 0x00, 0x63, 0x03, 0x00);
+
+	// SETGIP2 (GIP signal timing 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd5,
+		0x20, 0x10, 0x8c, 0x18, 0x00, 0x80, 0x00, 0x08,
+		0x00, 0x00, 0x06, 0x60, 0x00, 0x81, 0x70, 0x02,
+		0x30, 0x01, 0x00, 0x00, 0xc0, 0x00, 0x00, 0x00,
+		0x03, 0x60, 0x83, 0x90, 0x00, 0x00, 0x03, 0x4f,
+		0x03, 0x00, 0x1f, 0x3f, 0x00, 0x00, 0x00, 0x00);
+
+	jd9161z_switch_page(&dsi_ctx, 0x04);
+
+	mipi_dsi_msleep(&dsi_ctx, 1);
+
+	// Unknown command
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0,
+		0x24, 0x01);
+
+	mipi_dsi_msleep(&dsi_ctx, 1);
+
+	jd9161z_switch_page(&dsi_ctx, 0x02);
+
+	mipi_dsi_msleep(&dsi_ctx, 1);
+
+	// SETRGBCYC2 (RGB IF source switch control timing)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1,
+		0x71);
+
+	mipi_dsi_msleep(&dsi_ctx, 1);
+
+	// Unknown command
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
+		0x00, 0x18, 0x08, 0x1e, 0x25, 0x7c, 0xc7);
+
+	mipi_dsi_msleep(&dsi_ctx, 1);
+
+	jd9161z_switch_page(&dsi_ctx, 0x00);
+
+	mipi_dsi_msleep(&dsi_ctx, 1);
+
+	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+
+	mipi_dsi_msleep(&dsi_ctx, 1);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 5);
+
+	return dsi_ctx.accum_err;
+};
+
+static const struct jadard_panel_desc zhunyi_z40046_ctc_desc = {
+	.mode = {
+		.clock		= (480 + 20 + 20 + 20) * (800 + 14 + 4 + 8) * 60 / 1000,
+
+		.hdisplay	= 480,
+		.hsync_start	= 480 + 20,
+		.hsync_end	= 480 + 20 + 20,
+		.htotal		= 480 + 20 + 20 + 20,
+
+		.vdisplay	= 800,
+		.vsync_start	= 800 + 14,
+		.vsync_end	= 800 + 14 + 4,
+		.vtotal		= 800 + 14 + 4 + 8,
+
+		.width_mm	= 52,
+		.height_mm	= 86,
+		.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		MIPI_DSI_MODE_LPM,
+	.lp11_before_reset = true,
+	.reset_before_power_off_vcioo = true,
+	.vcioo_to_lp11_delay_ms = 5,
+	.lp11_to_reset_delay_ms = 10,
+	.backlight_off_to_display_off_delay_ms = 100,
+	.display_off_to_enter_sleep_delay_ms = 50,
+	.enter_sleep_to_reset_down_delay_ms = 100,
+	.init = zhunyi_z40046_init_cmds_ctc,
+};
+
+// Sequence retrieved from Xiaomi Mi Smart Clock x04g kernel in boot.bin
+static int zhunyi_z40046_init_cmds_boe(struct jadard *jadard_data)
+{
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = jadard_data->dsi };
+
+	// Init configuration sequence
+	jd9161z_switch_page(&dsi_ctx, 0x00);
+	jd9161z_enable_standard_cmds(&dsi_ctx);
+
+	// GAMMA_SET (pos/neg voltage of gamma power)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7,
+		0x10, 0x08, 0x42, 0x00, 0x56, 0x42);
+
+	// DCDC_SEL (power mode and charge pump settings)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb,
+		0x52, 0x0f, 0xb2, 0xb2, 0xb2, 0xc0, 0xd0, 0x50,
+		0xf0, 0x40, 0x50);
+
+	// VDDD_CTRL (control logic voltage setting)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbc,
+		0x73, 0x14);
+
+	// SETRGBCYC (display waveform cycle of RGB mode)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3,
+		0x04, 0x07, 0x0b, 0x17, 0x00, 0x17, 0x04, 0x17,
+		0x17, 0x00, 0x17, 0x82, 0x0b, 0x82);
+
+	// SET_TCON (timing control setting)
+	// param[0][5:4] + param[1]: number of panel lines / 2
+	//   400 = 01 1001 0000 -> 0x10, 0x90
+	// param[2]: scan line time width
+	// param[3]: vfp: 14
+	// param[4]: vs + vbp - 1: 11
+	// param[5]: hbp: 6
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4,
+		0x10, 0x90, 0x92, 0x0e, 0x06);
+
+	// SET_R_GAMMA (set red gamma output voltage)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8,
+		0x7f, 0x78, 0x69, 0x56, 0x47, 0x33, 0x34, 0x1e,
+		0x3b, 0x3e, 0x43, 0x67, 0x5d, 0x6f, 0x68, 0x70,
+		0x6a, 0x61, 0x3c, 0x7f, 0x78, 0x69, 0x56, 0x47,
+		0x33, 0x34, 0x1e, 0x3b, 0x3e, 0x43, 0x67, 0x5d,
+		0x6f, 0x68, 0x70, 0x6a, 0x61, 0x3c);
+
+	// SET_GIP_L (CGOUTx_L signal mapping, gs_panel = 0)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd0,
+		0x1f, 0x1e, 0x07, 0x05, 0x01, 0x1f, 0x1f, 0x1f,
+		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+
+	// SET_GIP_R (CGOUTx_R signal mapping, gs_panel = 0)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1,
+		0x1f, 0x1e, 0x06, 0x04, 0x00, 0x1f, 0x1f, 0x1f,
+		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+
+	// SET_GIP_L_GS (CGOUTx_L signal mapping, gs_panel = 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2,
+		0x1f, 0x1f, 0x04, 0x06, 0x00, 0x1e, 0x1f, 0x1f,
+		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+
+	// SET_GIP_R_GS (CGOUTx_R signal mapping, gs_panel = 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd3,
+		0x1f, 0x1f, 0x05, 0x07, 0x01, 0x1e, 0x1f, 0x1f,
+		0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
+
+	// SETGIP1 (GIP signal timing 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd4,
+		0x30, 0x00, 0x00, 0x00, 0x00, 0x01, 0x10, 0x00,
+		0x03, 0x03, 0x68, 0x03, 0x40, 0x05, 0x00, 0x00,
+		0x00, 0xcc, 0x2d, 0x31, 0x02, 0x03, 0x68, 0x0c,
+		0x25, 0x00, 0x63, 0x03, 0x00);
+
+	// SETGIP2 (GIP signal timing 1)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd5,
+		0x30, 0x08, 0x80, 0x18, 0x00, 0x00, 0x00, 0x18,
+		0x00, 0x00, 0x06, 0x60, 0x00, 0x07, 0x50, 0x00,
+		0x33, 0xc0, 0x00, 0x60, 0xc0, 0x00, 0x00, 0x00,
+		0x03, 0x60, 0x06, 0x10, 0x00, 0x00, 0x0f, 0x4f,
+		0x00, 0x10, 0x1f, 0x3f);
+
+	jd9161z_switch_page(&dsi_ctx, 0x02);
+
+	// SETRGBCYC2 (RGB IF source switch control timing)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc1,
+		0x60);
+
+	// Unknown command
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2,
+		0x00, 0x18, 0x08, 0x1e, 0x25, 0x7c, 0xc7);
+
+	jd9161z_switch_page(&dsi_ctx, 0x00);
+
+	// GAS_CTRL (GAS function control)
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbe,
+		0x4e);
+
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 120);
+
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+
+	mipi_dsi_msleep(&dsi_ctx, 10);
+
+	return dsi_ctx.accum_err;
+};
+
+static const struct jadard_panel_desc zhunyi_z40046_boe_desc = {
+	.mode = {
+		.clock		= (480 + 20 + 20 + 20) * (800 + 14 + 4 + 8) * 60 / 1000,
+
+		.hdisplay	= 480,
+		.hsync_start	= 480 + 20,
+		.hsync_end	= 480 + 20 + 20,
+		.htotal		= 480 + 20 + 20 + 20,
+
+		.vdisplay	= 800,
+		.vsync_start	= 800 + 14,
+		.vsync_end	= 800 + 14 + 4,
+		.vtotal		= 800 + 14 + 4 + 8,
+
+		.width_mm	= 52,
+		.height_mm	= 86,
+		.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
+		.type		= DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+	},
+	.lanes = 2,
+	.format = MIPI_DSI_FMT_RGB888,
+	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
+		MIPI_DSI_MODE_LPM,
+	.lp11_before_reset = true,
+	.reset_before_power_off_vcioo = true,
+	.vcioo_to_lp11_delay_ms = 5,
+	.lp11_to_reset_delay_ms = 10,
+	.backlight_off_to_display_off_delay_ms = 100,
+	.display_off_to_enter_sleep_delay_ms = 50,
+	.enter_sleep_to_reset_down_delay_ms = 100,
+	.init = zhunyi_z40046_init_cmds_boe,
+};
+
 static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 {
 	struct device *dev = &dsi->dev;
@@ -1707,6 +2012,14 @@ static const struct of_device_id jadard_of_match[] = {
 		.compatible = "taiguanck,xti05101-01a",
 		.data = &taiguan_xti05101_01a_desc
 	},
+	{
+		.compatible = "zhunyikeji,z40046-ctc",
+		.data = &zhunyi_z40046_ctc_desc
+	},
+	{
+		.compatible = "zhunyikeji,z40046-boe",
+		.data = &zhunyi_z40046_boe_desc
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, jadard_of_match);
-- 
2.43.0

