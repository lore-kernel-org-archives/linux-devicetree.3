Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0852421ABD7
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785844516; cv=none; b=CMa0xq1jAi01Z3COx+chU+OU6b8xtltiDwUF9BY0Bo/bkzlPmV27qa35VRr3zTPRPyEXLePp/JFnkWWwNe6+WAJOsmVH/Y1CW955axH6vIRiY6MT6Utz6juqPLkAMxwvdGxFzOJVBasw79E6/bBkUWOev7HvuXI+kUXjmw44+/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785844516; c=relaxed/simple;
	bh=YPjCBnyfsqJWjBvItW0BHZSjmXSQOd6ZwjDePahbnLQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dbKyNE3fyblKjrYRJxNleZB97QfvWNgRQPjwIXiANbeDH2n9/mKo0nR/T9pRfT6rrhLJ1aBr0RGac+3AOJEC6Z/e4nOYayYJF7rJcFPxax/ABygmc+oIpVK9EGHVe0Ntx/1KQb9Ma7/KEhVENcplUjAglo58mspahG8DtBTkHiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIxcWu2y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIxcWu2y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 523431F000E9;
	Tue,  4 Aug 2026 11:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785844514;
	bh=coIU7jcTRYh8TsxuITfGu6ARlIC/VXMaZR2DxyiyzPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oIxcWu2y99P4rQc/uC/3CUBQ5RzfIUJ84DrUJ0djmU9aaaX3nrMYkttTFHP8h+kE9
	 Ynyydt+KQnea4u9AeqwBd7FhABm0DiXswKmTvia926cKifCGCTwgzNybXX4YkSBSVY
	 UfpWWT1mquEYHeu1QaK8VYjXSyibBDJ7iPQ4CsnOfwuz0yG+RHNMFvDEw+Ku2PGvC6
	 JdzTZ8SAslP0spRgBkHzVrGkUzNJStFS6KYwiQhDWbUbLEuZhxFTVYFdXA2jA0BXEl
	 f9FFsVHvkiGiX8sMDeDJyXKJZvDSIGHLglDGLx/YFV99PpMWSWC1w0oZLCha5GSOqZ
	 r6toiupvRBEdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/17] iio: adc: at91-sama5d2_adc: add condition to
 validate calibration data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804113338.261782-6-varshini.rajendran@microchip.com>
References: <20260804113338.261782-1-varshini.rajendran@microchip.com>
 <20260804113338.261782-6-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 11:55:13 +0000
Message-Id: <20260804115514.523431F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cancel_work_sync() in at91_adc_probe() error paths causes =
a Use-After-Free if the probe fails after an interrupt schedules the work.
--

--- Patch [5]: [PATCH v5 05/17] iio: adc: at91-sama5d2_adc: add condition t=
o validate calibration data ---
commit 380f9b2fd1800d246c63262001982d55d2628987
Author: Varshini Rajendran <varshini.rajendran@microchip.com>

iio: adc: at91-sama5d2_adc: add condition to validate calibration data

This commit adds an additional condition to validate the calibration data
read from the nvmem cell. It checks the tag of the packet to ensure the
data is valid before proceeding.

> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index 82db8f2f4db03..5b21367cf6b40 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -2297,7 +2297,8 @@ static int at91_adc_temp_sensor_init(struct at91_ad=
c_state *st,
>  		return dev_err_probe(dev, PTR_ERR(buf),
>  				     "Failed to read calibration data!\n");
> =20
> -	if (len < layout->min_len * sizeof(*buf)) {
> +	if (len < layout->min_len * sizeof(*buf) ||
> +	    buf[layout->tag_idx] !=3D AT91_TEMP_CALIB_TAG_ACST) {

[Severity: High]
This isn't a bug introduced by this patch, but missing cancel_work_sync() in
the error paths of at91_adc_probe() can cause a use-after-free.

If the hardware interrupt is left asserted by a prior boot stage,
devm_request_irq() unmasks it before the device is reset in
at91_adc_hw_init().

The interrupt handler at91_adc_interrupt() can then run, hit the touch sense
condition, and call schedule_work().

If a subsequent initialization step in probe() fails, the probe aborts:

drivers/iio/adc/at91-sama5d2_adc.c:at91_adc_probe() {
    ...
	ret =3D clk_prepare_enable(st->per_clk);
	if (ret)
		goto vref_disable;
    ...
vref_disable:
	regulator_disable(st->vref);
reg_disable:
	regulator_disable(st->reg);
	return ret;
}

This implicitly frees devres allocated memory without canceling the pending
work, allowing the work to execute after st is freed.

Should there be a call to cancel_work_sync() to clear the pending work in t=
he
error paths here?

>  		dev_err(dev, "Invalid calibration data!\n");
>  		return -EINVAL;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804113338.2617=
82-1-varshini.rajendran@microchip.com?part=3D5
