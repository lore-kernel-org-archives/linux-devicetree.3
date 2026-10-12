Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59682445AF6
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789947; cv=none; b=lFmH97r2DPkusjEIOZGMjymvqp30FpS8KxLinHQG6+7caxzB4TdiNOXDGomn93EwpvLLpR5iIGrKCAIZb2MtDQWkwVMbsDOhVTEkGgSfuxw4wg1wKqp/d6X3J4b4Yp1mmiAYiXxRC9bAxL9YuckMQr2mBsKa2Y7HIdG9N8ThSI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789947; c=relaxed/simple;
	bh=JjLidMvr1YDLvezUjQIwYZRPs4jlhVV3DhAMdoV3R6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQnQmqPpiokyiKpkGl9AXwu7GwyQ+buqxwNksPRj95Y+LlTr0c+TODN1N1qfF0w9b2Ud98nWZQWjdNCWGgXsvl5LGkXHypXySzre2ewjPCdhZZtaccusc4o4/QG/JyEqzAOrIRjqJSIj0irMfyPb7A6mRVBRdu4sxlKABDOSWk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sx56zVzJ; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sx56zVzJ"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48b042c0759so1079251f8f.2
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 00:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791789945; x=1792394745; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GLPVlC+6axKfDRySa5Z7wZIL1eMBWodDTbsl5nbJ71c=;
        b=Sx56zVzJ94PGY9Jn4kudXvflkrDi7VEc8GGRvmrmwSTc3CBXkzE+nPzMM/WhAMaz/b
         1NKWdYPXifjOnjJmk5HqbUV5DrZF7iCr0kaTnEQHf/J3MnZRY1XtJULMLFzjFA/lYyHO
         89eBJdbLBgknPNp9HgHrPUYQKLoOHbFTHEbmewyi1U0xep5uGQ75i+/NM11ypkQiWcki
         l7yOWczymFDpAyEqd4C2oBeKfU6gQeiUhuICKrPt/rrbXWpndIRC8FdAnsSWPQgvB+fo
         aeXOPk20ElOFg3ksqN8JPTSFskDFJnopAA7iHFxZlbvnE4VDpCTQIgtnlMGPLgUytLOb
         G9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789945; x=1792394745;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GLPVlC+6axKfDRySa5Z7wZIL1eMBWodDTbsl5nbJ71c=;
        b=M1W+anN5hhMXBCBOXORFkacKmw0Hc7j8KIK9TyRU8SnI820bfqZQp9tLtloDBebIq2
         n1TUKpUvnrJ2KZzMun7nm9t2XCyJrshB/D2Kp1Cw4nYlzxrjtUdXHTh67LcTU9aBGav5
         tFJWUR5BowUQ9RcgOV3Tuw3Z77liD8TKZjvR0pdS1SygN5shl4iayl4B2XWNtxUSspKR
         TSslqAZrGVY+YU4VbfrOpUyBPec3PQLzoUnPiF7Lyacyv8vc0g3h9y18GOhnM42MCrNR
         FzH6NvKCguoW9oGJX184LNPT5UNqnEMXCW6G/OH0splgjLkUZec9b5a8ovdTutDbaHho
         /Tpg==
X-Forwarded-Encrypted: i=1; AKwUvBylIh957NYClYD0nEOqKDoN3X+eUNXBq1ZY2Iph+TT48FjE3fdBrA5/CbDaEXjVT5YDHC/p24aCbtA3@vger.kernel.org
X-Gm-Message-State: AFq9FYLt44RY5vneT7tD30Sj2q3k4ndUxhS+Sk882KyT3ZbUy7SPp/Xr
	CJAtZJdVDH2k1TApPvPxrU7W47GY656yLyzkiDPK/FBq1c593R4lv6nH4lzmWfT5Em8=
