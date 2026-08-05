Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC755456E1E
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785944463; cv=none; b=AMuIsmb3mzEalGJm2R0M6HBEfHDv9qYlpccSnJfXQxkUyegw4jZAnQ5vg+gZ6k+fgkqYsEmmZAbefMSyNUq+9Cfu1/G6yuTpaHb2vrfBRPLd8YV1tBem3iTlwEGbYANHekw1ea3QujrUIRUQBaCXRY3PHF2YLdWLfunsQgHPM7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785944463; c=relaxed/simple;
	bh=c6gtlii0Hlc5iLPLxbfcf5ReUdI5F5PwvewPW+lwblE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ol6eab5I6BJDZ4tAS7+Yr0kGAYOML6gn16iJ43pwrS67pTf9HO9dtGFGcthQkpN8LXULbJPnHV2mLrwfWs3WbYw71BP1OA/eRCCZhEhSJr4hglubyfzecV6oyY/BICikPG1pTiTQSji7aIBUVaotg8w4gttU/QtmKT1eu9CMyPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gy+0XPbi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gy+0XPbi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 667791F000E9;
	Wed,  5 Aug 2026 15:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785944454;
	bh=9ihG8NQy+HfmBrLEaMR9Q4weVEEo7LW9J7KofcyNGuw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gy+0XPbim5IE5FAeta9Tge0u8ptKXK4D37Qtpsx6yYN7UF1C2vb2weaUPCdjWB33H
	 nVK0G38BsXQT5EqTWgGF4koQimtipWEqpOls7FNBo6yjCcgfRekNtkpHOG6GTK8JKN
	 u+UtPLbrhtMS6g7KTSBYWLv+pSGV+3oAAq8WOguNa03Nj0J2FPtgYSTrzajdHxFIIU
	 oDhtx9IGtP9mHEAn6Yb4c0Y146riusew0Q/oa1EL/ZluliMgR4qy+qWDXJpbcoyj07
	 27bb92+civZmU9wLziseEAv5NDV78F4TnJFNyhQTKLR4/7bb5bEHzKrCc4uMrEcDlz
	 sU1gF9bxwfEBg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
References: <cover.1785941595.git.geert+renesas@glider.be>
 <89e6a71b35703f10e12f520af1f389b5f40f4b35.1785941595.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 15:40:53 +0000
Message-Id: <20260805154054.667791F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The attach_dev callback hardcodes index 0 when parsing the 'power-=
domains' property, breaking support for devices with multiple power domains.
- [High] Unprotected access to the provider's private data (`priv`) outside=
 `r8a78000_mdlc_lock` in `r8a78000_mdlc_attach_dev` leads to a potential Us=
e-After-Free.
--

--- Patch [4]: [PATCH v3 4/6] pmdomain: renesas: Add R-Car X5H MDLC driver =
---
commit 72c0935c5567aec22a55250554e605471b44c678
Author: Geert Uytterhoeven <geert+renesas@glider.be>

pmdomain: renesas: Add R-Car X5H MDLC driver

This commit adds a minimal Module Controller driver for the R-Car X5H SoC. =
It
currently supports always-on power domains along with dummy module clocks a=
nd
resets for the serial console.

> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/=
renesas/r8a78000-mdlc.c
> new file mode 100644
> index 0000000000000..5c8acead7cff9
> --- /dev/null
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c

[ ... ]

> +static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
> +				    struct device *dev)
> +{
> +	struct device_node *np =3D dev->of_node;
> +	struct r8a78000_mdlc_priv *priv;
> +	struct of_phandle_args pd_spec;
> +	const struct mod_map *map;
> +	unsigned int id;
> +	int ret;
> +
> +	ret =3D of_parse_phandle_with_args(np, "power-domains",
> +					 "#power-domain-cells", 0, &pd_spec);

[Severity: High]
Does this hardcode the index to 0 when parsing the power-domains property?

If a consumer device specifies multiple power domains in its device tree
and the MDLC domain is not the first one, the genpd framework calling
r8a78000_mdlc_attach_dev() will still parse index 0. Would this result
in an unmatched node pointer, causing attach_dev to erroneously reject
the attachment with -ENODEV?

Could the module ID validation perhaps be performed inside
r8a78000_genpd_xlate() instead, where the exact spec is readily available
without needing to parse the device tree again?

> +	if (ret < 0)
> +		return ret;
> +
> +	if (pd_spec.args_count !=3D 2) {
> +		of_node_put(pd_spec.np);
> +		return -EINVAL;
> +	}
> +
> +	scoped_guard(mutex, &r8a78000_mdlc_lock) {
> +		hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> +			if (priv->np =3D=3D pd_spec.np)
> +				break;
> +		}
> +	}
> +
> +	if (!priv) {
> +		dev_err(dev, "%s: MDLC %pOF not found\n", __func__, pd_spec.np);
> +		of_node_put(pd_spec.np);
> +		return -ENODEV;
> +	}
> +
> +	id =3D pd_spec.args[1];
> +	of_node_put(pd_spec.np);
> +
> +	map =3D mod_map_find(priv->mod_map, id);

[Severity: High]
Can this lead to a use-after-free on the priv pointer?

The scoped_guard block above locates the priv pointer but releases
r8a78000_mdlc_lock as soon as the block ends.=20

If the MDLC provider probe fails later (e.g. in devm_reset_controller_regis=
ter)
or is unbound, devres unwinds and calls r8a78000_mdlc_unlink() to remove pr=
iv
from the list, then frees it.

If a consumer attaches to the singleton domain and races with this unbind,
could it dereference priv->mod_map here after priv has already been freed?

> +	if (!map) {
> +		dev_err(dev, "Unknown module 0x%x\n", id);
> +		return -ENOENT;
> +	}
> +
> +	dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785941595.gi=
t.geert+renesas@glider.be?part=3D4
