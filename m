Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09124A49BF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439274; cv=none; b=gxoLFIB9ADyrfMXIW2KxDKD02zWGC8cVksjNalpEVwYt2WM4qpHJ8BW9raBrQkU3PQzJ2rtOKbXcgsAZ26kDo7hlLCvJ5PtA1Y02mYWz87/Lm5zU+0URPGfcHZzwKLQI2yF2nh2P15SBy7IhLAuVpreKITROgXloJpGFK+2ekrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439274; c=relaxed/simple;
	bh=sOT52DbKgvkkHbkje73zUdH0VXn9AYdlxPV7LsvQoaI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iQtpy8AjI5YJKRqlgwPqxqPb0KM2FTm3tBAYcE21AdM9lxKH2y1+X50PIP4Daedcwlpj8GhxYTrD6EsXz1h1aLOs1NEHjEslsRZkKx9P7mxrTQabewpEpv5EGrCwKCIC7o1ZSd85NoUlqVTqV6Q0651WdiqEd0asNiM+WAE2Ac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FEytn8Mn; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FEytn8Mn"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso23751395e9.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 05:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1788439271; x=1789044071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iNE6mGIoSx/OllUwsSZWUgexqjjfHjOUITVK9fxSRA=;
        b=FEytn8MnCYevcmo5rurz/iEt+cB3MONh9wbG1/y8j5KSkhzK9vHlZNR2/c6sqh5Mbe
         s4SBbdS3tJ13Q21/oA9MWnxRGiDJB4756nmGj/FmjHgB15tyVjNYJuWpVyo6scLQJkjs
         kFBxvpitGD7qA+556YiKxACe/0Zzlko8zaKdM0EyFlBeUWsLrw9x31iGc0lf0QWOIz89
         co3nhZdsv8BO8OQbvLhYGCB6eSgt+D38E7jLw6a9hoARTcgrCUS7DsDgcd/RuESGPa+s
         0y3kDdmIhOEgx1/gT6froR3pWafvegCaeQQ5rDGNKSvWIIXMbUHd0igZ3EDrbzHxPCA0
         HZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439271; x=1789044071;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iNE6mGIoSx/OllUwsSZWUgexqjjfHjOUITVK9fxSRA=;
        b=Fk625Yt8h1OyDKAyoXleVvMRDrs2CCEIdThjGSqz48nw+iEeFA+LclyG73W5bSI7EY
         XrDwfB9AwQXbJa9FW/Hd7TX2t2UO4KMlum/t9LJHbjxaSMrntTuB1nCMuwKTBRTOXr9h
         EfhrJcavEMfvoax68BgYcFf6QyVMnFi3ZiQwmxug53QXUH9EDJn8flHrrK8NjiNbWiDW
         IvDQSNCQVl82rkA7A3xZFN+33vZea22LM1oZGgOnaJ18jQfOb58N9QDtwQXoSXLxVbuA
         ztKodGo02+z+1W85lElub5dOS3Hpmx4mVTumcMyRZibns7VpEKhiu9v66YzS7L2k+oWX
         nXAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMGhIuzhwS5GAkxsZRl32NIO0hoLzeRtR9WAqXrsaofz9gYJO0XP4y4Eenzdn9AgCO0+oqrHtIhQUp@vger.kernel.org
X-Gm-Message-State: AFuF++lkJ0v/5QuXySHzr0qkZ5ShyQg6hG/DVQYByXdBvmGMYYsp31Cf
	lnvfLJd/3Aj/Cjh2WCcx5dQlDpRHerXs5uoRTRcecAhSQElQV1Gm1NJhoBrQtqcy5zI=
X-Gm-Gg: AYBFou07EqRf/fTE2cvy8P8XpBPoBhL4oKyKuUfaCxsJgVwDyWcKRHmZWIzb/ocHJec
	av+rUrriaiYUeRXf7PPBk1ybnICwPN+CMRBIg6TPY/6cUifiG5TFJdhFnvjPjgjuOf+NkxqQfWe
	NoqrJb0LMWz0C3sjLsKtjmWo2QUyZIwMJIozzqG4oCapHeoQl7/kPS4eced+WMmaB+tzLpw/ZLe
	MGKssMehCH/NTD/O/xP4az2BwQLUbGgWT9P7XTiLyzmqDuchoVMBv2MQxUf8u04A2pSeKsJijpM
	WcULeCPbk1qvIRero3tCy7+1XttYJEPh90kfmdWWjrNcs2OulYrhKrS42+vCD/SfO2Oa4qIb25G
	4931ZabCi5S2M9ViykR5lw+wN3ZhHw/lZhVLJMBLSTYBVMlD866T5N9ASKfpddeXnfcT1l4qMlG
	2J0Tvzvl968inny8jYOfbrg7Dziv+6waQWrcreODdzg9AcLa1a/ph2Q9RkUsMVviN8SOh7Ol2Gg
	ilq0SQ=
