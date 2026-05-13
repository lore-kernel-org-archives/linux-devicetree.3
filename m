Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D46137BE80
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 16:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689013; cv=none; b=QcEXh45g2pW9YD/aX7zzxes2FIbZIi//MzP/VL42Iqp/KhSd1CZ4Mhcjw9ovHBCwI+5Nhp5vSlSw1KsrsOPHbu1rreC5OhZIXmHX1J/CHGetquh73y0FlMmGmxn07WFvVcwA1UG87T4L0j93a2icKamUSynZzdwu5RXbr371dJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689013; c=relaxed/simple;
	bh=2JSIVQf3pNJY4EYTYCVsNQK7eb5sjQAmkoDKyz88zug=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H9xJN5p8cIhjIrHgbVpacI1x5eB4/mXhmTWsR8LMbjttVjzaMQXsl9d1L3L37zwHZA0lMbXLRtel2slwFHi4yGWgCEuEEXuuc0LKexEw84bK6FhQ1PUjixLxHFs0yKQAtpZx+/ElAIjkjobrvFWaZd5rXg9AjVmuEEmSyfVy3QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1wNCGL-0001Rr-HZ; Wed, 13 May 2026 18:16:45 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 0/2] Add NEC LCD Technologies NL6448BC33-70C Panel Support
Date: Wed, 13 May 2026 18:16:38 +0200
Message-Id: <20260513-v7-1-topic-panel-simple-nl6448bc33-v1-0-9bd4b7d0eac0@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOajBGoC/yXNQQ6CMBBA0auQWTsJZaASr2JctHXUMbU0HSQmh
 Ltbcfk2/6+gXIQVTs0KhRdRmVKFOTQQHi7dGeVaDV3b2XYwhMsRDc5TloDZJY6o8sqRMUXb96M
 PRBjIMpE3o/MGaigXvslnn5wvf+vbPznMvzJs2xflPQb9hgAAAA==
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
 linux-kernel@vger.kernel.org, Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Add support for the above mentioned LCD panel from NEC.

---
Steffen Trumtrar (2):
      dt-bindings: display: simple: Add NEC NL6448BC33-70C panel
      drm/panel: simple: add NEC NL6448BC33-70C

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 28 ++++++++++++++++++++++
 2 files changed, 30 insertions(+)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260513-v7-1-topic-panel-simple-nl6448bc33-c36e33b18ab1

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>

