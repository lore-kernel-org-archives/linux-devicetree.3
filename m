Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56214CDA36
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017709; cv=none; b=iQOjEQJjjEPdIOmKvJdLav+FUDBAkOskrJ9jW1dbO6MJHHf0XUSq2kT5nlpv2YVdZyzEnKbG/18MsHir5P4Y1urhVGlk8FxcXBMgZ6fzO/LuHJ8nKjugvfdH5Ftv0XaaTjA+kmMfSxrhX7fEdKyKrVNJbGqiQEFlbu5oQFs4RrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017709; c=relaxed/simple;
	bh=DSMmvoDhvs8V4voOqDtRHqYT5O5L5OzB4c9QtLyZbFk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Mt6uRdYuwBgd1ofMgdVepTxJpSuNGile5PGB25Sy7GL9uD8MpsPcrYHI9JvNa+UpsTBCZI8ff618tVqkDBk9MXd6OHikdzKacLCZgg4uwGf5+0o+dDv5jJIAnU2mWlby4j1BSjCQ0yJWN/FiJw0uL7MubQit9chGfpqnLTbm5uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DsTUfB9d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DsTUfB9d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0056E1F000C4;
	Wed, 14 Oct 2026 22:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792017706;
	bh=6rbKSMCHeKYIGjV9zvk+EzfxpAmqST6Dlt+aMcpZ6PA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DsTUfB9dXagl/dwMkcE3YmayWORrMn7S0EACshPFAMqh/JO+eCjBptNqF0pc3Bpit
	 cYwFszbm7/KZeOj5YpYo9w0ge2XuZSqCAYCtIDw2pT1SvG9nKmSGm276fATOYMAp7X
	 RnG9HzgpEw3b8S5wlz3E4DcYZFuj5Glbbm6fB/R4rQoeQyz8pYRQHUNBLf+zozGZj8
	 Tkzy0tZBU4vRS7S+VPUGGf51E1/phmREXHCg4Z9DSr2oy7S4BSt85y7BN7nUY9rS+L
	 UgeK84JmXLVLFJywepKZ7HYuhUAosjQQkzgL3ByGZvReUMCHlHLPEc1+Ny0wJilR9x
	 yMkbtsfF2+qGA==
Message-ID: <sashiko-outbox-171990@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 05/12] dpll: sit9531x: register DPLL
 devices and pins
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013224131.27149-6-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-6-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 22:41:45 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] build: undefined macro kzalloc_obj causes compilation failure
- [Low] locking: sit9531x_chan_state_fetch called without required multiop_=
lock
--

commit 5f5cba1ccd97d6786f10dd67578b1b35e4e746e8
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>
Subject: dpll: sit9531x: register DPLL devices and pins

This commit registers SiT9531x PLLs as DPLL devices and exposes their inputs
and outputs as DPLL pins. It implements device and pin structures, initial
hardware state fetching, and periodic polling for state changes.

> diff --git a/drivers/dpll/sit9531x/core.c b/drivers/dpll/sit9531x/core.c
> --- a/drivers/dpll/sit9531x/core.c
> +++ b/drivers/dpll/sit9531x/core.c
[ ... ]
> @@ -934,22 +934,17 @@
>  	for (i =3D 0; i < sitdev->info->num_outputs; i++) {
>  		/*
>  		 * Nothing runs concurrently before registration, but the
>  		 * output fetch walks paged registers under the same contract
>  		 * as at runtime, so it holds the lock the same way.
>  		 */
>  		mutex_lock(&sitdev->multiop_lock);
>  		rc =3D sit9531x_out_state_fetch(sitdev, i);
>  		mutex_unlock(&sitdev->multiop_lock);
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
sit9531x_chan_state_fetch() explicitly invokes sit9531x_prio_table_read(),
which is documented as requiring the caller to hold sitdev->multiop_lock
to protect paged I2C register accesses.

Is it intentional to omit the lock acquisition here? The adjacent loops in
this initialization sequence acquire the lock before calling the state
fetchers.

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
> @@ -1338,15 +1338,15 @@
>  static struct sit9531x_dpll_pin *
>  sit9531x_dpll_pin_alloc(struct sit9531x_dpll *sitdpll,
>  			enum dpll_pin_direction dir, u8 id)
>  {
>  	struct sit9531x_dpll_pin *pin;
> =20
>  	pin =3D kzalloc_obj(*pin, GFP_KERNEL);

[Severity: Low]
Is kzalloc_obj defined somewhere in the tree?

It does not appear to exist in the standard kernel API, which will result
in a build failure during compilation. Should this be replaced with
kzalloc(sizeof(*pin), GFP_KERNEL)?

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
> @@ -1593,16 +1593,16 @@
>  struct sit9531x_dpll *sit9531x_dpll_alloc(struct sit9531x_dev *sitdev, u=
8 ch)
>  {
>  	struct sit9531x_dpll *sitdpll;
> =20
>  	sitdpll =3D kzalloc_obj(*sitdpll, GFP_KERNEL);

[Severity: Low]
Similarly here, the undefined kzalloc_obj macro is used. Can this be updated
to kzalloc(sizeof(*sitdpll), GFP_KERNEL) to avoid compilation failures?

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
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013224131.2714=
9-1-arouhi@sitime.com?part=3D5
