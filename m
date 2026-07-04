Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EAE2FFDD6
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 07:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783150765; cv=none; b=Gttm3PWJHH3+uBrAvUjmHGkfALrkdZqdk56yyNYIBXx3OfRmYNuwspezU4R9UP/naK6QHgHsHFblhSW2FK+KaL6YyDTNrnADoNmnEA8CLQ8uY2ipA5d8zAwtuzFaTfP8/zSgNbk0Jh22YALJOfv7t8pGQd0ETwl0OutPppfeDxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783150765; c=relaxed/simple;
	bh=Vjk92yj5SDGwYHyFOT9M2fcaGNwel5+hRD7zUCCZF0w=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hoLZ1VzzoiUZaxFqM6XR84r4Sln69PfdHIsEQOjvPZPuJIHbPXS9gEhe9ho0WtPMPWTx3RdhF5ZhbYfxccpSdVV0aWG+b+DfVE6jn+uXjevLcwU6eH5kArJDCuK/x5qL8dAqBMHrNyNun02lgRR0xSyIG2AsV39cOu6x7uFc+CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErK/Q5cD; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErK/Q5cD"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493b7612475so11534885e9.3
        for <devicetree@vger.kernel.org>; Sat, 04 Jul 2026 00:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783150755; x=1783755555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVufXZv3C9nTTbjjeAadD32Z+/uBgkpYSXQtGIeK46U=;
        b=ErK/Q5cDjePjjQ+3jJbWHqKVm2FdbCH8kCT1T6dAr8EfQxd0yNy0NWz8ATR6cH2x8w
         oTKbiEPe2ZruITE+0vY3nHSJQ097nL23HQklI04UgA4/AVAP1uJ6W/AGGPcyq2PAl+EH
         0VeWHfegRPJ+81ogUs5tM272IppDRoC/yrVbcV6NY9Bmp0XGo5PU3gAO0AFGSQybiWJM
         JLIubHiBPyOD8nRL5hNFbiP7mEqloJffr/Y16sJLqr4meANOICUlrEh/+Jm5X2mYGBxl
         Wh3/Huqp7ReU+QlEPSLjFLUF1y0YjgXent1EKgMtt/lVuAw7aqZuAsmmd38dmcWLsnnZ
         k23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783150755; x=1783755555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVufXZv3C9nTTbjjeAadD32Z+/uBgkpYSXQtGIeK46U=;
        b=J2iKIoaT9yALJAuAifz3bJgxopJV9/qYbI/y5O0GiLtSaU79icL+lcPq6WkCID/12g
         gW6n8mppniFFuIuat1wo6fWfhEFn+U1W9hgjypq0v5WwkW1KAvVKLIrbAXQdW76Jr1C8
         dJnAgdhjGAw2baoZ/Tb9m1qtLBGq+nOePiP4D0ZSiGOiZbu6/yvHNRg3HwUhO/cUtkWm
         eiHH8frbMZmLfHNmeii5stjnXoS9e/0iVhifKr7TbPxMC0HJ17ID6FY0GzraSP8DVX3c
         VH4eSVgotfvZMU2YgsIpcaKIhmX3Rc9CpUG4vpMDldC2Di1x+26KEVWN56jE6dxHFzCy
         iseg==
X-Forwarded-Encrypted: i=1; AFNElJ+4IPaAiMFhFm9yNiDp3QOB6Adzo5LanCQD7vGOSbg6Dkd0Ixhygzp5AmXv7e8D/B8q/WXYThzd+3dL@vger.kernel.org
X-Gm-Message-State: AOJu0YzXNu3JlY/ShYzmlw7mB4io7FXYasyRfQ0ZeTOtEcTQvsb26Q/z
	yIBP585BORN86dKqEVzyYE7G1IQeIdqDjbX9cFmSHkmIJKHiCPxyFZNr
X-Gm-Gg: AfdE7cnuuFAgQ2HXzhH6fSR5or2rKqQe5eGNF65kTNWAS191upmNeEYduCTyeFQnsyr
	czPUgdpr31r/PGUIDjqcDuwFOPqMe0RidwW5yjn9uKlpKJSl+UrHB6xw6GK8/KbaziLjHvXO8N6
	pR6/tO/KVpx2TtPOOWUERTFBWUvDTKIK1a5QcvmMpDZBrF6oY/UphU8zlfHCrS5qZZ0tETxwiUr
	wO3d/bItGNz0lu+oGUjQ6osSzg7TH759RNczuslKpuDQlZiXpoDWeuQFtEw/6GcFuMfov+m3G7P
	RYur7Uu2kevTYwl7y6cMRe1HtEflMS2Jwfsw1ZeQXbO61LLS2GlzZ8FHwckRPmicWG3FKNie4FC
	AxAwUlpFh1q37KbtE4vzzyuBzBzj+lvl9YGmIux/VVbml3gmeWxCogLWAhXkFSMpXmFMNjFySoE
	gxdohkOQVJ6mTebq2sKUfpCItKEzI1+YPvgQ==
X-Received: by 2002:a05:600c:c166:b0:492:63c3:8eeb with SMTP id 5b1f17b1804b1-493d11fe04cmr24840475e9.35.1783150755151;
        Sat, 04 Jul 2026 00:39:15 -0700 (PDT)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm6565488f8f.7.2026.07.04.00.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 00:39:14 -0700 (PDT)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH 0/5] phy: cpcap-usb: improve charger detection and export cable state
Date: Sat,  4 Jul 2026 10:38:38 +0300
Message-Id: <20260704073843.1750458-1-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Motorola CPCAP USB PHY contains the hardware state machine used for
USB cable detection. Besides distinguishing USB peripheral and host
connections, it can also detect dedicated charging ports (DCP).

This series starts with a prerequisite fix from Tony Lindgren to prevent
spurious SysRq events when switching between USB and UART modes. It then
adds DCP detection support to the CPCAP USB PHY, updates the Device Tree
binding and corresponding mapphone Device Tree to use the charger
detection interrupt, and finally exports the detected cable state through
the Extcon framework.

The existing driver already interprets the CPCAP USB detection state
machine to determine the attached cable type. This series extends that
logic to distinguish DCP connections and exposes the detected cable state
through Extcon using a standard kernel interface. It also makes the idle
UART mode optional, allowing the PHY to remain in its default USB
detection configuration unless UART support is explicitly requested.

The series has been tested on Motorola Droid 4 hardware.

Ivaylo Dimitrov (4):
  phy: cpcap-usb: add DCP detection and make UART idle mode optional
  dt-bindings: phy: motorola,cpcap-usb: replace se1 interrupt with
    chrg_det
  ARM: dts: ti: cpcap-mapphone: use charger detection interrupt for
    CPCAP USB PHY
  phy: cpcap-usb: add extcon support

Tony Lindgren (1):
  phy: cpcap-usb: Prevent line glitches from triggering sysrq

 .../bindings/phy/motorola,cpcap-usb-phy.yaml  |   8 +-
 .../dts/ti/omap/motorola-cpcap-mapphone.dtsi  |   4 +-
 drivers/phy/motorola/phy-cpcap-usb.c          | 312 +++++++++++++++---
 3 files changed, 274 insertions(+), 50 deletions(-)

-- 
2.25.1

