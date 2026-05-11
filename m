Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D155538331E
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538423; cv=none; b=hstTJ56C7J52/pVrQprz3b/kz3dLsqTHf5aFM1DT30Cq7k9PJ8EkC++/vsWNWyKy5Ndl7dYR2K6wytSb4IDtjbnuSH5BiQZ9wr6sdH+kzs34MkuxrMcS7wZsEsgoHOXpFjshmfYTE1n8zJ08re/1/dlxaXdgeVsepWakmUmAQd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538423; c=relaxed/simple;
	bh=Rlk4tIX6m6yhy4WXjSYoFXe0A8/S+sQRdMD+oNg8YQs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N2aMj4D3jD3oLLE6ZPG7jsTxod8RWRtnLyoWxPN7w9zU2Ik0YXFhI8ZFrXDBDkujUcEZD0MMr5PLSLUM/gsOjGyvJ7Dqsn7kADtzNDPJT7E2ZmBdgUtuRJXgJ1ZfXHbSz+zN8WGAK9sJBj+FmIYa8DmyL2qwHH/0yEV3nO+CajE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bqJ/m0Ku; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bqJ/m0Ku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FDCEC2BCB0;
	Mon, 11 May 2026 22:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778538423;
	bh=Rlk4tIX6m6yhy4WXjSYoFXe0A8/S+sQRdMD+oNg8YQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bqJ/m0KuPrlABSMSfJYPGZ6XkWMaBOrv+c3nFDDxypMQAfpXWdYAHe7TrxNNSTfTI
	 PRdrbOlu2uD0WvFv/Grf7ykWM+GSeh+K7yk1Ky/g/+bIv8U5O7MGKo9uw+UL2933wd
	 BsbcjwMFJTNLW6/Wr/3UTmOJ+O/7JKziXxfUSis35gfg5+JCu7W23KkyPCHYESzcAj
	 GfBRWZ0eJ6QQCDDIMO7nsl8eFuwoDZx6OSGrKIrC8pgw6XYhRaP7YUEof9ny74kuFF
	 ihWpha6d14we91A2W4CGjLmISd789YjvQ9Ck6nnYUSn8PrLf7ykI1Fwp2Zljzn5EHm
	 T+RuFYNO5D4Ow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/11] iio: adc: hx711: introduce hx711_chip_info
 structure
Reply-To: sashiko@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260510194947.31997-7-piyushpatle228@gmail.com>
References: <20260510194947.31997-7-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:27:02 +0000
Message-Id: <20260511222703.4FDCEC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Probe unconditionally fails for legacy platform device instantiati=
on, breaking backwards compatibility.
--

commit df7c142f973e9e00df00559065a303371d262619
Author: Piyush Patle <piyushpatle228@gmail.com>

iio: adc: hx711: introduce hx711_chip_info structure

This commit introduces a per-variant static configuration structure to
populate IIO device fields at probe time. This prepares the driver for
supporting additional hardware variants while intending to keep existing
functionality unchanged.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index 2da128c1caf36..913e1a50529ad 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c
[ ... ]
> @@ -473,6 +498,12 @@ static int hx711_probe(struct platform_device *pdev)
> =20
>  	mutex_init(&hx711_data->lock);
> =20
> +	chip_info =3D device_get_match_data(dev);
> +	if (!chip_info)
> +		return dev_err_probe(dev, -ENODEV, "missing driver data\n");

For legacy platform devices instantiated without a firmware node like Device
Tree or ACPI, device_get_match_data() returns NULL.

Will this unconditional error return cause the probe to fail for those lega=
cy
users?

Since the commit message notes there are no functional changes for existing
users, should this fallback to the default hx711_chip structure when
chip_info is NULL?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510194947.3199=
7-1-piyushpatle228@gmail.com?part=3D6
