Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055737883C
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 18:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374788; cv=none; b=pV5ApiP57bcxImhwC5WLX9qnU7vX9V+VgAC7MizuXR5wozArQqLcgyD5l4K/3osJRKdJPINdileP7mIBYNkd0LGPhBJtHNLfrJab3ChIA0L3gWLnAD6H9gRvESH6MJ2wnwH68D+/sxoASQ6SYS51slVZONlzoWAwsDbJArlN6Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374788; c=relaxed/simple;
	bh=yygwotQtyWeWeoFbS6x/XaiiBa01Fa535pcusnuGMbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XaZV3Glb+yhNNZpRhvOVyFp8KnijbwjJ+B2HQUdYgRlIOO5zCYOJl6MNmRp+6Cbr2t/JqtGlwCSVdFZymXf//8fcLNAu5hTIEDVUc4mXDHw/AF4FfC1yW2vFc86ZL9LlLMqYPt2hvrr41SxItVy6Zc0SyJgjiAsmBEBFFV6xC5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=b9OgO00j; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="b9OgO00j"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48433e9562bso283484f8f.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 11:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788374785; x=1788979585; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wuAtzw2j6ol/nKID6h+TTCRJxAaTJJD8KprJBxaZGcU=;
        b=b9OgO00jb4Xd5kYJbVsGnVM4BUM5xyHyDq65xYi9Y3jdd40BOt3AjaH4mPntl/C/B9
         2FoCJ6WJ3wuXiFue9qEV1DStBjBVdxEb4GgeX0zpAMjdUAsWhEjZhFCUojh3q3kD+A3v
         KSoUIJRdX/uNHaKLhcGjyDQpeiD9d4oE0xJPBm2NOoBflHpM/BEFfi1FmPmXk6R6Uf7E
         MxJtzX6f/JDr0l2ureaHEgrATs1159FFP2HZ+VxC5DmRO++Hcq+MTejWHyBmuWpaEprZ
         SM60cHppgjalcahFhwBPxX/YNRL3JVePWRa4/78FPzNLLkRuQBZvwWEl9VSW32Oo0FA4
         1I2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374785; x=1788979585;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wuAtzw2j6ol/nKID6h+TTCRJxAaTJJD8KprJBxaZGcU=;
        b=nFoCckWcbkXkTrzSowkvDc+5Pu+Idr0cH+pj/y3pz96HAIaJ35PaH59V7kJQQCavm7
         MSZCJ7CDyoFyvq08CWw/lGXYFhj0jsM+eG1V92da9qznQve7LU9jukT4R/K+2i+5vrQh
         on39LpVuigllCGLcmDJ/Zj3+5qeDKOX2pHlMbWz5fmkGEn/uuU5MXM954bRtttRcvITl
         jKrhLeFpVBcbEF/NPH2dOLkFeT30G2W+lfA+L5leMqXCOeG/FwE1Enw/sCXFFdwNJy2P
         bHlCo72qkfZHLkqbbrrIMfd2pg4YikpuJKbPx0BXtPjC9zwapNL+nOd+p3fjR1Ghyhva
         UE7w==
X-Forwarded-Encrypted: i=1; AKwUvByZDzWAlk+62b7pRnBUecSGSkA3dPDvCwdhommnSiZrWn6/dnFOwieeeG8cGBND3evb97ognoSy5Dex@vger.kernel.org
X-Gm-Message-State: AFuF++ko72eYji5evBn/H0bjHyzcYQ7V4scB8bipQm/5lvUMNAB31x/c
	/sbrfwRZYeHmXI0VcuAdTpejZH+rYGeBIZp9m4XkOPI9mZTn28PjXOCneVfWkKFSvBM=
