Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F98305662
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709662; cv=none; b=idsf/bbDhNet1RGRe/+vzxl54pfBLrEXBKK0wjx0XvyzH+Q0ykWEs33UqjsFwG3HYvX8Zo4uMXR2YFM/gQWAci+b+HfTgLgOqaMjAUkWZhJpSB7Y2J6W/b7EOWJzpnZere/EN7I/xK7otgeh3OJuMMCbJQTENsXty5EzfP7AWrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709662; c=relaxed/simple;
	bh=LMcIXrkrSuePC/GLOWJrhgJLsndV2EtSGrsHMGHhfBs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TEUhl0Yx7BzDUmyZAJdZCq3cpJKmNj64MGjGqjNSdnoCkwKWCbXS9zRCFDyCwTyTOk71OxkAn5QY8k+2nd8kvZGyzQmnkr+m7g74rpFdMwu/JnHg5NrbEOj+npZSF+0Q7/luwPqCRSw7uiZOSw6MuRLqNGgYfTqZS95Rdleh/Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSrD0QJ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSrD0QJ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1DC1F000E9;
	Mon, 25 May 2026 11:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779709661;
	bh=PQHpopSh4+nk2H9m0gJtIxagld45rOULuhfLF4+Mc6o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WSrD0QJ1EM78vZLpFm1qtasVjksMzeC8sBMET9q4PVPaZpAnh87T3oUEi2smpD7ym
	 l6gTSRYM/OewSfYMdfol+tJlTuIKxR7kot3d+H8VZ3TYlvZTTcHtC0ftU5w57rwI/d
	 E3gjMi8esxd93znBg0zBrwIAPRxtRMx9ZSduwWQZKqRo08ZjGXHtNDb8sxJYphQw+b
	 TaOeYS1gbjmNQhLiVkKDFBC/kgKS2QZONZNojYR73wIOTCryF7qoL/Ky0EzyPknBcq
	 x0WmdbwLqYZ3Qc142lYoT+haQHvOlCBGq/NowZ7+DxSUw5o/qXuSyI+2h4pN+SgQm3
	 NNmM4Mb0iDNAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/18] ASoC: rsnd: ssiu: Add RZ/G3E BUSIF support
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <20260525110230.4014435-11-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-11-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:47:40 +0000
Message-Id: <20260525114741.1E1DC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Out-of-bounds array access and undefined bit shifts due to unvalid=
ated device tree node count.
--

commit cd52ab06a4f096e9c70d4a69a4f934f03c3b0b19
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: ssiu: Add RZ/G3E BUSIF support

This commit adds support for the SSIU on the Renesas RZ/G3E SoC, which has a
different BUSIF layout compared to earlier generations. It also introduces
a capability flag to parametrize the BUSIF error-status loops, as the
RZ/G3E only has two pairs of error-status registers.

> diff --git a/sound/soc/renesas/rcar/ssiu.c b/sound/soc/renesas/rcar/ssiu.c
> index 2b922ead62d09..8d4ce9d35e9e7 100644
> --- a/sound/soc/renesas/rcar/ssiu.c
> +++ b/sound/soc/renesas/rcar/ssiu.c
[ ... ]
> @@ -559,6 +575,9 @@ int rsnd_ssiu_probe(struct rsnd_priv *priv)
>  		} else if (rsnd_is_gen4(priv)) {
>  			list	=3D gen4_id;
>  			nr	=3D ARRAY_SIZE(gen4_id);
> +		} else if (rsnd_is_rzg3e(priv)) {
> +			list	=3D rzg3e_id;
> +			nr	=3D ARRAY_SIZE(rzg3e_id);
>  		} else {
>  			dev_err(dev, "unknown SSIU\n");
>  			return -ENODEV;

[Severity: High]
This is a pre-existing issue, but can an excessive number of SSIU nodes
from the Device Tree cause out-of-bounds array accesses and undefined
bit shifts?

In rsnd_ssiu_probe(), priv->ssiu_nr is initialized to the total number of
SSIU nodes from the DT without validating against the maximum supported bus
interface index.

During initialization, ssiu->id_sub is computed as i - list[ssiu->id].
If the DT provides too many SSIU nodes (e.g., >=3D 33 for RZ/G3E), id_sub
will become 8 or greater.

This out-of-bounds id_sub value is later used in rsnd_ssiu_get_status() to
return &ssiu->busif_status[busif], which can lead to kernel memory corrupti=
on
when the caller dereferences and modifies it.

Additionally, rsnd_ssiu_start_gen2() uses busif as a shift amount via
1 << (busif * 4), which can result in undefined behavior when shifting a
32-bit integer by 32 or more.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525110230.4014=
435-1-john.madieu.xa@bp.renesas.com?part=3D10
