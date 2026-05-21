Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85243655CF
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779374801; cv=none; b=UvdIgy/ONJkjZCkFET3B5bVUXcVeBRMTdJzcJufBpBTxybxmESbyiSNCHT3zJUP3zSjJ6WbXlVII9PLYQZ6tCbDC/kXF9a7OyYmrjJlNzZ3neR7q1O6a8eHbiUjO1GhmCMF6dbJ2RWTthJXl4n9dlpbpl4PXk9HM00yjTFkLstM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779374801; c=relaxed/simple;
	bh=9/4X222Ffhg6qxLQzzfx1T7bWcnktGM6AwovaxbqqjY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=giKBJgjaQveAV8qoVo3hcXgWmQldItF0rTfszoymPh/zkLBcMH24i/kQWreZL8nYg5pUmVwNAD9hgB7x/C7bs8J119hiMmkGItk8hOJAPFGvZFyKKQlKvPoGa6Fm5yrOY92d0QijVXASdZVd5Ynfg9XthqtOJjFuHVsU3yxpwmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=obldQwLy; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="obldQwLy"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3697f25d26eso3192249a91.1
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779374799; x=1779979599; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MYcMfa9UmKpbrcq2eKdzXRn9iD3DzK0oC+yU6GOGJbQ=;
        b=obldQwLy9++pGZEkvq9vCp1fG8Kv+fEuZeAc+QCto1FCEUsNh1p/Z3DLcx/usDJeIE
         xQ5cWbuJGU8jgwNXyuzSNlBBfFUwYLSRVbg4k6ZYz1JnIbDOnfZaOko5o1FDIzBwFVmm
         513nvDI4eKKPNerIEs4YCx5OEoQ0yFKiL11Mi6eD0d65yIXgpMPTmSE9JWMlgWRYK0/x
         mmhITp17sDNh64Hl36a9mbjMoqqwrZ90qbblpWjkbMi1Tg6f2gcVwH+lFgx5Wi6nlBKA
         T/urfcUZyLHBUAI9Kb5iqaJ+LBdp2BeyqmcUkXBXjrbqIavp7ksomSdPxl3BcCvfrobZ
         odAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374799; x=1779979599;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYcMfa9UmKpbrcq2eKdzXRn9iD3DzK0oC+yU6GOGJbQ=;
        b=i0H4rof90ZK+GRfaO1sYcJOOIhrrfARZlYchaOlm1cnppk08gBM8jv1T9+YDiwlh5e
         7lRmKK4f1DOCfgpS1gRMilFdiJpDCapQbue6ovqw9menIKRH6nPpgxXeJi++/hJ8gdQH
         4UtnQpV7xctd0uc6DkJVYbd5Fu2Vj0mI5FqN6YgxEr6Si/0WWGtn6/ARRp9ErmaYe8ZM
         GuMLnLsG7VtgduPj9wAPIy1L4TZ1FgMH9ulAJpxDOkgZQXibmRgiYwOdTXmMFDwcw86+
         F46YCq3lyvP7gtASaSZ4q5pTII5Gd8V1ramPZbXdBEfIFv9EzlLF3U3WAoI6Bu0qMHQT
         45FQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Vn+BX8UrhRikoZRe/B69EF3yT8vRm65kj3GRSsZL3VR4Nq0Jkx98GDDN0rOa3bSjGfRO+7syiLMA8@vger.kernel.org
X-Gm-Message-State: AOJu0YyTelTVxSPIFsXmYzTey197CYseh+5C9jRl0jBhX+n1i9efb/1a
	eAH7vNbzJMlwIsmtJhWZKlxfHyMgN+5HdOfz06N/o5Vfpz+9oYkcsc8bUWHiw3PxDoY=
