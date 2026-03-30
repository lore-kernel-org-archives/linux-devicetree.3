Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D48F39524B
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 06:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774852247; cv=none; b=h889Y8JgyI5loKHoEAjS9cmIsxmkfd4XoJF1vLzYAjXPxsHpWemPmv1zjpb4Mh/oPU4+gQwKVpdNx1srym/GXL2QOHYxz8/1Pkv+K5DA1qKyuN3EysmQuDdS1xk/UiCRcNH4QG+1axePqvSNC7CP2vQzFKclTUf1zo1NeBeJ0GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774852247; c=relaxed/simple;
	bh=+QnlXHDNzy8aYo8XVbimYnZy3ZEaJZAkWiDSIAkNnNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skvMAmf/SOUa7ghpgVgjO1lFZetOdKYAr/mFyWT1s8R53jS1VylfmBj9xEor7zVPiv7Ujgncetyfspvc4VWpoGxxRgkNDNv9DUkEyC1UT3gJZLcM9Wq8AXHChzTm90urvTBbYUBxl1itQBFoWLfy70MdrULOewZt4zm29+s/dpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1w768N-00072F-BQ; Mon, 30 Mar 2026 08:29:59 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1w768L-002pX0-1b;
	Mon, 30 Mar 2026 08:29:57 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1w768L-0000000ENW4-1W0m;
	Mon, 30 Mar 2026 08:29:57 +0200
Date: Mon, 30 Mar 2026 08:29:57 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Marek Vasut <marex@nabladev.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: bridge: ldb: Require reg property
 only for i.MX6SX/8MP LDBs
Message-ID: <excxf6kxwx44kepc22smvvnirptc4kxpubioxoto7nqleqhoiq@ymch4y6dd5n5>
References: <20260329-fsl_ldb_schema_fix-v1-1-351372754bc0@nxp.com>
 <crqzju5cqhvmy5msxvuquydmnpb2ft2t3gsyr6qsre6ccqjvzz@46gfcrelczsr>
 <0d7c7403-4b77-42f3-82d6-eaf2be8e5b1e@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d7c7403-4b77-42f3-82d6-eaf2be8e5b1e@nabladev.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org

Hi Marek,

On 26-03-29, Marek Vasut wrote:
> On 3/29/26 7:42 PM, Marco Felsch wrote:
> 
> Hello Marco,
> 
> > sorry for not writting back earlier, the last weeks were quite busy.
> 
> Tell me about it ...

^^

> > On 26-03-29, Liu Ying wrote:
> > > LDB's parent device could be a syscon which doesn't allow a reg property
> > > to be present in it's child devices, e.g., NXP i.MX93 Media blk-ctrl
> > > has a child device NXP i.MX93 Parallel Display Format Configuration(PDFC)
> > > without a reg property(LDB is also a child device of the Media blk-ctrl).
> > > To make the LDB schema be able to describe LDBs without the reg property
> > > like i.MX93 LDB, require the reg property only for i.MX6SX/8MP LDBs.
> > 
> > NACK, we want to describe the HW and from HW PoV the LDB is and was
> > always part of a syscon. This is the case for all SoCs i.MX6SX/8MP/93.
> > 
> > > Fixes: 8aa2f0ac08d3 ("dt-bindings: display: bridge: ldb: Add check for reg and reg-names")
> > 
> > Therefore I would just revert this patch completely.
> Last time, I pointed out the hardware is part of syscon, but as a subnode
> and therefore with reg properties. What is the problem there ?

To quote the DT spec here:

"""
The reg property describes the address of the device’s resources within
the address space defined by its parent bus.
"""

The parent bus is not the parent iomuxc (i.MX6X) nor the blk-ctrl
(i.MX8MP/93) device. Therefore this is wrong IMHO and should be dropped.

There will be no regression from driver POV since your patchset which
would add the support to parse the reg is not merged yet.

Regards,
  Marco

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
