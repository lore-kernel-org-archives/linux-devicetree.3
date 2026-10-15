Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB5451EDF2
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 13:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070374; cv=none; b=PeaWH9/mVQ9S78ieNyqUnqxuyIplKvmfv6WHGa/tBSa3guYsbGBut0R2IXN+2ne5oBghK52VLWEa0Pn1BVBRMbffextZHW/iNaiTU/zxt9CN4Bwv3AS6rKKM4RL6I7laoUQwuDvQYCDiRBvJtJv3/mPZJ1ufZuhwaKdVoCnF+Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070374; c=relaxed/simple;
	bh=cHxiHIUV/nY2YeA+sXTyuK1+GFqUnskZshye1RJ27uo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=D9QxI34PlhHC5zTTy6QcYk+ZacCdbp/s47l8XfN89nM2pgd+Ld0A6nwfXqlyPHxPATUzf0W3Meqyt6+EIZanEtyXmUJshPuPths5fQERz1/wF5lCNw8ZALmgF8/E8kQ5LyKLOdMxlak6cHgAMzry+3JPzMyr3epNCr3tcl3OMNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MxjvV1XZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MxjvV1XZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3E81F000C6;
	Thu, 15 Oct 2026 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792070373;
	bh=sd1YPaR9vIvrISGAFAu+fb82pBOpcD9g1/QhmUwOEUA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MxjvV1XZxnrw5HHi58iOPwDantMnulWR9SbhDXe2dFKZbTj040e+d6Gk+Ix5J5lun
	 Lgd42zLCW4LxjYKsvPC87RnNsjcydWERtZwKqiANdPiO0pk2XnR44WNd0YEQR9lzrc
	 Z60szN98273HhgLBX8IUWHuw5YuUog2muLijcz58bKGfmtVFTa4cuDZn4SaB0HmbNu
	 wdjh916jZe+8oyJ82Kz583VZY3gEcLv/7xHMs+Yu8WYJxGbS2Iyyq+YCG9ube1smkY
	 /jZ4kBmmGpxgoX3H12FeoxaRDgGf0XDbDvQn6BO/8sXKkYXEzmx0tIt/RvCl2oodsw
	 KbLdFxi4Zdy3A==
Message-ID: <sashiko-outbox-172920@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 10/13] net: dsa: rzn1-a5psw: Choose tagging
 protocol based on compatible string
Reply-To: sashiko-reviews@lists.linux.dev
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261014131906.990077-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261014131906.990077-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 13:19:32 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] net: dsa: rzn1-a5psw: null pointer deref in probe on sysfs bind
- [Medium] net: dsa: tag_rzn1_a5psw: broken module auto-loading due to inco=
rrect macro protocol ID
--

commit fb10d951639e543773ea24357094717bd055958c
Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

net: dsa: rzn1-a5psw: Choose tagging protocol based on compatible string

This commit makes the DSA tag protocol selectable through SoC match data
to prepare the driver for the forthcoming RZ/T2H ETHSW support. It uses
the compatible string to select the appropriate tagging protocol while
preserving the existing RZ/N1 behavior.

> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 85ff1fd2bbfba..0b0b4055e6155 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -1223,7 +1230,8 @@ static int a5psw_probe(struct platform_device *pdev)
>  	if (IS_ERR(a5psw->base))
>  		return PTR_ERR(a5psw->base);
> =20
> -	a5psw->bridged_ports =3D BIT(A5PSW_CPU_PORT);
> +	a5psw->of_data =3D of_device_get_match_data(dev);
> +	a5psw->bridged_ports =3D BIT(a5psw->of_data->cpu_port);

[Severity: High]
Does this code cause a NULL pointer dereference?

If the platform device is bound via sysfs, the device is matched by driver
name rather than via device tree. In this case, of_device_get_match_data(de=
v)
will return NULL in a5psw_probe(), leaving a5psw->of_data as NULL.

When BIT(a5psw->of_data->cpu_port) is evaluated, it will dereference the NU=
LL
pointer, which transforms a previously safe error path into a panic.

[ ... ]

> diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
> index 734910156dc33..3dff661fa58cb 100644
> --- a/net/dsa/tag_rzn1_a5psw.c
> +++ b/net/dsa/tag_rzn1_a5psw.c
> @@ -112,8 +112,24 @@ static const struct dsa_device_ops a5psw_netdev_ops =
=3D {
>  	.rcv	=3D a5psw_tag_rcv,
>  	.needed_headroom =3D A5PSW_TAG_LEN,
>  };
> +MODULE_ALIAS_DSA_TAG_DRIVER(DSA_TAG_PROTO_A5PSW, A5PSW_NAME);

[Severity: Medium]
Is this macro protocol ID correct?

The protocol macro DSA_TAG_PROTO_A5PSW does not exist. The correct macro
is DSA_TAG_PROTO_RZN1_A5PSW.

Because DSA_TAG_PROTO_A5PSW_VALUE is undefined, the C preprocessor stringif=
ies
it literally as "DSA_TAG_PROTO_A5PSW_VALUE" rather than expanding it to "26=
".

This causes the module alias to be registered as
"dsa_tag:id-DSA_TAG_PROTO_A5PSW_VALUE" instead of "dsa_tag:id-26", which
breaks module auto-loading for the tag driver.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014131906.9900=
77-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D10
