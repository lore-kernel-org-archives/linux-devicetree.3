Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC0645561B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036669; cv=none; b=F/T6Jlr3ukBq2S/jmaAEkdNpi2hOUdNGhZxY4syfh62UlA9HAUW320SeI++NN7f3aZT0TGdUE2UnXjro78BduYgtdHgJbWeqNQW/mnZyG1+o6IBh5+/2WAT56IvSvu7yHA3XLfqwI977t36szxYEQbYxHyqEQoYyHWPG+sLHxtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036669; c=relaxed/simple;
	bh=rMU+PmTBon7MZYNFvL/32kuzRyhojyfvr5NuoahMVyA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DST/sJCx1EXyBG9mgfYVq//0L2z9eWK3joYTb9gGLjHOKP1muHHZjFrc9yjmjGuX8c4lSxJfb/m2HMiTPg/DzL3du664AlRH1NNJFkOhGFS6Hm9VQZ+V/69jsMHkjCd18mZsSOsYQ3lNEkG3K2L+X5dYmvKeD9nt/hOR8pRnTsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZLFHAjRT; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZLFHAjRT"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso448512f8f.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 03:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789036664; x=1789641464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6EF+UHNSS4hI0lePcCf3NeWVNl/rHsUyRzTVnqSXcQw=;
        b=ZLFHAjRTqVt2eU0aw9xyeqHi+NAZY/oO//FjJbnS353FBdFd52ZeEuIWYDGHnbuFEM
         incEgmzooYVYAgLWJMlgM/NDKT/FKEaA34wu4opR7hewn0hq7SKDpvKN4EGfBFt0r8Bv
         zgnqpnVYeX5LdqTZXss//uZJ9Wz8RlzAgsJaFyN+MCJEUBNWDn73AaV67p7D9aF/NCh4
         D2qkWTBHCK7i1Aa+RzclP+aFQTNjBQniBfpdVSVcgg3/M7MG0hlhTgqeIPW/7cAkhQBF
         MuRiI9aqfpWZnPnXSRPsZ8IgEtSZxAe58gyRmJRrfg3ok9FhzKllf9b1+BKdPmnrRFk1
         WQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789036664; x=1789641464;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6EF+UHNSS4hI0lePcCf3NeWVNl/rHsUyRzTVnqSXcQw=;
        b=aBPHkvF5RPvS5DnH14nmnv4tQW+blKbMBSdvf7B9DqSSKLuKNnGq0IycTm4IyciNXj
         dHUzeYt6gMw27eXajK+xR8pNm/1v0DJYDZ7R1tdV/9XI48UOFqwbgLfH7RMddo4xhiJb
         SgnJ/M8nfnb7M/rySsj0JYbD1QKCP+KhedwxSOMzoWAkjwHhW64JXMMvbUviYA7MBULm
         vcIxAZcVSuUtk2l7meq3iUUNqKvDPWdZ3TzNNL45af2gQmvEBix8QMNNq5hg/XtD8Q45
         FTnsMdJLTYE+gToTbXTe34hlpZ0xUqznGc4Y4AKvCqkR5X8zdLvYz2cyNOLZwNVNUfbx
         x81g==
X-Forwarded-Encrypted: i=1; AKwUvBxboAa7FduulbHhZLD1PdlqqTS1ANz3DeifQO6bXs0ge07uf4MxE5iBQ/y9h1tze941/6Nk2VRFGwer@vger.kernel.org
X-Gm-Message-State: AFuF++nwkkWeOtVsSG76iouquXRngaS0IHXWHsrV0n4Ur6vIkr7aiDeh
	v8jbexXwJiWlstr/2SxBiGJ1XpXnL4Xa0r9U8fd22SeCrVsTPgu+SBArXM4hI1dTDpGBJYG8VN7
	0R9VbAEk=
