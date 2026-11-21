Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795220789;
	b=17/vt5ZPXb1xCoPe2ZMHHXPi9m86xSy2x/w+CGVXV8XFrM0EI7OBoPQpMg6ypOstZUmV
	 9sn4RGSJIArUELd9VAeUnIKYYRWxqlxurrkS7aBP8fFYEuz3QFxG+fonHULgVCoTx5z2u
	 XBiR+INp3lhnqv8K6PmpOtaDtJEGIgHaLS0EWu4eUN19zWq8XLxP5s/0yZz7rIac6WWFD
	 +zzBJt8IJ8/LLRno+cATxNt+790VtA/o8gRWs7Afj2hQkifvPzUjZwgfwOVRjrGdYxPrj
	 rh6I5W8tYxQsxClTFY3QqFiGQ9NwPd7iEt8eOx6WQDKKoIOfM9TR0dv5JfllYWfOmuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795220789;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OLMv+Z6Bavo3dZ4VE3pH2AzubZWmMVz/hdLsYfoAMAw=;
	b=qOrwykZPXGjX4nfkLIV7GC7Gk7mzg4R4xUP4jsG311L1SVySo1rXYp3iuqNXygNyRehO
	 s8hx8Ne/ofOLumoSQoTL8qZ0vO6toYVrGRwhw99URh0hzxS9bV9NNEgFrl6hJt2bC4REb
	 RNAakIBQFe9FZD5N8cpgg0zolmG+JXZ1emp5gYBKM/GcqCkIFaVOZSDOt9X9YTxJxA3Y3
	 BPZ34UZO1fnYAh/xdEFtEnt7IxuPCJ18zpIGCpjUygZw1gZgzwoocZEwO5OV2ilwWN97Q
	 7K/oPBQImc+ajCG1DlyP5MqXrjonZ1foL+2ExbRpwaRAstElEm7W3ukgsYIyVklh+Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EiTRAIPl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB1760A260A
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 00:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EiTRAIPl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCF511F000D1;
	Sat, 21 Nov 2026 00:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795220789;
	bh=OLMv+Z6Bavo3dZ4VE3pH2AzubZWmMVz/hdLsYfoAMAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EiTRAIPlhRRpU0RQznFIsXDqV3CPnRuQAskukC6KiJrvxCxYnNgJPpunOcRICI26J
	 gmLC1EX8WDNzN9LWNO0rN8vI0ajfOrON5uXsEDHWTQ1B2boOaHcl3iIsSN1sQsjfob
	 AWSINQ+FJDx7GNX5jeE7o4tElG09RXuZY7p19UjOjnJlzQknVcZiYIaukaVqNNT0w1
	 f31+5ORhTh9vOloicxvtmRkX7c0o5/+rv6M0HZBvAjLnjCwkQSuGpI4DN+uBcxHcyQ
	 3JHKPMhxlM4FuBlNpbZg0hpexQO8Pe1sMW2gV4npkjzMlQdusA8Gmqr2aT6GwcFFmv
	 LtggSIZqcYdmg==
Message-ID: <sashiko-outbox-226423@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 23/24] net: dsa: rzn1-a5psw: Add support for
 RZ/T2H Ethernet switch
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261120002549.1908299-24-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-24-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 00:26:28 +0000
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
- [Low] net: dsa: rzn1-a5psw: commit message mismatch with rzt2h_of_data
  fields
--

commit 4cc70741a81151e45009ef66aa857244ba0bd6a8
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch

This commit adds OF match data and the "renesas,r9a09g077-ethsw"
compatible string to support the Ethernet switch on the Renesas RZ/T2H
SoC.

> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 86d5b9d52f8db..2b69e92e18533 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -1411,6 +1411,20 @@ static void a5psw_shutdown(struct platform_device =
*pdev)
>  	platform_set_drvdata(pdev, NULL);
>  }
> =20
> +static const struct a5psw_of_data rzt2h_of_data =3D {
> +	.nports =3D 4,
> +	.npcs =3D 3,
> +	.cpu_port =3D 3,
> +	.tag_proto =3D DSA_TAG_PROTO_RZT2H_ETHSW,
> +	.management_port_fixed_frame_len =3D 0x3fff,
> +	.rxmatch_config_base =3D 0x3f00,
> +	.pattern_ctrl_base =3D 0x3f40,
> +	.vlan_res_vlanid =3D GENMASK(15, 4),
> +	.vlan_res_portmask =3D GENMASK(3, 0),
> +	.lk_table_entries =3D 4096,
> +	.keep_mac_tx_enabled =3D true,
> +};

[Severity: Low]
This isn't a bug, but the commit message lists "The odd MDIO clock divider
formula" in the RZ/T2H variant configuration instead of
.keep_mac_tx_enabled =3D true.  Earlier in this series, commit
"net: dsa: rzn1-a5psw: Fix MDIO clock divider calculation" applied the odd
MDIO clock divider formula unconditionally in a5psw_mdio_config(), so
struct a5psw_of_data has no MDIO divider field.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120002549.1908=
299-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D23
