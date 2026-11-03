Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793738828;
	b=l+36uXWVNz6RcFs+17CErXQBo5SKxl6QzDFNrXYS0NGCTwymEV+50xcozd1hulyBV7+e
	 Pg7PZA2/8GY8gsjzjq0ENzncvFjKBVZZNJPum8HTj1IBOsEYJzFZHDsTeOJ73KUrrFDFD
	 QuAsvrqppFTjZ5DXuun26Zq1TK08U43R2QLmR8yjzovA2oNRjlqDSAdWjRv6C8AfULEaV
	 LYur1MgROTsUksHf71en8vUeCnHj2I1vv01lBhRfwvdgfRliv7HahFP5E2caqL7xciHWU
	 7WZJdLuYS6lcc6deO2w7j252E19n6Y1koFVVLJB99BFFAgF8bvmLHEX5ymbVZVdxB1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793738828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=UNLZOB7RlMn7c8blD1Uiiei/dC7dkvXjaLxBgJvaSyg=;
	b=1DOQ6NQwLdO/hl+kNixJBSDEo4YSLyDMLjiyW+rw2tBuHMN1TCHZB7Ah1kNIRDI26B8u
	 RYMdt5K73s/O4aYWG3PDqPCAXSTk8TyB5bK/5x7rSMj0n+kCb0z41qdaNawOwcczovo9j
	 AAuSVVc63Q1BQurkAudPXqwDr3w/Sz6nqo8f1GDjHMnihVC6GoXLJhmK6eFBReYsB74R0
	 jWYp8WMOVBj3bezDoRRRXDFfl1o1R1L3zRVE5IBxY/yXzz+abxgD/da09hOPZKzIwSONq
	 O54BKTpuiY67tUPuijOQ+AfBa+HWEef8dOKJCec3gLvpywi1x/xQxE+FiEbx2puw/ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4SnkvTi;
	arc=none smtp.remote-ip=209.85.221.171
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51798606A326
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 20:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51798606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w4SnkvTi
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5eafb65e163so2482652e0c.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 12:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793738827; x=1794343627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UNLZOB7RlMn7c8blD1Uiiei/dC7dkvXjaLxBgJvaSyg=;
        b=w4SnkvTiPR82rsjnRiSEKqqfk2WWGc+5HDeLU6GwCPCxs36CkuTHC+xHdljimNvv02
         NGLXGRl9GlnDgqH1rhjyHkr6aFxV8VvnFArSp6JtsLr5Lem/HvFYHEQgxpy7wSI/VlHP
         IjQWqxVuG+XzXiCEP+0RY07fIKgA0Ani69hQlXbpqH5usIe488i7rqmpVCSTeCT36q/o
         acLn33lKR2P4iu8TNe7z+/NO/lirISCHMT1Yfp1Kiua/WphLO08yDd6C2+fC8OCIae1w
         aCmYmwsOGBabwGJAH3PmNyO6uED7Qh3Bhz8MaSk7ptcqvFN8w+VQckNFtPTNMotllhpC
         ZL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793738827; x=1794343627;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UNLZOB7RlMn7c8blD1Uiiei/dC7dkvXjaLxBgJvaSyg=;
        b=dWk//yzrgJfzOCgqss0eDZveEH1zZ4cyRAxJS2ijYyKvTJRPkGmEEDMAx2FoMnpghL
         7euK8ozGKf2NFnbVraXPlm+N8JHSHtApnJcsBlSWdCEF116ThW2EXiA+dpgz5VYVBd4O
         0dLT7A081Q3ehOSBDSYokYAcSI5qNkI4AiOnwqeN9lZ3ZkLEfQbgeU0ow0y8S8bh5QzE
         F80NLI6MEzJenGKithVcpueb5jnYitmjm6Yy9dj2wJjum5Np5SI4bB6mWLQXb5YVkYit
         WQIzx/VuixWopyoScpE+6gtwegCibptTTSsShuCEaJXixHvxQR+BLc9urHIgkW0bS9y7
         aUGg==
X-Forwarded-Encrypted: i=1; AKwUvBzXKYGpX6P/2cotFFOkrpGuwvuq+VKUHgIJhfQXznPJTp8WOJJSWypsC0NaYVLDjSlxFfmtIZ0FybMy@vger.kernel.org
X-Gm-Message-State: APuU4Z/MVBsawtfIDoveZstDCttybVa2kybvU4EJAOixhYLKJEDtWPaT
	GlZormmcCbu9Mba2mXTfVJcTvnZMpsNLsICpfMivzbPEZkFePB6YlFw=