X-Gm-Gg: AYBFou3ZqMEkzaoi1BX5Nly3AZbaS2lVDXwZGOwkofGRuFBZ6uucGFh3zlQyqRD7VMi
	aCeLIj8TNitIwdLk6XLzhGiUzVPJTs0FCvN9Ix/fakmQyaiLQZmEw9bMRKIlV0QRcJEt9qMwE9T
	S58/dw26uh2/LXrQqFw23uYJUG/gx5FqAFtUxUu7Uxycz9m5D8drYFMv907mSs19MKcbv848Pud
	XnkZWMGi0C/FYsG88c012R4UECf9R7//GLtMZ9Mnmu+gcLX/Ov7AQ/6AQvepwuTA1mf3TIu3G9Y
	btIQ2MeIa8b9QbTbeAn++CIEpF54vrSdoRAbLRKAnpI8YTrON5guhl6FFTPLxwzTUk83agX3HO2
	MI1WBJ6A0purGzqmD375id2uh3uCoUBLhvafwFa670Utu3UEpLAGIeptqEI1U203Y6eL4Xhbcy4
	97nJFg/r//fIaJbC0/Me/DVSBCIWyRZa8RVlT96Rs6Flnjm57KX2YYWwy8l5RXC8wCGVPNMQ11Q
	K7B6rUUPV+UhnpbRw==
X-Received: by 2002:a05:6000:24c1:b0:484:482d:dce4 with SMTP id ffacd0b85a97d-486d7322325mr4803704f8f.0.1789036664113;
        Thu, 10 Sep 2026 03:37:44 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ab73c2bsm48835518f8f.22.2026.09.10.03.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 03:37:43 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-sunxi@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
 mfd@lists.linux.dev, lee@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 3/5] dt-bindings: mfd: x-powers,axp152: Document AXP318W
In-Reply-To: <20260910094251.A112A1F000FF@smtp.kernel.org>
References: <20260910-axp318-regulator-v7-0-de720ceb9bac@baylibre.com>
 <20260910-axp318-regulator-v7-3-de720ceb9bac@baylibre.com>
 <20260910094251.A112A1F000FF@smtp.kernel.org>
Date: Thu, 10 Sep 2026 12:37:42 +0200
Message-ID: <1jtsnx75op.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 10 sept. 2026 at 09:42, sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The new `x-powers,axp318w` compatible string is omitted from t=
he conditional block that makes the `interrupts` property optional for rece=
nt generation PMICs.
> --
>
> commit e4119d6ce87c67baf660bd6f040790fb69b77af3
> Author: Andre Przywara <andre.przywara@arm.com>
>
> dt-bindings: mfd: x-powers,axp152: Document AXP318W
>
> This commit adds the compatible string x-powers,axp318w for the AXP318W P=
MIC
> to the binding schema. It also adds new input supply properties and updat=
es
> the regex for matching switched output nodes.
>
>> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml =
b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> index 45f015d63df16..38556c32417b3 100644
>> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
>> @@ -83,6 +83,7 @@ allOf:
>>            contains:
>>              enum:
>>                - x-powers,axp313a
>> +              - x-powers,axp318w
>>                - x-powers,axp323
>>                - x-powers,axp15060
>>                - x-powers,axp717
>
> [Severity: Medium]
> Does the x-powers,axp318w compatible string also need to be added to the
> earlier if-then block that governs the interrupts requirement?

Ahhh, got it the other way around first time this poped - resending ...

>
> Just above this hunk in Documentation/devicetree/bindings/mfd/x-powers,ax=
p152.yaml,
> there is a block that makes interrupts mandatory for all PMICs except a s=
elect
> few:
>
>   - if:
>       not:
>         properties:
>           compatible:
>             contains:
>               enum:
>                 - x-powers,axp15060
>                 - x-powers,axp305
>                 - x-powers,axp313a
>                 - x-powers,axp323
>
>     then:
>       required:
>         - interrupts
>
> By omitting x-powers,axp318w from this enum, the interrupts property is
> mandatory for the new PMIC. Could this cause device trees with an unconne=
cted
> AXP318W interrupt line to falsely fail dt_binding_check validation, given=
 that
> similar recent generation PMICs operate fine without it?
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-axp318-r=
egulator-v7-0-de720ceb9bac@baylibre.com?part=3D3

--=20
Jerome
