Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41970319847
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 02:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778724784; cv=none; b=pWAOcAQgfr90P/8Gg9W432n6ktzp7Pw3LAuQ9A/uHKvccHhBEyoPR4xKdAFzBooq7df6S58pJNJ7Rthco6HXU7zz03HO0bIftCSx2cbTDjTZwwgQWcu/681IlLTHmq6CWF2M/2PoeLhZ4Y4w4b1Y1gVzh3P2lrKOnJ76+0Xq8MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778724784; c=relaxed/simple;
	bh=MQUypza3VTxyvSjpuQA1EJv5W5cxJtbFZSvb1llZYKw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OaUTevU1ylSWGsI58690UmpD66AOHKjAMVWscUPArtz1fx36Yso7QIXAHXM4J4TZiGE+StBJD6Jd3mrQ+KQobq8ES8h+SmXLjojVDDCbFHZCiRBJzRBtXhnyH5ONYXBZljpFk7Nu7/g3+A4+l4GT0sB2Mu3HDi7ZNLMOft0qxFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdeaqhGW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdeaqhGW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E402C19425;
	Thu, 14 May 2026 02:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778724783;
	bh=MQUypza3VTxyvSjpuQA1EJv5W5cxJtbFZSvb1llZYKw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=RdeaqhGWKyfdWnFwJ5Y3w4Wxbyo3ljrg2vBFjA19t2k9BAxwAfEtR1o/TDPRzYb2o
	 nKVFdpb4ntqQKhoFQ6ghiBD5vTfpmBiXGhXnCdu4WwW6sXcycV5I2jHGZm9Gj6KPYH
	 0TKD6aZMZOanQmqjaiRYCx76qbfq3V/K3oA4obSkBP29UMwScKj6NEAvL5PgEK5GOx
	 lrUlS/8kYKCI1TXJdwTZTEs8U+iCgWKipvG6hccdEPWs19iTr2ic9b7/vmLUVCWNTU
	 ESiPXhSlR8uEqTp80VAQ3vruwbI5Is+kkV4a6ZrfeuEA8BtimVaIIigENVcJSONik9
	 sjGt2IYgzJ2tQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/16] ASoC: rsnd: Add RZ/G3E DMA address calculation
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260512182631.3842065-9-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-9-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 02:13:03 +0000
Message-Id: <20260514021303.8E402C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unchecked NULL pointer dereference in rsnd_rzg3e_dma_addr() when S=
SIU module is not present.
- [Low] Missing parentheses around macro arguments in RZ/G3E DMA address ca=
lculation macros.
--

commit 8ac44d32c9e0b39cce390dd7dede7d192b0f5ad7
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: Add RZ/G3E DMA address calculation support

This commit adds a dedicated DMA address calculation function for the
RZ/G3E platform, which has different DMA register base addresses and offsets
compared to other R-Car platforms.

> diff --git a/sound/soc/renesas/rcar/dma.c b/sound/soc/renesas/rcar/dma.c
> index 24c23cb893906..ede0123d40eb5 100644
> --- a/sound/soc/renesas/rcar/dma.c
> +++ b/sound/soc/renesas/rcar/dma.c

[ ... ]

> +/* RZ/G3E DMA address macros */
> +#define RDMA_SSI_I_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * =
i))
> +#define RDMA_SSI_O_N_G3E(addr, i)	(addr ##_reg + 0x0000F000 + (0x1000 * =
i))

This isn't a bug, but could the 'i' parameter be wrapped in parentheses?

While 'i' is currently passed as a single variable ('id'), using (0x1000 * =
(i))
would prevent incorrect address calculations due to operator precedence if =
an
expression is ever passed as an argument in the future.

Does it make sense to update the SRC and CMD macros below as well?

> +
> +#define RDMA_SSIU_I_N_G3E(addr, i, j)	(addr ##_reg + 0x0000F000 + (0x100=
0 * (i)) + (((j) / 4) * 0xA000) + (((j) % 4) * 0x400) - (0x4000 * ((i) / 9)=
 * ((j) / 4)))
> +#define RDMA_SSIU_O_N_G3E(addr, i, j)	RDMA_SSIU_I_N_G3E(addr, i, j)

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

Can this result in a NULL pointer dereference?

If the ALSA stream does not have an SSIU module attached (like when the
device tree omits the SSIU node, or the SSI is configured for PIO mode via
the pio-transfer property), rsnd_io_to_mod_ssiu(io) will return NULL.

Looking at rsnd_mod_id_sub(), it unconditionally dereferences the pointer:

sound/soc/renesas/rcar/core.c:rsnd_mod_id_sub() {
        if ((mod)->ops->id_sub)
                return (mod)->ops->id_sub(mod);
       =20
        return 0;
}

Could this trigger a panic on stream open in valid configurations like
[SRC] -> [SSI (PIO)]?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512182631.3842=
065-1-john.madieu.xa@bp.renesas.com?part=3D8
