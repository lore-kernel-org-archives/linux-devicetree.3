Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6125B0BC;
	Sat, 30 May 2026 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780131522; cv=none; b=qsKIlKMTfLXcnjmKXr8vMP/MMtm39diLOXcoArccVyz50/7xHZsR4+m/GewsixEcM2uo9EqWQDiPtEHIKQ2D+apdL4Kw2oDEjKQIViGgc7+yDXk7l89G1I2Xi+/uKzv4YihUXh7+VIJv9b8qpKjIalS7j9UA6TB1+nkmwyYdwiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780131522; c=relaxed/simple;
	bh=XdeK1g0EUM1/c8nmyLE8X1agh6wRiCNmBGWxJo8KfPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nt0kv1dAtWHKbXKFTfVfUadS+STt4igWrG1t5FMT8Z2oO4wRrOwh4rQTCDGJsUESOjjkzmVdRZKYGaGPK8G/HAJ4Ga8UNgbaUWD4+DXWBIj4Ii3y+HJHIfPF0zitn2RBmWkgiVfPOpsfNrWRmIEupX0c39EJjjMC6EMJhbnPC54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDhpt0SY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDhpt0SY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8924D1F00893;
	Sat, 30 May 2026 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780131521;
	bh=ayHHk4ZOOr5w+O/PeNuUnAMZ4J8wsxunRTe/vkmvyG8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YDhpt0SYHo9S+jdUx8pLtkH/ygPg2Y5vBAXhc/kIgMbDqclzrhIPo5PtQdlFhfHKv
	 j8q70TsdwYVghsf9v0dggNSFxMnVKEU+CAlwNt5AoBBeveiIYHmhovlEuv3Rdwtq6q
	 QOF8THxNchBkkD/ZkkycslTkcfz0t2QpFxM8rc/A85VC1lRpl6UMFZMDjGpgFy/zf3
	 wTHlpw8l7iKVwBJtKhfLJvl7jPCIcWkfwwAd9jSIhLEIkaMMBu73LEcyPpoo2WIQX7
	 NVBZ3lZUQv8wqsDrIkWUL3oy7WQNKcc224nUanT4TyLxO6BcR+4PJPIlYHvax4A3hH
	 iIzHV2suEZlzg==
Date: Sat, 30 May 2026 10:58:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 04/15] dt-bindings: display: ti,am65x-dss: Add
 ti,dpi-io-ctrl
Message-ID: <20260530-slim-private-dachshund-e869cd@quoll>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
 <20260529-beagley-ai-display-v3-4-7fefdc5d1adf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529-beagley-ai-display-v3-4-7fefdc5d1adf@ideasonboard.com>

On Fri, May 29, 2026 at 11:45:34AM +0300, Tomi Valkeinen wrote:
> The DPI output pipeline in K3 SoCs contains the display subsystem (DSS)
> which produces the in-SoC parallel video signal, and a DPI block which
> adjusts the signal to the external MIPI DPI output.
> 
> The DSS IP has registers to configure whether the data and sync signals
> are driven on rising or falling clock edge, and on some SoCs these are
> automatically conveyed to the DPI block which needs that configuration
> to properly output the MIPI DPI signal.
> 
> However, on some SoCs the DPI block configuration has to be done
> manually, using an extra register outside the DSS, DPI0_CLK_CTRL in
> MAIN_CTRL_MMR_CFG0 block, which controls the DPI block's behavior.

Why don't you constrain this properyy per SoC in such case? Why is it
applicable to each SoC, even though you said it is done via DSS IP
registers?

> 
> Currently the DPI0_CLK_CTRL is never written, so it's always 0, meaning
> the data and sync are always driven on a rising clock edge regardless of
> the DSS configuration.
> 
> Add 'ti,dpi-io-ctrl' property, which contains phandle to the
> MAIN_CTRL_MMR_CFG0 block and the offset to the DPI0_CLK_CTRL register,
> so that the DSS driver can configure the data and sync signals
> correctly.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../devicetree/bindings/display/ti/ti,am65x-dss.yaml          | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 588d72d4ec0d..902ae2122d86 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -113,6 +113,17 @@ properties:
>        and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
>        interface to work.
>  
> +  ti,dpi-io-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      phandle to a syscon device node containing the DPI0_CLK_CTRL register,
> +      with the offset to DPI0_CLK_CTRL as an argument.
> +    maxItems: 1

Drop

> +    items:
> +      items:

missing '-'. See other examples of phandle-array, for example one of
the first search results: qcom,ssc-block-bus.yaml

Best regards,
Krzysztof

