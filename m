Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259634D957D
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 10:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405244; cv=none; b=NvUu9imyW4fb1qfTVlZM9Lm9tsaEZ/Hfx66vy5CKbJ3pYVw44gUtaHPD4AGNpnq71w+GzVPXseZW9hHl96FuK7icjh62q0N8z0t/B/e1zU8py8jiTno+X+2XjnqV465MCEeY/gsomxqlDaq0gM/9s1jMvzIW/vXV98Ez6AWLCNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405244; c=relaxed/simple;
	bh=9EMRcKreP4doQsnkOJ6fF7O/xO+9vD1EZaaP/H+owrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXUMd4BJoImdawrvOjMexfeEWUmD8la3Hkjsat5F+4CTVLbEk67APkppGAZGxWo079hWKOD+oJHtf8Rq7zQNPJdk+TssndWR5qGTJJD3REQ25NjgoNI2FVwkCNvTO4NdnG1JKTctljY+ca7HRDgDdVlp8HDxZYVbOUPuMxZCtkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eVAzV7EK; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eVAzV7EK"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15354aa70e8so646119c88.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 03:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792405242; x=1793010042; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wG/mmn2fERUKjshAXPMhmIVjTkfUkF1Vhr38NpDvKtE=;
        b=eVAzV7EKnGQllOWafEZxbc9MKRdne/yyOpx4oOIz1GPoOPym7eE4lC7NgwlkD0KaAa
         n6qp0gCjs94E47YXDYilmbD82VGgKZyAAJtL8Pi9kHB0AGGkOh2RFunVJbf6t37ckK35
         pKEQVqyHHajQn/UwVnexF2MBeaKdsjXI7/2EM+JULEMw/FlL7/pxJcUQO1GM/Hl+L5xE
         5qY08T/JPnZBzPn9i5Rkt4q8opSBONZPXpQAFKb+hmJPDnLSVye1zv6Vva2CNwghQuFv
         bBD80896eBaXjx3V4Fnu7Z76JxUpEWf9RfvgKp9dj6mQyOyWBVajRq+pI5WGTMFw1mm2
         RgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792405242; x=1793010042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wG/mmn2fERUKjshAXPMhmIVjTkfUkF1Vhr38NpDvKtE=;
        b=hYC33o4MZQC9Wmjd8Ut536sq5cK0lmSyzmAS5lXp/n14Lm2Z4lYyCHn2iWKbRSLpQI
         WdFWaHM5xh9hKbsCl/dlWak/rm37i/bN0bUtDcPqrWIW1L5G48R3oArjk4EIG2mF9KwK
         9PFgBch2CajI/D30APkxOY0NFuYAnz9Tv93YOW0a5Q/f2DMDJCFppUs+RnI6x85B5/vF
         8KlC5RTYh7F3t0fX+CzaN8ofGOoluqJB+dnwRVjRI3YZDdnkIAril+jn7SGW5KVeY902
         Pt30+OQ1V6Bo25TXehE0yrjKnrDUjZ4DmJQejrkRNMKOKWE15hAOgslcJRP+Y+u4ZTbz
         qKLw==
X-Forwarded-Encrypted: i=1; AKwUvBwv2jQiw8ic6xC8fcvfZLL3lploN9iPS/fzllXGe8KY5HzAMv9JWcHARgXedalziFv4C/evekL8fpJi@vger.kernel.org
X-Gm-Message-State: AFq9FYKTOHpHaTGAuip3+eBZKVbwI/p/yMJZvRsECHp7/1320rFJOOt8
	ytqEyItXYuzIwj8QXpI0rSExHgUsbPVQoynLTN6S4SwNUdhnkjCtxjKU
X-Gm-Gg: AYBFou3JSC4x03/8yyi8qgN7Hgvo+rNePLcfYwV+WwmVI/gnf5CQpx1Fb9Txwx/hLDS
	HGsjutBCc1XWEGGfiJJb28gBCYwN9YPqBnaZeY2Gi7FRiWULuc7/WwDPeHd8CAyBlxkNtm0xxCu
	uMg8r/g4PkLNnWjicieGIa3I3LGx+euiE1OEDnfueR9nb4eKO8AaUks48rBl/chUUyFH1z9tj19
	ANpOA2TSVlK0pc9byHArqZoV/T+vPOMOJLixD51qHJ7VGAzI7ImrBS+81upqNuM7t6YYaVpYTQu
	YTbmj9bjnbg5DpA797xHetEqvUw9/Cakbr0vypY7mDSoarfjjS5cqSRY00GNDxLHKuev2mGweH4
	RFh3GUgTskRPVacwP27dx9u1hvdFWeaJkfMp4yIcRiUgbz67p5wpuYPHGNn8rn5VqbyBku9TbfC
	JlE8fJsdQZ2BbTW4S4yfmyqAUZTriH1YVkxF5FC58xpIDDzRhvBTUYO4KKPyhGgT9ybZDgrCYzO
	LAb9H+JhcMllQ==
X-Received: by 2002:a05:701b:424d:10b0:13b:4ab5:41d7 with SMTP id a92af1059eb24-1850c9cf427mr12119481c88.3.1792405241814;
        Mon, 19 Oct 2026 03:20:41 -0700 (PDT)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18319d3b880sm26324251c88.10.2026.10.19.03.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 03:20:41 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 19 Oct 2026 07:17:15 -0300
Subject: [PATCH v2 2/3] drm/bridge: simple-bridge: Support
 data-enable-active endpoint property
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-v2-apalis-imx6-enable-vga-v2-2-ef6a3a780472@toradex.com>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
In-Reply-To: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792405217; l=2075;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=/IjtTShiJA+F9KmNWlJJNMy2lTKWTky2io3jmPVXXVA=;
 b=wT8coFssfadnbio6KHmF1yBAZdfjcW8j5Ftd+0jWUjv7dcyReSTM5NiEs8ga+Dm7iSM19YUzq
 JsnS98IOb0zBMI8LksAaaJsn7t3ABSIdTS+heHkDqYkDHVufmMApZIH
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Some simple bridges, such as a resistor ladder DAC, may include a
data-enable input that must be driven at a specific polarity.

Read the data-enable-active property from the input endpoint and fill
the bridge's input bus flags accordingly, so the upstream encoder drives
DE with the required polarity. The property is applied only if the
bridge doesn't provide its own timings struct.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 848c2df2a276..c5301295658a 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -183,6 +183,9 @@ static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
+	struct device_node *ep;
+	bool de_present;
+	u32 de;
 
 	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
 					bridge, &simple_bridge_bridge_funcs);
@@ -220,10 +223,26 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
 				     "Unable to retrieve enable GPIO\n");
 
-	/* Register the bridge. */
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
+	ep = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
+	de_present = !of_property_read_u32(ep, "data-enable-active", &de);
+	of_node_put(ep);
+
+	if (de_present && !sbridge->bridge.timings) {
+		struct drm_bridge_timings *timings;
+
+		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
+		if (!timings)
+			return -ENOMEM;
+
+		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
+						DRM_BUS_FLAG_DE_LOW;
+		sbridge->bridge.timings = timings;
+	}
+
+	/* Register the bridge. */
 	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
 }
 

-- 
2.43.0

