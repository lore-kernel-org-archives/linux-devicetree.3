Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7A6387379
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 21:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202875; cv=none; b=L+Hp9oo95qmJhOUnbY+ncC5q9AFxl1m/BwrXB3+9orv594LWN+BfHb6m9d1JIPyxfYvGNIe6/Jw9LNvmnIId1yILNyqCuV4ntKPTcxEVie6gAl4qTAy7M9Cs3MC23Rl1Epe7kXe/D40hTlwd702eSFbMRon5wUiU0idkCRZYFeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202875; c=relaxed/simple;
	bh=/fl6WijU+8IhbOW+pdU8bcrrWzntxAoPnnYQGKXoQo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdUCIs8nlLXtLM/9byhwfosZfIgWm1dlXVkmekKe29ZydFqoL2mpjoAf6Eu4u5+HVqOrdo9n5e7uvt1jK+n96Wr9L7+/Q9uYhTtabQnthDFwPPY4zcYyGQbE+Eq3ENs0XFWY7ZQ7isOY9kMc33IGHJA0wYBigjdiqxkqXhacVdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=TULWgx5T; arc=none smtp.client-ip=209.85.217.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="TULWgx5T"
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-60fbbac2938so1174423137.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1776202873; x=1776807673; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iCAekC6JihikkAEuEdzid7oOkeSPTTqIBC2dONRzXqc=;
        b=TULWgx5TXsGkrKD/eitMtjv93CdrIxYe82w8vKFHpMZHC+npNrzePOoI6/rykzDxXw
         +0a18gurRU2s/jUX6Sxs8wNmjFD/5S8FdS38XxwSQPA0gpubsuxF7VfeTW0/XBbpH73D
         wDrxgQLSQ44SnOqQh3JNMg6Ll3xFuYY0ppVrnWXJyPP+5XeXIzDW5eTwwlC0uTbcccQX
         aZxw8cNByuVZF0HZ9cP+8CS+aVCMlsnvPUD70A+QCEk5T8Nu8I2BJH9VWiFxbEks3YxH
         Y5NWr/B8EWeG0nLt6y6uxLUTYzMNlm21dytfhnD3B0zAReavGdQJxf+Ni10rFLQWlqZR
         t82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776202873; x=1776807673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iCAekC6JihikkAEuEdzid7oOkeSPTTqIBC2dONRzXqc=;
        b=lO1ziVgRpe93tR6CjYcwWpAGTKOGNHIyQXy41+acXixO+e6IHbTxL2aizKBxW60MJ5
         YlmbKDFzsXPkd6CO3JAGkzOaJ0ZdsftOMSRhl0/pPca6eBVhLv+xcIrVIoVW5ywKXN5s
         yMZ9qW3W1qx0j/6cpx3ivSdjprb3RCfivFlP7fcSb/ZtIbW1erBscl2jMobfdYHw+fL6
         dBLS+EhvUDxJHNL0ZJ+D9ySnuXsaTe0hebVP8YSQ7CexkS3ZZMWCRk3cBRJC/u8l1OG7
         jJ5JbkMfIcZ0ggUL6C/S6cEof5IzyxpAbrexUvodH/qC9nE9yg6RyWYd6yS149pVtJ6l
         ktIw==
X-Forwarded-Encrypted: i=1; AFNElJ8puXUk1vni9U3Dlg0Vivit20wrgFMwkJbDLxnNKvqRzgqQRWN38wPUwQIEifmlgXCwUqb83xNufK2S@vger.kernel.org
X-Gm-Message-State: AOJu0YyW7QNspEW6Qo1G0Bk6TPWkRRyGwtlK95xPFmnpl+HHzjH7PF13
	Quq5I56j68CAz7J+1bKeDSPyBM74pkxGeSIXCGfkChP+ABLhmTTuuegv3d31QGzYaGUCghNGU9A
	5M9+dnpbGhDd6pTilBOk39WZ2R7GW/IIPnQzW
X-Gm-Gg: AeBDiestm1ql95MX3lFKv+hxZ5MRsCc3v6fRqljVRYFhc1VCBDp3/dTTg6ytfVdx4EZ
	x4F9ng2wo8WwhaVyW/q7Gc0c3bpwvHEzco3+Zpti8gjdmfh1d1So9smvSR07A1XC5+rsBLAbtoU
	LaShWtclX+L1PLjdpAmkjj3tO/0tQk4l+tx/HC+ffum5rvR1vKp4YYNy/rUb6qwL2pHSFzTiCJt
	F7vwd9shvBZmeMRDYmIWAYGjy2UXP2rEvGIoMgGdTo/t5rchLbateidk7qyvk3Hgkvc8VdfRWMy
	YpBC00mJ2YQK2RdFwtmf8QBmt1YTuMbmmru8SfONYZBNzbJvzhLGFp1H3IaTEZEg8pIXxiGlGNO
	1ssuJUeSDHg0AZSpd3pkjKA7aL7+T4bdzXO+VWBChOMx9jR4TNi2aXeo=
X-Received: by 2002:a05:6102:48:b0:611:959c:86e with SMTP id ada2fe7eead31-611959c25e6mr1708483137.32.1776202872864;
        Tue, 14 Apr 2026 14:41:12 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-95691131afesm346899241.1.2026.04.14.14.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:41:12 -0700 (PDT)
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
Subject: [PATCH v7 3/6] drm/bridge: simple: Add the Lontium LT8711UXD DP-to-HDMI bridge
Date: Tue, 14 Apr 2026 16:40:54 -0500
Message-ID: <20260414214104.1363987-4-dennis@ausil.us>
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
 drivers/gpu/drm/bridge/simple-bridge.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 8aa31ca3c72d..42c1f3d5ba0c 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -270,6 +270,11 @@ static const struct of_device_id simple_bridge_match[] = {
 		.data = &(const struct simple_bridge_info) {
 			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
 		},
+	}, {
+		.compatible = "lontium,lt8711uxd",
+		.data = &(const struct simple_bridge_info) {
+			.connector_type = DRM_MODE_CONNECTOR_HDMIA,
+		},
 	}, {
 		.compatible = "parade,ps185hdm",
 		.data = &(const struct simple_bridge_info) {
-- 
2.53.0

