Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785D237B3EB
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 07:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778225904; cv=pass; b=dZmBQPsA5Fa1rWKYKJZNwhrbABNojWF9HHgwhepuKM3KENEqb/DFkmxYUQB+uEAdtUyPp8suuxn15WtmcnLA05Dg39Eqm+XftNgD5TMH35b/OW48oFk0e/oKy9MCcaR2dhsmnjVIN6B3WgmK8JugLufDUUWDjW6dsY9Qpr4/t3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778225904; c=relaxed/simple;
	bh=6aATJC1nNlunUfoHj/tEG6tUZGVIMEVHXuhSNjICmY0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dqQxolQHBxPZB7wB82PaI2UNUtpS/tO3w2SQ+WOXpzWvvzlqCPN6G168rT+sh5l2RWvePA0Rc5lxmAm+J2Aj7yPfxFdrOlYbafb8TUaaRkqdLaz30gknmCAgaWYq8MehcKEA30Z4N7nqh6W+U+lMe0thAxVkr4RhIzeoy6VwnEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KQd2S8pi; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KQd2S8pi"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-678a16429c6so2484025a12.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 00:38:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778225902; cv=none;
        d=google.com; s=arc-20240605;
        b=Dyq86r2Ita/ph9ata0gW7RIlSWvs7B2ti7NBBVwCdyUo/jpj5OiGwAC0PzU9hyy8Hp
         Yjf9TDl58gB1nLPv3W265ANqRG5W52Ss4erRYAstB9dmrLO3dAw51j6cRk9/+p0H/iVa
         K1UZ2Ri5726eNUBOfQz63QwN3Mf23AN2JXvnIsnvwKJUD6/L6ZjXJ4wyHHMN4YnJ/OOK
         /OtX7VAaJDn5bPB75UZgOf6Wq3h1L0cwUVtxxPuxq85UKhCT1necfT8GpNdDp0juytu+
         C4ZE5X06yfAAnHKkVLzyAfYa0xx776t07HvEiTcEjIy42hu9OzWRzGcgVpB0DsBpu8Qk
         eHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wnUmQt9B21/QPu1v+NfQ7ZTcUk5k+/bIm65L2mzXgNg=;
        fh=u9nBuJPt+IlBr73nQ/sKXuH8WCtPLgpUUd9OrVHpkPQ=;
        b=WzkkJ/KcwIeW0UxJbnreKDv6dEtn/fXDyQk6jQrrA4ifN60tG6TJ59vuWEBzwp5R2p
         wM/gID2QmS3q+ZH777IbgbROsqS7hCVrjU1tIvI0EMeX/OliQC/Rns12ktC8ohbQfJ2C
         jSnRz0opCjva9EnVGVbGLD1JbRXvi92R1OAVH0wFjANy2fbWh5VfmzMRpRZO8gK8npKr
         guVGs3/gPpZC/AFc8evKs9BtET4HwVMqgHenkmpebdjwTI52r2Bk6TyaFrTyXheRZPUx
         NQomT1/G75ik9nfTmq7ALwb44tlZdCtBYf10Mh6XMFzdA/vHrEzNQ4v3c6DJs6VZWCRw
         d3Ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778225902; x=1778830702; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wnUmQt9B21/QPu1v+NfQ7ZTcUk5k+/bIm65L2mzXgNg=;
        b=KQd2S8pil5pLXYXJt0GpgrxDFUhR59jf+CpU4bC404oo6Marx/X09HV7/wNiklo0Ff
         bEWPaLnmmgPz0bo1ltCa/XKx57v/L2ye5CwqMUYsFIGz/+BaIE2yjiljL3BPz0WQm7sk
         9CzycEbdRLNQ8FmlYsmiJXg0w1rWakQDB12cG67gyxYusUXR1z8Xlf6mRj2tjUXRHiPL
         1jI47wOp2rcq1+q5LmC1ylT/PBgabNTK5bC4DaBu5s6C0jHnc65gJMssf4uHZFPEWSvg
         2Wr5BBN2cpB1wp8vq0Ffer9LmEdBSlKkz+vaPs9zSWbuIT60Autf6F0K9HpqJe0+gzjo
         j6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778225902; x=1778830702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnUmQt9B21/QPu1v+NfQ7ZTcUk5k+/bIm65L2mzXgNg=;
        b=g55ZL9ruw7tr8evlkUFyiqJuvcZAHzBpW4nIDNpErXijn0B3UO2hhvtlQz1oqu59DL
         YR8E/bMbcC3B5Ej90n/IuPgUfhPlfdaBUX91M9ouZD6gl/w4QWMf5mKlAqk1N6RPVV2d
         dh+ESN4EAIlEJVle7Xd+VFDyKFi7M5ZnIVSGnoGsC6o9UdCn+wul3k9RqiU2UQugWtGK
         AKaEoeutgKo3x9v5s5BExqNZu7Xp7+SinYpSWuReyKHkJ54/p2X9aJqKteT23FvzaB0Q
         VW5kgF2WcOXUuLiV6B2yGjvVijM9nb6Bi569YhbGXVOQUQo1jDLJ0Yr40paUsrOqqFIt
         22hg==
