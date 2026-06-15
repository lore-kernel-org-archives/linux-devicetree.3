Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DAB03438B0
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 06:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781504609; cv=pass; b=MWv2zMJJf29mqtUvMOPB0JmhH1xTfcskRPWXKqqPannCPNXXZbgC7pVHDlYyLOFeSv0haicomqj/bguDz5QsP9P0x1T7IIkNk14ygkoTfpFPzlNtMOHidCwVfzhN1QeZRS9O+ZFWMHGiSNzXMohhNvMp2JytPXaVhLgokEkuwiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781504609; c=relaxed/simple;
	bh=6RrxEbtdY1URcRhqUHuv6rRPkusZoYqTLT3CjAAQOGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS37sgcFHZBlIbMI4g73t4pPQfjSId9zAkFlVXgEwcA0Dhv/fYhGAV39iGUuOtgYuza1yY4F2YB08qAqaYRyyIkQ5Ud4CdQ+qGp9tvwRiwFtjfWdzhGkMFYqcJaBLERDhgMoSVfrwJPQxltj1CiYQgwvio2FdaOhXmTueGczA8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6/470yY; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6/470yY"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30749947917so453404eec.1
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 23:23:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781504608; cv=none;
        d=google.com; s=arc-20240605;
        b=J8V1FNJ16Jm2txyy1CgU+OFWBdenfOjechIFciV9RofOpPiathulJ1Dpgf03n7Gwnk
         bQ6qPgASYo5Y+Bz/fm9v8fimhV/w74wLTq9c/uiDfRn0Mo3VTjxCjFgr/9vS8AoXfMmw
         QVemTigK/S0PDffxFhNDiM9C1S/9xcmW40Ts+uzLt8n1FMRnljWg1TtGq3P0jRH5aTyH
         qGCzZyHj+RRMMTb4dsg1Dk6OHOaJFKcXIbBpF0Cg24/awL3wHHSGfCbgAJ9eu2zdYKUH
         Zv499r86wXKEgFYfnhLxM0pGChC6In+TI0bB62+eDBdJDJS66cQqpazsZvMVO8VaJ1gR
         nOKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=76EcjshEI0S52XWKwaYtOS0vh7v35QH2XSqyWXuOjik=;
        fh=TgCfxwShYNh8PdtdXothiFdEGxfEV1U8DhSULTFz9/0=;
        b=lpCd8+e/q3eiNTTWRK8fqdfelq1bu4LpZvJxI3O2ar17gxuZGELU1YFgmd6tCXJJpT
         4LmoJ/yZcsXSLWuKSnz2qH7EjnK1LEE0pUE6/Ytbh4UAdcKknmqom/BYR2GSYf7VEMET
         uq6Mli0axv7LXSjPYF9vGlYJtZfcxXYMOWya8t2enP3xWOby7Odrx7fwFj/SRkoweWby
         dTKTz5nQodL9NioZCqBe6nRBV+Ak5e08OuI/29+5+745yni3BTpoRQcmfrF/UbN3bd8l
         DPR76IrIa6pwdVoGUyITGaacikvz/z4wDdzaw2jILpvYimU2geimEd5dzIqP8/UaTJt6
         BYWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781504608; x=1782109408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76EcjshEI0S52XWKwaYtOS0vh7v35QH2XSqyWXuOjik=;
        b=l6/470yYabGu6XgvM5OFyCNHNsAhvW6UJ4Siw90FNHfR3fvG+Wlux3PZPKM/ki02sS
         WZ+rhn4nFhT9cxcq8Ymo2usB1z/IJxQGtqsxPVDNAfCnhN2NqPoyAOkxywhZRYTc2Yl6
         aGhHgsUblQwTZzBuykJBzxWok4HF3USQ4LSvHr1cwLnrdYsp9gm1SZqV9JuLA9OhJAFS
         THwcGloLyjqtvfUmiF5A1qqRfV2r3oPfvk2VIGyUeNUKJj38+KQK1/aiHMu1J0ekpwrs
         7JguB3zU53LVT83ZAfLghEE8TTaB6QChcwY9tDxiqKOPG/JEeIBWRm0c/DkobKb/7Uh3
         t85A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781504608; x=1782109408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=76EcjshEI0S52XWKwaYtOS0vh7v35QH2XSqyWXuOjik=;
        b=bKu4YtZW7DqsZ/9insPhReOFMbQGOtCudYwFESYTKYbMfcP++/C6aasn61u9/O9Vg0
         7MIXKJx3rn484Zl/PX6kDq5Qp1F+fU4rFgmW051MaM7DKIIlaEU+Anf/pXsvIbccIu3j
         DyJHfdln9qqZj9ftPn+htzngpLfxpkPkFClmxMCRKqFymP2TKkmpN9sr0Vd/AuVQYIjO
         Xk8QfK2NTuK6k1n4qh41udBRvhvZtUrJ8wR0uJOgPIJ/qRviRbMZpxYHVzG9hXSD4lff
         Gf+xY/rgH01WV2T55c4zeDCwKiQ9mXs7hPWZi3oEdv6bW2oOnjNMtpoAmmIRb8ve5Tfa
         9Liw==
