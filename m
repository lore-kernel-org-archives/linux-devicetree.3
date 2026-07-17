Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5181236402A
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 09:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784281906; cv=none; b=C4Zy1R89SpVGL5spOczCfq8Voc2N3HZlT/IEn6hLBCqnk9razJghXdVPR7uw36iCokLuEgi85c2cNlhgq5YTGNkmILR/0d61WthDJyloRBAxKjcalnvTKeWOZ25tydx9o0c9ohK1qX+Us2nQ1DYsoCVGYFlv+KSVbx2k6cuTIWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784281906; c=relaxed/simple;
	bh=zcD1hjG8I7aQcefl5mRU2TmV2uE/QdOshRluOqLqelQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jsOmHvkeTR3uXt5jcNiyt8LTh5pOEkX8b5Ft8uks8NNTRTGFTZUtY6zHPQ2wYPPZfmKNf4ugKar+jwb8VEiR74NdRbYKR2y/feLr3QiU5UgGxq+LuVdD5L9TzxGCUy3l7O+43bEQZAxl1h9A9cqb+d0xFVpSi0h0wNwM2g2Dr4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XOuhcV4I; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XOuhcV4I"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so1520865e9.1
        for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 02:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784281903; x=1784886703; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pJCC0wO896nE8gyYR5Mds0J8ooeePUhEH/e6YbBZ+3s=;
        b=XOuhcV4IcKIy3Eiihaf94JYtitRgMJ5fOl5tZKCeUmNRh/fifVy645IBc5oHiekBOl
         Hgmn/M0l5quMX8qfEls90oZ9qSHY4py9bEz20wePAAGJpdPP4PClOaURbEMVk/K3QJ1l
         tQ3wYRjI5slg7pGZWtzA5mPCFNrcHIBnUbxe1QO83v/XFoj37W7HHEHCOk1htTAv+Sbm
         SQFYOwSFwix9bjcJHrBAglwcnfbHBhav2bQ1HUBiK54P4b/t0FpOa5WFPzpcurQQcwxQ
         kyJpb9iBvOp/7TZs31LPdw8g2fIKNPiAUd5WToWicvLOGF452LSZdieJGXxkT4oqil57
         9LhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784281903; x=1784886703;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=pJCC0wO896nE8gyYR5Mds0J8ooeePUhEH/e6YbBZ+3s=;
        b=KRCOpCpbX54x4mvc2bbfripJHXjX/D0NcxVnLxyKur2jPpstrqDqdaJHejrx6uOwJ+
         cMuxeHqPTSnp3Qxi2BrHIQJ4h//vc+kv+Hddkeaxx2CMUUpYDAANASe/bEDrZJwJSAit
         UsxMvw98wuzgOwmYojZc3MMax6QgdGx4wau+2GkclMMQxkwf/JVoKhqvW/orloc5Gl/X
         VgJHgfZuUpHHmSzAHr9LftB97aCKkhF+Oqj3LiQcE44MX9o/kbVvv7OmlQt4znB/fxa5
         QnaAuglI7Zs+7+GT3TeJZWpq4bNHSGJY7s4uaPsQ+8xbNxDEkIDlehgPzSSV/yqF/nD5
         V8Qg==
X-Forwarded-Encrypted: i=1; AHgh+RrEcMrH8SqijuroQ6HiJhmzplsuYIgD9LPajDlcwT9+pL6m/D68rTMb+w8+id/d9PDngsflw9njH8Xg@vger.kernel.org
X-Gm-Message-State: AOJu0YwyKB+Ndb0FTneZKGacRopF3cdDxTPqMSv29vLoV0nehey5llLV
	McE6ZjflhNSSUfdlIVJH6QU800Aaif1Vwwcbi80OrEG/zsJBsMnXfVDK8vPW09J3vl4=
X-Gm-Gg: AfdE7ckylKh8m/GCNI8nj452xOCQFJkn3Q23TJd/mWUHmXCO9oSdvnhHroYEFtnvxaJ
	a/N0uTbIkNQ/ZaaI70PsUq2WCLApvlGhsApUo7QrW7bXQEfiT+xasLwWEXIdQQa6uA/cIcG4KyW
	fGNHWndhN5AydTr2mQSgDur6LPmPbBhchI3UEzEOUxXfJ4LRt4TkHw4+lkczjIasPjgf3tikjeO
	MhZtndv6yHkhG947OkboUqQEwihYcrbg/aKUTNOm/ZsVQipB5cvyb6DSAoFxOl+berA83xUAWx5
	yAIP33GQsXvReyxJpQH2DWmsxNLOVPFBwm49AKZLo8Sy7JhyxCaajmpcA/1DD2OrVu1NQNnGJTa
	70yQsreDnXh8LXIk5L8AvwWYRXzTjXpzaw1qo45gE+EXcuEgUTRLQTMY8/hyMRDwoASvqcT6gDU
	ZE
