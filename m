Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFD73DA7E3
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 08:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139748; cv=none; b=mbdm79FtKbMbR4at48jlqOx2KogcnTQOmnZW3DA1wRpRqGYqOSU6D0TI+x+s5tGsKFI4AloYIS8VU5yEwRsSTHTDR3PZgD1h69J651E448Cnvs27W1+wz7C+6zKDI2o+1bL5UY+z7ewBXY3tOmjmQebub1Iz7Wrs2RvbjVZftbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139748; c=relaxed/simple;
	bh=o+0VBZGZpUXbU+6zVjhJ8wUMQVpyFOeluaJKjWJ7TDQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tT9Pfxf5EFq7iuRdi0VHar65j+TwrPY6Wk84c46ps1UQRzJ2PoRMy7wwpMq4aHT0xu5RmHUyOPgpAVz0NN2//PuuTm70zcLd6t8aZfrziRL96DCmaKY7GjuMEozEU/NM+g26kj/AZjOgRtujkp0ov4bOySi7c9zMbVnnCKfh96Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oQBzvxjJ; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oQBzvxjJ"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-84e0688b859so1354454b3a.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 01:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785139746; x=1785744546; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5lOIBQB+cpFjp6D6aOc1DsVhI/qzX8t4m07LpbMLmU0=;
        b=oQBzvxjJmADkc7FMbDcpU0dFTxJYDRCo+FcQoW5VrrGlP3gi3EVYSz/CAJtyg3xvyt
         kZjCZZ/mjIHM1lIrfItspbwVmBlIz1hAy7egprSE+PNnq8RF2zNqh+2K7uWBHK5CoswW
         QqDxVHHABiZ7F8avkjwpWXwqbfDCo+wVcQvvXip8VFwJjGoWyEy0MPwmeqD1km03o7hS
         4i2Bh/nKua0+iqG1J6ELbVl+Kj21j763OA+vYdaoDigw+AZ6JEW5mbABEPlXrhuue/Y1
         MqLWJPg5kJCUP7xXAtct2vYhT+qwTuD3+KAgc18Mj7M/y0fS/m4HXtyhSj26opg7OIn/
         KqoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785139746; x=1785744546;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5lOIBQB+cpFjp6D6aOc1DsVhI/qzX8t4m07LpbMLmU0=;
        b=pXtMeEAWApmQKIYpcIEEzO1FVwA+BDp1gkXO/qJe0+Uq9PwWewb/TWZ7L0hNsFdGh2
         JdhARAo+jvc1VJDvzCs6IsGbe67Bfez8bVWYoi0tMi8Aopm2VDixraZQRvt9+KQD9AfR
         L3p5+D86RRpWcnHYJIhHr3nJ9XixVjJbideCX2Ane+YOy1KjKrprztg9+eLDSof4uQfi
         uzviXotN2+VqnjRfT6a09vxlNWw3vJzmEUL5IPvtVnNvus5Q78fYebvp802AmLTPP2ZQ
         vl3rkkm2ebyDdIrA8pemqm9xNuPGX/UiB2kQSv9aNaRnFwo8jscaACncKrBxu1YEBdYw
         52/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrr3XL6fcQGxpjcDbgRpSi0G97a5tw6qKJ4cE+4AVIEjltpw+hsT32wz3b0L64Bc6prmBUNPns+rKsB@vger.kernel.org
X-Gm-Message-State: AOJu0YxA2uiFtX2DbgTAOZaHDYYsZ6pT1SJM8qj4CyMRmaNic8eTgB/T
	R0uB8hCJKPSnFIKYGU57ol242h5hurXTfo1JBcKnB8ajPuurhv+5E31RKYP5WCMEFR4=
