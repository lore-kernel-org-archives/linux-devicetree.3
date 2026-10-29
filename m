Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287773;
	b=u0omgzgaPMz3HQWp1g1TGsBjr76mgUjcTu8lI1c8uuDKGQxkd+d6OzjNq9LKsFfE/D1s
	 1Xi7uH/NoRJurVY0a+XGnWoy5s4cFWn18sSwQqaOXWkednH6ky/5C9RJD2Y1fXvIxzjmn
	 N/4WCjoSYiVzM4Ly9BXqVOlpz6Hsunx0THAZj516JMKjYs69cv9ZYIcpbiroUC7I6JKTr
	 bbetiv/JzEmEaz0CuVaYpogEsc4A1Mx0QMFCSMe2VzX84bRl0A+IHDoMjNF4xQ9vGln6j
	 Uqn+zgmL9NSmQbMQZCpP3XPw3OADRAMoxWDCXMd/s+x6nMzH1te3mxb9PIJsjNa1S6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Xz/KjQxYIkaGqYRbTjczSZcjaGYHruf6qA2IzRiuJ9c=;
	b=5Y1RnEkN5FECx91YTdWiIiuOpKMQGQUMZ7raLl3ajSa6qiwEvHdT12BCIqEbjRnRU3gE
	 xTnVxJEScpPqEYt2C0Z+m7sP47UY8xj6jfmsrIBGFtZGnfJdv2WzAJMgvueum84RhQsyq
	 iq8jlpeT8QtJwS5JO27uJFf5PROI6/vi9ZyvJU6jvkpU5DGS6XfXcD4Hv6qmwLejPcgD0
	 gdjocvLV3H4Rz1V7KQtOZ3iSqIfWehOCdoLefqKy8JG76DLMig412upoAMav3qPcowp4q
	 GBoFLVo1NzddMwHkpExlU0mMXs/pPDVX0Qk3NHuEuCLiqD4z8pMzLu9jj+9gpETaB+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB09v4er;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4B0606A31E
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 15:29:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F4B0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB09v4er
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4395d31228so358299266b.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287772; x=1793892572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xz/KjQxYIkaGqYRbTjczSZcjaGYHruf6qA2IzRiuJ9c=;
        b=PB09v4er9319DUGcwBCws35Y5clXWQvxxyJ316DSeQU0JO1Wm7RuiV9vRNgRNThyF+
         s9w7f4beT2W0HSldAuNBEEzN416IRQNsFHbP3LbWeYz0M/mEIi2IRCGjUWYwxYMxvxKW
         ztw9+frsAAU4baJMoV83eH7pWxcmMdKZYb4t/fhqrFrI7knWpHhigDtQ1fvZrAatyXdD
         WATr83IGprMp5UflmNUjAt/3BRfkzDOyTMwV4aYxx7MMecOC6LW96fXjdVo1OlPMn3wS
         DSMmACwKyJ3yU9YPhlPiF6l5zgbpYAJqQyqKzQthitf11lc/sPF6Pqj0A2d7L/Dl3sPR
         Wk4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287772; x=1793892572;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz/KjQxYIkaGqYRbTjczSZcjaGYHruf6qA2IzRiuJ9c=;
        b=w+zCWSSKz7PfVUyXMo7C55q0OuCQCh93rXNUDuqJrjkYrPg1KDWy1fZ/f1LufEHrje
         t06KRzZDz/d8vxHqb90uL/aL5xAJcVTSnUDobRaNDzybYaO0YeUsaU4U1uSvfqHCJ1VR
         N2V7aGiDeyPu/4Az5ZduqxV+64uSNDuxxFZ6jHyK8P6O2jYCvbRArCJ//6XL1o1MwLAu
         JelfzDOBylPTl3YtqQ5gnuY5fzX6lK32edbL+sG70V1Qc2IkpmVwVTifv51xD/uoUalu
         q6u0glRMspdtZURo2djSlcPfN4wgZmk4Vd0B2AjyNe9PB/jMZYD04eteCUH/XS7mTraG
         6nwA==