X-Received: by 2002:a05:600c:46ca:b0:493:e460:1f6 with SMTP id 5b1f17b1804b1-4954a396371mr21218985e9.0.1784281903373;
        Fri, 17 Jul 2026 02:51:43 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8e22:8a15:f33f:dc60])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4954a2e8529sm33184115e9.11.2026.07.17.02.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:51:42 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org
Subject: Re: [PATCH v3 2/4] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260717090209.2A09B1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 17 Jul 2026 09:02:08
	+0000")
References: <20260717-axp318-regulator-v3-0-779dc1b97dd4@baylibre.com>
	<20260717-axp318-regulator-v3-2-779dc1b97dd4@baylibre.com>
	<20260717090209.2A09B1F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 17 Jul 2026 11:51:40 +0200
Message-ID: <1j5x2eeyfn.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 17 juil. 2026 at 09:02, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [Medium] The newly added I2C device ID `axp318w` fails to use named initializers and omits the `.driver_data` field, resulting in it defaulting to `0` (`AXP152_ID`).
> - [Medium] The MFD cell and resources for the power key (`axp20x-pek`) are completely omitted from `axp318_cells`, despite the commit message claiming to support it and IRQs being defined.
> - [Low] The `axp318_cells` array uses a hard-coded ID of `1` for the regulator cell, which violates MFD subsystem guidelines and risks sysfs naming collisions.
> --
>
> --- Patch [2]: [PATCH v3 2/4] mfd: axp20x: Add support for AXP318W PMIC ---
> commit c0a61d967fff87b52d26e4cb329e69e10684fb89
> Author: Andre Przywara <andre.przywara@arm.com>
>
> mfd: axp20x: Add support for AXP318W PMIC
>
> This patch adds support for the AXP318W PMIC connected via I2C. It sets up
> the regmap configurations, volatile ranges, interrupts, and registers the
> MFD cells for the regulator devices.
>
>> Describe the regmap and the MFD bits, along with the registers exposed
>> via I2C only. This covers the regulator, interrupts and power key
>> devices for now.
>
> [Severity: Medium]
> Is the power key device missing from the MFD cells array in this patch? The
> commit message mentions it is covered, but there are no power key resources
> or cells defined for the AXP318W.

Had fixed that but rebasing multiple time a lost it somehow ... will fix.

>
>> diff --git a/drivers/mfd/axp20x-i2c.c b/drivers/mfd/axp20x-i2c.c
>> index 5c93136f977e7..4e4ebfc78525c 100644
>> --- a/drivers/mfd/axp20x-i2c.c
>> +++ b/drivers/mfd/axp20x-i2c.c
>> @@ -83,6 +84,7 @@ static const struct i2c_device_id axp20x_i2c_id[] = {
>>  	{ "axp221" },
>>  	{ "axp223" },
>>  	{ "axp313a" },
>> +	{ "axp318w" },
>
> [Severity: Medium]
> Does this need named initializers to provide the .driver_data payload?
>
> Without setting .driver_data like the of_device_id table does, won't this
> default to 0, which is AXP152_ID? If this device is instantiated via legacy
> I2C methods, device_get_match_data() might return AXP152_ID instead,
> causing the driver to mistakenly configure it as an AXP152 variant.

I don't think this driver as ever been intanciated through the legacy
i2c interface or was meant to be. While this may need to looked at for
correctness, this is not something new introduced by this change

>
>> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> index 679364189ea58..c8aeebd01bbcd 100644
>> --- a/drivers/mfd/axp20x.c
>> +++ b/drivers/mfd/axp20x.c
> [ ... ]
>> @@ -1061,6 +1129,10 @@ static struct mfd_cell axp313a_cells[] = {
>>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>>  };
>>  
>> +static const struct mfd_cell axp318_cells[] = {
>> +	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
>
> [Severity: Low]
> Should this use PLATFORM_DEVID_AUTO instead of a hard-coded ID of 1?
>
> Assigning a hardcoded ID can lead to device naming collisions in sysfs if
> multiple instances of the device are present.

PLATFORM_DEVID_AUTO does not go in here as far as can tell.

The driver uses PLATFORM_DEVID_NONE while registering the device.
I honestly do not know the reason, if there is one. If it is problem, it
is not related to this specific change. I don't mind submitting a change
for this but
1) it should not be mixed with this series
2) I can't test the other devices

>
>> +};
>> +

-- 
Jerome
