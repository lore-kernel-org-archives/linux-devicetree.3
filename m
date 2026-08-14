Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A546373BF6
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 08:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786697898; cv=none; b=gNxYmvMM88qR0syEoYaDQpjIVkey1IaZkBkXnuRfXIDmb8hZ0+47VIoZtBoQK7rxAjRJ1CBnS3bfFkQU59WF0G8hxuQKguvINBGBN5lVl9ghWL3KOSOZ7EEM0Xrii4tUOKT/LZOdi6yKpwyJA7O403vRNBwtkW8N3ujJRwoQnH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786697898; c=relaxed/simple;
	bh=+xAo7DKr8KYN09cQolTEwlHpwoWQgrI8LMbIPJfHU88=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Sx/Cgrdls6lc1JkNGFkBuea/WvHP5fnVyzJxxiAR59T3VMqxiHnPBoF3d7G5mLxN4OV2OWe5xKbN6r7TdsW0oTq0dGyUy5GltKwu8k89t7l6HMKEXnXn8HTmjevgPlEjU4lwl4f3NeURxTUuGijZDQXjytXckNrPAmeeKxAZISc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QFSAJGzF; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QFSAJGzF"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49553515a8bso13348685e9.1
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 01:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786697895; x=1787302695; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P1U17HFehyxVTvnmYZONr+ZpAC1JSagDXgrDixqbumk=;
        b=QFSAJGzFEic43BCmL8jAUD1QhXdRyn/Yk9e53a+QAe0kpIeMaGWlPTW6JLBhhh1lM0
         n0K5+Js/M6rb5erHreu58bD1mYhHAHKthiLEzKJYRuKppKLbBSco9lVZSPbZgTZcLuHg
         goAMfpB2+Y3hMlILA0KaXBhFymCoNj0gug/zgrYSJimAkJJfKwCamrpflTNHyswjiv9+
         JkBbOidxK0YG632BaCkoG29x2qklW3aMCZqzwZeLExKpSyIoDHfUmFD4PNpr9jqdxayY
         lDBXFXSLBqKoPg+YKtEb+5yrreTIFK8510OujuohFjkj4LdWmiXpXhd3M/Uac2OarO3P
         izww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786697895; x=1787302695;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1U17HFehyxVTvnmYZONr+ZpAC1JSagDXgrDixqbumk=;
        b=Fsr0k1ldZoFMbsGiOGGLjo/UAbaFcTyo2+WLf33eWlcqixc8IoYkSHym5Ag6OTVsEP
         UaMDsHr86mMHMZIDNu24Prn94TDCdTqcO45Vd9GWJNO6B9TqPf2FXZOBt85gNGQQhQBc
         mf0yT0VHwQ4okkECzYoe0DDIZYnIKUwPqbtdWZ7dEgvEvKWZz5W9E2Cu3DB/UiCcbnTC
         kS0mV2aQr82FcZrcFe700PaZlOwAz0Fk8JIhCYXfE15QVVqgERclXovP8RtUXCex5Qp+
         y5EYjsJUfAzn1fwGdBO33tkCB3p3/KJ3I3Mt1cQUeZ/3NKFJ8AGKFqSumOT+uJ6r+M6N
         WKsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrKR5Pp+yu0of8B28RVKWPHrMztffA/QrdJXnV3iIGKe77ifcNuebsmQ/WAL2wgo6vnamrlon5n43zl@vger.kernel.org
X-Gm-Message-State: AOJu0YzgRcUpm+eBAROckbn7A5gDLpcXTcN1/Uz5Y68NHzSjIWkkSzZq
	JW01GnMLkBj5dRGsLLNTO4cmw5zibMrzbTakXyFflRuPAdJUxhrlaJJ/
X-Gm-Gg: AR+sD13zQb1XguwxRtzT8mWyHhEdwjArZE/w/0JHAW5fGXI0M63hlqHYKJYd47UFMhi
	kdTdtU+0eewCilKsRsvbxsq5ROYR5beSjNId6KwiTNrx2aEGPFsweGK6/2RaMC9arP5eZnq+lVC
	PomY2Ey+JDN20xjjFCsk91JWVCpMqOmHNba24Dtnq8jHnL72KF+AB1RI/PlHyAfQ6tohTijWfz8
	+k5kSF81pp94I9vURNzlt303bQHik5KJIgsqWG3+xFj57KooKhIJjeQTSSy6zhjnsdPwTumNYRP
	8dY8Wj02ZQeRDa3Arm8zwDnG/3GfdffUEtNxycziwUFE+J3+HAVRJc+G0UnnbtN1yS8mRSt3nS+
	5g/wwxlaW3N/vfXmQNoa1gwJDawUOhtLwI+Lr6OAt9n6m8V/vNydzPEj8WcHm7rODz4/VLUbyfx
	eUahDtMWS3qVwn97758U+P65TRHLMA6DVGZxI6PWZUM7zw7qAvq/b7XZJjS05a9nNykvp5Luj/R
	TJufqXdfDFbfw==
