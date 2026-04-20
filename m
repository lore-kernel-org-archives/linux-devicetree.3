Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D013A0B2E;
	Mon, 20 Apr 2026 13:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690835; cv=none; b=nObllygmSxqTE5TLAGC9/3wLbuDdRc5TtshS2EabSQ7DUtmrGf2WyFvi9aBc2n7fIfCzdjKflqE9jkoAf8+tAu+x2A6AadloyISIWRceyNSgFueI5NIOizc3qBen489WMs8fqU7Uu+7kr5ZmSI2LQJEoGqYjiB/lRWKjoog+UCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690835; c=relaxed/simple;
	bh=DZXYfp6QWN12JK94UAf//z4aI9iwSEdefEzlBrAbNmo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W2QvEwbVnNqCfgaOHoN7p1W6NW+AqkTxRgVp2QO1t2m86ysIPaIvAZxXlzUvs78LS6QqIxaF813yKHiskbM1SzienLfJ1mIAt7KswZzvDx+iHRoQlX0QVheh6EGhjviIht2izLG7W933x0CrJAXjLG1jJoW1eNU2/2DVo27tTXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XE8LHdpw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XE8LHdpw"
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37AFF2686;
	Mon, 20 Apr 2026 15:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1776690735;
	bh=DZXYfp6QWN12JK94UAf//z4aI9iwSEdefEzlBrAbNmo=;
	h=From:Subject:Date:To:Cc:From;
	b=XE8LHdpwFObG6QmBuHrYTuq/d2lL+ZkMRaeBSTBnG89btQbDDR4C3Q0FODZOoly1k
	 oJeTB3epcfUyhXYVGgLUvTRJldyW47jRPCRTbZlV1ZlJ8H9sbEsd3lSUuP45cNmRRv
	 5C1lY4oJPgbT9VxKtAn7C84Dt+W2gecPggiBF3iA=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/2] drm/panel: Add Raspberry Pi 7" panel
Date: Mon, 20 Apr 2026 16:13:34 +0300
Message-Id: <20260420-rpi-7inch-v1-0-e68d5c9c44bc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4m5mkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDEyMD3aKCTF3zzLzkDN1kwxQL47RUQ+MkQ3MloPqCotS0zAqwWdGxtbU
 Asb1zEVsAAAA=
X-Change-ID: 20260420-rpi-7inch-c1d83fe13b17
To: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=879;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=DZXYfp6QWN12JK94UAf//z4aI9iwSEdefEzlBrAbNmo=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBp5iaKtqsd6loxDQk6zOG+Wg5LO6SMLk3XWIW+x
 dAl9riU++CJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaeYmigAKCRD6PaqMvJYe
 9RxKEACHcTicuEftUlOP7S5RqAGYku8xLrKWTdYX8VXO8XuLnq86myTA7imJMyZeM/ymOEvaPL6
 ZrSUT1fuzl0H5OhJ7vNCH77HidYPPTaqYnJ/AfLaFqO5BPREjBcyUil833qcbHQnMixrZsxB8S1
 MkjBcULGIBEOg7Y/bm0TQMTgr0uXh2lKf+GnB+CzO8zdj6UQdCaCCJf9sgJH715TiQBt7IWhY2d
 qKBwdbj/xbDp7oKi/e5Cetx+pbEPC1DLQ9mT4EEBxI/uuvOcqTDpmgMpZGAz6ZrPOsVIKE8XZpt
 76PMGBw2m00hEUNHu3ANeGrms70H2rMLn+HYuXiMfMfxBuVtzdwx8nRVBmSROasrPT2fbSoaJeI
 5SF4MAvgdmw7mlTW2kemUj5G0Ae+y1irHJesn3FlUSUBso1sjcT9HMl4DOk3hgl2JcL4kNn8Is6
 fkeSmKpIkM2zyxuwIfZNBFDu293oH5Df6hRxzYdnM+sDHNPPVD3fGxlz5zemdDGuNqLBXy1UXLJ
 487O0ZfmGQlpC056nk3eEPiv6ss5EcioI7nx4CrfG85GWlG3qA1fQ9DzL22aI0XmtXiWLnzTL9m
 qNHG4Fn1cPi41w8zK5zLkG86eKEDSlV9JNsKXed06YWfTLZT0B1SbA4ltdjfXeX8spXLqEt+c1a
 t+VCXN6mtKOcg7g==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

This series adds Raspberry Pi 7" display module's panel to panel-simple.

Tested with BeagleY-AI and v1.1 of the display module.

This series, with
https://lore.kernel.org/all/20260327-tc358762-fixes-v2-0-3589d3c45f4a%40ideasonboard.com/
gives me a perfectly centered display.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (2):
      dt-bindings: display: simple: Add Raspberry Pi 7" DSI Display module panel
      drm/panel: simple: Add timings for Raspberry Pi 7" panel

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 32 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)
---
base-commit: 028ef9c96e96197026887c0f092424679298aae8
change-id: 20260420-rpi-7inch-c1d83fe13b17

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

