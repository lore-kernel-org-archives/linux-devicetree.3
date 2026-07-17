Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929363783C7
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314939; cv=none; b=ZUZk5coTrybPA8Yc0dJqn2qDiqlqjJtbfNc17X/zuhp3ta09cie+foTdV8qWmPYRc9+ri4uoqD8hksHTMrri4AZR++2elNZC2v/qfO59g5Jux155iqDAVW0gRovrXXzzk638TEf+qrntfHvBpABnZDhxouM6X7tphkmFQwLlRzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314939; c=relaxed/simple;
	bh=D4blmni2HZMgU+qb/jtv62ldlc7GB9nfplGNlVe6hLM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PpYaPpLNqvqUgWCoOkglnAj8AE1EH6H8R5VTcELXGcHA2zAgp0fXLP8iTx3z7AJ12NERjThaUwBgNyJ4PEXqEwfieKH5asv5lk23pnj147HBgYi4+OeePbEC1O9w1VgM2XuAUE1IGpUTkGQPzDdJqHEqafttiH7jPAnfMrT4BeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIRRXZg8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIRRXZg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACF31F000E9;
	Fri, 17 Jul 2026 19:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784314937;
	bh=Z1w89mUuZPLsV/r/ixQXBI1CexuyzgTc0X50pAS4bLU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GIRRXZg8/yyRRdDT9br6b1liVywcKEkLw7tfggupcyPDh4Sj2GDkzc/BMRJ08Twrh
	 2lvvrKDYw0y/tuL4vAUEbeNtNGboCI2rAbXm7ZTF22Q6L4DGo5ywicaD3zJRciWYQ0
	 U8ArsWnTK08W/w4kr+4ADK76/VnyfAxdTmz0lDKFGfG+7NLnuRaSn8dEjDsFEuhaor
	 85oLT9gAPmGpRrJ1WVkfyZFzDR/Uy+NrYpa0r6lIg3L6t9DSMfI+0gpSSod0H5rb65
	 AJDkJbZWarWi04nhdSbqWgHN5PbnT8S/zu02q1O4Z0C8jd4sAWuxLtZFnkg/5Q1Rzp
	 Yu9ZQyh/lWQ1g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/3] iio: adc: ti-ads1100: Add ti-ads1110 support to
  ti-ads1100 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260717185033.246580-4-jakubszczudlo40@gmail.com>
References: <20260717185033.246580-1-jakubszczudlo40@gmail.com>
 <20260717185033.246580-4-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:02:16 +0000
Message-Id: <20260717190216.EACF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] I2C read failures during the data-ready polling loop are mishandle=
d, causing a 7.5-second blocking spin-loop, driver stall, and excessive log=
 spam.
- [Medium] The polling wait interval was incorrectly increased to 5 full co=
nversion periods, injecting severe latency on every configuration change.
--

--- Patch [3]: [PATCH v8 3/3] iio: adc: ti-ads1100: Add ti-ads1110 support =
to  ti-ads1100 driver ---
commit 5c24a653a5a6dc7cd0b451448a77f86bfdf06445
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>

iio: adc: ti-ads1100: Add ti-ads1110 support to ti-ads1100 driver

Add ADS1110 support that have faster datarate than ADS1100, it also uses
internal voltage reference of 2.048V for measurement.

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 363f790ca5d5e..19533667e6cd8 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
> @@ -139,14 +177,16 @@ static int ads1100_new_data_is_ready(struct ads1100=
_data *data)
>  		return ret;
>  	}
> =20
> -	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]) ? 0 : 1;
> +	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
>  }
> =20
>  static int ads1100_poll_data_ready(struct ads1100_data *data)
>  {
> -	int data_rate_Hz =3D ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data-=
>config)];
> +	int data_rate_index =3D FIELD_GET(ADS1100_DR_MASK, data->config);
> +	int data_rate_Hz =3D data->chip_info->available_data_rate_hz[data_rate_=
index];
>  	/* To be sure we wait 5 times more than data rate */
> -	unsigned long wait_time_us =3D DIV_ROUND_CLOSEST(USEC_PER_SEC, 2 * data=
_rate_Hz);
> +	unsigned long period_us =3D DIV_ROUND_CLOSEST(USEC_PER_SEC, data_rate_H=
z);
> +	unsigned long wait_time_us =3D 5UL * period_us;

[Severity: Medium]
Does this introduce a severe delay during configuration changes?

The previous code waited for half of a conversion period. For example, at 8=
Hz,
that would be ~62.5ms.

By changing this to 5 full conversion periods, the initial sleep inside
readx_poll_timeout() will block for over 600ms every time the data rate or
scale is updated.

>  	int data_ready;
>  	u8 buffer[3];
>  	int ret;
> @@ -159,7 +199,7 @@ static int ads1100_poll_data_ready(struct ads1100_dat=
a *data)
>  	}
> =20
>  	ret =3D readx_poll_timeout(ads1100_new_data_is_ready, data,
> -				 data_ready, data_ready !=3D 0,
> +				 data_ready, data_ready =3D=3D 0,

[Severity: High]
Will this loop forever on I2C errors?

If i2c_master_recv() fails inside ads1100_new_data_is_ready(), it returns a
negative error code. Since data_ready =3D=3D 0 evaluates to false for negat=
ive
values, the polling loop won't exit on failure.

This could cause the driver to hang for the entire 7.5-second timeout,
repeatedly reading and spamming the log with error messages.

Should the condition be data_ready <=3D 0 instead?

>  				 wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);
>  	if (data_ready < 0)
>  		return data_ready;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185033.2465=
80-1-jakubszczudlo40@gmail.com?part=3D3
