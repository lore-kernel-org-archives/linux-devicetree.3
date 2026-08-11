Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE29C3B47E5
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786480133; cv=none; b=R6P3SCgBYhGmuy2v77lq/52pVr99fMhaZBBPu3BSPgh9DrqW+aNNfyaixQfw97rqs2kQPTKYoWXKLHkO+Rheq/E1MYrC3+SUkIuR4iZUf96FwsuD562BE0o++KPSCuZnq3XsGXyXl4uPXGiSYA1P96/X/1nW2k8a2PxAMRAbtm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786480133; c=relaxed/simple;
	bh=lI2QGJvbe3CjRmuPMTU8qeofdrk0TWrINJP2FGbyrLw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=WlMoyNqe0sYA0mC5naOURwD5NV0CbgQM+S6V1kM7tAzOWbgkA2j8m4ReXFH7W+ki5Dp5JS25G8KNE9GQNkN7fXuLV0lxAnkBUN+cA3GLYOm8XGuUnwvbr4dEQcO13GnUca5CG1x/lYYzkhRvmYX6Urt/zOHiR3dcfDUAldRW554=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxx6G3L8; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxx6G3L8"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-74ab99038afso120228137.3
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 13:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786480130; x=1787084930; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TMimpYcHZOGUhj+cUm9F57rlFMmPijLi6RHPAwT1cVs=;
        b=mxx6G3L8jbZOTpMoLcQEuiD6D/TxC7AWlFnsVjWgeIYXQlmyPkm0+Wze8E4e14y+U5
         ISUhpbjN4CTtLiM/FA3rC0GkdKcPtZnGoGeHn1z1kBDiZWeif9pwWqtoZFIDpoZWa9kb
         Qgrq1F2rU9IvMZvYhjxpLA7eB46X0Zy79uq/g1ESpKkG/OUWt0M66IPsw4zYc/dO4vdz
         zL6NZPEXcRGHxRUf2+dCIO2kuI3TxIGdzgy1jqTZsSJWerATYf5sZiEqR5GjqLARkhHB
         mRdtyAmYbmDFP1hfcSctDCLyL8FUKMK4FQgSCOdvzXSbO0hBN1vQoRT+h3zXZFcAPyof
         radA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786480130; x=1787084930;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMimpYcHZOGUhj+cUm9F57rlFMmPijLi6RHPAwT1cVs=;
        b=S18dw6Ir6TW4Cfw6WK0iWHnbSKpWdJVbzUsZgJtlRUsjrz0P7+Gbd1put4wvoxvH7/
         3R99i1GrRUc8HNx3KuCvG4qOf7Unxl5/zsffwSRLHJtg7DAfUol7ZeP8YMVZ01vuQnEQ
         XbNBrzDwTWuYPqpAADaRtg1xuEEx65H5f0MT64iepZf927qFagQJVhLPrA0pbVfC4oXS
         Qc1AvaimeWNQCFeOmLHEwUl3gNaPZCr0odjjZPMPp4sDvl+sWQogtkXaw8HW0UZePt2J
         1EcAw8hg7SIDS2t9UW2pWm0sZGbwj4FwP65WoLZNV6apVskrjKIfxsb+GS7/SgFa0ZEc
         3jOQ==
X-Forwarded-Encrypted: i=1; AHgh+RokUMLvQ5sifxvkPJOFoSI/+4aZh4gXJfaIoD0uElX1/kfya6eKEyIsAeMrd1zjm7uVSJY6BtP7t2xp@vger.kernel.org
X-Gm-Message-State: AOJu0YzBwKVveWzVKwrGp5iiBIdPpmNzKrddH5Npc538rsa93BgNJAx+
	uIJ/xhciDItWjHffRZvMn7kT3LEqb56wS1Cahp41QRvYBYySV1kmmijg
X-Gm-Gg: AR+sD10cNadKkovpU/6NT70HR3KCbHaoU2Atdf+dzxK0xWE3qJITQZGQ4HFtjRNHgS7
	EVtvWYGFSSXFITgXKS2ouSm1Uk9NOOj/YInJQlInRuKY4FxpjycXfQzZJbOlxA48ZrM7F7ApEOY
	nNdYXpVwZkU2toSXDwnQsVXQmlVqktXfCMDFF2rba+mG9rg67vnyfijCN3uAmCB8OybU2ZBX3Oh
	y04KvZVycwb0JGBha4kFPHlDI5//9CJ/KjJEWtKN7ubYb73Hs9Qf6IzFUpv/dtGEoLQwhYXm0Ey
	6aH7MpfHpU7/kpgkVeeCaqVvJYmLrWLBK2QU/m1Rg4jcxFUcliUE/0ndOUgZQc3Nal6X9WiaMLh
	8A4DKyjXQjkuuy/cOt6Si40BK19nDks/kYGy3H/+IPUY/qBS3bY5bqK36G36e+geLPaT0lm4LVf
	dK3HXaFb+VK8+oevx+OhDV0o+IjN+CaKOONI/EuqYk4QeRSeWJ/9M7
