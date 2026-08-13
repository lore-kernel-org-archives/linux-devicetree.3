Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625FA442B33
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 08:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609751; cv=none; b=KL86FNohfvnAUWAWffhWGQmsbH3L1IzBbMEYyk/IamqAs64gSoo67pmvYe9V8EI9pzEaoIBRtQ1duPO2/wCF/OrC0E2oLI5bl9RKM4vwb9fm72lXueBgxsbDJ5+AmwgP6PtdSzj0wMJG3sTwhYGCz0+/rOMICo3Ml3kRKGaloYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609751; c=relaxed/simple;
	bh=tZO+uk+U+keRcnrsOz15fPjhTe6BU+LORJ2iCL/GCt0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KfZz3DhFP02lmU7NbSBx7qEuh0gxojh1IDAcM2+3UMxzVJ1nHC5VkPPJIEfhhOm9dqiUwtJGGq2Go0I1vROkDUHbat17Nkk6x/9uDWgu7d7OrwP+XBtnIAyeVZJknLw2Hro8Skht4o1cCnvXQVU50zp2iktFlq+NpuzxgDtYY/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ABWM7pXf; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ABWM7pXf"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f96c5b722so948855f8f.0
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 01:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786609745; x=1787214545; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hd95siWMwoFHK3U5cEWEGYTFALaXZZqw8YjpPHhQMkM=;
        b=ABWM7pXfjWgmriQCKS4TBy23i5Q0a9JThFN2p7XMSF9FAl9amUbl7z2wXXqFxW80Fp
         IrfN8hkR4gDkhJ/03VnlbQpCiwbmFqR4qoLcnc627M6c4CNP2Pj17i8F0YwaVBuwUCHU
         ZWoZkKDCx1KZ92EL9d33C7fhV7bZdN/iKX7ZPuHUrgcRZCV1J/v0s7M1JYQxJRQ79YtL
         qanp5zywEOgmBtCVdgRhLH/+RecNbirljq2d8StGkYx2T5Shrb/U46XwatMsVR5/BkNH
         kiOfhIsdQtQvnKsK9qG3qHvHoQm0isoD9XQb18+kuNUSGqLYclx9vghXb3GHuDD3SZgG
         waeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786609745; x=1787214545;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hd95siWMwoFHK3U5cEWEGYTFALaXZZqw8YjpPHhQMkM=;
        b=aG1xHvbjsQUKFm5ps5K6qlKQMBVwZ88LfakO0b+Gyr3ZgTIz+RdpE8t8/VhMUeLCYn
         JR6D2MWynicbXmFXseSoYUyQ0ZY4/cRoG0a297PVSGFT5eYOV5mAQIvdty7C9Ef1zXwI
         PXlcYVUsKTtgik/ka/lPAtlv8l3MQARTzBqW+Q4GvQLle8+Lo+pGlYILk44iXAACdA13
         R81bV9eKZ/cU6GdYX2Tw8dJLUs9NkUbZsm/ZAMNu4QXGOvFDqFn2o/dRtUeaKhiavgbB
         PnB6fLwIfirafSi8Nouj8n1Tjv9mIoGOgrWvHBFC3+9Jap2eRPFl0QY1zPOhqZ6Z+mTw
         1/qg==
X-Forwarded-Encrypted: i=1; AHgh+Rq/XwPJOi12qAfrGdZdm37DmQiOvMjSWaFqclgmdQSNTlyRNrfSmfRgGz5GKCjRs9b6z9vLE1Orhx9n@vger.kernel.org
X-Gm-Message-State: AOJu0YwueF8jInXVeJIjuNdE2RTg0cHBIqExZgsHQXUI0lYEpai11EyC
	JuUyYz7JqYkAKLYLGd1qyrSHjcP6cj9hzdgTm9vOEAbkwgkq/bUnQhd6Vs9PTw7ksmo=