X-Gm-Gg: AYBFou1bQ97dQlO+1BG0Jq4JdB2uLc1Eg8upSaAtmYah02LuzSyN00lZumek+4dC4sz
	lBxY9qhsm1R+HZUVMD77s1E1t+fuSoKjBy5bPyJMiuczV7V+olD8U6IjbpBMLIEgPkn66T0szhI
	1NKaR7Hpjyf1ZvU530CoG5RnzbaaQq2lIGzGPYFUl6FYXLoe7Fgfxlr77PkhqlOCq82C1/TEp28
	kcVOtUSjRGHqaR6ltuWFfPY9vs1kDi+wBMYEAMB+4TnTXc+cl9aCpo0jz7QFbiHHR3Jr1f2oych
	8JHPhmQ61kXI1R5FFrWtXbKU3/bgGtRwKlXukQR68zmpGRiZ9ruHF6DpoYeimNqGCvJGZzMMJnB
	Mc2edLPNrg1H5h1rJn5l0SQ6QXQKvmebl4+MNDVzPu38uHq03wqWObOSC5ymV9p3+OyKlRTzQQT
	ZuPM2+e42GYUFTA8go65BTyApalvRH7spqbEjjUxCuf3ZWqft9OGN8IMdX1A4iZTrmEBpVYG2yj
	q2Qt/k=
X-Received: by 2002:a05:6000:240c:b0:484:4817:85db with SMTP id ffacd0b85a97d-48488f10241mr11800333f8f.14.1788374785193;
        Wed, 02 Sep 2026 11:46:25 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm8160630f8f.28.2026.09.02.11.46.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:46:24 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: wens@kernel.org
Cc: Andre Przywara <andre.przywara@arm.com>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <CAGb2v66Uz6hCQaf5Nk5Eup8wQ+Xo9tuAqm0+ZH9J5CbT0zyAPg@mail.gmail.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
 <CAGb2v66Uz6hCQaf5Nk5Eup8wQ+Xo9tuAqm0+ZH9J5CbT0zyAPg@mail.gmail.com>
Date: Wed, 02 Sep 2026 20:46:23 +0200
Message-ID: <1jjyp38pa8.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On dim. 23 ao=C3=BBt 2026 at 21:17, Chen-Yu Tsai <wens@kernel.org> wrote:

>>
>> +enum axp318_irqs {
>> +       AXP318_IRQ_DCDC1_V_LOW,
>> +       AXP318_IRQ_DCDC2_V_LOW,
>> +       AXP318_IRQ_DCDC3_V_LOW,
>> +       AXP318_IRQ_DCDC4_V_LOW,
>> +       AXP318_IRQ_DCDC5_V_LOW,
>> +       AXP318_IRQ_DCDC6_V_LOW,
>> +       AXP318_IRQ_DCDC7_V_LOW,
>> +       AXP318_IRQ_DCDC8_V_LOW,
>> +       AXP318_IRQ_DCDC9_V_LOW,
>> +       AXP318_IRQ_DIE_TEMP_HIGH_LV1,
>> +       AXP318_IRQ_DIE_TEMP_HIGH_LV2,
>
>> +       AXP318_IRQ_PEK_SHORT,
>> +       AXP318_IRQ_PEK_LONG,
>
> The order of these two are reversed.
>
>> +       AXP318_IRQ_PEK_FAL_EDGE,
>> +       AXP318_IRQ_PEK_RIS_EDGE,
>
> And these two as well.

Applied everything except this is last one.
AFAICT, the IRQ above are not inverted ... but it is slightly confusing
because the regmap_irqs orders it the other way

Thanks for the detailed review=20

>
> Once all these are fixed,
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
>
>
> ChenYu
>
>> +       AXP318_IRQ_GPIO1_INPUT =3D 20,
>> +       AXP318_IRQ_GPIO2_INPUT,
>> +       AXP318_IRQ_GPIO3_INPUT,
>> +       AXP318_IRQ_WDOG_EXPIRE =3D 24,
>> +};
>> +
>>  enum axp717_irqs {
>>         AXP717_IRQ_VBUS_FAULT,
>>         AXP717_IRQ_VBUS_OVER_V,
>>
>> --
>> 2.47.3
>>

--=20
Jerome
