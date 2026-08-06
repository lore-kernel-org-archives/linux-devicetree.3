Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80C738F934
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 13:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786024103; cv=none; b=mj3D/Hjkan5MgLSRcOVsHu7VzDGpgwJxbgy1j2JNhuyH/IN7+YfK+/jBohNacO9yMDofXf5sSe1rp1BnZmq37kSRfoLnt/5pQZ4PQG7yEaQHoR/102X6/EJ03m+/DcvZsf2rRbRdN2+9WuhKXkfVK9tAhUzPV1/3KlbpK4vpQ6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786024103; c=relaxed/simple;
	bh=VUDaFvQ0ieNDlaaJME0paypxKsF03ol39QMh904ESRg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TySA80K7IX1MmRRurLbB0ZImpbONWiBGuKeJc3DSmFX4QJAye7Yvfr8GWP/Djp9WL9K/cifA+O6kF6f6jwpp+gT9IxFAZ6AodcYwP/mI3sDRDXgIMciZv8mHvcXV4iK/sjMTSAVfbFkAXLh6vnX5UdkgIvgOzqDjmCiLZmdhkqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ws46wEG3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ws46wEG3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so18547695e9.0
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 06:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786024098; x=1786628898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ia07ylmzYe8lASDAIjft9k6NcdFkuTwi54HOtt53Tug=;
        b=Ws46wEG34ZVSpMHcZ1JWfL5H0WdxJMGiAq9LVryswTwh4i7iLZNNikQTb0ysplwUqM
         2OBYMac+BqpTM2p/zD0zVmlPMTy5tHqO7lSe2ERwpKFLn86WAysLDKyj9qvvGsnSy35X
         +5XhcOoNUH4h9AnzVr+qnwC7paAvVyuY2UHwWV2xdo32AK2ChbTjaKKl+yNwseHmUukI
         nTpWUDK8nULIZDG9qQh6MiqPcvMVQRgmfCegCetCGHxuUF47tBeBxEPSKmOKAj7Aubrm
         L3VSfsSCtW/KyMMXTQrkneLLT/7Q5LSsJg/V9PGc57DYBd9QwKOaSTQUTkrWwNERDCNX
         doSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786024098; x=1786628898;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ia07ylmzYe8lASDAIjft9k6NcdFkuTwi54HOtt53Tug=;
        b=ZAy8DVoe9mi7NG0FbjFpbDXp8rzPewY92ZQ8oKkdvE+qhUVm7HKluqbv34nkxbakrg
         VyCN9VFTorwwiwJTWq7KYU3UdKjV0UUjTUec6Dwh82Z77am1Y8r/wc53GO+gOPl+JjbV
         6Sx5PNqX+XVHBKvuebD0VIxNAEmSXn0bMOLLjsR+coi4Xqne2rV2UL1fKvbMgK6ZwQs5
         Mps/8E0NoL9V20FR4D6hpjewqfdLZYCewEOWNwWPxiKT1o2TSBvWj/8fw7mAGwPmUzUI
         d/AmTEureNO8QdXUZFE6vli2FdTMP23etMrOFurWD8OFooqBuLczm5LnE82ou9D12xho
         lQnQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPXDeP45jT7KW/Pjq38hyaWJeatUbXRwXK8MbnPly1oSFqgZIYVAfGlzt/AwOCXL6TtozPKZ+X0pxZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ajwtp9y6+fxJLlCquRKTFNLWnYUDTRNVulCps3cxmpBYCSdd
	EYpDDv8eWFUQubKQ3kRiYLhtFqLdjRVu7SD/f8U/x9Za6tajDu5DNFiO7EDPqH/IZNc=
X-Gm-Gg: AR+sD10f3ckZGYkqRYYomhqFtvVRAu6QNxivMBN8rfE1n1WrCB8DCk13rwA+cy21KTA
	S3tqfHQnCO00+9ff+y1+ZkQbHD0vPgBmH6QUIRq95fHePm5YC8GGUNqhu00VLkN3ec+CGU00cxJ
	bZ/6EaRyZcxBgV2vDbevGI6FrXfiSLIas7HIAlQgix8lPMwStTqmo52W7m+oKE0vxHTv8JGv0Xg
	55Nk3X1Hfb7WE0tn7g0MJ7PJ3GMyihoXP7lJE+EdffUXSxzAf8k3zlKKoU2B/hZdsNDqTiaM3OF
	EMVPeuc79IrCfcAbDO8QYyGy1c1AZHOoeWQ3iRth88GomLFQLs9nPjAMhtKYOQWNlN+L6769YOg
	taLjSkpI/tB8PU+F3vYu9HZwalhbl35+LnMCx72xD6Mjoq3b9NMfJzW+pJ2XeEQJCDfgnqAn0e2
	oZ+5Cdk0E0VUZJq9jML4hJt2KssLGAAdJ9olU75CK0YIZJ5Sq/GCG9AMYKc2Tq2Tlf+JCrCw==
