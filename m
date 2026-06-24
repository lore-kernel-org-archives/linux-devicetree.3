Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4112E542C
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 07:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782286578; cv=none; b=fvpJEDAwrDnpNwLoeU4AChMkYXgJTl6t+o0KLSfDtu2A+rUsutBlW/njpDIWLudNNPCRmrJNAR51QhDscYuG52oVlpwgiMmVntCCFSscpI6J8tFXY+/B2fz5D0siwaKdhKJ9WEIjCSsBIaTZy97jw+97Qdh3vtKQ2FyEUT6mvpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782286578; c=relaxed/simple;
	bh=vafPXV1si9pBOoL2qUdPW+SwEuwM+AW9yDbEB92YKcc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uU7rZ5KcEsEP6kBUtbJ4MSlIRIUpDtpEIC6jruIWxEW2Bz9DSZg2k2um03blUaxgNxMfvK79g757sQXMcQGT4ljdolPlysO7HCu6V7fh3v92XFD0VFbFTTFKLlEejkgNB7X2kPPoQrb1e7DDCyaE6vHnBIdbvMIRZdWZkc3w39w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUsVyjkN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUsVyjkN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292111F000E9;
	Wed, 24 Jun 2026 07:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782286577;
	bh=reTvX/fzJ8RzIlI37/Q2XlcCQQJa1sabqHByhmxzImU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CUsVyjkN0aiwW179ee/2nJsG3/liTXdZTbgQMZQXjDnBVU5UaWXDxraJCm7zGL9/y
	 cSyU8GE08OSFCui0QhYuGaZUas2MjydFYyayoalCPqnR0Q5hXezkEKlmHCGBTm057F
	 yWuTBTeVczMb0TtOAaCecRbmO+5NcZ5bNZC4eMTQxG9F5say2C1//yp32a6KZXtRvK
	 dJ5Bnkc/g1O3FZFROhjuCo5V8EfhXYKM7Hln0TUpY43zMuUlzGGSEz67d3iFj3O43y
	 0hBNrXDvLVAPGAeQ28Qs5/6ozW03dr2sCV7BLb/Li1AYCHlb6fKLsGt8Wh6bD7xCgX
	 crsT8AUuLX4LA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 7/9] media: chips-media: wave6: Add Wave6 thermal
 cooling device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260624072043.238-8-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
 <20260624072043.238-8-nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 07:36:16 +0000
Message-Id: <20260624073617.292111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Ignored error return in set_cur_state callback causes thermal fr=
amework desynchronization.
- [Medium] Initial thermal state changes during registration are silently d=
ropped due to a check for `!thermal->cooling`.
--

commit f2e1f0ee6d5cf6a10bb958433178a8d9e3143413
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add Wave6 thermal cooling device

Add a thermal cooling device for the Wave6 VPU. The device operates within
the Linux thermal framework, adjusting the VPU performance state based on
thermal conditions.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c=
 b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c
> new file mode 100644
> index 0000000000000..91cd826e81195
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-thermal.c

[ ... ]

> +static int wave6_vpu_thermal_cooling_update(struct vpu_thermal_cooling *=
thermal,
> +					    int state)
> +{
> +	unsigned long new_clock_rate;
> +	int ret;
> +
> +	if (state > thermal->thermal_max || !thermal->cooling)
> +		return 0;

[Severity: Medium]
Will this silently drop initial thermal state changes during registration?

When devm_thermal_of_cooling_device_register() is called, it can synchronou=
sly
trigger a state update before the registration function returns and assigns=
 the
pointer to thermal->cooling. Because thermal->cooling is not yet assigned,
this check evaluates to true and skips the hardware update.

[ ... ]

> +static int wave6_vpu_cooling_set_cur_state(struct thermal_cooling_device=
 *cdev,
> +					   unsigned long state)
> +{
> +	struct vpu_thermal_cooling *thermal =3D cdev->devdata;
> +
> +	thermal->thermal_event =3D state;
> +	wave6_vpu_thermal_cooling_update(thermal, state);
> +
> +	return 0;
> +}

[Severity: Medium]
Should the return value of wave6_vpu_thermal_cooling_update() be checked be=
fore
returning success to the thermal framework?

If wave6_vpu_thermal_cooling_update() fails, this function still unconditio=
nally
returns 0 and updates the local thermal->thermal_event state. This could le=
ave
the thermal framework thinking the hardware state has changed when the hard=
ware
is actually stuck in its previous state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624072043.238-=
1-nas.chung@chipsnmedia.com?part=3D7
