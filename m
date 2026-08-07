Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE7547427A
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 15:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786117270; cv=none; b=Eb5bwTGCcwyOtM67rGqGahymM9khSafU2sDEqb72wxhkcuY5kdqmNZOQLpaaAezm4y6FRqw5kEzeC+9+L6ff93v/yy5VKTrYTNiKgr2h7kOjW4QuNYadu+NVVee9MAskf9fWVc8SgO/KQn44RGGbzERaEJI3Pgbw+uvCelaBxfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786117270; c=relaxed/simple;
	bh=dN2qf//ZNJ8W2Ml3DQYeQuwAJ8F2n6n+BVDC7ivxEaw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ar4dK/VQXUtuvyUe2U6SMCqoJhhSwc0dp5nyA9iKRt2OZUdilBAG1kzgOw0PjUyoZu00We5CY/7jPAOg2c66ptPolojAt32ELjaMEG0C08a2RddSMratZFr5YQ/yVf9w2bcbrJExV44PuQN7WnaiqJ77AIbJOpmm3/n6DQMUHtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vr+yw2rE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vr+yw2rE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 435B91F00A3A;
	Fri,  7 Aug 2026 15:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786117268;
	bh=BD+Y5Erzn/7HZ8DPz+pT9vb8YBEpizgBXCZUNdM06TU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vr+yw2rEbl8cfTnOdz5uOChr6we53AQPn8Hd6NYBSlJiMbxEB0jPiASiKoXbEKSrh
	 uhNSWiGdzqlxkylOmSHUrz3pcXJ6o+Ss7AfhqZdbmvpCCqw3Jfg0Hy6Rf+cmvtxbYh
	 3m2HgMlvUmoG8EtceMKaJSpcHxu1cu+5oKZSxEh0FRtzkcpqqGnmNJkipuwLFI72d8
	 8N8IrgYmyIL4uXMIVOZOHN4WzdhlJn+kc/e+HMbOJHjhTssxSoZxP9Laxx9bhnJq4Z
	 wAWnk0A2yHc8MlZW6YPWzuw1RMCFJ7G8UE1m44c9OvCFWJ1hSvggVviQvBGGQ/7J42
	 FBYJTM42BqE1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] clk: Use the generic OF phandle parsing in only
 one place
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TWlxdWVsIFJheW5hbCAoU2NobmVpZGVyIEVsZWN0cmljKQ==?= <miquel.raynal@bootlin.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-5-8785f9531cf0@bootlin.com>
References: <20260807-schneider-v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com>
 <20260807-schneider-v7-2-rc1-eip201-upstream-v5-5-8785f9531cf0@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 15:41:07 +0000
Message-Id: <20260807154108.435B91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The switch to `of_parse_clkspec` in `of_clk_get_parent_name` int=
roduces broken positional index lookups during `clock-ranges` fallback and =
creates an API mismatch with `of_clk_get_parent_count`.

Pre-existing issues:
- [High] Returning a pointer to the device node's name (`clkspec.np->name`)=
 after calling `of_node_put(clkspec.np)` causes a potential Use-After-Free.
--

--- Patch [5]: [PATCH v5 5/7] clk: Use the generic OF phandle parsing in on=
ly one place ---
commit 83137fb481bf2605bb7ce30c009986e0de4d1253
Author: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>
Subject: clk: Use the generic OF phandle parsing in only one place

This patch consolidates the device tree parsing logic by replacing
of_parse_phandle_with_args() with of_parse_clkspec() inside
of_clk_get_parent_name(). This change provides uniform handling and aims
to support the clock-ranges property during parent clock resolution.

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

[Severity: Medium]
When falling back to the parent node due to clock-ranges, does resetting
the index to 0 break positional index lookups?

Right below this snippet in of_parse_clkspec(), the index is explicitly
reset to 0 before the loop continues:

	np =3D np->parent;
	if (np && !of_property_present(np, "clock-ranges"))
		break;
	index =3D 0;

If a driver calls of_clk_get_parent_name() with an index > 0 for a node
that lacks a clocks property but whose parent has clock-ranges, this reset
causes the parent's 0th clock to be returned repeatedly instead of the
subsequently requested clocks.

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

[Severity: Medium]
Does this change create an API mismatch with of_clk_get_parent_count()?

Currently, of_clk_get_parent_count() relies on of_count_phandle_with_args()
which does not check for the clock-ranges fallback. Now that
of_clk_get_parent_name() uses of_parse_clkspec() and supports clock-ranges,
will drivers relying on of_clk_get_parent_count() receive a count of 0 and
fail to initialize?

> [ ... ]
> 		clk =3D of_clk_get_from_provider(&clkspec);
> 		if (IS_ERR(clk)) {
> 			if (clkspec.args_count =3D=3D 0)
> 				clk_name =3D clkspec.np->name;
> 			else
> 				clk_name =3D NULL;
> 		} else {
> 			clk_name =3D __clk_get_name(clk);
> 			clk_put(clk);
> 		}
> 	}
>=20
>=20
> 	of_node_put(clkspec.np);
> 	return clk_name;

[Severity: High]
This is a pre-existing issue, but can this result in a use-after-free of the
node's name?

If the clock is unregistered and has a clock-cells value of 0, clk_name is
assigned directly to clkspec.np->name. The node reference is then dropped
immediately via of_node_put().=20

If the node was dynamically allocated, such as through a device tree
overlay, dropping the last reference here frees the node and its string
properties, leaving clk_name pointing to freed memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-schneider-=
v7-2-rc1-eip201-upstream-v5-0-8785f9531cf0@bootlin.com?part=3D5
