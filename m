Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3383C3859F6
	for <devicetree@vger.kernel.org>; Sun,  7 Jun 2026 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780840935; cv=none; b=oK6pXRhMZ7Xiw2lo/Z7SbsdkBNZ59RRP75/KG8HVMu0GVJIBwFvYUsr2LJXarsqgx6+Hyx2UAoxDU4ZJTygKAUscPl0CyXsmq77nZ+/DHtXMOzWX8gtKdc1sN72YQQDrIXW2/RgEpOrwN4rKuGJ1FYSA1Gn+h4PEnVXySLTCoMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780840935; c=relaxed/simple;
	bh=dztEsTWxmH2haAYHQs1wZXsZ1TJJ1TM6oh4YtQz6xLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AD6hyextfJX1hqXrjBPuZFWQn/o2+3jjeCdJXA4tiESi+6qnCjMbSK8eNtFbVazR3uIe49xqogKjvsa0WsKpMDkIlMdOJkv/MNBzvG5BVvd8bLol0jgJOmyvLb5AU2R2d+gGt8HovmLJqckbrwN8jz28sBcxgJ0X2EXAf+dYzBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRbmxDSP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRbmxDSP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so301245e9.1
        for <devicetree@vger.kernel.org>; Sun, 07 Jun 2026 07:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780840932; x=1781445732; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t6VglNTovUYCDn8ZP7dcNe/GS5KXZ47ukCjoUu64dW8=;
        b=SRbmxDSPJIIPclqUc8DZdFSHJ4e93XqE+B/xyowt4JJf21b2H0WbTYo20G9gb9pUAL
         wO2/Dln2FuRXCokDI/od2Py5JiP0NthCmLSsWGm7sVf+xYZ17FcXoU20EcVdZn1N0IAD
         UP20D0ceLWKIOlwKr7WPz0e3n8Bi3wsOegtdx3qJmxfpllaZ/ElMrg44aRVXXN1zwsaF
         w6Gh/+yvf1d27flEz7ABwWbDsqveCkb9mv55G882a4ZjHDfHIJ3zWo1x64PLyQf/+Cfk
         HbWIqJGH2UHyq6UEVac8TOWF1eY5dVri+8ZZHj4ruyRbObFlrObn74Bw3yECyHa2YeBP
         ocSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780840932; x=1781445732;
        h=content-transfer-encoding:autocrypt:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6VglNTovUYCDn8ZP7dcNe/GS5KXZ47ukCjoUu64dW8=;
        b=LdaFyHvJSk5Y6WKsE0JZcJsfQmWyEseqV2VYNlcXL9ZFRWs7VleOg957uP0gz7PILD
         l4thJodg/Xr4aZ+O/IJuT4dJoNC/czUUDj8lvzj6hzekHz4XiHIcBlOeAoMiauyd/uyk
         d1xsiGf+wmRYEMUbTDb698RH0+3o/jdCzsDUxaQu16Gs6rcwGSw6vyenK8jh+MlwaPzZ
         +vdIcpWutVFHH2pKcbmSJecqC+3T1Ssg8/ni9ye4S5xXEp5MKtgdoWAdAv5qz9IY874X
         hKwMl/nx2qixKj186m3Q4jq6DXHg5EySFIQPugnhjsZXOROe3PVYNN1T8zPSqW6Jd8xe
         Xp1Q==
X-Gm-Message-State: AOJu0YwtgExVN/h53J3XaS+kztYvvH8qs57EsXM0xz1+OUYIb7FfkvF6
	c6sjB17kOSgwyTmstB2ZybSOvw7x3/npCPcZUD3eOXBq84NIKflSzspl
X-Gm-Gg: Acq92OFZMivQyCbyv8sf3B9AMtqw92cWQfwz6ZzAQ9kLo4V1Lb8BKG+Hnq1jdiMGtbW
	zEDJe9VevQ9mFZSIuTa4ZzU0knw4xARPvMNlHEpqFMhWIkiON2Jlc4jPmHxPjJG/XRLjrDpA+k0
	nOhgu3BxWkTJTMFAzdJ66ZkUpjrii2loUzmI8BAFpG4EYopUme5D9AjBxP1L3VuOYtsOr6Xji5i
	hRPa1HeKDIVdURuKM4N5DXzgyrz5W/dSE04cWpKwE+W8V9JGDkNqs7c+idXZoayhHP6v8xC1k9u
	HS5TmPYumvN1EkH+L5xVUcyXQrq90o7K0e9FAy9njk8zn7tVDO6R8FDDR/3jxeusQTFS3ACYDVP
	++YZGyNFmW0DcgI4L+gxEQz/jwAaTNc0ZDI372MelR9nV9brThzizO74u4I3LTnMcD1NDObwclO
	iqcEyVKbUIrX2GVgrvlelihcNmA1FkCuUsF8ie8/IQpUiWhXne/AfqFcJBesWQ2C3X+LKN8Bna2
	M+8bxwRUhTX3gBQ2e/mSoiWOn0xjdGnOoBGLciKY8F2bQ==
