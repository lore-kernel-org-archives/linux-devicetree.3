Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129DF39A063
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 14:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497448; cv=none; b=kkOoGQCNI8qUsM6jF3kSDHu7psHeuNZUoGRVdMs5Du4Vq4eh0kmpb1xcrEnGxCn70v6iDG+DOuIWlTak1FlyqAaK0VznkS7VXmOSL4Hn2qMul51GOmidIN6zantQkeDYIAR2SOu68ixY7Xl5U2Yo9oXnzkkNebzhPPSDjOgXsc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497448; c=relaxed/simple;
	bh=qfh3435JgKkQxsJ7o+S2GAaDXfNus9x1IXuHe/oW5HE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeIl8pbpOkxkamVNo50y5/CaUdgA3ttEJ/maOSdb5/zPceF4nEQ127345D9NXOImjTtVN7ooX1RIoi6sA+aJ9EqbqTUnFUOyf+Q+ogAg8cUkYOvLKq+5/Tf4l9S+8REizixrFiYCAt58gAK2trk5UwMtgKdQPswHWwWdnE8tQhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gh9P3pFJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gh9P3pFJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b12270b3so14474545e9.1
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 07:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497445; x=1781102245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hJAlGRz75xEq17uv2UlpRAl3s1Z0RM73GiaeFljbD9I=;
        b=Gh9P3pFJ/XEgsbZMjrQKoQzta40N/+8AlXVQFsyxsuO/d5P1Tw/mXSAM62xcIzPpZw
         7Wr3qo1Fy6mVzQCdXkPwfvJjO49Qbm5jzWUA0+YjdrK8IcyZK/nOPOPoqLwNnMM9SpXI
         5jam7l5g+6i60yfJsWdPGC1G4DolAdZtZ6hP5rTL7az/Bw2H4uutViA2X0OeX1CdUpxN
         +nDZLhxTwnLQCB4ajY9icgyXDnPp0rbJfPeAsdfrVEoxiulVfqKjXGm9gYeZHtYOPpK1
         jN8ce3MqZfD3qSy161aHDWtRYdhAcBBMm/r/54/9/VyCiHlxB/ZbNJOkZnatteDCP64q
         6rXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497445; x=1781102245;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJAlGRz75xEq17uv2UlpRAl3s1Z0RM73GiaeFljbD9I=;
        b=Z07MjpREROlxEI1sSBT1U8s5u3lHwh0rGL3RmvXUwAs+8fMHkves9amY7fC5L555SN
         ARsd0eMqtpZtf5de8LKAVtUhXVW4dMAsOH/byjITKvavrav0gBCOBAET4SGZipbNYi1e
         gzDZz1Bze8Ro+PWq7Q4sDzqmCfa5RY3mIxfnljBzBtnCOuwsUk1EaL/aELDY+6QTrOwy
         OTuDJTYzozSCgcSwqItstQQANF5z28TBZE3bFZNLLPP78hiWSfsuWzsoWLCYktoQuDPU
         WPoTGnEv/qpdsQ8Ah7C/HIjlQVu/JWdsfhrDbLcDScPN3KT8DDzjyTyB3Nty7Kv752M+
         CBLA==
X-Forwarded-Encrypted: i=1; AFNElJ+bN2s2hh7EIc1wzS1wU7kslyOzUMyHbg1Hc9+f51/SRUBOtHTKTcj8v1VUO2/luzkt/NCXr2cHWVZX@vger.kernel.org
X-Gm-Message-State: AOJu0YyPIwOgvYw0BxygPHHoaslhrWzXmVQHP9cRBYsPFvWEDAgs/VFw
	vzYYxrcFoapOSr8YP6wZW9HBf3pAtVXpUGy+8YTqe0SPwfdbIRWcSelh661+JQ==
X-Gm-Gg: Acq92OEGUtL7Y7FyXiULwjnFHtG3o9gcOPNq766Z2z1yj8nd7KhLgZA+ddl1chzxOOb
	KwJ1ZsHlxwO1PdsafVNhUoIqvSiVcK5GvkLrPpydI4+y50nXCAmcbUSo20yiejZ+XMTjYHVV3UH
	pj9xIKJjdN7PLV4/uaZTvt2672h34iUTJCpHBxwhyvtF8ATWNSreym6AZj8THwMN2U11EzO5E4p
	efyzSF0/8MC3pyMz5v5FvKRyltWpNesE2XqvD4jMeyNCu6uh89/CSCdlIlvDXDbdgxUL5CxBLP1
	ZkcOAnTO2cfRmhqs0e8gyC5aWAiragnUbuIoB6ULjPSnivX64vpzQILFAQa12cvpwdSh6p4J6F2
	YohZyp2l1Tgyz2yqmmTOEjWerN+H5EYp8kGm+JIWPsdj5hziQawK/fCNwR8FO3k65PjffsUDmfL
	fLjDav+8G0jZwnP+uXOH1bm1flQLMhOxT36aNHL4QDtrvRYU4jZwvU3ZoTJIIQFqY6M9Bv1xU0d
	f5CTI5amxkrMoE1N3/8zqKHEg/Bcrbs+NmnwJpUZRxvTQv5
X-Received: by 2002:a05:600c:3107:b0:490:bad8:329c with SMTP id 5b1f17b1804b1-490bad833b6mr28402275e9.12.1780497445402;
        Wed, 03 Jun 2026 07:37:25 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:25 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 00/14] arm64: dts: imx8mp-var-som-symphony: align DTS with hardware revision
Date: Wed,  3 Jun 2026 16:37:07 +0200
Message-ID: <cover.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the i.MX8MP VAR-SOM and Symphony device trees to
better align them with the current hardware configuration.

It adds the missing board peripherals and completes the related pinctrl,
GPIO and bus configuration.

v2->v3:
 - Add FlexCAN2 controller support
 - Add FEC controller and MaxLinear MXL86110 PHY support
 - Describe PCIe PERST# reset GPIO

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline
 - Adjust PCIe controller configuration
 - Update PTN5150 interrupt trigger type

Stefano Radaelli (14):
  arm64: dts: imx8mp-var-som-symphony: add input keys
  arm64: dts: imx8mp-var-som-symphony: enable USB support
  arm64: dts: imx8mp-var-som-symphony: add TPM support
  arm64: dts: imx8mp-var-som-symphony: add external RTC
  arm64: dts: imx8mp-var-som-symphony: enable header UARTs
  arm64: dts: imx8mp-var-som-symphony: enable PCIe
  arm64: dts: imx8mp-var-som-symphony: add HDMI support
  arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
  arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
  arm64: dts: imx8mp-var-som-symphony: keep RGB_SEL low
  arm64: dts: imx8mp-var-som-symphony: enable PWM1
  arm64: dts: imx8mp-var-som-symphony: enable CAN
  arm64: dts: imx8mp-var-som-symphony: add second Ethernet port
  arm64: dts: freescale: imx8mp-var-som: add I2C1 bus recovery GPIOs

 .../dts/freescale/imx8mp-var-som-symphony.dts | 394 +++++++++++++++++-
 .../boot/dts/freescale/imx8mp-var-som.dtsi    |  12 +-
 2 files changed, 404 insertions(+), 2 deletions(-)


base-commit: b3c1d1631f097619f8091f0293e027c4301285d6
-- 
2.47.3

