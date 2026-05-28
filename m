Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52C2315D33
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779946704; cv=pass; b=PyTaxIZir4rqnQ4hQRaPIsARDz8iTiICDA4vQsPCtIw6phGkppMRW8vPgEtamS+AQGR52dzuxZ94qHedltBHR+a8X2bKtDwm5eqaPRAE1diuI5PLRQSusGrQ5zu/9DsX0em5QOi8l+uBhJvq/DV0ULmuulN3LyBDI86L8WVYb+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779946704; c=relaxed/simple;
	bh=YVO1LwzPOtQIX4YZQXs4E3LGR3UUOpoiicYRV41ZkB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9uetzDEqCIbiZHg2c506hE+jADoaSM+/q0FMb2E7apRFQASnZNJMeam3e0GV+U3vZoqShtqr2zAJOCm22syeq4j45wVfGUXi1kZgMcNv7o4/lYqQH7fJpiYbq0b2UVNdoKJgWpa+sVGSqdby0iNmPsCvU61sWpbD6Vqtjqgbek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rINBV+jq; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rINBV+jq"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3025d725a05so27594689eec.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 22:38:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779946702; cv=none;
        d=google.com; s=arc-20240605;
        b=eP0SW6c+1v/zJetJeYsHMhCPFYEgJFxeSHNqqwWQIARVavlkR6maBcwK+rzhNIeOdJ
         A18wT7x0AYJohTpenFgunmbU1LA6KEbjXoMH3VNnPOnlBaWU0W3lKg+RlFo3ok6nDEP5
         x8wvRFkKYGVFwJihjauSqghAnEVqHxBbWEtNnuNw1GxhmEQZ7h2ZN0wHppZh8bmvAWQA
         t8OtV7tbuvar9PMf8s9meBnIjDH2lIBGvkiCOhu0mqTaoOLVCwkWVJKF3VZ2su6ZtNEP
         /MsoENnoH146MD9B5Tu/ly8De4/+9DWKtil2AFLYzek0pLvq28etEgYYJgdOKnX6HEI5
         0Qzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xs4P9mYfgBvC9txKI+9u4GTWI2u+8bZrY6Ruqk3WsmE=;
        fh=SlHnb/syf/QiLLGRuZKKJRV36mYC6M1L5cpFvwPWxCI=;
        b=EZwWhiFACh5qi9C/piGWtTTqmWlDJZ6n0yMH2MXFTnxHOQ0Xm/hOTGsvtQTQkGP1e6
         sOartkT1vcfjdeGNHaWkVPEOzhHWNFOKLzPjx9EdyKhx21cXXt8ViNMrdt/KqLhAKGIM
         xiS4JWiTX6oZ69XG4cfAt9//wdonzfrDtQZ1yReOhQt+bCRDcc8YkWPotc20OXFUxZqD
         QtLhBlI4iaZ5sWW6ZZy1DJyGhqoxFM/cvEDCf4VWcDPj+2dBnZsaf+kBo1NiV+OGA9YT
         cBj/Vj+/rsb+KrisN3Q/Gn/Cp1ZKpdy4b9Weeczj2N0++DJAbf1av2X89Z0V/Pn4f+YB
         Rb4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779946702; x=1780551502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs4P9mYfgBvC9txKI+9u4GTWI2u+8bZrY6Ruqk3WsmE=;
        b=rINBV+jqY7+jDWhN4y0V/9cFuoHEOKt66QvMExmr2C8SAq31MugcJEePpWyBTcHBFf
         HcvjhWxecbGM/cJQ3xuf7jTLc9nJ/FzTzevlIjKt3Brcl42nFHlKJTvcM7rbdLl5VYLD
         Ji43pOly+CA0JdmM+ae7gyppyd7nZVNsbaTh68p5mN1TD4x77k3xvztFUdKGBUyjMGOU
         UPgghEenYm143XeQUWihk0vAz70dcCnvQ8nF4gRi1cwwEBkZ0vELc83ldm2XYbl1m5wq
         dxMuaj7kqpL7P4/9A/2mkidEYfc7Vaa9RqeL1obn2b3EZE2LJsB0rse8pxNoIOTYtHud
         bRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779946702; x=1780551502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xs4P9mYfgBvC9txKI+9u4GTWI2u+8bZrY6Ruqk3WsmE=;
        b=h7/x8PenjS2N0z5YyTIDK/IJHjKycpDtCjbUEV/btEt27UXxFWwDvALPm/4+mcvWSg
         ZimGnXcDG2et8V3e1bPbZ9JXw2Kg2+34hP/gjRNopWlVUAW5YL8OVgTRoMTibUOgMfn6
         w1mT1CeRuRolema3tc5tB9O6lG7POaU359/hHzykQ1zPQ+OaO5fA+PB28FPoWdruiaqY
         08DmF8QSjW7zfp/zBjBF/NdAKTE2AevfuteyobmtN7dr7+g3pkvDDcy1XNr51jhP7nde
         hvlp3ZnR2ULTVhmomq8DflERFwJC5hkR+s5fKM4csUwSlkSIhkBQGJ90LBnKYNSDi8HJ
         NrAg==
