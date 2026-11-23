Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425445;
	b=rW2/2eC8aMLEYbeoONIXJC1e6McZN20mcfANfZcwBvsC2uJp3rauWyck6DroMYhZs291
	 S8hMW5vM+iqGAn4yQFfet4ZdKygmtpuF+/E4R0bCgOR02KgYiWJimBrsU/AobZW2EgTsZ
	 ogY4e4/LF49CvX1YU4eVeRcKR3oRWb5V2Fm87QTCGQx1Sf7nFFmeaLF4ZtLC9FmtqE/ZI
	 ZnSflMbqajJ+5t9Ss8BvYSFWh5NSKF9ITH05xGpgbK1CYdB/g8ARoZN+dKYt7w/O6lswl
	 49pukvHvI4CmarU/Dxd4y1H/2lj6JOXJssXPERWn8Zaa8wuL02vOlUmcm6L2K35eJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=bfZwdrHDy1GNoA44s3G+1XzXoMHIKEYDGfkc9JfB56s=;
	b=F9Dx8bwrMOywlG7wg4sIg5jIDDSrqXXYOGUxsVRahqe2vOf8No+5qsbcLAHDL4kMIGsd
	 cnonMnh7ZSLjGeBJUM9T/uqao8hFA1hG2XOdXE/rD5yHXwL6z3ZVKf1x8Cua2XFuP8GRr
	 4bpwW25JwvItSYp+c5PXwLjwATlk6lgYVKvv3FjUmUZSHJU5gb0GetpquVkvU8jG7hOWP
	 +r57yiqUzQ1lTfH7YhWBQhz0RO0dcMmDb1GJXLDqVdak8d0bkAXAoCv7qZID5pkKhpsu4
	 RyHS6XYgiMg/0m0lh7whwAlIMUCYttes3YA6oYvxPKgYfiBpZ00Fuot1lM7e05RWdVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=mRpGJUoU;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6FA606A31F
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 09:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE6FA606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=mRpGJUoU
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c4d581da0aaso392248866b.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 01:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795425442; x=1796030242; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bfZwdrHDy1GNoA44s3G+1XzXoMHIKEYDGfkc9JfB56s=;
        b=mRpGJUoU5NoqyhwJ0w8OwZQIUnCDN/5fpynpyGn9jzsx1jYEwfaQR/bW/LIbuTv4FP
         HtCOvcQfOBTtQbUygTRXF6/17BZUC/CCtQwrLOvg9292Pv6dsoD7zDbaCvIJT/zRcRxO
         MbIKHbJ1QOBg8Wys2xzfQCj1lY6QfqsTffezatDUGaY2lnhxi2IxR+XFTONEr778NfoU
         UyNZzn7nVB5bVPZcpv2HM9L62dtivuQJ2UJ2jenxhlPTqevL0prFen/4YMwDGWNGpHSx
         IowKIORJ7A0BzCLXZe3ybGG6jO1ZdM8muAingKU/H0QnXL7koAD1dNCNemRlfty9Q4Df
         o5dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425442; x=1796030242;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfZwdrHDy1GNoA44s3G+1XzXoMHIKEYDGfkc9JfB56s=;
        b=kYNSQBj4F/A92jvI7EUeZotydn29f7VXBUxxRf3wHLVGDasj1V5eCnn3ui9QT8S6of
         mO0cuv1t2L0siKAc0tZ+3SRCPztHua69S1gRzmPkDTc9EKNtXsyCpNafSBC76y/k99+6
         ZYvVlqaJRXvUYZxQJaS/jVTE111bACG/0LHRL7wC+sLtGlazyYd4H4+u9Lvr3/v0oKz4
         ynVPBiYSOROKCGoP/rUETJD7EMsLD7V+oEflUsj8TjXqcRtViMftppY49TftppfIttBE
         yosuAvj+inbxwr7acYLC8eXsB1SyW2vvobW6/bSgn2fUQ8a7BKGSA9evO0N3eA8Luohy
         6fuQ==
X-Forwarded-Encrypted: i=1; AL+hErFamiArlpqoov5nSp3TeKDac6McZ79ZgsGVVKB5+JzxgXVfMUbbr/XpaQJbvN7WHqJRiBNE+Pau5uUB@vger.kernel.org
X-Gm-Message-State: APuU4Z9SnQ83/ZOTth1/jiOmLUYNNVeaOYqs7ZrT64/Tjh0KrHoTYKeM
	QpbVuJNdI+a5u9PpdUdcCN2Ifl5IoP5w5j51kkAvSBiJi98jj06EdS+oWmpb5NWWAro=
