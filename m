Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B700E31F999;
	Fri, 12 Jun 2026 18:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781287256; cv=none; b=OkZbSXbpLumXasHw/kP37ujEFQ7Tu0mHNuELGx+igpRtltLZTIVcdjkGupznDqrzH9ff5PtLLIxCJ7kZl20B7NLyadL2tESZGrjZZU+3jo0Vj6n9cLA5Zqi2wLGktYgBK89Cddxnne9xo18EGunD7sc+xAgovdq1G2bMU9qSs0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781287256; c=relaxed/simple;
	bh=HjTcwVoSMhghtlEQN17A56Gf9uE1m/xC9fZU3wMihsQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Yl24+urMB4qSRYFkWDp4WMbbJcdh3S+yIYx2GelIcm1WkjDGQFqbi5J0SavQDoJiWY9kIkz6mi+HLLqAKGsQeaMt4RSa9bsPhj/hA47o94MqMDuOypCfYybS8G70YhEm9dj8NGmAbfDXTAhTLShl9leJYTVMWu2vGWsM8tcKoEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jFz5eFue; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jFz5eFue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1781287253;
	bh=HjTcwVoSMhghtlEQN17A56Gf9uE1m/xC9fZU3wMihsQ=;
	h=From:Subject:Date:To:Cc:From;
	b=jFz5eFue6ft7QPXzeB6pnv3/ay7PetfA7yon2bjktDDSJuyrJpOiPtnm/6ZYV3k80
	 S+zd7h2dFDnWhhvOdiiiF0Vj6rRx1/5OfIrYfRULbOJgZC5HXJkiHobOdhTaWujyp6
	 zZAp9FRkB8H02AjZzP2Qn3RohxpTbsK7EmSCxygqJvWYW+SlTN6RrXJ5gbsRHBNsN2
	 WbmA0uJBsGWR1BMdAVadRlutpei/xwr+7h6gf2S6cmcYsLb4/XwTLizda/H509j9Q4
	 HlxfjsmjPt885vizjsWnDv9xirZCZPs1iGtDrR7a+Np1BZd8uXiwmxkOHvi+LqAYDi
	 16j1GcmMT8K+Q==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B949317E0432;
	Fri, 12 Jun 2026 20:00:52 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 77875480027; Fri, 12 Jun 2026 20:00:52 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v3 00/10] Synopsys DisplayPort Controller improvements for
 Rockchip platforms
Date: Fri, 12 Jun 2026 20:00:46 +0200
Message-Id: <20260612-synopsys-dw-dp-improvements-v3-0-dc61e6352508@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAE5JLGoC/33N0QqDIBTG8VcJr+dQW1q72nuMXZgel1ApGm4Rv
 fssGINddPn/OPzOgiIECxFdiwUFSDZaN+YoTwVSnRyfgK3OjRhhnJSswnEenY9zxPqFtcd28ME
 lGGCcIhZaMmhqbajWKAs+gLHvXb8/cnc2Ti7M+7NEt/Xr8kM3UUxwRWh9aShnrCE35fpeti7Is
 3ID2uzEfl4+PfZY9rQAYXgrlRDm31vX9QMCDeLIGgEAAA==
X-Change-ID: 20260325-synopsys-dw-dp-improvements-7da2e98df1dd
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3621;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HjTcwVoSMhghtlEQN17A56Gf9uE1m/xC9fZU3wMihsQ=;
 b=kA0DAAoB2O7X88g7+poByyZiAGosSVSjkL+5iEnJ8c+arOBSV8P6FcvN8N+AF6tTKGNT9a8wB
 YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqLElUAAoJENju1/PIO/qavE4P/1xi
 Ahkk4JDhi7fBISk1xjbsU+I9rcJObGlCGNqL51YaMFzJYfbSyFYYAkoutSI4SGkw10V8UpSpKah
 FQcUeeSZicRNYYD3vx/90I18cpWNieqPiSFenJTGneASPVeV/YiOUQ6VVYjn1HjmIhnZ0HlUJ0X
 91uuw8iBCR7my7z+KAQ2KFsgUSKOTbTqTlz+Vt0/w/WXBci/Zjai+LKnYQHMAXEP8HzET9iYRLn
 SK68uI0O1+mYcoTi+y/coJPoSTwJQ7UjuFSoqnLeCBSQcZ4rPoh8GnUnjHI1zu1Lh15xB9BSAAk
 CWhpxGrlOdxK9L/6qiRRXVTVMyiQVqDSpdPSF4fRx7XGy/hgumWHsk/d03lv0mVeOjojpT5/CjG
 lLBqndOuUq8kmD7TnKwc9io338KEAJ4bogg4SM1PBxdHH5uuwUEcERWBY+ETJLHUKuwkp0qjg7a
 W7ZlC+2CzHJRYsdqShbFaISv2tC0qGCSdXCsRkUoEJbPApnORtEoSdISEbT/pRcr+CsgFqrhL4s
 0xsYotY2ThQXsdlRt0iZK4UIWlXh2P2QilgJh3dzKXZHvDA1B6qUKMIKMmNpg+QI94CAqFmvoEL
 QwoMYAAhsbEHaJe1xinTXgtaQJywr227oTaOVKOIaN6g7BBEypXXWNaIN8tKSKTV4RWdm/YeNpq
 vXNSv
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

