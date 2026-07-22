Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908C4318ED2
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 21:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784754266; cv=none; b=m36mCYXWgu6wXQA3CyjBZWkGEAKQfS3AM16OxW6o+/6DSzmbPH+wBbiKhfESo3WPznBT04g0yJwXgfPU/3msXDbqFxguMe0Rb5hLWYHKFoXbKKn9H5ZyXGK6vcOzDUe2SaxwFmgg9Y/WkRLsMFnHJj1FF1e+zUW80UdP/vURBgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784754266; c=relaxed/simple;
	bh=zh5q5h7sUfDzyQIKBxFFBiVG4ZqjkJkXbwaHYm5oGiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A90P0WBP3Yk4sZ4z1aAsFBRLu+Evb3dai8EWeVSO1GpYCS+x9IN6/PYi32eK0FZ4vV/pBp+cWacmq8ko5WlXqVB8ngaH02LCoGKo1F5MSp92JLcO10cMovQSXd7eytS82yEasBJ3IdVTl7CgQuVJ5/OQfIbfxnjUJJapn13+BwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMHuDS+Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMHuDS+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD61E1F000E9;
	Wed, 22 Jul 2026 21:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784754265;
	bh=1waC+H//TyeXJehJVib1okVe+UIsY61QXBPWZ39E7wA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TMHuDS+YitZYCSd04VfoYwKCqIPQ+FtSM4kKzNdIbwRHXhdu/+YUV34wWGndbQO6u
	 6d57X9p/oHO/P+fb+HWdtvD3D7Wx1KO8gTAafvjeVjyWG81v0ouxIGZKbyQRD5bMuX
	 MAusZUoT/VatFsfsaCApK2zgtBxdI1XESFL7MmP4llVCJ8UXnFm2rL58Rdj7Hlbmv1
	 TP1jQFmTBEDXcXenh392ITP51DzJXjVWi7VQ5CvEahASIonSK+4yYHN+MprJTExmME
	 IyaNSmZuDfHxYIWdYsoBNjnS5xHyM+XX3DW6YBKve9z/nfGlAnpAiT+36gKriVw/9l
	 n1jswHfwYW8RQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] mmc: core: Add mmc_delay_us() for microsecond
 precision delays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260722205701.372789-3-jm@ti.com>
References: <20260722205701.372789-1-jm@ti.com>
 <20260722205701.372789-3-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 21:04:24 +0000
Message-Id: <20260722210424.DD61E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] mmc_delay_us() incorrectly uses msleep() for short delays, causi=
ng massive oversleeping and destroying precision
- [Medium] mmc_delay_us() uses usleep_range() with zero slack for small del=
ays and violates timer usage guidelines for <10us delays
--

--- Patch [2]: [PATCH v2 2/3] mmc: core: Add mmc_delay_us() for microsecond=
 precision delays ---
commit c0ce7d5a46919cedbd3c712e3639e844d38294c9
Author: Judith Mendez <jm@ti.com>

mmc: core: Add mmc_delay_us() for microsecond precision delays
   =20
Add mmc_delay_us() to support microsecond-granularity delays needed
in MMC framework. It uses 25% margin consistent with  mmc_delay() for
timing flexibility.

> diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> index a028b48be1644..55e9fb3bab9f7 100644
> --- a/drivers/mmc/core/core.h
> +++ b/drivers/mmc/core/core.h

[ ... ]

> @@ -73,6 +73,19 @@ static inline void mmc_delay(unsigned int ms)
>  		msleep(ms);
>  }
> =20
> +static inline void mmc_delay_us(unsigned int us)
> +{
> +	if (us < 1000) {
> +		usleep_range(us, us + (us >> 2));

[Severity: Medium]
When us is less than 4, will this pass 0 slack to usleep_range()? For
example, if us is 2, this calls usleep_range(2, 2), which defeats timer
coalescing.

Also, for delays under 10us, should this use udelay() instead? Kernel
documentation recommends udelay() for delays < 10us because the context
switch overhead of usleep_range() often outweighs the delay itself.

> +	} else {
> +		unsigned int rem_us =3D us % 1000;
> +
> +		msleep(us / 1000);

[Severity: Medium]
Does using msleep() here break the expected microsecond precision?

On systems with a low HZ value (like HZ=3D100), msleep(1) will sleep for at
least 1 jiffy, which is 10ms. This can cause the function to oversleep by
10-20x the requested duration.

Kernel timers documentation generally recommends using usleep_range() for
delays up to 20ms instead of falling back to msleep() at 1ms.

> +		if (rem_us)
> +			usleep_range(rem_us, rem_us + (rem_us >> 2));

[Severity: Medium]
Similar to the issue above, if rem_us is less than 4, this provides 0 slack
to the hrtimer subsystem.

Additionally, splitting a mixed delay like 1500us into msleep(1) and
usleep_range(500, 625) forces two context switches. Since msleep() has high
variance, does the subsequent fine-grained usleep_range() actually improve
precision, or does it just add unnecessary overhead?

> +	}
> +}
> +
>  void mmc_rescan(struct work_struct *work);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722205701.3727=
89-1-jm@ti.com?part=3D2
