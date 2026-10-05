Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CF947125A
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791207814; cv=none; b=cjpsOsJ6O8FlUV9X/ZWsGRCmtnZOjN7/B6RU8JChvrxs5N38CFfNBdSE5k2lTntXaRPKbp/xSEdbmbrP6iHazbCXDFGC1CUKxZ9YA/UFmj8AkqpXj38R2Wtku+RPZxXTi0Fl9BL08+NUhVCSixi044R7vRccAidJU3Na/mFZlWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791207814; c=relaxed/simple;
	bh=eitsfC+mm9nDvmbCWD53UEhX8ajZxRkZpZLwY0tsE/k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YrMkRwcvrIw7uwg8hzDSk0vyr2pT8DHHZsEzCE/+Qaxr0M8tka7po8ZmpbCZvvOXPtcZltTrijbXmgZuM2g0ED+7yGpFoOj9n0XYBVTxj2uFt1+wL7QQPHE9n9CBmKa8U+Q86FQJWLy7PskV9pfol/GtmhjFSlDqGmiIlXyTdN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eu354+2V; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eu354+2V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B1361F000FF;
	Mon,  5 Oct 2026 13:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791207812;
	bh=wf8V7qANZs0BSaLHOWzlE9GUwvX5EMq+8hbYYJD/iII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eu354+2V5OmNQa3rPp14s3TuV8wXyWxgh5eU7TN7vvxgjylS5N9x5uXf3BKHR2i3g
	 Wb1fTofwMckcdipdnH6CuTrxSZNOT5LEhQ8C3etz0okXjoQBq7zzhx788VfqvOQ/JK
	 GeOPADwIqY0PO3lHa/jojoTCmmln+7/Rmw4r6CkXAotne5datiPGNgWOPRG1MIpGOD
	 +oj+/fI5KB20DAFYZPxLmB/vI+CHAxXavfx6v1Z6ZtnOWWgdFJpDhGYxXDs8dKdhDs
	 qyiMfxa1z/ulngksnfV4Z417iAeoqf81z4egow93y6rmfJVC7QnLdqS4EHhVdhdkhp
	 7AEA645XJGYXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/10] media: synopsys: hdmirx: free the driver data
 when the last user is gone
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sascha Hauer" <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261005-hdmirx-media-v3-1-71a11a2e3e76@pengutronix.de>
References: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
 <20261005-hdmirx-media-v3-1-71a11a2e3e76@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 13:43:31 +0000
Message-Id: <20261005134331.8B1361F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: hdmirx: Use-After-Free of resets array during devres cleanup
--

commit e1b26e1980a2a31fc0b4801e98e60468eba4a502
Author: Sascha Hauer <s.hauer@pengutronix.de>

media: synopsys: hdmirx: free the driver data when the last user is gone

The driver data is allocated with devm_kzalloc() and contains the
video_device, the vb2 queue and the control handler. devres frees it when
the device is unbound, but an open file descriptor on the video device
node keeps the video_device referenced beyond that point.

> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drive=
rs/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index 25f8ca0d6d946..bc541431638e7 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
[ ... ]
> @@ -2646,6 +2642,16 @@ static int hdmirx_register_cec(struct snps_hdmirx_=
dev *hdmirx_dev,
>  	return 0;
>  }
> =20
> +/* Runs when the last user of a device node is gone, possibly after remo=
ve() */
> +static void hdmirx_v4l2_release(struct v4l2_device *v4l2_dev)
> +{
> +	struct snps_hdmirx_dev *hdmirx_dev =3D
> +		container_of(v4l2_dev, struct snps_hdmirx_dev, v4l2_dev);
> +
> +	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
> +	kfree(hdmirx_dev);
        ^^^^

[Severity: High]
hdmirx_parse_dt() calls devm_reset_control_bulk_get_exclusive(), which
registers a devres action that stores the pointer to the inline array
hdmirx_dev->resets.=20

When the last v4l2 user is gone, this kfree(hdmirx_dev) frees the driver
data structure synchronously. The driver core will later invoke
devres_release_all(), which calls devm_reset_control_bulk_release(). That
release function will attempt to iterate and put the resets using the
stored pointer, which now points into the already freed hdmirx_dev.

Does this code cause a use-after-free during devres cleanup?

> +}
> +
>  static int hdmirx_probe(struct platform_device *pdev)
>  {
>  	struct snps_hdmirx_dev *hdmirx_dev;
[ ... ]
> @@ -2771,10 +2780,16 @@ static int hdmirx_probe(struct platform_device *p=
dev)
>  	vb2_video_unregister_device(&hdmirx_dev->stream.vdev);
>  err_unreg_v4l2_dev:
>  	v4l2_device_unregister(&hdmirx_dev->v4l2_dev);
> -err_hdl:
> -	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
> +	hdmirx_disable(dev);
> +	v4l2_device_put(&hdmirx_dev->v4l2_dev);
> +
> +	return ret;
> +
>  err_pm:
>  	hdmirx_disable(dev);
> +	v4l2_ctrl_handler_free(&hdmirx_dev->hdl);
> +err_free:
> +	kfree(hdmirx_dev);
        ^^^^

[Severity: High]
If probe fails after hdmirx_parse_dt() has successfully called
devm_reset_control_bulk_get_exclusive(), hdmirx_dev is explicitly freed
here. Once probe returns, the driver core will run devres cleanup.

Does this error path result in the same use-after-free when accessing
hdmirx_dev->resets?

> =20
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-hdmirx-med=
ia-v3-0-71a11a2e3e76@pengutronix.de?part=3D1
