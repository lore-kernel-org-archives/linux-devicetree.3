Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8B33C5832
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274179; cv=none; b=OodDd1E71DNbuSEfVaZ1kdvSAqtNR5orVbbLvkc3QOUEVje7jQi1LlynUWn7VVNdVJHCT06qanTYjPxEF3niHYBs1QXrwyDFqruVPIuobMOjw8GWHqN5ngaJuGLGQnpQEFJyHEse+S58cCJ1hlW8DMZwPM9ew69DbMkjhmYl8YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274179; c=relaxed/simple;
	bh=GudehtnDAWIHH0MayO2diCCXUidl8oRxghXXvAfei0c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E5/3EeafLMjQk1xdOF4s506xO1wuuBnVzz2HR9wgITXiAUQMnqtL1t5TV2BCrTp8ma8FQOOg8KhFjsysMw3Dl2obvsG7m2lYhhjV6IRySQ9wFku1H66/i66kOUeamKNA0F0suoslCL5t5ZBdBIC8HnMP2L3KZ/AdXQx7koPiDW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dpCRmlHH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dpCRmlHH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A431F000E9;
	Tue,  1 Sep 2026 14:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788274177;
	bh=cX5A5A77/t9PTXwnAVfhrN09Nudp7A2UeDjnXNrLKBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dpCRmlHHW+NeEP1WZOHsRcnS6nbMYb10MXMhdxDlbW95OAfraHNHZ2vn1HOVZyyn6
	 5OzgAnknxh7T8xDHkE3mAlf58GBZW5KvX9oPSkSD0dymBnqtAqdXo+Ql4aX1ORDa4T
	 g3lhUb2jJ0pJkKfsu6CMWUWtkUyqr1MHriYZOFOQzlm7Niu+eMy8lcijoj3xXTX2c2
	 8IaXJ+xkoLv6obWWuOq1RQdJVv+aMBZpl3ytfIPCwKbHh7B3QB8vDQz7UgXNr1UQ4y
	 TyhzMilDhaTHo85PjPA02x8GzmXlbubJymptd73shJMuHON1nPmY8JwOuj/rjwhgpX
	 +6q7GaIez3Q4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] iio: imu: inv_icm42607: Add accelerometer
 calibbias support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260901-b4-inv_icm42370p-v3-7-77cc31642115@axis.com>
References: <20260901-b4-inv_icm42370p-v3-0-77cc31642115@axis.com>
 <20260901-b4-inv_icm42370p-v3-7-77cc31642115@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 14:49:37 +0000
Message-Id: <20260901144937.98A431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Exposed sysfs attribute 'in_accel_calibbias_available' always re=
turns -EINVAL because read_avail lacks the CALIBBIAS case.
--

commit aeb9058f622a7efa1cb2fe93f6364aaec05fb334
Author: Kanak Shilledar <kanak.shilledar@axis.com>

iio: imu: inv_icm42607: Add accelerometer calibbias support

Expose IIO_CHAN_INFO_CALIBBIAS on the accelerometer channels. The
registers are stored in MREG1, which can be accessed by the mreg_read
and mreg_write routines. The calibration bias is written to OFFSET_USER4
to OFFSET_USER8 registers in MREG1.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/=
iio/imu/inv_icm42607/inv_icm42607_accel.c
> index 318373efeb9e9..af2ac9d6a47c8 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c

[ ... ]

> @@ -22,9 +23,11 @@
>  	.type =3D IIO_ACCEL,							\
>  	.modified =3D 1,								\
>  	.channel2 =3D _modifier,							\
> -	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW),				\
> +	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |				\
> +		BIT(IIO_CHAN_INFO_CALIBBIAS),					\
>  	.info_mask_shared_by_type =3D BIT(IIO_CHAN_INFO_SCALE),			\
> -	.info_mask_shared_by_type_available =3D BIT(IIO_CHAN_INFO_SCALE),		\
> +	.info_mask_shared_by_type_available =3D BIT(IIO_CHAN_INFO_SCALE) |	\
> +		BIT(IIO_CHAN_INFO_CALIBBIAS),					\

[Severity: Medium]
Will reading the in_accel_calibbias_available sysfs attribute fail with
-EINVAL?

Since IIO_CHAN_INFO_CALIBBIAS was added to the _available mask here, does
inv_icm42607_accel_read_avail() also need a new case to handle it?

Right now, it appears to fall through to the default error case:

inv_icm42607_accel_read_avail() {
	switch (mask) {
	case IIO_CHAN_INFO_SCALE:
		...
	case IIO_CHAN_INFO_SAMP_FREQ:
		...
	default:
		return -EINVAL;
	}
}

>  	.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_SAMP_FREQ),		\
>  	.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_SAMP_FREQ),	\
>  	.scan_index =3D _index,							\

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901-b4-inv_icm=
42370p-v3-0-77cc31642115@axis.com?part=3D7
