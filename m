Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7380D27AC31;
	Thu,  6 Aug 2026 13:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786022252; cv=none; b=aXU1Mfa+QNU8RnCMxFanBKLvHF+sa8TfhOWrAe/XdYpC498euwQrZbM8dMfFr9ZjcQdhQwDtKC2K+A3EXJVq2mkkq7Wz8VZZSoJf4AfyEBMSchUSeatEAj/pEvqHGjbp+Vhmj/LfomA4Vd4JpJ/7slNKcwDmWiCdWIAi63vFJBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786022252; c=relaxed/simple;
	bh=B25rwJEYgGda4a7EaZDPEq2OElxi9m/ffGnyXjLopqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HK+m6JWM5w0me7WDb36Dv/Od1UgMWD9HgkdJ0va/y64x52X+7aOAf7EyucKs5M8ou02nqekMdV3pHOKZD/CpfF0QMYx9BUJeZFtr+soEkjc9EdUnCY67Od7nfSubhNWTWcP9V+nensy0URkfUYDym8Lg+WiWlhPJoLoURVSvZ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 2B1B6200F4F;
	Thu, 06 Aug 2026 15:17:19 +0200 (CEST)
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wrxyJ-000664-0I;
	Thu, 06 Aug 2026 15:17:19 +0200
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
	Yi Zhang <zhanyi@qti.qualcomm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
	Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>,
	venkata.valluru@oss.qualcomm.com,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/7] Fixes for lt9211c
Date: Thu,  6 Aug 2026 15:17:08 +0200
Message-ID: <20260806131715.508557-1-p.zabel@pengutronix.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260719-add-lt9211c-bridge-v6-2-e56d22152586@oss.qualcomm.com>
References: <20260719-add-lt9211c-bridge-v6-2-e56d22152586@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With these fixes

Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

on RK3576 with a 1080p60 panel @ 148.5 MHz.

Feel free to squash any of these into v7.

regards
Philipp

Oleksij Rempel (1):
  drm/bridge: lt9211: Enable DSI burst mode for LT9211C

Philipp Zabel (6):
  drm/bridge: lt9211: drop delayed work
  drm/bridge: lt9211: fix regmap_write error handling
  drm/bridge: lt9211: use regmap_write_bits
  drm/bridge: lt9211: reuse lt9211_configure_timing in
    lt9211c_configure_timing
  drm/bridge: lt9211: combine equal branches
  drm/bridge: lt9211: use devm_drm_bridge_add and drop lt9211_remove

 drivers/gpu/drm/bridge/lontium-lt9211.c | 189 ++++++++----------------
 1 file changed, 61 insertions(+), 128 deletions(-)

-- 
2.47.3

