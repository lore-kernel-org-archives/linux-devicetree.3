Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68362EA72A
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 16:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780331525; cv=none; b=biJIN9CI7A13LpBx4iMUd2P2xCBgu6rJWoUT5vyb4GwGM1pgx9mtjlqdN9r1i2rsqZr7v0Cw/qfty+QBn/+/BTibB/3eGQdYqdLafL7KuevUuDtxLBNNmsZLFH/faeYiYjAxhaBFmHDVOfLJqRnTzo/pa52wCdlssTBer84dYr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780331525; c=relaxed/simple;
	bh=0CloNnfkLjCl5hZQ6x86YXcGrzbbsU/ps+MLR7syuf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eo8B47YY7gfsb3F5pTCXWVIzwU5UFW2UmivtCq6cOInfCPUEhSPHObkcmuVd5Mazvw0VuQfRGi4k6LY4Pi5tIbGoGGqvvfJAJaIl+JxCrwcPWh3aS1qBynVp9bvwz+vYNUEL0vbZTnH9oUS1aszwR/rts9Lq6CP8/0D98AB6YBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EMWDLNYk; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EMWDLNYk"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e6b55bf04eso1317646a34.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780331523; x=1780936323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S5wA0y5xa4moJ4rdc7wz+7I+lPNP20aj5XlTwm7Mx1g=;
        b=EMWDLNYkLsgGmeRjrUMTtgoFwzhM8rHYXNr8U7osjxHZ+klPwvlTe26HRxLcPx4CsP
         O1phIjO/w+y+1J/GHAn+7ruy/gBav6glwLTmwh2ttPOKTJ4WcSD02/P504y1Y8zQsD4x
         p2LEgIz8ggUEoWS6Y3FMUh+e5HP/OLH2si18lFuHnSL66jzs2wiuXT+zGkWWy3K8/EJs
         Sq+BZDdxZ4P7ZkIrNKugnyxjfHbtjvOuupQw5H9zvFLylDqg0UwCrIrHCd2b81vf51WE
         BzWXWi26Yz90sCObpL60+KXqjLYWmJzmYtb8C3Zn2Yvjs0IV6DLiUmWtZ3NAStni5hw+
         K1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780331523; x=1780936323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5wA0y5xa4moJ4rdc7wz+7I+lPNP20aj5XlTwm7Mx1g=;
        b=st2NuIqkRdDJ6tZFLMs9v1SaGs3OxubjVOY+oZYT1D9tlko1tUQqZSzdmwCGfhQuf8
         VVeVXOT8tnI16YeLvLgPsq8eJZgnxK580FvDDwxltsu6pKQrDzlVVaziFpD1ZjLwTJFL
         Lp38GGAdyMJp+6mlc0P5kDpdkE52ESCA5gH+ML5FoG41CWYycMTLxgQvdhA05BoC7kt+
         GZ9am2xUrSJWYkGb2gilTYXrMR2BgCXlMz7ilj6T6cCPJB7q6aVOwkCbkwaTvIa1n1ul
         b/ZXH1iq0x3ozT+RRiUQv3//O1Py2uKlkYABXJHBXdwOkcZf3HAbJNmJi9eQsDSdRrZL
         mtKA==
X-Gm-Message-State: AOJu0Yz1mWJlEgTqs5q6c7yuMwHUQmyNIbsIgu3qJCah5A5l3TJ2oEHX
	6xEoWpGih17HBnModcwtRK3W4CVLGuY7vcfPFy26QCsevrpvAYRZstmQ
X-Gm-Gg: Acq92OEj2i0+50yu7LqY9A334/7ii9InTNLIvPKLyMmcmNS9+fnUPoL7qNmjdKM0Zxb
	/gl4YBxoWTKFyHbyPftDNDzeCplSGTYNvJT/U1KyD8VbtBEN4P8mtwsJTJviwA3RmKGTVFJaCLq
	XvzR2k4JcG3TrHzDHDaquB/OghtaZH7eQZTGlC5k4GbZgfk8aAcFI6oRvPrNa3Y4WaV5irWYq9E
	8P6W2ahssRTD25vuMxWoBe6UIt1GBzga5VCP2KJj0BHYNCLaVrP61XGzn7TqqofqFOR/eJViEeO
	wksb7ZlwtFIDS7heR/gI4Kw/MvJyXow1vxvSKxld2lzuCK+vEp9Yn10eWP4dKR5GEKmLbbOyI4L
	J0wscbbrzUumkYen2oKV8mIyBBnRh5nTWdZupj3VA/KJcaE38U6D4n+mxIXqBNdm5yzdsqEywlY
	VwuX/avyQLMmLFogOuh3A5RYErA0N3FpeTpeqR2EtoSg==
X-Received: by 2002:a05:6830:2a0a:b0:7d9:b2b8:e06f with SMTP id 46e09a7af769-7e6a1e09574mr7543417a34.21.1780331522670;
        Mon, 01 Jun 2026 09:32:02 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e695d69b20sm8024928a34.22.2026.06.01.09.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 09:32:02 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	xsf@rock-chips.com,
	sre@kernel.org,
	simona@ffwll.ch,
	airlied@gmail.com,
	tzimmermann@suse.de,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	jesszhan0024@gmail.com,
	neil.armstrong@linaro.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 0/6] Add Anbernic RG Vita-Pro
Date: Mon,  1 Jun 2026 11:29:45 -0500
Message-ID: <20260601162951.254968-1-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add support for the Anbernic RG Vita-Pro, based on the Rockchip RK3576 SoC.

Changes Since V1:
 - Updated documentation filename to matche compatible string.
 - Corrected order of allocating IRQ in charger driver and switched
   to using devm managed function to allocate work queue.

Changes Since V2:
 - Corrected issue with naming of panel binding document and added
   fallback compatible string.
 - Switched to devm helpers in panel driver. Note that
   devm_drm_panel_add() is currently only in the drm-next branch.
 - Optimized setting GPIOs for panel driver.

Chris Morgan (6):
  dt-bindings: power: supply: sgm41542: document sgm41542
  power: supply: sgm41542: Add SG Micro sgm41542 charger
  dt-bindings: display: panel: document Anbernic TD4310 panel
  drm/panel: anbernic-td4310: Add RG Vita Pro panel
  dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
  arm64: dts: rockchip: Add Anbernic RG Vita-Pro

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +
 .../display/panel/anbernic,td4310.yaml        |   66 +
 .../power/supply/sgmicro,sgm41542.yaml        |   99 ++
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  | 1317 +++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                 |   10 +
 drivers/gpu/drm/panel/Makefile                |    1 +
 drivers/gpu/drm/panel/panel-anbernic-td4310.c |  251 ++++
 drivers/power/supply/Kconfig                  |    8 +
 drivers/power/supply/Makefile                 |    1 +
 drivers/power/supply/sgm41542_charger.c       | 1035 +++++++++++++
 11 files changed, 2795 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/anbernic,td4310.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/sgmicro,sgm41542.yaml
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 drivers/gpu/drm/panel/panel-anbernic-td4310.c
 create mode 100644 drivers/power/supply/sgm41542_charger.c

-- 
2.43.0

