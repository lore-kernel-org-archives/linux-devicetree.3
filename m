Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CED63C1969
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 11:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783077331; cv=none; b=n6qUIPkPtdYkiTo9fv9IFJ9kyozvGOuGWWiHFr/rtu2+JYZ+eUVhm+yB8cbP/oQ2299wvigyUGhKSe5TH2Q6DWpYn3MjZtieERzSzd0jrGMD0/IWkiyhbdHVnRVY8otbqV8YEs88tsJlheweSuq69JUsYoWVm7EZV3p+qus3dBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783077331; c=relaxed/simple;
	bh=Bv355jU4po1WEupbmCll2VCBMXPHblaGOYfIs/hABwI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LQVx8A6GomLdVa8sZQzPBPi2h2MUa9QyL4BmB6vWOxarLk299XY0Js6bmh3LXidOu4YNVpqLnnFqE6SMC8PdFjI4BX/iA3PWlhEQHEmL86GxR/p2YsYVy2DJR8PKHLFJ46cL4S/g+o5hE/8D7Qgyy5jpmh34p7HYEVF2RiQ9FUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMfbwuiM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMfbwuiM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9A891F000E9;
	Fri,  3 Jul 2026 11:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783077330;
	bh=trmaukF36sNJep6/PUMtLAdfcJDVNVLbHV4DrFACsiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MMfbwuiMIu5Gl/Vx9uX5VUC0tcKzORHkO9JKDwvQ2YYivjl1fHNQORtmwn7ZioRZK
	 OSsV6NsA49mYFvx3692ijbWxQazYr0w8L2ALqtL51RPQCD0B4/FbYeu0cFIuL0tJST
	 E7oPyktLs3/YGsdEb3ameZYobRwO393B9kzjcK3sZKA+vI3352DtpNUps0tlmdmCXC
	 CA4LE57GAuSFFjDCMm4RMvtSOhGrijPc9DwEm9X54dQ2gzww18x9wdcml3hQyw/N+C
	 umjglNet3cV6ftU13VBiYiHBtMFCHHS1zJo1d0gJLWpkkkf7Zz+UOpE6G5GhJhBieD
	 iKraxeoSR0z0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/13] device property: Add
 fwnode_graph_get_port_by_id()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260703110317.1283411-2-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
 <20260703110317.1283411-2-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 11:15:29 +0000
Message-Id: <20260703111529.E9A891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] `fwnode_graph_get_port_by_id()` fails to find a port if its endpoi=
nts are unconnected or connected to disabled remote devices due to missing =
`FWNODE_GRAPH_DEVICE_DISABLED` flag.
- [Medium] `fwnode_graph_get_port_by_id()` cannot find valid port nodes tha=
t do not contain any endpoints, diverging from `of_graph_get_port_by_id()` =
behavior.
--

commit c798c3e5cfa59227921f3fc93df8113ad82e4544
Author: Chen-Yu Tsai <wenst@chromium.org>

device property: Add fwnode_graph_get_port_by_id()

This commit introduces fwnode_graph_get_port_by_id() to allow drivers to
obtain a reference to a port firmware node by its ID. The helper is
implemented by finding the matching endpoint first and then returning its
parent node. It is intended to support upcoming USB power sequencing
integration.

> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index e08eadd66f4f9..c5e7e00f1b0cd 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
[ ... ]
> @@ -1346,6 +1346,28 @@ int fwnode_graph_parse_endpoint(const struct fwnod=
e_handle *fwnode,
[ ... ]
> +struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *=
fwnode, u32 id)
> +{
> +	struct fwnode_handle *ep;
> +

[Severity: Medium]
Could this regression cause the function to miss port nodes that are
completely empty of endpoints?

Because this relies on fwnode_graph_get_endpoint_by_id() (which iterates ov=
er
endpoints), if a port node is defined in firmware solely to hold properties
(like vbus-supply) but has no endpoint child nodes, this function will retu=
rn
NULL. This seems to diverge from the behavior of of_graph_get_port_by_id(),
which correctly finds empty port nodes.

[Severity: High]
Does this call need the FWNODE_GRAPH_DEVICE_DISABLED flag to avoid a
regression where ports with disabled or unconnected remote devices are skip=
ped?

By omitting FWNODE_GRAPH_DEVICE_DISABLED, fwnode_graph_get_endpoint_by_id()
evaluates with enabled_only =3D true. If a port's remote device is disabled
in the device tree, or if the port is unconnected, it will skip those
endpoints and return NULL. This could cause USB port devices to lose their
firmware node association if the remote connector is disabled, preventing
subsystems from reading the port's properties.

> +	ep =3D fwnode_graph_get_endpoint_by_id(fwnode, id, 0, FWNODE_GRAPH_ENDP=
OINT_NEXT);
> +	if (!ep)
> +		return NULL;
> +
> +	return fwnode_get_next_parent(ep);
> +}
> +EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703110317.1283=
411-1-wenst@chromium.org?part=3D1
