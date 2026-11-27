Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795745299;
	b=rXy07uT9JSjvnS3jCuENoA8OasbNHKvIaAudmtCrkujd8GcHnsHpOtYc2vPc7LxqX3Cg
	 cxbdPJfY+yd2i18slkEOtcSqXn6Nz6MKCoKupGHW5TEe0vkU88nTwIVqZD2Ado8GHDQTT
	 F7jom4GUjx9Q0rPABhcrzkdzdJd/gcz03tCfraiUsdTycPrqjs+R2fjvyi+HRzeBUANgC
	 JFlROuRIAiIKaiXcxwEn39X9jsvbS235zabu96OYbpskbvzFVH2Z/eLoPbox2IAh9KGyy
	 FCKq7toVNsAfCx52zZVqL8v7Nl+3EVsXh45QjP6MB1NMp05xIoWdhva8xrioyoioeHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795745299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w4DH6C+tDE1JFdLKzQpNer3JwD5m/dqh3XkJoVpVm9Y=;
	b=zQHB8IFuHWCg3Rxs8HdV57EFdigBcb+JOlzqIf5nsEzirqlOarIneQ2n2KHZMYBkYPAW
	 2cdnwExRXLR0e9tc7KR9o7QD7WhpaG1FHmUvikfsDi7KTuAYSF3k4hkM7VnBT9adoEyVN
	 iYTDDeaEMgQO5GqLNjB+j/kgDl0wnYh+mIeZT3+xytzTVXVk+uAk9LjokZmQidfTJ9zOZ
	 gJg2D0fDkTRGjmrJiAs3GBGco++r77NG8ZOaEdgQdR/UMx6KALxdEA1lbvWO/AZey0llP
	 pjI9jIxd1RQawP8wOXSGHnpu0xdxkd/M36HODI4iXbNmhF0qkfzJMdMB5e1xR3SF6yQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXq3xfXb;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79FA606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 02:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E79FA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RXq3xfXb
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so5121689f8f.3
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 18:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745297; x=1796350097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w4DH6C+tDE1JFdLKzQpNer3JwD5m/dqh3XkJoVpVm9Y=;
        b=RXq3xfXbLsHrng8ypROZemCGGWcz1RcTZE0uVU9BI3OuZtL7mBbhAsjo7FfyIjEV9n
         dvvI9nETqV06MMIkGFKuParUyky/vprdTb42rT/lApYHBtXXc4QPTtJ4UMfyrD9YoM0u
         6e+9FyFPPRPa3Eu9SfzVm+bhfCkkhvpOaeb4Nx7KpBeArlxeh8sfJYP5xQnf0afwKRM+
         fzq6j8VzNDEbyz6KFtsyeytoperc91SdmgcCKKP7BghOif3NpzgGbDUY2ckuj3GbDOf3
         I10EJXEvwr7HhiXKKmR+V2p5I6e1t6UL+lL/hggoCotZGlp9ukFJmA361zV5joYNv87i
         UtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745297; x=1796350097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w4DH6C+tDE1JFdLKzQpNer3JwD5m/dqh3XkJoVpVm9Y=;
        b=EFs/vFZJjRmjWS8xb5GBi0CgmvUZ01mNGOKz0bzdQXDjHb6Yc/T1Fwk59Al5QIapEz
         vPfCPRzqIeYI0XSeP5M0x/RJPFFJV7mxRY2Y+dQPmHwLE2xFhMtG5yCeRn5tPXgGQx5z
         YeS/HYRLY/XIOG3XvjKSxwX+Tf1+GtGCtpTRPqu6XweNgmjwTBlzKAYBm/LDGkWCoMhd
         A3YlAGFY/7k9RWx3Zdx5INRmZSXMaPJ/HzV7N/a8hUhCrV5y4GcUamiyb4ohfXZOydAJ
         vSQ2/uDoRCKrqRZrt12HlLx6XGx70yhpvz3p2yNg6BH/gFLRRkQfJv96r9OUUYY56HQQ
         ltFg==
X-Forwarded-Encrypted: i=1; AL+hErE8x+HGX4g9fJv01WyCpjn6QglxvycwNW/t/QPx2iOBF44uZ6kPUnb0T8K2n5f9t7jjDoCHPytdHTHh@vger.kernel.org
X-Gm-Message-State: APuU4Z+URmtffFyECOvBXObyGe1keXZiQSs2QNU2bTwdgxkojfh/QtTB
	tswPyRiKxDBJp/Zm8XA26skkj/6d5DFGGPcObW/DpnrHXzjC+2fXFo/o
