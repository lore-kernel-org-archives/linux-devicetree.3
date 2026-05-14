Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C952DECCB
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 01:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778721932; cv=none; b=IQKtEmbgMV5dRCP4HMHSmns0UVs04gL9yr8DHDEsPDbfJ+UaSR7GY5JR9ihU6G+pD3acvhRNK+1EoyS+wqTPGBNafesG/eUSgKsPyMWORsJNsKQPdLWQwTwb/yAjhkjllprctpAdpEKuupZLewSzMTaxNOeuq9jXo9JzoJIPrrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778721932; c=relaxed/simple;
	bh=9l8JAg64TN2B/Uvw+AmLS+DcZWtza4TuLiRYqBwlplM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bbzIjWbYrIcBfaDhpJ9mRMR8VJg4DoInfMGmyzwNheQThcFawEdZOlpwqspR+bCKeJ2wRM19zb/7Y/VDCyPUshr+CNE3m4d/D7YYPKp4k6mq+Tq+mmBmCGTPJ3GCduqPGAtHbFvnmbF8F+HbBRcmj8Po5Y3xwFOi3LF6U4BFvbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kgF3nNlx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kgF3nNlx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F9FC19425;
	Thu, 14 May 2026 01:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778721932;
	bh=9l8JAg64TN2B/Uvw+AmLS+DcZWtza4TuLiRYqBwlplM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=kgF3nNlxF5qFLmGnn67LxdORZra1GSRWw0IZHl8EKZ//4But+OaRbU0Uo+557VUvD
	 KysqqDZKB1o1DExONqSGJhaGUgyq3r75IxllSMb/XUmrv1GYfWi3ZY2mjv7htQ8hIx
	 W6yuXA8DAafjAglWSaGd1T625gY8DDMRr+T0erqmtzJ0CkyBR7hKlX3CnqLGmVUmGi
	 UsuHVPPkXTx+A5OYmcTW5we4SXzGrKHEM2vVkikw7n7+w/P0qQI2etf6N2HAml5Zrq
	 DtGWkURifTB7G4Il9dYPRRIXZhp71hBEElz2AbgSvlelpu35Q5z0zFu903+5/gTI0g
	 yyBukXmtkA21A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 05/11] iio: imu: inv_icm42607: Add PM support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260512221634.256747-6-macroalpha82@gmail.com>
References: <20260512221634.256747-6-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 01:25:31 +0000
Message-Id: <20260514012531.D1F9FC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Misleading comment in `inv_icm42607_resume()` regarding runtime PM =
state.
--

commit 5e3ef42dfba709e36dacf1125d8f13cfabbf3f5c
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add PM support for icm42607
   =20
Add power management support for the ICM42607 device driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 6119379ca6a8b..dfd2fed7bf1e6 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> +/*
> + * System resume gets the system back on and restores the sensors state.
> + * Manually put runtime power management in system active state.
> + */

This isn't a bug, but the comment mentions manually putting runtime power
management in the system active state.

However, the function correctly does not call any PM core APIs (such as
pm_runtime_set_active()) to alter the runtime PM status. The driver
checks pm_runtime_suspended() to avoid waking up hardware that was already
runtime-suspended, ensuring the hardware state perfectly aligns with the PM
core's state.

Could this comment be updated or removed to prevent confusion?

> +static int inv_icm42607_resume(struct device *dev)
> +{
> +	struct inv_icm42607_state *st =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	if (pm_runtime_suspended(dev))
> +		return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512221634.2567=
47-1-macroalpha82@gmail.com?part=3D5
