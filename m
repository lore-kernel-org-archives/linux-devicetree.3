Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37A747426E
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 16:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791218588; cv=none; b=Wjg1cI0mCPlaaf2AWRhoxdnmlw4yuc0DWF1fd/Im1t/TzMG0daNFuTDIBZbetx52YurB+NFaYMkgqi+BjoYycb5mJbnDXrFPPoj92wqoHwyvfv92jDL+aLPywGn7oLJ+Qz52AHR47/kxBSaGIGZkfURu03/eOG3OCnGbx1je/2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791218588; c=relaxed/simple;
	bh=aRIa6yl/Gl3OZpBHn3EWlnl5zrSTdgFJKdXfSdKoG7g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FXsZVfxHtUmcVHOLM9mBjCpRc3uoXDI764lsbW5QxBWATY+ImnsdeqOu2KXK3h0NX6VZM9o+MrOD5zTY713uAHQFGcBGJEZXRUc6fvggfULQLPcp5pYPR+5tZ0HyYwVeHIUdEUghGQXkgMmkNflrAdGTlz8hh1iMTKyS2v6ep0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jvty1VPZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jvty1VPZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BDF21F000FF;
	Mon,  5 Oct 2026 16:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791218586;
	bh=XdcgA+88H+PlwD4vnTKsN2tk5CYwMRN46tMEfuJYBJ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jvty1VPZwnms9aClElwSmfQ9am1fg0LS7rn2lfrSZqrz4RYVWVbmsfQWXDps+coNg
	 FKAcPJW9uVsgoLp4RpRwATGapD6rgnj9X6yO6S34iT8O1naDBYlGUt6BQjE4+b9sH6
	 estS+BgHY1Vm5+3NrnsIWP525RiOcwv7crSXFhBj0qAEj9F0dj+5jxLuVc/QpcKVkg
	 RszmCk8PPNJ4aJXwwVl+9egeXPsV/qoJOlWDT00ywAT4MJgsL7NpfMO33mVIp7Kpx8
	 L4LOLy9+HHIfbhoHPwWvJowVx26J0wCTN6Fh0AaIMPhuEdU2IW+U7cFt2ssVR47Ffo
	 0Wb7nXKLb+i+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 3/7] net: pse-pd: unwind allocations when
 controller registration fails
Reply-To: sashiko-reviews@lists.linux.dev
To: "Carlo Szelinsky" <github@szelinsky.de>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261004164219.1161294-4-github@szelinsky.de>
References: <20261004164219.1161294-1-github@szelinsky.de>
 <20261004164219.1161294-4-github@szelinsky.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 16:43:05 +0000
Message-Id: <20261005164306.0BDF21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: pse-pd: TOCTOU race and NULL pointer dereference via unguarde=
d pcdev->pi[i].pw_d assignment
--

commit 8c5741051355bc530c2efc50d6e4e9ebe8e283f3
Author: Carlo Szelinsky <github@szelinsky.de>

net: pse-pd: unwind allocations when controller registration fails

This commit unwinds allocations when pse_controller_register() fails. It
updates the error paths to properly free the notification kfifo, flush
the power domains, and clear the power domain pointers to NULL to avoid
dangling references.

> diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
> --- a/drivers/net/pse-pd/pse_core.c
> +++ b/drivers/net/pse-pd/pse_core.c
> @@ -937,11 +937,21 @@ static void pse_flush_pw_ds(struct pse_controller_d=
ev *pcdev)
>  			continue;
> =20
>  		pw_d =3D xa_load(&pse_pw_d_map, pcdev->pi[i].pw_d->id);
> -		if (!pw_d)
> +		if (!pw_d) {
> +			pcdev->pi[i].pw_d =3D NULL;
>  			continue;
> +		}
> =20
>  		kref_put_mutex(&pw_d->refcnt, __pse_pw_d_release,
>  			       &pse_pw_d_mutex);
> +		/* The pw_d is devm memory of whichever controller created
> +		 * it, so it can go away as soon as that probe unwinds.
> +		 * Nothing may be left pointing at it: pse_pi_is_enabled()
> +		 * reaches pi[].pw_d from the regulator "state" attribute,
> +		 * which stays readable until the PI regulators are
> +		 * unregistered after us.
> +		 */
> +		pcdev->pi[i].pw_d =3D NULL;

[Severity: High]
Does setting pcdev->pi[i].pw_d to NULL here without holding pcdev->lock
introduce a race condition with concurrent sysfs accesses?

Since the PI regulators are registered via devm_pse_pi_regulator_register()
and accessible via sysfs before pse_flush_pw_ds() is called in the error
path, a concurrent read of the regulator attributes could invoke regulator
operations like pse_pi_is_enabled(). These operations take pcdev->lock and
can call into pse_pi_allocate_pw_budget().

In pse_pi_allocate_pw_budget(), pi->pw_d is evaluated twice without READ_ON=
CE:

    if (!pi->pw_d)
        return 0;

    /* PSE_BUDGET_EVAL_STRAT_STATIC */
    if (pi->pw_d->budget_eval_strategy =3D=3D PSE_BUDGET_EVAL_STRAT_STATIC)

If pcdev->pi[i].pw_d is set to NULL concurrently between the null check and
the dereference, could this cause a TOCTOU NULL pointer dereference?

>  	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004164219.1161=
294-1-github@szelinsky.de?part=3D3
