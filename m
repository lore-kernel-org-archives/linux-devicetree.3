Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351D537A4BA
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 07:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779262541; cv=none; b=YZwD8Jx9Zz6k2Vz6/Ac9bUsxucZGBUTW9F9uxc5YGksaMWWXTOLSFSOrDZdSLQEQTYdu6iRfsfpsUyyMILMLznUEnvtC9cJz7+eargfV6t2srV7YWBExwjlBPUaaQaHNhLpuYuCZmAfPEH+3NdPi8B2RtRlXSgv3T1gQp0JnJkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779262541; c=relaxed/simple;
	bh=1ntiWYdL2b88pAv5PxDRYimXgveFmsN8k/24s5algFs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cbaGOY6OSoKeYFtGd4hNvxXayg/xauxyWIDr77ar3LqfdEnZR/k/6X7zkxCucR9N8Z2+Rsow5F547wAsEVftiYwwB12+QIV318D8d/sEk2mqPxPyspkD11VBodTOYjlYKDoHnreLFlQXsipfa8+MSQaUZ/foF2KZs4HdXXaajSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XfvLOCv2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XfvLOCv2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43fe62837baso2524263f8f.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 00:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779262536; x=1779867336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ntiWYdL2b88pAv5PxDRYimXgveFmsN8k/24s5algFs=;
        b=XfvLOCv2/ZcWOK3VNvHL0FZbp2joQCzzZw0lR8WQXKnIq/mPadRYOrtpbVPFsSW//t
         Px6b9cQ8n9bLVS/CT9C+UUK+fos8cqigh8f141FF1oyytzrtJsavJ4ciEQF86RQZOdqn
         grB7971D/drXCF33mt6oV5+dyHc8jFkeJgENR3z7mS3T6zRP0pEDy0h780RbZMKCZRz7
         q7ISu1Wk3sx3Og46qOSjPQbfiUY2coFYDqdlCQKexv8TjuUVq81ggnsAwYJEPbk6UFJk
         W4cpx5pUjq4A0g5Acdcrmjbi7nYos70gWZ0yytp4SSVzAPZAoPDNeH4DIinDaNacqPcv
         Ygwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262536; x=1779867336;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ntiWYdL2b88pAv5PxDRYimXgveFmsN8k/24s5algFs=;
        b=PkkU6aR+AP7xIz/Tut59oXzQUjZRcQZ1oGX/RxVecJfXstB+RaK9I4W9B7gY9fzVkt
         2+f7VUEFzNBZop3ziFPlRtd/gbeTH2HY71Hk65s7Dq0N12OE18HLTb3u2HNoknru3vj3
         YWPtu45aobgOOMQSo17hnFyeI2IY/wLOQHTUmkT5c11X8zz8QFKgfsU+RuEacqicYcJf
         shwWzc+xbF8T0EP2c3t0bolCuR0XXpRdisEA7qX+5HjoETW8LStZSGCf85AMS3et2P2w
         NHP2KzH9Z5DrV4NpAsaTPsrJ9cMhrDk3dM6KaWCzOkUSCDUPn2QISx1Ohwhgf4IEVDIF
         w50Q==
X-Forwarded-Encrypted: i=1; AFNElJ+HeXNovBgu3bqRSK8f84taAPEq3Vf7rUmrUckwyYN/RRSNhIPDJv0asrVv7yMIJgxeX36HfaMEtJeT@vger.kernel.org
X-Gm-Message-State: AOJu0YzSUwEogzo1kvqA7A3XRuwK1uBTgdh0uhIwJ0yI8dZmV6Hg3CQ3
	W06K2jxwzExZDuG/4l85eB3oHKyE1D44AJnHntfOyKQyxfBaFvgEVSdQZyL3mnnQxMI=
X-Gm-Gg: Acq92OF/sRjFlc+bF2lZqAlhOVlgTtfVSxEfiZjtWCgwGz2AfMj64k+R1ri+wZuh9sA
	xdIR/Xkt5coID9xrHc6rsgCT8XuUGWacNEJ4UTsq7FDyjuB6tAkBGaJSLNCsWnlN0lN9bKKw66R
	9VsDo/L1cwW2Fr6/91W/rY6zHxTEDQPwocOosZec7vRGwIuQbqO7DSwF2UBNe9PCN9421jOePaK
	vEIKoCRtgE2rgXrg2T71h/Dw4UKiG3gK9Cjw2tg7KReACQCc1Z1WWf/+5efesDPrywTt5RGeGgH
	79RMTJAe9Vy0GTAuLamP/rgTflMcmPANjyR3IyJ9iWC3p4yJIk5nusd+NqR11O1hM5YY+hmi6vI
	iPVt7a/IAvIA9P8zAwUW0AZnHLbYMZnQBtol0nHKE6MFGT5VeF91vvT8/mSA/hsN5GVMkrwk5C1
	v9VEVsaKBTJGSV7FGQjKLQ4w==
X-Received: by 2002:a05:600c:1384:b0:490:2238:4021 with SMTP id 5b1f17b1804b1-4902238403fmr70491165e9.8.1779262536295;
        Wed, 20 May 2026 00:35:36 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:fa19:c0c9:991f:186d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45da15a562dsm52671515f8f.33.2026.05.20.00.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:35:35 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
In-Reply-To: <8d89b669-e72e-4663-9596-999a12922d32@amlogic.com> (Jian Hu's
	message of "Wed, 20 May 2026 13:47:27 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
	<1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
	<8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 20 May 2026 09:35:34 +0200
Message-ID: <1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mer. 20 mai 2026 at 13:47, Jian Hu <jian.hu@amlogic.com> wrote:

> On 5/14/2026 11:11 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.amlo=
gic.com@kernel.org> wrote:
>>
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
>>> duty cycle of 50% after predivision.
>>>
>>> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
>>> pre-divider division factor is 2^n.
>> I understand what you are doing here but I have to ask why this can't be
>> implemented with independent dividers that already supports power of 2 ?
>
>
> If we use independent dividers, the n member would have to be removed from
> meson_clk_pll_data.
>
> However, n is referenced 35 times in clk-pll.c, which means we would need
> to modify all
> related logic across the file. This would be a relatively large
> change.

Yes

>
>
> Moreover, for all Amlogic chips, the n divider is an indispensable part of
> the DCO clock.

There is hardly a justification here

> The difference between SoC generations is as follows:
> =C2=A0 =C2=A0 Previous SoCs PLL: n =3D 1, 2, 3, 4... (linear divider)
> =C2=A0 =C2=A0 A9 SoC PLL:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 n =3D =
2^0, 2^1, 2^2, 2^3, 2^4... (power-of-two
> divider)

Yes that was fairly obvious

>
> Therefore, splitting out the n divider from the DCO clock might not be a
> good design choice.

I'm not sure I agree and you've only stated your point of view without
providing any technical justification here.

From the datasheets of the different SoC we have, the documented
limitation is always the DCO output rate range. Nothing related to n (or
m, or the mult-range for that matter). This is a legacy problem, we
started with monolithic driver and slowly simplified it.

As far as I can see now, reworking the PLL driver to be a simple
multiplier driver with range output rate constraint could actually be
simpler than the current code. I would also make simpler to accomodate
differences such as the one presented here.

Unless you can provide technical reasons why going in this direction
would be incorrect, that's where I'd prefer to go.

>
> [...]
>
> Best regards,
>
> Jian

--=20
Jerome
