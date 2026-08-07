Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B0A37A822
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786112546; cv=none; b=N78NK+ZLuiuTjI5MqaRo3SX+zKT9vWkt+YgO5Tc+2hTjdJDZT9nP6vvtgvuYM59Wn/mPVdQmDQZ52WJo2Nzu87Jc0VlcVqCgZmAoHvoungOa22xpXtjkxpBH3/xAus8nDt8l3wsQosIRNgsJXuFcLyy4lzoCNFSRw/waun2+Oe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786112546; c=relaxed/simple;
	bh=eVGpKe+EcdJ7XUC4Ncud5DVc1/hqhzgbLaaXCx88ABQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=plAPKFqwiYWGe68TaxkI5uQz04kA9EyX8v5Sf7G+KV4284CQoyFn8M3ey41Z+qXF2tYi70+t5V/lrDo1d4Wy7zInxhzQJhHsImL+AMgPLoIpVdZEZli2nNkOOBqg7TBlqgvVDzWZdeMLIvMdAwCsRcYWL2r7P7vwvsezGp5Bcig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/NAsZI4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/NAsZI4"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cee9b74ee1so29631985ad.3
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 07:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786112544; x=1786717344; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4jrqSj3opeMMbFpu/4FeQ4O+rDHnQsZg3TOVpbai7E=;
        b=J/NAsZI4IEgqoGrxQugCSkqxfz5e5YSaRLHR3eddmqFKri4M0euS77HpN6VC8s5y+g
         zhkGIXKVQKmvb167LOlwTX3LqTWKDUoMQJ0p7ArdzN5TnvM0gVY0HdWVnwNqZQaAE83H
         kFXw0qo6oTXdLk39q0xRCj40ObuIr+pAgs/Vwdwhb3G7CQ43ZOAyMeLei+VrgJBJs4sU
         y9qdvR8Q9NqE6mTEjto2otLJjBFOAg5eFOhdvLCc1iMHBrF3+XHBCbnzRLYaj+HQlK7l
         feNZ7JZZ2SdlvepCZ/YFFlG4d8pkF+h2glGlzif8KqnBDEyQPIQXn/A/LbDc5ejlkZpm
         03qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786112544; x=1786717344;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4jrqSj3opeMMbFpu/4FeQ4O+rDHnQsZg3TOVpbai7E=;
        b=KIZCZpazMc+0co7F+AjgeIZDq7Ksr6AlooyQbIi/P/JFbFDCLgbKY16Sf17pi0BZmz
         KCFIFe3kU3EEuE8eVt0qLRrevDmpKzug9cJ13L3o9+CxPokMIkfi8RRpOyfQfhU3xop8
         9Gvl7fJBY1HvqTO6nmfldpPbqLED9af6OBf64ka3BNwNYchiw0LT90qA34jVP9wp34VY
         GtK0VoJitM/vbToxnVmpDBAysUrhc2ahr6zmlyqbUAXN2frJrY+5Dou4QyUluvyCSSLa
         C4IWxKw8071MplPOoLMTg90YXYqw8bIpQ2A86Tpgm8BELTz1+YlUrmFHMVj5uED1FUVH
         EMKg==
X-Forwarded-Encrypted: i=1; AHgh+RoDjXMJFtU7EkOVktuTtbCfNcQbBPNY3xvaVge6OyJ8GXJh+E6IzXciKbuy+999cd64/Ub+ucqx12uq@vger.kernel.org
X-Gm-Message-State: AOJu0YyAMSPcR2srvG85WHNQsOmR8098pL1nERatC2jZjybctnsa6F2Z
	4D8I05TTDrKLpgsOwd5T+oqkoP0FOFaAADGOlm1I+zJTYv7pdgFf7/Y=
X-Gm-Gg: AR+sD11tvFmShABrhvjPSWYgIE33mBBVuXMkNLCJhNxrXbbet+oZrX9BjYqSiHTkmaq
	CIbVzQobzUWU8g7HmI7/asSJe30RHHUv3JHL2MWHz2dq0DzCRouYFKVQcpQ0MU7KgEGoCyDXSMo
	mTkDEjcA4Q7plpYq1tDUVt/6gkySi0FODy8fVF4sX7V7UCQRnPjixHEWBM66q+oL1zeEasvYchY
	LGdQ4khhtw9OgFFXIiT6yxk+wdbm9fS/OKHgkv+ZWOegxDSKF+Ne8tYp4g7SwMa5kVMMCbWgBjn
	N+IGXG+JMgXCh6uDLWFqnfg3wXqKpc3ZguuOX4IWkKAGA7j4kywFS+kcXXIv7FfLwtzWStEop5s
	a5MAjZOisuLwIH+ouDQZDvuFiHfH5VsAZvjv0Iutu2MvGjelqHysoUwOt+w7n9NzzTHIkgPcbhS
	LsIE06Z+BDfYqTpMfkGZg1ano8nZUjdooTdPyGRyTZJaSpf2WL4cmFfK7dl1Uxk63NRSCo7XpCE
	ZVwFU2VHum0ZlZrH9LZVSSzUW+rTkvwFpTRX5ugow==
X-Received: by 2002:a17:902:da82:b0:2cf:7bfe:6043 with SMTP id d9443c01a7336-2d0ca949b71mr207130955ad.19.1786112543799;
        Fri, 07 Aug 2026 07:22:23 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be8a7395sm8521868eec.9.2026.08.07.07.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 07:22:23 -0700 (PDT)
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
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH 0/3] Add support for CH1115 Controller
Date: Fri,  7 Aug 2026 11:19:49 -0300
Message-ID: <cover.1786110720.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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

Tested with Raspberry Pi 3b+.

Thanks,
Nicolás

[1] https://datasheet4u.com/download/1576606/CH1115.html

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  73 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/chipwealth/Kconfig            |  16 +
 drivers/gpu/drm/chipwealth/Makefile           |   3 +
 drivers/gpu/drm/chipwealth/ch1115.c           | 828 ++++++++++++++++++
 8 files changed, 930 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/chipwealth/Kconfig
 create mode 100644 drivers/gpu/drm/chipwealth/Makefile
 create mode 100644 drivers/gpu/drm/chipwealth/ch1115.c

--
2.47.3

