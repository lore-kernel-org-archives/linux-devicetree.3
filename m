Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4C83AC0C5
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139780; cv=none; b=f/jjwoqhwtlLZLAVCIa/E5Nq22tLdmjzzsG8LgmMfEMw/aaeUdRy5XjYkUxVv9tICEDh6G2SIjCtvUNpf24a+1yIwI+fTWGFijkQyPMyXfao/nFULN/XLlcTzw0kXOIQ+mzlu3BCd5c5z6EBPDw/FaEvZcswuF3A1HjJIT52Gxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139780; c=relaxed/simple;
	bh=FY+WdSUHGPRbRnMDhtWaq/iF/3Apl57IiEpz0463pdQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HJ5T6WT1/SmnKZJMpqb1bv3Myfl1DCbLyuPrIQc/fK3rgRFrnoboLwOKj8YjjvpZ51kM506HRsYmXBvu4Ol8EwbP0CMnGHviIIu29zwU50QmtgiucYiDfAoIiuRD8u66ZGZg0/VJ+Yfr9fd6ZA9PqMsRpHrKg6lfaBYobJG1obU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tYxeejqt; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tYxeejqt"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84830c774a0so2350529b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785139778; x=1785744578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrYihn4Im98kREdEKJWRKQu4TGYm0GuReA+hxDMV7Gg=;
        b=tYxeejqtH0r6uVC5hk+AMlRNJ3vmdWoH9CG0CdOD/KBY1UBigb5cPDmIhkUoXTJjz7
         PM6MLyxc94ajaqKS9RshikKE7Su1YYmnRqHF3AE5iXe0PiBGK2JG3CdD25TdQWqWt3iH
         uKJXVfx++z/kVuYlufKRHalVMIUN3E5zlWcX9wklBC2bN4Rg9gyzO7Rh1ApHRkNAERak
         nVSY0IzoUxDEHXE/0qtMCXN9rJHYhIvtdBhH48262gZJV6+TjeZVYN7Yp7oELYsUgymx
         iIv0eqFcG9Z4n6444o0jAQN64N7ZLKruvie2O5HU1uEx3AtF01sV2pkoQcfX9QOcWz9V
         3F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139778; x=1785744578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IrYihn4Im98kREdEKJWRKQu4TGYm0GuReA+hxDMV7Gg=;
        b=hlHDSpQGDbt/WwfEmkfoUyxXXii0AvbmqtNDE739O/Jt2uOGYmwnuBDIsSc1lyDq2n
         OWfvKQQGcUrQ4EKhZeplyqy1Z+X74bg2QPmnLtH2RikufPetRgqrIe+LOclU7X/omAgF
         uUoxRRuJ1oK/Mn3d27EsL/ucHp20oncwmbHDujF5oUDJeqT6PUppl6i5kvr+kE7veP64
         SYMIaRNYIZhfgkkz00sfvVPi4MrT6milhAkFF85lRmM4mQT5o0fQZNwXkgSgQv0j7Q2t
         sdMg0WgYe/gSathBgv7dFS0f2+OKPzIz7RAIcX4MH22l0XLfzr58K8bPf9l658mOcAsX
         u+MA==
X-Forwarded-Encrypted: i=1; AHgh+Rpw/qe3PMbLkc038ZABS5agN/LhjizQzEVK3SBmTTCHkOhijGiedfmdNYPrO6+MpsaJwPuwFTseqZCW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3E+NBy/XIO2RBfBxOZwiBpHd3xTaJmsOd2gqyqoAddsZh/yI2
	FJuazaWucx+gBujdkke2TIO1kvjhDAb3mQJG7pOw+hoop6tn+hXGe2+DiXcAD049JZA=
X-Gm-Gg: AR+sD10iesDW57/6Wfa1wm/repUI9hK3TkdErJZbsoDTPIAoXXjQ/s0hLjnEz6JAfgI
	qC6gnOIdNxo8CHb66ui1R0ayyd24BNtLTFyUAbqSWd6xxj8ttZaP16V64ca1H/gwtxZ0upIpJX1
	IoRu8599wEuA9Wzjd3cbDvsQsbeghnpkiJJxGsPSZJtoXbSAke4g1uoEF1SSdR1P6zdmv5B/XNF
	lnKjpeJpf2OgOK8v40aNQmoP40ureYBd8329zyw2tTRPOniRb6mgqCBSNE4deYkxrj3yGe2Eayj
	iXOpzRI2KCznfsRX9/Xvq8WTUqqIq5ZDqzKYTFNAddQ18pTQ/POYSChamGvgS7UatPdovuyCdzS
	oqPKh9iMLccRcgA8G2fL2pJ3awESAPFgNS39IU6eibUX6cBvW6D+CRdwS/ubRyqZrWdBjE58kAE
	cgEw==
X-Received: by 2002:a05:6a00:1f0b:b0:845:e8b5:8c49 with SMTP id d2e1a72fcca58-84e59401ce9mr5117677b3a.10.1785139778271;
        Mon, 27 Jul 2026 01:09:38 -0700 (PDT)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e577sm2630658b3a.58.2026.07.27.01.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:09:37 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 Jul 2026 16:08:43 +0800
Subject: [PATCH v5 4/6] drm/msm/dsi: Support dual panel use case with
 single CRTC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-sm8650-7-1-bonded-dsi-v5-4-c042266b9eeb@linaro.org>
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
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785139738; l=3658;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=FY+WdSUHGPRbRnMDhtWaq/iF/3Apl57IiEpz0463pdQ=;
 b=cwvcKUA13xkpOMW5V9zqO5BFssVSkKaJBxCMHREMn32+D640hqLdaqisAHFUW/Nbt8CzAu6rM
 xiRjc/OPRR4C3+xCpSqQIMFdc23sI6Jd0wfXtw3kAg9KEm0fuvG3k8s
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

The pic_width is used to calculated DSC parameter for DPU DSC controller
 together with panel's parameter. While panel driver that support dual
panel shall provide slice_width parameter of single panel. This patch
only impact DSC configuration, so crtc is not aware of it and not impacted
by it.

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
index e39938fb0f502..a3c56c3dc7904 100644
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
@@ -2600,6 +2605,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
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

