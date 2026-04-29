Received: from mail-oo1-f97.google.com (mail-oo1-f97.google.com [209.85.161.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8F8336EF8
	for <devicetree@vger.kernel.org>; Wed, 29 Apr 2026 04:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777436140; cv=none; b=APHDCaaYWlWP/ZU7vkHl5aK3WBj56OiLS+eDVTmE75fK+8by8OX+syDtElTI9Te4gba2IiIt0YZ5aBXig3NZI8vU+iGAdQ7xy+9uegxz+xVt5xgMD7xAhmDYnY4F6yXNoQ/yfqVLyiTqWCeCKcTIhiRwmm4l8zeSQFBi5YIqqZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777436140; c=relaxed/simple;
	bh=FOJ42zieAav8ocVCkcKSLh45lzS8XHSfrGPYjm/TzKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bSR6+/2vLl0N16MDSIx7zjEZQBKvUcSBQtPsZBbmPoyc/BGyh233gVXHwD9dyzhBvm9tAWefUWZ9u+cvcL+xhesNa/tLqGwG3xiq4Dm8gLYdNzWjZoPUB+ClghokoBeqyb1jzDBieaLqFT6lwSlyzb4xMkQQCzAJU14MSOuwjVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=OoPuHOzI; arc=none smtp.client-ip=209.85.161.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="OoPuHOzI"
Received: by mail-oo1-f97.google.com with SMTP id 006d021491bc7-6948da50eb5so274932eaf.1
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 21:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1777436136; x=1778040936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cUANSDjJgu1WXHjNheDgVJfCwB+h6we7yJfErm3QH3E=;
        b=OoPuHOzIV5mq7XaXBqqo0qTkf40ZjKBuqJ6KLwUoYjmc3mtpp8mr6G/PJaUD3ysq3q
         rBgswULNhMBLFkLat2vRLQfFnKBNfRZgAc86CD7+cfnJKy+UFNvX7jCOk0kVkmEO5WvV
         vRe9Ux49ZgVhyey4uhqqBNrXmeuSDePMPSV7/tVnG2vAPT2wxf8pmC+C9I6eZmYFVra8
         uyJkrHKAhKlZir2XImJFIPMh+C1pEuYqpCwXjeG5yRUWsnzwh5RlncSqjYYTe8iisbCY
         1s3qHMDbredsM0AjAJEzH0kkdA2phbItmV9LmXBmWGvPgUl0XSnHhc9zMK6mNOY9+W3d
         9rhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777436136; x=1778040936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cUANSDjJgu1WXHjNheDgVJfCwB+h6we7yJfErm3QH3E=;
        b=EP+hYBrW9lgO/FkDL7MUVbB7sGszNZlEJdmY5dwAqrwP5dwvXePSDVoH55Gq6TJuC5
         q3cTg+zcGTEz2YTTbqxBwBU22quUu9IYkFcY+Tgm0jKnENxPh7i9BQlJQOxd10wkUo0G
         +CN1M+jccBzPlWuJd929Z82aoyBqfLBJttYY+oI7SL5oYxGe3EmTXPQrr66vwlwYO4Ww
         iKi6s2zg96GcoQyZfNyX+b3nHJFKZWZH9i663les8x1d3IGWUFpu+IQwwXCQVE2VExPy
         Z0Mk2cF8GHDTZIWL7FTCcsxcgx+IMcBFv90dFEI67xVB8Uu6pO4wsHCMyi6xNwgNovOa
         BnKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SymfKZIGCnBXYy8v/beEeBGKeQKigWNk1oMERmkplVvy/WoKkGMsaq55E93JuzrPhw5af5xCcDHLY@vger.kernel.org
X-Gm-Message-State: AOJu0YwCvqhB/EA9PCFdrlIJWKDv059neP69AqaWDBm+7BtTZX26qvbO
	z6K+qmzv1BMlLuGs9KjsctzE7zrgpjCn/30KkImVPYM2jIoFphQLvzHvTQKVsR6uavsaXCiEjcr
	vZgC7m5IVmpW7tWF11XfmsQxtq0yXh5TGTRpz
X-Gm-Gg: AeBDievQ6qbimEiYO3cduwO9Wstj6tPDOR8SiJAg7nePv0iiAHwwwppuiqbL5Y8KK9O
	s3toh+WYit1cUDUKo/44XA/Yn8uFsuThTmtlBy6RhhRC+lXC3lUHKtuOJwMQagO4APuBHCc0oBE
	qZ4EO2vDcvZrLuwowthwL/veJnzfv2qZUqMTz/Q5jrpLzt22RetH4pKRnJbGKtt7ZjrcNYiBs9g
	jbtjR/0a+ALVTI2a1qMr1yllYF4CmHsVE+Pql5wD1IcR8DR9NmmuVSF6pzi7LPrNlIzQrJjQ/uf
	i39No4bdxrrwH4kANNCBZW+fozmkiAo4HjycGf2taUFBTFH2RUFlZ4/q4Qb9/EoYqy512n6yFA8
	Ea2UJO5mx1LjqkQqRavELdPgz/rw5EwizpUHdUBxoSSYgU6MM6TjQ/VU=
X-Received: by 2002:a05:6820:2210:b0:67e:2a62:35ba with SMTP id 006d021491bc7-696699b7162mr686474eaf.15.1777436136286;
        Tue, 28 Apr 2026 21:15:36 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-6966baf952asm41557eaf.9.2026.04.28.21.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 21:15:36 -0700 (PDT)
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
	Dennis Gilmore <dennis@ausil.us>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: display: bridge: simple: document the Lontium LT8711UXD DP-to-HDMI bridge
Date: Tue, 28 Apr 2026 23:15:26 -0500
Message-ID: <20260429041528.558254-2-dennis@ausil.us>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429041528.558254-1-dennis@ausil.us>
References: <20260429041528.558254-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
to HDMI2.0 converter, designed to connect a USB Type-C source or a DP1.4
source to an HDMI2.0 sink. The device can be running uncontrolled or it
can be attached over I2C, the bindings describe the uncontrolled mode.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
2.54.0

