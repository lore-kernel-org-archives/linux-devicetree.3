Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8961B47D463
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 15:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788277182; cv=none; b=hDfPDiDLZTd2n/kHHa8fbIstGcqkCvZP44fYdPl5glXWc8sQDHXgj3qPzya0ZopJBk+hCln+KU+/RRzI6DSIqeHwJfNo8Pc6cS2vs5wvpQTTLGnw1dO+5AVpONVSdQ0V/EXW6DCsUxJ+vvZSNRXyl0uia6kcZWlPPZWuwqy0BmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788277182; c=relaxed/simple;
	bh=eSQMj8l9lHbTGGxH9FrliSSUM0wNO8+AJA+nUySkaqU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p6jlodCvXD17o/fuTlRQ/NnNjUmHOw8RUDfcnY3eWV2/ozjAOR5dMq61nqeMcLc+VNlj0iceAaHdo5uEusaNtrnQ7UCDidtqsp0cMbfsuRt/NxItyEx5cXK4WhgB3rNRZ+TBiGz2xxYtbzc3MpyYagMdRL4jt9v/zmgGsDzqIa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HWl7Ryyi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HWl7Ryyi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DE01F01558;
	Tue,  1 Sep 2026 15:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788277181;
	bh=j3EzufAkApHhJ8GM+sEe6nisVHEQ7TSrHhdvr3uiclM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HWl7RyyiavaZWpIm1PKZw0HjdnUJGTf+YcFqh2GX+8xIt8mvpcDZu+5Mqjw/721ag
	 PvbLw5XljLMak28Yo1wdoP6ZrSKrf1SyKvyBYjeIz8Vfk2krAkAr1byBrNIcpMCv29
	 yDLaYeRPReFI4oeIfVD/EHRma0/kSd81c/IcVTYrllK9apLC2UTUJPDhY1P+xnOL2Q
	 CsMN1x0uOvP5lxdtNQ9jGqlNDBjksYdbTjCLWorcsg1YTkg5jhdF0ynLQTzcQj2LuS
	 hRMXxar0KUsjxZUw+KvE+YMqE64GHOEr+/rhxU/RDn3+OPb/0zJ63Plzc8caRSOaUM
	 DDMXymgbMPZpw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] nvmem: rockchip-otp: Serialize reads
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net>
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
 <20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:39:40 +0000
Message-Id: <20260901153940.C6DE01F01558@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mixing goto-based error handling with scope-based guard() cleanu=
p in the same function.
--

commit 279787a491898a378d6e600f26ecd6fbd75f2d26
Author: Alexey Charkov <alchark@flipper.net>

nvmem: rockchip-otp: Serialize reads

The OTP controller is driven through a single set of registers holding a
state machine which has to be stepped through for every word read, yet
nothing keeps two readers out of each other's way. Concurrent reads
interleave, and the outcome is either a reader bailing out or, worse, one
of them silently taking delivery of the other's data.

Guard the read path with a mutex.

> diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
> index 2c0feb036f3fd..b034b7455016a 100644
> --- a/drivers/nvmem/rockchip-otp.c
> +++ b/drivers/nvmem/rockchip-otp.c
[ ... ]
> @@ -272,6 +275,8 @@ static int rockchip_otp_read(void *context, unsigned =
int offset,
>  	if (!otp->data || !otp->data->reg_read)
>  		return -EINVAL;
> =20
> +	guard(mutex)(&otp->mutex);
> +

[Severity: Medium]
Does adding this guard() mix scope-based cleanup with the goto-based
error handling further down in rockchip_otp_read()?

The kernel cleanup guidelines in include/linux/cleanup.h state that usage
of goto and cleanup helpers should never be mixed in the same function.

Since rockchip_otp_read() still contains a goto err path:

		buf =3D kzalloc(array_size(count, word_size), GFP_KERNEL);
		if (!buf) {
			ret =3D -ENOMEM;
			goto err;
		}

and a manual cleanup label:

err:
	clk_bulk_disable_unprepare(otp->data->num_clks, otp->clks);

could the clock cleanup be converted to use scope-based cleanup as well,
or should a plain mutex_lock and mutex_unlock be used instead of guard()
to avoid mixing cleanup styles?

>  	ret =3D clk_bulk_prepare_enable(otp->data->num_clks, otp->clks);
>  	if (ret < 0) {
>  		dev_err(otp->dev, "failed to prepare/enable clks\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-rk3576-otp=
-cpuid-mac-v1-0-ea9135270fc2@flipper.net?part=3D1