X-Forwarded-Encrypted: i=1; AFNElJ9EkmEzFYuZnq9QTBsBdVW7TX3j44qS0XVTibRLA+EfjbkvO5u6IsKSGHTRYxvvi2Iy91rqMZRWsXhw@vger.kernel.org
X-Gm-Message-State: AOJu0YwcGoDCVMCJ9s/kYxOjMIUY/l6Yq+qB/x1gUt4G1ZvihZTiTcWW
	LfrANOdUze13AEU2DEmtIgaCNRvNQzI723q9nIE9loogKzI+DWriJVWFqj4jFXTObvq1I8oXocR
	6BSHcZdxWTKxFhhkuNRlJe6HklElSLOM=
X-Gm-Gg: Acq92OEEAd6cu2H38L0Dw1SzICwvYxyg9HDBKGAqwShCWUxerQHFZ49iUg8hOxeCnjA
	ymk6U8D7t7Q4egfs15cdAi5UvUe7V+Q8lrOSghZjyz1PyhFbYhpGsZh2MtgD5YOjHLE9BAqdd7R
	RDp8LJHXZbAghxOU1D6rUy2G2MB3VN6JgeeUXCGVFJysnpJhl8Z4cuJ0nbstW7ASeQK5gnW1mz0
	JjO1Ij5Uwo358frcohwFyb1kByxCgsZML2gNtZrBI7GZh7maQOxKLBF3iOAOyvHo6wdpSTd6sMI
	bbzSZdydOq78fFWqhWc=
X-Received: by 2002:a05:7300:6c22:b0:304:dddb:f8 with SMTP id
 5a478bee46e88-304dddb05cbmr11677eec.35.1779946702054; Wed, 27 May 2026
 22:38:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512102445.55372-1-clamor95@gmail.com> <20260512102445.55372-3-clamor95@gmail.com>
In-Reply-To: <20260512102445.55372-3-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 28 May 2026 08:38:09 +0300
X-Gm-Features: AVHnY4KDA3MQRv2k4QbPRNCxfSxaYHOG3DufLVKw-4prvw0-HyXDKTXUET4eBH0
Message-ID: <CAPVz0n3Dw6Vtqqn8if=MYkBbYittXqsBKbDvrs1ntbD5Zn6iig@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] Input: isa1200 - new driver for Imagis ISA1200
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 13:2=
4 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Linus Walleij <linusw@kernel.org>
>
> The ISA1200 is a haptic feedback unit from Imagis Technology using two
> motors for haptic feedback in mobile phones. Used in many mobile devices
> c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung Beam
> GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.
>
> The exact datasheet for the ISA1200 is not available; all data was modele=
d
> based on available downstream kernel sources for various devices and
> fragments of information scattered across the internet.
>
> Tested-by: Linus Walleij <linusw@kernel.org> # GT-I9070 Janice
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/input/misc/Kconfig   |  12 +
>  drivers/input/misc/Makefile  |   1 +
>  drivers/input/misc/isa1200.c | 524 +++++++++++++++++++++++++++++++++++
>  3 files changed, 537 insertions(+)
>  create mode 100644 drivers/input/misc/isa1200.c
>

Hello Dmitry! Do I need to make any further adjustments to this driver?
