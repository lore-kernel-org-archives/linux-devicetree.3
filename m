Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437AE3C3BFE
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090480; cv=none; b=jEcWAAlD5OqsvsXLCL7MaSaG274RgTPtNqjw0FoJEsgTz8XLv0qOCz/I1FTrSrt2522a7WFYY5v/qo4J2YY1FsPOIQ+bKc/E422JoO9IUICFtr9KkkFQjUb1CAaL13P5/BJFt0A5gW+Tg+GGWORsqA6yR6gyiDLf2q50rjjblNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090480; c=relaxed/simple;
	bh=L7ViCIJqSTOsvx0ja6YkbtMh40A/P80lYbjqblDJskA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MdsBsxox3G2vy8Jx7ZiLEHg3jSi8j97sEZ4r25sUsaM1ohpYEjW9xuqiP1O1ehvGnp8CeYmxOon3QzKPGB5YMC5WZ60+fSyCe16dzOp3Jhu7bR12/Akzt3xmntQOOXSJZFA8g0RtwQI3Ym7o9B4+hv2NOQM7T8LRsKEhczi/PMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1wOsha-0001Wi-Na; Mon, 18 May 2026 09:47:50 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 18 May 2026 09:47:45 +0200
Subject: [PATCH v3 1/2] dt-bindings: display: simple: Add NEC
 NL6448BC33-70C panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-v7-1-topic-panel-simple-nl6448bc33-v3-1-21ea14a6e835@pengutronix.de>
References: <20260518-v7-1-topic-panel-simple-nl6448bc33-v3-0-21ea14a6e835@pengutronix.de>
In-Reply-To: <20260518-v7-1-topic-panel-simple-nl6448bc33-v3-0-21ea14a6e835@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1043;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=L7ViCIJqSTOsvx0ja6YkbtMh40A/P80lYbjqblDJskA=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQxbXEZWTp/wr7U5s8H51YsMCsypn80z7hyqPObmVJVu3W
 Aa9XeneUcrCIMbFICumyKKysIJP1OODZ+Q0ES6YOaxMIEMYuDgFYCLx1Qz/E4OXhnoXqz8X0XBj
 TvxkdT7uyvHoIp206HXxxwMXJq0sYmT4s7ZFsfZI2+5Ur6j1dsymwgbzZU2dMpUUJu7xu1H9w4o
 fAA==
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Add the NEC LCD Technologies,Ltd. NL6448BC33-70C 10.4" 640x480 LCD panel.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 3e41ed0ef5d51..96d218f78b0be 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -232,6 +232,8 @@ properties:
       - nec,nl12880bc20-05
         # NEC LCD Technologies,Ltd. WQVGA TFT LCD panel
       - nec,nl4827hc19-05b
+        # NEC LCD Technologies,Ltd. VGA TFT LCD panel
+      - nec,nl6448bc33-70c
         # Netron-DY E231732 7.0" WSVGA TFT LCD panel
       - netron-dy,e231732
         # Newhaven Display International 480 x 272 TFT LCD panel

-- 
2.53.0