X-Forwarded-Encrypted: i=1; AFNElJ+APYsgERHhLi1oW56RUzDK2DcvOjPKerg2so7AZ54ZiEsSSPPwaAgDLZkWzu9v+uRjF6Sh3NB5loSw@vger.kernel.org
X-Gm-Message-State: AOJu0YyRwROKsNHz1mUqjclVZNCcxxjQaRGZBpXQpeUf7qxSLkZkqFJ2
	wNjMTmOw2Fr2Eerf6GOvPGXKqEbAmqNIwt5deDExNBb5S7x2F/35/uyIU11bpZkZYSG9Ww1KJKK
	VYZTybnbS1jhDGh9V2LWck6KTUOY8ies=
X-Gm-Gg: Acq92OEYDbyDQssRajorYTQ3ddw7ZNAm6SoN2ZIUHIMJQ2jKw431HMxNNYXRZhEWmN+
	xwy/J2TwG0drK8sICRKctGWBoDFME3f1JVMYwbLvgjOSXDb7xhWAf/f1L5VV07P77jJqR/Ur7wu
	L38d3z7pu4PbsNuZ9kH0vgNrns/8AWBhrxx4xqFWgXDouseVxw1z1AVbmpVE4kfljg206Nt4Thc
	vJVn1QD9x1M8vvRUtzH8fshgut4mI2BgowT00YShBiwA1YoD/AvD9KJUoy3/1j22/xrZZNO6tY3
	kMNy
X-Received: by 2002:a05:6402:4506:b0:676:5872:c686 with SMTP id
 4fb4d7f45d1cf-67e0dbfa7cfmr2991549a12.2.1778225901513; Fri, 08 May 2026
 00:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502051906.8160-4-linux.amoon@gmail.com> <20260507065002.1883127-1-amadeus@jmu.edu.cn>
In-Reply-To: <20260507065002.1883127-1-amadeus@jmu.edu.cn>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 8 May 2026 13:08:02 +0530
X-Gm-Features: AVHnY4Kd-iqq5DoAuuzBN_ypRWIrf5NA0GuLPJKYH14dL74okotkJ850fDUYxoU
Message-ID: <CANAwSgTyGjGOMaEbwYeu7TX51OtSE0E2T0-ftsvr513J6ANbvA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] riscv: dts: spacemit: k1-bananapi-f3: Correct USB
 hub power hierarchy
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@kernel.org, gaohan@iscas.ac.cn, 
	huang.ze@linux.dev, krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org, 
	robh@kernel.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Chukun,

Thanks for your  review comments.

On Thu, 7 May 2026 at 12:20, Chukun Pan <amadeus@jmu.edu.cn> wrote:
>
> Hi,
>
> >       usb3_hub_5v: regulator-usb3-hub-5v {
> >               compatible = "regulator-fixed";
> > -             regulator-name = "USB30_HUB";
> > +             regulator-name = "VCC5V0_HUB";
>
> Suggested changes:
>         vcc5v0_hub: regulator-vcc5v0-hub {
>                 compatible = "regulator-fixed";
>                 regulator-name = "vcc5v0_hub";
>
Ok will update this if there is a positive response.
> >               regulator-min-microvolt = <5000000>;
> >               regulator-max-microvolt = <5000000>;
> > +             regulator-always-on;
>
> Why always on?
The driver side does not manage enabling / disabling this regulator.
>
> > @@ -361,6 +362,7 @@ &usb_dwc3 {
> >       dr_mode = "host";
> >       #address-cells = <1>;
> >       #size-cells = <0>;
> > +     vbus-supply = <&usb3_hub_5v>;
> >       status = "okay";
>
> This is incorrect. See the previous reply.

I replied in the previous email.

Thanks
-Anand
