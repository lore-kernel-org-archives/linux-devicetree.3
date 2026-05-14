Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B95A2F5313
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 00:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778719861; cv=none; b=fSpoB6/YxyxI5nh0bKr8+siY0VMFYQHjA4SMCSG+s07fKpwlyqdYxwbK1Cd+E8HWzTdIX/eQBkRafCgLeigpMGaOl87qoYRIdpsQX8pzReqx6EdIJaETjNHZk2GQlAsJhhF2ChTeB4wsj8jqNR2IP+eglisCxAubERHUy9EeB/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778719861; c=relaxed/simple;
	bh=I4HTsFn267db23sgeYge7oHGyZ0z7GVCK46SYN0tW9E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XmnjRm8WyDTqjjdVBJQErffzkbOEAxOYyzHylkGUSh+lVdym/EgCIlsrIE+TY5CnBpFl+zhpUBoXxsMQa3gMG4KumgvAXTUOAQi5v56GJ7QkkWGh1kwtXC1EXBH2JpAajWGkdiuJDuedut8pHjkzPnF9sMjt+Nw7IalOICER7ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8n7HxSC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8n7HxSC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4896C2BCB3;
	Thu, 14 May 2026 00:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778719861;
	bh=I4HTsFn267db23sgeYge7oHGyZ0z7GVCK46SYN0tW9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=O8n7HxSCwr5p6fIivB9zbIdcZAJfi7Uv+9aFoHbOkLWzh/f2R5LCc+Qy+bADSgOyl
	 Vcg6HjCio+8GaKh7Qxc0TGDH0ZpHOYlQ1fhd4GnOH0Z1iJvxVGcGizOXwWkEh/CZwm
	 tFkPdoMiZPvO0LVcl7XEXylgIP2em1zLve5fXMQD010Koo8dJGUHv/UiOD2G3flzBQ
	 Ge6ZhmEcUF+0uNuDuRV5reUW1fFvP75II1cgYn/EtAlYoel4wn2VFdV/dj1VDWo46C
	 lYltys3A4RKfnqgDi2hqn3Y0usNdCbjRVT0X7BTpLjUN+6n2wqHQ5A8ci02WMfvU7S
	 DN8shhbcnleDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 05/16] ASoC: rsnd: Add RZ/G3E SoC probing and
 register map
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260512182631.3842065-6-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-6-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:51:00 +0000
Message-Id: <20260514005100.B4896C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unmapped PIO data registers cause an IRQ storm and log spam if PIO=
 fallback occurs on RZ/G3E.
--

commit c024509f93a46087ccbea869fbbcef923ba14644
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: Add RZ/G3E SoC probing and register map

This commit adds support for the RZ/G3E audio subsystem, which has a differ=
ent
register layout compared to R-Car generations. It introduces the new SoC's
register layouts and probe support.

> diff --git a/sound/soc/renesas/rcar/gen.c b/sound/soc/renesas/rcar/gen.c
> index d1f20cde66be1..05d5f656fb01c 100644
> --- a/sound/soc/renesas/rcar/gen.c
> +++ b/sound/soc/renesas/rcar/gen.c
[ ... ]
> +static int rsnd_rzg3e_probe(struct rsnd_priv *priv)
> +{
[ ... ]
> +	static const struct rsnd_regmap_field_conf conf_ssi[] =3D {
> +		RSND_GEN_M_REG(SSICR,			0x00,	0x40),
> +		RSND_GEN_M_REG(SSISR,			0x04,	0x40),
> +		RSND_GEN_M_REG(SSIWSR,			0x20,	0x40),
> +	};

If the RZ/G3E audio subsystem falls back to PIO mode (e.g., if DMA channel
allocation fails or the pio-transfer device tree property is set), will this
cause an interrupt storm?

The conf_ssi regmap for RZ/G3E intentionally omits the SSITDR and SSIRDR
data registers.

If PIO mode is engaged, rsnd_ssi_start() enables the Data Interrupt (DIEN).
When the interrupt fires, rsnd_ssi_pio_interrupt() will attempt to access
SSIRDR or SSITDR. Because they are missing from this regmap, the access will
be intercepted and skipped, returning an unsupported register access error.

Because the hardware FIFO is never serviced, the level-triggered DIRQ
condition is never cleared, resulting in an IRQ storm that hangs the CPU
and floods the kernel log.

A later commit in the series claims "SSI always operates in BUSIF mode
with no PIO fallback", but should this constraint be explicitly enforced
in the code to prevent this IRQ storm from occurring?

> +	int ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512182631.3842=
065-1-john.madieu.xa@bp.renesas.com?part=3D5
