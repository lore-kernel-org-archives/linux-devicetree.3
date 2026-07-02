Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F757395AF4
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990274; cv=none; b=a98Fu1OKGMM06B5MdnmVLLBfV70SIjI+kjChsLZ2uOTwsXFJVA6p7K3k5XPRn6M87/+yE8tD0PvHzX4rK69se5NM3klnpFMARtRyo36mMgTRX8DxP2RDYyIUyLnTq9Lr46KINKkbVdR83Icz5HNJI+/PcZqqQan8k5ZSF/ZbJU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990274; c=relaxed/simple;
	bh=rzdxML8WMqB1xSDl0o3jwpSjzWPAzR+Wylgwl7PuL38=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Iy4XC9q29qZ6ZEOxMESibuj8GmjsP/gcV0LFamxZfVzAVhBMRuw9osw0/3H/5NUSa0p/GXUCeNgX9od9TUML3MivVcEqhJig6eWBUQ6SgL3gkF4wE8F3sX+DJ1lLHdltsS/p9JQ7m4VF2V8xibC7t1SL64u50ZyFQ3P+n55v9TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/ZrHDTV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/ZrHDTV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441311F000E9;
	Thu,  2 Jul 2026 11:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782990272;
	bh=grDjBxYEW5NN9ucTbpvuhTB4YzloklBtpg5I+JEXoN0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I/ZrHDTVb6ItgVhNOnWytyrQYi0mSyBNzKlk03VrI97jCYyzY6FvdDN6frxfAmgPG
	 G4xLfXP0hEP4kpOpH7dgOpXMZ6IDgglfqWwTeMZI/Kvb6YuZaYxAsgqyVg1hsPbrcR
	 LiK92yoiU5W1wqBlTdFQxGSyQ4sjhybDuJvwxZeJqrrbESp5ggTNWLoHHqb8F2iJJD
	 5+Nvx4zdeo/Mapvrfrp4gZzAA1w0mwBNdF+Eahfd0xCnpOZt1eKN8EO517wo6YriSt
	 xZNVM49r5LW3K6I4lsoVSarOuakGfuMYE/JFeae6tZ0Of9hKbDoJ9J4FxRb5yk/p+d
	 cyLTOUz+yH8DQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] media: i2c: og0ve1b: Introduce per-sensor data
 structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260702-og0va1b-v2-2-0071442caa2a@oss.qualcomm.com>
References: <20260702-og0va1b-v2-0-0071442caa2a@oss.qualcomm.com>
 <20260702-og0va1b-v2-2-0071442caa2a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 11:04:31 +0000
Message-Id: <20260702110432.441311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Incorrect return value check of pm_runtime_get_if_active() leads t=
o unbalanced PM usage count and potential log-spam.
--

commit 77fd9b09419f467242cfd9a487b0ac45ff5344ef
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

media: i2c: og0ve1b: Introduce per-sensor data structure

This patch moves sensor-specific parameters into a new
struct og0ve1b_sensor_data to prepare for supporting additional
OmniVision sensors. The sensor data is selected at probe time
using i2c_get_match_data().

> diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
> index 84a28cdcade10..acc06b10bf896 100644
> --- a/drivers/media/i2c/og0ve1b.c
> +++ b/drivers/media/i2c/og0ve1b.c
[ ... ]
> @@ -261,23 +272,39 @@ static const struct og0ve1b_mode supported_modes[] =
=3D {
[ ... ]
>  static int og0ve1b_set_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct og0ve1b *og0ve1b =3D container_of(ctrl->handler, struct og0ve1b,
>  					       ctrl_handler);
> -	const struct og0ve1b_mode *mode =3D &supported_modes[0];
> +	const struct og0ve1b_mode *mode =3D &og0ve1b->sensor->modes[0];
>  	s64 exposure_max;
>  	int ret;

[Severity: High]
This isn't a bug introduced by this patch, but I noticed a pre-existing
issue in this function regarding the return value check of
pm_runtime_get_if_active().

Later in og0ve1b_set_ctrl(), the code does:

    if (!pm_runtime_get_if_active(og0ve1b->dev))
        return 0;

Because pm_runtime_get_if_active() can return a negative error code
(like -EINVAL when PM is disabled), the logical NOT operator will evaluate
the negative error as false. This bypasses the error condition entirely,
allowing execution to proceed to I2C hardware register writes and
unconditionally calling pm_runtime_put().

Since the initial 'get' call did not increment the usage counter on error,
the subsequent 'put' call decrements it improperly. Could this cause an
unbalanced PM usage count underflow and trigger kernel warnings?

Should this condition be updated to explicitly check if the return value
is less than or equal to zero?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702-og0va1b-v2=
-0-0071442caa2a@oss.qualcomm.com?part=3D2
