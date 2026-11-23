Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398640;
	b=dVYlHLOCKwH7mAeMN/KW3V/BEogNbM1TtISTXl8mpzRgbnYyYgYV34u3U4mHVnrXM4oS
	 fTT+c42Pc6VY8i9toydI6tH7BijGk45IQxgj1ZHQHdH7bPCsMXVr9mp8sMzpV4RnTUrSD
	 aAtDiCwG9aLXqOyfuUW3UyGzwJZTJjCUeQ65C27U7uzjCC5oVGbQZ8OhZeAUCE9Gl7J94
	 ZbB8QrASgtmnT0lphTGwFH+puLMOhMbCo/O1kGTjW0JE6Vo0PDYcKE5lr13OcvV195cAA
	 ScTgUgvK1mI0fJyOge8fsNmK33ek/65TZqXhcJiSFVW0nNWroqS0eFNCnyCSrJskfnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398640;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=veZxcNVuo2b3ptIF4Zf8vJr2Tg8zlMewCoNyj0061vg=;
	b=JmzPII1rzAx9M7NWp5D6Zf8NB1vgVFxlVGP17XU+3X9mXIdGnp+CdqdIBQwcN6Uz2SB9
	 bi4h5K49pq2qWy4oVrBZpTS9wF+seGD+PmM1LzxjrNXLGcv71wy98nH56RpIyO8sDxEFO
	 mhkMyTwfo2HoaNhHlC77MTyExfCEtpCqRtRqnFxYrXZgUSUypa4hpt28HcC0ts0w2x5KM
	 7TU4vmRPDMVSxrtOeEC8g9TqG3Xl8KapIF/0AxG0bl6MGV7yojIaMYJI7Gw7GFVwfRuGw
	 +LCdAgHgsbIMyJ3nLkooSW0S8bvwXJwzqyvImiiVMkTeDDj4fG15Ot3YvHS3eOPKWMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjWoDyK4;
	arc=none smtp.remote-ip=209.85.160.46
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE282606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE282606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QjWoDyK4
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4ad4072943dso887299fac.3
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 17:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795398639; x=1796003439; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=veZxcNVuo2b3ptIF4Zf8vJr2Tg8zlMewCoNyj0061vg=;
        b=QjWoDyK4MYWUM0oJVT+Wu8JPCgWODjsHYWS/9NkHJD5pLycFjxmmqYOKbIPNpL7SDm
         25NsJoz6Qeeur2xybZT2Ew9puAApyxafkfes5NukfuGdAkrb47Ii9CJMUdfYww386Thc
         WQTaprlI8IxrnJ1sbiooQyfYAohoTsz1FDDvvEr+za/xsYzfG3/Nny7tTjTK6fPU4se+
         cexsM2cYBfDQvgEGR5F99CAZy0UlFeUI7IB5XQAu31+f7w0cz9rs4cAGfm8/XltDguv/
         FBTdMS9t677xWD6VdoTJGkEWnoL2V6JA1WYL0xMNDFQozXvoaSNBCd6xDAy2vCGELD7a
         YVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795398639; x=1796003439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=veZxcNVuo2b3ptIF4Zf8vJr2Tg8zlMewCoNyj0061vg=;
        b=OGbPwCyLRBsHlPckplz2k9826hp1qijcEA/4NhDhcAxPuTgWkEEmlgjUs3mdgNgtz0
         pIXCbDe/+xRwW27S8mVY+kT7ZKTW3KgakuRhJkebkHPUNSNnIGou/27CBsFq34Y+IwVV
         yadrHuFiZOYL/3nlx5LcXvc4KrvHvLpukcdl+HDTU404TLAgNcOFN0wtWIw5wxIhdMho
         DxoNAimlYavGXU5N2m6cpgZnKPeB8Qc88uMT140kJ4Urb87JMpgbcODfGjXwLwcVHOMg
         kdJu7nH02+nyUpznUeE6Is1ZS2NNBOivy4O9Qlh/e5oI54ywAYhEC8RF3etbGB9VDdcL
         5XHA==
X-Gm-Message-State: APuU4Z+MNsVPxhTfRIFGJboCAfqT9tNW00zj8bfWqpp4thGZsowdjQNg
	LGyvfRLt/Fjtk8Ak+gX4OKcymnNBfjMPYFo9HOjjL16jSUANz9oKaupn