X-Gm-Gg: AR+sD12fO4QEp7YzDXXaD0JVvqt+0nj03x0D3XOJe3fTaBRwq2blRRK+qh/RlOivUOw
	WeIbkS78+jRtoIGxhQRuSdG6y8Fc75Skn6Sz00K0bCW3URcrhae1sWNpT9+YCyXyUhjR/7k7ZIG
	dYb5hWBXqLewFzkl2J2AzjivLNMErR/LgWLdSGJT62qxM2EW+tlQSRpvBd+nfgEi4CdPIhxUbj0
	X1yy//RJmVe6TBbx/7uWOyeZwtbrGopET5FM8jfATZDDimojLPBsVoBMszZ/veBlXMFStjhm92l
	YXpky+oguBctTbRjKguN0gYtkU/BQg+c7xU+fm2lH+15Q87o5oNqRRBbtvvulyLiawJ4eWnb2Cr
	b5OKVjDcpH69OZ1IpWboXoKM93N9VICYsUqL7kBOdPLXEPGsSYXQXtkNeOljmSKsYXhlw3knUam
	8rJw==
X-Received: by 2002:a05:6a00:a889:b0:848:3dae:66e2 with SMTP id d2e1a72fcca58-84e594483a9mr5962215b3a.26.1785139746420;
        Mon, 27 Jul 2026 01:09:06 -0700 (PDT)
Received: from [127.0.1.1] ([116.237.168.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5344e577sm2630658b3a.58.2026.07.27.01.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 01:09:06 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v5 0/6] Add support to 2 panels in bonded-DSI mode
Date: Mon, 27 Jul 2026 16:08:39 +0800
Message-Id: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAcSZ2oC/4WNQQ6CMBBFr0Jm7ZiBUEpceQ/CojgDTKKtaQ3Rk
 N7dygVcvpf893dIElUSXKodomyaNPgC5lTBbXV+EVQuDA01HZmmxvToO0NoscYpeBZGTorWWTa
 TpbnrLZTtM8qs76M7jIVXTa8QP8fN1v7sv+LWIqFrmY1Qb2iur3f1LoZziAuMOecvMKQuZrsAA
 AA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785139738; l=3282;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=o+0VBZGZpUXbU+6zVjhJ8wUMQVpyFOeluaJKjWJ7TDQ=;
 b=sIrxg75P//yvScd7tBPPu7ciNJByr6dNug1y7gdFARHoomw3+5tOcT2zAuODE7BR9r4tP/p/C
 cbr/QMz6Af1B/NGuDzPbSRwSigk0kO38yF4+9rETSgn7DgX2bguVlx3
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The 2 DSI interfaces may be connected to 2 independent panels in bonded-DSI
mode. Horizontal timing and DSC configuration are adjusted per individual
panel in DSI host side. Support to multiple slice per packet is added for
the device setup to test the usage case. A panel driver is included as an
use case example.

Changes vs v4:
- Add git commit message to clarify dual_panel member of mipi_dsi_device does
  not force panel to handle panel topology if panel driver does not intend to
   support dual panels.
- Add git commit message to clarify dsc->pic_width does not impact crtc
  configuration.
- Clear dsc parameter of dsi host to handle non-DSC case.
- Fix device tree document and pass "make dt_binding_check"
- Remove unrelated platform dts nodes in panel device tree document.
- Fix regulator resource release sequence and device leak on failure.
- Fix possible unalignment of DSC pps buffer usage.
- Link to v4: https://lore.kernel.org/r/20260521-sm8650-7-1-bonded-dsi-v4-0-a4dd5e0850f1@linaro.org

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
---
Jun Nie (6):
      dt-bindings: display: panel: Modify reset gpio number constrain
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
      drm/mipi-dsi: Add flag to support dual-panel configurations
      drm/msm/dsi: Support dual panel use case with single CRTC
      dt-bindings: display: Add Synaptics R63455 panel support
      drm/panel: Add driver for Synaptics R63455 DSI panel

 .../bindings/display/panel/panel-common.yaml       |   2 +-
 .../bindings/display/panel/synaptics,r63455.yaml   | 133 +++++
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  37 +-
 drivers/gpu/drm/panel/Kconfig                      |  11 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-synaptics-r63455.c     | 644 +++++++++++++++++++++
 include/drm/display/drm_dsc.h                      |   7 +
 include/drm/drm_mipi_dsi.h                         |   2 +
 8 files changed, 820 insertions(+), 17 deletions(-)
---
base-commit: 6654f8f33aa6229a90d4401519a62a2bf96cb851
change-id: 20260521-sm8650-7-1-bonded-dsi-7a7d5b70f687

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

