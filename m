Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843833;
	b=rjexdxOWIZRO5jtRX5XCVUmqzUAlOrxR/3HU6/Ga0eGT/Bak+tv1sxyhAu0qythRfNwy
	 YV7+88tOzigUqsHZSHjBrX9gnijEwlQCzXhOjxL/vq13IgKdb1g69JT73SK6LLsVpc6a+
	 HGJh0LHa3qyfdOUxi8aQIV2vB4YoVWgJjHohEqDEuIY/JVMqf0tTO8zoiHO19fbBx+pmI
	 iZ/UupEGf/Dqg1Otae24yASRuJAgMZF5I1XlaJ0R8Xg8fqZKWcliQ0B1RkIWdS7w7b1J5
	 shBqMtr7OAvP/+hnwi2XiXnEcTCXPt2jMO/xV1OUDIXkxc3O0QMOmsgaXthpO5QYnfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
	b=YSM9fu35YDaG5zh6hS0ZgUgoSyVjhzbCP2sF2oYwUBghuijSOBu5h5QDzrTm52OnL90H
	 O8ZCJkfCnlyMij9a8PER/UddAjqKJYO0QpRbDxwFrGeBYTxV3oQB7ih1nNQXa+Qaf5OnE
	 16ONNYg6rgcC1ZothjNPmqPO3jzAoV3dh9ylj66Nu2H8d+bD+sKQ80mBAz9UqiK6dRFRP
	 MEShvc5XFXHmIJ/iiSx1pzYrq9nivqlzfrpBvgdr9p8NIOpY5KNrSiSge8Hvrh4dstlCd
	 3oR0DKBDu83PXGn6v7WKPjSoCLyERikOoeNs3pmWY8wuEZsM+TvsfjYuCrXS7IdzpQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=l5yFnpD8;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688AF606A329
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:43:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 688AF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=l5yFnpD8
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso5101960a12.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 07:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794843831; x=1795448631; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
        b=l5yFnpD8es3PZ8hErhgAyB6jNHgRJQL2UrqaB+35VDA03JWtWhtFRjub4w8iKrO77e
         FcXuh9bolv6SYa88Apk3Cj+9S5ZwpsJlBdiFSEej53nktGjQ0LAsYndjgYq4DB2bD0yl
         Nyiy5scYIfhVrAS4QNSBaNJydK3icLZBN4M0F1B1L6Waj2/CbMjaV0UG6L7lgr8aVaGD
         pXTH8mr0Uek6+QgkGZxJY+7f0zkWMqOFQHSdN9vHIUiEuWSmJok/yRbEEZJRUESbTGNj
         3zjw9jYFXIMQVSV2tbewdyiO4fsAHVQXDakxoF3J1EzoW4EzlIXY/FZ/rBxt0ZFpDLkw
         9Hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843831; x=1795448631;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1bL8r5cuvqq5fGscdKSHB0SmDxdHtxTFoTFxEiXAMqo=;
        b=zoOnaF+Vqf1H67wkX0SdswbpJlhb1ZWvDgu+2DFdRvpPwRU1HQCoi3jUhfkax90Alq
         eRDr2N2yCGM7wX+/TTcLe4/F2c57E5zZwDY+lcmX7pR64wV79/4Pdr51XyfkbRYMpQM8
         uQvrPEQagpsdT9Xo14ZVhoIg2A1p+1y4WEw8ZOtpz30r1OvwaAKGixRyCn+SC4yKFQ9p
         h+/R5qZdUrXi1nQhQWQgVDNv3C8MbMeKGPO6OJydDqKTuqfezj+SGOIalyrRRnoRquCX
         D5b4vj8xqfNoX8k4Ain6P6xpYJE8UcghVKcjgpBQdRs9gq7C+cznhiNKT52m488/8sDN
         Ov8A==
X-Forwarded-Encrypted: i=1; AL+hErGVD4I93sLVh7VFF+/uMnbZQakEcir4A5GwZM6/SsXEAjltQ4LSgEqO40tYTGE1a8IlgDQu8ByGJi74@vger.kernel.org
X-Gm-Message-State: APuU4Z/S2G0Cr1SX5sBXV8VIbcgObUxOxetWIcJD8L4+1hFZ1FwLilaM
	lQ3/3VHQ/tnRbNbeBDK/Lm8pM+mxtD7fnV4joNX64uZml7zO8QQ78HHmlcuysJEUE4g=
