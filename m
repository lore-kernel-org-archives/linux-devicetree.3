Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2423B47F5
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 06:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786949544; cv=none; b=fVGZvqsuC23pEluUb7ZTfNjZkR380FyCkvD7qkYvQWhE3yxBmZuVgYYpxB58oa3gFRCHndranMjRwz/mFInHUZn0WmvQgll8J1DX3iCvHRIpHFRB+lvFT0lH43lWpfouOSDGvoMDbB4Riacv8xu/jtldOWk8tEJLTyQzGwWceQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786949544; c=relaxed/simple;
	bh=vTO+rfEkptSzfLsJPDMQ05aHVau17M8ROGf3dvgsAgw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=k9biP0HljLDEdCLmJs/xIiq8r4pGRj+8r3pkYHaaLyG6ZWqEEZkepulL/7cbvQHt4COo4xtXxJhPRJoYQIhqMz2WRD3Bf/aKmEWoD7cEQYsln0rulFqosoNX9b01lBSZPocI751BgPBu/qC56hrX69QLwEEgIrNtLIkikwwsVv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N6zNprCU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N6zNprCU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA3E1F000E9;
	Mon, 17 Aug 2026 06:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786949542;
	bh=Wid784yFdgt2CRw+qSv/cgrHQgZBY8yySLLeFIb+vLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N6zNprCU7zDyIQfypo0WMjMmILBkBFUFSG+2Sb/JPKO1ipxE7ykKw1FLskR3MAmDS
	 vnyCQ3pqU9D+heMNlGRGml4RqwdSDvxGlCjCatDrLJRul0RR/iaGVKTFK54O5ZEuvu
	 HLvLpInqWtPcDY26tZXvBViG5oUx7iWToUK05nIgveShJTThJakSQmHDpfGU49A4RT
	 ugmInnxFUAug9NOWkO2QqZyaA0ukIQZTUTOu1KdpR0Qh9rzQi/ZYjg8wnL0NFR4Son
	 KQkA9D2xUj+RS7JCAAYkt1f9Iivv6dqNeDzOF0hxsbjZ7MczhZuPj+Al+Xz60er5gi
	 Ut1F5SKSmkN7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] iio: dac: ad3530r: add support for
 AD5710R/AD5711R
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kim Seer Paller" <kimseer.paller@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260817-iio-ad5710r-upstream-v3-4-3a4bf7b9c78b@analog.com>
References: <20260817-iio-ad5710r-upstream-v3-0-3a4bf7b9c78b@analog.com>
 <20260817-iio-ad5710r-upstream-v3-4-3a4bf7b9c78b@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 06:52:22 +0000
Message-Id: <20260817065222.9EA3E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Read-only `powerdown_mode` enum is exposed as writable in sysfs, re=
turning -EINVAL on write.
--

--- Patch [4]: [PATCH v3 4/4] iio: dac: ad3530r: add support for AD5710R/AD=
5711R ---
commit 4d59cde2891949f47bb58dbf8c77908db02a7285
Author: Kim Seer Paller <kimseer.paller@analog.com>

iio: dac: ad3530r: add support for AD5710R/AD5711R

Adds support for the AD5710R/AD5711R 8-channel configurable IDAC/VDAC parts.
Each channel is configured as voltage or current output from its DT node,
with the powerdown mode derived from the channel's configured type.

> diff --git a/drivers/iio/dac/ad3530r.c b/drivers/iio/dac/ad3530r.c
> --- a/drivers/iio/dac/ad3530r.c
> +++ b/drivers/iio/dac/ad3530r.c
[ ... ]
> @@ -419,6 +511,17 @@ static const struct iio_chan_spec_ext_info ad3532r_e=
xt_info[] =3D {
>  	{ }
>  };
> =20
> +static const struct iio_chan_spec_ext_info ad5710r_ext_info[] =3D {
> +	{
> +		.name =3D "powerdown",
> +		.shared =3D IIO_SEPARATE,
> +		.read =3D ad5710r_get_dac_powerdown,
> +		.write =3D ad5710r_set_dac_powerdown,
> +	},
> +	IIO_ENUM("powerdown_mode", IIO_SEPARATE, &ad5710r_powerdown_mode_enum),

[Severity: Low]
The commit message mentions that the powerdown mode is read-only. Does using
the IIO_ENUM macro here inadvertently make the sysfs attribute writable?

The IIO_ENUM macro automatically populates both the .read and .write
callbacks (iio_enum_read and iio_enum_write). Since
ad5710r_powerdown_mode_enum lacks a .set callback, any writes from userspace
will safely fail and return -EINVAL.

Should this be manually defined as an iio_chan_spec_ext_info struct without
a .write callback to ensure the sysfs attribute is correctly exposed as
read-only?

> +	{ }
> +};
> +
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817-iio-ad5710=
r-upstream-v3-0-3a4bf7b9c78b@analog.com?part=3D4
