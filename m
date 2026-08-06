Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028463D5246
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 07:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786001181; cv=none; b=fgucI/qXVSjOexVXwpxg33zIjr0Vzbs7eaun8h8RCAm3xHA76+pzZU8UVd15v8El9X7vAnby5CKGCkoq0nXm7a+NTKnKCUoaL6yAlYiUEqwQVlWUgjMimgc/qGShEleE1E9ZQOSiXEFxfbtpRSZNbymB2bsKAONgxvAZvpqHhgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786001181; c=relaxed/simple;
	bh=AcWHq4Z922iLpaBe7m6xhnVqQy7wPIo0513g5GppBz4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CPdMoN8keEwzo/TO8H7X7o+01PKa33JuRtznHqqayIL9LB4R/91j8IrxPgleNZquf+yXSL0GChVzUJWy15fWn80DfRx2q64YjoJ9vu995+2etPSoYZdcDCjtic8uhGJKlvUjD3BAy+VwBgajnTMdDYzpqkLb+FRBEQ4vQ2gle5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hEJfsEry; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEJfsEry"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 518561F000E9;
	Thu,  6 Aug 2026 07:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786001179;
	bh=dCo2ahjQxZo9XcywaE5E8yqpv+xdQ7I41rOo/9QIQJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hEJfsEry7dQw6M4JgWFJcAA7iAaGjlgfBCkr9XDeK/kbn17X7I9lrxWiQKYaTdptb
	 iJk8eiJPavk/FImaKtmL6LpcoK3fmSfzTnz57Szl08oSIvAg/WUl2xpj4h8eTyP13z
	 1UvsFjswzxKXy5z+w5SMG6jaaVhZeCORKxuN3XfWLoe8W/mJ99qL9QiIiTLWGV+5yW
	 YZgEQljqd/8lxMP1xrjzWfk6g8jTen4iCRZnWkKl5HGyY9reG8nXf3MRm1KEqdMevV
	 HBoRO8oDuO3RuUGKe/O0kjL5HSvHFlxkKdKxj8tVpBGGHCIFMmvZWAVh3mpGoQ7JhC
	 xY3bZ7fOfEVcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: Add Sony IMX908 image sensor driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lachlan Michael" <lachlan.michael@sony.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806070934.21764-3-lachlan.michael@sony.com>
References: <20260806070934.21764-1-lachlan.michael@sony.com>
 <20260806070934.21764-3-lachlan.michael@sony.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 07:26:18 +0000
Message-Id: <20260806072619.518561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Setting V4L2 controls fails unconditionally with `-EINVAL` when =
`CONFIG_PM` is disabled, preventing streaming.
--

--- Patch [2]: [PATCH v2 2/2] media: i2c: Add Sony IMX908 image sensor driv=
er ---
commit 92ff772dc92c29c7cb738f917f95440d0e6be72c
Author: Lachlan Michael <lachlan.michael@sony.com>
   =20
media: i2c: Add Sony IMX908 image sensor driver

This commit introduces a V4L2 sub-device driver for the Sony IMX908
8.39 megapixel CMOS image sensor. The driver supports RAW10 and RAW12
output formats and configures the MIPI CSI-2 interface.

> diff --git a/drivers/media/i2c/imx908.c b/drivers/media/i2c/imx908.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/media/i2c/imx908.c
[ ... ]
> @@ -0,0 +1,1501 @@
[ ... ]
> +static int imx908_set_ctrl(struct v4l2_ctrl *ctrl)
> +{
[ ... ]
> +	/* Hardware writes only when powered; cached ctrls applied on resume */
> +	ret =3D pm_runtime_get_if_in_use(imx->dev);
> +	if (ret <=3D 0)
> +		return ret;

[Severity: Medium]
When the kernel is compiled with CONFIG_PM=3Dn, the inline stub for
pm_runtime_get_if_in_use() returns -EINVAL. Will this cause
imx908_set_ctrl() to unconditionally return -EINVAL in that configuration,
aborting __v4l2_ctrl_handler_setup() and preventing the stream from
starting?

Could this check be adjusted to handle the CONFIG_PM=3Dn case by treating
-EINVAL as success, falling through to access the hardware since it would
be continuously powered in that configuration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806070934.2176=
4-1-lachlan.michael@sony.com?part=3D2
