Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC6C2F8E98
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839928; cv=none; b=L2+T1AOTU16krkzsB5Z9TMGtq9YCmfD0xii75+VrAJ/oWe6rrMUSicrMdcbVninmB5hoHqbDFFpvjnII1UQbnRPBZBHVzKVkaIqRsOAZJMNRpdR57PsSgFKwSMmYf8dkVVL2irKUTwMKKaczC9JcvfcjMw5loJoarV6jHO/8vv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839928; c=relaxed/simple;
	bh=UHiNQkDHv8wjlhA0ze6zoBrzWqVkQOHL2jhXocdMtvM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=Knbwm0cEa+DZ6lUmDY1XjKP6BdgfOSszjpfM38MHrt29adBw5mnbM62yIi/D6sM5P0PiLPo7R0ouiJ08qOv9FFbhu1grFGlL6fYyADNMPu2YDtDCqDsnrHzy8aakt+91A4RVqC8IWIMv/FijYgtxUI0LjqjqQt+H7y4610rIpCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIpk6KfC; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIpk6KfC"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-59d07df448bso2953514e0c.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782839926; x=1783444726; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=et+bMtuvqXMHROGP40ev+0eIWN1zPUfHGM72srmr7dY=;
        b=nIpk6KfC8qoA4500PLSRdvczfmesN3j9Ptoyu/PB+907pX78ROeF/XsM2fdpfmhmEc
         IOECccQmcPaq7xQEq5PU/85542e7d9Or0mDMd6vJX4c3fB44HDIFcN1zZo0+YgqvZCn8
         iMLQy9k/Z1AmXpUhv6Avca9Ej+SoPuncQtDCPyDNlkzWf60yGsaGNOvow0lbC4tlAVLu
         KZ+ImmGe99hJxCipPe/SkvIkZTbbWwhSbjXTunc6hbIYBEUoX2IAwUGIHVQQvzdKuza4
         jXazOpTwAZ7y7hXXiFBhT32yoJhfjt76pAOegVQlpEW+IXckZux9Q9JsKpbBhis6o0id
         ymHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839926; x=1783444726;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=et+bMtuvqXMHROGP40ev+0eIWN1zPUfHGM72srmr7dY=;
        b=dTbmqxhJZON54qzpVwEDCpXgfAH1m7ih3ZbcP16cXRXaewrk0xYRR1QlC2kra/zafV
         6jtMpwULkSJBu2Xnm3SSQ0UhvEjJvX5i5nHDGKhwcE97rbZpBa/aEKgSOZ8y0ztUlrsm
         OC0NxYrYQgs2USNtjtzKSa/L9I9Zw3UkgoTkQNDvqIGipKGM2Gt2DiwliOgAFhfELV8D
         C45o4+R8CAoXhO1NExd0MC1CbB7+Msepab40s6e7IqEFNbjTO87CXTV5JXInGwtza8X6
         uTPop4eHShtVjgCHYZCBrpKf3R2xeIDWf90lmf9UoMjWbYeGnMrkIXg4OnakIa0Pnc18
         dCqg==
X-Forwarded-Encrypted: i=1; AHgh+RpeOb0dQCHSDr0nHBx5xBoY0cGwopzvYdrBmTzTYsxPB4kF+aBRZvdZznZL7QF0B8PVoJaQ0tIZatq0@vger.kernel.org
X-Gm-Message-State: AOJu0YzwbVbr8eYm95zgw/snTVzJuW7m4QnipqW32dUrn9H90R/w/3G1
	DCZrhyYmUtF4mGG22hKnbwq5gzfKrbCN41U7iDPDCut84GxgaBzcIVxe
X-Gm-Gg: AfdE7cnnKJvHEI1v4N8sGPRQIwVkZg/ZUKo0o57ja10zpa/KDU234dcxyfdsXB5KLUi
	20znrwKg6PDqV8rKIe9BYGbApC6o1eS3wDsVK8ePRqTg9i+U2R9bgLZrheGLn48AjTVqESQxizh
	MTxx8GiNJ8pWsg67nnqGtM1lU9ouOn2EH0lA19ks2O/kI3jqf+4iIakQ0LgwoT6oOYOnAyPS9UN
	+tPGs1x5GDKHKozlwFgcUI0XbUPUKOkCOaEbuD3pMY/v/1xAbwpBQAoNpOQkclOXnoZ6tYlBPhd
	rDSTDahz0oFgf2bhPXm7QBiJy2zt8UE9KajQLq393uwkoZv0rVPIiNXsj3gzexF6KEujpLdEKE1
	bqQ7+xFXXsMYQ+pxdRUnW5bD/1shZnDghhyPwq9dK+5U0NtxMpOaRgmQc91bhQhq4Rc0j7h1Ju1
	GUDHE=
