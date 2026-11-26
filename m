Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795680622;
	b=B0rK/tLGdd9wjlKDgYVTLReitntf4lIqG+3mSnXaWR5mesmHsycix4yynAlYx6zeApXj
	 xSzwDFRm9GZRYY499CEzhlPXXUPeojlTvswy8Db+6MGlWLpofoOks/CAk1PHaWrv0JAKt
	 a72nr5XfRVLB7CBEyh/P0qXAWZ57J6XJacYzOfGsmx6vdBctoh71Nr/c0eRorvXWG6fsx
	 /95EGYeSTEOLH4OaYPc8tMDrBtSzn+60mIcV9VSEbz7zGSz45QYXG1upk5T7MEsiXJ6mM
	 TK4C3nTX0aFaLN5HI7uSknNsKBEkjuxtLi1IMS6vNA3TbMiTAoSLSBMftpVtrHDekEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680622;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=;
	b=2SiSmWgikMDzXZj2gYW6Xwvlx5bva/KzwJOPD58vmyliKUdFMW8bZsvz+Tn+sMr6Gm0L
	 +2OieGzjtr/fcHSP0o4fc83QsgxaQX0SfeiRgn9GbKegzdK0l7apCtwwJeh5exP5/NEa2
	 xsoAQKCuXRSis7YZTe3uFzmOncOY7s/0pG6d9ZrHXgbuqNVYJjO3uW5KGR9BeW1lCFvoH
	 BW6hyBk5UIPACkyvXplTIqaAbo1LAmfnjs4XxAEvW89/1gZdSfdY1+8atL/AkcqA0FdWe
	 BCARjLBY9p6QJFNNrgzufKTdXQrNFPsVC9DVhxiMELYTOq7USn33dpdx9bSgqin0APA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LEHU+lgO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A50606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 08:10:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A50606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LEHU+lgO
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-92182125ec0so10272776d6.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 00:10:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795680621; cv=none;
        d=google.com; s=arc-20260327;
        b=KtfKBthzshQCdmNuWMzvgcou4TEtaNbIkFBdMB8ix+8YkaReZlecrwOCpUBYnOA/LU
         ER2IpY4tZibkvHhiWmYh8Nuki8Zs/FunT2lRczYJjGcT1DmMUkWr3V/XNQEsQOsm44Ns
         pPGT/vjlOZzTpZ4VhBXMQLaRUMp7yhF+KTWbTiHj20GkgmhNYvILnvSwpoFyLn16rcrO
         8PihB3bUNXHlhLTkb82dTQM+JZvPwomlOjB2K+IRw2KOOyElP8K36A/oVkq06kXuncdx
         TuHsQsARzg9ekl7oXCGgvHKdZAylJyfa6V5f8+vY9X2hykGheO4q6lkFVzjiX1TZkrkP
         J8xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=;
        fh=iaZC1jcHhRTMVA5UYMonL4x6gPeqyrf+oGF9PXLo6cs=;
        b=EQcXE/3oPkAUe8S0uAtoH9umpgHLtYAOiiB6J9ahcg+Am0Chz6jwHz/nft2mJvEC9L
         rBPDXkB9pvHK9GXpueD84cngBXzWQcDtutQlP7jne+fjPJdm5p55nKShIaS2Bv4N9p3Z
         XUAzZqbTXlZo57ibL7TZj7vPvj03H10sQN+jNaSbYnv7BLE/moIP6tnRhLsDzJP3tk0N
         EwLa8brroxdiw9v3tCe+Rj3EzI0Ri9fi1pbenqIpMm7MwkfGY7dD9PIv1fAlMKGrfDBF
         nLksgORWUv0LPM4AzHfk5kveHfsgu3lenKUBAWHpF68JTwCefSnfp1g4fOvCAQhkvZdr
         zYVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795680621; x=1796285421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=;
        b=LEHU+lgO4bXG08o3gs2s7YFtXC4JmBEcQ3R6HnAGjp86uwk9Z1EPWcqKtDV3894H33
         cm/164ghVg0HbKsCnzRG36MoOXuMHPbiF/XHblFzBoNGoTSAVq9NKNh/5fTZ368zUViq
         wZl1i/TFFX/sC4tMVQeyGGNLelJ6F9M1jmHO24/Nr6jmKdHN49xs7i9SEzqbw/aZ6lD7
         yikiLTr4K1EZTqohzKLYWgbD5REA7fPDIwrJfNfMT5jBqAseqnogM+0NvOUdYqjOrG6R
         SD8YjsleaWPk1V9AkIcSAbhXIQskNqKpHQwGUAZtJ5ZcqGfOuFFlUI5QjI8MrxwFg8i0
         JdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795680621; x=1796285421;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy8dia1SpW3v1KBZQHRSI//A9PqnMJx202VcrBv4o7Q=;
        b=nlKyq6iS5N1kl6eTfkeNSKXbqFXl5DtFN4YwhRMzxMiNNo53mjL6pClrgk4GhtQf43
         nWd9ip9Mom16EmIXxK4fX8EV/0uwZhq9tzw0UAKkTxEXsFjn8Mcf/sfag5dmfZM/CvlW
         JHOdqAoV0rW/o5fh4w3Ut7wHX7zsRg4z1mZ7myeYQ0fZMfibDfqDpIlyLn2ER9hjIRCz
         gYq+3ZEAkEgIBTZzmc/yULC2QvD9aFj1Cjthf4iPVGBFGo0rXvfeR3SuN0wDpV4cyr9z
         2tTrpg/sTvpn9PYSXogOenqTjDF8WsY5WuOIHmm/7ezv0EWC5j6EZVrKC4xskbSk82Sp
         +q3w==
