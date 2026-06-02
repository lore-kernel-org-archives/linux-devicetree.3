Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163123FE35C
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410838; cv=none; b=cIWpFfgEE7mfbGC0cm2Ql236wGSLZZ0cQWw/x1BDI8zP9vNYWbsvBDtd4kHWIghEqBFf9cNb2b+zct7yuMZEtmSVJO3BHszDVdGO4eC5bcisd8UHjH+QgiCVa0Z/SIxAazlw7+7H6t3NOX3cXY5J/vGzI1PIzHQs8UJG+ugp9mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410838; c=relaxed/simple;
	bh=Nd4vw1L+ymZYbLRTwg/NZf2mrSWax/xtCg820VWD/gM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZIpMlvdLveSZukbFB3K0phoW0IwuxBZAndt+H1C8AJO7Clwd9b075Tro0g2PB6fBcVJycBb/jnk5LvxU4bOVkfrr/BmIKKBAGyYOXg2bJFuc86cLyDs8Z/e0YIDmXguz/ouoWr6yZCWG9rQ6lo8xuKRM5p2c4cMeatC1SvZ7hNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aXeh9mMG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXeh9mMG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490b3e03939so4609965e9.1
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 07:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780410835; x=1781015635; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QmM1BrMGkrG5v4hb15wulvAOXm7AmR3Jxwy4Qx7FlCE=;
        b=aXeh9mMGX0IADC/tj7dTVxhdkW5rtHlFqurvX+Myfr7l27eCi9tcYKbgttM1O3YrnQ
         pelVK3c8lpkfSAVrAj4VlnV0MdTJ41248g4fNxxHLqXucNiok4FXFL3o/YQ1TwN0Ly+N
         PGZ4zlswkZgYQaPsyV1gdHAGj8SKu54rQ9lHGtJF0/cwYu8Fkysx3FmWn96hG8hMAWrw
         NISJm8+FJUCQ8lUJhn9K+XWDGRsbTcC33F72a0AqDI7qzAsWIC5V8tb3e3fK8jLkK7Sn
         5T9S2vGDw+TUL9MRPf7k+FPtX5kY0RUNacHxZdD/J+6ExCWqzthJ2iNvGHtuTJn3rXyG
         PRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410835; x=1781015635;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QmM1BrMGkrG5v4hb15wulvAOXm7AmR3Jxwy4Qx7FlCE=;
        b=jwFSn+DFJeK3fbVRW+cnXV3coiB5FOhNsZrqIh+prl8kOSfxzHqbxLgrXNAj6iyhAn
         Ynzs8k0eiK1Nl7jZTlws3QYYzpJCeYFxQwsy3K80dxKmsRA9USYb6Fl0CKk3SZSXaBHR
         Q7y8wyK8I+zEXEziF5nUuqYgBpnCBY5XVu0AvjMFrvUnYMVq0+YSo/eRjJL1R5fd0dlA
         a+1PskOKVvD/xBJXMJTgSsRw9YEuDD4/loOyMB4wAOEM7k8Swh6ltnKOB/Whqik5sp0B
         I/VscuOKdMB4t8UcU8yZ59HtJ3SRgnTcCRNLuAhjqruOsw5Gx+TjxNkZejiIzPGvam3K
         s3bw==
X-Forwarded-Encrypted: i=1; AFNElJ+Wa9Q4CEh0TJvJm6KgO18fVSRErBQUV6kwT2lpI3r9wUkaCd8Z/cMLlsq8rXAvt+3pTLy8rf9THVhN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+c82fZF7bCRZG0xbWRtICyE2jo7UK/ZN+vboBcED1E4ZwUaKH
	fJrIQDd46PYrvghicF6AxffmMxbt0TkG9xoHFM47l77crvUMyVy2ieLz
X-Gm-Gg: Acq92OE8cKg+OW3H+9ilgzHdMYrFOh0o1hNLWxKN2UxBMkW1DDM9GeOsPz+iH/TaM5c
	vp+UTbe6ubhRQRK6ICgXF35Wd7/BnzV/albg+n32XZnB5ausXOtwl/0x1dztb/6cHPQD/csfJcZ
	ZG3/wlCsvx3RAO7hWO2TT0zjyho+Ojt1n+RveTwSh+e4fPQv5ZA4Bn388IAJAwUTMtYVE5rVfN7
	xmRMmJi9v38e0PixENbz0PgH+BFqIv2vATxHIyfsACvitVOCJKJ9QpnCfWZZo3vRRcZf7wkKeYr
	3JAMPpDu+gEdYM+/t+mhk7HIGeveYfTR7m5FOz66NrExQOMontzHiW90QI043zPEubCM/mVH54z
	RWmwlMYBtEqjJS/hNlFb2hhoxisd0fz/8b1MA+wq8CYAt3GvCXr2NantrLPNGx5Mi7FdarnQ20B
	YEl9hcMfYsvU6MdcCQqbG55r5z2+qgS8EUUPAJz834Se9wIL0=
