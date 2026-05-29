Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37B93446DE
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 09:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780046899; cv=none; b=sAjAp8jsrAM+1ryw6ZVJJXXekiUqkLwZXfvIWFxj4yooFN7pzLu5xQnjTzPla2aTmfkdPtJqpkIw7shAtdjrbHMFT2i0iC3Rux1o0HAXwxHm/Ky1jXPUiEbDAznSCC/sGNooxbx77FppBrVgIAkeQQ6cW7r9at5OpvpSPxHGH0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780046899; c=relaxed/simple;
	bh=iWhPYgTdfFffYhnHI0zoRH7CbNn3F7LEqkwk8Yonugg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AuFvraism5KifES41ZvQ9AUK4/BcoOSZfClPf1pIUsibpJLUaeC3OMVRogQO19d5RmphuHewtDRIyb24GIBS7ifwOzljFstOrwsLKIX3QU18hL1Y9Tt7KisU8lSkObPjaAyN/CMaUU/gzJOk2hvQ5dgolR2IIagUxQpYpELy8Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nz8bhU0y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nz8bhU0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42D7F1F00893;
	Fri, 29 May 2026 09:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780046898;
	bh=HeTPvBmUOKWtyif2nDVQcsLjaSpPf/WA2Dx95uFfpxE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nz8bhU0yZr4u2euYv/v2eudyShlVK0ahakCgnGMg2MGmusfkPIcb3PxHbhOAsB1js
	 fEfqUX+JPBkcNEa6ALI3CfnZPDkEiWQ5/PHtQitExRWwXoBSZckLBIJTicmqHolOhI
	 yHMz2VlW2WFHkkQLAIgixVvOWm3/XNe/LFwhIYZ04kgp0kFqyTf+IcPOH6YxV2NM0D
	 7GqSKu33/zRH2k8m/Ziq4jxK+qI/j+QJlfqn3m/p7FHJsWigKRRK88I8hkjxneCFVw
	 OSF79Ndlr4N1DU2c4CyZpsnBP3wUsZ+r88j8x/HddWyxRW8i3vxWJOr7x5geLfvfSL
	 VCEBwBPmzLiJw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 08/15] drm/tidss: Add mechanism to detect DPI output
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529-beagley-ai-display-v3-8-7fefdc5d1adf@ideasonboard.com>
References: <20260529-beagley-ai-display-v3-8-7fefdc5d1adf@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 09:28:17 +0000
Message-Id: <20260529092818.42D7F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] DPI output detection misidentifies AM65x OLDI ports as DPI, causin=
g corruption of DPI clock configuration.
- [Low] Manual parsing of device tree 'compatible' property instead of usin=
g the standard `of_device_is_compatible()` API.
--

commit b4b73a906f813456b4eaed059b154ca4c691e76b
Author: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

drm/tidss: Add mechanism to detect DPI output

This commit adds a mechanism to determine if an output is going to a DPI
output or not, by checking if it is not DSI or OLDI. It uses a helper to
check bridge compatible strings and parent nodes to make this determination.

> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/ti=
dss_kms.c
> index 8bb93194e5ac6..bc8b10af9a48e 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c

[ ... ]

> +static bool tidss_is_bridge_internal(struct tidss_device *tidss,
> +				     struct drm_bridge *bridge)
> +{
> +	struct device_node *parent, *grand_parent;
> +	struct property *prop;
> +	bool is_internal;
> +
> +	if (WARN_ON(!bridge->of_node))
> +		return false;
> +
> +	prop =3D of_find_property(bridge->of_node, "compatible", NULL);
> +	for (const char *cp =3D of_prop_next_string(prop, NULL); cp;
> +	     cp =3D of_prop_next_string(prop, cp)) {
> +		for (unsigned int i =3D 0;
> +		     i < ARRAY_SIZE(tidss_internal_bridge_compatibles); ++i) {
> +			if (strcmp(cp, tidss_internal_bridge_compatibles[i]) =3D=3D 0)
> +				return true;
> +		}
> +	}

[Severity: Low]
Is it necessary to manually parse the compatible property string here?
Using the standard of_device_is_compatible() API would be safer and
avoid reinventing the wheel for property iteration.

> +	parent =3D of_get_parent(bridge->of_node);
> +	grand_parent =3D of_get_parent(parent);
> +
> +	is_internal =3D parent && grand_parent &&
> +		      tidss->dev->of_node =3D=3D grand_parent &&
> +		      of_node_name_eq(parent, "oldi-transmitters");
> +
> +	of_node_put(grand_parent);
> +	of_node_put(parent);
> +
> +	return is_internal;
> +}

[ ... ]

> @@ -160,6 +206,11 @@ static int tidss_dispc_modeset_init(struct tidss_dev=
ice *tidss)
>  			return dev_err_probe(dev, ret, "port %d probe failed\n", i);
>  		}
> =20
> +		if (bridge)
> +			dpi_output =3D !tidss_is_bridge_internal(tidss, bridge);
> +		else
> +			dpi_output =3D true;
> +

[Severity: High]
Could this logic misidentify AM65x OLDI ports as DPI?

On the AM65x SoC, the OLDI transmitter is integrated directly into the DSS
without a separate oldi-transmitters node in the device tree.

If a panel is directly connected to the AM65x OLDI port, bridge will be NUL=
L.
If an external LVDS bridge is connected, it will not be recognized as an
internal bridge. In both cases, the OLDI port seems like it would be
unconditionally marked as dpi_output =3D true.

Since dpi_output is used to configure the shared DPI clock control register,
would preparing the OLDI port incorrectly write its own polarity
configuration and corrupt the actual DPI port's configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-beagley-ai=
-display-v3-0-7fefdc5d1adf@ideasonboard.com?part=3D8
