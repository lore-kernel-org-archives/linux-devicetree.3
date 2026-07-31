Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0291DD525
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785512708; cv=none; b=j3JIKO6BG2O+7w94byyPhN6cWQfRkd9vDrA/XQzQtQXWvB4+eNbHhUKQLctYS0P9WneREz4AtPGd0cikAmHL8oV7yyP/OfZMqzT2J0xViTjfguvzsC/hWiqDvYs0YnihudYdvPVm9DBB3p9Zar5D53OFpSuJkzyAvabXu95uryc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785512708; c=relaxed/simple;
	bh=TvPHrb4kWESv6ljQE15XclowJ50QMR0msenBqr0/6dU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LDX7TLqowSLu9wilgQNZQ2Ly/kxTSO0stEXy/C8Jo4/wRy9GluOoO8Ibn5b48jOyht5p5fMZZh3cbeLBJU05FrmF9+Zqqlm0Amc2dZf8mhgTQeG9SIjJXvZPknRMMBS4PzaVupRRoJVZPwrpXZxX9mbjoig7OsiVo1oNCM0jNy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ld50YzZZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ld50YzZZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso598521f8f.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 08:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785512704; x=1786117504; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9rJ5rXiOvpazcDVxYtI/2HpVZTk/sRYzS0zDZsRFZBU=;
        b=ld50YzZZEm3jMVHqbGMzDEpW2YacC760X9zGlYU8eXwFz268tmJ2tiBHC3Na1i6qhB
         8IKMwolY9lT5GbZIXA5FTHVxD9iqK8ziAb1hEH7Lr+ADd7rXI6Y6Dj1dS06UVz8PJhZp
         DlNDb6qdFJ8AQjlYv1XJXrrzUY9p1s+tpojt1fFi3wMXQBcRKg9zp6l2KleCvARfedeG
         eEn0NkBt4TqUviiGjQqLY7U8wFnV2tENWHscAkVDqa5xIivJcii2U2oG6XBT+xMZbXIx
         o1nxVdkk66g+HSWr7HLxaGuMYQAPakZDcTW10ETJLkS5C3KPuYWohRLBMotnEn4EDUtW
         m4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785512704; x=1786117504;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9rJ5rXiOvpazcDVxYtI/2HpVZTk/sRYzS0zDZsRFZBU=;
        b=XtHXBH99602JLP5PCMEYVMmL/AD4NR+vS0mgKCMGgngu+BGeIZRX9e/i9xMdg2BWk/
         SnZjaeRjSCX95Z3gWH/ie/ugVm5iFZifY+wKNf9sNpQqmVXLk1vZbGV0Y0lkefduMdxa
         WbQep89wiJlSF3hfS4HEO0emApR74ZqzPKZWLLTo5eNrDi5awkxqLPktos7IOyku72/j
         dH3BuWzSoUM4i3PrJu3pm/LfAwYaN5pDc6UI0AAp78hAckaTFekWotVmtXWRBDD8qaVV
         fMjY3m7RFoUQWlsha3vC6QLyxw4IeODyFXlUxGzF9/GhFe0X0TZRPetDwePo7kRf+HlC
         vSew==
X-Forwarded-Encrypted: i=1; AHgh+RqHIlkT7SosAAgSeK2UZgduIjnWt+w7B0srKMqU2g5FU/EpojB8855125QOwPcAJ011AxFeo2kQvXZK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8kB6kDARxdUEu7S15fiZABUVnT2Y6JAeAyJNi4o7zxb2621FE
	KeIQYs1ep8c1pw9RGIGiKq8Hv075ihtAD/Z7EhncDNNyRedLcIScikUP5Xx44ttdivo=
X-Gm-Gg: AR+sD13gMknpSXM0o3+38zz5ID67u6WJ+q5rrHFXD08aCSe66St1k1A+S/1tgiktVQJ
	vl6w/IZGFFja9YDtl3JHhVL1Fr2ZEf4FUoAn6qx5pHbx5ttvxmg/Dj0nPaw0mVvUK0UwUBV/thZ
	2tEPRI20FeC/IQf1BR6y7IVg0N4I2z8TfirssNB+NsVHR6777BgAZTXGOFbx2T7pKDRtFGBCksz
	TAAG3fRTTgf/sN0TIxJFuVYkdohBYAyg2osSrJqLBL0GHKUBktmpRMVt3DVRSHIIb7aQ8ih6Zmi
	TyPwvo8KsXRtp7X65+F/nFMDtqoFf1h953y0RWZpzOwyAQ9ipna+k8NUmff/B1FeVQShp49nicY
	f0PxwAuyC0HbGqv2/VralqK+z8d6O2GHnxteGmQ7JtL2/VUXWxdTrpIAr3KxUFReE3bWH9f46Xp
	NpjCu8xcnep7VccvPizUFvojTZmQjT47uJcK3cnbULWz6N11SsHrqwWXKDB1NV/jz5/Zia
X-Received: by 2002:a05:6000:2981:10b0:47f:923c:9d92 with SMTP id ffacd0b85a97d-47fd7310ad1mr217098f8f.51.1785512704512;
        Fri, 31 Jul 2026 08:45:04 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d00b:bc94:65a:a73d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd456a6d7sm6390446f8f.19.2026.07.31.08.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:45:04 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  robh@kernel.org,  conor+dt@kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260731145301.A12671F00A3A@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 31 Jul 2026 14:53:01
	+0000")
References: <20260731-axp318-regulator-v6-0-b4e745552a35@baylibre.com>
	<20260731-axp318-regulator-v6-4-b4e745552a35@baylibre.com>
	<20260731145301.A12671F00A3A@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 31 Jul 2026 17:45:02 +0200
Message-ID: <1j5x1vxiwx.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On ven. 31 juil. 2026 at 14:53, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `axp318_cells` array defines the `axp20x-regulator` cell
> with a hard-coded ID of 1 instead of using `PLATFORM_DEVID_AUTO`, violating
> MFD subsystem guidelines.
> --
>
> --- Patch [4]: [PATCH v6 4/5] mfd: axp20x: Add support for AXP318W PMIC ---
> commit a5dbdb5469c59acc76c36e5d6f37cd6f060e0f47
> Author: Andre Przywara <andre.przywara@arm.com>
>
> mfd: axp20x: Add support for AXP318W PMIC
>
> This commit adds support for the AXP318W PMIC to the axp20x MFD core and
> I2C driver. It exposes the device's regulators and interrupts.
>
>> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
>> --- a/drivers/mfd/axp20x.c
>> +++ b/drivers/mfd/axp20x.c
> [ ... ]
>> @@ -1061,6 +1129,10 @@ static const struct mfd_cell axp313a_cells[] = {
>>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>>  };
>>  
>> +static const struct mfd_cell axp318_cells[] = {
>> +	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
>
> [Severity: Medium]
> Does this hard-coded ID of 1 risk sysfs naming collisions?
>
> The MFD subsystem guidelines recommend using PLATFORM_DEVID_AUTO for
> automatic cell indexing. If multiple devices share this explicit ID, it could
> lead to duplicate device names in sysfs (e.g., axp20x-regulator.1) and
> subsequent driver load failures.

Commented multiple time on this. This is not where PLATFORM_DEVID_AUTO
would go. The driver uses PLATFORM_DEVID_NONE for now (well before this
change). Changing this is out of the scope of this patchset.

>
>> +};
>> +
>>  static const struct mfd_cell axp717_cells[] = {
>>  	MFD_CELL_NAME("axp20x-regulator"),
>>  	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),

-- 
Jerome
