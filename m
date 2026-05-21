Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DA53672BF
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374813; cv=none; b=qaknzQnngN6CCPAYJ5t5gMhbNbt0eLjfYXEOZBKHWikmM5LFdlfNAeZi8Zu2Mrnzyva2ugtJpAPh0eVNRoFw6MisxJQcaLE8LZwrLqq1PjENF5cRUkMAPfw9gPqQ49STHix+D+cHKXHorvltCWTtvNSVXC1MuGt+7YqNhWgCqik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374813; c=relaxed/simple;
	bh=aKBFRzOSRxcJ4Txy7/kSLmugaeZPSeJFq/bdVBQc+E4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bujqjNShLKmMtolj1e2eo3jjb87xRFCEZGy8oakZUYXi+/w+QzQcNRqMfogpUGJtsXq9WwFdTdcukig85aLH+P8uwEJSCxapT/2G7jAY+8oeDRU0ZUxeeKDzff6bRJsskkcyide69yjp8HxxcUGnCT2Q3mxxYBkoM5/5TWdCk6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=asjX7ckd; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="asjX7ckd"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3664df32e91so6692262a91.3
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374812; x=1779979612; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Asp0zRkS+UgWcG9vl0amstXfnHnSp8pf6SKHURGIe3E=;
        b=asjX7ckddibawalXvRahss7IZQ2Xnb8Fz6U4TV1QG6p42obr3SRvsSlMkgmpjuUrU0
         8RU/DPo8R0w1nGo1erxlnC9BJMApxh55AKUR+XNScEQ1bMHil/WNjwkplHvRpZ/btelH
         OFgbRC2HMrRohIYG8NuXdqT7e4YVl7IqPGwOcxb18L3JPHXWj83/MeqRCkUPoFF56nGY
         p/eVmzU5k6GPXRBTjydv3As/KxTunEIWJnTC6U889Resf3EIKWfk9QgC3gTI4AcdFihF
         nETrF7zs+iKzeEfP/V1txXToZswQAAwCU79wkWhWV5j+bOWv6zs7aEg8TD6TWn3qtfD0
         5zPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374812; x=1779979612;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Asp0zRkS+UgWcG9vl0amstXfnHnSp8pf6SKHURGIe3E=;
        b=faODJRqA/IIr5yBg0YUeeQgNUZCaOkECV9gXx3Hf98Aq7mBoMlr6X/GUnhfl2RTPQk
         jsqGwTb92bjOhgdT+x0KCsIbgAmYtKMGlcyg3IvEQE8ifyGGP2jVyLAL1IczSXBKduG5
         nYgih7LmHR7Wg6OH8Swqk9zQYuy35XmUnkDofzvuMAKU0HHu8mtWnbQv4QTy1LpnGZdI
         wxg5f/kFPlrSGFgWv+BKA/XaEgI1iNYFcvaOVfekCO3b364c9gnXhLRWbMSa9Ln8nsKp
         IMHwKk0iu3fR3m+sSYF7m2ej3MxpLmdj4+TX8rG1jK4R2+P0KJWKW98i17fYSwMVO6Aw
         j5bQ==
X-Forwarded-Encrypted: i=1; AFNElJ/hZiTdYvlILXB9g/yalrIOfmbs0Aya7AvymM5Tf3FpUsrXyhAjYG1qwlp9bnnrxmgiZ/9OWwFQXEMz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1vE1eXflBfPG6E8xoxX7eww6vu3yn62lKgEhB3/s6sDCR4kf4
	na3AfKi75YeJvWeOwCozws2NaNYPcszdSrIVwkAatbY7eBY1FjoGY8D1IXAJD1ZIzUc=
X-Gm-Gg: Acq92OFFXqIOAHYYCqzYcSQ9U6ac2bHIBWiD4NBoXNV/pPe498Q/9CD/6g5+8y1yq9T
	tP3in4fbCZJ2/L6qekZyC3bzNnHzKYVBgtM9vVw5YlfX48WO3KazZx7faP65UqiYOEpxzF1JwNm
	GnSjCGu46wFUgDuAHamdGsJJ3+Bx4HC8NBSOWIakJl+2Fk0q2+fpk67jK+2tPmRu41DIDoQz80q
	JunmlVji9SZX7yUHaki3z5j7EgFfCtQZYRgXvVl5rNghT2z36XeRHX11DGe60Vue/MwqgwJQi9N
	uaJgwf3Z2T2SrdDlQPQT/V1KIyuSNws40+OIS8JO6sykwhLufswj4yTOgfMew+noaB+s6MzgAFB
	eQyvu6NlPXeH8i2yMhEKYJB8FLYvH9Nf6dvvBkeaTKhjBJQE3p6ZtaFvLlTFitpMNmCOkaw==
