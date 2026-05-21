Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CF1368D79
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374838; cv=none; b=ez454fkI+Tq7WK578YFOik+D8eH+xaaLxzBlhxEzvciqQy0Pi5NcsvH1xtfX+MP8p5xwVgfi4VFlIVmRYZETmycosm9kCRtGg5zWkZq4tnL+O6wxm8mr3F8SupF6oFcfCofiwzgCvx1mNY+C88nb3OJfoIkEPAZ7ePWuYOYQXNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374838; c=relaxed/simple;
	bh=KnQNWhFGZp33dCjq6OXiRZfhx2zq6YDbC/BM4AvYDFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaPpGLam/nF2efaZWOu/Hyvm5sRwlxaPM+JlWg1xjzjR6dlOXfeBkgph5rmjr/ZD5S1S1YGKpCQ+nJ0Xr7nQ8AzIoeprKogqGLc1bR7/MK1ctBCfdmiwpC/EZsMTnzdvmUY48S4sk8utqvKMcrIdYLrilccHhLY+sCgQxQZQtCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yR0kjbpl; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yR0kjbpl"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-36974221f93so3403019a91.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374836; x=1779979636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n9BURsh5NYMbwKkwuyMPazevtClBiueqRU9O2y7rbG4=;
        b=yR0kjbplKJPCSv98BAtKLEoBQXMUdukcIRjDsnTSYtMfZl2AiG4AbjRU6OBwT78iid
         8j4b4SzwvJJFca+jeTKJsUil1lHrfo+GXwo0YXxKg9pLQalmksNF8CfQjzAh5jrhmMiV
         LEhT7XfB+sDiTNb8E+/ntpeXcOZoFXNXh642jDvKxC+7mN/YMR0l0acHfQX2k2jnOzFe
         ZAkHUIautgfut9tOuvLIy4YZu0LImytii0pqeLz6+/lDFa3sVa2olcexpzYE+n9grBZu
         CUWwn1mGi1/zHXvQ+BBJuchWB5XHnlqnsZure2R5bhEmcWKy6S9K8LykP1RLguiuRKXq
         5r6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374836; x=1779979636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n9BURsh5NYMbwKkwuyMPazevtClBiueqRU9O2y7rbG4=;
        b=sgi0kG9M/zgy5EV+7FrxfmJ0NPIcRJl5wc8VpB7tCfRgls/+25LGeUIoAszlR+0bor
         6Xcw7GmFXggrN4fiePnwldBlzZrZMP421J7ohpzfwxZOg/+XkBiEYJkoNOaZGY4Xtem8
         bNuJ4YW496Iwqx8QtkSN4az7Z6z/ghGISc3RQsGcvTDqAOKYJKSCwq6MBOP813yP9+1x
         OWOx0v7LnRTdwrABkMSTQTJUgyJfqiFrttRYQg+Ey4az42DtmIb/C6rZr4DRe29yl12R
         iFNoiX/SAYAVwnILuHnQoqUN9bSMLpgUVsCDK0txfXQvNSFUhqaYtuMUCAZgIDSLwcOI
         YOzQ==
X-Forwarded-Encrypted: i=1; AFNElJ8u5eiJ8IeqzXlxFIKa1B9pZS6W0CuIKuInyUksyYvHc1TO29IglYb2Xh5sHSgmHl8wRTkjXfY9bTev@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5dRwnn0rTQeMNmc0rRRH3eiz/Fy/aot8/F8DC4dLzji42Ath/
	OsJHqO/qeS8MOARvNW+bpRrn2dPWlMgORmxsfwdlv1NWI6fa7lDNsOTcM5hRmMq4XCg=
X-Gm-Gg: Acq92OGVs8nF/jaisC0rQ2PLZB/NOlcyUgwuIzmbjMA5WSET1wEZb1sHu7/FT2WcHRS
	TGQGlKMFH6RdXivZFOSHC5iEJ8YTbi+D87Ekxaw4bCG62KTUVF5qgl5w7LfuRA3MAjmUHk3JO7T
	vaCN62O2lVmv6LH0usKPpFedKFs1TE3IPZ9GnmGW0Cm+Q5z+NU7ZhiHXGwOPTHXHkGG8b79/P1L
	0dugbV+Z+p1p5ZLR4Lgn5cxHbIJ5SD5PL3nJYTU56jzYfXseLr088sZ3ohcYAMuR47MTFEEJ1q4
	Eq/IwV2FgF9/KRlRYREq/JAOCRL/4NHcdXEa1pwCcTMr4EPHzW4COyRn7hLU0GXwMy2wvXrtK7R
	T50Oi/SgeDBaucExsTQDmoXkCkNqhuCt4kHozCj/x1pY2XsyBjP7fmDClVsi/Q+CY4x0hi1Iylv
	ZQ01oM
