Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3452C13B58A
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 00:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782087523; cv=none; b=Ugl8KGYKwQR8hzwyZWBj10YKzTqhsEyIGsm3PXW3qOLEHpU7Suvx/U0/Yup+XFnCd1Gj3ukRW/iJtwnNaUUw3t36d4WhEXAaocGpa7R9ajLGOpLzAZaUccIazWEOXjzY0bWYi31daUXS1PH60q9y0m5E2OiPpAk0HfxoBdCcFlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782087523; c=relaxed/simple;
	bh=xCh2X6pjSEYFkzPWQKbcIxYIAG0zxBZt+ck9vKJzwM8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iW9tN4yK+z2jsZIovDRePc3JQ59iC+uGpAD8gaHpaW5WdAYP+cS82+8InR8Ecc5/PAA2XSRjjb2mWzlzzrut2BIQkiIMoPYlUsO131Hd+2a9n0lsjHyq9bvU51cebBqA9P6FwOBCXNid0rX2QbP8Pa5PyBH/2dTtg4YyemdgHUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JqJUN17D; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JqJUN17D"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59e2b96e3d3so3074347e0c.2
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 17:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782087521; x=1782692321; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A93qYdMCJP1GrlM8oz/97lx9wA1Tl5BbdYs1SqoV3fY=;
        b=JqJUN17DMQRLJ3K9pGULPawFgjkCluxO0hho3GmYgyzUps1Ii5FKEqmb2dDZxp+g6R
         4Vq8bI4RLSw/Og00snhoECmGddJhGR48Q4nFj75guIk4+HOvlKqgGu8QuWXE+zKPvhoo
         1sE1GsHzA1BDg4yhuTBF7HM7ogJrHR6wOGj0gyynn5+engilFVx215jby4uocjoK1TyT
         dksUZusdDVBkEwsZa2T+v0dWAgX5Gn0/zvGbXa0ECyPvkRsEJpNktAyMTPJlH3WxkAcK
         Zx0w5sl5QHO0XALVq/r4rJKEThCt+eFaC/TQzQ8Zm0Sen6W2Z0BWJgdDQOvGcZ1552QV
         Wxug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782087521; x=1782692321;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A93qYdMCJP1GrlM8oz/97lx9wA1Tl5BbdYs1SqoV3fY=;
        b=KHXW1BLw+2PtNbKT4d96XsW1Nac0+V0uz9WKTSljVr3+A3XT5gzGVdUkV8MgVKRDK9
         TAqFUSOfGv66A80boZIEHatGBXpPdGnLaynYGZcVSDO6rEZp5AZ+rwGZ4qorfWyUGMR/
         l2sDB8jkTv/asDkxDitatAEQ4MGRybWzGaI1K4a40gIDFPFgSpI9fYPSwtTAft6Wx1gb
         fmHUxR1DUF5K8am88av+kb10sGBEqIrMu4HkIN8uBIKmJj6Ebk0O0KQjejk9VXjXyH/7
         KF5QxCoHZevBLzeIU9KZbwlwn4uGFV9fOtWrW24/uQusrWZa6mS9UKRqT4yX//Pg00N9
         Q18A==
X-Forwarded-Encrypted: i=1; AFNElJ/rzZfkpTF/tZJTyWRRES6NJLw4JrZL9QIPd/yOMDDnSzLXieqJ0c+sCIVCaoraJ+WFbiSJr38MAdFK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxdcy/SErzF2lXc6KshVqKYL9LA0MpvT2AQrn6dMXK3ngtgmVnV
	7Qu3QryZYSllS5U+8YcQr+57G8a2zkc5jfVOn6lcy8fSCmQh8JhYMeR8
X-Gm-Gg: AfdE7cm/R4bh1J9jyULY44nNuBTiDUdFHHA2bC/6G45eRzttYooCViYHg7Du5y7eLaU
	pVuXF3ZcbZbMjZDCXCFjNwQCQV1YuUG/1XSoQk+se+o0lzWbhCv/SsY5wUmGvOCfoE5T6KSpYxo
	/I30DkS4682KgthNX9oqi5cY4n0WKEMy2EhIKvYpxVoItlWNwTk4MBK3llUEhx/bG9h5L7GQ0hn
	SxN9iCKT+IzBcT//oVgU7t3Q0+vUwNxZGxSCSH3YIZHTwqcaYtIYg5I4fPuafTZUEoA3Nhqgzur
	8oJYJXvexE0imm0AQwjw/qRLmWwH90z2fJGhYy0S/EE7SVfV4wahOD9xWFj9BJwKvtgbfWds2O9
	60eYaCi7Ik5ukSP9H1piSV4dQHF8PssSjxFaSuF9kmAFXyMOnWA/y9QkfWinNaMNJCbGIEwzRbD
	x1VAg=