This patch series updates the Synopsys Designware DisplayPort bridge
together with the only existing user: The Rockchip RK3576/RK3588:

 1. follow-up bridges (PHY, USB-C connector)
    this is needed to get USB-C DP AltMode working; I've followed the
    Qualcomm driver as reference

 2. runtime PM
    the initial driver has been upstreamed without RPM; add it to
    avoid wasting power when nothing is plugged

 3. audio
    the initial driver has been upstreamed without audio support;
    this adds all missing bits for audio with single stream transport

To properly make use of the bridge code the following USBDP PHY series
is also needed:

https://lore.kernel.org/linux-phy/20260428-rockchip-usbdp-cleanup-v4-0-7775671ece22@collabora.com/

There are two parts, which possibly need some discussion:

 1. I added a dedicated bridge callback for out-of-band hotplug events,
    which is separate from the hotplug_notify. I have a feeling, that
    there might be a better solution, but haven't found it.

 2. The DT binding for audio support - explicitly marked as RFC - works
    perfectly fine, but is not ready for MST. I don't intend to
    implement that right now, but the binding should obviously take it
    into consideration to avoid breaking it in the future. I've put
    some points for discussion into the relevant patch.

Changes in PATCHv3:
- Link to v2: https://lore.kernel.org/r/20260501-synopsys-dw-dp-improvements-v2-0-d7e7f6bac77f@collabora.com
- Collect Reviewed-by on "Simplify driver data setting" patch (Andy Yan)
- Use of_drm_get_bridge_by_endpoint instead of devm_drm_of_get_bridge (Luca Ceresoli)
- Use FIELD_PREP_WM16 instead of FIELD_PREP_WM16_CONST (Chaoyi Chen)
- Rebase to latest drm-misc-next (Dropped Cristian's patches)

Changes in PATCHv2:
 * Link to v1: https://lore.kernel.org/r/20260326-synopsys-dw-dp-improvements-v1-0-501849162290@collabora.com
 * rebased to latest drm-misc-next
 * prepended the Patches from Cristian's cleanup series, as they also
   needed a rebase and should be merged first
   https://lore.kernel.org/dri-devel/20260327-drm-rk-fixes-v3-0-fd2e6900c08c@collabora.com/
 * fix issue with the audio stream (un)prepare handling in last patch

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
Sebastian Reichel (10):
      drm/bridge: synopsys: dw-dp: Simplify driver data setting
      drm/bridge: synopsys: dw-dp: Support MEDIA_BUS_FMT_FIXED
      drm/bridge: synopsys: dw-dp: Add follow-up bridge support
      drm/bridge: Add out-of-band HPD notify handler
      drm/bridge: synopsys: dw-dp: Support software triggered OOB HPD
      drm/rockchip: dw_dp: Implement out-of-band HPD handling
      drm/bridge: synopsys: dw-dp: Add Runtime PM support
      drm/rockchip: dw_dp: Add runtime PM support
      [RFC] dt-bindings: display: rockchip: dw-dp: fix sound DAI cells
      drm/bridge: synopsys: dw-dp: Add audio support

 .../bindings/display/rockchip/rockchip,dw-dp.yaml  |   5 +-
 drivers/gpu/drm/bridge/synopsys/dw-dp.c            | 308 ++++++++++++++++++++-
 drivers/gpu/drm/display/drm_bridge_connector.c     |   6 +
 drivers/gpu/drm/rockchip/dw_dp-rockchip.c          | 167 ++++++++++-
 include/drm/bridge/dw_dp.h                         |   6 +
 include/drm/drm_bridge.h                           |  14 +
 6 files changed, 493 insertions(+), 13 deletions(-)
---
base-commit: 2afdfc658f7a7e9ee2a67ec6663922da9c799c53
change-id: 20260325-synopsys-dw-dp-improvements-7da2e98df1dd

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>