X-Received: by 2002:a05:600c:8714:b0:499:8704:242c with SMTP id 5b1f17b1804b1-499878ca13bmr68452965e9.0.1786697894555;
        Fri, 14 Aug 2026 01:58:14 -0700 (PDT)
Received: from localhost ([2001:4bb8:16f:15e0:6cd4:2382:91e2:c6e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49987b438cesm37139145e9.3.2026.08.14.01.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 01:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Aug 2026 10:58:10 +0200
Message-Id: <DKOJJJSXCZ8Y.KCR5NRYX7PVL@gmail.com>
Subject: Re: [PATCH v6 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: "Jonathan Cameron" <jic23@kernel.org>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "David Lechner"
 <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260812-veml6031x00-v6-0-7eef6e4ce290@gmail.com>
 <20260812-veml6031x00-v6-2-7eef6e4ce290@gmail.com>
 <an1rR07iJd_XLSPr@ashevche-desk.local>
 <DKNPY12RSCH4.2KQCX98171G2H@gmail.com>
 <an7IpvdXnxzzDknS@ashevche-desk.local>
In-Reply-To: <an7IpvdXnxzzDknS@ashevche-desk.local>

On Fri Aug 14, 2026 at 9:49 AM CEST, Andy Shevchenko wrote:
> On Thu, Aug 13, 2026 at 11:46:32AM +0200, Javier Carrasco wrote:
>> Hello Andy, thank you again for your thorough review.
>> On Thu Aug 13, 2026 at 8:59 AM CEST, Andy Shevchenko wrote:
>> > On Wed, Aug 12, 2026 at 10:27:41PM +0200, Javier Carrasco wrote:
>
> ...
>
>> >> +	data->regmap =3D devm_regmap_init_i2c(i2c, &veml6031x00_regmap_conf=
ig);
>> >> +	if (IS_ERR(data->regmap))
>> >> +		return dev_err_probe(dev, PTR_ERR(data->regmap),
>> >> +				     "Failed to set regmap\n");
>> >
>> > Is debugfs access already enabled for regmap after this call? Perhaps =
you want
>> > mutex to be initialised before that?
>>
>> Could you please explain what you are trying to avoid? Even if the
>> debugfs is already enabled for regmap at this point, what is the
>> possible race condition?
>
> That's my question to you. If you think there is none, then we are all go=
od.
> Basically the Q is if that mutex (that is initialised later in the probe)=
 is
> required for the device IO which might be possible immediately when regma=
p
> is registered.
>
>> The IIO device is still not registered at this
>> point, and the registers are set to their right values in _hw_init()
>> after the mutexes were initialized. Moving the mutex initialization a
>> couple of lines towards the top is not an issue, but I would like to
>> understand the reasoning behind.
>
> User may read (and depending on the driver case writing) the register map=
.
> Would it be a problem?
>

That is not a problem, as no assumptions about the original values are
made.

>> >> +	ret =3D devm_mutex_init(dev, &data->scale_lock);
>> >> +	if (ret)
>> >> +		return ret;
>
> ...
>
>> >> +err_pm_put:
>> >> +	pm_runtime_put_noidle(dev);
>> >
>> > Hmm... This is usually a red flag to see a goto after devm_*() calls.
>>
>> Could you please elaborate on this? I am aware of the dangers of a goto
>> after the cleanup attribute, but devm_*() calls work on a different
>> scope, not local to the function. What could go wrong? This goto is just
>> a way not to repeat pm_runtime_put_noidle(); return ret; and I am not
>> strongly against repeating these two lines wherever there is a goto, but
>> I am not sure what we are avoiding in this case.
>
> No, the goto here may (or may not) lead to the wrong ordering on the clea=
nup
> and/or error paths. It's usually recommended to avoid such a style even i=
f
> it works without races in that case. That's why when switching to managed
> resources it's highly recommended to wrap everything to be managed (in ca=
se
> there is no native APIs available) and avoid any flow disruption (goto:s)=
.

In this case I can't see any issue with the goto. It only leads to a
call to pm_runtime_put_noidle(), and after returning 'ret', the
device-managed resources are released. If the goto is removed and a
call to pm_runtime_put_noidle() is carried out in every error path, the
result is exactly the same as there are no operations within the probe
execution path that affect their behavior.

I can imagine that it might be problematic in some special cases, but
the use of devm_*() and goto jumps within a function is allowed and used
in the official documentation [1], and in several upstream drivers in IIO
[2][3] and other subsystems [4]. Of course, all those examples might be bad
examples, but I could not find any reference discouraging the use of
goto with devm_*().

[1] https://docs.kernel.org/driver-api/usb/writing_musb_glue_layer.html
[2] drivers/iio/accel/kxcjk-1013.c
[3] drivers/iio/pressure/hid-sensor-press.c
[4] drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c

Best regards,
Javier
