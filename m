Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606B53BC687
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 19:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788983543; cv=none; b=ZSMElrzXkrF/Y/aRRfvt7GH8hpwUfLdrOolX/2Ef5uqT3lLxO+ZUzCSV4BnbF1ozzCKZjedMlZ34k7BFMxnztf8C8Wh+CCYWnmWj5tcDQNaWpqmQTdHw8zw9v3oU4P05mtc6qf/Pou6CHl7Zy1WoWKlbJpyK0w4BqUOpLMJaunE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788983543; c=relaxed/simple;
	bh=jbjdF9v3rb2/fUqt6TFBRYG8DllWv4fFDzJHSeBHbrQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jB3OkFR+J9iPZ2mPsBdzU7AWEh9gcbv3xNCrJQKLbQxMCpZUuHPiJJypVbupDq5IJOCSUAm5+b0rbDDNhrQJtPouBAzXRt+Tnxn55dIOPZWKRBt29PQzBNjWtX2EPg6EDJFIswjD9NK9FC/RlzSt3mttEpio8hlqBndBjMMiwBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KGq3iuu/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KGq3iuu/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8D531F000FF;
	Wed,  9 Sep 2026 19:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788983540;
	bh=+dE405p7v6aMygVq85pNcQeFzfkH//VK+9wopHaTXHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KGq3iuu/uFdsD9sqKuBq8Rj3OhwvZZQya8/MiijKVfbWFD4YCY1uQqvYe2SMtK4+D
	 Bh9xDKnMaChs2Dq+dKtkoRhdwC0i2GYjNuGDI89PADI8DHHnTIjo7vCTsq7MC9OYDs
	 fVlKOptqJwfXaZjsIbRCE8Rpiq8UV5PKLN1ule/2u0Rjw4rg42d8o9OWfgEFM7mxJV
	 5rlHFBfMQR9vKrbqNyTX79nKBJcTRgjOJSE5F831qR6N0vAoclI4LkOAwIX9t5PKqq
	 sY5mmgujWcuyqat6NSCAkKRJG39mBGNkLuDx0QsJmZfPzRs8/Dkd98D+PHamQg/7ns
	 VmWzt0cyyeDKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] media: i2c: Add Sony IMX681 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sergey Lebedev" <lsa.uz@pm.me>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260909193953.86192-3-lsa.uz@pm.me>
References: <20260909193953.86192-1-lsa.uz@pm.me>
 <20260909193953.86192-3-lsa.uz@pm.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 19:52:19 +0000
Message-Id: <20260909195219.D8D531F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] V4L2 controls are silently ignored when CONFIG_PM is disabled.
--

commit 399d495a390ace2e779563ec50b4c97d653a6b76
Author: Andre Gilerson <andre.gilerson@gmail.com>

media: i2c: Add Sony IMX681 sensor driver
   =20
The Sony IMX681 is the user-facing camera on the Microsoft Surface Pro 11
for Business (Intel Lunar Lake, IPU7), where it is enumerated as ACPI
device SONY0681. Without a driver the camera does not appear at all.

> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 5c52007f9cbeb..5f7b0d22c8f07 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -310,6 +310,16 @@ config VIDEO_IMX678
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called imx678.
> =20
> +config VIDEO_IMX681
> +	tristate "Sony IMX681 sensor support"
> +	select V4L2_CCI_I2C
> +	help
> +	  This is a Video4Linux2 sensor driver for the Sony
> +	  IMX681 camera.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called imx681.
> +

[ ... ]

> diff --git a/drivers/media/i2c/imx681.c b/drivers/media/i2c/imx681.c
> new file mode 100644
> index 0000000000000..bdaf435541a82
> --- /dev/null
> +++ b/drivers/media/i2c/imx681.c
> @@ -0,0 +1,880 @@

[ ... ]

> +static int imx681_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct imx681 *imx681 =3D container_of(ctrl->handler, struct imx681,
> +					     ctrl_handler);
> +	s64 exposure_max;
> +	int ret =3D 0;
> +
> +	/* Update exposure max when VBLANK changes (even when not streaming) */
> +	if (ctrl->id =3D=3D V4L2_CID_VBLANK) {
> +		exposure_max =3D IMX681_HEIGHT + ctrl->val - IMX681_EXPOSURE_OFFSET;
> +		__v4l2_ctrl_modify_range(imx681->exposure,
> +					 IMX681_EXPOSURE_MIN, exposure_max,
> +					 1, IMX681_EXPOSURE_DEFAULT);
> +	}
> +
> +	/*
> +	 * Only apply controls to hardware when streaming. The call returns 1
> +	 * having taken a reference, 0 if the device is not active, or -EINVAL
> +	 * if runtime PM is disabled - and in that last case no reference is
> +	 * taken, so it must not reach the pm_runtime_put() below.
> +	 */
> +	if (pm_runtime_get_if_active(imx681->dev) <=3D 0)
> +		return 0;

[Severity: Medium]
When the driver is built without CONFIG_PM, pm_runtime_get_if_active()
returns -EINVAL. Does this code misinterpret that error code as the device=
=20
being inactive?

Since VIDEO_IMX681 doesn't select or depend on PM in Kconfig, returning 0
here when pm_runtime_get_if_active() returns -EINVAL will silently ignore=20
all V4L2 control writes (exposure, gain, blanking, test pattern) when the=20
kernel is compiled without CONFIG_PM.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909193953.8619=
2-1-lsa.uz@pm.me?part=3D2