X-Received: by 2002:a17:90b:4d90:b0:369:a359:b192 with SMTP id 98e67ed59e1d1-36a45182255mr3160061a91.10.1779374811479;
        Thu, 21 May 2026 07:46:51 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::109e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5bff3ef3sm476527a91.4.2026.05.21.07.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:46:51 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 21 May 2026 22:46:03 +0800
Subject: [PATCH v4 1/5] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-sm8650-7-1-bonded-dsi-v4-1-a4dd5e0850f1@linaro.org>
References: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
In-Reply-To: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779374785; l=3578;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=aKBFRzOSRxcJ4Txy7/kSLmugaeZPSeJFq/bdVBQc+E4=;
 b=Wb/XYoQvQLih10uVNXcXtJ4LZNf+eFEbM7cw4pN8fli1pFCMy5LBN6yWHkEoV97Q5lKtduYI9
 X6o8VEoodRuCd5YUgeeZytLQm70SuYHzEPnrd/eeA/zt2jfLHQfajIa
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Some panels require multiple slice to be sent in a single DSC packet. And
this feature is a must for specific panels, such as Sharp ls026b3sa06. Add
a dsc_slice_per_pkt member into struct drm_dsc_config and support the
feature in msm mdss driver.

Co-developed-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 23 ++++++++---------------
 include/drm/display/drm_dsc.h      |  7 +++++++
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 53ff23f4f68ab..d14b6e41dcd90 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -166,6 +166,7 @@ struct msm_dsi_host {
 
 	struct drm_display_mode *mode;
 	struct drm_dsc_config *dsc;
+	unsigned int dsc_slice_per_pkt;
 
 	/* connected device info */
 	unsigned int channel;
@@ -938,17 +939,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	slice_per_intf = dsc->slice_count;
 
 	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
-	bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
+	bytes_per_pkt = dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt;
 
 	eol_byte_num = total_bytes_per_intf % 3;
-
-	/*
-	 * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
-	 *
-	 * Since the current driver only supports slice_per_pkt = 1,
-	 * pkt_per_line will be equal to slice per intf for now.
-	 */
-	pkt_per_line = slice_per_intf;
+	pkt_per_line = slice_per_intf / msm_host->dsc_slice_per_pkt;
 
 	if (is_cmd_mode) /* packet data type */
 		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
@@ -1104,12 +1098,8 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 		else
 			/*
 			 * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
-			 * Currently, the driver only supports default value of slice_per_pkt = 1
-			 *
-			 * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
-			 *       and adjust DSC math to account for slice_per_pkt.
 			 */
-			wc = msm_host->dsc->slice_chunk_size + 1;
+			wc = msm_host->dsc->slice_chunk_size * msm_host->dsc_slice_per_pkt + 1;
 
 		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
 			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
@@ -1719,8 +1709,11 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
-	if (dsi->dsc)
+	if (dsi->dsc) {
 		msm_host->dsc = dsi->dsc;
+		/* for backwards compatibility, assume 1 if not set */
+		msm_host->dsc_slice_per_pkt = dsi->dsc->dsc_slice_per_pkt ?: 1;
+	}
 
 	if (msm_host->format == MIPI_DSI_FMT_RGB101010) {
 		if (!msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
diff --git a/include/drm/display/drm_dsc.h b/include/drm/display/drm_dsc.h
index bbbe7438473d3..c522ab3d71853 100644
--- a/include/drm/display/drm_dsc.h
+++ b/include/drm/display/drm_dsc.h
@@ -267,6 +267,13 @@ struct drm_dsc_config {
 	 * Offset adjustment for second line in Native 4:2:0 mode
 	 */
 	u16 second_line_offset_adj;
+
+	/**
+	 * @dsc_slice_per_pkt:
+	 * Number of DSC slices to be sent in a single packet. This is not
+	 * part of DSC standard, and only used in some DSI panels so far.
+	 */
+	unsigned int dsc_slice_per_pkt;
 };
 
 /**

-- 
2.43.0

