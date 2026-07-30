Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E692DC76A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 08:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399512; cv=none; b=MaFrUGuxwm9hUa1ZYfPJdODW4prvEcCzcaryRediev3YN/ahTG5xWhxKEmWCVTfFs8YU9yr8h4GkKqbtlnQ/VIsIukwi9FxJ0MpwsRXKR0LaCy7ItvIPxQ/UVa9pQYhuKRrkHYT+6JNuMChZQECWWa9FQ0zE5nbzirou7QJTzIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399512; c=relaxed/simple;
	bh=XXRz1yDPoT2fJvgYZ9OloRwg/s/u5AJBhCZzy38n2C4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B9QjccV708MAw5xUmmpNyowSOyt4mnNMBS1/5hQmRjH9p5orCJiPCMi6VYT48+kX0bzsyPfOvCXwJSeSFj08pwMnAu8HYWHG7/Nu9HjFrdOU5T1RRbiR64J7Wwuf03wRbQohQeivMbG7kBx2HKpAXTB/OFgGfrS4wNlyQnFL9Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HySjsOHy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HySjsOHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43D6F1F000E9;
	Thu, 30 Jul 2026 08:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399510;
	bh=5xxd+1n4CVbnsoasH2GQVr5a9Uv1bYYN5sHq1UC6K1c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HySjsOHy3SrnL5RtizEnPnyNQ8Hzr6IRHcOvJ17jq7VXPPbuxUlU1DOQChnlk6KNy
	 idR5qP/xR1UlqG80KPsY0JoCClQNs1Tfa4yhrSEy/mvod6er8x7MCAN9qqgOpPHkgg
	 CFDxbCjgwV5JtpasAcAkEit+tBQvTGNxxgvxuOefdN5UEkGe+91+ScIvUMkPmI9Jih
	 f2/7SvPZyVg9sb0VQQfukeNSjYyT5eMeL0AcYGlES3QCKIJQ5DMz1wO1oxAZzh6YgY
	 4++ja8Sf0zTsZAkQsaXEQKxU8Ck/rhmfW6X8tnTwYc7aHYfw+HvV2hIRIj9xpbcmsm
	 rEQi+I/LKSm/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 6/7] qcom-tgu: Add timer/counter functionality for
 TGU
Reply-To: sashiko-reviews@lists.linux.dev
To: "Songwei Chai" <songwei.chai@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260730080704.2903540-7-songwei.chai@oss.qualcomm.com>
References: <20260730080704.2903540-1-songwei.chai@oss.qualcomm.com>
 <20260730080704.2903540-7-songwei.chai@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 08:18:29 +0000
Message-Id: <20260730081830.43D6F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incorrect mapping of missing hardware timer and counter registers =
causes out-of-order register writes.
--

--- Patch [6]: [PATCH v16 6/7] qcom-tgu: Add timer/counter functionality fo=
r TGU ---
commit db9df0865ab2140ab0eb7823166108ce956f637e
Author: Songwei Chai <songwei.chai@oss.qualcomm.com>

qcom-tgu: Add timer/counter functionality for TGU

This commit adds timer and counter functionality for each step in the TGU
driver. It determines the number of timers and counters by reading the DEVI=
D2
register, allocates necessary memory, and exposes sysfs attributes for user
configuration.

> diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
> index 7f0a74514e40f..ea83273a628c5 100644
> --- a/drivers/hwtracing/qcom/tgu.c
> +++ b/drivers/hwtracing/qcom/tgu.c
[ ... ]
> @@ -236,6 +266,30 @@ static ssize_t tgu_write_all_hw_regs(struct tgu_drvd=
ata *drvdata)
>  				drvdata->base + CONDITION_SELECT_STEP(i, j));
>  		}
>  	}
> +
> +	for (i =3D 0; i < drvdata->num_step; i++) {
> +		for (j =3D 0; j < drvdata->num_timer; j++) {
> +			index =3D check_array_location(drvdata, i, TGU_TIMER, j);
> +
> +			if (index =3D=3D -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->timer[index],
> +				drvdata->base + TIMER_COMPARE_STEP(i, j));

[Severity: High]
Does this code handle sparse timers correctly? If the hardware implements a
non-contiguous set of timers (e.g. TIMER1 is present but TIMER0 is absent),
tgu_set_timer_counter() will set num_timers to 1.

Since num_timers is 1, j will be 0 here. This writes to TIMER_COMPARE_STEP(=
i, 0)
instead of TIMER_COMPARE_STEP(i, 1). Could writing to an unimplemented
or unclocked register cause an asynchronous external abort?

> +		}
> +	}
> +
> +	for (i =3D 0; i < drvdata->num_step; i++) {
> +		for (j =3D 0; j < drvdata->num_counter; j++) {
> +			index =3D check_array_location(drvdata, i, TGU_COUNTER, j);
> +
> +			if (index =3D=3D -EINVAL)
> +				goto exit;
> +
> +			writel(drvdata->value_table->counter[index],
> +				drvdata->base + COUNTER_COMPARE_STEP(i, j));

[Severity: High]
Can the same issue happen for sparse counters, where we map to the wrong
hardware register if COUNTER1 is present but COUNTER0 is absent?

> +		}
> +	}
>  	/* Enable TGU to program the triggers */
>  	writel(1, drvdata->base + TGU_CONTROL);
>  exit:
[ ... ]
> @@ -316,6 +370,27 @@ static void tgu_set_conditions(struct tgu_drvdata *d=
rvdata)
>  		drvdata->num_condition_select =3D TGU_MAX_CONDITION_SELECT;
>  }
> =20
> +static void tgu_set_timer_counter(struct tgu_drvdata *drvdata)
> +{
> +	int num_timers =3D 0, num_counters =3D 0;
> +	u32 devid2;
> +
> +	devid2 =3D readl(drvdata->base + CORESIGHT_DEVID2);
> +
> +	if (TGU_DEVID2_TIMER0(devid2))
> +		num_timers++;
> +	if (TGU_DEVID2_TIMER1(devid2))
> +		num_timers++;

[Severity: High]
If TIMER0 is absent but TIMER1 is present, this collapses the presence bits
into a single count of 1, losing the index mapping used when writing to the
hardware registers above.

> +
> +	if (TGU_DEVID2_COUNTER0(devid2))
> +		num_counters++;
> +	if (TGU_DEVID2_COUNTER1(devid2))
> +		num_counters++;
> +
> +	drvdata->num_timer =3D num_timers;
> +	drvdata->num_counter =3D num_counters;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730080704.2903=
540-1-songwei.chai@oss.qualcomm.com?part=3D6