X-Gm-Gg: AYBFou3OOh+GdsiM68Lqu2ea/QIcD7cY0dFwFqh6dBhpwrybSI1FUQBc2C1D9AuDkpa
	cCuAFOD0gdmGaDXAPtBnF9SaTjS8MLYaFAO6aIBT8uH55nVXfDzTry/2R2NA2c1XCTnArjVG6c0
	AU2oIA+BFDZlxvN0tFMfK6zDwsJnAMkJmpDBn5x/FuCiWCTcJMJQSj7XfTYRjaFR+XcUf1kPn+E
	uuT6HkKs1rSPa0FzavOvXQ4VyDb8YKENTOm9Gtqji7wRDSNCl9wSNZNnRd4WUj+ZJeoLNx0G5DW
	T00Rs/2kFwcF02PukWqneYR85dU3OtpTW7ONdopTys4GWXeoMubG1thD88YwvRy+tlJoNzZ0WaG
	q/DJi6g2OrnUNqBLopfr7D6zTcNInoUQAYVhZhOTlFcHinKxcVzxekSoLbgvlay46TKn4YIcDQ/
	8v7h7SAT8iwAAnFrtQRHgEpAsjNaf8mtZPKp1BYko8RmlUgReQHrTOnbYLSah7/5XLEwxDXQ+L4
	lMlbK2ezWvG4ctfxa7kDUNaTpUmiWx5NwFgujtBe1AtKqGW6j8YAJ9Y69y5KI5c3BKUob6GHEc=
X-Received: by 2002:a05:6000:29c3:b0:48d:c15c:94a5 with SMTP id ffacd0b85a97d-48dc15c964amr8654279f8f.14.1791789944272;
        Mon, 12 Oct 2026 00:25:44 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aadf9bsm17523377f8f.29.2026.10.12.00.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:25:43 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Mon, 12 Oct 2026 04:25:24 -0300
Subject: [PATCH 2/3] drm/bridge: simple-bridge: Add Toradex RGB to VGA DAC
 bridge
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-v1-apalis-imx6-enable-vga-v1-2-8905d8746504@toradex.com>
References: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
In-Reply-To: <20261012-v1-apalis-imx6-enable-vga-v1-0-8905d8746504@toradex.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791789940; l=1350;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=FKye5mFa3sfDemE79K6SG+Q4irfMpkj0xAlYwYUAH/8=;
 b=4gNcdbAkP/ZiHikm++CidN8Fg36WinGvfqCWvKISeLt6d0w54Kss0AyxWHJbCrRJwOu2/kOcV
 8QKluP6TaXpDlREVlJEhq5mYay7oLM2OaFtIyVnaU7BXUcqtKIeCnLJ
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The VGA bridge on Apalis iMX6 consists of a simple resistor ladder that
converts a digital 16-bit RGB signal to VGA. The VGA output is gated by
an active-low data-enable signal.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 drivers/gpu/drm/bridge/simple-bridge.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 3fba7002322e..3f88fcdfa214 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -253,6 +253,10 @@ static const struct drm_bridge_timings ti_ths8135_bridge_timings = {
 	.hold_time_ps = 500,
 };
 
+static const struct drm_bridge_timings toradex_apalis_imx6_vga_dac_timings = {
+	.input_bus_flags = DRM_BUS_FLAG_DE_LOW,
+};
+
 static const struct of_device_id simple_bridge_match[] = {
 	{
 		.compatible = "dumb-vga-dac",
@@ -312,6 +316,12 @@ static const struct of_device_id simple_bridge_match[] = {
 			.timings = &ti_ths8134_bridge_timings,
 			.connector_type = DRM_MODE_CONNECTOR_VGA,
 		},
+	}, {
+		.compatible = "toradex,apalis-imx6-vga-dac",
+		.data = &(const struct simple_bridge_info) {
+			.timings = &toradex_apalis_imx6_vga_dac_timings,
+			.connector_type = DRM_MODE_CONNECTOR_VGA,
+		},
 	},
 	{},
 };

-- 
2.43.0