X-Forwarded-Encrypted: i=1; AKwUvBx6SkDuF07LB2lNfHqUYqxUkCB/V0Mk8RqXrx2a2vrAFs7WVxTBqzTPNT7Z8LeYQe0zR7UYJxBHXiL7@vger.kernel.org
X-Gm-Message-State: AFq9FYKfn0uhz3MfpH9KfRpr4PG2Au7A5nBkPw3Zu/41FgEgfXYZmPNX
	CyIHrhTcguJjcXULRxjGbpm4FnCrtHgm988xl6R+igJeC2iiuUZVopGQ
X-Gm-Gg: AYBFou1q5m/HG8JEYQIsXZyHoiBnkD8XZiqSeIY+czewIjgtXWWAthypH7J/moSezDl
	D/tpyVFEnXlZGoeNoMDALkybHQ+tvBRxNhFCWQ80WOA4AI+0fSE64CsgYLNeXbFcMGprzhfmLzP
	GySbEHUJHx1gWT2mpAiPSKZ/+VfCrCtiH6Ad7Vjq4nfRA8dkU8YK3SYJNdZQCqsvV2chjf67Iaq
	LOz1hu/uz+6AYnXle2YTLZzDuodWBcMV4VGguugvPx12vNJgW26J8aSbgOjbl7AvD3syGvMV/CN
	s95IoU8FBPPYSxodw6iSiMukdC3dV7Dip6LEpFcspGT24cAZekj8wWqSldZhW6WsJpmTzYz+NDU
	j//zDsZmdsrym9SO17YaW3X1DBkei/Z+C0bnRXCCZrtgnUXgPWeVfiq7IeEjAlRkL3Y6G9JD/Na
	zUZWQ23zDsYbdE05SAxLabFBNuXMgfMcxgSaC7vq9sPnCRtBG+tbOOEcmUuNT8kixisO1Zbnl3Z
	vCG6+mFzFTHpnkEj49uwr+hyoACAy+pdcI4TOfDbygDtqoxQyVoobdpHpeYeZ3sRLYuP8ZIQ5Qh
	LZAcQ/59pLGgqQCiqbeCKfSye1w2aCrGjc2wBuaoveNR54ehqQ==
X-Received: by 2002:a17:907:a88e:b0:c40:36ca:9d1b with SMTP id a640c23a62f3a-c49be0398aemr530750766b.40.1793287771423;
        Thu, 29 Oct 2026 08:29:31 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:30 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
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
Subject: [PATCH v5 00/11] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Thu, 29 Oct 2026 17:28:58 +0200
Message-ID: <20261029152909.234584-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The display controller in Tegra20/30 SoCs features an 8-bit SPI interface
that closely resembles the MIPI DBI Type B protocol and is referred to as
'8-bit CPU'.

Add MIPI DBI bus support along with 2 DBI Type B panels used in
LG Optimus 2X which work with the 8-bit CPU interface.

Convert rgb, dsi, hdmi and sor to use atomic versions of
drm_encoder_helper_funcs needed for bridge state requesting.
Refactor and expand DC header. Add DC parametrization options
needed for fine tuning by bridges. Make panel parsing by
tegra_output_probe() optional and document optional DSI port. 
Add 8-bit CPU interface in form of a bridge linking to RGB port.

---
Changes in v2:
- convert enums in the dc header into definitions list
- add check in RGB if bridge_state is not NULL, if yes, use default flags
- inverted FLAG_PIXDATA_SAMPLE flag setup logic since default value is set to
  be on NEGEDGE while v1 set default to be on POSEDGE
- 8bit-cpu schema renamed to dbi, removed compaible and set as DC child
- expanded list of required properties
- 8bit-cpu bridge remodelled into dbi interface as DC child
- improve gpio handling
- rework attach to get drvdata from parent
- add panel supplies description
- split panel driver into per-panel drivers
- get DBI interface from the patent directly

I have deliberately left GPIO parsing from device tree since it seems to
be the most convenient and mainstream method of working with GPIOs.


Changes in v3:
- rgb: fix default bus_flags to match original behavior
- dbi-schema: remove compatible from required props
  remove dc@54200000 wrapper from example
  restrict dbi nodes for tegra20/tegra30 only
