Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335517;
	b=wM3TJPvsiTv7+AgoSFqVEOvrcq7Pbu/8yZNYCGeeat12Hm3wUE5iRl4yBn+b+fyNu+BA
	 vVf/oh6X+hWKNimU+WW1Q6SvbZk6W98At7zonFWyeJ26MjNm56lHF94DBS1q6pjWTP2a2
	 vOtdpdOgX1QXqykIl4iiFhECsWg+qBlkHGNHt7YefL1OXSeXut5flqaK24Nqy+aT67EHb
	 AaDzAQK7mtxTFuDhj739L+VxqbtKyPIqAKug2efWYM7NxyR6X503c4gV61r9GgiI4NO79
	 WHeGeEfHTpWdqz87/X4a3C0XrVLaSA3t+S3nGw1OBrR5cTkkLDMEJO4TiPhD37nu3Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335517;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VhDJi21DzValv8EWmq82eR8h6wo5YimPj433Xh99oIs=;
	b=VMXSrjhw/cO8tmMPnavVpOdxTMh7uqGHJMbK7+3Zqv11aHTwn7ibBcA3BdaQVZjAZ55K
	 OSjcAR3ak8nh+c+5TnjBELpadqqSq4meFtWVpcNEon6owza0BpqOhLoUaPbFAqdAWH8Ce
	 zKLqUFLHyeI4SkhSWZ//TjPzC7sqlPvDZM97EEXHeifXykO39mi/yNz00UTAdRfmyBrjq
	 qiNMEA7Q1m979UDYCT2BeUKBbWX6J6r2LRItCfKeSuJJvpeB6ioETIH+aTqevoHWON7Vm
	 DXYSKcny4Kfr2g5KxN+5MTikI1aMsx+u3EZgwzRxOemxXRi0XXzJfv+EJZwz47nKiqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ang9tUEE;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC81A606A32A
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 08:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC81A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ang9tUEE
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d28f75d62so385864666b.0
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 00:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335515; x=1795940315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhDJi21DzValv8EWmq82eR8h6wo5YimPj433Xh99oIs=;
        b=Ang9tUEESE1Y7JdswRwqeJ4Shz9TBAytFI5i4fnoSffbFQEzUX+ptfv+xyXmMZ0H12
         pXc28yEMIvoz7bFTmDMwyn2N87lhL+rBw5r2ypHLrIZLRTpmTWoqEYwvsVrVeKottLwq
         zsPA8szwcQQo6N4tREjw5WxJWfGboQ4hx8UMioI2qDa3TFIoWTnUXbxe/nJkxU7s5trL
         /KNqjgTUBAb3y2xCkOOiWlnE6D7U1gPr7XzhSIg6isaQX1RzqU8HCUf2b1wZpMazQ7MQ
         gNMs/SVL2GXjcDpxeV0o/oy5hOeQyOTkArhHpI5AG2q+lXcQLeZVUCvBk0g40dyyaMx7
         87nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335515; x=1795940315;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhDJi21DzValv8EWmq82eR8h6wo5YimPj433Xh99oIs=;
        b=RwD/ZpMwwetkji4x4EjQ+dUwYpEJU2HWAIvPjfgTkgVh70m7DPVDIpcYM5NYhfvLIg
         LwygHNWPkCBWNwIh+q80jSriC1fXYQ8fY6KcDofhXDBG8tEv4tsIA05uoKmIsyveSL5j
         V/pDzzR397QjeExjUzHcQzv86gMYw3Zgx5gQ7tr48WZffxQOFD1K08AlV4AEVFXd3vPC
         iaIPYnxD0JmKXvatNOYIyrFSpRE5jcgSepSPtZLCFYoytWSph5Ey8dT5ven4zFNfg79R
         SFoARE8kW1ET/gf0j7DBt9/7MQPbWPzJEbw5zBRvqcmgc298VbJo58R8HAXQdROSx6Ga
         XlSg==
X-Forwarded-Encrypted: i=1; AL+hErH8BEUYXCgTU3Gl6k8FP48C3DbP78JTAfMpYqzzWKgTmxl22ksHy8GFCAZgF/KgQ7lqeRBzXGh4KbhH@vger.kernel.org
X-Gm-Message-State: APuU4Z/EWXXZfLxke3sGmJtmNnCjBPOZp9PTVVmXHGcch6prsYMmSKg9
	DzMMXSa+r5FMzPtgSrv1W1jKAyenDW6HNRkHlGzb5PTB81kA7JUWNWA+
X-Gm-Gg: AZFdTZcAtadd4Wtt2tZW12JYjOPye8oYuIzu4Ev0NZ65xMRJMx7L+ZRXfmfF25GPGEf
	qtvUV6hY+RTPi9YrFrCxUPgxs3BCM/XLaQBTvQ2pg6AKPrN9YbfY60s57HBwfiH7d+ZXXj6/mZJ
	AgFdcSo+nPOGBjuigoMUxTbWVEhTu1ccKJcr1pMfayJu0md3Fr9iFAAkKXudwi47IjQwDwc8Ro+
	/GeDoadf6Goa9UheOromNMJW9iIfdZBhFRcknj8WmRHWo8Bzdp4RogYDVA4dgtTDRkOPhdsCg/J
	Un6GszqE8lGemNwj8a4ZD0Gi6+SJW2w8PHtROq6sWrvWQP/pqslUYYxyJAjBnnuDEhBI/r/oo8m
	0ERw9ZCx7+ZgQfgzHLh/dpdiwVNcakGofvpIWVA/e0DxYrKUXlvY75aE5C9RIgzWll10NdO+XGa
	x2t2QOI9tcJ9Ue9EoC1m+30G5wHihQ6MYfbPgZxzsIFTera3b3DAkmTShS1N2yJw87Pr4QZ7FKq
	6bR/3j5BHajRYRa6moa/GtKGM0XmnTAfvIqU51/fug5VWWXLXPdup6lBDWKyl8k9puCH42vonkv
	jt71r5R6lkyyhPSeaCL3wOlG4LOgQeUqZFmGzIzsY9Hn8UEH6qwsCLvquhs3XH+DXtu6KPg+Kfa
	wFIh7oooD8Q==
