Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40C63B8BD9
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080791; cv=none; b=dNWBj3VhOEztjDIo2yfSyWID5r9kEa6JbIO9R5mRiREHGhOsk4L8OsBHhu2reh3obJsZU18wy1enkVTo24Es0n6y270u/QGEHJp+DWudKyPp84fsdDmKvyO6PNhpAV8ni0fO0WX3a1QnT/CVqGjsVGbgKnXCVPd2JjuTQbLIn4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080791; c=relaxed/simple;
	bh=1kypIbzYikRS1PcVZXrMdZ5fEhC65nKtiV09YWXbJg0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JCAjyp9sRQb97HHpQY1g7m8/qV7aHqi/CaqE669ZifwwMUQaIMEUBwFtjps4YleJfy+1wg2fmgtgQTPmxbHny5QMRWHyawTtomXH8ozpRztFF9gKcucTsxYINt+9ue9rOH9C2W0gHzdSnhE+JvSbszFokDcRmvzBJDMxvanljAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cOvr/0QJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cOvr/0QJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E261F000C4;
	Thu, 15 Oct 2026 16:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080777;
	bh=ByUZ7uAbnoE6nCgX+yn6v2arJ0VrHEmiJx0y463hju4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cOvr/0QJ4HiWZfsNLCWLy7E1HsozUPqm2Me8qHUGcDxUPD4C/oVt4EfWctTagfAtY
	 8EtBGfBkQmRjUHhRZvwfqdMVkgfvfS7TQmoPoo03EOcgGTVMadyMAm+C0wXYoUQtTK
	 tqHdKif7YCJiaaGuNswzkdIEP1IPHsM8X/gxbCdDt/50jnif++nBSRXlbG6g9ahPPn
	 u8QXd5jYKkVGqFwzInt2jOTZad/N3T9YNYJVRt920CfqAF5aU5bPiXM/mfVJtc0kvC
	 4pPKOqe6rwoztdaKUoDNNDWyPH96oO6SsCPjCg/DNC7QdttIr7uDB77acuLDN6lCnf
	 7WDYxcpXpKmhg==
Message-ID: <sashiko-outbox-173148@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/16] media: sony-starvis2: Allow runtime control of
 link frequency
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261015-media-starvis2-v4-6-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-6-75fcdb4163f3@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:12:56 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] media: starvis2: silent failure and incorrect error logging in cont=
rol init
--

commit bfdfb01dd0fac7ba017bb4064e707d4ac2033da4
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: sony-starvis2: Allow runtime control of link frequency

This commit links V4L2_CID_LINK_FREQ to runtime controls, allowing the
link frequency to be configured while the sensor isn't streaming. It updates
starvis2_init_controls to handle the new link_freq allocations and refactors
the error handling path.

> diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-s=
tarvis2.c
> --- a/drivers/media/i2c/sony-starvis2.c
> +++ b/drivers/media/i2c/sony-starvis2.c
> @@ -1224,25 +1250,26 @@ static int starvis2_init_controls(struct starvis2=
 *starvis2)
[ ... ]
> -	/* LINK_FREQ is also read only */
> -	link_freq =3D v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
> -					   V4L2_CID_LINK_FREQ,
> -					   ARRAY_SIZE(link_freqs) - 1,
> -					   __ffs(starvis2->link_freq_bitmap),
> -					   link_freqs);
> -
> -	if (link_freq)
> -		link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
> +	starvis2->link_freq =3D
> +		v4l2_ctrl_new_int_menu(ctrl_hdlr, &starvis2_ctrl_ops,
> +				       V4L2_CID_LINK_FREQ,
> +				       __fls(starvis2->link_freq_bitmap),
> +				       __ffs(starvis2->link_freq_bitmap),
> +				       link_freqs);
> +	if (!starvis2->link_freq)
> +		goto err_free_handler;

[Severity: Low]
Does this bypass the error logging block? If v4l2_ctrl_new_int_menu() fails
to allocate the link_freq control, jumping directly to err_free_handler
results in a silent failure instead of printing a control init failure mess=
age.

> +
> +	v4l2_ctrl_modify_range(starvis2->link_freq,
> +			       __ffs(starvis2->link_freq_bitmap),
> +			       __fls(starvis2->link_freq_bitmap),
> +			       ~(starvis2->link_freq_bitmap),
> +			       __ffs(starvis2->link_freq_bitmap));
[ ... ]
> @@ -1285,16 +1316,20 @@ static int starvis2_init_controls(struct starvis2=
 *starvis2)
>  	v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &starvis2_ctrl_ops, &props);
> =20
>  	if (ctrl_hdlr->error) {
> -		ret =3D ctrl_hdlr->error;
>  		dev_err(&client->dev, "%s control init failed (%d)\n",
>  			__func__, ret);

[Severity: Low]
Does this print the unupdated ret variable (which is 0) rather than the
actual error code? The assignment ret =3D ctrl_hdlr->error was removed from
before the dev_err call and moved to the err_free_handler label at the end
of the function, leaving ret as 0 during this print.

> -		v4l2_ctrl_handler_free(ctrl_hdlr);
> -		return ret;
> +		goto err_free_handler;
>  	}
> =20
>  	starvis2->sd.ctrl_handler =3D ctrl_hdlr;
> =20
>  	return 0;
> +
> +err_free_handler:
> +	ret =3D ctrl_hdlr->error;
> +	v4l2_ctrl_handler_free(ctrl_hdlr);
> +
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-media-star=
vis2-v4-0-75fcdb4163f3@raspberrypi.com?part=3D6