X-Received: by 2002:a05:6122:488f:b0:5bd:73b5:6d2b with SMTP id 71dfb90a1353d-5bdcf383d61mr998917e0c.8.1782839926387;
        Tue, 30 Jun 2026 10:18:46 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc1846eb0sm1763358e0c.4.2026.06.30.10.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 10:18:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 12:18:38 -0500
Message-Id: <DJMK080GOMNP.1K9VX4CMRQKL4@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Kurt Borja" <kuurtb@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/7] iio: adc: ti-ads1262: Add excitation current
 support
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260628-ads126x-v2-0-4b1b231325ba@gmail.com>
 <20260628-ads126x-v2-4-4b1b231325ba@gmail.com>
 <20260630014723.786a8885@jic23-huawei>
In-Reply-To: <20260630014723.786a8885@jic23-huawei>

On Mon Jun 29, 2026 at 7:47 PM -05, Jonathan Cameron wrote:
> On Sun, 28 Jun 2026 00:36:05 -0500
> Kurt Borja <kuurtb@gmail.com> wrote:
>
>> Support the two IDAC excitation current sources. Each channel can route
>> its IDAC1/IDAC2 outputs to a pin via the "excitation-channels" property
>> and select a magnitude via "excitation-current-nanoamp".
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>>  drivers/iio/adc/ti-ads1262.c | 78 +++++++++++++++++++++++++++++++++++++=
+++++--
>>  1 file changed, 76 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
>> index ece97a0c2b1304ad..8921eaae537f6b0a 100644
>> --- a/drivers/iio/adc/ti-ads1262.c
>> +++ b/drivers/iio/adc/ti-ads1262.c
>> @@ -193,6 +193,22 @@ enum {
>>  	ADS1262_INPMUX_LAST
>>  };
>> =20
>> +enum {
>> +	ADS1262_IDACMUX_AIN0,
>> +	ADS1262_IDACMUX_AIN1,
>> +	ADS1262_IDACMUX_AIN2,
>> +	ADS1262_IDACMUX_AIN3,
>> +	ADS1262_IDACMUX_AIN4,
>> +	ADS1262_IDACMUX_AIN5,
>> +	ADS1262_IDACMUX_AIN6,
>> +	ADS1262_IDACMUX_AIN7,
>> +	ADS1262_IDACMUX_AIN8,
>> +	ADS1262_IDACMUX_AIN9,
>> +	ADS1262_IDACMUX_AINCOM,
>> +	ADS1262_IDACMUX_NO_CONN,
>> +	ADS1262_IDACMUX_LAST
>
> _LAST usually means inclusive. So probably call this NUM or something lik=
e that
> to show that it should be one more than last value.
>
>> +};
>
>> @@ -450,7 +468,7 @@ static int ads1262_dev_read_by_cmd(struct ads1262 *s=
t, u8 cmd, __be32 *val)
>>  static int ads1262_channel_enable(struct ads1262 *st,
>>  				  struct ads1262_channel *chan)
>>  {
>> -	u8 mode0, mode1, mode2, inpmux, refmux;
>> +	u8 mode0, mode1, mode2, inpmux, idacmux, idacmag, refmux;
>>  	int ret;
>> =20
>>  	/* Avoid using guard() here to mitigate AB/BA deadlock warning */
>> @@ -464,6 +482,10 @@ static int ads1262_channel_enable(struct ads1262 *s=
t,
>>  		FIELD_PREP(ADS1262_MODE2_BYPASS_MASK, chan->pga_bypass);
>>  	inpmux =3D FIELD_PREP(ADS1262_INPMUX_MUXN_MASK, chan->input[1]) |
>>  		 FIELD_PREP(ADS1262_INPMUX_MUXP_MASK, chan->input[0]);
>> +	idacmux =3D FIELD_PREP(ADS1262_IDACMUX_MUX1_MASK, chan->idac_mux[0]) |
>> +		  FIELD_PREP(ADS1262_IDACMUX_MUX2_MASK, chan->idac_mux[1]);
>> +	idacmag =3D FIELD_PREP(ADS1262_IDACMAG_MAG1_MASK, chan->idac_mag[0]) |
>> +		  FIELD_PREP(ADS1262_IDACMAG_MAG2_MASK, chan->idac_mag[1]);
>
> This presumably feeds into the discussion of locking that you were having
> with David, but I'd find this a lot easier to read if these were just
> above where the values are used. Then we can clearly see the match betwee=
n
> masks and fields.  If you have to do it like this, then add variables up
> here for the masks as well.

I'll move them above each regmap calls after reorganizing the locking
stuff.

>
>
>>  	refmux =3D FIELD_PREP(ADS1262_REFMUX_RMUXN_MASK, chan->reference[1]) |
>>  		 FIELD_PREP(ADS1262_REFMUX_RMUXP_MASK, chan->reference[0]);
>>  	mutex_unlock(&st->chan_lock);

--=20
Thanks,
 ~ Kurt
