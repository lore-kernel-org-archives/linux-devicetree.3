Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5CF363C75
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 17:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784309286; cv=none; b=M2OPNXYj9MWL70T/zk3Cqc6/SekpVYmNAHSI9VTcZYMLpns/HR9g3774DFwuGs751ihS08xgpExEDk9riPw+Bn9mVK/E2ea3L39jEvsPQ0NZ3Nw+8xSloqugSI3PpWaSnSrn8sRui4FUjYWwNR1I2/qGeQYHxOz8Vw3pgSF4Yu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784309286; c=relaxed/simple;
	bh=mYL190o2A6mnHBJZdYbIg5BwoKGXCnkAixpS/Tz+Mvg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=laC7OWGy91731wt852K8GQ+0emTPEGBYkPZAwcSywZVDKdDx8IxytmOHFQk9xWPtGROCdT0Z0NXzlwE3Ifi4u3am5zwwp4ySNeBrzLrJi1y+oOpU2fBYTwI64O3DoGyLJiPktgazOmYnvYKnY/0pGfC3+r+qN9/i1LtidHjd5Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hx6OqMIp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hx6OqMIp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFBF1F000E9;
	Fri, 17 Jul 2026 17:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784309284;
	bh=S16KkTjeuMxleQj3ajQ/WnvvAQAXo4O2cxeDM55PTHY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hx6OqMIpLw6jD8wAG1dKVYCu64LWXlqgYlwPWBTYZSCTO23w2OLNCG7PfqWbJSHh3
	 gfeZLL4T0lAo3T4FEhTQpgkuvmOpENFpYgId34EAstIiLYBtcK4G7IcOv/EOM5vbrU
	 ukGxVnzRwUjGhj+H3lXWBhg2S2ZvDKDkvqUslPkgDcbsg97Rtw80yM1OXAoB20Io0k
	 G3xqyVcex9knMdcHfIybMuEADK34XWCeqNuiUk6tqbGhiKuX7rkiCdNbld6SgPOCiQ
	 8hGKj/frJ75iNw/J0nA5e3cXRu6i8tAVO/pJm2vrEW/G+1BeqoULHnEs6Fiw/tH4Nj
	 rP0Y9lBt9MPTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] clk: Use the generic OF phandle parsing in only
 one place
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-5-751547e160e5@bootlin.com>
References: <20260717-schneider-v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com>
 <20260717-schneider-v7-2-rc1-eip201-upstream-v4-5-751547e160e5@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 17:28:03 +0000
Message-Id: <20260717172804.6EFBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Returning a dangling pointer to a device node's name after droppin=
g the node's reference count.
- [High] Returning a dangling pointer to a clock core's name after dropping=
 the clock reference.
- [High] Loss of the requested clock index when falling back to a parent no=
de via the `clock-ranges` property.
--

--- Patch [5]: [PATCH v4 5/7] clk: Use the generic OF phandle parsing in on=
ly one place ---
commit ae5ff381e475c55a5d269ef4dce5a639c14cc437
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

clk: Use the generic OF phandle parsing in only one place

This commit replaces the use of of_parse_phandle_with_args() with
of_parse_clkspec() inside of_clk_get_parent_name(). It also modifies
of_parse_clkspec() to stop traversing up the device tree if a "clocks"
property is found.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 7d63d81ebc096..45f5d7a4ccc17 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -5219,6 +5219,8 @@ static int of_parse_clkspec(const struct device_nod=
e *np, int index,
>  		 * has a "clock-ranges" property, then we can try one of its
>  		 * clocks.
>  		 */
> +		if (of_property_present(np, "clocks"))
> +			break;
>  		np =3D np->parent;
>  		if (np && !of_property_present(np, "clock-ranges"))
>  			break;

[Severity: High]
This is a pre-existing issue, but this patch significantly exacerbates it.

When falling back to the parent node via the "clock-ranges" property, does
this discard the caller's requested clock index?

drivers/clk/clk.c:of_parse_clkspec() {
		...
		np =3D np->parent;
		if (np && !of_property_present(np, "clock-ranges"))
			break;
		index =3D 0;
	}

By hardcoding index to 0 before iterating to the parent, the requested clock
index is lost. The function incorrectly looks up index 0 on the parent node
regardless of what index the caller originally requested. This breaks
index-based clock lookups for devices relying on "clock-ranges" to inherit
clocks.

Since this patch switches of_clk_get_parent_name() to use of_parse_clkspec(=
),
when of_clk_parent_fill() requests parents 0, 1, 2, etc., will it now silen=
tly
receive identical copies of the parent's 0th clock name for all indices and
corrupt the hardware clock tree topology?

> @@ -5364,8 +5366,7 @@ const char *of_clk_get_parent_name(const struct dev=
ice_node *np, int index)
>  	int count;
>  	struct clk *clk;
> =20
> -	rc =3D of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
> -					&clkspec);
> +	rc =3D of_parse_clkspec(np, index, NULL, &clkspec);
>  	if (rc)
>  		return NULL;
> =20

[Severity: High]
This isn't a bug introduced by this patch, but looking further down in
of_clk_get_parent_name(), does this return a dangling pointer if the device
tree node is dynamically removed?

drivers/clk/clk.c:of_clk_get_parent_name() {
		...
		if (IS_ERR(clk)) {
			if (clkspec.args_count =3D=3D 0)
				clk_name =3D clkspec.np->name;
			else
				clk_name =3D NULL;
		} else {
		...
	of_node_put(clkspec.np);
	return clk_name;
}

The string pointer clk_name is retrieved from the device node, but the
reference to the node is immediately dropped via of_node_put(clkspec.np). If
the node and its name string are freed, for example via DT overlay removal,
any subsequent access to the child's cached parent name by the clock framew=
ork
would lead to a Use-After-Free.

[Severity: High]
This is another pre-existing issue in the same function, but does this also
return a dangling pointer if the parent clock provider is dynamically
unregistered?

drivers/clk/clk.c:of_clk_get_parent_name() {
		...
		} else {
			clk_name =3D __clk_get_name(clk);
			clk_put(clk);
		}
	}

	of_node_put(clkspec.np);
	return clk_name;
}

The clock name is retrieved via __clk_get_name(clk), but the consumer
reference is immediately dropped via clk_put(clk). If the parent clock
provider unregisters (e.g., on driver unbind or module unload), the parent's
clk_core structure and its name string are freed. This could trigger a
Use-After-Free on any subsequent access by the child clock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-schneider-=
v7-2-rc1-eip201-upstream-v4-0-751547e160e5@bootlin.com?part=3D5
