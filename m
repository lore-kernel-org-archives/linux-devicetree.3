Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5652235DA63
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 10:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779012678; cv=pass; b=O86CIWDP1/2D+xecy9S0oBilU1V+AVspYosj96Hy4XG+wwJ4DDLgYSjH7iYdnFJJTsHJQYY3wlLchrE4JViglTmLuX1msRgU/PstGz9Ou5lUvHvGmYQB0rVmxdYESOHpsYDFRrhhlYLJuoxBJpCdCN5R9+/gutdym4Dw1+xhQqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779012678; c=relaxed/simple;
	bh=ifauxA5VPfHKLiYlXWLHFvyPEzmbAuAokN126eppTSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfrkgFoCEQMvURff+J7lKXoH7zUcYd4CAsmW9KeJIcJpSQHjcJvjNTgvSlEXac4jz6waNoLRU/6GGw4c6UIwlMlhnUgt9QHfTKQPRIXPUjdxuiNVookTSHG328KtmlieLaIuRh6CNwbtkR2SQB9lpUiEVp4msDaYOzeliSsgEK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rciXCJPe; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rciXCJPe"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30246cfd41aso2956934eec.1
        for <devicetree@vger.kernel.org>; Sun, 17 May 2026 03:11:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779012676; cv=none;
        d=google.com; s=arc-20240605;
        b=CpAOSEB3+tM2CtgRORSfC1iWqISXaUdI/ql0hDZWYvYVHVmeOedlTgDO46s59ndjp2
         0keXFiOc8trrq1tEiaIG4cTK3Bxq2M1r4csXBAXP3YFKJ9TETlL11dlvE506QkFbyX+p
         rMKt+odRKGar3+GXYTzxayuwQQqffsxddLJTMVw+ao7HXwCVSDXgSTKWEJdRnvvFXAYv
         m4xg49ylpg+6/0uUrgMT5aQOQ1vGDgns8NgBlhAyhtQSbZ04QgBNQiQu8Vb3706qsF+/
         Hg8QdnMRnuActM1D4jkiKuWjrPDYn95TBq7bQFtLved/XAvvFJ3Cd0qinvQlJV3j/xpa
         9lVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ifauxA5VPfHKLiYlXWLHFvyPEzmbAuAokN126eppTSk=;
        fh=EcroJvtbhiNSczNdNN0pSzdYrLtrMa0Lk7ZeohAPskw=;
        b=fbOO45kJ+uDhC1TuLQl12PplTpIY72Zv2nyoqvNY3F2nOmo6nCONIhLOjVKE9AI2rh
         4FW5F/CyAclviJhVQ9H17BSLZ8w7hg0CP73vCJIIVfqN2OJpQpxtQmsDSUgaLfoSuBRo
         DLhQTc9sZa1DhHlS6FhYhyXmwCcbldWlWolu+e70b6dOhBZJjybyCwWqKi/kShOWqWOV
         rF0EIK39Ko24Lyw/6IhzK3HN0t0De0imzNf2ZRXKByvPRH/4eKX4PfYNZ+zsaDma2Zhy
         HsuywJ94/Bepi0tX/ZBbx7Je3Ehh0rX4ITZXdogHIOqFFcQWQKkWwwOlhNJws9A7tYzB
         rHUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779012676; x=1779617476; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ifauxA5VPfHKLiYlXWLHFvyPEzmbAuAokN126eppTSk=;
        b=rciXCJPeT566uKV/w+At0X8Rs0RZV/FR/rji3r7v5LvvlzTyLylSU/Xzt91AF8VNNW
         XN8A0EauYbrgo4watG8Yts5hYBUsa709meo1B9CmObIghjF8H+BXZwjQt+yx2jMyDijH
         2iwsLse01gO9RFaghvIQuT7SbEbt2SVzdL7E+wFMBA3OoPrhnAENZnH/VClpeWB4dxyk
         oM3zMzSfboDWz8Vi28CYGvdqVRP3qZOWO5TjTgdfXKX1oNqoFXrB/XNvEegSWLQ3WnhM
         tEgJK2s49ifJyLvNL2YCaFkq1OK7DDMjfXTPd1Q5PGC2tKUQv7RQv04N1Qz/BWVn3U/+
         5DMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779012676; x=1779617476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ifauxA5VPfHKLiYlXWLHFvyPEzmbAuAokN126eppTSk=;
        b=XSppbV8C8F2h5SHP9LfrincKTFSZjFHXomCtNaG9X3LHlS8ZD3xcP508P0ieCeIotZ
         SoM43BV5xISLjYsNYqskd+zhv1lts6M94DrG/RzPbMDDbZ4Xml+wdyLegr3U86t2oKFD
         MUtTjWZb/n7P9f9CAJqGw7ecgotUWnWWTovz9yTsCm3YnariGhlNVrhF3e4FoLxHVYIf
         jKLREd/pFYOgNH9z2mLoscKSS3zPkGCqTPlT4v6owruQXGvnLVTecRWC5rok213ndJk+
         gc7wcfBY2RPdm+QbGYsyY65x3xITsx7Fddoq4KasFH3s9wkBJ4DiXfdhp05kRSumvgzB
         FlHQ==
