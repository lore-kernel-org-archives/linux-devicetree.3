Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63612147E6
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785589824; cv=none; b=ux6Kbewvypft7xrq8YKP8bHshvfO+7a9YPpx6Wwjy9TTlq7W1ITQxy7kH5CwUhkQ5EvcvibhiJ3jlIST0XdihTsiDsgr93Ar/1D+4ypDWXh5TmnFNtqwklQgLNqfjKj2iqhfeW4WjMTdgjUDcAW4VqZqh985EUEQysF6MrTashQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785589824; c=relaxed/simple;
	bh=t4sYVqrMgs5v9s4aYvAU+hrA3T4abykxkbGxlgbtkh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nN5dft71V4gr8tQrngbfUqQk5G5HFUoorDGypXcptKC3gKZqwcwhBgIrKJXM6cefcjmhGDkndA4NxP8+BbE2gzKwpC4Z6SnvrgVi/pVAsFF8mZ/AmmvDLW7vWlS9XENgzYFeQKF5ALck65UMnu2gqUVMDmdzBqAwrPzUu/ZSkEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JqJZpLey; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JqJZpLey"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F61C1F00AC4;
	Sat,  1 Aug 2026 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785589822;
	bh=bV2vif36mphWuBPngXF3NkPGRu8wBUER/aieR5qAaQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JqJZpLeyDAJaRujg5Dd6dEkDnaqkmvQs1AwsAZRrEBTYyyWphW0pUM3UJN1+97w3/
	 KV79PLBjehj8BNdPeGXyXbM+P/K9wcSn9FTskFo8rXkZgcxGVOt5kZEZ4j72W8Ksfu
	 KHNlzY1o882lNC7sH4Fn4mCQsvuM1z3Wpe563WhnI3jwcljJqO788DgPpj4URjPSZE
	 hd7W7UgGBxMGhFRHTNKOb+iczrsWmUON86cgbr2r0mV8WK4Am7ukjaSrkYcgSA4j4K
	 JPKC2uLfJX3CmpaZYwEOUckPMcKJ0vLtJlN6azp8sHC3HgWBmejPi1nsJWW3EH/O7B
	 dyj6D8AHmFXEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] media: i2c: hm1092: add Himax HM1092 mono NIR
 sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ramshouriesh R" <rshouriesh@gmail.com>
Cc: robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260801-hm1092-driver-v6-2-5979f223748a@gmail.com>
References: <20260801-hm1092-driver-v6-0-5979f223748a@gmail.com>
 <20260801-hm1092-driver-v6-2-5979f223748a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 01 Aug 2026 13:10:21 +0000
Message-Id: <20260801131022.2F61C1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect evaluation of `pm_runtime_get_if_in_use()` ignores neg=
ative error codes, leading to unbalanced `pm_runtime_put()` and unprotected=
 I2C writes.
--

--- Patch [2]: [PATCH v6 2/2] media: i2c: hm1092: add Himax HM1092 mono NIR=
 sensor driver ---
commit 5fe0ced142caf11a45ab013b94529b5d66c8da00
Author: Ramshouriesh R <rshouriesh@gmail.com>

media: i2c: hm1092: add Himax HM1092 mono NIR sensor driver

Add a V4L2 subdev driver for the Himax HM1092, a 1 megapixel monochrome
near-infrared image sensor with a single-lane MIPI CSI-2 interface,
typically used as the face-authentication IR camera on laptops.

Link: https://lore.kernel.org/r/20260727131252.1580332-1-j@metarealtyinc.ca
Link: https://lore.kernel.org/r/20260727154058.2350497-1-j@metarealtyinc.ca

> diff --git a/drivers/media/i2c/hm1092.c b/drivers/media/i2c/hm1092.c
> new file mode 100644
> index 0000000000000..eb3607a7e1f34
> --- /dev/null
> +++ b/drivers/media/i2c/hm1092.c

[ ... ]

> @@ -0,0 +1,863 @@
> +static int hm1092_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct hm1092 *hm1092 =3D container_of(ctrl->handler, struct hm1092,
> +					     ctrl_handler);
> +	int release_ret;
> +	int ret =3D 0;
> +
> +	/*
> +	 * The control value is cached by the framework and (re)applied from
> +	 * hm1092_enable_streams() once the device is powered up for streaming.
> +	 */
> +	if (pm_runtime_get_if_in_use(hm1092->dev) =3D=3D 0)
> +		return 0;

[Severity: Medium]
Does this code handle negative error codes properly?

If pm_runtime_get_if_in_use() returns a negative error code (like -EINVAL
when runtime PM is disabled), the strict =3D=3D 0 check will evaluate to fa=
lse
and allow the code to fall through. This could cause the driver to execute
I2C writes to a potentially unpowered device.

> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_EXPOSURE:

[ ... ]

> +	case V4L2_CID_TEST_PATTERN:
> +		ret =3D cci_write(hm1092->regmap, HM1092_REG_TEST_PATTERN,
> +				ctrl->val, NULL);
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	pm_runtime_put(hm1092->dev);

[Severity: Medium]
Will this unconditional pm_runtime_put() cause a usage counter underflow
regression?=20

Because the prior pm_runtime_get_if_in_use() call does not increment the
counter when returning a negative error code, calling pm_runtime_put()
here will cause an underflow and trigger a warning from the PM core.

> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260801-hm1092-dri=
ver-v6-0-5979f223748a@gmail.com?part=3D2