X-Forwarded-Encrypted: i=1; AL+hErHPqMx9vBExHvSosH8fm/UA5axvlG0Nju11RDtguf3o10p5U6hMa4HX5YkZNqCDqLbGR/V+SZb+zYA9@vger.kernel.org
X-Gm-Message-State: APuU4Z9iDH6FuMu9eL/7BtvrwLW6qqW7cPPyXRt8d8mUGhYJOzDt2f+W
	JvAiuAfwNCAk905xDvrcyIBwZp0TOW3rZpZNtua9pmCr/qGbzlBVEo307hEgzRA3PdkdUuLeVue
	wpwTSCnHuMVdpCjwEYSezHwLBOxk2wuijuKzQjht2
X-Gm-Gg: AZFdTZe6YLFFaBpzSIRfZSBAomRGGUiWaJcWqzcRKo4ny/+HzFysBjmC0ONYr/5SZ12
	81uqHa73keT94n6eb8omjn85r0RvscHaQlJKVuKDhiGEehJviLgO85MVIVyGw7ewrT5JzmlMbj6
	3mfYKkZtA6LijRGWz1Pmp0/vNhkVMFzoZ1w2WyM7zBcdWwuhwgEguVVw7O/2+BfCsF/nf/Q5fhb
	Qrnp0XU9XYLAEJhzVogYnu8p4Ge+vNkTc7dp7Z9xentV/9fDCdk5Wf85R0GAzY83BliuDehLYTV
	Kmv8JaCdfPploJHxp5b8QerF71+R4XGBWPZcY7ULDajW3MinITmQ9Au5ST5geR52nLOqwW2jNkM
	sS1TIsZzPm0L+GA6o6HBrL4RJROoCVrA22ncQu5nL9kOcXk2izkmRHovTbr0w8WrpId2zVXWbWU
	lqnw2jMPwjnKI0J3kBK+hdyzSvKxmkQLapQHA=
X-Received: by 2002:a05:6214:8441:b0:921:1e0e:4f97 with SMTP id
 6a1803df08f44-92134b03b01mr303378966d6.30.1795680620848; Thu, 26 Nov 2026
 00:10:20 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-de25-nano-v1-0-473d16131f7a@gmail.com>
 <20261118-de25-nano-v1-3-473d16131f7a@gmail.com> <20261126005120.176307-1-jjc@jclark.com>
In-Reply-To: <20261126005120.176307-1-jjc@jclark.com>
From: James Clark <jjc@jclark.com>
Date: Thu, 26 Nov 2026 15:10:11 +0700
X-Gm-Features: Aa3M54qYE5oVeJKlBQz_MKlaOtdOgsDzCf85Y1jzqfbjt2TEAwsajAiaS_0IAJA
Message-ID: <CANz3_EaWr=qjxrVL6ZoqbxfzUxBJ2cH1s-x2UQanpj9AUwtkkw@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: socfpga: agilex5: add support for Terasic DE25-Nano
To: alex.cramt@gmail.com
Cc: Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Mahesh Rao <mahesh.rao@altera.com>, 
	Mohamad Asyraaf Azhar <mohamad.asyraaf.azhar@altera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 7:51=E2=80=AFAM James Clark <jjc@jclark.com> wrote:
>
> Hi Alexandra,
>
> Thanks for posting this. I have a DE25-Nano here and have been running
> a mainline kernel on it with a board file based on Altera's.
>
> On Wed, Nov 18, 2026 at 08:07:15PM +0100, Alexandra =C3=98stermark wrote:
> > +     leds {
> > +             compatible =3D "gpio-leds";
> > +
> > +             led-0 {
> > +                     label =3D "hps_led0";
> > +                     gpios =3D <&portb 17 GPIO_ACTIVE_LOW>;
>
> My testing found GPIO_ACTIVE_LOW is wrong here. Altera's and Terasic's
> device trees have the same mistake. You can test with
> /sys/class/leds/hps_led0/brightness . With GPIO_ACTIVE_LOW, 0 turns the
> LED on and 1 turns it off. With GPIO_ACTIVE_HIGH, 1 turns it on and 0
> turns it off, as expected.
>
> > +&gpio1 {
> > +     status =3D "okay";
> > +};
>
> I suggest also enabling i2c1, as Altera's file does:
>
>   &i2c1 {
>         status =3D "okay";
>   };

 I also suggest adding a &qspi node with the flash, which allows Linux
  to access the flash as /dev/mtd0. This should be disabled initially,
  so that it works with the Terasic flash image, and then U-Boot can
  enable it when the flash has been handed over to the HPS. I used what
  was in Altera's board file, but with the rsu-handle removed.

James
