Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E75235A938
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778728936; cv=none; b=IItcQMuIb0Ct+NPKAeDfDWguXVLkXbLIy++Hr6jcyChsY4uaCHeZiysvO7F3X4JmgSEm3X/5LF5d3Lcm5BMpwmuj5ZNCa7lCpW3cgezou/uSvTA7o7zCwVOHTi4CP76xIneOZXT2FobTPlWMbVc8Vo7xN/QnU3ak9HU7170QQ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778728936; c=relaxed/simple;
	bh=tfGDCxcem+Z/HUsNeUaJDzOdL93k262ZymEzbrqPZUw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G3K6JAY8XawgZTteeoZCa3azWXpEyIHdZz7P6nb6YCM99rSNttHeKqAQyVhqOX48NYqheNU4m2LPkUm/NNl2kz7YG9Y1xoNrsL2On9rgbJ+mDfG5Fd3jYA6u5kWZNp4i3qD3j7lfvcCjcLKEHXCNsMV+3zJ8NAFo/qWPALDq1XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CApR1b3M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CApR1b3M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A3ACC19425;
	Thu, 14 May 2026 03:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778728935;
	bh=tfGDCxcem+Z/HUsNeUaJDzOdL93k262ZymEzbrqPZUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=CApR1b3MT2moUQcQaq0KMk2zIhg5lkjGJgkrnu8al1STVmCqD8x0v5mnMqP5cH2ag
	 xWjgZj7mQlg9jHs+14owX7q6ja2pyimazIg/9RkUU4lNkDD9vllaLVquyppa7xpADJ
	 vkfAabsaYyEunsAUMSXR286RHZ0xrsuftpC2yEgSaILuYnEgXDl2jlZlVe0EbfLhv8
	 +MgmAm3ZDGeHBI0Nk6lmOkOFgxYPg7IBDOAaMQpbtuHCbLxTQEeg3VvMateqpZG8uZ
	 3+I2miyXZrRCtbnZFAjX3TVtAo/Kjm67FGu7DxvjgmMNI5f5FvxvFxcRlgmOhQgqbW
	 188L81/XZGKsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 10/16] ASoC: rsnd: Add SSI reset support for RZ/G3E
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260512182631.3842065-11-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-11-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 03:22:14 +0000
Message-Id: <20260514032215.5A3ACC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The commit message claims that `rsnd_ssi_use_busif()` is modified =
to always return 1 for the RZ/G3E platform to prevent PIO mode, but this im=
plementation is entirely missing from the patch.
--

commit 9fb40a1158dd3311ef34bf2a0294ba24c8a07ed6
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: Add SSI reset support for RZ/G3E platform

This commit adds SSI reset support for the Renesas RZ/G3E SoC, using
per-SSI reset lines. It also mentions updating the driver to consistently
select the BUSIF DMA path.

> To support these differences, rsnd_ssi_use_busif() always returns 1
> on RZ/G3E, ensuring that the driver consistently selects the BUSIF
> DMA path.

Is the modification to rsnd_ssi_use_busif() missing from this patch?

The commit message states that the function is updated to always return 1
for the RZ/G3E platform, but the diff does not contain any changes to
rsnd_ssi_use_busif().

> diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
> index cf98cc9ee44c3..e6734671328c8 100644
> --- a/sound/soc/renesas/rcar/ssi.c
> +++ b/sound/soc/renesas/rcar/ssi.c

[ ... ]

> @@ -1220,7 +1232,7 @@ int rsnd_ssi_probe(struct rsnd_priv *priv)
>  			ops =3D &rsnd_ssi_dma_ops;
> =20
>  		ret =3D rsnd_mod_init(priv, rsnd_mod_get(ssi), ops, clk,
> -				    NULL, RSND_MOD_SSI, i);
> +				    rstc, RSND_MOD_SSI, i);

Without the rsnd_ssi_use_busif() enforcement, the driver could still select
PIO mode if the pio-transfer property is set in the Device Tree, or if DMA
allocation fails and triggers rsnd_ssi_fallback().

Since RZ/G3E does not implement the SSITDR and SSIRDR registers used in PIO
mode, does this regression risk causing a bus fault when accessing those
unimplemented registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512182631.3842=
065-1-john.madieu.xa@bp.renesas.com?part=3D10
