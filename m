Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780354;
	b=nmRm8C3RR0KLQxSEsN89WnfKAuMqievzjmxziOSsOOJ2fxMycFJcgZ+SwS/a2UVrA9TI
	 GTk7tWrOViy/c4MmxTkPCYRCzlsp9NzqFW0zXff30QKC7bxGOde5Ls2065paJ5xRjT2et
	 mHdkOw4VPfjLUd431QgQMkRUEUdJ0UU8xusyo8N+7H0TVg3+fvYQMvsQej6/gMDU9P1qO
	 mfkDWf6WRvDTDGsZLY2IVWT16e1eDyh6pKNS9nmsu9/WHJ/x0Ht2quU2GlJdQQNDLsrRo
	 078+ilKS21tY+2XYdmAspSzOdebnxC6ETAmSEv6DFi+XzaT7M6b93MuHHELtjOPC8FA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780354;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IMUEYDNWGV3k2tJOfcB8D46bfq4464SbgYWnuJey9Iw=;
	b=zqhivIjemV8L8Ltkk331+omkGuYcAlid1GSStmrtShkrYzXh6J/FDEbCpTRpbiCIS/A6
	 sL8C0Om13RzP9NeLSB7JHtDZPLKq+PyQLDfMIvn7frDI0sBwEJomoPKU2nFcwEdTGGVNH
	 ZHR4wIyhBw9er2en5Qyp1rxSPJyxX03J4x/fkbU5Lm+V7ZnLGbMaIPT53JOjHr4pHTPGl
	 /V05OFfedzXW5Wdl0DcLuSg4PhgkhjGklZ+tyPoEmBktPNy0tp/gsARQE4ogeLv1Fuuz1
	 2o+MLmwDL7BEUL5GNAxslyAgyybpDTZTLrjhBmmF9545teI3VQhCKY+yPARThVagWfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aXurkSOV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5959606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aXurkSOV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 635091F00893;
	Fri, 27 Nov 2026 11:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795780353;
	bh=IMUEYDNWGV3k2tJOfcB8D46bfq4464SbgYWnuJey9Iw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aXurkSOVPUkf0rOZpwfcEO8ODozOrvCbDLIWx0k7yJ+FYgNATQLZXKLtOOU9kBvRS
	 TBF46botbDZCxlId4f6lerBDWjNIm8ZnA3V3l99r5x4e+SnQuUUoVuHernD2vk5k4E
	 oXo+eccHV4QDs/t9BAFPonbQjN8SAVSK4xIUBNAYcxG5Ic8wTfpWY4+DykzgfpJuTl
	 cI7PhCPOvedY9XEObWc84y5aEbS6cEXE5zLC1Fa+wndaGLJBzzP2C7sq2m57l5IMvd
	 wCNLgqGzwAkEjcZzY9mmRj47ppH8C8DiVg9F9RtYmmY8du/8rT3I0SGbE77fTymCrn
	 66HIFcsgKuYiw==
Message-ID: <sashiko-outbox-237297@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] interconnect: qcom: add the Seca interconnect
 provider driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261127-seca-interconnects-v1-2-a31bf9b36ac4@oss.qualcomm.com>
References: <20261127-seca-interconnects-v1-0-a31bf9b36ac4@oss.qualcomm.com>
 <20261127-seca-interconnects-v1-2-a31bf9b36ac4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:52:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] interconnect: qcom: seca: qos_requires_clocks mismatch on
  seca_aggre2_noc_tile
--

commit 4043595211778883a7c06e13c8db55e471b08e8f
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

interconnect: qcom: add the Seca interconnect provider driver

This commit adds the interconnect provider driver for the Qualcomm Seca
SoC.

> diff --git a/drivers/interconnect/qcom/seca.c b/drivers/interconnect/qcom=
/seca.c
> new file mode 100644
> index 0000000000000..7795fbf61a4c2
> --- /dev/null
> +++ b/drivers/interconnect/qcom/seca.c

[ ... ]

> +static struct qcom_icc_bcm * const aggre2_noc_tile_bcms[] =3D {
> +	&bcm_sn1,
> +};
> +
> +static struct qcom_icc_node * const aggre2_noc_tile_nodes[] =3D {
> +	[MASTER_EMAC_0] =3D &xm_emac_0,
> +	[MASTER_EMAC_1] =3D &xm_emac_1,
> +	[SLAVE_A2NOC_HSCNOC] =3D &qns_a2noc_hscnoc,
> +};
> +
> +static const struct regmap_config seca_aggre2_noc_tile_regmap_config =3D=
 {
> +	.reg_bits =3D 32,
> +	.reg_stride =3D 4,
> +	.val_bits =3D 32,
> +	.max_register =3D 0x1b400,
> +	.fast_io =3D true,
> +};
> +
> +static const struct qcom_icc_desc seca_aggre2_noc_tile =3D {
> +	.config =3D &seca_aggre2_noc_tile_regmap_config,
> +	.nodes =3D aggre2_noc_tile_nodes,
> +	.num_nodes =3D ARRAY_SIZE(aggre2_noc_tile_nodes),
> +	.bcms =3D aggre2_noc_tile_bcms,
> +	.num_bcms =3D ARRAY_SIZE(aggre2_noc_tile_bcms),
> +	.qos_requires_clocks =3D true,
> +};

[Severity: Medium]
Should seca_aggre2_noc_tile set .qos_requires_clocks =3D true when
Documentation/devicetree/bindings/interconnect/qcom,seca-rpmh.yaml
prohibits the clocks property on qcom,seca-aggre2-noc-tile?

With no clocks in the DT node, devm_clk_bulk_get_all() returns 0 in
qcom_icc_rpmh_probe(), which hits (!qp->num_clks &&
desc->qos_requires_clocks) and skips programming the QoS registers for
xm_emac_0 and xm_emac_1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-seca-inter=
connects-v1-0-a31bf9b36ac4@oss.qualcomm.com?part=3D2