X-Gm-Gg: AYBFou0KlSKgCeau1EmODNXI7YyQ7FXOFjYtuj9y4jpQAyVF5lpErKvNpV6SOwNxIQE
	fmMANM52y7Api/3Z7CoJ/B0P4HfKgj8wdwJ4DsVsdkWbCcAaRSUNbjChPY+12lHjd1/c1g1t5dk
	jj2GHK8TAWtoXwjxTQ6JrzXWxV4PiVC9iexzEtVl7q08d5CTCZfr0R8vNavN5qU4wf8ERVN6/jY
	TTcz5/+l7lkod5PAqWpQFQ8cpv7Id4jAZvzzOOyi7ATWHhfzsIuJmEfkJ95NdAuEGSGfyvcS1Xr
	2OOM7msOc5oaDC1QGBC/mS7yF9XjtPGdZK+QTA559M35aVaHzJMntDxwoFXx2Z1TFiNJx8+P2Ex
	tfg7Lx98TqtnoVJ2m62OVquI4av1U/Lma03kVXmfVdaD70iB2tjF+DJK2bVaWQnW9SWB2SXP6zg
	bAFmqvOZP+WvpwDouNxwN7U1nwOaCVGIj6/jHodPCfhM+qlqs3RaRstK+WyEOL8K4DBBu6zL8mH
	hrw0CnU7384wvtIl2ZsQGSTl7yKBdH1GojjEdyKX/KrTIsuODaFcdhwbzofjZgIxGugC+fq20Yy
	sNlrnAMS6P+CtPTQkoA4YkS5DVo2ShLzaRkUw6unrGZrS0A3qtBvMCg6q8M04qrBY7oaIqW9SMk
	Vl7MR
X-Received: by 2002:a05:6122:328b:b0:5c7:fbb5:6ea0 with SMTP id 71dfb90a1353d-5ec68952670mr7610678e0c.4.1793738827265;
        Tue, 03 Nov 2026 12:47:07 -0800 (PST)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca89b81b3sm119618e0c.2.2026.11.03.12.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:47:06 -0800 (PST)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v6 0/3] Add support for CH1115 Controller
Date: Tue,  3 Nov 2026 17:46:50 -0300
Message-ID: <cover.1793735996.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series add support for the CH1115 Controller [1].
It is a monochrome dot matrix OLED controller that supports several
interfaces such as SPI and I2C.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

This is the first driver I write. The work is based on the driver
located at:
- drivers/gpu/drm/sitronix/st7571-i2c.c
- drivers/gpu/drm/sitronix/st7571.c

Tested with Raspberry Pi 3b+ on Linux 7.4-rc1.

Changelog:

v6:
General:
- Patch series based on 7.4-rc1
Driver:
- Fixed KConfig dependencies: added depends on MMU because of
  DRM_GEM_SHMEM_HELPER select
- Removed unused constant CH1115_MAX_PAGES.
- Removed unused ch1115 struct member pages.
- Fixed width and height checks error messages
- drm connector: use atomic_create_state and remove
  drm_atomic_helper_connector_reset: This change is because of [3]
- drm CRTC: use drm_atomic_helper_crtc_create_state and remove
  drm_atomic_helper_crtc_reset. This change is the because of [5] [6]
  [7] [8]
- Replaced devm_regmap_init(...) with devm_regmap_init_i2c(...). Deleted
  related unused code. In this driver `I2C_M_IGNORE_NAK` is not used.
  The way of communicating was carried from an old version of st7571
  driver (and me not understanding better). This change is because of
  [4].
- Early exit on failure in ch1115_encoder_atomic_enable
- Removed "CH1115_CMD_ALL_ON" in shutdown sequence. This was a
  misunderstanding of what this command did.
- Fixed Sashiko report from v5: "[High] core: uninitialized variable
  `bl` used in IS_ERR check". Apologies for this, my LSP did not
  highlight the problem and I overlooked it.
- Fixed Sashiko report from v5: "[High] drm: out-of-bounds heap read in
  ch1115_transform_xy()".
- Fixed Sashiko report from v5: "[Medium] sysfs: unprotected state
  modification on registered I2C device"
