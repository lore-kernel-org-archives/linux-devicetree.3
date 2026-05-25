Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821FC336EF8
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779708594; cv=none; b=gHAHxH/ZxRQwoRqo0TyU0a4kc09HbraZ2XppNR+uvzZ95ukDukMOoVs+orCh16xMwn21YitmEUPBUiUHE8nToIiH4mPJRA2aTywkfzIhq464dNtDpjZ/fh8tX7410o7lNmqeCqi0iksOU6zkJZJ2V4mGtMOO6TkmpTNnhDpsazs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779708594; c=relaxed/simple;
	bh=bLdlkhzXpWD4IA9hbOy8NkX6kT/mNKEQ5+knNom0agc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YDz2CVqyuID+UOXUXU6xWEcoSRJm0Z9LrpQ0kL9YyvPq35Om74PV9ZJuI9EO4J6DUcTU7BnMKFTHWAq2H7s5upvhFItmy7Sww6AeDzOw+AzW2HNTYBk7Is2AXNIDdEbb+nWIa9mL4ryFGtDfe0gHdxdprH9zXTqy3xo1k+uGSjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EGbv3sxE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EGbv3sxE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28A81F000E9;
	Mon, 25 May 2026 11:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779708593;
	bh=koGIWNzaYrld3pAUWQazBQG0Lkq7zM68gYAVbJTBeUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EGbv3sxE/Cxp7Ud85ZePKmORN3h+Tpxowd+NA+bjdsS/xgM/b4WEjeHq3o4WvqXrk
	 CQE1T38PcDVq4UoncFWOB9+T99bVDZgjCa1OD8wNxMGn/NAPER4X/OuqHd1tAMIKlc
	 9LFq8LApsjAvgyI9s1bFxx8X0uBBvEtp80BRB4TctuHxjodK/FqLWGu0kqgc/Vz/qF
	 Fnka1NNLxhMSc9sSWY5asiiK3wquhLlkPaPoM1vKJAGaNTKUgl6ROQovH+MxWHS3K/
	 SfrUpfHvgsOd/EiIYpqiHPXyB1VR0Sb6AayDFJsVsCR+5KjPUqhhdjmOU27TkCwqZa
	 KbijPkqDgpDOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/18] ASoC: rsnd: Add RZ/G3E DMA address calculation
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: wsa+renesas@sang-engineering.com, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260525110230.4014435-9-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-9-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:29:52 +0000
Message-Id: <20260525112952.E28A81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential NULL pointer dereference in rsnd_rzg3e_dma_addr() when e=
valuating the bus interface (busif) if the SSIU module is absent. This prob=
lem wasn't introduced by this patch, but was copied from the pre-existing r=
snd_gen2_dma_addr() function and propagated to the new RZ/G3E platform.
--

commit 81338bf6d6c4e6f1f0cb642937dcc5c87e6a300d
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: Add RZ/G3E DMA address calculation support

This commit adds RZ/G3E DMA address calculation support to the rsnd
driver. It implements a dedicated rsnd_rzg3e_dma_addr function to
handle the different register base addresses and offsets for this SoC.

> diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
> index 0ce77eee338da..92974610ac153 100644
> --- a/sound/soc/renesas/rcar/dma.c
> +++ b/sound/soc/renesas/rcar/dma.c
[ ... ]
> @@ -644,6 +644,85 @@ rsnd_gen2_dma_addr(struct rsnd_dai_stream *io,
[ ... ]
> +static dma_addr_t
> +rsnd_rzg3e_dma_addr(struct rsnd_dai_stream *io,
> +		    struct rsnd_mod *mod, int is_play, int is_from)
> +{
> +	struct rsnd_priv *priv =3D rsnd_io_to_priv(io);
> +	phys_addr_t ssi_reg =3D rsnd_gen_get_phy_addr(priv, RSND_BASE_SSI);
> +	phys_addr_t src_reg =3D rsnd_gen_get_phy_addr(priv, RSND_BASE_SCU);
> +	int id    =3D rsnd_mod_id(mod);
> +	int busif =3D rsnd_mod_id_sub(rsnd_io_to_mod_ssiu(io));

[Severity: High]
This is a pre-existing issue, but can this lead to a NULL pointer dereferen=
ce
if the SSIU module is absent?

If the device tree configures the SSI module for PIO mode, the SSIU module
might not be connected to the audio stream, meaning rsnd_io_to_mod_ssiu(io)
evaluates to NULL.

If another module in the pipeline, such as SRC, unconditionally requests DMA
during probe, rsnd_dma_alloc() will determine the DMA path and call
rsnd_rzg3e_dma_addr().

Since rsnd_mod_id_sub() does not check for a NULL mod pointer:

sound/soc/renesas/rcar/core.c:rsnd_mod_id_sub() {
        if ((mod)->ops->id_sub)
                return (mod)->ops->id_sub(mod);
        return 0;
}

Could evaluating rsnd_mod_id_sub(rsnd_io_to_mod_ssiu(io)) here trigger a ke=
rnel
panic on probe with a misconfigured device tree? Should this be handled
gracefully instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525110230.4014=
435-1-john.madieu.xa@bp.renesas.com?part=3D8
