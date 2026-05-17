Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4583315D39
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 09:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011696; cv=none; b=QsZqoy8zlpWHviLosWYDruQt5yl3jIJEd8mSsfYi78XDIr/w87p6l1fxO8MggPTPb6TdRRpBdudti4SkrbHWjT2DKU5EyuDKhc9ymIq/eWZDvL2Mjq3QpBRbd8iejbYMTzlGQIGt1IsUjaqn2rTcONQSVBsSeuJg8kCjJndR5d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011696; c=relaxed/simple;
	bh=FU5M+j0RjrsUOihY7yVb9Xvc6vvdpKZciJL01Alqm9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kDPvydMiWwcF+u2NNVjZKw2aGT7fj+1WNLERTuVnGnuicdlH7/aam5WvDJSC/CB6a/E84HJS1Ecm0QxCx6TDqB6zYijYSUCAc1arg7YhkzJAQKR0r0CGPTVK1aGWxai8SeKsIA+E7I6ENRSCdyLf0TmLTjp+cZlFR/zaG0OudUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atNDn4Kf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atNDn4Kf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B368EC2BCB0;
	Sun, 17 May 2026 09:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779011695;
	bh=FU5M+j0RjrsUOihY7yVb9Xvc6vvdpKZciJL01Alqm9s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=atNDn4Kf7FRw3LSPpUsaNJWZOcb+t0bGK+u3pDgr+6kdX2FGQSrdry/16Z3n+/xQ5
	 5Zu0sLjoDfF7lvk0DHm+h32VzbGhe9YVInw/ippmKRHp1llgGiRQqYix27aSBSwVnP
	 QFGz19AxF3FKYJ1+M0j6HOspN4G/8JRSehrkBhGoG6ndN92DQkha9moiJmUqb7rvB9
	 gPorfNnta7Z2quC3S5exnITS4XtpaYscQkx3Fi91WUUCaQ00jIgFcnwniTC5vTciNQ
	 VMn2jy6LcI3SUT8oLf4PkRypv9K4zRpcSrwkvDahRECVPAUOLnlh1lYZhVd5uJ1fr/
	 FW3ljetOzSWgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 10/12] iio: frequency: adf41513: features on
 frequency change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260517-adf41513-iio-driver-v13-10-bb6e134a360f@analog.com>
References: <20260517-adf41513-iio-driver-v13-10-bb6e134a360f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 09:54:55 +0000
Message-Id: <20260517095455.B368EC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The calculated `bleed_value` can exceed the 8-bit maximum of `ADF41=
513_REG6_BLEED_CURRENT_MSK`, causing silent truncation when written.
--

commit ca2e85652223c6f4917441bebff8f2b7161b211f
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: adf41513: features on frequency change
   =20
Set Bleed current when PFD frequency changes (bleed enabled when in
fractional mode). Set lock detector window size, handling bias and
precision. Add phase resync support, setting clock dividers when
PFD frequency changes.

> diff --git a/drivers/iio/frequency/adf41513.c b/drivers/iio/frequency/adf=
41513.c
> --- a/drivers/iio/frequency/adf41513.c
> +++ b/drivers/iio/frequency/adf41513.c

[ ... ]

> @@ -579,9 +595,83 @@ static int adf41513_calc_pll_settings(struct adf4151=
3_state *st,
>  	return 0;
>  }
> =20
> +static void adf41513_set_bleed_val(struct adf41513_state *st)
> +{
> +	u32 bleed_value, cp_index;
> +
> +	if (st->data.phase_detector_polarity)
> +		bleed_value =3D 90;
> +	else
> +		bleed_value =3D 144;
> +
> +	cp_index =3D 1 + FIELD_GET(ADF41513_REG5_CP_CURRENT_MSK,
> +				 st->regs[ADF41513_REG5]);
> +	bleed_value =3D div64_u64(st->settings.pfd_frequency_uhz * cp_index * b=
leed_value,
> +				1600ULL * MEGA * MICROHZ_PER_HZ);
> +
> +	FIELD_MODIFY(ADF41513_REG6_BLEED_CURRENT_MSK, &st->regs[ADF41513_REG6],
> +		     bleed_value);

Can bleed_value exceed the 8-bit maximum of ADF41513_REG6_BLEED_CURRENT_MSK?

In Integer-N mode, pfd_frequency_uhz can reach 250 MHz (250e12 uHz). Combin=
ed
with a maximum cp_index of 16 and a phase detector polarity base value of 1=
44,
the formula yields 360 ((250e12 * 16 * 144) / 1.6e15).

Since ADF41513_REG6_BLEED_CURRENT_MSK is an 8-bit mask (max value 255),
writing 360 via FIELD_MODIFY silently truncates the value to 104.

While this doesn't cause immediate functional harm because the bleed current
is explicitly disabled in Integer-N mode, should this calculation be clamped
or skipped completely when bleed is disabled to prevent writing a wrapped
value?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-adf41513-i=
io-driver-v13-0-bb6e134a360f@analog.com?part=3D10
