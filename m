Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93B02F0C45
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 03:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780113475; cv=none; b=CdwfYg9RuARKw2FjFJ4FuMJ4/+1u6gg6G9lyhUn9U6t8ijdrEf5CaFAoRB54yd5aDW3RMdtfHFxUsDRxTgsKAr9ds7Dl7smoYCQ7yS6oFzA1Zg2c01rJuQmUvX6U0OXL8A3dCpvj6HF9xp9BlioWveR98liZOlbr5npiUbVJ9so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780113475; c=relaxed/simple;
	bh=DgUEI/MbrU4sDsqRcTXzBvJ4YXP1Ahz29EliR596zIQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m7NKsAzrScjDqIxXfPceg14Zy7khs86dkzGxkVOVV3JrqJxKuaK7IIbsv4TLCcS/4vJM15/14gZDjUySaCjWdAvnfKye9j+vbgN4jJKZEserBlNc+BXQVvVH/isImOJBqiy8hbGU5L+vfAVei/UTEMOaBUD5+t4K1C9oHrOGZmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DzxurMkY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DzxurMkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40DEA1F00893;
	Sat, 30 May 2026 03:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780113474;
	bh=s28Nk3wOtCpziqbJf6w9cVhsKnv0ZNGq7pgnDTUiE54=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DzxurMkYGPVsLDt9mQPQhGCv/uiP84KoKNXlO0A/5CqjKPOtoK3AeCbXr/mKUR2Hq
	 ma+WwZMFj7V3SswDVHE81cZ2mups9KsSYZHaoX1p2UovrsYnovSNvgSVUZ7RqVxykv
	 O4Q9N98z8oy8FvWa+ybUOEXqgWBo8nmkd2eN1Hv2Mge6P0Zd1vg4ciZKKubutZN7Ey
	 qh6JNl1DOmZw3Ptty2ZCHPY6ycrKrtsH2hMNCWWuPPQ9ePWF9iuh4jp7fJ8s0TYB/0
	 jtlcOkOekGVd4AJEjfBxy+cTyAvHXc7J+Af0XcVORS/26FVwZwNqq1IMHtWMjBIDsk
	 Ia58ZimIN3VPA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V9 05/11] iio: imu: inv_icm42607: Add PM support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260530031739.109063-6-macroalpha82@gmail.com>
References: <20260530031739.109063-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 03:57:53 +0000
Message-Id: <20260530035754.40DEA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] System suspend and resume callbacks will self-deadlock due to recu=
rsive acquisition of a non-recursive mutex via `pm_runtime_force_suspend()`.
- [High] Early returns in system sleep callbacks bypass `pm_runtime_force_r=
esume`, leaving runtime PM permanently disabled.
- [Low] System suspend and resume callbacks redundantly duplicate runtime P=
M operations.
--

commit f323b806ac9a0c8479d99408f838cb77ab5868ae
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add PM support for icm42607

Add power management support for the ICM42607 device driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 3dd4cc8c6b1d3..cfdce70ce25dc 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> +static int inv_icm42607_suspend(struct device *dev)
> +{
> +	struct inv_icm42607_state *st =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	ret =3D pm_runtime_force_suspend(dev);

[Severity: High]
Does this code self-deadlock when system suspend is triggered?

inv_icm42607_suspend() acquires st->lock via guard(), then calls
pm_runtime_force_suspend(). If the device is active, this synchronously
invokes inv_icm42607_runtime_suspend() which attempts to acquire the
same non-recursive st->lock:

inv_icm42607_suspend()
  guard(mutex)(&st->lock);
  pm_runtime_force_suspend()
    inv_icm42607_runtime_suspend()
      guard(mutex)(&st->lock);

Does the same deadlock pattern apply to inv_icm42607_resume() and
inv_icm42607_runtime_resume()?

> +	if (ret)
> +		return ret;
> +
> +	ret =3D inv_icm42607_set_pwr_mgmt0(st, INV_ICM42607_SENSOR_MODE_OFF,
> +					 INV_ICM42607_SENSOR_MODE_OFF,
> +					 false, NULL);
> +	if (ret)
> +		return ret;
> +
> +	inv_icm42607_disable_vddio_reg(st);

[Severity: Low]
Are these manual hardware shutdown operations redundant?

pm_runtime_force_suspend() invokes inv_icm42607_runtime_suspend() which
already performs these exact same sensor power-down and regulator disable
operations.

> +
> +	return 0;
> +}
> +
> +static int inv_icm42607_resume(struct device *dev)
> +{
> +	struct inv_icm42607_state *st =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;
> +
> +	ret =3D pm_runtime_force_resume(dev);

[Severity: High]
Does this early return leave runtime PM permanently disabled for the device?

If the device was active before system suspend, pm_runtime_force_suspend()
suspends it, updates its status to RPM_SUSPENDED, and calls
pm_runtime_disable().=20

During system resume, the pm_runtime_suspended() check above evaluates
to true, causing the function to return early. This bypasses the
pm_runtime_force_resume() call, so its internal call to pm_runtime_enable()
is never executed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530031739.1090=
63-1-macroalpha82@gmail.com?part=3D5
