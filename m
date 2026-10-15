Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3405452A0
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 16:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080948; cv=none; b=KDOks9jCwK9M6nhjg1wQJ8AdylBIcRWH1mAR0VzNlikSA3rg137oNygFc4QvDKJgqmgsnkPe8ZzYGuyrUwUCJZTart+4PEmj5wDQ5pf5BNdDOfWDQ3kX9kdIDufJbGNOhsAF7rmAKAlQkVc2rYlaVJ/oE58d27iUAWfWzbRcWt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080948; c=relaxed/simple;
	bh=MTY6vRZ5lA6ZbiKO7Ivj6wDK2ryMk4jmuffEEcCb5RE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=Y5AZUwwRja9SuAPWfS4dhXzb4S55QOayh1Utkqg30PhxNCYm3bai1M3T1vc8DchpObbqwvgtKFjo2nIi3IPDSWV3rRy4pu3mTRbePf0w3D+XHIE2tzgAMKDM2zSglD2ei4+uwTMTQDXgtyZqZHyXCKgQICle5N+8c+Ajr1LeF1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIzZ2Z4U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIzZ2Z4U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11EE71F000C8;
	Thu, 15 Oct 2026 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080930;
	bh=nVb/Fbo8YKq5HjXG43FvTIxtnCpyvsE6weCMv7tykBg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nIzZ2Z4UAYSM+2tXfngnplLit7jNrjH7ga+5DQi+w6AWa/tDDWb8fUZq5DkEI8+kA
	 mlzijozmMhg95SyYs6h+Mx1UUgOKDemiXx5ikoSuSdYZ9P0heoVcNWvBqsAavR5uGD
	 6+g3En3OdIwR7eGTc4Tk6c1zqytkqAtRSxWhCdXST3LvlRsreXct7mSE6ANBrx0/rM
	 40/buhF2WmIPzlS4ApUfErLtpApVNVhkU8IuUy2KYc0JuWHThJW7HwZOCYIeY3Gcrc
	 TeQTCO5HiTRnkfPCwpsbw022cKnOqOAajyWPYy5BuIuHVRc3TcT4mS6ogSUvnghzEp
	 6KoQnavu5v3xA==
Message-ID: <sashiko-outbox-173156@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/16] media: imx678: Rework into generic Starvis 2
 sensor driver.
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261015-media-starvis2-v4-1-75fcdb4163f3@raspberrypi.com>
References: <20261015-media-starvis2-v4-0-75fcdb4163f3@raspberrypi.com>
 <20261015-media-starvis2-v4-1-75fcdb4163f3@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:15:29 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] media: dead code in starvis2_enable_streams() due to unconditional =
power-on writes
- [Low] media: starvis2_write_common() unconditionally sets success flag on=
 I2C failure
--

commit 6500c5ca0127e3e5085414806a5f7d7e712bdaa6
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: imx678: Rework into generic Starvis 2 sensor driver.

The register layout and programming model for multiple of the
Sony Starvis2 sensors is identical, so prepare for supporting
those by renaming all common parts of the driver to a starvis2_
prefix, and renaming the driver.

> diff --git a/drivers/media/i2c/imx678.c b/drivers/media/i2c/sony-starvis2=
.c
> similarity index 56%
> rename from drivers/media/i2c/imx678.c
> rename to drivers/media/i2c/sony-starvis2.c
> --- a/drivers/media/i2c/imx678.c
> +++ b/drivers/media/i2c/sony-starvis2.c

[ ... ]

> @@ -894,50 +903,55 @@ static int imx678_init_state(struct v4l2_subdev *sd,
>  	return 0;
>  }
> =20
> -static int imx678_write_common(struct imx678 *imx678)
> +static int starvis2_write_common(struct starvis2 *starvis2)
>  {
>  	int ret =3D 0;
> =20
> -	cci_multi_reg_write(imx678->cci, common_regs, ARRAY_SIZE(common_regs),
> +	cci_multi_reg_write(starvis2->cci, common_regs, ARRAY_SIZE(common_regs),
>  			    &ret);
> =20
[ ... ]
> +	cci_write(starvis2->cci, STARVIS2_REG_INTERFACE_SEL,
> +		  STARVIS2_INTERFACE_2L_4L, &ret);
> +
> +	starvis2->common_regs_written =3D true;
> +

[Severity: Low]
Does starvis2_write_common() set the success flag even if the I2C writes fa=
il?

cci_multi_reg_write() and cci_write() accumulate errors into ret. However,
this flag is unconditionally set to true before returning, which would fals=
ely
indicate that the registers were successfully written even on an error.

>  	return ret;
>  }
> =20

[ ... ]

> @@ -945,25 +959,34 @@ static int imx678_enable_streams(struct v4l2_subdev=
 *sd,
>  	if (ret < 0)
>  		return ret;
> =20
> +	if (!starvis2->common_regs_written) {

[Severity: Low]
Is this block unreachable dead code?

starvis2_enable_streams() begins by calling pm_runtime_resume_and_get(),
which triggers the runtime PM resume callback starvis2_power_on().=20
starvis2_power_on() unconditionally calls starvis2_write_common(),
which sets the starvis2->common_regs_written flag to true.

Therefore, when execution reaches this check, the flag will always be true,
making the body of this statement impossible to execute. Was the intention
to remove the register writes from starvis2_power_on() and defer them to
stream start?

> +		ret =3D starvis2_write_common(starvis2);
> +		if (ret) {
> +			dev_err(&client->dev, "%s failed to write common registers\n",
> +				__func__);
> +			goto err_rpm_put;
> +		}
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-media-star=
vis2-v4-0-75fcdb4163f3@raspberrypi.com?part=3D1