Dt-binding:
- Removed adding Chipwealth to vendor-prefixes.yml. This was added in
  commit 058ee00216a1 ("dt-bindings: vendor-prefixes: Add Chip Wealth
  Technology")
Link to v5: https://lore.kernel.org/all/cover.1790200427.git.nico.antinori.7@gmail.com/

Note: Sashiko keeps complaining that i2c transfers are called in
atomic_update callback stating that it is forbidden to call sleeping
functions there because we are in an atomic context. AFAIK this atomic
context is not that the kernel is in a non-sleepable state, but refers
to the DRM way of working by doing check -> commit. In fact, the driver
I based this driver (st7571 [9] -> [10]) and others (ssd103x) do i2c
transfer in an atomic plane update. Am I missing something?

v5:
General:
 - Patch series based on 7.3-rc1
Driver:
 - Fixed KConfig dependencies (OF and BACKLIGHT_CLASS_DEVICE)
 - Initializing baclight with backlight_properties struct
 - Moved driver from drivers/gpu/drm/chipwealth to drivers/gpu/drm/tiny
 - Fixed allocation for hwbuf if width or height are not multiple of 8.
   I was allocating less memory than needed in those cases.
 - Fixed damage rect horizontal alignment.
Link to v4: https://lore.kernel.org/all/cover.1788711082.git.nico.antinori.7@gmail.com/

Note: The last two fixes listed were pointed out by Sashiko in some
occasions but when I checked them I dismissed them for false positives
because I misunderstood them.

v4:
General:
  - Patch series based in kernel v7.3-rc1
Driver:
  - Fixed nits found by Christophe JAILLET.
  - Fixed max_width and max_height in modeset to avoid having bigger
  framebuffers than resolution.
Link to v3:  https://lore.kernel.org/all/cover.1787973729.git.nico.antinori.7@gmail.com/

v3:
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Removed "chipwealth,contrast" property (added backlight_device
    support in driver's code)
  - Renamed "chipwealth,invert" -> "chipwealth,inverted"
  - Added default value to "chipwealth,offset"
  - Removed 'status = "okay"' from example
  - Indented example with 4 spaces as stated in the documentation [2]
- In driver code:
  - Added support for backlight_device
  - Replaced drm_dev_unregister with drm_dev_unplug to cover the dt
    overlay unload case
  - Executing drm shutdown operations before turning off the display
  - Checking that the width (panel-timing.hactive) and height
    (panel-timing.vactive) parameters are greater than 0
Link to v2: https://lore.kernel.org/all/cover.1787321297.git.nico.antinori.7@gmail.com/

v2:
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Fixed linter problems
  - Replaced first_page property with offset
- In driver code:
  - Fixed dst_pitch calculation
  - Renamed file from ch1115.c to ch1115-i2c.c
  - Support flip-vertical and flip-horizontal dt properties
  - Fixed several things found by sashiko-ai
Link to v1: https://lore.kernel.org/all/cover.1786110720.git.nico.antinori.7@gmail.com/

[1] https://datasheet4u.com/download/1576606/CH1115.html
[2] https://docs.kernel.org/devicetree/bindings/writing-schema.html#annotated-example-schema
[3] https://lore.kernel.org/dri-devel/20261022-drm-no-more-connector-reset-v2-26-0b7e4e85b1e8@kernel.org/
[4] https://lore.kernel.org/dri-devel/87345ckt2n.fsf@ocarina.mail-host-address-is-not-set/
[5] https://lore.kernel.org/all/20260915-drm-no-more-crtc-reset-v5-0-bda007735748@kernel.org/
[6] https://lore.kernel.org/all/20260915-drm-no-more-crtc-reset-v5-9-bda007735748@kernel.org/
[7] https://lore.kernel.org/all/202609260122.KLDd6aW4-lkp@intel.com/
[8] https://lore.kernel.org/all/202609260545.eEm9FCKo-lkp@intel.com/
[9] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/sitronix/st7571.c#n371
[10] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/sitronix/st7571.c#n224

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  81 ++
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/tiny/Kconfig                  |  17 +
 drivers/gpu/drm/tiny/Makefile                 |   1 +
 drivers/gpu/drm/tiny/ch1115-i2c.c             | 859 ++++++++++++++++++
 5 files changed, 964 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/tiny/ch1115-i2c.c

--
2.47.3

