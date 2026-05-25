Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1470818872A
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779668965; cv=none; b=RMXdzGRk61yNzM8P8chTTKXJhIKZlAK4KVUvYg+w6vSsW7rQdsNyjH/Mot2UDx/PsjWB46PRHUieUC5jS33NFIiKRuKuWOpNPi4o3y3nI5o0LFbAv7Z+DZZYdXJ/X8U3YDpUjzZX5eywBczxBIQA09pzcGgBtm1jNR8zdWHQydE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779668965; c=relaxed/simple;
	bh=F/KWhKY9me5A2Sa/I7jFBd9C4AXQZ5ECUYFiuLrbMMQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=pcBJ0rBa7+AYRJLsxlX+BbMY9LPtVymP/sDv7OxhiuVNsK7GnfkQcQ7+Kq5Nm5zc+27YvuVL10azlc0gazpGSX5tG5l1yyyQhvb0VmDuQDmoU3lwmKNeaS2HloBh8FucVXJxWR5OatWdoyYxcCGt680yzZlRlmbIQF4ctMDcxB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njSlvOcT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njSlvOcT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso43762245e9.3
        for <devicetree@vger.kernel.org>; Sun, 24 May 2026 17:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779668962; x=1780273762; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZPN3CbJBUZQrnFfjLJre9HEteqTWcy5zl2bMbcjDkg=;
        b=njSlvOcTMaJzh/zljeLFXBSUPdIrpRShLzdYhcpomqIHZbBHSZNF2cbUB/hWwKFfJW
         VEnngQdWAqweJ8I9beXWhEmcGjIPX/fksjzOb3XpVXk6Xx8FhaqQpHlYFthUhtXELjiL
         FjSKtp7PkOD5ETTanEL12wU67o3ZvkQGS9ioOL8Su26JxO0RlPsl2aUy3LyBV7DbgiSd
         iz6chJ5E2l6Hs/5ovhd6s7IAYsFWoAWNn+gdy3MSO7cC+pZEJTlx55IoelhFWiGSaaDl
         8e8nFlqidiBZEB0y7ZUNUatTP3VjAueYQwdgAiO28Nzas25jm1Y1hw3TRzA09z4oQOXO
         BviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779668962; x=1780273762;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XZPN3CbJBUZQrnFfjLJre9HEteqTWcy5zl2bMbcjDkg=;
        b=ZX+B8Nu+iCR2OPcsvB60O9LhoSO34EGrrDEFGrpbzNq4cy63BEeVfHjMl/fQGZ+qDB
         x/Ja9/cD/hIGcQrDMuAOFlI+JFtBj6fo7PzwcbvIYCDf9YXyLjBCM8AKxTisgLx/m6Nr
         1vvJo5XWhlqgylURn3GBfi6PuWZfDTcty5K0kf7niJXjtYkFS4beJZWtY2b5ZwszKvaU
         lMRiIsccl1II9p+OWlG2zcaN3mZwBFV6WIDkVE+7cBfexj0AlRre3uclTEM01MJfRHmP
         hxQTLrPkyAkK346aVPxax/de1M58uor4tRxW1LOwc1hazX4TdGhllsmzBDI09aQMfwxm
         JKsA==
X-Forwarded-Encrypted: i=1; AFNElJ/0Pgm5TrnXBUq2E6bV5nJEZc5Baz/HzAbx9I9rhnPMBobU93FzO7gZC1tvseOlZ/Oyxgc0ASAE9kiK@vger.kernel.org
X-Gm-Message-State: AOJu0YyX6/MH0gtBEmb08DFV+lER5j94oEXVVLakoBP5PPGuO7UgZ3Cz
	PyHVD2z5a0RryBDKC9R7tz6ObLTzPY2Fafbdc/IWmOACGNMywfiRnamR62b7pQ==
X-Gm-Gg: Acq92OGNcmSTo5BG5xt9P+RqMmjXaxqKK34soxFBf8G4KbG60VG8vDtxuVOlbaqbh4G
	q8m/6yli9NYQfU3pKRL7Udcl25OUP37xcKhDjMGXFAvCj/VbvZ4CjfsOoxnyu1NeJFFGoaFKkVW
	J/6VcimaYvAJ8Jv/au0dIKjvScOyJ66zimJs9qnZvL8UDjYF9NZIWyti8DaO4uNZo/9JNi417dc
	FBIaCDDQSX6OI6AylJC6WlHNDxe4ZM0fHxx0B49C+ZqPCkx2W7QZSiHhPN0m2NPB2qfVkKSvL1r
	F6ncmG27xNblGq3Y4K+Wxe/lROw8CKhys/ovrvBXHv43MiqOIPC//+M+i6GBfAJGAU4FULarvwC
	kZDbxr6rtgsAXk+MBs4/M60Tf+N9K0ZnJL+q8S1LDgXUi7vfoJQ4nR3HiAdx4ycCikIk8ddbUE8
	CPRcW2yO1iPtLJc3DYYhHRSRp0576h4+qJhAZBLEBkaXtLnYLngKlLaYOrdrq1qeDcBHIjpyhFd
	I67Mg==
X-Received: by 2002:a05:600c:4ecc:b0:490:3d62:f5e1 with SMTP id 5b1f17b1804b1-490426cbba2mr204504635e9.22.1779668962188;
        Sun, 24 May 2026 17:29:22 -0700 (PDT)
