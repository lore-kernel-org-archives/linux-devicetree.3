Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAFF371867
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 12:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156127; cv=none; b=D0evjp8kGnbr0IF0fqyqopO0/HKaUPI/z4XqF/jeihW/9R8mIKVw0EW/ADUfro+ffODr91hZ/ByIEOEKZUz/1qOnMfLuLzL+xlA1YS0jqbSFWZOr0FAF7JfdCbSsawQT/vnJ/LHi82GzU8jvoSZ2D9l5UxQEDmviQPiSzVEND8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156127; c=relaxed/simple;
	bh=qoG64H/OvbdedjAkBcqBAEwQdtMsUr+GAWGPwjpNF24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eHHOS5o4vf88Bg3ZkD76A2Sl6Jwc5nn1x0kO28YFFO4aX+JX2faToyzWDic5o1CGIcbl4kjJ3PlBErQPuUjbuuBTBHbdf9KactILVjvLPtS43Dd4BorZsTdKsWMCykeQ4m34b1XUlVKez9N/CpBXDzsaxYMZkAHcNT/EqTVPfes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2FNLMhs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2FNLMhs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2F451F00A3D;
	Mon, 27 Jul 2026 12:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785156125;
	bh=YJmrItcPdcklCA6/cE4Ay0kYzcfzzkcRhV8Ft3azEAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L2FNLMhsAEo4V+3HQTFdNKo0m/5dEqckkxmOZbBxJ9mrU/RtsYe9WQV9RcCorsUci
	 zqUfakr/c+1ssk+UlAcGbbFt6FES4a8AsjAB5NLdQjtzUCd4nzbcbgFzNp3GPWPCWw
	 SgXPZToHbBBwbKPNgxeMvAYHMNxh/2uTRbs6vZ1ysYB1mSKHITtj7vnoJ+JLQYWmN1
	 P8HeJcxJD7C1CmREhjsgTVsBFIqItqRrlM9UyQZwfLqYVYyUwNb92Flq98x1+Kfgsl
	 6/PRjnhMwCJvPuABlU9jd5R/oj8c9bLU5O4j6Orratzz9tlY40XeyVhAxil+ZRYH+q
	 A8LE5tDSV7yag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/16] iio: adc: at91-sama5d2_adc: add condition to
 validate calibration data
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varshini Rajendran" <varshini.rajendran@microchip.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727122633.117435-5-varshini.rajendran@microchip.com>
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-5-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 12:42:05 +0000
Message-Id: <20260727124205.A2F451F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Invalid pointer dereference and kernel panic in the DEFINE_FRE=
E(nvmem_cell_put) macro error handling path.

Pre-existing issues:
- [High] Race condition during probe: IRQ is requested before the periphera=
l clock is enabled and hardware interrupts are masked.
--

--- Patch [4]: [PATCH v4 04/16] iio: adc: at91-sama5d2_adc: add condition t=
o validate calibration data ---
commit 9e92e8909ac4316dc3487b92319cfbc6db940b7b
Author: Varshini Rajendran <varshini.rajendran@microchip.com>
Subject: iio: adc: at91-sama5d2_adc: add condition to validate calibration =
data

This commit adds an additional check to validate the temperature calibration
data read from NVMEM. It verifies that the tag matches the expected
AT91_TEMP_CALIB_TAG_ACST value before proceeding.

> diff --git a/drivers/iio/adc/at91-sama5d2_adc.c b/drivers/iio/adc/at91-sa=
ma5d2_adc.c
> index 798e4d60bf697..15dc88f4961b2 100644
> --- a/drivers/iio/adc/at91-sama5d2_adc.c
> +++ b/drivers/iio/adc/at91-sama5d2_adc.c
> @@ -2297,7 +2297,8 @@ static int at91_adc_temp_sensor_init(struct at91_ad=
c_state *st,
>  		return dev_err_probe(dev, PTR_ERR(buf),
>  				     "Failed to read calibration data!\n");
> =20
> -	if (len < layout->min_len * sizeof(*buf)) {
> +	if (len < layout->min_len * sizeof(*buf) ||

[Severity: Critical]
Does the error handling path in at91_adc_temp_sensor_init() safely handle
nvmem_cell_get() failures?

Looking at the initialization of temp_calib earlier in this function:

drivers/iio/adc/at91-sama5d2_adc.c:at91_adc_temp_sensor_init() {
        ...
        struct nvmem_cell *temp_calib __free(nvmem_cell_put) =3D
                nvmem_cell_get(dev, "temperature_calib");
        if (IS_ERR(temp_calib)) {
                ...
                return PTR_ERR(temp_calib);
        }
        ...
}

When nvmem_cell_get() fails (e.g., returning -ENOENT), it returns an ERR_PTR
and we return early. This triggers the __free(nvmem_cell_put) cleanup handl=
er.

The cleanup handler is defined as:
DEFINE_FREE(nvmem_cell_put, struct nvmem_cell *, if (_T) nvmem_cell_put(_T))

Since the ERR_PTR is not NULL, the condition if (_T) evaluates to true,
passing the ERR_PTR directly to nvmem_cell_put(). Inside nvmem_cell_put(),
the pointer is dereferenced unconditionally, which can lead to a panic.

Should the cleanup macro be updated to check if (!IS_ERR_OR_NULL(_T)) inste=
ad?

> +	    buf[layout->tag_idx] !=3D AT91_TEMP_CALIB_TAG_ACST) {
>  		dev_err(dev, "Invalid calibration data!\n");
>  		return -EINVAL;
>  	}

[Severity: High]
This is a pre-existing issue, but is there a race condition during probe
between requesting the IRQ and enabling the peripheral clock?

In at91_adc_probe(), devm_request_irq() is called before the peripheral clo=
ck
is enabled with clk_prepare_enable() and before at91_adc_hw_init() masks
hardware interrupts.

If an interrupt is left pending by the bootloader, the handler
at91_adc_interrupt() will execute immediately:

drivers/iio/adc/at91-sama5d2_adc.c:at91_adc_interrupt() {
        ...
        at91_adc_irq_status(st, &status, &eoc);
        ...
}

This handler reads a hardware register while the peripheral clock is still
disabled, which can cause a hardware abort. Additionally, since the interru=
pts
haven't been masked yet, it might bypass the IRQ_NONE check and fall through
to the software conversion branch, dereferencing the uninitialized st->chan
pointer.

Can the IRQ request be moved after the clock is enabled and the hardware is
fully initialized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727122633.1174=
35-1-varshini.rajendran@microchip.com?part=3D4