X-Gm-Gg: AYBFou0n7och6rn3GQZmGzKxgmqSCdJ906lFuzfbWV8Ct1O2MXURLJVFC4M3MkxTCGE
	ufVe1cTnBXq5A6SrlQuCvWsMI4/pwZ0odN2RYjifpB2O97VFSfEn7XgJfbLEWcpQvs0J3UX9q6b
	CsWTkbFyQNXpthG24bbumsQE7RG3Pefm0kdvymNn++dsBQ6sqoNQFDRqTVxGrFsvm0wOrwL3Kv1
	ro56fYrwbV0pxcADjwfJVV71++Eb/dh6YF+dYZgU599oW/G+Oo+s1Bwy+adq7NKrXkmdTdsIH6z
	kknTHtDYu76AddBVGjlGEhCU373pciDE/9rrpUozA5W3Q6zxptMMGd9MbNjyN2BaKdu2PdCPe32
	Sa/Y7SFkpqDPu8Fh0VFQM72FthgVN0kEnsLZsHMFz7kUotangQCRCmmzlPmNbkr965anCyIWg1W
	SlPRxpBg36eBHTfOB9Mhn4uGKIIdfwFxQv+xGolksN5NUut6vc/z5P/F1fHmX4zkmaaVa3zyhxQ
	8rsiATnymhMtAcC9znfG++/Em5lbtxDX70R5SNahWQcUnVJlhbTguZ8oVSzYDIigj7MJkBuvgSL
	wZnBIytssFkp/YHSMt9MOEgRYUFTL8Korl8/PYFGoOyHuoTMSy4ZA2WjotuQvKuHn0ZTkUAIhw=
	=
X-Received: by 2002:a17:907:9305:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c50963d50e5mr844840566b.16.1794843830845;
        Mon, 16 Nov 2026 07:43:50 -0800 (PST)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b40918sm439294866b.39.2026.11.16.07.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 07:43:50 -0800 (PST)
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
Date: Mon, 16 Nov 2026 16:43:49 +0100
Message-Id: <DMWR1CJJRHMF.33YRRRDXPMBDW@fairphone.com>
Cc: "Jonathan Cameron" <jic23@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba"
 <lukasz.luba@arm.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
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
Subject: Re: [PATCH v3 1/5] iio: adc: qcom-spmi-adc5: Add battery thermal
 channels
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Luca Weiss"
 <luca.weiss@fairphone.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-bat-temp-adc-v3-0-743979a8fd90@fairphone.com>
 <20261113-bat-temp-adc-v3-1-743979a8fd90@fairphone.com>
 <avc5rnvIAEmZbyE1@ashevche-desk.local>
In-Reply-To: <avc5rnvIAEmZbyE1@ashevche-desk.local>

Hi Andy,

On Fri Nov 13, 2026 at 5:24 PM CET, Andy Shevchenko wrote:
> On Fri, Nov 13, 2026 at 04:56:42PM +0100, Luca Weiss wrote:
>> Add the BAT_THERM channels with millivolt as output, which can then be
>> used along with information regarding the NTC in the battery, to get the
>> actual battery temperature.
>>=20
>> A static lookup table in the ADC driver won't work since different
>> devices have different Ohm and Beta values in their battery NTCs, for
>> example a NTC can be 10kOhm & B=3D3435K.
>
> ...
>
>> +static int qcom_vadc_scale_hw_calib_therm_volt(
>
> This is broken indentation. Was `clang-format` being used to achieve that=
?

This is how the rest of the file is formatted, I didn't deviate from
that.

>
>> +				const struct u32_fract *prescale,
>> +				const struct adc5_data *data,
>> +				u16 adc_code, int *result_uv)
>
> result_uV

As Sashiko pointed out, this is labelled wrong, the result is millivolt.

The rest of the driver consistently uses "mv" for that, should I deviate
and use result_mV?

>
>> +{
>> +	*result_uv =3D qcom_vadc_scale_code_voltage_factor(adc_code,
>> +				prescale, data, 1000);
>
> 1000 is odd, can you use something from units.h or combination of those
> to show what this multiplier is for?

This is converting microvolt to millivolt.

Shall I use "(MICRO / MILLI)" as used in plenty other drivers? Two
drivers in the tree also have "#define MILLI_TO_MICRO 1000"

Regards
Luca

>
>> +	return 0;
>> +}


