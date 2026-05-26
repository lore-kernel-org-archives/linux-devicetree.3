Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148073F88AA
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798438; cv=none; b=oDJfZduAjdqYmFFCOt0MhsoxVA6Ht2FJpThqSFiGOzTugRLGaLzm6iTAPmJk6GnpwGfvZiovA4kQbEdSQFW9pdgdKaVy/wOPyovhyy7vQ9Gtz75jCVVXRq+V7h4TcTZXY0jXcdmNKQaQLwPH35vQBvXWPB0iqUod7QdvhKxfT8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798438; c=relaxed/simple;
	bh=qRnUxvygp1KcdF2l04pnogmsyxmTPyetgRbXjdsRehE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XViPyQtcL6TD51u/A8Xr78RRDpTrs62UCJ/nzyuoJ7SqKon6LbtG3vU5B8NCE1SdRyJyfMzTDHPloZT6eqFxtf7g01UTyB05rqKP4pDNi8FqyEYOfPeA3/A22C5Lo+K//PReVpGv9XKZjYUbGQKvAioJ/kc7B+mllXzJyXqGOEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ptZXLKJ7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ptZXLKJ7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so4634939f8f.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779798434; x=1780403234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cGdeRIyed7u9Vu7ldN0+lFeh1o2iiXjimB366st4kA=;
        b=ptZXLKJ7vVSlo9eQltDXhMGdyc1bbQb21NUD6EcnRWM0p21m0qOfWM7NG2/zyPgcge
         C4KbOIJJIQNPTqUbESio3N/GNIrxma6UyPQ1LJaKhp2c/QWFmaQdZmUbDJo57nPbyEXb
         d+5LFyFkCT7WnOGlg8EHvL41YYT57mpqFeDvYk4OESIRwSGN+SJFh2RhJBbPq5tz82PH
         1mj8yFAeuwMcsgwWCmPFwM6ow9b5jHbuQaJtbLv3YqjyKVKWwduhA99IQwi7+WN2P4Zd
         dh7VeZJwQIjgDgNgJte+WPb9wyGeH/tXWTyBhGF3PcdDS3d7ItJjkCGxIDhMpdwTjyI/
         PEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798434; x=1780403234;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cGdeRIyed7u9Vu7ldN0+lFeh1o2iiXjimB366st4kA=;
        b=rPm89daUFfNSMFAenwZNFUKt48eHJquRyG2CK+UiNqsoxlBsFbmux6MXyaZxamw+OX
         DQMT1JOxMpHCJXwUUszYUpGrydlgUQ/T5s/Tf9t2SolBJf1M7kIDAEAvFgykul56JNyI
         KNEeEbimHcH9GSkdQ8nL1XDMZsh0Kz3XYm8Z7ncnkbW7mWJosYoFUcFW53mGB+j+pI3F
         kZGaHB02Ns4XxzTgmFDylncUcg7fH3LTfY1YFcI8AolIVJCMmWPPDjNZl4HNsiEafpag
         J9vTH5Ix58566L9Z3SR8t4ghGtxd9UyXJQceortKLmTMveoWnQymaWxKz9/T77APyQgJ
         2oPA==
X-Forwarded-Encrypted: i=1; AFNElJ9DLoVt2YiEfW7CRFvGBJzoZX9V9bcs2UlV6sKh6k1PirhZaAH3APxPODKFlwWwO4SF1cGXJ7I6smaT@vger.kernel.org
X-Gm-Message-State: AOJu0YzP8FaG/T0e9LK5pXPeTxfNph73ES1OsrpdIHfYts2eVsA1el99
	e5wacMs2lO6Pfz2T+MyyyfEYUHAZAVKC4rnCUJipv+KbVGbQ1ahaUS5PIDFwMF7ArQU=
X-Gm-Gg: Acq92OGPxtK9pmgu8FCGRsumRM4XZD+AlVypQKzYh6yaZwutBs5jNYeqy1vmuwS0j6P
	5wrsnH9cXAC0varvl1oPAYaTJp7xcpp9EPgKyl5FTMPZZ/UgmGk5yFTmWAOomnGovOl5Q0wrCGq
	DpMvcbXrBm6Z7Sn8l7AeT1FtINaX79c9RULf8YtBhPWi7J8IDfZ4dxNzBksGFKEwguSIPwKPzUs
	53swpjayxVbX34o3LLmDTmUEofQFNzl2h0aJsoOBtM5QuQaE8zgUsfCSrNFfrssU7YhJ72geLRN
	0l4pUnNFbbsg5d47T5oYaFFr5F1MSjTz76bdEL2w2+DXxbhhIf18f3/y71xN43GA5D0BX3nkY7u
	XrGKqrQOoXV9gb2EPzkk1O+5EUudSIi0oYNYd6l8mhklUtvTpmcPUHiwrxvAwcf+Pnac/pKRV40
	2UiwafMf3Yv7gGM/2LsrI+LndWEpCu+Lg6
