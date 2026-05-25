Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01633355F41
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779708215; cv=none; b=WfFKj6ImRmXw4LabcndbSdA/Q22sU8f1+jg0hWtc/CzW2B7FAHQ2IE+csi2q218kdqlMI6dmg4vqSZPjK90iU5izEIQQjEbL+RscVWYj9qSCyN98n4uNBtAwOY4lwPztigo2wc7AVmuxSOSjskhM56CZq7v4jhRU+6OzYxYi1r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779708215; c=relaxed/simple;
	bh=YrHszPLwtJONKuu6qHi8txKr77yGjKSb0PUrgt6ne2I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rqghLcaOkSK2cuh0gQKpABCZyv005HzLYpB4sLmfBrGW5alzJBZ0gwAzikuTpu8oT5b083NOxqh+gHpSI1MJmb3Lp2zVIxoEXAsKrpC91vXEe1JgDw35mJgnft1TYaAYBRa5HE5LPgjbo2RBsAN3dFiT103UJg06J/q0+DpjdV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eh26QptJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eh26QptJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7021A1F000E9;
	Mon, 25 May 2026 11:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779708213;
	bh=GOzYK+q7aQojdfqtYEovk4Cm8JioVpE8Etvzw5NSjAE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eh26QptJac0rKS/8EKm/ZpsaX+QLXG4Mhbp5KduQAwIxiWxI5S0kyc6JWlDCStXTR
	 6JAL+2ieX/0QcN1tdmS8/wIDxKCclGO5ZFwh2I/7x601BgL10Bo7D9+fd6shbYF4H9
	 3hHHfRXIxAZPnF2JeZWnAyVgkUe7Y3ms5u5LjyRzda5UJbiwfxoKnqcnIGW4LF4aKG
	 9eOXksPgDFkptfX0DR4xnlg/81B8cRBL8VrJJFMd3d8b63i3GVX/22QMbqoq0DJGvg
	 UiekQCE8mTlYk3g9Mt/oD5fJP7GdVEd7Jog+pQCX3ZXD4tnF9HLV/LDCCMlqje66pM
	 3AC44hbctRntg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 07/18] ASoC: rsnd: Refactor DMA address tables with
 named structs
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525110230.4014435-8-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-8-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:23:32 +0000
Message-Id: <20260525112333.7021A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential NULL pointer dereference in rsnd_ssi_use_busif if the st=
ream lacks an SSI component.
--

commit c7d64665ffb93009db59da73396bbe58b794f096
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: Refactor DMA address tables with named structs

This commit replaces the raw multi-dimensional array used for DMA address
lookup in rsnd_gen2_dma_addr() with named structs. It also extracts the
common lookup logic into a shared rsnd_dma_addr_lookup() function to
prepare for upcoming RZ/G3E support.

> diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
> index d52cada711e50..0ce77eee338da 100644
> --- a/sound/soc/renesas/rcar/dma.c
> +++ b/sound/soc/renesas/rcar/dma.c

[ ... ]

> @@ -481,6 +481,69 @@ static struct rsnd_mod_ops rsnd_dmapp_ops =3D {
>  	DEBUG_INFO
>  };
> =20
> +struct rsnd_dma_addr {

[ ... ]

> +static dma_addr_t
> +rsnd_dma_addr_lookup(struct rsnd_dai_stream *io,
> +		     struct rsnd_mod *mod,
> +		     struct rsnd_priv *priv,
> +		     const struct rsnd_dma_addr_map *map,
> +		     int is_play, int is_from)
> +{

[ ... ]

> +	/* use SSIU or SSI? */
> +	if (is_ssi && rsnd_ssi_use_busif(io))

[Severity: High]
This is a pre-existing issue, but could this lead to a NULL pointer
dereference if the stream lacks an SSI component?

If a device tree specifies a DAI link that includes an SSIU module but
omits an SSI module, rsnd_io_to_mod_ssi() will return NULL.

When rsnd_ssi_use_busif() is called, it unconditionally passes this NULL
module to rsnd_ssi_is_dma_mode(), which dereferences the ops struct:

sound/soc/renesas/rcar/ssi.c:rsnd_ssi_use_busif() {
	struct rsnd_mod *mod =3D rsnd_io_to_mod_ssi(io);
	...
	if (!rsnd_ssi_is_dma_mode(mod))
		return 0;
	...
}

Would it be safer for rsnd_ssi_use_busif() to verify the module exists
before checking its DMA mode, allowing a malformed device tree to
fail gracefully instead of causing a panic?

> +		is_ssi++;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525110230.4014=
435-1-john.madieu.xa@bp.renesas.com?part=3D7
