Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F812DCC01;
	Mon, 22 Jun 2026 12:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130086; cv=none; b=V/5rNCzrab6B6bjIEXWFmfdZewhWjl3ZwNIiIAdS9R6kQbjGodMaHqfADJd2Vu7CE9x8P30L5Bs8f/NCDtAAux++FTYgxzKu+yuzy/mQTLMu9sdiVYlevqElNdEVRTszf92IDnOAz1vV3Dxd7cc2HIfUbXrFLozaO53KCscMbNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130086; c=relaxed/simple;
	bh=dv1K2Ihiu0UybH2I14ElLfJlWdx0JA369HND+RufZR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9my/2Ug7KjLH+jQ1wMnHH9mYUGy08+eZBOi6bujVuzvYK9E+zX1u3tjrJHFhAQvmUiVLpvsd5PNsKWBzZmHqnCUmRTvU+MCUVu85pS3tiA9wndKVt5qKhlGq/JvDLgVqkEWkhALL/KFKZcfOhlAcIDwcGQgMVr+ZHBS4v64hKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vO+t1A1d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vO+t1A1d"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 246BC492;
	Mon, 22 Jun 2026 14:07:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782130045;
	bh=dv1K2Ihiu0UybH2I14ElLfJlWdx0JA369HND+RufZR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vO+t1A1dHQfwBi/Dowg7v2M6JJ99B/ePL4EeJdeZx7Z9OpvP4BYSb8VO7ChjMTul5
	 X5+3UfuZbZaz5RKE8XcIV5IrUqmE6DAsF2XwMbCoxDamF5DR3X/aZiK/y82IQJIidH
	 fMABo9f6QAZVHGfaRPbu4XeFkp4AuhZ05Y2FYoMo=
Date: Mon, 22 Jun 2026 15:08:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, boss@oss.qualcomm.com,
	qc-display-maintainer@oss.qualcomm.com
Subject: Re: [PATCH 1/4] dt-bindings: brige: lt9611c: add port-select
 property for LT9611C
Message-ID: <20260622120801.GA3899757@killaraus.ideasonboard.com>
References: <20260611-lt9611-b4-send-v1-0-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-lt9611-b4-send-v1-1-42abbcd3bb1e@oss.qualcomm.com>
 <20260611-burrowing-fervent-serpent-584cac@quoll>
 <ajkkINI1PzxArMzL@hu-mdsor-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ajkkINI1PzxArMzL@hu-mdsor-hyd.qualcomm.com>

On Mon, Jun 22, 2026 at 05:31:36PM +0530, Mohit Dsor wrote:
> On Thu, Jun 11, 2026 at 12:40:38PM +0200, Krzysztof Kozlowski wrote:
> > On Thu, Jun 11, 2026 at 02:44:56AM +0530, Mohit Dsor wrote:
> > > Add a new optional `lontium,port-select` property to describe the DSI
> > > input port configuration for the LT9611C variant, which supports
> > > single-port (A or B) and dual-port (A+B) operation.
> > > 
> > > This property allows explicitly selecting the active DSI input port(s):
> > >   0 = port A (default)
> > >   1 = port B
> > >   2 = ports A and B (dual-port)
> > > 
> > > Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> > > ---
> > >  .../devicetree/bindings/display/bridge/lontium,lt9611.yaml  | 13 +++++++++++++
> > >  1 file changed, 13 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > > index e0821a63d9d7..77220f893bf8 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> > > @@ -41,6 +41,17 @@ properties:
> > >    vcc-supply:
> > >      description: Regulator for 3.3V IO power.
> > >  
> > > +  lontium,port-select:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [0, 1, 2]
> > > +    default: 0
> > > +    description: |
> > > +      Selects which DSI input port(s) the bridge uses. Only relevant for
> > > +      the lontium,lt9611c compatible.
> > > +        0 = PORT_SELECT_A  - single DSI port A (default)
> > > +        1 = PORT_SELECT_B  - single DSI port B
> > > +        2 = PORT_SELECT_AB - dual DSI ports A and B
> > 
> > Why graph is not enough? Seems exactly duplicating the graph ports.
> > 
> > Best regards,
> > Krzysztof
> >
> Hi Krzysztof,
> 
> Thanks for the review.
> 
> The graph describes the physical connectivity between endpoints,
> however it does not fully capture the internal mode of operation of
> the LT9611C. This variant supports multiple functional configurations
> (single-port A, single-port B, or dual-port A+B), which affect how the
> hardware internally combines or selects DSI inputs.
> 
> In particular:
> - The graph can describe connections to both ports, but it does not
>   indicate whether the device should operate in single-port or dual-port
>   aggregation mode.
> - For single-port use, both ports may be described in DT for board
>   consistency, while the driver still needs to know which port is
>   actively selected.
> - Dual-port mode requires explicit configuration even when both
>   endpoints are present in the graph.

If both modes of operation are possible on a given board, then it sounds
like the mode should be selected at runtime, not hardcoded in the device
tree.

> So, this property is not duplicating connectivity, but rather
> describing the *operational mode* of the device, which cannot be
> reliably inferred from the graph alone.

-- 
Regards,

Laurent Pinchart
