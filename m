Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0508028C2DD
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 00:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778718943; cv=none; b=DqCYlNE6mmghR87vlqnmT297H/lsNMLAoR6aaW284ZIn1Wn0hYymCIFTIF3k2ss9wRrb+Fr3qwpfqxR+eJxKZLULneVAb+BiNUVT8XQ421ygHanYxZqMQ2Nf8LP95EV0O+4ObT8C2OiHLJSv5q7QcU0wTwr4QODU1pDDOQhERTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778718943; c=relaxed/simple;
	bh=V2bKfo+AduSyM4/JUeW1MRSdqolv8hoYG39QLHDhIGw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=siB2CdC80H9AQjqfWTvbMfFG+qCg/KHK3M/dk8UY/+0mwQhkHRW0IRxC+KnsAs4PlgdhvBCdgKYr5CN8237f2qTDggzjQee2Kd14RFDLVBG7F2ZZkzVCwDHmsnfr6rOFDn7I3ciDjQqkj3o0lBF9RdC5FgEKO5jFvFJWS2TO9Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=APBr2DXJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="APBr2DXJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF27C19425;
	Thu, 14 May 2026 00:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778718942;
	bh=V2bKfo+AduSyM4/JUeW1MRSdqolv8hoYG39QLHDhIGw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=APBr2DXJtJxz+ljy0iGue4kbkPNTDN8RYHp7iOeRIq2iKTT/fMK6UcGG+MHK8uOsP
	 jgie1Il6bW1I0cg6q4YDf0IlZrjZoZ7mxYpwwAXAwLKlHxFNhMuqhzWXESgwFxlQ6Z
	 R8/wBkFUsOzGVco5NRYRMA2OsBmAxr6Nh18DLoZk7SKSSPPzaeySKFGastrAKJtn0Q
	 HtNYCe8k1kTNwEEyGnM/FGZZn/5NMTqxwFJcPLVDihIOhtzZGE/1MisINqC+9KkHtj
	 q+1yCbNtCodKBCrOGzak/gKgg6FHMipoEXn1htfqWQjp16TOb/qeL+rSb/NTJbpFD6
	 mlN3vU3we4uXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V6 03/11] iio: imu: inv_icm42607: Add inv_icm42607 Core
 Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260512221634.256747-4-macroalpha82@gmail.com>
References: <20260512221634.256747-4-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 00:35:40 +0000
Message-Id: <20260514003542.5DF27C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Polling for reset completion immediately after a soft reset will c=
ause probe to fail due to a bus read error.
--

commit 62a44073ad81f2d638c1665cd828465dfd85d6f7
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add inv_icm42607 Core Driver

This commit introduces the core driver component for the inv_icm42607 IMU,
setting up initial configuration, reset handling, and register definitions.

[ ... ]
> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> new file mode 100644
> index 0000000000000..0baf4763b0a7d
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
[ ... ]
> +static int inv_icm42607_setup(struct inv_icm42607_state *st,
> +			      inv_icm42607_bus_setup bus_setup)
> +{
[ ... ]
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_SIGNAL_PATH_RESET,
> +			   INV_ICM42607_SIGNAL_PATH_RESET_SOFT_RESET);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Datasheet only specifies a reset period wait of 1ms for a
> +	 * power-on reset, but not a soft reset so not waiting here.
> +	 */
> +	ret =3D regmap_read_poll_timeout(st->map, INV_ICM42607_REG_INT_STATUS,
> +				       val, val & INV_ICM42607_INT_STATUS_RESET_DONE,
> +				       INV_ICM42607_RESET_TIME_MS * 100,
> +				       INV_ICM42607_RESET_TIME_MS * 1000);

Could this cause the probe to fail due to a bus read error?

When a soft reset is triggered, the device's digital core restarts, making
the interface temporarily unresponsive. Since regmap_read_poll_timeout
performs its first read immediately, the read will likely return a bus erro=
r.

Because regmap_read_poll_timeout evaluates its exit condition on any error
returned by the read operation, it will abort immediately rather than retry=
ing
the read.

Would it be safer to insert a small sleep delay before attempting to read f=
rom
the device after initiating the soft reset?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260512221634.2567=
47-1-macroalpha82@gmail.com?part=3D3
