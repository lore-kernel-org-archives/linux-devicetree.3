Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE5934887E
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 11:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779709994; cv=none; b=ceon9DSoYvPi6TuVW8BKEdZ/zGmwXE8x39zTYra4H4ItR06Y18KeJynYQIDG+PLseVRyOzNMWvhtMQSaAvJBJ1WlWg/PTSmvwT7WwBQszUOXFWc02WgfFRnsZlpMbBcPjkVnXUmgf0zO+XF+m3k04CMh5QEIGI+O55CpDBoKsCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779709994; c=relaxed/simple;
	bh=TFpHBK7Ap1RApDy2OLSxq/40oO9dcfcVOjmYkqiO33Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uG2h5V3OVeKmfMnZifw3FmXX5o5b8Nm/jT3RJIfozUcq7h+UTwV27iX998XfWnclzRU2/gMmofePhiUw3kUDz4ZeXCFs0sJAFUp/xl7xz/8TX4FiGOdqGyzZuSfBdHKss3jwnaYpWNU/Cn7sUuZpyJBlpzp3/rEFaQkOrbp586o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ApWGJ9bq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ApWGJ9bq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF931F000E9;
	Mon, 25 May 2026 11:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779709993;
	bh=mWvznx7l9H3iJo2BaTeyUswIZ9aOdQdjOXbRH7zVKTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ApWGJ9bqkOROicxWo3fNHMMSpO3qD6+ie1gkqQJlM65mplfduxrll0rbYTFi/eJ6y
	 BxJEJFHiKsd0m6sZzRy33XpsDXE6UxTR/8Kz+1wOKJaJHmaqr3brlBXkizicGCcrXm
	 Q1/RP8LP2snMyRQUhL6cgiItlo1JUCr76A+bKAjRqEw24Qgviwx14rQ35sgGVv4Eb/
	 KvDP77QfAyVVyt1HjubHNSqX8BMJbohJacTdqwfLEWR2or63GOXC7F4/XHA0lvp6gx
	 Fkrg+qM8NsDkJbBngQYwWEhgPmruAliIuy1qwTJeBsVvrMlEg8S1UKQXU4ggF0MmhN
	 CbdXh6v6ohRNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 14/18] ASoC: rsnd: adg: Look up RZ/G3E clkin under
 audio-clk{a,b,c,i}
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org
In-Reply-To: <20260525110230.4014435-15-john.madieu.xa@bp.renesas.com>
References: <20260525110230.4014435-15-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 11:53:12 +0000
Message-Id: <20260525115313.4EF931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Error handling in `rsnd_adg_null_clk_clean` blindly dereferences a=
n `ERR_PTR`, leading to a guaranteed kernel panic on deferred probe.
--

commit cc9d8467b86b1274ca6e7e69addd9762d7c23073
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: adg: Look up RZ/G3E clkin under audio-clk{a,b,c,i}

This patch updates the R-Car Sound ADG block driver to support the RZ/G3E
sound binding. It introduces a new array mapping the master clock inputs
to their DT naming conventions. The driver is also modified to dispatch to
this new table when the RZ/G3E SoC is detected.

> diff --git a/sound/soc/renesas/rcar/adg.c b/sound/soc/renesas/rcar/adg.c
> index 5dce62287d200..483979c243198 100644
> --- a/sound/soc/renesas/rcar/adg.c
> +++ b/sound/soc/renesas/rcar/adg.c

[ ... ]

> @@ -574,6 +581,9 @@ static int rsnd_adg_get_clkin(struct rsnd_priv *priv)
>  	if (rsnd_is_gen4(priv)) {
>  		clkin_name =3D clkin_name_gen4;
>  		clkin_size =3D ARRAY_SIZE(clkin_name_gen4);
> +	} else if (rsnd_is_rzg3e(priv)) {
> +		clkin_name =3D clkin_name_rzg3e;
> +		clkin_size =3D ARRAY_SIZE(clkin_name_rzg3e);
>  	}
> =20
>  	/*

[Severity: High]
This is a pre-existing issue, but does this addition make the error handling
more likely to trigger a boot crash?

If clk_register_fixed_rate() fails, it returns an ERR_PTR which is cached in
adg->null_clk. The cleanup function rsnd_adg_null_clk_clean() checks
if (adg->null_clk) (which evaluates to true for an ERR_PTR like -EEXIST or
-ENOMEM) and blindly passes it to clk_unregister_fixed_rate().

Inside the clock framework, __clk_get_hw() dereferences the invalid pointer,
causing an immediate kernel panic.

This reliably crashes the system on deferred probe: if rsnd_probe() returns=
 an
error after rsnd_adg_probe() successfully registers the rsnd_adg_null clock,
the driver aborts without calling rsnd_adg_remove().

This leaks the registered clock. On the next deferred probe attempt,
clk_register_fixed_rate() fails with -EEXIST (returning ERR_PTR(-EEXIST)).
The driver then jumps to the error path, passes this ERR_PTR to
clk_unregister_fixed_rate(), and panics.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525110230.4014=
435-1-john.madieu.xa@bp.renesas.com?part=3D14