X-Received: by 2002:a05:600c:190b:b0:490:9804:afdc with SMTP id 5b1f17b1804b1-490c25ff35dmr203817205e9.23.1780840931356;
        Sun, 07 Jun 2026 07:02:11 -0700 (PDT)
Received: from radijator.localnet (93-140-232-240.adsl.net.t-com.hr. [93.140.232.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35eae5sm44141055f8f.33.2026.06.07.07.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 07:02:10 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: Karel Balej <balejk@matfyz.cz>
Cc: devicetree@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] regulator: 88pm886: Add Vbus regulator
Date: Sun, 07 Jun 2026 16:02:08 +0200
Message-ID: <DRas3NvTRJi7jDZJc8QqTA@gmail.com>
In-Reply-To: <DJ2R7MRPNO5X.2WPLSEDZFAJ3G@matfyz.cz>
References:
 <20260526-88pm886-vbus-v1-0-f2bd1fd3c19e@dujemihanovic.xyz>
 <20260526-88pm886-vbus-v1-3-f2bd1fd3c19e@dujemihanovic.xyz>
 <DJ2R7MRPNO5X.2WPLSEDZFAJ3G@matfyz.cz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Autocrypt: addr=dujemihanovic32@gmail.com;
 keydata=
 mDMEabRVUBYJKwYBBAHaRw8BAQdAG5VJBpoPRIGQml4+E2LcPdyVtnXRuuqoD1BsHxRjNQ60KER
 1amUgTWloYW5vdmnEhyA8ZHVqZUBkdWplbWloYW5vdmljLnh5ej6ImQQTFgoAQRYhBJvUYwF2kA
 idqo3CZidfVEs7G0eSBQJptFVQAhsDBQkFo5qABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAA
 AoJECdfVEs7G0eStq0A/1SDcm8Bkq1JV+GTGMC8qE1QzCFvnoJuZqtUuQRCkd31AP9Mbc3pmg1K
 JDxgPl17/CQohZ98dbUVffmdQpJJLLMsArgzBGm0VXYWCSsGAQQB2kcPAQEHQH8nnS6QNfgpc1Y
 tqU80DWMWMsDPEGJ7yZ9Nf90mPEEQiPUEGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCab
 RVdgIbAgUJBaOagACBCRAnX1RLOxtHknYgBBkWCgAdFiEEA6Ue0g5lV5FAcj1ivjIt18NZWcUFA
 mm0VXYACgkQvjIt18NZWcUyDwEA5OK1WRFN4/psOq/bS6Wuh5ysy0CyXIydqIwDJDdAFukA+wfc
 lr1qyAbEX0FHVunCl+sxv/ymvjsup85rAH+a2j8HA7gBAIolabvAIUTUfCQNCu5MUt482b2EC8K
 40xl/6HT43dunAQCqxwRLI2k0xmTdia2AZwqbbMvqWonOLWtdZwWvodgjBLg4BGm0VaASCisGAQ
 QBl1UBBQEBB0CoqkQL2R15WHRvj3RlkxjW3pPpZVUOHyfhEX+Q9PhTcwMBCAeIfgQYFgoAJhYhB
 JvUYwF2kAidqo3CZidfVEs7G0eSBQJptFWgAhsMBQkFo5qAAAoJECdfVEs7G0eSnB0A/3oyRxS5
 cUJMNnM1+4UkRahmU5/42NfVOxIL5d5oaW13AQD617LpOfnCuZR3U0vHLOW5vrnFtdvi32N5zLD
 9wyShC7gzBGm0VbYWCSsGAQQB2kcPAQEHQPRL1mWe9nIhjicyAqqEN80IXEF0NeKSFFpN8n75b2
 YIiH4EGBYKACYWIQSb1GMBdpAInaqNwmYnX1RLOxtHkgUCabRVtgIbIAUJBaOagAAKCRAnX1RLO
 xtHktyGAQCJPD6JsQhQZEB8ciZrJz+hnonsJp+KZZQQGEK/KsLHEgD/ePz/x0pQdI/DcJd/5Qge
 +IJGd+jyv4zyevPxipVbyAo=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Sunday, 7 June 2026 12:44:08 Central European Summer Time Karel Balej=20
wrote:
> Duje Mihanovi=C4=87, 2026-05-26T21:14:49+02:00:
> > From: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> >=20
> > Add support for the PMIC's Vbus regulator. This regulator is mandatory
> > for USB OTG support on boards using the PMIC.
> >=20
> > Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> > ---
> >=20
> >  drivers/regulator/88pm886-regulator.c | 27 +++++++++++++++++++++++++++
> >  include/linux/mfd/88pm886.h           |  7 +++++++
> >  2 files changed, 34 insertions(+)
> >=20
> > diff --git a/drivers/regulator/88pm886-regulator.c
> > b/drivers/regulator/88pm886-regulator.c index a38bd4f312b7..039822e86ec8
> > 100644
> > --- a/drivers/regulator/88pm886-regulator.c
> > +++ b/drivers/regulator/88pm886-regulator.c
> > @@ -4,6 +4,7 @@
> >=20
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/regulator/driver.h>
> >=20
> > +#include <linux/units.h>
>=20
> What is this for?

Leftover from a WIP version, I'll drop it in v2.

Regards,
=2D-
Duje


