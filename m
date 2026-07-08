Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28AE63C9EF1;
	Wed,  8 Jul 2026 21:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783547052; cv=none; b=RJjFgvquACbc/tIl8/ZtqMxZhotjpRYo71XSe2ZS6iwtmWKdxxF4mOW2cxLw9tZjuxViLopqDEpXSDQEA5SRIXeh9L5p9MuiQe/7nX7EwP9cmJhSXxXDJ78sfEgmWdPwHVc6dRGwPFsBJXS07rIgrl3be/dp3N3Q+TnnYapufD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783547052; c=relaxed/simple;
	bh=w8+pYSms0lwUluIjPAcWPuQPnTcRn/zqXYAq03tbO1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VFMbit9xCGKWo4OSIqmXx/554s2Ctl9yw/cxAi6hwk6KLPBgNGCAivIonyBylgsTYgCu+NxN9z8LIZQtQTbJ5H0Hv+UADRJZ/RTtYG1GW8X/2rUxCXAFNNBLQmEjt2pQm+I3Od+AreYyRfpft3+VgNPu0letwZsnvLmlC2A6kWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=Ylk0mxJO; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="Ylk0mxJO"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 662053D8190E;
	Wed,  8 Jul 2026 17:35:02 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id ed5H0eN-mtUV; Wed,  8 Jul 2026 17:35:01 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 787643D818F8;
	Wed,  8 Jul 2026 17:35:01 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com 787643D818F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1783546501; bh=ISQ48c3mOFOqvlCO5hXpDQe+QhoL8W7YsHgDnPklDU0=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Ylk0mxJOJ8d0Q2mc6OuRdVM1bjGs4aeuq07KtsE87ks3zY0OKjRB2hkOvjxCV6u8z
	 EagDlOx/Qcax8z5qHhZ/+dye0Lw9WbUhuw3LqiiyNq5XP6DqQBzmXaDWQPXNg1VE/o
	 3fY9LJ7XHNa4pZjFHlI8g6r3oP5KAEpnTYo0nO1aKA+qoc5R+rENuHr30DnBA/Wux7
	 xqdvavtTLjWqOUxeI4Qc7H9onmUab9v060s0t5Xo4nhZ7aLGpUwKj+4WElCBMVXyi3
	 UxzXNnTAuzvWXokQrhb5cuacoEpSzduwxPko22HQ8cF3QArEN86+6Saf2YC90mZH4j
	 YoKFxqyp5nM+A==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id foq-ZqXHIKzd; Wed,  8 Jul 2026 17:35:01 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 401573D818E6;
	Wed,  8 Jul 2026 17:35:01 -0400 (EDT)
From: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
To: Jagan Teki <jagan@edgeble.ai>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
Subject: [PATCH 1/5] drm: panel: jd9365da: Enable LPM mode
Date: Wed,  8 Jul 2026 17:34:56 -0400
Message-Id: <20260708213500.1867092-2-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260708213500.1867092-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20260708213500.1867092-1-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The JD9365DA-H3 uses DSI LPM for command transmissions, make sure
this is configured correctly in the DSI mode flags.

Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfaire=
linux.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/g=
pu/drm/panel/panel-jadard-jd9365da-h3.c
index f6b04de1182e..1ef0c937863a 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -2950,7 +2950,8 @@ static int jadard_dsi_probe(struct mipi_dsi_device =
*dsi)
 	else
 		dsi->mode_flags =3D MIPI_DSI_MODE_VIDEO |
 				  MIPI_DSI_MODE_VIDEO_BURST |
-				  MIPI_DSI_MODE_NO_EOT_PACKET;
+				  MIPI_DSI_MODE_NO_EOT_PACKET |
+				  MIPI_DSI_MODE_LPM;
=20
 	dsi->format =3D desc->format;
 	dsi->lanes =3D desc->lanes;
--=20
2.34.1