X-Received: by 2002:aa7:cd65:0:b0:6b5:823f:3462 with SMTP id 4fb4d7f45d1cf-6ba37e83f29mr3868790a12.19.1795335515150;
        Sun, 22 Nov 2026 00:18:35 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:33 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 00/12] drm/tegra: Add support for Tegra20/Tegra30 8-bit CPU interface
Date: Sun, 22 Nov 2026 10:18:08 +0200
Message-ID: <20261122081820.53199-1-clamor95@gmail.com>
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

Changes in v6:
- improved descriptions of new framework
- mipi dbi bus commit authorship was changed with Mikko's permission
- panel commits swapped with mipi dbi panel conversion commits
- fixed tegra_output_probe() for hdmi
- added CONFIG_DRM_MIPI_DBI select into CONFIG_DRM_TEGRA
- devm_drm_bridge_add() moved into bridge probe to avoid possible issues with
  deferred panel probing
- setting LDC pin to V Pulse 1 moved before GPIO pin reconfiguration
- DC_CMD_STATE_ACCESS is set to read and write in tegra_dbi_atomic_disable()
- platform_driver_register() does not error out if driver is registered

Changes in v7:
- reduce changes in the panels when converting to mipi dbi
- dropped of_node_get() in devm_mipi_dbi_device_register
- remove enable()/disable() operations and add prep prev bridge flag
- drop add DC header changes, add only strictly needed by the dbi
- dropped tegra_dbi_iface and reg_entry enums
- dropped reg from struct tegra_dbi_priv, com_pin_backup converted to u32
- interface dropped from struct tegra_dbi_interface and init call added
- BIT macro converted to PIN_UNMASK in the tegra_dbi_pin_set()
- init functions and tegra_dbi_interface structure moved before probe
- tegra_dbi_atomic_enable() split into pre_enable() and enable() phases
  to squeeze interface into existing framework
- DC_CMD_STATE_ACCESS and setting active true moved into init functions
- reg reading moved before bridge allocation
- reg renamed to nvidia,interface

Changes in v8:
- return of_node_get() in devm_mipi_dbi_device_register
- add mipi_dbi_write_buffer_multi() and mipi_dbi_write_seq_multi()
- remove return doc from void function
- replace disable() removal in panel with mipi_dbi_write_seq_multi() conversion
- removed of_node_get() in tegra_dc_dbi_probe() for dbi node
- switch to drm_bridge_clear_and_put() in tegra_dbi_host_detach()
- add check if DC is idle before reconfiguring pins
- restored original tegra_dbi_atomic_disable() operation from v5
---

Svyatoslav Ryhel (12):
  drm: Add MIPI DBI bus support for MIPI DBI Type A and B
  drm/panel: panel-hitachi-tx10d07vm0baa: Convert to use MIPI DBI bus
  drm/panel: panel-hitachi-tx10d07vm0baa: Convert to
    mipi_dbi_write_seq_multi()
  drm/panel: panel-lg-lh400wv3: Convert to use MIPI DBI bus
  drm/panel: panel-lg-lh400wv3: Convert to mipi_dbi_write_seq_multi()
  drm/tegra: dc: Add elements required by Tegra MIPI DBI
  dt-bindings: display: tegra: Document Tegra20 DSI port
  drm/tegra: output: Make panel parsing configurable
  drm/tegra: Convert to use atomic versions of drm_encoder_helper_funcs
  drm/tegra: rgb: Parameterize configuration based on bus flags
  dt-bindings: display: tegra: Document 8-bit CPU parallel interface
  drm/tegra: Add support for 8-bit CPU interface

 .../display/tegra/nvidia,tegra20-dbi.yaml     | 108 ++++
 .../display/tegra/nvidia,tegra20-dc.yaml      |  15 +
 .../display/tegra/nvidia,tegra20-dsi.yaml     |   6 +
 drivers/gpu/drm/Makefile                      |   2 +-
 drivers/gpu/drm/drm_mipi_dbi_bus.c            | 287 +++++++++
 .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 234 ++++---
 drivers/gpu/drm/panel/panel-lg-lh400wv3.c     | 114 ++--
 drivers/gpu/drm/tegra/Kconfig                 |   1 +
 drivers/gpu/drm/tegra/Makefile                |   1 +
 drivers/gpu/drm/tegra/dbi.c                   | 592 ++++++++++++++++++
 drivers/gpu/drm/tegra/dc.c                    |   4 +
 drivers/gpu/drm/tegra/dc.h                    | 197 +++++-
 drivers/gpu/drm/tegra/drm.h                   |   2 +-
 drivers/gpu/drm/tegra/dsi.c                   |  22 +-
 drivers/gpu/drm/tegra/hdmi.c                  |  22 +-
 drivers/gpu/drm/tegra/output.c                |  52 +-
 drivers/gpu/drm/tegra/rgb.c                   |  64 +-
 drivers/gpu/drm/tegra/sor.c                   |  20 +-
 include/drm/drm_mipi_dbi_bus.h                | 148 +++++
 19 files changed, 1638 insertions(+), 253 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dbi.yaml
 create mode 100644 drivers/gpu/drm/drm_mipi_dbi_bus.c
 create mode 100644 drivers/gpu/drm/tegra/dbi.c
 create mode 100644 include/drm/drm_mipi_dbi_bus.h

-- 
2.53.0