X-Gm-Gg: AR+sD13Ml8Ej1bXgSZfgUsWXbL8RlszVYctagOLvmC5zcwl0aHaUvLdwm3vfQ0Wb5j3
	QGxbLDZN9LG4C6xS7JLzWjKRCWHuqThAANsKLg32QJ2QuJ6Se4p1kMOfzRCKBIi2rqkLZGuoqby
	eLfEihEG8BRBU/tohP6OaMnSwxi7f5DaNiMaGPD/dSZRz8qki+JIU0AXz8qJh7na/XPLmPlTo4h
	VTbcap82V1B5SRRWS2PEuBU0U6MmL8WAEKQG75dqYxuTRuVaNWXLG7oHVrc2jExenVPhXBSAECs
	DLazAGICSuJD3knkcwCXdS+ed8PsWs8p2IqNcoNXCD1STM+rtStgOOQ0qxTyYj/4FnxhuCz5xSD
	eHwwMDErTXCtb0q3HWK3k3rBSWGsyXEz5IUEkJwzMm+JISQtWA05SQ47HLvayxqrJHIR8ZzxlOE
	lVVruu3EQoXiBeVpiqyiz2Rz1SOpP4zPoVVBCzeyi51X0Jh4r2xZ+w4pBFgLlneMu3kt/pSQ==
X-Received: by 2002:a05:6000:41d0:b0:47f:f908:ba7b with SMTP id ffacd0b85a97d-48159feec0bmr5544710f8f.23.1786609745155;
        Thu, 13 Aug 2026 01:29:05 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bd31:7f6f:53ba:7518])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4815a5b6c21sm4863642f8f.27.2026.08.13.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:29:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org, Lee Jones <lee@kernel.org>, Mark Brown
 <broonie@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, robh@kernel.org, mfd@lists.linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260812214019.CDF921F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Wed, 12 Aug 2026 21:40:19
	+0000")
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
	<20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
	<20260812214019.CDF921F000E9@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 13 Aug 2026 10:29:02 +0200
Message-ID: <1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] The corresponding regulator driver lacks support for `AXP318_ID`, causing the `axp20x-regulator` child device probe to fail.

Funny sashiko did not pick up on this when v6 was first sent. This is an
ordering problem. The regulator part should be applied before the mfd
one.

I could reorder here but there is not much point since the 2 changes will
land in different subsystems but it does bring a valid question:

Lee, Mark, are you OK with picking the patches indended for your
subsystem or would you prefer that I split the series, regulator on one
side, mfd on the other (with a dep on the regulator one, of course) ?

> - [Medium] The newly added `axp318_cells` array uses a hard-coded cell ID of 1 instead of using `PLATFORM_DEVID_AUTO`.
> --

... Again, already explained this in previous version and the cover letter.

>
> --- Patch [4]: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC ---
> commit 5a33005ba66225f7df0e6747b0fcb9263e977f13
> Author: Andre Przywara <andre.przywara@arm.com>
>
> mfd: axp20x: Add support for AXP318W PMIC
>
> This commit introduces MFD core and I2C support for the X-Powers AXP318W
> PMIC. It defines regmap properties, interrupt maps, and adds the regulator
> child device.
>
>> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> index 84839d4aa1ca5..ea00c0cdce58c 100644
>> --- a/drivers/mfd/axp20x.c
>> +++ b/drivers/mfd/axp20x.c
>
> [ ... ]
>
>> @@ -1061,6 +1129,10 @@ static const struct mfd_cell axp313a_cells[] = {
>>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>>  };
>>  
>> +static const struct mfd_cell axp318_cells[] = {
>> +	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
>
> [Severity: Medium]
> Should this cell use PLATFORM_DEVID_AUTO instead of a hard-coded ID of 1?
>
> Hard-coding cell IDs or mapping them to fixed instance numbers can lead to
> device naming collisions in sysfs and driver load failures if multiple PMICs
> defining the same cell name exist on the same board.
>
> [Severity: High]
> Will this child device successfully probe, or are the regulator driver
> changes missing from this patch series?
>
> When the MFD core registers the "axp20x-regulator" cell, the regulator driver's
> axp20x_regulator_probe() is invoked. It checks the axp20x->variant, but since
> AXP318_ID is not handled in the regulator driver:
>
> drivers/regulator/axp20x-regulator.c:axp20x_regulator_probe() {
>     ...
>     switch (axp20x->variant) {
>     ...
>     default:
>         dev_err(&pdev->dev, "Unsupported AXP variant: %d\n",
>             axp20x->variant);
>         return -EINVAL;
>     }
> }
>
> It appears this will fall through to the default case, print an error,
> and return -EINVAL unconditionally.
>
>> +};
>> +
>>  static const struct mfd_cell axp717_cells[] = {
>>  	MFD_CELL_NAME("axp20x-regulator"),

-- 
Jerome
