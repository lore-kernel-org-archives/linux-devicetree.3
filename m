Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178FC476CF2
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349858; cv=none; b=RWjPWx3Ww6BIiXVdfzo+2PRNdFoixb5RLEspB2WjMD6p+mw1Kg0ROBaUgMH0qBSSNkhsDM/eF8cHsoLD4bxvsY2w7czAagbjpJtD6nn+0ZY9sFkkYHA+xEy2yvtcJApCgUXEIiPbaAvw+/u1bPc+yNgQTx0R9xzu85FDeR9yD5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349858; c=relaxed/simple;
	bh=GwsUSXtJoYTDW/STv+9PvyztVUV2DBN9GCQAkgmO+8k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PV6+lfuFTUG/rrMofc8iAcxs33HHR0vCxNMCilM4GTToqi49OrhUr3oKOQyjADN2/XchnnZMLVJCnrnZjjMOUClrXFyOi7joAc9lOiPDFGPvmgkSVMMhXzgsq3SUUM+yco+i8TwS6YZXCkaqq9By9fm4p7eM/pZDK01zNpy6C2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=caIhp9K0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="caIhp9K0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5616A1F000E9;
	Wed,  2 Sep 2026 11:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788349840;
	bh=g/NR01BEmwlDEQkL+BiGI77JqKR65/Pwukx1saK60PA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=caIhp9K01InaonLdQFKM/QEl5+ekSJuFaphL4LTBAE6mz1mDuYgdBREBrJXwXTXQr
	 vFJwH5447fi5YdBvBSvCx7Ht7OkIXKTerFrzDYoymy6WJRce/ehaViWiG3mRqaetvQ
	 c1YWBaZaO4y62conLrK+iCNnjjSqLifsWTc/ivF6glGaUeGRqN3t/ZiLoc7S52HqBZ
	 60FC8/bIFfCJHFzhl0yZXW1tSDy5ymwtSuKm5WtreGj4COHwtA1InuPwoOSm/8cVY8
	 KdIpPUfAC9AN9MCxnrUHQZAGN0lgxKXM/BvZ6j6vHZ7ZWtq6CU+ybELLSvmfbsEEUw
	 A3puDghMW0E6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 1/2] of: property: fw_devlink: Follow GPIO nexus
 maps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902-fw-devlink-nexus-ready-v1-1-68fe1996e78a@toradex.com>
References: <20260902-fw-devlink-nexus-ready-v1-0-68fe1996e78a@toradex.com>
 <20260902-fw-devlink-nexus-ready-v1-1-68fe1996e78a@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:50:39 +0000
Message-Id: <20260902115040.5616A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Infinite loop in `of_parse_phandle_with_args_map` due to lack of=
 cycle detection when parsing `*-map` properties.
--

commit 97ac59dad65377a6557c6606a4f1c695b9fd0847
Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

of: property: fw_devlink: Follow GPIO nexus maps

This commit updates fw_devlink to parse GPIO properties using the map-aware
parser of_parse_phandle_with_args_map() instead of treating them as direct
phandle references. This ensures fw_devlink identifies the correct GPIO
provider rather than a translation nexus, and adds corresponding unittest
coverage.

Link: https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jba=
uradujrre@gc5nbdhhixaf/

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 72cf12907de03..380df0861ab97 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
[ ... ]
> @@ -1311,6 +1311,19 @@ static struct device_node *parse_prop_cells(struct=
 device_node *np,
>  	return sup_args.np;
>  }
> =20
> +static struct device_node *parse_nexus_prop(struct device_node *np,
> +					    const char *prop_name, int index,
> +					    const char *stem_name)
> +{
> +	struct of_phandle_args sup_args;
> +
> +	if (of_parse_phandle_with_args_map(np, prop_name, stem_name, index,
> +					   &sup_args))

[Severity: Medium]
This is a pre-existing issue, but does of_parse_phandle_with_args_map() lack
cycle detection when parsing *-map properties?

Looking at of_parse_phandle_with_args_map() in drivers/of/base.c, the loop
that follows mapping indirection lacks a cycle breaker:

drivers/of/base.c:of_parse_phandle_with_args_map() {
    ...
	while (cur) {
		/* Get the <list>-map property */
		map =3D of_get_property(cur, map_name, &map_len);
    ...
		out_args->np =3D new;
		of_node_put(cur);
		cur =3D new;
		new =3D NULL;
	}
    ...
}

If a cyclic device tree overlay introduces a cycle in the *-map properties,
could this while (cur) loop indefinitely follow the mapping indirection
and cause a denial of service? The function seems to jump directly to
reassigning cur =3D new and restarting the traversal without any cycle-brea=
king
or visited-node verification.

> +		return NULL;
> +
> +	return sup_args.np;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-fw-devlink=
-nexus-ready-v1-0-68fe1996e78a@toradex.com?part=3D1
