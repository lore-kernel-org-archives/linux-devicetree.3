Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27D3330B11;
	Sat,  4 Apr 2026 03:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775274216; cv=none; b=q3f0z90g3CGhR215dGfOsu3IASCUUFwP946KQo2KIf5JDe8fDuFU689stmBh/RRbR1xkoxgYx0i66sDee4UqAxdNd8A9mlNqBdD970vb3SJ7NSxRkhNSsfKxV+zhGkNzVIbXktjc5T0Oj7HS0GjWXZVm/hP5pewhNJA9eeIxW4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775274216; c=relaxed/simple;
	bh=pRnmnrTmE+ikVqEBzeaSkUWijDFsiTJ34wLaCly78Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+9OASXMaGhwvclq/cInrvz2NpjjknLx9XdzysqB3BStUgXvy0iTZWDQNBD2Rojo07Kefev8hQPacvPgGinndVTcDT25oUXV+hqwo40oHwpIr8VOmKII68tjYHQURThw+tkTiemDLAa3LJaOtoE3oHXL73JcaH21J6bJEnjxp1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=iq/lKJSP; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="iq/lKJSP"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3512A11318C;
	Sat,  4 Apr 2026 05:43:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1775274213; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=h6wIIaRFFj8JC9hws3qHQJizd8HJOnG+vI1AxHqo0Gk=;
	b=iq/lKJSPkBO1D0odCziEOhLdxzbCcskYoa2Tzli8ERgBPJjMOPrTi4mFabp2e8gGm/eY1B
	Esbdo7zZCt9NhepxG0x5BMgeIfuBeYDIH3MfTgYdckEkrEA3hOoSO1RtyOkEiNTt42uxP2
	e74rwPDJJOlXxyaGMmgPurfCHtas1/4oFUXWzu+HIKzTyiTiHUcBEol66quMtRXQqdC84w
	uDteAUgakos8DhoT/nV+rRGQKmk882Gs7xwq9DzkfZERPwruBf7kShfSH4yLFWBKxYRM7Z
	Oxc6GWyN1X9WbaD9lTRgWTArruCpXYTgBJQm6I1hjLX27Pt+YyjKnGLc3hg3NQ==
From: Marek Vasut <marex@nabladev.com>
To: devicetree@vger.kernel.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: display: simple: Move Innolux G156HCE-L01 panel to dual-link
Date: Sat,  4 Apr 2026 05:42:50 +0200
Message-ID: <20260404034321.341210-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260404034321.341210-1-marex@nabladev.com>
References: <20260404034321.341210-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The Innolux G156HCE-L01 15.6" 1920x1080 24bpp dual-link LVDS TFT panel
is exactly that, dual-link LVDS panel. Move it into the correct schema,
which is panel-simple-lvds-dual-ports.yaml.

Fixes: 3c5e8aa44dfc ("dt-bindings: display: simple: Add Innolux G156HCE-L01 panel")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 .../bindings/display/panel/panel-simple-lvds-dual-ports.yaml    | 2 ++
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
index 2215bc10bd67c..8a2f6feafd375 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
@@ -44,6 +44,8 @@ properties:
       - auo,t215hvn01
         # BOE AV123Z7M-N17 12.3" (1920x720) LVDS TFT LCD panel
       - boe,av123z7m-n17
+        # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
+      - innolux,g156hce-l01
         # Kaohsiung Opto-Electronics Inc. 10.1" WUXGA (1920 x 1200) LVDS TFT LCD panel
       - koe,tx26d202vm0bwa
         # Lincoln Technology Solutions, LCD185-101CT 10.1" TFT 1920x1200
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index eec78daf946cc..1abdc8698a865 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -178,8 +178,6 @@ properties:
       - innolux,g121xce-l01
         # InnoLux 15.0" G150XGE-L05 XGA (1024x768) TFT LCD panel
       - innolux,g150xge-l05
-        # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
-      - innolux,g156hce-l01
         # InnoLux 13.3" FHD (1920x1080) TFT LCD panel
       - innolux,n133hse-ea1
         # InnoLux 15.6" WXGA TFT LCD panel
-- 
2.53.0