X-Received: by 2002:a05:600c:3b01:b0:490:b11e:e4be with SMTP id 5b1f17b1804b1-490b11eef57mr57031085e9.3.1780410835288;
        Tue, 02 Jun 2026 07:33:55 -0700 (PDT)
Received: from localhost ([2001:4bb8:152:df59:3b69:56ea:a39b:adb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e13f91sm91140185e9.3.2026.06.02.07.33.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 07:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 16:33:52 +0200
Message-Id: <DIYMYT4VSZ25.1BOXCDTHJNNVE@gmail.com>
Subject: Re: [PATCH v4 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rishi Gupta"
 <gupt21@gmail.com>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, "Matti Vaittinen" <mazziesaccount@gmail.com>,
 <linux-iio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Jonathan Cameron" <jic23@kernel.org>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260531-veml6031x00-v4-0-e64f7fdce38d@gmail.com>
 <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com>
 <ah6p-f2RCW8VcuDR@ashevche-desk.local>
 <DIYI40YK6CSX.2P4017PHVJHCT@gmail.com>
 <20260602133806.53590943@jic23-huawei>
 <DIYKK894ZZW5.26RO6S0GL2201@gmail.com>
 <20260602152939.78e46dfd@jic23-huawei>
In-Reply-To: <20260602152939.78e46dfd@jic23-huawei>

On Tue Jun 2, 2026 at 4:29 PM CEST, Jonathan Cameron wrote:
> On Tue, 02 Jun 2026 14:40:47 +0200
> "Javier Carrasco" <javier.carrasco.cruz@gmail.com> wrote:
>
>> On Tue Jun 2, 2026 at 2:38 PM CEST, Jonathan Cameron wrote:
>> >> >> +/*
>> >> >> + * The gain selector encodes (PD_D4 << 2) | GAIN to identify each=
 gain setting.
>> >> >> + * Gains are multiplied by 8 to work with integers. The values in=
 the iio-gts
>> >> >> + * tables don't need corrections because the maximum value of the=
 scale refers
>> >> >> + * to GAIN =3D x1, and the rest of the values are obtained from t=
he resulting
>> >> >> + * linear function.
>> >> >> + * TODO: add support for MILLI_GAIN_X165 and MILLI_GAIN_X660
>> >> >> + */
>> >> >> +#define VEML6031X00_SEL_MILLI_GAIN_X125  0x07
>> >> >> +#define VEML6031X00_SEL_MILLI_GAIN_X250  0x04
>> >> >> +#define VEML6031X00_SEL_MILLI_GAIN_X500  0x03
>> >> >> +#define VEML6031X00_SEL_MILLI_GAIN_X1000 0x00
>> >> >> +#define VEML6031X00_SEL_MILLI_GAIN_X2000 0x01
>> >> >
>> >> > Not sure if these one-time use definitions improve or not the reada=
bility
>> >> > of the code. Up to Jonathan.
>> >> >
>> >>
>> >> I prefer these definitions, and a similar pattern is used in multiple
>> >> drivers in IIO, but I have no strong feelings about it.
>> >
>> > Looking again at this, what do the numbers in the defines actually mea=
n?
>> > Seems a bit odd to have the base gain of 1 being called X125.
>> > Maybe a comment on that would be useful.  I don't mind either way
>> > on defines for this but if that number is useful to have I'd rather
>> > have a define than a comment on each line.
>> >
>>
>> I thought that MILLI_GAIN was already documenting what x125 is: 0.125 =
=3D
>> 125 milli. More than the base gain of 1, it is the lowest gain you can
>> configure.
>
> Ah. The X location maybe what meant I didn't figure it out.
> For similar the past we've done _0_125 .... _2_000
> which might be less confusing?
>
> There isn't really a perfect answer for this stuff.
>
> J

If that has been done in the past, I am fine with dropping _MILLI_ and
using _0_125 and so on for V5.

Best regards,
Javier