X-Received: by 2002:a7b:ca42:0:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49ce55fbdbemr151563565e9.4.1788439271011;
        Thu, 03 Sep 2026 05:41:11 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e80798sm12957979f8f.13.2026.09.03.05.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 05:41:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: sashiko-bot@kernel.org, Mark Brown <broonie@kernel.org>,
 sashiko-reviews@lists.linux.dev, robh@kernel.org, mfd@lists.linux.dev,
 conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 4/5] mfd: axp20x: Add support for AXP318W PMIC
In-Reply-To: <20260903090328.GH2133376@google.com>
References: <20260812-axp318-regulator-v6-0-d6b84b55c000@baylibre.com>
 <20260812-axp318-regulator-v6-4-d6b84b55c000@baylibre.com>
 <20260812214019.CDF921F000E9@smtp.kernel.org>
 <1jldaafmpd.fsf@starbuckisacylon.baylibre.com>
 <20260813095600.GA1072730@google.com>
 <1j33wg6cpk.fsf@starbuckisacylon.baylibre.com>
 <20260827134235.GN770273@google.com>
 <1jld9j8pfg.fsf@starbuckisacylon.baylibre.com>
 <20260903090328.GH2133376@google.com>
Date: Thu, 03 Sep 2026 14:41:08 +0200
Message-ID: <1jh5k68q3f.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On jeu. 03 sept. 2026 at 10:03, Lee Jones <lee@kernel.org> wrote:

> On Wed, 02 Sep 2026, Jerome Brunet wrote:
>
>> On jeu. 27 ao=C3=BBt 2026 at 14:42, Lee Jones <lee@kernel.org> wrote:
>>=20
>> > On Fri, 14 Aug 2026, Jerome Brunet wrote:
>> >
>> >> On dim. 13 janv. 2008 at 11:56, Lee Jones <lee@kernel.org> wrote:
>> >>=20
>> >> > On Thu, 13 Aug 2026, Jerome Brunet wrote:
>> >> >
>> >> >> On sam. 12 janv. 2008 at 23:40, sashiko-bot@kernel.org wrote:
>> >> >>=20
>> >> >> > Thank you for your contribution! Sashiko AI review found 2 poten=
tial issue(s) to consider:
>> >> >> > - [High] The corresponding regulator driver lacks support for
>> >> >> > `AXP318_ID`, causing the `axp20x-regulator` child device probe t=
o fail.
>> >> >>=20
>> >> >> Funny sashiko did not pick up on this when v6 was first sent. This=
 is an
>> >> >> ordering problem. The regulator part should be applied before the =
mfd
>> >> >> one.
>> >> >>=20
>> >> >> I could reorder here but there is not much point since the 2 chang=
es will
>> >> >> land in different subsystems but it does bring a valid question:
>> >> >>=20
>> >> >> Lee, Mark, are you OK with picking the patches indended for your
>> >> >> subsystem or would you prefer that I split the series, regulator o=
n one
>> >> >> side, mfd on the other (with a dep on the regulator one, of course=
) ?
>> >> >
>> >> > Does this break existing devices or simply delay support for this n=
ew one?
>> >>=20
>> >> Existing device are fine and untouched.
>> >>=20
>> >> I've just checked and if someone tried to run without PATCH 5 (regula=
tors),
>> >> the main axp driver loads fine but the regulator part gives this
>> >>=20
>> >> axp20x-regulator axp20x-regulator.0: Unsupported AXP variant: 8
>> >
>> > Can you not enforce the deps with Kconfig?
>>=20
>> This is not a build problem so I do not think Kconfig will change
>> anything here. There is no specific config per chip.
>>=20
>> It is just a runtime ordering matter and not a problem. regulator and
>> mfd are split so at some point the support is incomplete.
>>=20
>> * MFD first, it is fine it just cant instantiate the regulator until it
>>   lands. it is (mostly) useless without it, which is fine.
>> * Regulator first. regulator will never be instanciate until MFD support
>>   lands, just as useless.
>
> Okay, this is normal.  So there are no deps between them?
>

I think it is normal yes.

There is a dependency as it stands. mfd change (PATCH 4) introduce a
header it uses. The header is also used in the regulator change
(PATCH 5).

I don't think the headers should be split in there own change
but I can do it if you want.

> --=20
> Lee Jones

--=20
Jerome