X-Gm-Gg: AZFdTZcWvVq798gFQDnUxri8+UVxYTNl+PMcKAOYMmp8uvZjhpRkNUuqyASh5lwgB8O
	vUnaP97qQXERbAAenkLjg16rS3eft1KUsD8jp7CE4YNQoC5lTq3S3ziH1LH7xQCKcWf3XAv6A/n
	Ufxj5vieX7mgDm3lHbyj/iqP+roN3lf+QeeRAEtna+xQ6i11MAmNiCefpvKLcBbUU8MED5VVvbc
	mtrRtoS2mUFTdE3waOY4+chsZVGxQ4Jup3+DSBrksQ1ZavTHAL1/rsVjS/BnP4oh+ajqqCNd5QJ
	3svLCin7+Os2IVjHeECJsiUdFlHPblg3aY5pi1x/avSGHV5nbbD2NUZW9s0S4PxX/lebBoffA/h
	Qa4IB4htJNO+8GIxQ4jsRJn0ZL31VJ+0XkagEDRWUqrXG7RXOZhNhguO8m4umNX9jG5CQ7TA795
	i2G+TOZz6dL/ctajky0DFdm0a2pfZstUnoNzVMEAwJt0wH6dOWv/6iuZD9emyMAKAaCR2pxt6MB
	CvgcX90A9/SWo2tyDn4iZoHmCjW/pziqnIsWZxYxGHdf2ECDQpEtHN9SWxXIpNHAOWfznePw0il
	89vCMD4eQiGsYxg7Bv5f9XrFKH+6JmbIaVAS9+I9MNIhKAd59Bf3htl2YOIcrlFiUyzIwI+FkQ=
	=
X-Received: by 2002:a17:907:3cc7:b0:c2e:2d8c:4585 with SMTP id a640c23a62f3a-c513ab4cd0dmr859651666b.36.1795425442222;
        Mon, 23 Nov 2026 01:17:22 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afca58asm371207466b.65.2026.11.23.01.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:17:21 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 10:17:21 +0100
Message-Id: <DN2H797ASILD.3P89IOZH1IU1H@fairphone.com>
Cc: "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz
 Luba" <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Laxman Dewangan" <ldewangan@nvidia.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Hans de
 Goede" <hansg@kernel.org>, "Jens Reidel" <adrian@mainlining.org>, "Casey
 Connolly" <casey.connolly@linaro.org>, "Val Packett" <val@packett.cool>,
 "Daniel Lezcano" <daniel.lezcano@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-iio@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/5] iio: adc: qcom-spmi-adc5: Add battery thermal
 channels
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261117-bat-temp-adc-v4-0-14d5d309ebfa@fairphone.com>
 <20261117-bat-temp-adc-v4-1-14d5d309ebfa@fairphone.com>
 <20261122031305.0fdc69cd@jic23-hlaptop>
In-Reply-To: <20261122031305.0fdc69cd@jic23-hlaptop>

Hi Jonathan,

On Sun Nov 22, 2026 at 4:13 AM CET, Jonathan Cameron wrote:
> On Tue, 17 Nov 2026 09:23:11 +0100
> Luca Weiss <luca.weiss@fairphone.com> wrote:
>
>> Add the BAT_THERM channels with millivolt as output, which can then be
>> used along with information regarding the NTC in the battery, to get the
>> actual battery temperature.
>>=20
>> A static lookup table in the ADC driver won't work since different
>> devices have different Ohm and Beta values in their battery NTCs, for
>> example a NTC can be 10kOhm & B=3D3435K.
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> Given this is independent of the following elements other than
> the dtsi changes, do you want me to pick it up now?
>
> You may need to use numeric values in dtsi until the header
> catches up then chase with a patch flipping to the defines next cycle.
> That's how we normally avoid that dependency slowing things down.

Sounds good from my side. Thank you!

I think realistically, there's no other option than what's implemented
in this patch, even if PATCH 2/5 (dt-bindings change for generic-adc) is
not reviewed yet. But I hope the dt maintainers will be okay with that
as well.

Regards
Luca

