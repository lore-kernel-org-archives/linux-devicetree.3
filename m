Received: from mail-ot1-f103.google.com (mail-ot1-f103.google.com [209.85.210.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B292384233
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436138; cv=none; b=NX1G+cYOnVCM1OaAKusA9Le4hs8YI1RZuU+OfBsDofUp0QbLLl1GCfjgtNp7Zc5UMzO+5ZUyVy/HDUyWl/BEhXDRJErEeIz6+KyzpduYNHuyHwKPlOrpTXlQxIQXm/Zv3lB34u8Oo0BLNX+4DdqE4hs3oZ7ifT2uCv/m1dXYje8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436138; c=relaxed/simple;
	bh=otskfmhD8ySo3ULRgdnWJTgPH4dRmbQZJyen3fjxWtU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Es/DFa0NZx6peFjTe2DCGQOYrd/2fTOOk3VuLr64cqf3iT7CJQn6K3vkp3AcFnWbSbCUIPDbpY3YarCvu0FprnaZHXu973UOFjUQZVPnpW4RwuinJRQM4HQGfnCfVZ9Gu+tiAkKO/+ARpRNuQYEBxObszdDHexz7d0qNHT3Io7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=lUH1Aprg; arc=none smtp.client-ip=209.85.210.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="lUH1Aprg"
Received: by mail-ot1-f103.google.com with SMTP id 46e09a7af769-7dcc9b506d9so8313174a34.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777436135; x=1778040935; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FtGPxykfSJnjMbp7TJp87gUGFkeGywBatbMxDcRE/PA=;
        b=lUH1AprgdZMJaY4mjDacMtfRo0lMk3p1zZINiX94hEc7n4yPgnfhfM6oCQ12Zy1kx7
         Yixj7JBoDxSoTYIuIO/Yzjj5iBW4jchgC2UOHxoNEwaH5+p5KC4NJXjFeeyZkJBTW+Ef
         KMRNyzLWh+b0ASMuPJ9ovY9HRDm0adRxs/PEnoQFPf+qK/r6V5gOT9TrrIPb7NUsDc1d
         gVQ0RxUbW9DTukhviE3n4aJzUYvdq8jNW0fvEXxCOnS4TAE+2Iho9Vv0V5crjZZor0SR
         aXwxjws7YFbGkDSK8yxyVAzTPunah/omcJxyQz4DNErOnyqfPdTA/r50RtfJd9bGaOjA
         0bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436135; x=1778040935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtGPxykfSJnjMbp7TJp87gUGFkeGywBatbMxDcRE/PA=;
        b=jpSIv93ydW1vVkiSt/uacTeny1mGKK9jgxQiwu4yMDjYcj+7twlzkOx4uPapviWI0G
         PvRSuCLUqXbFXRoaW7L6ggY3bqiW7/efLfdLrVhD8+788SMpRh7plYvbKS0gBtQr5Jhf
         utyD/mCLSZ0PmLe+El9DpXlhUOFc1K3INCAK8jnUBlyWolS0S64fYg/3qdnBUxGa2QsB
         8DYaYK+I+S+wExOZCPGjExO8hVqD4skfqc+Pp82o2dwXKjnOX2Uk00hmgxlNubdVHVnC
         fOokz7zWd7K0Yytozd93c6U4+lhpA0BUzUgriUFuloLA8Ed6/keeveU7EL3cxG0rziRC
         mlPQ==
X-Forwarded-Encrypted: i=1; AFNElJ8akVthhVHyovJfng2d59THDFb2B1rJ0/EuCGsFqvhmSPXOpZ7hHZzWNrzLZD+ImLLGxW9tBAUL5r3e@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+19v3SR2aMTIw01hq3xikBliiumOORKSCtL1FHmAScS4IVzz3
	Ri89ywNGIWJeE7qP3V3v/g1j+JEhZOhltAtw05DL8M8T7B+RTAwShjI2d4KjIVrAcI0O8tVz5BZ
	uq/wNuLNfnIKcBR75PbFJeICXUG7d6bK0ZyGC
X-Gm-Gg: AeBDietBlgSMJT43EcbUerqiSVYXxJG8wSHDXdFLO4qmRAzXkLlyg43/ZpSdej4TUCJ
	34NLMFqdjvde/yNBGayg4BVBmh0XFfjT+9k7G3xMEJHXuu725H8Q5AL0AcD55ZaB+yEeQWhN22P
	C1+oV/dAirVS4IHQxsJfIorCSpmCcM3/Od3+z1gfcKhbGVB8ERPs6ehJCkNwUYK9AtiWWqq9QW8
	SnO4H1EPUI9Fj4GoIT7xyIFE6jQmewPiSna+EwYs/Ik3c3MA06McibKGZCdWesb44cj3LoQi0YF
	N1SUCc1ONyRT3rYwj1+KO1YMKbrCkPiMqUnYetYyB4DQ01CdMuZxhhJ0/L6FdES1oEiO/NzwTnA
	W/ZU/6cCLHC7iDTufd0vEsde7HErUnqf0Zkq41/2KN/mllAkntO6/dIE=
X-Received: by 2002:a05:6820:1987:b0:694:926b:551 with SMTP id 006d021491bc7-69668520ec9mr1220128eaf.55.1777436135405;
        Tue, 28 Apr 2026 21:15:35 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6966baf952asm41557eaf.9.2026.04.28.21.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:15:35 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alexey Charkov <alchark@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Peter Robinson <pbrobinson@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Dennis Gilmore <dennis@ausil.us>
Subject: [PATCH 0/3] drm/bridge: Add Lontium LT8711UXD DP-to-HDMI transparent bridge
Date: Tue, 28 Apr 2026 23:15:25 -0500
Message-ID: <20260429041528.558254-1-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lontium LT8711UXD supports two modes of operation: autonomous mode,
where it configures itself via strapping resistors, and I2C-controlled
mode. Review of the earlier Orange Pi 5 Pro series raised the question
of how a future board requiring I2C control should be handled, a second
compatible with a driver or we make both work with a single compatible

This patch set covers autonomous mode only. On the Orange Pi 5 Pro,
resistors R9, R17, and R27 are unpopulated, which straps MODE_SEL low
leaving the device invisible on the I2C bus; I2C control is not enabled
on this board.

The earlier review thread is at:
https://lore.kernel.org/linux-devicetree/20260425031011.2529364-4-dennis@ausil.us/

One non-obvious detail in the DTS patch: vcc3v3_dp carries
regulator-always-on because simple-bridge only fires pre_enable once a
modeset starts, but no modeset will start until the connector reports
connected, and the connector won't report connected until HPD asserts,
and HPD won't assert until the bridge is powered. Holding the enable
line high from boot breaks this deadlock.

Tested on Orange Pi 5 Pro with Linux 7.0: HPD asserts, EDID reads,
link trains, and scanout reaches the display.

Please take a look.

Thank you,

Dennis Gilmore

Dennis Gilmore (3):
  dt-bindings: display: bridge: simple: document the Lontium LT8711UXD
    DP-to-HDMI bridge
  drm/bridge: simple: Add the Lontium LT8711UXD DP-to-HDMI bridge
  arm64: dts: rockchip: orangepi-5-pro: Add LT8711UXD DP-to-HDMI bridge

 .../display/bridge/simple-bridge.yaml         |  1 +
 .../dts/rockchip/rk3588s-orangepi-5-pro.dts   | 88 ++++++++++++++++++-
 drivers/gpu/drm/bridge/simple-bridge.c        |  5 ++
 3 files changed, 91 insertions(+), 3 deletions(-)

-- 
2.54.0