X-Forwarded-Encrypted: i=1; AFNElJ+P7bxQ+EQ0D/psDUYHMF5DP7tgJ0QJpBHlNCnQJykuk7wOq8aM4XPYut00voRnqPiw7S+OigFuaUXG@vger.kernel.org
X-Gm-Message-State: AOJu0YxCLvDyulbFkPf7ZaHtGHHSdbPP22+UtSYBXfCxBd8d5G3ax6MZ
	55KkB4XjtJWxw41s8Qe4WIOnqRa7wWTas0K1Twp7ezNH/bXkTQnercUOk5/fwWEtVuKgBxuyVcE
	NaT8v2Qt22q31MIJujVTD13nTB09kQOY=
X-Gm-Gg: Acq92OFHSdWs0j1kjnh/TcBtr1PhiHBTdjgEHBnD211+iE40fnCYdcuxNn4vzsT8JMX
	5rw+BXgUz2i7kShiUnaf6+n0oJFJv6tVeOHBC6d3wstPjs5K119ykyb+Nbut1BSkuBrh7OarFhw
	B6JAsGn0bbmNsO7VR/mwsNoLlzkJO0wiU2u4Bj4JS/hUG6gb0SGjRGdK/kOd6x4HY+qWR2tlCAK
	LvqdDdPrSd3ZbadxXG0YG3xCZEunc34jetKDt5UMz2lW6bodghbqT/MPsogUe8+re29gQCXARzi
	diCIW41S
X-Received: by 2002:a05:7300:3723:b0:2ed:e15:c922 with SMTP id
 5a478bee46e88-3094197a175mr4911122eec.30.1781504607592; Sun, 14 Jun 2026
 23:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260528053203.9339-1-clamor95@gmail.com> <20260528053203.9339-5-clamor95@gmail.com>
In-Reply-To: <20260528053203.9339-5-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 15 Jun 2026 09:23:16 +0300
X-Gm-Features: AVVi8CfYtPBR17uEYmSCkdqsGtwveF8FuLfNiOAFFFOH2flEclU8yKRNkxPiLtw
Message-ID: <CAPVz0n0cgb=ht+uW9+g8q9524BBQdPLNczK_9nSdrk=8kZSV7Q@mail.gmail.com>
Subject: Re: [PATCH v8 4/7] input: keyboard: Add driver for ASUS Transformer
 dock multimedia keys
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	=?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Ion Agorria <ion@agorria.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 28 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 08:3=
2 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
>
> Add support for multimedia top button row of ASUS Transformer's Mobile
> Dock keyboard. Driver is made that function keys (F1-F12) are used by
> default which suits average Linux use better and with pressing
> ScreenLock + AltGr function keys layout is switched to multimedia keys.
> Since this only modifies codes sent by asus-ec-keys it doesn't affect
> normal keyboards at all.
>
> Co-developed-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Ion Agorria <ion@agorria.com>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/keyboard/Kconfig                |  10 +
>  drivers/input/keyboard/Makefile               |   1 +
>  .../input/keyboard/asus-transformer-ec-keys.c | 286 ++++++++++++++++++
>  3 files changed, 297 insertions(+)
>  create mode 100644 drivers/input/keyboard/asus-transformer-ec-keys.c
>

Hello Dmitry! May you please take a look and Ack it if you are fine
this this driver or tell what I should adjust? That would be very
helpful. Thank you.
