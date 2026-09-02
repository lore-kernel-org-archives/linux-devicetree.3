Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96979377A88
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374605; cv=none; b=uQWL3PmlSJt7CttjunIBgm/w+/+bTPmIzJMqC4UmsG2h/Bd3Tv3/1a9cqotrwLOQf0O4p6I0Kz7x+dpvijoy0O6bNF8PPzcsA6v9VQiN1uDa7Fjyl4EJw0As3Wa8ONPBVm8gjNe1H3E/O4/W3bPtleQz2QHwCeaPMtKqajDuAr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374605; c=relaxed/simple;
	bh=5Keyffio6qVpCs5QPavKPlOqOswZ2klYgfP8rJs6TiY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Z+LSFTMbFhEy+M3WyTwA2OpAgF4MTYaKYyNYYGlt5iXKWlRy5zCAwBOtN4WMlj3MwqBiiJErufg/0xLiOg5Tl4wp4lK9tmpMLua/O0lg11XAM/HjIfu6CksIcg8IovzNCQj4oH9BXqWoZMeiN2waVl7YauL9+hkcQhljQg+3isg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Wk+U0KDk; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Wk+U0KDk"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48441fa5c37so1014409f8f.3
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 11:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788374601; x=1788979401; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWYYRVQBRJaK3NbpqrRL/6N4wYR6cMesVqAcJL7LMIY=;
        b=Wk+U0KDkSmdGeaK755tg4Abau1ClswBkfOvJ7BySrSUUQZiETMi7IUC4y5PGrA1xlT
         5/699R/6aG7fUdvrMjDlHGpwvYAj9S8SWI84XrE98v6kBUS9160+eASo3KtPLuOc41i/
         l30XqMUHewhlKjLwnMxrWSLDk8E59nJV7ZJ2QTrQGnUQUdlUY627ILAnGANtSVvuS8KI
         DGZabwxtTiCyggjnIh9QS/cvGm1QWzvV1ZFy2YO2LuuLPVJ/yF2NcNrT5zi5bw2K8exa
         TyMKAcRxcJ6vaeqfIYbuDSnaMZRi33uqUg2C2MB81AP9YJpDamMFgSNats5cBQhIh13C
         uiBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788374601; x=1788979401;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWYYRVQBRJaK3NbpqrRL/6N4wYR6cMesVqAcJL7LMIY=;
        b=YmzKPJeM+kAYCa3O47lZSB/brZXMIkF6kgmTOmVBUfGSiIfl/41cwMdeKvJoyIbLd2
         6UGsJTaMgR4PTx4MK6LWLWgCg1X+pknYhw1rrz4Dx2NsbY0i+F243aPPA0guZ9EBFwGI
         9s4kCXeVlOdvoEe8Nug5Jveq+DRjPnCE0DtDYAu0ofOnmrvttbsrhAEN8+qKevJIsCc4
         oe2bvncrHqUKp/cVON8wopWcUbDkH+f12afVzjOpHaSwF+ysYAsZWlrMSIj+1xpWyKDj
         VyZ3o2iPW0O36YrqHVMlVZ9zU2AgZEWfnSvSSAy44sDR3MPhgXXhPp0zTSGYup0jgZG5
         zdDQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6C/NyJtxTvSFbJ59mx0Q+kdni56pQmC/nTqizHvTys182Qf2CRP9qxJiwn1iCWdk+NSzHqkKbOD5F@vger.kernel.org
X-Gm-Message-State: AFuF++n+CBd70T6zlab2y1pa/nwF0a3vfJK74ZvDkXE92ciAou8D7tvY
	2W4BLA2akJxS6U4GFtBBfsNooVrMrEMwy1NBxUxKw8HamzZMR64Ee+KeEHLfpLi7pZI=
