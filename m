Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7483DFC84
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139771; cv=none; b=mxB4fDlqcwQzppbTCiDRjDFD2raCW7lWLMttWPQBnPO4VxKPx3h8UDYNzwExs19SMyxAoByH7Ix8kdNebCKInb2zUUTtJ1BiqgxRpdRjZzpNCBPQwS9MCmA4w1FVPIljVX2j8bs9JDdkdJRqa0EgU+7chKyNVPvjMsDUg8v2gck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139771; c=relaxed/simple;
	bh=h/W00kTA7niZgcWbsALiafOON4a6qD0dc6lvT4pLIbg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ch+I2BSWIqW82IONrPw03vq88ZntMlHYtsqde39MY5IZ7Ll+eYcoJ+hcnhLRb3LNBWlRbyRZyEagx5jxruHGINUT+Ef3FfJGtJXgSPOYwu3QQKQTJAxTVgXE4jWu8uQJqNA8pcmCPBqpRECwpREGNy8TOS069RbMQeETaNpV4TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U2ssXWIA; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U2ssXWIA"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84861fc51f5so1735093b3a.1
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785139770; x=1785744570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6sRejk3B+yPg1+HxkjMwu54eDOWf5cqpo8JqvdlVdY=;
        b=U2ssXWIAKwJOIIIjFefMaHpeKdadKAjiSqFYvbgnIyjqzVRhjqUNvO9tGxGUOMbzrn
         8qoHGa6jdURHE6zp8zsrKCYhV1WKAn7AGpKWA288u8tMr/YYorun6l01AYEVOQ0s4HSx
         1Dua4KQuajbBG/Gbv0hE3NeXUON4t7QbVZC2j6KuZcqPNQX7dlb1Zo9tFc9Ff2wRGSKI
         PZNWycCEdOzPB4v7KMMZaS+abv0loPcCT7TPdXu25BBHu2NkwF5iFNcy7SL0G3m2yq7h
         oMRw9ccLeiQ1KPEf5PVhN75aMcuF8ftzfMjsQMZigoaYAlvnkGSHJtO7WoOv6zmYXDwH
         eu3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139770; x=1785744570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6sRejk3B+yPg1+HxkjMwu54eDOWf5cqpo8JqvdlVdY=;
        b=J4Job1ue2xuoLUYNL/xiEn9qw2EFLO3AbTxvJwMxVgsn4tWMw+PbIfF4C9cEQB24du
         FTbzuAppBX2I5NFFUqLhzSMX40VwL1+oonjnt20VMV4lkgo1GMzKtecgHh8GkY6EraCX
         4c87kvA/Uvrwd2s0qlFbWHClwo5KvxtbFJTY96UlkPEIjljy4JJnrYmniXVpAlwgqECG
         GOmgnFj/4XAm9EVUqtu1KCdPdzmhdVA/fOTNd31w1rOcrnBb7bH3tB/yVLH3i1XlOoh/
         PK/FmEbF8iQGEwXvR1MGhJ/sow/5y9J2iwOvfJsin4hlIQ1NuqwHF/kk4tDXispKWWDI
         OCZA==
X-Forwarded-Encrypted: i=1; AHgh+RrktR5wgw5PfAygl0JUy8gLrRYGdmF1wXIWGMMeGA8Wf2ADBvJ5OHUg5vEzLYVxTkKb/o2nIvHyBqRL@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9Sy47GVFT+DnFv0M3Ue+U31+cdVgQPsqG0IOwSUR/NV9yXfrI
	TPYXtPUwUe3HIi+2uFZfjjKHP8qpQtDIDeroSKTGvZA9+liri0DEMmAKURGzIaZyflQ=
X-Gm-Gg: AR+sD10Gxf6UAFgrJJrZPypih7wB94Qg5Rvm21hJNz0AjFxVQ9NvFOhVWId9vCaH3kF
	hLuAIsaKvRQVTDmjipr1luK8pYwrl0CZ4fSxNIcUu7x+Vxc86GcCA3CYC6Qqncpjbcmzt5XhA8M
	xU2yyCi2CN1zS8BABjeNnJ0vq7/Q46MPT0JZD9fPQomM7fI3MUGCrpAaiIz6uRsz+I4fiPBDB3B
	/DARgt/v2nbKnsVmTLpEB7ETno5tEtJYGhLNg8xdnw+k74MMWlTFHv121d1nJHUus+xyQiekrbQ
	6hZi2gYOEZUEzuvLc9Jo1OhOGjlK6NhpHt63RRDZzdcT17syxTd0KNKv6mkf//EL1nIWDKCgL4X
	2M4tjtnIGIpPs1e2qJ57o31xQnYrPw/p+F4l9qSN8mlkAPYXyEFW7CQGqpJ8mj0h1hIqdwx4e56
	AtFw==
X-Received: by 2002:a05:6a00:3d54:b0:848:6895:b763 with SMTP id d2e1a72fcca58-84e5955a3ccmr5868270b3a.40.1785139769866;
        Mon, 27 Jul 2026 01:09:29 -0700 (PDT)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e577sm2630658b3a.58.2026.07.27.01.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:09:29 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 27 Jul 2026 16:08:42 +0800
Subject: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785139738; l=1587;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=h/W00kTA7niZgcWbsALiafOON4a6qD0dc6lvT4pLIbg=;
 b=J0lEyIAhWqLNkmjLgwckuk9I8l4LH0DXiVP4ZEpYh4f2Xg8Z145EyB0Dz2R5C55crFHhZaLpg
 d3daYAKkIYaAyz/eyy1/IwFmdNJnLcRw/+4Mp3jLmVCWkdguSJbvcAu
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Some devices treat two independent physical DSI panels as a single
logical panel from the CRTC's perspective. However, two separate DSI
hosts are still required to drive the panels individually.

Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
allows a panel driver to inform the DSI host that it is part of a
dual-panel setup, enabling the host to coordinate both physical
displays as one.

This change does not force individual panel driver to manage
system-level display topology if the driver does not intended to
support dual panel topology. Only the driver that set the flag to
true need to take care of panel topology.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 2ab651a36115d..889ef1421207a 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -169,6 +169,7 @@ struct mipi_dsi_device_info {
  * @host: DSI host for this peripheral
  * @dev: driver model device node for this peripheral
  * @attached: the DSI device has been successfully attached
+ * @dual_panel: the DSI device is one instance of dual panel
  * @name: DSI peripheral chip type
  * @channel: virtual channel assigned to the peripheral
  * @format: pixel format for video mode
@@ -186,6 +187,7 @@ struct mipi_dsi_device {
 	struct mipi_dsi_host *host;
 	struct device dev;
 	bool attached;
+	bool dual_panel;
 
 	char name[DSI_DEV_NAME_SIZE];
 	unsigned int channel;

-- 
2.43.0

