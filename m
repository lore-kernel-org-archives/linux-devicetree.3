Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E4839B97B
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778662240; cv=none; b=dq0RGnjyYDZtx8XG5mqDl2+2TNezEoL2n1NgDZkTBgHMaq21cWwppq0Hr8eiiE3x8gsM/rrdPLH5yYzbEJXdnNBxJYkEJBjZ67dYr2XbYKZI+PYKcCF7QDH2QJ3Gz96LbyHXxRaK1PIfi8JAYYsEGfMOmb+YSxlM+ktfqKlZxmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778662240; c=relaxed/simple;
	bh=mXCiJis9PmRvUW6+4tD3RzktiJJxyLYzXkipbr/Esf4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRV8n6+LVKPt5xtiTH6ffmyRVgkzArjzFbf9TzddZcz5Rb9VFlV9+N9ZTEJyeV8zrJn93N0snAPQIuAdX34LoEaL/kldNMZhbbNWLHd/EwStWRjFsVzfd11DJeqTrAcbt9aIoN286/IrZAhQ7M+ErUhNH8mVPOHDIOwzLq9zuM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1wN5I6-0006LO-AS; Wed, 13 May 2026 10:50:06 +0200
Received: from dude04.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::ac] helo=dude04)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1wN5I3-000ZUM-1N;
	Wed, 13 May 2026 10:50:03 +0200
Received: from ore by dude04 with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1wN5I3-00000009At5-1IDm;
	Wed, 13 May 2026 10:50:03 +0200
Date: Wed, 13 May 2026 10:50:03 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Venkata Gopi Nagaraju Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
	venkata.valluru@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
	Yi Zhang <zhanyi@qti.qualcomm.com>, kernel@pengutronix.de
Subject: Re: [PATCH v5 0/2] This series adds LT9211C bridge driver by
 extending LT9211.
Message-ID: <agQ7O-LTmUaxwr7c@pengutronix.de>
References: <20260323-add-lt9211c-bridge-v5-0-9c63bb035c17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323-add-lt9211c-bridge-v5-0-9c63bb035c17@oss.qualcomm.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Hi Gopi Botlagunta,

What is the progress of this patch stack? Are you still working on it,
do you have a newer, not yet posted version of this series?

regards,
Oleksij

On Mon, Mar 23, 2026 at 12:38:51PM +0530, Venkata Gopi Nagaraju Botlagunta wrote:
> LT9211c is a Single/Dual-Link DSI/LVDS or Single DPI input to
> Single-link/Dual-Link DSI/LVDS or Single DPI output bridge chip.
> This adds support for DSI to LVDS bridge configuration.By Extending the
> existing lontium-lt9211 driver to support DSI-to-LVDS
> bridge configuration.
>
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> ---
> Changes in v5:
>   - Addressed code formatting in lt9211 driver (no functional or design changes)
>   - Addressed v4 comments on lontium-lt9211.yaml.
>   - Link to v4: https://lore.kernel.org/r/20251224-add-lt9211c-bridge-v4-0-406e73ec28c5@oss.qualcomm.com
>
> Changes in v4:
>   - Removed lontium-lt9211c.yaml.
>   - Extended lontium-lt9211.yaml to support LT9211C.
>   - Link to v3: https://lore.kernel.org/r/20251218-add-lt9211c-bridge-v3-0-1ee0670a0db2@oss.qualcomm.com
>
> Changes in v3:
>   - removed lontium-lt9211c as separate driver
>   - Add support to lontium-lt9211c bridge driver by extending the existing lontium-lt9211.c
>   - fixed kernel test robot reported build errors
>   - Link to v2:https://lore.kernel.org/lkml/20251107-add-lt9211c-bridge-v2-0-b0616e23407c@oss.qualcomm.com/
>
> Changes in v2:
>   - Combined driver patch from https://lore.kernel.org/lkml/20250911-lt9211c-bridge-support-v1-1-c221202cbcd5@oss.qualcomm.com/
>   - Added MODULE_AUTHOR
>   - Uppercase to lowercase for hex values
>   - Link to v1:https://lore.kernel.org/r/20250910-add-lt9211c-bridge-v1-1-4f23740fe101@oss.qualcomm.com
>
> ---
> Yi Zhang (2):
>       dt-bindings: display: bridge: lontium,lt9211: Add lt9211c support
>       drm/bridge: add support for lontium lt9211c bridge
>
>  .../bindings/display/bridge/lontium,lt9211.yaml    |   5 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c            | 846 ++++++++++++++++++++-
>  2 files changed, 808 insertions(+), 43 deletions(-)
> ---
> base-commit: f50b969bafafb2810a07f376387350c4c0d72a21
> change-id: 20250910-add-lt9211c-bridge-5a21fcb1c803
>
> Best regards,
> --
> Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
>