X-Gm-Gg: AZFdTZeJqAN+tsxG/uuv6ZiZgq9ynRo4JI46WkeLQinNbH/7K/gHTTN46YBUZwZO3z+
	RxYR/J5AUGJCIlbo9y0PIttrsh8YPIcrgg+KJAAcvt3BBddFpQgT/pmxU2t2cZfC6V7moqfisNU
	knaZFPcrPt00TzDyofJW32RRIbvvqFhIf1Od27fX+69rJnMukwWdhMLrWF8X3GrAkktf2fz9rgt
	53zkJ3lQ0Zp4RlbsIOOxl4VQSdxKQhzZP8gjUlNhb+yZ4BvuLm5MVIpmIupxKBEDDFCZgoXzp8i
	WrormB6L91ZCX5MoCrSd03H/Zr/gnfCvcILst3daoXXEfyHvU36SO27EIaJ/hT+0nCzdTXamExV
	K8TWFZwALd8vPO2GG9RTsCxkvow1ItbTc9RjtbNwX6z169Zq74z2ik11r4Jo8c9GSxVRJ87AjeM
	Q+8mGINMXiy4g3Dry+Z8IlHb52geF3y37xrOwQgE0/4f460VpPGcNO3Cltc+MD6f0YKFbIIqjVM
	GmhNoqmouwyAQKgBnWm64wfTOnMEToLk49axihufo1rI4ciTd3ffeuqtSooRMRsA4mCDkG1m6n3
	VWLVehZ8I5euCXSSH3cA5blZBQxWNmwOy0YdPBsYxF6FzvFUP2AWE6JXrzIng0M8UWzBG4Nw1//
	epMSSV49oO5X6GJWtEvz0uGtuvkcljzDnIOUqydbdhIfOQQ==
X-Received: by 2002:a05:6000:1863:b0:48d:b940:af7a with SMTP id ffacd0b85a97d-4abb665167bmr54566966f8f.55.1795745297215;
        Thu, 26 Nov 2026 18:08:17 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:1432:1241:93b7:7b4b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa3882sm43390844f8f.49.2026.11.26.18.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:08:16 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH 0/4] drm/panel: st7701: add the Miyoo A30 panel
Date: Fri, 27 Nov 2026 03:08:11 +0100
Message-ID: <20261127020815.1621790-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The Miyoo A30 is an Allwinner A33 handheld with a 480x640 2-lane
MIPI-DSI panel driven by a Sitronix ST7701S.

Its stock init table doesn't fit the encoding st7701_init_sequence()
derives from the panel descriptor, and the panel doesn't work in the
burst mode the driver always uses. Patch 3 adds two optional descriptor
fields for that, a complete init sequence and the DSI mode flags; the
existing panels set neither and are unchanged. Patch 4 adds the panel,
patch 2 its compatible.

Patch 1 does for sitronix,st7701 what commit 2f50e0a0f9d3
("dt-bindings: display: panel: Make DSI panels port optional") did for
the other DSI panel bindings: the port becomes optional, and stays
required for the panel with an RGB input set up over SPI. The Allwinner
sun6i DSI host links its panel as a child node and has no output port.

The board devicetree will be sent to the sunxi tree separately.

Testing: each patch built with W=1 for arm (multi_v7_defconfig,
DRM_PANEL_SITRONIX_ST7701=y and =m) and arm64 (defconfig, =m), no
warnings; dt_binding_check clean for sitronix,st7701.yaml. Tested on a
Miyoo A30 on 6.18.54 and again on 7.3.1 with the same driver change
(A33 sun6i DSI): the panel comes up with a stable picture and correct
colours. The other
panels of the driver were not tested on hardware.

checkpatch --strict reports "Alignment should match open parenthesis"
for the continuation lines of the init table: they follow the style of
the existing tables in the driver (46 such checks in the current file).

Tool disclosure: this series was prepared with Claude Opus 5.5
(Anthropic) as a coding assistant, in an interactive session: it
extracted the stock init table, wrote the code, the split and the
messages. I reviewed and understand it, and tested it as described.

Romain TISSERAND (4):
  dt-bindings: display: panel: sitronix,st7701: make the port optional
    for DSI
  dt-bindings: display: panel: sitronix,st7701: add the Miyoo A30 panel
  drm/panel: st7701: let a panel provide its own init sequence and DSI
    flags
  drm/panel: st7701: add the Miyoo A30 panel

 .../display/panel/sitronix,st7701.yaml        |  13 +-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 115 +++++++++++++++++-
 2 files changed, 122 insertions(+), 6 deletions(-)


base-commit: 53063c88338aa6125d43a7ce3ff1e0cf5066bad1
-- 
2.43.0

