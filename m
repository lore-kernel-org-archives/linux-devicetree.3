Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433913597B
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 00:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778717241; cv=none; b=uZ2BL/5UYX7KC74NIYngms5HSN56lwfVyaEpCFeOse4haYd2dkApPRgev2k3elTxFZnY6qyKvFf6UogtkHowP9fXglXi20r+kkTFW4qH7ifGqF4BsutuumpZbIgDF1siNSy9bmiWWPk5mLG8Mc9PVF6GPnQRKmbcEbq5depWXdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778717241; c=relaxed/simple;
	bh=OoSBfy62F8MWIcpy0k2BSx/6Yfw/ydStDGzCEwAf2vQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZTcj6nwyawquDnzVk3bSDEIXvUzQHtsTZRS8kjDYVKB8quqKuqRIFmgS9Ich1miTRaG+eXOqZOnyqyud3zSpIzmA11ZUySQ0LEkQ/DgR6e4G5shn/sYTN2MlWEP7ENE2hlpcrmy5iU9qLqY900AaZW1+n0QrgCbg6K2XHxrx4ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hIAv/Irk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hIAv/Irk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EE14C19425;
	Thu, 14 May 2026 00:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778717240;
	bh=OoSBfy62F8MWIcpy0k2BSx/6Yfw/ydStDGzCEwAf2vQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hIAv/IrkZlcBNiJVhsS6TLfK9mMIySWmETJs5SONWqSwbabLkElrRcoOn1SCQ5q7N
	 y3eJ2yihtv7bNxiSzCmsNfCvF9t0lTFDtOZycFP81IwbfKcVP9KKCCzgjbwhYdWQtN
	 JZFaRTd6t3tGcDHZ2o3PRmPOwe61LNzX9/g4S1ypYIJDmp3dhbpEBgE6vodSg7DR0+
	 2A4EzhDlLR+pXs6ARMy0U3v7yDLBKSGFPw0QKueYLj/Br/8Q2Pyro7tohbNmMnXO1Y
	 lwe+XpDBRpwcE9xYxJyafI7LH5D5iLJQmCL5jBJLbMB6IV9nNPPEicCJvN+IbxdieR
	 TcmWEjSjCaMVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/16] ASoC: rsnd: Add reset controller support to
 rsnd_mod
Reply-To: sashiko-reviews@lists.linux.dev
To: "John Madieu" <john.madieu.xa@bp.renesas.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260512182631.3842065-4-john.madieu.xa@bp.renesas.com>
References: <20260512182631.3842065-4-john.madieu.xa@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:07:20 +0000
Message-Id: <20260514000720.8EE14C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect hardware teardown sequence in `rsnd_mod_quit()`.
- [Low] Unused `<linux/delay.h>` header inclusion.
--

commit 15ebc4bc5eee087115d0971e0b8a5f59090c9c82
Author: John Madieu <john.madieu.xa@bp.renesas.com>

ASoC: rsnd: Add reset controller support to rsnd_mod

This commit adds reset controller support to the Renesas sound (rsnd) modul=
e.
It updates rsnd_mod_init to accept a reset control parameter, deasserts it
during initialization, and mirrors this with an assert in rsnd_mod_quit.

> diff --git a/sound/soc/renesas/rcar/core.c b/sound/soc/renesas/rcar/core.c
> index 2dc078358612d..c3c139a6fc60a 100644
> --- a/sound/soc/renesas/rcar/core.c
> +++ b/sound/soc/renesas/rcar/core.c
> @@ -90,6 +90,7 @@
>   *
>   */
> =20
> +#include <linux/delay.h>

This isn't a bug, but is the inclusion of linux/delay.h necessary?

I don't see any delay functions used in the updated code. Was a hardware
stabilization delay intended after the reset_control_deassert() call, or
can this inclusion be safely removed?

[ ... ]
> @@ -217,6 +229,8 @@ void rsnd_mod_quit(struct rsnd_mod *mod)
>  {
>  	clk_unprepare(mod->clk);
>  	mod->clk =3D NULL;
> +	reset_control_assert(mod->rstc);

Does the hardware require the clock to be running to latch the reset state
change?

In rsnd_mod_init(), the initialization sequence enables the clock before
deasserting the reset. This suggests the IP block needs an active clock
to propagate the reset.

However, in rsnd_mod_quit(), clk_unprepare() is called before
reset_control_assert(). Since the clock is unprepared and not enabled
when the reset is asserted, can the hardware fail to latch the reset state,
or potentially hang the bus when the reset controller accesses a
powered-down domain?

Should the teardown sequence mirror the initialization by temporarily
enabling the clock, asserting the reset, and then disabling and
unpreparing the clock?

Also, a later patch in the series (ASoC: rsnd: Add system suspend/resume
support) appears to introduce rsnd_suspend_clk_reset() which repeats this
exact sequence of an unprepared clock followed by reset assertion.

> +	mod->rstc =3D NULL;
>  }
> =20
>  void rsnd_mod_interrupt(struct rsnd_mod *mod,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512182631.3842=
065-1-john.madieu.xa@bp.renesas.com?part=3D3
