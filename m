Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F347F3D9
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 22:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792017709; cv=none; b=hR7VeRItttTHbF06jBAeI41GZ15P1k9/B4DGfrlCL8JOLwhcZeUaoSnOvBdir8qA6D0xEtDfnUWVQmzXUb0idPIdYXJDGhfDSbcRQg9jVizNCicTipdzq3ydvkbXkzwC8LCXaEeeJNbPEuHVNCv1fu39Jebtb4OQO854RcCdC8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792017709; c=relaxed/simple;
	bh=tgn9yxDHetTtq9yZxQM95I1bUp9ux0ljQYbQHj5Arcg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=HZ9/58lsTFgTUZORpn4IvCEvuVgAqetdx9PIp7pePJB+HPC8LX9tIO/CabrL0QVjS89Q8yB/JrA+fPUSC/tztZHHHizjMxJIew2O6P83dhhMMw1Ez9GCxxOQz+L+rJJTrUDuBI1LyR7a8jV8is44B1KxEu0UDmgZcVGKMflwVhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5bizdHR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5bizdHR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13B31F000C5;
	Wed, 14 Oct 2026 22:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792017707;
	bh=rS3zNDHiykXIFzGP7ZMaHXQCeXNCVxdYXxVNmzbdIYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i5bizdHR9O/tCljgibpzHO1ju8uRXcBvTYefb99TcoeD0MoPg4rrXv16nEttNoj2l
	 qund0Vo867FgjHKW824CjuJH/NEAMSP/FOO8I6j8YkVvzbdZSh4h4uWeo3sRGpZ/gK
	 CUQOnj58IS1W/0POzHO++sS9j8mkuT07YwRZCC4/5AqU4dvrdrUOlqCSBHNFtMMsXI
	 7MHlMD3QBmhHH5/jjcWNZRFLeVTG48ev8/XyIErHIhOg7sKilnSdoBkjWjW/uRg0V/
	 RGsctuYDnN83VGJ7o4VjpLLx57oPnnqybTHAU9h7Rq2fw5OEJXEDJBIRop/7aYp2rs
	 kIMmrEfmbUT+A==
Message-ID: <sashiko-outbox-171991@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v13 04/12] dpll: sit9531x: read DPLL types and
 pin properties from system firmware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ali Rouhi" <arouhi@sitime.com>
Cc: =?utf-8?b?ZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc=?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261013224131.27149-5-arouhi@sitime.com>
References: <20261013224131.27149-1-arouhi@sitime.com>
 <20261013224131.27149-5-arouhi@sitime.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 22:41:46 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dpll: state leak on error path for XO pin
--

commit 1b38c14d1669809a7ef952760c8da64d9afcc03c
Author: Oleg Zadorozhnyi <Oleg.Zadorozhnyi@devoxsoftware.com>

dpll: sit9531x: read DPLL types and pin properties from system firmware
   =20
The DPLL core wants a type per device and a property set per pin: a
label, the direction, the capabilities, and the frequencies the pin
supports. None of that can be read from the chip, so they come
from the firmware node.

> diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c
> new file mode 100644
> index 0000000000000..3635ea497e415
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/prop.c

[ ... ]

> +struct sit9531x_pin_props *
> +sit9531x_pin_props_get(struct sit9531x_dev *sitdev,
> +		       enum dpll_pin_direction dir, u8 index)
> +{

[ ... ]

> +	} else if (dir =3D=3D DPLL_PIN_DIRECTION_INPUT &&
> +		   index =3D=3D SIT9531X_MAX_INPUTS) {
> +		/* The XO reference is fixed: no state or priority control. */
> +		props->dpll_props.type =3D DPLL_PIN_TYPE_INT_OSCILLATOR;
> +		props->dpll_props.capabilities =3D 0;
> +		sitdev->ref[index].freq =3D sitdev->xtal_freq;

[Severity: Low]
Does this code leak state if an allocation fails later in the function?

The comment later in sit9531x_pin_props_get() explicitly states that the
allocation for ranges is the last thing that can fail, and a call that repo=
rts
failure must not leave the device's cached rate changed behind it.

However, if the allocation for ranges fails, the function returns -ENOMEM
and leaves sitdev->ref[index].freq permanently modified for the XO pin.

Should the update to sitdev->ref[index].freq be deferred to the end of the
function here as well, rather than doing it early in this block?

> +		curr_freq =3D sitdev->xtal_freq;
> +	} else if (dir =3D=3D DPLL_PIN_DIRECTION_INPUT) {

[ ... ]

> +	ranges =3D kcalloc(num_freqs + 2, sizeof(*ranges), GFP_KERNEL);
> +	if (!ranges) {
> +		rc =3D -ENOMEM;
> +		goto err_alloc_ranges;
> +	}
> +
> +	/*
> +	 * Publish the seeded rate only once the pin is certain to be built.
> +	 * The allocation above is the last thing that can fail, and a call
> +	 * that reports failure must not leave the device's cached rate
> +	 * changed behind it.
> +	 */
> +	if (curr_freq) {
> +		if (dir =3D=3D DPLL_PIN_DIRECTION_INPUT)
> +			sitdev->ref[index].freq =3D curr_freq;
> +		else
> +			sitdev->out[index].freq =3D curr_freq;
> +	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013224131.2714=
9-1-arouhi@sitime.com?part=3D4
