Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795889735;
	b=N7TO0XIQ34UOS6yB6mpU39clSJ4Mv9mydOT05FjUknTfLEAyj06jyOKro9TRJ1/qW31r
	 j4vO1qQCfC1WNIVF78Af9t8PvPCgked2s4QCD5OgA+eMgRwVvgJ41V+bbZJdBwdcwW3/c
	 cr/ftX3pTkduN/yTuBh1vrl82jJFOmA+SAE8OJRA1d6oHnk9Rwf9QBizGbEdGjBEQO1JE
	 QdTjTaxPWTlLNWU8GARhsR8bYv5zr3GUZUSgWJ1/YXvdpSaE9QqrYbEkvkhDV1Z7M+D7E
	 9p8nyWopqpj3BNsss4wZkNqaa4ScJfE59tyAzKAqp4O9e5bW2zWGzUAPFBjcLIE9O3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795889735;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pSM3aeiQw/8czZqtCvK3zD1x5Nq1+BOHjWBBp0/0ORw=;
	b=Ivc2GpDFGfaplvgmudvjQInIVXzU4sddROxd7AJi1Y8i4WZHo9YKBXnAxz7q/szRySFQ
	 OqzfGMlqbpUhPZKmfISOiQ4VwhwoljL2+NgjVIVvuY+GgAdyCorEHMw6LjfVKOZOGzszy
	 SS4IYT/yrMF16/wOllr+L8nn2Jluw6Jw7UYuyTqDC01N/QeO8Yc/z4SEPAo9e0tckBP19
	 7OiOKK1FNxriDzZ57lkILFE+GWos7LFad6cgYtErTju+027lgeG/9zP41NrAMIFNStmvk
	 U81Bb7Oa2nAoMYcXtqJoZFEPVrMZCwdLMC4Q9FO075xEfZKMi2EK6CbZ08DveXYl5aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHpVHWKh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E928606A321
	for <devicetree@vger.kernel.org>; Sat, 28 Nov 2026 18:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hHpVHWKh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3D51F00893;
	Sat, 28 Nov 2026 18:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795889735;
	bh=pSM3aeiQw/8czZqtCvK3zD1x5Nq1+BOHjWBBp0/0ORw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hHpVHWKhc9540g4G5OFsp4Df4RhK9rpVL/ZmHJ1HUL4kvYXb+UJL6re5wXo+02kYR
	 ZqfGxrDjVTESUzpSLGzuRXY6qpk35WFuBK/YMc449xhT3Wgl473dVQ9YAKoEE96qyY
	 6SfFHGx+RO0+6YLp41kNgyYlLxj1yMQ2VKPJPo8kWhFsslF6N+U2Qg9BB0XgU6sIVO
	 owhmN+o6rfm63bfZNGMFgJKXfxK4Q1O9xVTMEO1uaVH+9iQkv/OuY71/QRxvc3UX3J
	 1ZD55MXOPOloTzBTPlChPSUJSNY9gTaj+8/NeBlmw1mUz9cAZStJDUQIIZ8P0aOLq9
	 g9CacL0raKGKA==
Message-ID: <sashiko-outbox-238949@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/3] net: pcs: rzn1-miic: Add resets to rzn1
 info structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hendry" <khendry@reliablecontrols.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261127-miic-reset-consumer-v1-2-3cab78b94e23@reliablecontrols.com>
References: <20261127-miic-reset-consumer-v1-0-3cab78b94e23@reliablecontrols.com>
 <20261127-miic-reset-consumer-v1-2-3cab78b94e23@reliablecontrols.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 18:15:34 +0000
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
- [High] net: pcs: rzn1-miic: miic_reset_control_init() fails on
  existing RZ/N1 DTBs
--

commit 3902b143c1e8eed13da6131cc0c93499f17b4052
Author: Kyle Hendry <khendry@reliablecontrols.com>

net: pcs: rzn1-miic: Add resets to rzn1 info structure

This commit populates the rst_ts and rst_miic reset IDs in
rzn1_miic_of_data so the driver acquires and deasserts the resets for
RZ/N1 MIIC.

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index 682a73cf5a87d..3c4eca8960bd9 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -128,6 +128,11 @@ static const char * const index_to_string[] =3D {
>  	"CONV5",
>  };
> =20
> +static const char * const rzn1_reset_ids[] =3D {
> +	"rst_ts",
> +	"rst_miic",
> +};
> +
>  static struct modctrl_match rzt2h_modctrl_match_table[] =3D {
>  	{0x0, {ETHSS_GMAC0_PORT, ETHSS_ETHSW_PORT0, ETHSS_ETHSW_PORT1,
>  	       ETHSS_ETHSW_PORT2, ETHSS_GMAC1_PORT}},
> @@ -855,6 +860,8 @@ static struct miic_of_data rzn1_miic_of_data =3D {
>  	.miic_port_start =3D 1,
>  	.miic_port_last =3D 5,
>  	.sw_mode_mask =3D GENMASK(4, 0),
> +	.reset_ids =3D rzn1_reset_ids,
> +	.reset_count =3D ARRAY_SIZE(rzn1_reset_ids),
>  	.init_unlock_lock_regs =3D true,
>  	.miic_write =3D miic_reg_writel_unlocked,
>  	.type =3D MIIC_TYPE_RZN1,

[Severity: High]
Does setting reset_count in rzn1_miic_of_data cause miic_probe() to fail
with -ENOENT on existing RZ/N1 device trees that do not have resets and
reset-names properties?

miic_reset_control_init() uses non-optional
devm_reset_control_bulk_get_exclusive():

drivers/net/pcs/pcs-rzn1-miic.c:miic_reset_control_init() {
	...
	ret =3D devm_reset_control_bulk_get_exclusive(dev, of_data->reset_count,
						    miic->rsts);
	if (ret)
		return dev_err_probe(dev, ret,
				     "failed to get bulk reset lines\n");
	...
}

Existing RZ/N1 DTBs (and arch/arm/boot/dts/renesas/r9a06g032.dtsi prior to
commit "ARM: dts: renesas: r9a06g032: Add resets to mii converter" later
in this series) omit these properties on the eth-miic node, so
miic_probe() fails before calling platform_set_drvdata() and leaves
consumers such as dwmac-rzn1 and rzn1_a5psw stuck on -EPROBE_DEFER.

Acquiring the resets as optional (e.g. via
devm_reset_control_bulk_get_optional_exclusive()) would preserve backward
compatibility with existing RZ/N1 device trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127-miic-reset=
-consumer-v1-0-3cab78b94e23@reliablecontrols.com?part=3D2