X-Received: by 2002:a05:6000:2408:b0:45e:941e:77b3 with SMTP id ffacd0b85a97d-45eb38c9299mr32625100f8f.41.1779798434376;
        Tue, 26 May 2026 05:27:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4a0c:b15a:3467:f4ed])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45eb6d5cb9asm38009953f8f.27.2026.05.26.05.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:27:13 -0700 (PDT)
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
In-Reply-To: <3fda1592-f7d0-4e86-8615-602804673414@amlogic.com> (Jian Hu's
	message of "Tue, 26 May 2026 17:58:19 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
	<1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
	<8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
	<1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
	<3fda1592-f7d0-4e86-8615-602804673414@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 26 May 2026 14:27:12 +0200
Message-ID: <1ja4tm5pb3.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On mar. 26 mai 2026 at 17:58, Jian Hu <jian.hu@amlogic.com> wrote:

> On 5/20/2026 3:35 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On mer. 20 mai 2026 at 13:47, Jian Hu <jian.hu@amlogic.com> wrote:
>>
>>> On 5/14/2026 11:11 PM, Jerome Brunet wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On lun. 11 mai 2026 at 20:47, Jian Hu via B4 Relay <devnull+jian.hu.am=
logic.com@kernel.org> wrote:
>>>>
>>>>> From: Jian Hu <jian.hu@amlogic.com>
>>>>>
>>>>> The A9 PLL pre-divider uses a division factor of 2^n to ensure a clock
>>>>> duty cycle of 50% after predivision.
>>>>>
>>>>> Add flag 'CLK_MESON_PLL_N_POWER_OF_TWO' to indicate that the PLL
>>>>> pre-divider division factor is 2^n.
>>>> I understand what you are doing here but I have to ask why this can't =
be
>>>> implemented with independent dividers that already supports power of 2=
 ?
>>>
>>> If we use independent dividers, the n member would have to be removed f=
rom
>>> meson_clk_pll_data.
>>>
>>> However, n is referenced 35 times in clk-pll.c, which means we would ne=
ed
>>> to modify all
>>> related logic across the file. This would be a relatively large
>>> change.
>> Yes
>>
>>>
>>> Moreover, for all Amlogic chips, the n divider is an indispensable part=
 of
>>> the DCO clock.
>> There is hardly a justification here
>>
>>> The difference between SoC generations is as follows:
>>>      Previous SoCs PLL: n =3D 1, 2, 3, 4... (linear divider)
>>>      A9 SoC PLL:            n =3D 2^0, 2^1, 2^2, 2^3, 2^4... (power-of-=
two
>>> divider)
>> Yes that was fairly obvious
>>
>>> Therefore, splitting out the n divider from the DCO clock might not be a
>>> good design choice.
>> I'm not sure I agree and you've only stated your point of view without
>> providing any technical justification here.
>>
>>  From the datasheets of the different SoC we have, the documented
>> limitation is always the DCO output rate range. Nothing related to n (or
>> m, or the mult-range for that matter). This is a legacy problem, we
>> started with monolithic driver and slowly simplified it.
>>
>> As far as I can see now, reworking the PLL driver to be a simple
>> multiplier driver with range output rate constraint could actually be
>> simpler than the current code. I would also make simpler to accomodate
>> differences such as the one presented here.
>>
>> Unless you can provide technical reasons why going in this direction
>> would be incorrect, that's where I'd prefer to go.
>>
>>> [...]
>>>
>>> Best regards,
>>>
>>> Jian
>> --
>> Jerome
>
>
> I agree that having an independent N divider would simplify the PLL rate
> calculation.
>
> A separate pre-divider for N is technically possible, but there are some
> hardware constraints that need to be considered:
>
> N =3D 1 is the preferred operating mode except a few fixed-frequency PLLs.
> Larger N values reduce the PLL phase detector frequency, which may
> negatively impact
> jitter performance and overall PLL stability.

Understood. You could really make a difference by going deeper and
explaining what those constraints are, especially since you ask question
internally at Amlogic.

At the moment what is documented is a range regarding the output rate of
the PLLs. A PLL is made of a pre-divider and fractional multiplier.
and you are saying that for the multiplier to work and lock, there is
actually a constraint the input rate too.

If you can discuss with your HW team and clarify what the constraints
really are, that would help to better model the PLL. In then more likely
for us to figure out the best way to drive it.


>
> Because of this, we cannot guarantee stable system operation when arbitra=
ry
> larger
> N values are used.
>
> Some PLLs require non-1 N values to generate specific fixed output
> frequencies because
> the target rate cannot be achieved with N =3D 1 while keeping the PLL whi=
le
> keeping the
> PLL within its valid operating range. So N is designed to have other valu=
es
> =E2=80=8B=E2=80=8Bto
> satisfy this requirement.

Again it seems like the constraints we are using are not the real
limitation, just by-products, which the situation unclear.

>
> For example, the AXG PCIe PLL uses N =3D 3 to generate the required 100 M=
Hz
> output frequency,
> since the target frequency cannot be achieved with N =3D 1.
>

PCIe is a topic in itself. It uses different ops for historic reasons though
I suspect, with proper constraints, it would not really need to.

>
> Additionally, is the refactored pre-divider N implemented as a separate
> patchset,
> independent from the A9 PLL changes?

I could be seen as a pre-requisite.

>
>
> Best regards,
>
>
> Jian

--=20
Jerome
