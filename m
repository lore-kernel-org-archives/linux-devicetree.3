Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABC63F7899
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 12:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179338; cv=none; b=nxFmthzU2hcH4SYx8tb0f7iuK0kYK3AX4xk1Fd//aawH2uCAEJ7c7KTA+njvtprs8K7jsqZ3f7lz/NTXEwxvLzuVP33rQ0zrPtVjJ/ypc2x17id4e1HiojNPkZRzBsTMH9c+2Xa17K2R8H8u4kLuKn56/otP6ljzZ9Ja0h+1WkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179338; c=relaxed/simple;
	bh=nZBfX/6cCW1asWMs0KwQ3+SsLW4N1vyepTnga5Ed1sM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ik5tAP/iGUDC7X/PQUELYRMWpihfZH9MDLv3NpJwldHH0xVjFNlg8Igm2G4uu5Fae00gOJiq1Q4TItQPFQPh041x4gXBAn9TjOLpxkN05oOJArarpsPq2AaIIIcpvpUy7wwC7yO/AIToS+pTFvd5wgwT8Dd6Qr3gjx0NRxXXfvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cn0gZhPL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cn0gZhPL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5821F00A3E;
	Mon, 31 Aug 2026 12:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788179336;
	bh=Bp5YI6AOGyNbPlGV3HHArg9aOUL1uAd3oL9wVAykFfA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Cn0gZhPLT5CjnLXAzrV+Z45MWDZ6dtw88R4KFF0M7zOUxAyVxnzLM3kUJQN7igcBl
	 9OfW4gpKNH6cmdOVjDtx2KHWEydchA0U//cwJccr9U+efzFHBUcN0Y70Ge7odZ4KYj
	 O2dxoJHxTq2JGAaGi/6EphMYcvax+sBBUQTW1g29lAuXRbNzvmY3k3GEchxDdbljeS
	 3/ZrrG41EWg1H82FpbmmIX3QmGoa5NQrzZ8livaDZx+YQld0/BaSuPkXN7ZWJW4LGz
	 gIEI/pT1tBoDzyuefK9jDoRvgCWqbtzOr4niCDN4XwjH87gQxKHOXKCUNggc6eF/lN
	 gTusHXkqGYZpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 8/8] iio: accel: mma8452: Use proper error code when
 missing device model
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260831-mma8452-open-drain-v7-8-22946812c928@geanix.com>
References: <20260831-mma8452-open-drain-v7-0-22946812c928@geanix.com>
 <20260831-mma8452-open-drain-v7-8-22946812c928@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:28:56 +0000
Message-Id: <20260831122856.BC5821F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing memory leak of iio_trigger in mma8452_probe error pat=
hs.
--

commit 19ad2f8e418619267dc62918b9e4fe522127cae2
Author: Esben Haabendal <esben@geanix.com>

iio: accel: mma8452: Use proper error code when missing device model
   =20
Switch -ENODEV error on i2c_get_match_data() failure to -ENODATA to
satisfy the IIO coding style.

> diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
> index 9619b200fa5a9..9eaced6bf2429 100644
> --- a/drivers/iio/accel/mma8452.c
> +++ b/drivers/iio/accel/mma8452.c
> @@ -1597,7 +1597,7 @@ static int mma8452_probe(struct i2c_client *client)
> =20
>  	data->chip_info =3D i2c_get_match_data(client);
>  	if (!data->chip_info)
> -		return dev_err_probe(dev, -ENODEV, "unknown device model\n");
> +		return dev_err_probe(dev, -ENODATA, "unknown device model\n");
> =20
>  	ret =3D iio_read_mount_matrix(dev, &data->orientation);
>  	if (ret)

[Severity: High]
This isn't a bug introduced by this patch, but there is a pre-existing=20
issue in the error handling of mma8452_probe further down in this function.

When mma8452_trigger_setup is called during probe, it elevates the trigger
reference count:

drivers/iio/accel/mma8452.c:mma8452_trigger_setup() {
    ...
    indio_dev->trig =3D iio_trigger_get(trig);
    ...
}

If a subsequent setup step fails, such as mma8452_set_interrupt_pin_mode,
the code jumps to the cleanup label:

drivers/iio/accel/mma8452.c:mma8452_probe() {
    ...
    ret =3D mma8452_set_interrupt_pin_mode(data);
    if (ret)
        goto trigger_cleanup;
    ...
}

The error path leaps directly to the final mma8452_trigger_cleanup. Because=
=20
the triggered buffer mode flag is not yet set at the time of failure, the=20
IIO core omits bridging cleanup logic and skips the iio_trigger_put call.

Does this result in permanently leaking the trigger device memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-mma8452-op=
en-drain-v7-0-22946812c928@geanix.com?part=3D8
