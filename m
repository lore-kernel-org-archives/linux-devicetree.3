Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB19E37FF56
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779090481; cv=none; b=AEAPOinTF5OXbTgZg0HQQXXN59SywabVdZzC4pmp51cEXkzAM71G1FHLkOLhuowNz3O27imwPpWyHGRUBmPmy0h7znz/dfseOHbz3O6OjkFjaLkqIQeZzGrrvL4l+LtoOcJ6I684F8I7NqOuM/PuuLmdc9xsj3ocFZFcAH1ZkEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779090481; c=relaxed/simple;
	bh=MlTOIVUnfbO0F6QyTOxxIW5b1CXEm6Ruuj24gBxpXDk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VAK1FObORkzpKH+YX5EmQ2efztSXfdRo/cIgmdYJmjP60gPiM+j8lAeHQmtdMKdrUQQOW30d5J6JpFporkzL7qsTRnVEG+4A/kQ3z0mK5gGACgIxZ8AeICenvFRlzMl5W0asR0So6QTs78Cgg9QN+7ksE4ATWNR4gLVg7/ZXrHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1wOsha-0001Wi-AM; Mon, 18 May 2026 09:47:50 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v3 0/2] Add NEC LCD Technologies NL6448BC33-70C Panel
 Support
Date: Mon, 18 May 2026 09:47:44 +0200
Message-Id: <20260518-v7-1-topic-panel-simple-nl6448bc33-v3-0-21ea14a6e835@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACDECmoC/5WOyw6CMBBFf8V07ZiW8tKV/2FctGWEMViaFhoM4
 d8F3Ji40eVJbs65EwvoCQM77SbmMVKgzi4g9ztmGmVrBKoWZglPcp4JCbEAAX3nyIBTFlsI9HA
 tgm3zNC21kRKMzFFKLUqlBVtEzuONxi1yub45DPqOpl/N66Kh0Hf+ub2IYt39FYwCOBx1leqi4
 qgMPzu09dD7ztJ4qJCt1Zh8erOfvMniLVKluVZKlKL48s7z/AI0uhyEQwEAAA==
X-Change-ID: 20260513-v7-1-topic-panel-simple-nl6448bc33-c36e33b18ab1
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1870;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=MlTOIVUnfbO0F6QyTOxxIW5b1CXEm6Ruuj24gBxpXDk=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQxbXERUhid+Ls/89FMn+uEx82vnTy3Rc9nB33I5XVjiYW
 rCp9LxFRykLgxgXg6yYIovKwgo+UY8PnpHTRLhg5rAygQxh4OIUgIksnMnwT7XpoqpaZtW0zefm
 ir0zTWA6LJ51fMrp6u745/GnZazV7RgZNiQpnMw9VWFj5WI22/f7p8rNRVnLkiR8pjm7sGR0XZj
 IDwA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Add support for the above mentioned LCD panel from NEC.

---
Changes in v3:
- fix bus_format for LVDS type
- Include feedback from Sashiko AI review: https://sashiko.dev/#/patchset/20260515-v7-1-topic-panel-simple-nl6448bc33-v2-0-74ab0baa1817@pengutronix.de?part=2
- Link to v2: https://patch.msgid.link/20260515-v7-1-topic-panel-simple-nl6448bc33-v2-0-74ab0baa1817@pengutronix.de

Changes in v2:
- fix .size settings
- set connector_type
- Include feedback from Sashiko AI review: https://sashiko.dev/#/patchset/20260513-v7-1-topic-panel-simple-nl6448bc33-v1-0-9bd4b7d0eac0@pengutronix.de?part=2
- Link to v1: https://patch.msgid.link/20260513-v7-1-topic-panel-simple-nl6448bc33-v1-0-9bd4b7d0eac0@pengutronix.de

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Steffen Trumtrar (2):
      dt-bindings: display: simple: Add NEC NL6448BC33-70C panel
      drm/panel: simple: add NEC NL6448BC33-70C

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 29 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260513-v7-1-topic-panel-simple-nl6448bc33-c36e33b18ab1

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>

