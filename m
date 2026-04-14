Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795D8386C09
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 21:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202873; cv=none; b=RnkuXKrePkAAwmc8ATTkUWUf9YGmd0vMw4suYZINpt2aTGYIvO5aPFEuaVz+7Y6OnIOWvY9vflTfuv76sxXDPRg+S9gQamr5xui4yjipjfDF4rgjknsxPsD5nK40JSk8iBNPAZpxtZo+rLFZkgRHg58VL4DpbLkddjzqHFHIaLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202873; c=relaxed/simple;
	bh=FgvACaANXxiFf5sy6T8esEMzEIj5z13uUCVritj82SY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbU4Td1tdX/ZI0IdDLb6zR1IqtuSaaf63AWCkhUcgBMeplcItbdsQ9stTUQTCgHdbDDr5ZufJTv64qAfG5CPHDEy5yE8N0CVVqphW0u22ttHp5MUYf6wyNrwLGkyYjvAMPGYc4zaJ+xvYfBNisaxUR8MW8lfytTfm3pV2BL+dCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=CeLIHIgG; arc=none smtp.client-ip=209.85.221.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="CeLIHIgG"
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-56a857578a8so2368328e0c.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1776202871; x=1776807671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pdc35Ylej5ItvmLOneRVPWcqxy/OnSmxmxiLCyeKGpU=;
        b=CeLIHIgG8jNSR4icEJqYt0RvupNljdamCiE+DekZyCGinoqwyhnxSV/uujvN0RpK25
         5SOnhNoZoQbreOZkBEcTsJIYdcXyg1lgcCRG4Fw+AK748WFW3z6IqaCG1guezGgs4d+P
         OY44YrhgmPbWIzY/I+4F8j2NEzz6EUvcNMoHtdyJFWkUROL+YiSc9C1RwIlLHPNw7EIz
         fZPAKtL/jXJURw9ZVp7khFaOVXpdrd1lOnb1LqN9Lzbu9jZEiTOGnSkdMDkQooMOs/LH
         zpwMzABT+MDqVQ29LP+p62OWrOTvt0/7FcRnAiUgn0z13UA0lG7hE2KJw7TIxDD6jEcH
         J5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776202871; x=1776807671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pdc35Ylej5ItvmLOneRVPWcqxy/OnSmxmxiLCyeKGpU=;
        b=nmy4ii6cnTbUyV9kFLPtujb8KmijAnNoVEqGZzuA56VXRxKK/DganR1LLdzsKxbo1v
         ALkAZKScs5c3pVrfswMGlxVRkN8tkpvx1UMNqO2IJg95ZB0QPWWYcMxX5A3pPPF/hPTY
         i0k9rDbjRRbeWyJLTttbO8jtIFi8CFV9KyT+cVxl2R1xhEypaH6GSgbFGYs5Y5RKp7s5
         yqPSu6hZbv8YikUENf53YiPtgTK/GhVEyBhCEnEYBWyw72klsrBkxHa1ZY2kSGOM7FiL
         ArFgkdpQ+6cuaF2sM8Oza6FXl8ea6cT0b/TV6eoGbdeSsvGHNJulK8RkAJgH1YiQqtPh
         Xc7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/j0Vg99jiRjaK3ZysLQTXD/ZYgzFnD2PxivlcJMQ0NaPhJ0LvlO6AhatN9u5Ozm7TwkqqH4oIWBr5Q@vger.kernel.org
X-Gm-Message-State: AOJu0YyN0ymvUFcNT6Ez1WD0aCrpifRFlntd2nzlUB3glt/aEUeZYmao
	giiAcWExcmMYXTpve31AteDvxppGwV8gaOUIz3J1GluGo5SjCTX9140UWGYNDcCqNcz+uVpu+jL
	KiMc3/GphXL/I4mLPs4fakbkQwVUvyXLJMV/g
X-Gm-Gg: AeBDietpc6BEgZiCv1G1QlrXIFhaVjr/JVJxV+ehuI8GBzkbI1v4QQQw1Sfhr3qqP32
	z12X9BBTK+5dNLCS1wlrcSLPsJNl8zFLblMKh+cCNgIDJSc40qryhHvLHrxA0blLZun8r9Hluj7
	nmmJGyXiGDk9yqkFmEQ6OCUrqB4YsDufLljAWlTh8v46qRBgr1wxH7t0anMZEAgBGZffHBx1xmH
	eCTd4qsnYm8hKNkGVTkTuZ4P/j9KfwylALnjvLZ/8CnMyZY75BXYRBpjNjAflMIfW16zhUnxXmw
	/Da+EDWZZhtF7MrMbA2nDapXgMwFhnvl3JT21PmtPVtkY8rRvME8otrLwm6J+YbDbFxpDQWysoc
	0tnNNH0HNbnJ2pov9KBH/YukZGqkfgV9l8wa9Xhc9z2B+rQ2lWCtLZjQ=
X-Received: by 2002:a05:6122:4b82:b0:56c:ce0b:fecd with SMTP id 71dfb90a1353d-56f3bce78b3mr9047810e0c.12.1776202871351;
        Tue, 14 Apr 2026 14:41:11 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-95691131afesm346899241.1.2026.04.14.14.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:41:11 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: 
Cc: Alexey Charkov <alchark@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hsun Lai <i@chainsx.cn>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	John Clark <inindev@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 2/6] dt-bindings: display: bridge: simple: document the Lontium LT8711UXD DP-to-HDMI bridge
Date: Tue, 14 Apr 2026 16:40:53 -0500
Message-ID: <20260414214104.1363987-3-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414214104.1363987-1-dennis@ausil.us>
References: <20260414214104.1363987-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
to HDMI2.0 converter, designed to connect a USB Type-C source or
a DP1.4 source to an HDMI2.0 sink.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index e6808419f625..752c736c8f85 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -30,6 +30,7 @@ properties:
           - algoltek,ag6311
           - asl-tek,cs5263
           - dumb-vga-dac
+          - lontium,lt8711uxd
           - parade,ps185hdm
           - radxa,ra620
           - realtek,rtd2171
-- 
2.53.0