- dbi: remove unused idx from tegra_dbi_priv
  wrap dbi registration in dc with devm_add_action_or_reset()
  separate dbi into separate object
  export tegra_dc_commit() and trace_dc_readl()/dc_readl()

Changes in v4:
- reorder patches to avoid errors on checking dbi schema
- dbi schema renamed to nvidia,tegra20-dbi for consistency
- fix DC_DISP_V_PULSE0_POSITION_* > DC_DISP_V_PULSE1_POSITION_*
- add MODULE_ALIAS
- swap width and height in panels
- dropped use of init-sequence and gpios
- dbi driver reworked to use only DC to operate pins

Changes in v5:
- added commit modelling DBI bus (suggested by Mikko Perttunen)
- hitachi and lg panels converted to mipi_dbi_driver
- dc header refactored and completed
- added commit documenting DSI controller port
- added commit which converts drm_encoder_helper_funcs to use atomic
  enable/disable
- added commit which makes panel parsing in tegra_output_probe() optional
- dbi command/data converted to enum
- dc com pins are now backed up into drivers private structure
- magic numbers replaced with pin defines
- dropped tegra_dc_readl() from tegra_dbi_pin_set
- tegra_dbi_pin_set() accepts boolean third argument
- tegra_dbi_write() second argument converted to use tegra_dbi_dc_signal enum
- used field_get() to extract pin value
- extended comment regarding init sequence
- nvidia,index > generic reg property
- adjusted tegra_dbi_atomic_enable() to properly handle shadowed registers
- switched to use of_drm_get_bridge_by_endpoint() since panels are auto-wrapped
  into bridge now
- added support for mipi_dbi_host_ops
- added resource managed helper to register DBI device and provided to DC via
  header
- dbi.o built with all other tegra drm files
---

Mikko Perttunen (1):
  drm: Add MIPI DBI bus support

Svyatoslav Ryhel (10):
  dt-bindings: display: panel: Document Hitachi TX10D07VM0BAA and LG
    LH400WV3 panels
  drm/panel: Add Hitachi TX10D07VM0BAA MIPI DBI Type B panel driver
  drm/panel: Add LG LH400WV3-SD04 MIPI DBI Type B panel driver
  drm/tegra: dc: Refactor and expand header
  dt-bindings: display: tegra: Document Tegra20 DSI port
  drm/tegra: Make panel parsing by tegra_output_probe() optional
  drm/tegra: Convert to use atomic versions of drm_encoder_helper_funcs
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface

 .../display/panel/hit,tx10d07vm0baa.yaml      |  58 ++
 .../display/tegra/nvidia,tegra20-dbi.yaml     | 113 +++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  22 +
 .../display/tegra/nvidia,tegra20-dsi.yaml     |   6 +
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/drm_mipi_dbi_bus.c            | 232 +++++
 drivers/gpu/drm/panel/Kconfig                 |  27 +
 drivers/gpu/drm/panel/Makefile                |   2 +
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 294 ++++++
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     | 233 +++++
 drivers/gpu/drm/tegra/Makefile                |   1 +
 drivers/gpu/drm/tegra/dbi.c                   | 632 +++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |  15 +-
 drivers/gpu/drm/tegra/dc.h                    | 859 +++++++++++-------
 drivers/gpu/drm/tegra/drm.h                   |   2 +-
 drivers/gpu/drm/tegra/dsi.c                   |  22 +-
 drivers/gpu/drm/tegra/hdmi.c                  |  22 +-
 drivers/gpu/drm/tegra/output.c                |  52 +-
 drivers/gpu/drm/tegra/rgb.c                   |  72 +-
 drivers/gpu/drm/tegra/sor.c                   |  20 +-
 include/drm/drm_mipi_dbi_bus.h                | 103 +++
 21 files changed, 2372 insertions(+), 417 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/panel/hit,tx10d07vm0baa.yaml
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
 create mode 100644 drivers/gpu/drm/drm_mipi_dbi_bus.c
 create mode 100644 drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
 create mode 100644 drivers/gpu/drm/panel/panel-lg-lh400wv3.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c
 create mode 100644 include/drm/drm_mipi_dbi_bus.h

-- 
2.53.0