X-Gm-Gg: AYBFou2Pzhz8qr+029qdP+uUQNbuv9uZYULQsf+mtgtQMPFnpPFj/cH9sEom9O/xEY3
	uXrQIaSjy9DttMkZjHW+ihbzLkIgWEaUllR3x1Cwo0AO0E1B7Y3gtAI5U55n8j3XSSAzZudZsK2
	s2nrU2eOrzu2OOA4sUsHx9AyZDgiU+7kUW3H2PHG+4MRI61KCcwtFWEtlBC+4O9uq7zsNzLam5T
	6HAElEd92OJN3YaB6svThKm1xa1Myr9I69kQLoLTGvbVr/7aCJk6P082VcGHbSr25z78yZqwptW
	l9kaUjTO9pXiKRE1j8Rp9/zFGLoIJo/8BkBqF9uy2ZKjgirHP011KTMimQputZ8cfoHwkEKL5se
	JR+BkO2mtVA4eG9kFWHu6AGcbcU4F2ld66HDK+cFVvM+aZhmOfNp10egL7bn+8Spu9kEjK6uRU3
	0zs9ts4nN21BDb+0lX/r6AvLMY0gc/8xR6u8iRMB5E+f3CFywJpvSA+y2r2SMSJCfWqSdQOnmFq
	Jqt3Og=
X-Received: by 2002:a05:6000:1847:b0:482:fb9e:4e20 with SMTP id ffacd0b85a97d-48488dee407mr12111460f8f.6.1788374600680;
        Wed, 02 Sep 2026 11:43:20 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea961sm8146112f8f.28.2026.09.02.11.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 11:43:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-bot@kernel.org, Mark Brown <broonie@kernel.org>,
 sashiko-reviews@lists.linux.dev, robh@kernel.org, mfd@lists.linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260827134235.GN770273@google.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
 <20260812214019.CDF921F000E9@smtp.kernel.org>
 <1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
 <20260813095600.GA1072730@google.com>
 <1j33wg6cpk.fsf@starbuckisacylon.baylibre.com>
 <20260827134235.GN770273@google.com>
Date: Wed, 02 Sep 2026 20:43:15 +0200
Message-ID: <1jld9j8pfg.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 27 ao=C3=BBt 2026 at 14:42, Lee Jones <lee@kernel.org> wrote:

> On Fri, 14 Aug 2026, Jerome Brunet wrote:
>
>> On dim. 13 janv. 2008 at 11:56, Lee Jones <lee@kernel.org> wrote:
>>=20
>> > On Thu, 13 Aug 2026, Jerome Brunet wrote:
>> >
>> >> On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:
>> >>=20
>> >> > Thank you for your contribution! Sashiko AI review found 2 potentia=
l issue(s) to consider:
>> >> > - [High] The corresponding regulator driver lacks support for
>> >> > `AXP318_ID`, causing the `axp20x-regulator` child device probe to f=
ail.
>> >>=20
>> >> Funny sashiko did not pick up on this when v6 was first sent. This is=
 an
>> >> ordering problem. The regulator part should be applied before the mfd
>> >> one.
>> >>=20
>> >> I could reorder here but there is not much point since the 2 changes =
will
>> >> land in different subsystems but it does bring a valid question:
>> >>=20
>> >> Lee, Mark, are you OK with picking the patches indended for your
>> >> subsystem or would you prefer that I split the series, regulator on o=
ne
>> >> side, mfd on the other (with a dep on the regulator one, of course) ?
>> >
>> > Does this break existing devices or simply delay support for this new =
one?
>>=20
>> Existing device are fine and untouched.
>>=20
>> I've just checked and if someone tried to run without PATCH 5 (regulator=
s),
>> the main axp driver loads fine but the regulator part gives this
>>=20
>> axp20x-regulator axp20x-regulator.0: Unsupported AXP variant: 8
>
> Can you not enforce the deps with Kconfig?

This is not a build problem so I do not think Kconfig will change
anything here. There is no specific config per chip.

It is just a runtime ordering matter and not a problem. regulator and
mfd are split so at some point the support is incomplete.

* MFD first, it is fine it just cant instantiate the regulator until it
  lands. it is (mostly) useless without it, which is fine.
* Regulator first. regulator will never be instanciate until MFD support
  lands, just as useless.

IMO there is nothing to do here.

>
>> Seems sane enough if the regulator part is not present (and no board
>> using it has landed yet)
>>=20
>> To completly avoid this, the ID would need to be in its own patch,
>> then the regulators, finally the MFD. It seems like an unecessary churn
>> but I can do that if you prefer.
>
> --=20
> Lee Jones

--=20
Jerome