X-Gm-Gg: Acq92OGQ8zH4ShW9lVKfXZrMWXjue50vM0Zl7gNq0TzaBu81FX1KUaKJz74izqKdDHT
	hkvPQRblVUAmx8KS/PGeRUB4KQBkWaRrAB8P5DdmWXfpqt/dn+Cu1w+ysvocaduT6qjtHSwrzV9
	ToOD285Fixhxq6OCCErwJO6AUHPp+UQZ2DjeyyBJL89OIMZ8dFoIVGWI6qJiRLhBUP1t44fMbM3
	sfE+8TGUa9OAwBUQdIJdMdxdSRKAo/DekQoG+PzDW0cRtpRW+RUtstUvpm09G70dkOfQ670RuXx
	TLsd84fwa/TfO7P1aHJt1jpo4do9Hwu/OG7pXIOm86SisnC5/57dkdZuiWcjTGb5EWUDr6iD+d+
	IGqGm3bOowYqohXXq722D99b4nPpJHFjDiBPBl+l+V990cdwekIk1jwu2T4MKmtT2ATdzNAsbhH
	wySI8T
X-Received: by 2002:a17:90b:578e:b0:368:6a6e:94dd with SMTP id 98e67ed59e1d1-36a4577cf96mr3442038a91.24.1779374798897;
        Thu, 21 May 2026 07:46:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a11:3:200::109e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a5bff3ef3sm476527a91.4.2026.05.21.07.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:46:38 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v4 0/5] Add support to 2 panels in bonded-DSI mode
Date: Thu, 21 May 2026 22:46:02 +0800
Message-Id: <20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKoaD2oC/x3MQQqEMAxA0atI1gZqmTYyVxEXOknHLKxDAyIU7
 26Z5Vv8X8GkqBi8uwpFTjU9csOr7+CzLfkrqNwM3vnogh/Q9jEGh4QDrkdmYWRTpIU4rORSHAl
 a+yuS9Pp/p/m+HxErmS1nAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779374785; l=2436;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=9/4X222Ffhg6qxLQzzfx1T7bWcnktGM6AwovaxbqqjY=;
 b=/WKxz3iXOXS5uf1GNcLWawLpDSfY6swFLXN24AUeDm+crBP+skomIhxxoU8jLwoiGj3q7hP1k
 OgvdCnEyzLnB6puoNidZaS2wb/hzD24i+mXd4X9wALv1DEvag78eMwX
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The 2 DSI interfaces may be connected to 2 independent panels in bonded-DSI
mode. Horizontal timing and DSC configuration are adjusted per individual
panel in DSI host side. Support to multiple slice per packet is added for
the device setup to test the usage case. A panel driver is included as an
use case example.

Changes vs v3:
- A panel driver is added as an use case example.
- Move dsc_slice_per_pkt to struct drm_dsc_config.
- Polish commit messages.
- Link to v3: https://lore.kernel.org/all/20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org

Changes vs v2:
- Polish commit message to describe usage case and requirements to
  panel driver.
- Remove changes in device tree and add dual_panel flag in mipi_dsi_device
  to pass information from panel to dsi host.
- Drop the register programming to DSI_VBIF_CTRL, as no issue is seen
  in latest test.
- Link to v2: https://lore.kernel.org/r/20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org

Change vs v1:
- Add device tree binding for dual panel case in handling frame width for
  DSC to avoid breaking existing dual-DSI case.
- Leverage Marijn's patch to configure proper slice per interface in
  dsi_update_dsc_timing().
- Polish commit comments.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (5):
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
      drm/mipi-dsi: Add flag to support dual-panel configurations
      drm/msm/dsi: Support dual panel use case with single CRTC
      dt-bindings: display: Add Synaptics R63455 panel support
      drm/panel: Add driver for Synaptics R63455 DSI panel

 .../bindings/display/panel/synaptics,r63455.yaml   | 125 ++++
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  33 +-
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-synaptics-r63455.c     | 631 +++++++++++++++++++++
 include/drm/display/drm_dsc.h                      |   7 +
 include/drm/drm_mipi_dsi.h                         |   2 +
 7 files changed, 792 insertions(+), 16 deletions(-)
---
base-commit: 6654f8f33aa6229a90d4401519a62a2bf96cb851
change-id: 20260521-sm8650-7-1-bonded-dsi-7a7d5b70f687

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

