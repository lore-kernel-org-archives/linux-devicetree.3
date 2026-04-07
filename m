Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8620C3A5426
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554311; cv=none; b=Mg8upDsa09ATXQfYOpSOM10YTkio6kNKzlTFdJIE1VfYG5Q/65t702YizSOqUbEJOT1yhGHVVOIk/+4x0UQ7cgwA4BI/7TDZVUpalvKCkYcwptOrIssmXT/ZzWT+CHdvVsBnBlN2Kpjm0ddp7V09bC+qBue93XZtwFdaSWBbw3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554311; c=relaxed/simple;
	bh=Ezwkno3FYJVXfjK5y0em4sCGP7i+SHso4lqwBQiy+ns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gsXzgHwSo+qxM53HyNiSfWKrBexA6hpnK5MiKuDfAw8UpJNsCmH8ChfGjd4W+/ysHvMEE2bBqQ4ZPGGOxenWVTMyd7kQ/IkX4oUh8Mr9KbQG9r4GixsHQW2WeudkmwOThvRIe2100IJLgHefAf1ctOJ9E9m9sJjFX62JH+gouxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1wA2mX-000742-7w; Tue, 07 Apr 2026 11:31:37 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1wA2mW-0049fm-0p;
	Tue, 07 Apr 2026 11:31:36 +0200
Received: from [::1] (helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1wA2mW-0000000436p-0cHG;
	Tue, 07 Apr 2026 11:31:36 +0200
From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Date: Tue, 07 Apr 2026 11:31:16 +0200
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Startek
 KD070HDFLD092 panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-panel-simple-startek-upstream-v1-1-76721696655f@pengutronix.de>
References: <20260407-panel-simple-startek-upstream-v1-0-76721696655f@pengutronix.de>
In-Reply-To: <20260407-panel-simple-startek-upstream-v1-0-76721696655f@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stefan Kerkmann <s.kerkmann@pengutronix.de>
X-Mailer: b4 0.15.1
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: s.kerkmann@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Add Startek KD070HDFLD092 7" WSVGA LVDS panel compatible.

Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 868edb04989a5..2a6a41349e5f7 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -302,6 +302,8 @@ properties:
       - shelly,sca07010-bfn-lnn
         # Starry KR070PE2T 7" WVGA TFT LCD panel
       - starry,kr070pe2t
+        # Startek KD070HDFLD092 7" WSVGA TFT LCD panel
+      - startek,kd070hdfld092
         # Startek KD070WVFPA043-C069A 7" TFT LCD panel
       - startek,kd070wvfpa
         # Team Source Display Technology TST043015CMHX 4.3" WQVGA TFT LCD panel

-- 
2.47.3