Received: from localhost (213-225-2-150.nat.highway.a1.net. [213.225.2.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d44f6sm98033265e9.8.2026.05.24.17.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 17:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 25 May 2026 02:29:18 +0200
Message-Id: <DIRBZSWW96SV.3CWW1CXJWD1S6@gmail.com>
Subject: Re: [PATCH v3 2/4] iio: light: add support for veml6031x00 ALS
 series
Cc: <robh@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0-143-g2f3a2e260c09
References: <20260524-veml6031x00-v3-2-29165609b2b5@gmail.com>
 <20260524225336.450AF1F000E9@smtp.kernel.org>
In-Reply-To: <20260524225336.450AF1F000E9@smtp.kernel.org>

On Mon May 25, 2026 at 12:53 AM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issu=
e(s) to consider:
> - [High] Mixing `devm_pm_runtime_get_noresume()` with manual `pm_runtime_=
put_autosuspend()` causes a PM usage counter underflow.
> - [High] `veml6031x00_write_raw()` modifies hardware registers over I2C w=
ithout acquiring a runtime PM reference.
> - [High] The shutdown devres action performs I2C writes without ensuring =
the device and its parent are resumed.
> - [Medium] Missing locks in `veml6031x00_read_raw()` for `IIO_CHAN_INFO_S=
CALE` and `IIO_CHAN_INFO_INT_TIME` allow torn reads of configuration fields=
.
> - [Medium] Incorrect scale attribute exposure for the IR channel and fail=
ure to mark shared hardware attributes.
> - [Medium] The driver unconditionally sleeps for the integration time on =
every raw read, introducing unnecessary latency.
> --

...

>> +static int veml6031x00_write_raw(struct iio_dev *iio,
>> +				 struct iio_chan_spec const *chan,
>> +				 int val, int val2, long mask)
>> +{
>> +	IIO_DEV_ACQUIRE_DIRECT_MODE(iio, claim);
>> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
>> +		return -EBUSY;
>> +
>> +	switch (mask) {
>> +	case IIO_CHAN_INFO_INT_TIME:
>> +		return veml6031x00_set_it(iio, val, val2);
>> +	case IIO_CHAN_INFO_SCALE:
>> +		return veml6031x00_set_scale(iio, val, val2);
>
> [Severity: High]
> Does this code modify hardware registers over I2C without acquiring a run=
time
> PM reference?
>
> Unlike veml6031x00_single_read(), this function directly writes to the
> sensor's configuration registers without a PM reference. Because the regm=
ap is
> not configured with .pm_runtime =3D true, I2C transactions may be attempt=
ed
> while the client device (or its parent controller) is runtime suspended, =
which
> can trigger bus transfer errors.
>

The registers are always accessible as long as the device is powered,
both in normal operation and power down. Therefore, this function cannot
be compared to veml6031x00_single_read() that acquires a PM reference to
carry out a measurement, and the write operations work fine.

>> +static int veml6031x00_probe(struct i2c_client *i2c)
>> +{
>
> [ ... ]
>
>> +	ret =3D devm_add_action_or_reset(dev, veml6031x00_als_shutdown_action,=
 data);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to add shutdown action\n");
>
> [Severity: High]
> Can this shutdown devres action perform I2C writes while the device is
> suspended?
>
> Because this devres action is registered before
> devm_pm_runtime_set_active_enabled(), on driver unbind, PM is disabled an=
d the
> device state is forced to suspended before the shutdown action executes d=
ue to
> devres LIFO execution order.
>
> The shutdown action then attempts to perform I2C writes to the shutdown
> register. Accessing the I2C bus while the device state is suspended can c=
ause
> bus errors or hangs.
>
> [ ... ]
>
>> +	ret =3D devm_pm_runtime_set_active_enabled(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
>> +
>> +	ret =3D devm_pm_runtime_get_noresume(dev);
>> +	if (ret)
>> +		return dev_err_probe(dev, ret, "Failed to get runtime PM\n");
>
> [ ... ]
>
>> +	ret =3D veml6031x00_hw_init(iio);
>> +	if (ret)
>> +		return ret;
>> +
>> +	pm_runtime_put_autosuspend(dev);
>
> [Severity: High]
> Does mixing devm_pm_runtime_get_noresume() with manual
> pm_runtime_put_autosuspend() cause a PM usage counter underflow?
>
> The devm_pm_runtime_get_noresume(dev) call increments the PM usage counte=
r
> and registers a devres action to decrement it on driver unbind.
>
> However, the explicit pm_runtime_put_autosuspend(dev) decrements the usag=
e
> counter to its pre-get state. When the driver is subsequently removed (or=
 if
> probe fails after the put), the devres action will blindly decrement the
> counter a second time, resulting in an underflow.

I believe Sashiko is misinterpreting how this pattern works (not
introduced by me, it is already available upstream in
drivers/spi/atmel-quadspi.c). Decrementing the usage counter is fine
because the devres action uses pm_runtime_put_noidle(), which in turns
uses atomic_add_unless(usage_count, -1, 0) to avoid decrementing the
usage_count if it is already 0. Sashiko has reported the same issue in
other patches of this series.

Best,
Javier
