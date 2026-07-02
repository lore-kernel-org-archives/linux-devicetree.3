Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC77390CB2
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783015570; cv=none; b=J1HGPMEFy7OzKGJZ9qaJduSTfaPph5z1fCWw5BIkAEvtjEH1Nx6z9V1j8XHbWBR548IMn0l8DIVNrfnBBv5aNqoyXpHW0y/2cfPpG0XKOLj71bfeXZsmjuwZa+dzdZiwqxyn2BUUs07uMzp1RDtxdseuC6ujSejMMR+1QGWtJkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783015570; c=relaxed/simple;
	bh=kukEzD/BkRsswZHO+A3X04S15aCFAvekMv7umqnaw/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N5qz6LY/jk9s4j01TgS9OgyfL6gZrT0fLHtlhRRIo6fbd3f8/sAs7/4UVYGx02HODNjPzsB0N/BXVFv+B9idYkYSOH1vKR3JtA85YHF6Xbr6kWkn7s8dSvmcwBVqPVnClo+EbKnUmv1Z35nBPGliU+zdy9a/CYw9bqUTcPv5Ahk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSMZokLP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSMZokLP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22CEF1F00A3A;
	Thu,  2 Jul 2026 18:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783015569;
	bh=JOuoN6rbb39CT7kqHcbeMLqhXqj6brpOzFa2cBd0es0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QSMZokLP8LF2YHm/kaNisiTI+e6vrzbbYGRgAHYkCw6BKI2821sf8Exhq1TwJv7JC
	 4ugaYU9A/qq0/a7qoeJzjXWGsoMv82MO23G5Ja9i94+jYY2ie7VnEi7BlGWZzZeBea
	 lcMgjZhgTMbXgsDl9e4dFFuXxP7kv9Ei0RU5lRu8X8d1wwCYJGP9xmMJg37SmiFhCL
	 0XbsPK3v0UrhiegyAqupQX4TMKI1AH4+P1+GKvgjqfo+QhaRYj0pva5zjlbTs/0M6C
	 ISOzt3NYB2mh/gDAhMhnJu/tRR+tBTDcWwNJ0EUgSNgHSZ0vRTDiQyy90UT4N+XtXH
	 VBpdWUl23EHsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/15] clk: mediatek: Add MT8189 apmixedsys clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-mt8189-clocks-system-base-v1-6-2b048feea50a@collabora.com>
References: <20260701-mt8189-clocks-system-base-v1-0-2b048feea50a@collabora.com>
 <20260701-mt8189-clocks-system-base-v1-6-2b048feea50a@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 18:06:08 +0000
Message-Id: <20260702180609.22CEF1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] I/O memory mapped for the `fhctl` node via `fhctl_parse_dt()` is=
 permanently leaked if `mtk_clk_register_pllfhs()` fails during probe.
--

commit ee982ca814ef475721774644512ff52f2ca1b21d
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 apmixedsys clock support
   =20
Add support for the MT8189 apmixedsys clock controller, which provides
PLLs generated from SoC 26m.

> diff --git a/drivers/clk/mediatek/clk-mt8189-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8189-apmixedsys.c
> new file mode 100644
> index 0000000000000..0657a50c30d9f
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c
[ ... ]
> @@ -140,25 +140,25 @@ static int clk_mt8189_apmixed_probe(struct platform=
_device *pdev)
> +	int r;
> +	struct clk_hw_onecell_data *clk_data;
> +	struct device_node *node =3D pdev->dev.of_node;
> +	const u8 *fhctl_node =3D "mediatek,mt8189-fhctl";
> +
> +	clk_data =3D mtk_alloc_clk_data(ARRAY_SIZE(apmixed_plls));
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	fhctl_parse_dt(fhctl_node, pllfhs, ARRAY_SIZE(pllfhs));
> +
> +	r =3D mtk_clk_register_pllfhs(&pdev->dev, apmixed_plls, ARRAY_SIZE(apmi=
xed_plls),
> +				    pllfhs, ARRAY_SIZE(pllfhs), clk_data);
> +	if (r)
> +		goto free_apmixed_data;

[Severity: Medium]
Does this code leak the I/O memory mapped for the fhctl node?

Looking at fhctl_parse_dt(), it calls of_iomap() and stores the mapped memo=
ry
base in the pllfhs structs.

If mtk_clk_register_pllfhs() fails, it returns an error and cleans up after
itself, but its internal error path does not unmap the fhctl base mapped by
fhctl_parse_dt().

Here, jumping to the free_apmixed_data label bypasses the call to
mtk_clk_unregister_pllfhs() (which would normally unmap the fhctl base).
Should the fhctl base be unmapped on this error path to prevent a memory
leak if the probe defers or fails?

> +
> +	r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> +	if (r)
> +		goto unregister_plls;
> +
> +	platform_set_drvdata(pdev, clk_data);
> +
> +	return 0;
> +
> +unregister_plls:
> +	mtk_clk_unregister_pllfhs(apmixed_plls, ARRAY_SIZE(apmixed_plls), pllfh=
s,
> +				  ARRAY_SIZE(pllfhs), clk_data);
> +free_apmixed_data:
> +	mtk_free_clk_data(clk_data);
> +	return r;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-mt8189-clo=
cks-system-base-v1-0-2b048feea50a@collabora.com?part=3D6