X-Forwarded-Encrypted: i=1; AFNElJ/1PoNSx7khQjy2zYxgKL3r8RMWUndZBF1D+oB8ZqV6rlZGc1H8rEBr1d78hcBc+d41H+6Lqrq7H6Hz@vger.kernel.org
X-Gm-Message-State: AOJu0Yznhkix2hmUpjXiEc6aKnpCsObbpdl2/6MpBb2kyxdh6mnMP36F
	ea2vwPuWCpHw9pSEnBnko+6+z/WgpfU5b9ZT2udsV1rtuLZzuJcQ3qYBtQRVzIlcGAI3sM1XQ6r
	PmoedXKhJqXT7/9ARUWDJQvQms7RWZe8=
X-Gm-Gg: Acq92OG2cZo9+sudnR7sfeEFs/V/P+UWdq46MA7XXZV4Wo8QG6Dslp5OGXYEiEFoVM+
	SS7FBytE6OC2YFSy5hPvs8jTdWoVPRcEmOldUgMBjC4svXTEBrDhxw1FwoMKhLjqJyy4V0w6s/x
	MYAoMIgftR5pMd86xhUVt9Htpdi4z+b8PET8TGQ+2aruBeCW6gQqGiNIkGpdyGFa8/4MXEuEaiD
	/iB7PTQsfve1fcJCGudjR1idgmeiz3BuvfZrdAL7VCDXEa/dbXOvbIl1aGBhFJ+2xKodoFykkIq
	EigXHVnX
X-Received: by 2002:a05:7301:3d12:b0:2ea:5057:a304 with SMTP id
 5a478bee46e88-3039818a65bmr4929254eec.2.1779012676435; Sun, 17 May 2026
 03:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517074306.30937-1-clamor95@gmail.com> <20260517074306.30937-3-clamor95@gmail.com>
 <agl0Z_EGzX8X4No4@ashevche-desk.local>
In-Reply-To: <agl0Z_EGzX8X4No4@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 17 May 2026 13:11:05 +0300
X-Gm-Features: AVHnY4L0_43-8RfJ6hM5f4ALu2Syvstfg64dnmlFGgfmiwaNMhHznD8dW2kFuMQ
Message-ID: <CAPVz0n2D7q5kEECPr+bo=W=5OU=w4eni-FccdMEUMupkzHhvLw@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] mfd: lm3533: Convert to use OF bindings
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 17 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:5=
5 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, May 17, 2026 at 10:43:02AM +0300, Svyatoslav Ryhel wrote:
> > Since there are no users of this driver via platform data, remove the
> > platform data support and switch to using Device Tree bindings.
> > Additionally, optimize functions used only by platform data.
>
> This is a mixture of at least (!) three patches:

Maybe you can make a list of how to split it then. I have tried to
make it complete and remain readable. I am open to your suggestions.

> - devm conversion

This will be dropped.

> - the change of some constants

If you mean LM3533_ALS_RESISTOR_MIN and LM3533_ALS_RESISTOR_MAX they
are used explicitly in r_select value. Previously it was passed via
pdata as register value and now it is obtained from the device tree as
resistance in Ohms and register value is actually calculated.
Naturally ALS_RESISTOR boundaries changed.

> - the rest
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