X-Received: by 2002:a05:600c:4f4d:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-4994e7cb0e8mr198492765e9.14.1786024097675;
        Thu, 06 Aug 2026 06:48:17 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:7fb5:508c:267f:30e7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-499542241cfsm63177955e9.10.2026.08.06.06.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 06:48:17 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Chen-Yu Tsai <wens@kernel.org>,  Liam Girdwood
 <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260806120952.GA2869284@google.com> (Lee Jones's message of
	"Thu, 6 Aug 2026 13:09:52 +0100")
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
	<20260717-axp318-regulator-v4-2-50aff97084dd@baylibre.com>
	<20260806120952.GA2869284@google.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 06 Aug 2026 15:48:15 +0200
Message-ID: <1jv79nweao.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 06 ao=C3=BBt 2026 at 13:09, Lee Jones <lee@kernel.org> wrote:

> /* Sashiko Automation: Issues Found (2 Findings) */
>
> Please explain or fix these Sashiko reviews.

I already did (several times actually) but for some reason, sashiko was
only replying to the DT folks and me (something I did not see until now)
... so when I replied, it did not get to you.

>
> On Fri, 17 Jul 2026, Jerome Brunet wrote:
>

[...]

>>=20=20
>> +static const struct mfd_cell axp318_cells[] =3D {
>> +	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
>
> [Severity: Medium]
> Does this hardcoded cell ID of 1 violate the MFD subsystem guidelines?
>
> If multiple AXP devices with hardcoded IDs of 1 (such as the AXP313a and
> AXP318W) are instantiated on the same system, could they both attempt to
> register a platform device named axp20x-regulator.1, resulting in a fatal
> -EEXIST failure?
>
> Should this use PLATFORM_DEVID_AUTO instead?

Already replied to this. As far as I can tell PLATFORM_DEVID_AUTO would
not go there. The driver is indeed registered PLATFORM_DEVID_NONE here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/mfd/axp20x.c?h=3Dv7.2-rc6#n1452

But there is nothing new about this. If this is an issue, it is
pre-existing one.=20

>
>
>> +};
>> +
>>  static struct mfd_cell axp717_cells[] =3D {
>>  	MFD_CELL_NAME("axp20x-regulator"),
>>  	MFD_CELL_RES("axp20x-pek", axp717_pek_resources),
>> @@ -1313,6 +1385,12 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>>  		axp20x->regmap_cfg =3D &axp313a_regmap_config;
>>  		axp20x->regmap_irq_chip =3D &axp313a_regmap_irq_chip;
>>  		break;
>> +	case AXP318_ID:
>> +		axp20x->nr_cells =3D ARRAY_SIZE(axp318_cells);
>> +		axp20x->cells =3D axp318_cells;
>> +		axp20x->regmap_cfg =3D &axp318_regmap_config;
>> +		axp20x->regmap_irq_chip =3D &axp318_regmap_irq_chip;
>> +		break;
>
> [Severity: High]
> Is AXP318_ID missing from the switch statement in axp20x_power_off()?
>
> When the system attempts to power off, axp20x_power_off() is called. If
> AXP318_ID is not handled in the switch statement there, will it fall thro=
ugh
> to the default case and select AXP20X_OFF_CTRL (0x32) instead of the corr=
ect
> AXP318_SHUTDOWN_CTRL (0x52)?
>
> Could this failure to shut down the PMIC corrupt the state of the CLDO4
> regulator by writing the power-off command to AXP318_CLDO4_CONTROL (which
> is also 0x32)?

That was fixed in v5

FYI the last version is v6 here:
https://lore.kernel.org/all/20260731-axp318-regulator-v6-0-b4e745552a35@bay=
libre.com/

Sashiko continued to complain about the platform id. I did not fix
because because it is unrelated to the series. I'm happy to replace
PLATFORM_DEVID_NONE by PLATFORM_DEVID_AUTO but I do not really why it
was set like that in the first place and if the change would be harmless
to all existing users.

It also commented on the irq controller but no, it is not required. I've ch=
ecked.