X-Received: by 2002:a05:6102:4426:b0:726:8813:2085 with SMTP id ada2fe7eead31-76c0c4ec337mr934146137.13.1786480130595;
        Tue, 11 Aug 2026 13:28:50 -0700 (PDT)
Received: from localhost ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97a3c16f5bbsm593975241.5.2026.08.11.13.28.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 13:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 15:28:47 -0500
Message-Id: <DKMECOTJYOZE.3AEGK7RWPH7FW@gmail.com>
Subject: Re: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "David Lechner" <dlechner@baylibre.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Jonathan Cameron" <jic23@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Cc: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-2-f89925d72792@gmail.com>
 <ad95afb4-e667-4290-8878-fdd7067f20fe@baylibre.com>
 <DKK9QWYHOBOT.2VD8XMZTE65H4@gmail.com>
 <7a42a318-780d-4bd0-baf1-55d030b39233@baylibre.com>
In-Reply-To: <7a42a318-780d-4bd0-baf1-55d030b39233@baylibre.com>

On Mon Aug 10, 2026 at 11:42 AM -05, David Lechner wrote:
> On 8/9/26 3:26 AM, Kurt Borja wrote:
>> On Sat Aug 8, 2026 at 1:39 PM -05, David Lechner wrote:
>>> On 8/7/26 10:58 PM, Kurt Borja wrote:
>>>> Add the ti-ads1262 driver with initial support for the primary ADC
>>>> (ADC1). The ADS1263 auxiliary ADC (ADC2) is handled by a separate driv=
er
>>>> and interoperability considerations were taken into account.
>>>
>
> ...
>
>>>> +static int ads1262_dev_reset(struct ads1262 *st)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	if (st->reset_gpiod) {
>>>> +		ret =3D gpiod_set_value_cansleep(st->reset_gpiod, 1);
>>>> +		if (ret)
>>>> +			return ret;
>>>> +
>>>> +		/*
>>>> +		 * The RESET pulse timing requirement is 4 clock cycles, at the
>>>> +		 * minimum clock rate this is 4 microseconds.
>>>> +		 */
>>>> +		fsleep(4);
>>>
>>> How long do we have to hold reset before the chip powers down?
>>=20
>> For power down 65536 clk cycles. Less than that is simple reset.
>
> How long is 65536 clk cycles in microseconds at the fasted clock rate?
> Hopefully won't accidentally shut down the chip here even if fsleep()
> goes significantly longer than requested.

That would be 8192 microseconds. Do you think there is a risk we end up
turning off the device?

>
>>=20
>> [...]
>>=20
>>>> +static int ads1262_wait_for_conversion(struct ads1262 *st)
>>>> +{
>>>> +	u64 max_lat_ms;
>>>> +	long ret;
>>>> +
>>>> +	/*
>>>> +	 * The first conversion latency is affected by the channel's data ra=
te,
>>>> +	 * filter, the configurable conversion delay and whether chop mode
>>>> +	 * and/or IDAC rotation mode are enabled.
>>>> +	 *
>>>> +	 * The worst possible latency is calculated by taking the lowest dat=
a
>>>> +	 * rate (2.5 SPS) and the sinc4 filter. This gives a latency of 1600=
 ms
>>>> +	 * (Table 9-13). Then we scale it by the actual clock rate and multi=
ply
>>>> +	 * by 4 to account for chop and IDAC rotation modes (Equation 20).
>>>> +	 */
>>>> +	max_lat_ms =3D 4 * div_u64(mul_u32_u32(1600, 7372800), st->clk_rate)=
;
>>>
>>> These are constant values, so don't need mul_u32_u32(). Also, given the=
 wide
>>> range of possible sampling rates, I would include the current sampling =
rate
>>> in the calculation. No need to wate 1.6 seconds for something that shou=
ld
>>> take a few 10s of microseconds.
>>=20
>> Can we leave it like this until I implement the settlingtime? That way I
>> can calculate the actual first conversion latency.
>>=20
> Sure. Just maybe mention it below the --- in the comment message on the
> next revision to remind us.

Sure!

--=20
Thanks,
 ~ Kurt
