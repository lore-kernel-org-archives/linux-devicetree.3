Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8632E3A543D
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 09:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775554310; cv=none; b=sRD7uzyZAZfvWGCyuyNfa6eTDS28mK0+sMa3NyLsMYhZ79IzBtnMDNlByLnd/MAejLXn1PlT1juvTYI9fOnLQA+wDrzVKdA93+Ao7rA4P/jiAjBIGasWjhLHzCRgNl0h8Tg69/BDFSy0QB/sMXRqhJGYxFdBCIKQOmzA7B0NvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775554310; c=relaxed/simple;
	bh=d1ViQ2H0Ct8we8TBnkV6VBIctgNAw5Z+R/8E4M42DfQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iR1ZMV4+VqnT6Hb0z3jeygX+uWq7cdHILjQFMPyFmH0NSA6AdUa/m6GeOSsFv+fiwRQ1ZDtPgccYsRFVmJxCpCJZruWgcoxQ+XQwbP7aWzWKi7jrmQDF6Wm5XFhqC8Ix3u1f287bJTft8LfQPDQnUYebMuuEDi8llkEetWlGDYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1wA2mX-000741-7v; Tue, 07 Apr 2026 11:31:37 +0200
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1wA2mW-0049fl-0m;
	Tue, 07 Apr 2026 11:31:36 +0200
Received: from [::1] (helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.98.2)
	(envelope-from <s.kerkmann@pengutronix.de>)
	id 1wA2mW-0000000436p-0bKP;
	Tue, 07 Apr 2026 11:31:36 +0200
From: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Subject: [PATCH 0/2] drm/panel: simple: Add Startek KD070HDFLD092 LVDS
 panel support
Date: Tue, 07 Apr 2026 11:31:15 +0200
Message-Id: <20260407-panel-simple-startek-upstream-v1-0-76721696655f@pengutronix.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOPO1GkC/x3MQQrCMBAF0KuUWTuQFEnAq4iL0HzbwTaGmViE0
 rsbXL7NO8igAqPbcJBiF5N36fCXgaYllRksuZtGNwZ3dZFrKljZZKsr2FrShhd/qjVF2jgi5+y
 iD2Hy1I+qeMr3/98f5/kD2Vi57m8AAAA=
X-Change-ID: 20260407-panel-simple-startek-upstream-7eddd07166c1
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

The Startek KD070HDFLD092 is a 7" WSVGA LVDS panel.

Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
---
Stefan Kerkmann (2):
      dt-bindings: display: simple: Add Startek KD070HDFLD092 panel
      drm/panel: simple: Add Startek KD070HDFLD092 LVDS panel support

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 29 ++++++++++++++++++++++
 2 files changed, 31 insertions(+)
---
base-commit: bfe62a454542cfad3379f6ef5680b125f41e20f4
change-id: 20260407-panel-simple-startek-upstream-7eddd07166c1

Best regards,
--  
Stefan Kerkmann <s.kerkmann@pengutronix.de>