>
> Thanks,
>
> Jonathan
>
>> ---
>>  drivers/iio/adc/qcom-spmi-adc5.c         |  6 ++++++
>>  drivers/iio/adc/qcom-vadc-common.c       | 16 ++++++++++++++++
>>  include/linux/iio/adc/qcom-vadc-common.h |  3 +++
>>  3 files changed, 25 insertions(+)
>>=20
>> diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spm=
i-adc5.c
>> index d57ba8526e0c..24ac84580570 100644
>> --- a/drivers/iio/adc/qcom-spmi-adc5.c
>> +++ b/drivers/iio/adc/qcom-spmi-adc5.c
>> @@ -542,6 +542,12 @@ static const struct adc5_channels adc5_chans_pmic[A=
DC5_MAX_CHANNEL] =3D {
>>  					SCALE_HW_CALIB_DEFAULT)
>>  	[ADC5_XO_THERM_100K_PU]	=3D ADC5_CHAN_TEMP("xo_therm", 0,
>>  					SCALE_HW_CALIB_XOTHERM)
>> +	[ADC5_BAT_THERM_30K_PU]	=3D ADC5_CHAN_VOLT("bat_therm_30k_pu", 0,
>> +					SCALE_HW_CALIB_THERM_VOLT)
>> +	[ADC5_BAT_THERM_100K_PU] =3D ADC5_CHAN_VOLT("bat_therm_100k_pu", 0,
>> +					SCALE_HW_CALIB_THERM_VOLT)
>> +	[ADC5_BAT_THERM_400K_PU] =3D ADC5_CHAN_VOLT("bat_therm_400k_pu", 0,
>> +					SCALE_HW_CALIB_THERM_VOLT)
>>  	[ADC5_BAT_ID_100K_PU]	=3D ADC5_CHAN_TEMP("bat_id", 0,
>>  					SCALE_HW_CALIB_DEFAULT)
>>  	[ADC5_AMUX_THM1_100K_PU] =3D ADC5_CHAN_TEMP("amux_thm1_100k_pu", 0,
>> diff --git a/drivers/iio/adc/qcom-vadc-common.c b/drivers/iio/adc/qcom-v=
adc-common.c
>> index b03cf584b165..101b3c724f8d 100644
>> --- a/drivers/iio/adc/qcom-vadc-common.c
>> +++ b/drivers/iio/adc/qcom-vadc-common.c
>> @@ -309,6 +309,10 @@ static int qcom_vadc_scale_hw_calib_therm(
>>  				const struct u32_fract *prescale,
>>  				const struct adc5_data *data,
>>  				u16 adc_code, int *result_mdec);
>> +static int qcom_vadc_scale_hw_calib_therm_volt(
>> +				const struct u32_fract *prescale,
>> +				const struct adc5_data *data,
>> +				u16 adc_code, int *result_mV);
>>  static int qcom_vadc7_scale_hw_calib_therm(
>>  				const struct u32_fract *prescale,
>>  				const struct adc5_data *data,
>> @@ -333,6 +337,7 @@ static int qcom_vadc7_scale_hw_calib_die_temp(
>>  static const struct qcom_adc5_scale_type scale_adc5_fn[] =3D {
>>  	[SCALE_HW_CALIB_DEFAULT] =3D {qcom_vadc_scale_hw_calib_volt},
>>  	[SCALE_HW_CALIB_THERM_100K_PULLUP] =3D {qcom_vadc_scale_hw_calib_therm=
},
>> +	[SCALE_HW_CALIB_THERM_VOLT] =3D {qcom_vadc_scale_hw_calib_therm_volt},
>>  	[SCALE_HW_CALIB_XOTHERM] =3D {qcom_vadc_scale_hw_calib_therm},
>>  	[SCALE_HW_CALIB_THERM_100K_PU_PM7] =3D {
>>  					qcom_vadc7_scale_hw_calib_therm},
>> @@ -583,6 +588,17 @@ static int qcom_vadc_scale_hw_calib_therm(
>>  				 voltage, result_mdec);
>>  }
>> =20
>> +static int qcom_vadc_scale_hw_calib_therm_volt(
>> +				const struct u32_fract *prescale,
>> +				const struct adc5_data *data,
>> +				u16 adc_code, int *result_mV)
>> +{
>> +	*result_mV =3D qcom_vadc_scale_code_voltage_factor(adc_code,
>> +				prescale, data, MICRO / MILLI);
>> +
>> +	return 0;
>> +}
>> +
>>  static int qcom_vadc_scale_hw_calib_die_temp(
>>  				const struct u32_fract *prescale,
>>  				const struct adc5_data *data,
>> diff --git a/include/linux/iio/adc/qcom-vadc-common.h b/include/linux/ii=
o/adc/qcom-vadc-common.h
>> index 3bf4c49726a7..7586016ff14d 100644
>> --- a/include/linux/iio/adc/qcom-vadc-common.h
>> +++ b/include/linux/iio/adc/qcom-vadc-common.h
>> @@ -93,6 +93,8 @@ struct vadc_linear_graph {
>>   *	voltage (uV) with hardware applied offset/slope values to adc code.
>>   * @SCALE_HW_CALIB_THERM_100K_PULLUP: Returns temperature in millidegC =
using
>>   *	lookup table. The hardware applies offset/slope to adc code.
>> + * @SCALE_HW_CALIB_THERM_VOLT: Returns voltage in mV of a temperature c=
hannel.
>> + *	The hardware applies offset/slope to adc code.
>>   * @SCALE_HW_CALIB_XOTHERM: Returns XO thermistor voltage in millidegC =
using
>>   *	100k pullup. The hardware applies offset/slope to adc code.
>>   * @SCALE_HW_CALIB_THERM_100K_PU_PM7: Returns temperature in millidegC =
using
>> @@ -114,6 +116,7 @@ enum vadc_scale_fn_type {
>>  	SCALE_PMI_CHG_TEMP,
>>  	SCALE_HW_CALIB_DEFAULT,
>>  	SCALE_HW_CALIB_THERM_100K_PULLUP,
>> +	SCALE_HW_CALIB_THERM_VOLT,
>>  	SCALE_HW_CALIB_XOTHERM,
>>  	SCALE_HW_CALIB_THERM_100K_PU_PM7,
>>  	SCALE_HW_CALIB_PMIC_THERM,
>>=20