X-Gm-Gg: AZFdTZcBnawTPhhM41HQaOZtVRPlIA7Mg2OSnZFPIymJwqUOXjY6OOf4CiSqafHalnT
	ZSmWQE1SUmgyhtMW/Pxy/zTK6I/GT7EsEiMf4JFeQjGvx64ZZ5xnLCUjINXsZtCYq9sAWXs8PnP
	YeMBOlilNiy7BtSm7PiIuCpU8grx87LyYXy69tXa8i7DQTqtwCJrVaY29yv0LN70TMAeKAdqUyT
	38DocT2PmmFd6dPkzkeQzeBPUU8taKyOtpt0ER8JJ92MmU+01eCmlcTXteTAN5Y1UjZ9pKNisUv
	/0wnyX9x3oiPZvO9lKRZst33tFyTyuqnZUbtIa/mcYgJMHteT6xjYynpLTJXx/1dKppxRH/93eX
	COTQ5zgSUcE6XOSPYODFOF+uRwq77+2DxIFF6UR0AIKsmBdvnkLp25GtCCfBfPjI829sbraZeXF
	Jeyzb2o1b/w+62XzhBptItM8HkF+c3nJYHAhCDANPBa4u8R0ore+UT7gVqdeDgThAqjdrOyFP3O
	iM+uLFejUhvnHH/J8csWoA/8kO5tPq8GluN6r9CrZcOyRMNRfkKWcG8L9nz81mWDiGo6Ek1SUFz
	RzU5fZNaiPLS1Sev4PGCzD4w/9jgxQ==
X-Received: by 2002:a05:6870:810e:b0:4a7:8aff:348b with SMTP id 586e51a60fabf-4bc81ca0d2bmr9676309fac.16.1795398638564;
        Sun, 22 Nov 2026 17:50:38 -0800 (PST)
Received: from neuromancer ([75.28.21.198])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5f7ae7dcsm9209484fac.8.2026.11.22.17.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 17:50:38 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	shawn.lin@rock-chips.com,
	linux-pm@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	sre@kernel.org,
	t.schramm@manjaro.org,
	xsf@rock-chips.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V3 0/3] Add Cellwise CW2217
Date: Sun, 22 Nov 2026 19:50:32 -0600
Message-ID: <20261123015035.369192-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

Add the Cellwise CW2217 battery gauge driver. This driver is based on
the sources used for Rockchip's Board Support package [1] but has
been updated to use the regmap API and devm helpers.

[1] https://github.com/rockchip-linux/kernel/blob/develop-6.12/drivers/power/supply/cw221x_battery.c

Changes Since V2:
 - Fixed more bugs pointed out by Sashiko.
 - Corrected an integer overflow condition when measuring current.
 - Corrected logic for when we don't have a user specified battery
   profile.
 - Added power supply changed logic in the worker.
 - Updated the Kconfig text to note support for the cw2215 and cw2218.
 - Added a check to ensure polling interval cannot be below 250ms.

Changes Since V1:
 - Added a default value for the shunt resistor in the binding
   documentation, and updated the commit description to note that the
   min and max for the battery profile is now per-compatible string.
 - Fixed bugs pointed out by Sashiko bot, and corrected units for
   temp and shunt resistor values.
 - Corrected include pointed out by kernel test robot.
 - Noted in the commit message the patch is based on original work by
   Xu Shengfei at Rockchip. I did not list him as co-developed or
   signed-off since I did not have his permission (yet) to do so,
   but I have his authorship included in the file itself.

Chris Morgan (3):
  dt-bindings: power: cw2015: add cw2215, cw2217, and cw2218
  power: supply: cw2217: Add support for Cellwise cw2217
  arm64: dts: rockchip: Add Battery Gauge to Anbernic Vita-Pro

 .../bindings/power/supply/cw2015_battery.yaml |  41 +-
 .../rockchip/rk3576-anbernic-rg-vita-pro.dts  |  21 +-
 drivers/power/supply/Kconfig                  |  11 +
 drivers/power/supply/Makefile                 |   1 +
 drivers/power/supply/cw2217_battery.c         | 878 ++++++++++++++++++
 5 files changed, 945 insertions(+), 7 deletions(-)
 create mode 100644 drivers/power/supply/cw2217_battery.c

-- 
2.53.0

