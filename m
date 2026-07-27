Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98AC3DA7E3
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139765; cv=none; b=AeDuuOSijb57Wcihr5awl2WKYYF9/ILJ4GDTNK5nuHJae2SzXj4mH6X9277bfvaJeYpOxlnfvPrz8KEnk8q6J4dzgLmym0AJ/hMdkgmIMYbNwWeGiJ1Ack2qpm64iykdmpT7yJAyctDUVz1OdFgxAameecBNaaT2oMTTaY6lBdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139765; c=relaxed/simple;
	bh=gqoC4/a/9djR/9hM1Xie6jaz0hcb2IWh16QULE0/41Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EidPUz7Rz9yhiT1/cJLv1fQoJx62EirNyr12VJ/lRLbWlkggIwOqXnqcxDezGVCxHie48OHqdrPvsXNm+k9krQ5Buc9AFfK6gxAVQw+FbtKmShsI7uH8H+cPkcqdysGcwtPRTbLJ+RwnBzFjTh2d91aexO5dnwHBeoReGSb23C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nci0tM3Y; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nci0tM3Y"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1696510b3a.3
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785139763; x=1785744563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jm6+6kOZspXgkLHgH1OO+Xsz7RPUgCUNKzexSNmpQT8=;
        b=Nci0tM3Yb0gF7IvmbiOdZbsVJTdUlmnyd3YBQlJyovUzVVYYW4oCr1EKYS1jzLRu2z
         u2/h2LOfufP4pPrX+x3ORwnJqZ3E62ATui8RtQE4Vn6/k1WsSJJbwSrxmAO/lNfzHe58
         L8TphC2oHCziqqtSe+gSMmWJGBezZSSEJGGNga/yFXOJmwSer3C+Dhot8ARF85E9gpk5
         W8G0Q0h6nSjSWkzBYjhSMB+1+4YBBdJ/A/atppB854sRepguaTcuCs2QIE2hhTp6l5UN
         x5NCvdZrybx1fLSmpIPTpnbEGdWZvxgeLuN2XZMhQrCRSDtfU+41z7LctT8WFEODU+DR
         qoJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139763; x=1785744563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jm6+6kOZspXgkLHgH1OO+Xsz7RPUgCUNKzexSNmpQT8=;
        b=gm62eaVLe31eVpaJ3O/88yYWIg4+DCzt2gXyZLHp3ACUcY6ZjqSf9iGtSm/CzK7mim
         Wd2mo4J8OGQqwDY5LZzCXFwFnGOA7emYPADKrTWQ8aB6baaafHw5byKtPZ0nQVpBVa4n
         ZwxlWj6ZExah1eryfAopFzEsoV8eTQ/uJjMhsHx6UeiXALuRO4BmDduGMwBdZnbRHgGn
         tZLtnwwxhVOYof6LHGkR5e07zbTMPg8JOuP1OO3NGCFOGqHev8mHqQLnwJ5E5t0t7KZJ
         RJUxR7cOwwTtUMvE06h1CO0l1/rj2ltGhdQMSWVRq8j8Yj7j9Q8qFu9ezKwYauq2dz85
         jbzg==
X-Forwarded-Encrypted: i=1; AHgh+RqZPHu/Vl/Zm9kv6AbHiXR1oNGbxzl0HD23EARSd9BcfXhuYOpYLrVU/AIiblPWILKcvqvj7egRDYdl@vger.kernel.org
X-Gm-Message-State: AOJu0YytOFWw+aZ23nrH+l+y1mmMlGsj3jD2yEwl0aCn8OMx8ae30cW9
	1dHDj4y2P+/Tqs5X/LqMT0sDme7vIr6foY+/aNcTXw10kX/jG3zq9X6BiLqVU4XujZY=
X-Gm-Gg: AR+sD13D/hCDAre7mhFDq30TiYsMmxoO5ShSTmGKdNwgE31E2QEsuJ2j1Ttk8137dqe
	+gDiaL3hxlP00pBrqbIcUpXhnHa2vbmkibScTCEG49G07Oj85Db4VjPh0bSUAlLrIBsIJ3pHv/G
	MofmYuuaTE0HtUeVLN48vFbUUy5YXXgl0FmGDyiFsMxU2Po7ovVN6jKG/RmFt2VQwKjuEhBd8SU
	JS/oVDMg43ZDY5oqpSOAj5p7r27qXdUFseQKYywinSQ+YcPH4oXrxKdfQbfhOG2Qz3+rN3rBv+l
	fSZ0tWwZVa1faUa1uEa7ShwIq6udJVoNT9gQNepaJNxP1K3dfZvDTZoyx3fV3wpXzZJ5XPX/CNv
	zp49aCFr/mOAnJ6SNhHbmKXtwjpTzbGvVCn7raezFoWph4Mq6/U91E8K2QkIiLJ6slU5LIT+P/M
	TgVg==
X-Received: by 2002:a05:6a00:1894:b0:848:2f74:d8d9 with SMTP id d2e1a72fcca58-84e595d8873mr5504761b3a.74.1785139763066;
        Mon, 27 Jul 2026 01:09:23 -0700 (PDT)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e577sm2630658b3a.58.2026.07.27.01.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:09:22 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 Jul 2026 16:08:41 +0800
Subject: [PATCH v5 2/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-sm8650-7-1-bonded-dsi-v5-2-c042266b9eeb@linaro.org>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
In-Reply-To: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785139738; l=3893;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=gqoC4/a/9djR/9hM1Xie6jaz0hcb2IWh16QULE0/41Y=;
 b=BBIDJekvK5rWDal0nDAL8OyIRwINl/SgaWld9WqlwQieSSwqKk+nbbgfK0giIzEGdSZ85VFgC
 deoOSCszP8cCXNCeX5F298Wpfr1z4TPfpVxIM/R596NI/0Q5JTsMooh
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
 drivers/gpu/drm/msm/dsi/dsi_host.c | 27 ++++++++++++---------------
 include/drm/display/drm_dsc.h      |  7 +++++++
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 53ff23f4f68ab..e39938fb0f502 100644
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
@@ -1719,8 +1709,14 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
 	msm_host->mode_flags = dsi->mode_flags;
-	if (dsi->dsc)
+	if (dsi->dsc) {
 		msm_host->dsc = dsi->dsc;
+		/* for backwards compatibility, assume 1 if not set */
+		msm_host->dsc_slice_per_pkt = dsi->dsc->dsc_slice_per_pkt ?: 1;
+	} else {
+		msm_host->dsc = NULL;
+		msm_host->dsc_slice_per_pkt = 0;
+	}
 
 	if (msm_host->format == MIPI_DSI_FMT_RGB101010) {
 		if (!msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
@@ -1757,6 +1753,7 @@ static int dsi_host_detach(struct mipi_dsi_host *host,
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 
 	dsi_dev_detach(msm_host->pdev);
+	msm_host->dsc = NULL;
 
 	DBG("id=%d", msm_host->id);
 
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