X-Received: by 2002:a17:90b:3d4e:b0:35f:b7f5:9cd with SMTP id 98e67ed59e1d1-36a4563db18mr3294883a91.20.1779374836085;
        Thu, 21 May 2026 07:47:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::109e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5bff3ef3sm476527a91.4.2026.05.21.07.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:47:15 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 21 May 2026 22:46:05 +0800
Subject: [PATCH v4 3/5] drm/msm/dsi: Support dual panel use case with
 single CRTC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-sm8650-7-1-bonded-dsi-v4-3-a4dd5e0850f1@linaro.org>
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
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779374785; l=3355;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KnQNWhFGZp33dCjq6OXiRZfhx2zq6YDbC/BM4AvYDFo=;
 b=nMdcNoK7/z8Uvsq3qZxzJYj4k6T+yPZNRjhZ4FVWWK4hodIv7ywVAZaXqYzqN6eh4rNaL0DUK
 4O0zFdXVKxcDx+0rHZUOJMKzSINWRX6pZDrVJ97WSdEdwIz1gI2bbTY
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Support a hardware configuration where two independent DSI panels are
driven by a single, synchronous CRTC. This configuration uses a bonded
DSI link to provide a unified vblank for both displays.

This allows application software to treat the two displays as a single,
wide framebuffer with a synchronized refresh cycle, simplifying rendering
logic for side-by-side panel arrangements.

At the DSI host level, the frame width for each link must be that of an
individual panel. The driver therefore halves the CRTC's horizontal
resolution before configuring the DSI host and any DSC encoders, ensuring
each panel receives the correct half of the framebuffer.

While the DSI panel driver should manage two panels togehter.
1. During probe, the driver finds the sibling dsi host via device tree
phandle and register the 2nd panel to get another mipi_dsi_device.
2. Set dual_panel flag on both mipi_dsi_device.
3. Prepare DSC data per requirement from single panel.
4. All DSI commands should be send on every DSI link.
5. Handle power supply for 2 panels in one shot, the same is true to
   brightness.
6. From the CRTC's perspective, the two panels appear as one wide display.
   The driver exposes a DRM mode where the horizontal timings (hdisplay,
   hsync_start, etc.) are doubled, while the vertical timings remain those
   of a single panel. Because 2 panels are expected to be mounted in
   left/right position.

To maintain synchronization, both DSI links are configured to share a
single clock source, with the DSI1 controller using the clock provided
to DSI0 as below.

&mdss_dsi1 {
   assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
		     <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
   assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
}

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index d14b6e41dcd90..4d7ac01aa393d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -186,6 +186,7 @@ struct msm_dsi_host {
 	bool registered;
 	bool power_on;
 	bool enabled;
+	bool is_dual_panel;
 	int irq;
 };
 
@@ -1024,7 +1025,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			return;
 		}
 
-		dsc->pic_width = mode->hdisplay;
+		if (msm_host->is_dual_panel)
+			dsc->pic_width = hdisplay;
+		else
+			dsc->pic_width = mode->hdisplay;
 		dsc->pic_height = mode->vdisplay;
 		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
 
@@ -1705,6 +1709,7 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
 	if (dsi->lanes > msm_host->num_data_lanes)
 		return -EINVAL;
 
+	msm_host->is_dual_panel = dsi->dual_panel;
 	msm_host->channel = dsi->channel;
 	msm_host->lanes = dsi->lanes;
 	msm_host->format = dsi->format;
@@ -2596,6 +2601,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
 	if (!msm_host->dsc)
 		return MODE_OK;
 
+	if (msm_host->is_dual_panel)
+		pic_width = mode->hdisplay / 2;
+
 	if (pic_width % dsc->slice_width) {
 		pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
 		       pic_width, dsc->slice_width);

-- 
2.43.0

