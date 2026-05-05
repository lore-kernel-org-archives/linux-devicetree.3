Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F94E2EC0A6;
	Tue,  5 May 2026 19:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778009949; cv=none; b=ULo/3C0ienF5H3HUze73chKazhFvsjicBUiG3JIoAgLBG7O1+xibhUC6a96kmsE8hrV4SlGWPPGTLTKODCCaXpjHQ2Ls+GWC86TWuQ0nst9oYZuJhPnQBXzPtJ5VOFcDQI+T+4fwa8LLJ+zrbETX+D6hjWdbJMnW7iwv5OTw3Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778009949; c=relaxed/simple;
	bh=K5AwDX7FfPa71rodjgfq618inTJ4hiG1ghywEeULFwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZprekGxm4t7CWGETgf3DYa2r54o+gELEpVX0NDp0RCO/QDUmQURmeAHRl2UI6poT1I6940E+Xx7/agJsGrTrPIxm2W3gPWsY+hBWrr6Ci98ZqI4gv1NowCWLj47cpRk/pDMSMu/EI8FsuTzfNUYhYBVUiEV18W3PNmxfMmf8Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gP1GZCu9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gP1GZCu9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83637C2BCB4;
	Tue,  5 May 2026 19:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778009948;
	bh=K5AwDX7FfPa71rodjgfq618inTJ4hiG1ghywEeULFwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gP1GZCu9X50ZuXhRtGDWUVXBVTMV2ayTF2kNCKe1eWmdfAPlu7bROwmmJ7b7pXaDb
	 adXkDCUs/VZwJmWjN0Aa5mwfkgciSk/ucjM5XOlP4ZsEVKtl6KepahPCsykVS8uiJB
	 NFmzPhKq8sdyDVUQK0RXOUKX8Bx2xyeAoCK4grr7Z/7LNYTa6l+0N9ndSifq1tMXTy
	 i2Q5XZfwLJIYWBB+BHZ53hlp0RTJN7JmY+ptZ0WUsvvBmKrxMF5R7QVLbGtdQ09xL+
	 ThgmwkUQ50U+2+nQnCUpyHB1hDC2yGK1CT+rUg58e+O1NGRSN3QGQOAXV8yWUqGRDj
	 jp9F65J3cttwA==
Date: Tue, 5 May 2026 14:39:06 -0500
From: Rob Herring <robh@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Aradhya Bhatia <aradhya.bhatia@linux.dev>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/15] dt-bindings: display: ti,am625-oldi: Add optional
 power-domain for OLDI
Message-ID: <20260505193906.GA3796761-robh@kernel.org>
References: <20260420-beagley-ai-display-v1-0-f628543dfd14@ideasonboard.com>
 <20260420-beagley-ai-display-v1-4-f628543dfd14@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-beagley-ai-display-v1-4-f628543dfd14@ideasonboard.com>

On Mon, Apr 20, 2026 at 03:54:11PM +0300, Tomi Valkeinen wrote:
> On some SoCs the OLDI blocks belong to the same power-domain as the main
> DSS block, but on some more recent SoCs the OLDI blocks have a
> controllable power-domain.
> 
> Add the power-domain to the DT binding.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> index 8203ec5e5bb3..61c3eb0a0776 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml
> @@ -29,6 +29,10 @@ properties:
>    clock-names:
>      const: serial
>  
> +  power-domains:
> +    maxItems: 1
> +    description: phandle to the associated power domain

Drop generic descriptions.

> +
>    ti,companion-oldi:
>      $ref: /schemas/types.yaml#/definitions/phandle
>      description:
> 
> -- 
> 2.43.0
> 