X-Received: by 2002:a05:6122:3a0c:b0:577:51e4:ef20 with SMTP id 71dfb90a1353d-5bbebb85e52mr5302022e0c.10.1782087521178;
        Sun, 21 Jun 2026 17:18:41 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbfb7d309asm5740788e0c.1.2026.06.21.17.18.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 17:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Jun 2026 19:18:33 -0500
Message-Id: <DJF5ATR2RPDJ.3LSN8DY58E6RO@gmail.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Linus Walleij" <linusw@kernel.org>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "David Lechner" <dlechner@baylibre.com>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 2/5] iio: adc: Add ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Jonathan Cameron" <jic23@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260612-ads126x-v1-0-894c788d03ed@gmail.com>
 <20260612-ads126x-v1-2-894c788d03ed@gmail.com>
 <20260613-sparkling-naughty-tuna-3e9bf1@quoll>
 <DJ92M0ZMSI2C.2I39LHFRNQS7W@gmail.com>
 <a994993e-7459-48a2-a8d7-823c1b0c9545@kernel.org>
 <20260621153318.4a723e3b@jic23-huawei>
In-Reply-To: <20260621153318.4a723e3b@jic23-huawei>

On Sun Jun 21, 2026 at 9:33 AM -05, Jonathan Cameron wrote:
> On Mon, 15 Jun 2026 06:30:28 +0200
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
>> On 14/06/2026 22:56, Kurt Borja wrote:
>> > On Sat Jun 13, 2026 at 1:59 PM -05, Krzysztof Kozlowski wrote:
>> >=20
>> > [...]
>> >  =20
>> >> Functions used by probe() should be before probe(), not somewhere in =
the
>> >> middle of the code. IOW, entire probe is together. =20
>> >=20
>> > I they all are, it's just that regmap stuff takes a huge chunk. I'll
>> > check how to reorganize.
>> >=20
>> > [...]
>> >  =20
>> >>> +static const struct of_device_id ads1262_of_match[] =3D {
>> >>> +	{ .compatible =3D "ti,ads1262" },
>> >>> +	{ .compatible =3D "ti,ads1263" }, =20
>> >>
>> >> So devices are fully compatible? Then it should be expressed in the
>> >> binding and drop one entry here. =20
>> >=20
>> > Not fully compatible as Jonathan said. One is a subset of the other. =
=20
>>=20
>> This is THE meaning of compatible!
>
> This one I'm in agreement with. It is a strict subset, so should be
> using a fallback.  If the fallback is used, you just get support of the
> stuff in the simpler chip (or if you can override it with a chip ID
> you might still 'upgrade' to the more complex driver support).
> If you do end up with properties that only apply to 'new' parts of
> the more complex chip then they should be verified as part of the
> binding (assuming you can do that without the verifier complaining
> - I haven't checked!)

In v1 I had the "adc" subnode which was specific to ADS1263. Then I
agreed to drop the subnode but I'm having second thoughts...

If we dropped it, then we would still have some specific stuff.
#io-channel-cells would be "const: 2" in ADS1263 chips. Also ADS1263's
channels would have an extra ti,vref-adc2 prop, for ADC2 voltage
reference selection. I should maybe also add a vref-adc2-supply.

Maybe it's better to keep the subnode or, again, go for something like:

    spi {
        multi-adc@0 {
            adc@0 {
                ...
                vref-suppy =3D <&adc1-vref>;

                channel@0 {
                    ...
                    reference-source =3D <ADS1262_VREF_AIN0_AIN1>;
                };
            };
            adc@1 {
                ...
                vref-suppy =3D <&adc2-vref>;

                channel@0 {
                    ...
                    reference-source =3D <ADS1262_VREF_AIN2_AIN3>;
                };
            };
        };
    };

In this case we would have to kinda duplicate channel description, but I
don't think it's that bad.

Jonathan, Krzysztof, David, thoughts?

IMO the ADC2 specific voltage reference stuff is a strong argument for a
subnode or the above solution.

>
> The SLF3F discussion is about (to me) less obvious case of not a strict
> subset, but rather being detectable parts with different channel related
> properties.  In that case the ID match is necessary for anything to work.
> Anyhow, that discussion is in a different thread and not really relevant
> here.
>
> Jonathan
>
>>=20
>>=20
>> Best regards,
>> Krzysztof

--=20
Thanks,
 ~ Kurt
