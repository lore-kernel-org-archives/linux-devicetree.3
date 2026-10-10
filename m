Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0CF2236FA
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791657130; cv=none; b=u/cjp4SVy23C0kBW0mGZcbOi4Bg0y8ky2/CgfpPi+XRnmvqcvyUH1P1hW8FEQmTyAJj5Gmg4WZ3ZN8k6e01X4zUn4wcPDKZ53BJODGrzfTZntTlO84zGu4AVAYA9IiZYkbVUOs4nA5dACPLnJDfh+t+ib4yV6sXZv+M1dkip3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791657130; c=relaxed/simple;
	bh=fxN8m1MHi8lLa/sRwkW4GXporvB45igtIfdsiGZGLPQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cesfytW9atT5ADcFaZJ4WdNgAls7i+9y6acKPGxxv/Wh7gk03k5VjDA/BQNcYCA5saqLGLo92ULB+2J89CVC5eIda6gx0HzGqFo0jKEwJW8xaFDaqwhZMd3kGk4mBvxPQ2Wvt4YLgGpxlrBTzy0I/pXkUTQK08iayxMPuc5PY+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lL+iSxpU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lL+iSxpU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15BEC1F00893;
	Sat, 10 Oct 2026 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791657129;
	bh=vFwNyNi1p/UIobCuCjTtNdGNjNJazxfdcmhgQY0Ug0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lL+iSxpUry36Dh89PgBkg2KsVrWu8W6L1MZ4aETPx+oYBGqWD5ysb4t4KdK/0TjBS
	 TUFMc7OPi+YxIZcP4n7MxRDsTQd/Dpike+Rj1hKYfitea4UyJ5W4J8U5WmpSZOoa6b
	 wRCM12n7V9F8ZR9fBMTl3+1cKKRjcjtLyFdQ0L+1J1VgO3yjVZg23ssOcej3PYcsHN
	 +Cu4YahD2ZirVjqlXC5FnNMqSbEnB7L4vIy+2YTZtwZxF44JtonWrOYUJhKTsda7Or
	 7iysIs8a7BtAPxAYM4wrTiY6kGFkMx+I+1QalsxvtAm2WDsR6NmHRRC6oVDubtSgwB
	 BdcmdjTbrmbQg==
Message-ID: <sashiko-outbox-166807@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v12 05/12] dpll: sit9531x: register DPLL
 devices and pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261009183151.78497-6-arouhi@sitime.com>
References: <20261009183151.78497-1-arouhi@sitime.com>
 <20261009183151.78497-6-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 18:32:08 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] locking: Missing multiop_lock in sit9531x_dev_state_fetch() violati=
ng function contracts
- [Low] build: Use of undefined kzalloc_obj macro causes compilation failure
--

commit 07998476897b60ae6e981144b634fb6008fd348c
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: register DPLL devices and pins

This commit registers each of the four on-chip PLLs as a DPLL device and
exposes their respective input and output clocks as DPLL pins. It adds
initialization for the device hardware state, pin ops mapping, and a
periodic kthread worker to poll hardware status and notify the core of
changes.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
>  static int sit9531x_dev_state_fetch(struct sit9531x_dev *sitdev)
>  {
[ ... ]
>  	/*
>  	 * The priority-table read walks the Page-1 registers, so it runs
>  	 * with multiop_lock held like every other multi-register sequence.
>  	 * Nothing can race with it here -- the DPLLs are not registered and
>  	 * the monitor is not running yet -- but the page handling stays
>  	 * serialized the same way as at runtime.
>  	 */
>  	mutex_lock(&sitdev->multiop_lock);
>  	rc =3D sit9531x_ref_pll_mask_fetch(sitdev);
>  	mutex_unlock(&sitdev->multiop_lock);
>  	if (rc) {
>  		dev_err(sitdev->dev,
>  			"Failed to fetch input priority tables: %d\n", rc);
>  		return rc;
>  	}
> =20
>  	for (i =3D 0; i < sitdev->info->num_outputs; i++) {
>  		rc =3D sit9531x_out_state_fetch(sitdev, i);

[Severity: Low]
Does this code violate the internal locking contract?

The function sit9531x_out_state_fetch() calls sit9531x_output_mode_fetch(),
which documents that the caller must hold sitdev->multiop_lock because it
accesses multiple paged registers. While this is called during probe when
concurrent threads might not be active yet, the lock is explicitly dropped
just before this loop.

>  		if (rc) {
>  			dev_err(sitdev->dev,
>  				"Failed to fetch output %u state: %d\n", i, rc);
>  			return rc;
>  		}
>  	}
> =20
>  	for (i =3D 0; i < SIT9531X_NUM_PLLS; i++) {
>  		rc =3D sit9531x_chan_state_fetch(sitdev, i);

[Severity: Low]
Can this lead to paged register desynchronization?

Similarly, sit9531x_chan_state_fetch() calls sit9531x_prio_table_read(),
which also requires multiop_lock to serialize page accesses. Dropping the
lock before these state fetches breaks the driver's documented concurrency
model for register pages.

>  		if (rc) {
>  			dev_err(sitdev->dev,
>  				"Failed to fetch PLL%c state: %d\n",
>  				'A' + i, rc);
>  			return rc;
>  		}
>  	}
> =20
>  	return 0;
>  }
[ ... ]
>  static struct sit9531x_dpll_pin *
>  sit9531x_dpll_pin_alloc(struct sit9531x_dpll *sitdpll,
>  			enum dpll_pin_direction dir, u8 id)
>  {
>  	struct sit9531x_dpll_pin *pin;
> =20
>  	pin =3D kzalloc_obj(*pin, GFP_KERNEL);

[Severity: Low]
Will this compile successfully?

The kzalloc_obj macro used here receives two arguments. However,
kzalloc_obj is not a standard kernel macro (the standard is kzalloc), and
where it is used internally in the DPLL core, it only takes a single
argument. This looks like a syntax error that will fail to build. Should
this use kzalloc() instead?

>  	if (!pin)
>  		return ERR_PTR(-ENOMEM);
> =20
>  	pin->dpll =3D sitdpll;
>  	pin->dir =3D dir;
>  	pin->id =3D id;
> =20
>  	return pin;
>  }
[ ... ]
>  struct sit9531x_dpll *sit9531x_dpll_alloc(struct sit9531x_dev *sitdev, u=
8 ch)
>  {
>  	struct sit9531x_dpll *sitdpll;
> =20
>  	sitdpll =3D kzalloc_obj(*sitdpll, GFP_KERNEL);

[Severity: Low]
The same compilation issue with kzalloc_obj() appears here.

>  	if (!sitdpll)
>  		return ERR_PTR(-ENOMEM);
> =20
>  	sitdpll->dev =3D sitdev;
>  	sitdpll->id =3D ch;
>  	sitdpll->lock_status =3D DPLL_LOCK_STATUS_UNLOCKED;
>  	sitdpll->lock_status_error =3D DPLL_LOCK_STATUS_ERROR_NONE;
>  	INIT_LIST_HEAD(&sitdpll->pins);
> =20
>  	return sitdpll;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009183151.7849=
7-1-arouhi@sitime.com?part=3D5
