Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF8639479B
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079574; cv=none; b=T9Sgg/foxA7ENTM9L6O3skYV+MIbfFcfz+6LdUKT0dK+0bZbOrx+L7PfozHi4cWJ5IXWMssOio+SVLh13oVs5uc/ii5MZqJpkDqZfHWAP9tX1tkYsp6btD51eBsS9f9pMyezFk60kVhwFJIOdVXTOY314ViZvh7AgppixYowoCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079574; c=relaxed/simple;
	bh=jNTLVZsbaFsBNBc6fYAd7hhD8ZINHtjiBXebhem34r8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LGlH/dFI1kH7pNoXE/jYLqy0ahpuxAiPkOLUNgOItJXqZIuMMGx2MjgWkTIazGjYm4CXgmyNXD3kbV2M8oMvm5mgXRoWZDybjBt6AP9q2MUv/PLlXCEn8JTwQmNs61JZpIDNHVrRwShOIK1wMSXBHHU4ssV4JAvFXxcxEOEaHa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hGrfP24r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hGrfP24r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E271F00893;
	Wed, 10 Jun 2026 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781079573;
	bh=Xi8bKyzPttAls5DgcUuTBjHpexQ2xEA5Y+i0v2oq+44=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hGrfP24rLaLTNbaDzOBDyhi8dJG/z82+PqFXmfHUKkA7exqUPXvEwnbzbXK3atBjd
	 tHraTp/8Do5xQxvIPlNU5fkL+Y6/C5oOE1C7D34PLLmSzIxpbhQ04Znt6qP0sUk7Mh
	 P9ywUq3PuHHQbdkblDvs/jXDg42G0/g2z8AVUSOpXdJkl8EyiGW4b+NYMj+IXWqHwH
	 Xh5m+4nV2NOi2r0P2AGT1r27VgsVY5Z3WgNgEixqdjdgOBjM2zO8OaJ6Isgs9yEZoI
	 OyCc1u1vOMSSEfdCQhLnKamFEzheHylDq+FwCO2AZvQshk1DBh1JjY3gQIPt+86G96
	 jdzOELR0xMNkw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 06/10] clk: realtek: Add support for mux clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260610080824.255063-7-eleanor.lin@realtek.com>
References: <20260610080824.255063-7-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:19:32 +0000
Message-Id: <20260610081933.22E271F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] clk_regmap_mux_get_parent() returns 0 instead of an error indicato=
r when regmap_read() fails, silently masking the I/O error and confusing th=
e Common Clock Framework.
--

commit 6f252a1d2352da3ab0338149dff431cfd1082f04
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add support for mux clock

Add a simple regmap-based clk_ops implementation for Realtek mux clocks.
The implementation supports parent selection and rate determination through
regmap-backed register access.

> diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/c=
lk-regmap-mux.c
> new file mode 100644
> index 0000000000000..8bb66a9e244a1
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-mux.c

[ ... ]

> +static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_regmap_mux *clkm =3D to_clk_regmap_mux(hw);
> +	int num_parents =3D clk_hw_get_num_parents(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret =3D regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
> +	if (ret)
> +		return 0;

[Severity: High]
When regmap_read() fails here, it returns 0. Since 0 is a valid parent
index in the Common Clock Framework, will this mask the I/O error and false=
ly
report that parent 0 is active?

If the hardware was actually using a different parent, this could lead the
CCF to incorrectly assume the actual parent has no active children and
potentially gate it during clk_disable_unused(). Would it be safer to
return an out-of-bounds value like 0xff (which is used later in this
function) or an error code when the read fails, to prevent the CCF from
making incorrect assumptions about the hardware state?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610080824.2550=
63-1-eleanor.lin@realtek.com?part=3D6
