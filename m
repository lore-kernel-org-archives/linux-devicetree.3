Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E42123F417
	for <devicetree@vger.kernel.org>; Fri,  1 May 2026 01:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777598073; cv=pass; b=Zs/IrgbhRDSlm9vQZTSWNZv586PyNmYQwPjYG9Mw8PP3fTfJVnAgsAhyj9kgSNQq+sQxX2/mzLKMUrJKJ2MnhSgl+Vb3EQu9ywDaTIP+8d5ySUzKlWcD80TSh9Cjc3xb6jNvK65wBXoq/5wdQQLOm9tQ0GKi086YyKOcwJMQ3Xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777598073; c=relaxed/simple;
	bh=exuSsdHKT+zthWkuRA+gPVVR1CT8EoAl1eoPv1aF30E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pX2F3ax9gfw+O12d4GEeuNbxoXRavggkaLptPUTx60cEM8IjYgTbJb+A8m8wN/2UwyGRoyKUmknHD5yGUEBxWCuUeva7fRK83uzhTHhTjisRkWZ6g6BpAlGsJBJ2WY2bLTTDoJou9B6YQe1O85ujEkWZDLR+tBYzKpdi9agFLPU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmYq3UIj; arc=pass smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmYq3UIj"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a742b8b72eso1687729e87.1
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 18:14:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777598070; cv=none;
        d=google.com; s=arc-20240605;
        b=kk68Dr9NGv/no8a8M8cOGhWLSEo0jwedOocUI6X2zMQvFk0NDiJ3oV7qX73EIDF1qW
         y8j2TJGEzV4CJSRaA9cNlfeiArI8fWKi/IXNz0hQvIaSKPiRCf+AItaNWcP+c5mEae0R
         cjADgFQw5gsHK3VD7qgoCdFBf4IUFP6SaOtkhO7NF6mgpAIb7X1qsWIrhm+FkIKrQH1M
         d7bfaRWTQalGlG0NJ/A+TMNqs1t1NqCWYgdBJIets/UrBMAPPghdoFR+b/0nansqUPaP
         RbzT1gAQDEPZjb93r3Sr6qZboO3+CLihoVXLw2jZq0nWNTJ6nQtNi0sYcR1CbVgbG1l0
         TWSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m28+puEu5Ee66n2KfB2wRWkME3JWmn3lDkS7ebPVgFI=;
        fh=JayzxEyaioHg+D5Q+qGOHYTQ1YTUUxHGY8w7lzCxXKQ=;
        b=Ps5tWSDyQW4Jlo0ppSEHRZl6Zapw8toPXYVBo6CGlcEFSZAD0uwIOJnLu2mNCYWoMp
         OUh5s7kuOTuJv3UiXO2l7+/EzWW3SnxaMR+HVwPXZdnPLL3VrpmKVrNecmzvwx8OA3qh
         STetaJEurw4BOYSyCzl5gCmJ3aNw3vDsVnVxDfupnzKWfgTpRfmO+rA/b62tx4C4HNVV
         fT/CyfQLz1yq62///0ApiYegc/tgo1uqtHcFELJfb4QUlH+iUllBiv6hKIwB6Ws1pGYu
         WEliE1+cKG2Ei3ixp/AENjfHIOXwgv3C0vooGbG+s04ToSAxcFZ9/Arng32kLvnmXnqf
         LSyw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777598070; x=1778202870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m28+puEu5Ee66n2KfB2wRWkME3JWmn3lDkS7ebPVgFI=;
        b=fmYq3UIj6n+1SlEHq0pvOEQYOO7uh4+ufhzeoW6uu2DnQB1l9XXWZj7MnNxlrABMXc
         IoPT82retLbo5VNjEdmQZOT4/TTUYVs+NWLC8BLxCeyNoNyTO9ycDFKy/ofoyh7bWA/j
         MDEWTKDCNzHLN/bQD2k2HW1WOjNOrNbeIt6DhCVU3lavmgMzNit9z9esLsklO0RGVili
         1Jto8HWH6NUQ+3NAxsOGX9xsThf9tcY6ptsTlV51KfkEsgfcjjSAtyt01B2otT0Mj2/H
         MeljtIOglRu7Kfu79at1tCKUwnxDWvXv2yu0qiYw70xif2w9UVZnWyLfCQORasu9iY1L
         uUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777598070; x=1778202870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m28+puEu5Ee66n2KfB2wRWkME3JWmn3lDkS7ebPVgFI=;
        b=SgPHQrPqnun2EESL9uVajrD6NE66Qwbp0R0mTOSmUxJUswfICvLTT7DFEfc6fygJSm
         mXEd7wnSfJg7hNkEnGjftynfiT4g2Tt+EmyPMqOlQ6GYTHRFrjLloXRrOcch0A5gY4Sk
         Mhwv3ufqqn7c93IyCX42GBYhTlcuYfcjHfbL+xAlXQDb8UUpr8Mc9v3SsaLBep3BuLoO
         YwbBezXxaYlPzsNpxO6r3qYUykV8Lx0Jn2vvuKwN3Hv9sagNEdaQRPv0DuVTNkMt51if
         avhEiCNSNkVrtQJNVWhYKx6TUwPgRmDF2xOQnpZzIBE2tkAv0LjrGuA7g+cvRyEJMbd8
         DZ+g==
X-Forwarded-Encrypted: i=1; AFNElJ+ZpYafvX5sfe5SDPOSMDCoCbzQ4KR7utfCNE5x99ToKameVai9KgLLprVqDsqtlKuLr9yQqrca1cMU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+j9TmX5kLvR2O8vu+79rpC/lruhvL7WOiqtpw6dUvCjizsR1T
	qNt4D/OCRtrMYxWniB0UQVkB/L0yFvc2/TIOeAs2oNF4Tr8BDpanJQQItU8tXtXdC9bSRT30WM0
	xLs8mg0VaiqZ4YBw9vO19NXZtmG/MJYs=
X-Gm-Gg: AeBDies3w1h3Zc4jmeJT5JTIUDRmzYTWsHXqvjU0xgRgRQpeeJ5yuJUPAwpz1CjYyAF
	ABWoy4rX8WcD4YPuCNkXnrjWZJtbvAF5aUfwYz8VN/Z3bZ86enmOOq+QG6UmBPtIupBmh+Ov+JF
	a25ccYrKLngWhxU842Sa5BexEspm5wceDw837YRsqJ4A22ApyKaTz8hyYxNop8Maym/w1Q99bUw
	3FGPMHubBRZJHW9XsQjsrmuq98IIK2MFjfOix0JdZrFauVwSS5ScgcN0JUsy8MNV0Le4uhr3iu9
	LeNklwi/BZU/oDWqsTD4FqETh95VNlMibV7ZAMQz4NGIU5H4mWa+3nfNaH8GBvMjcMjtiPnvMNi
	5nt8=
X-Received: by 2002:a05:6512:2385:b0:5a8:53c4:f8b7 with SMTP id
 2adb3069b0e04-5a85aea76edmr271048e87.27.1777598070239; Thu, 30 Apr 2026
 18:14:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430-ayn-qcs8550-v7-0-591a96735fa3@gmail.com>
 <20260430-ayn-qcs8550-v7-3-591a96735fa3@gmail.com> <51eb35d3-5390-4f3b-9cb7-8d289151a650@packett.cool>
In-Reply-To: <51eb35d3-5390-4f3b-9cb7-8d289151a650@packett.cool>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Thu, 30 Apr 2026 20:14:19 -0500
X-Gm-Features: AVHnY4IqGOmz8R89G_6Rz307FJq6ErM4oOGk3cUhVY1gE5fm-FmCr4i0j-Ja4HU
Message-ID: <CALHNRZ_dG4KGoeCp0Qkqd667U90FfPXvO9UELnC5d=SwjxXLWQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] arm64: dts: qcom: Add AYN QCS8550 Common
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 6:59=E2=80=AFPM Val Packett <val@packett.cool> wrot=
e:
>
>
> On 4/30/26 3:43 PM, Aaron Kling via B4 Relay wrote:
> > From: Teguh Sobirin <teguh@sobir.in>
> >
> > This contains everything common between the AYN QCS8550 devices. It wil=
l
> > be included by device specific dts'.
> > [..]
> > +
> > +     /* The tzlog label is required by ABL to apply a dtbo, but it can=
 be on any node */
> > +     qcom_tzlog: chosen {
> > [..]
> > +
> > +     /* The arch_timer label is unused here, but is required by ABL to=
 apply a dtbo */
> > +     arch_timer: timer { };
>
> awkwaaard.. Is there any problem with requiring erased dtbo? For phones
> that's generally what's done. Having junk from random dtbos is best avoid=
ed.

This has been discussed like 6 times over at this point, like this [0]
thread for example. The request from there was to make this device
specific, so here it is. My use case needs a variant dtbo in order to
support all AYN qcs8550 devices in one software release. And the
install flow handles the dtbo partition, so for my use case there will
be no random junk. And use cases that don't want dtbo will instruct
users to erase the dtbo, and this doesn't prevent that.

> Also according to the pmOS wiki [1] at least on some of these devices,
> there's no need to boot from ABL at all! There's also U-Boot and you can
> switch between ABL and U-Boot at will (sounds awesome!)

My use case is Android, and shipping something installable by the
average Android custom rom user. Manually replacing bootloaders is not
something I want to force users to do. Especially given that the stock
bootloader supports all the android setup already, I don't want to
have to re-implement all that in u-boot. This has also been re-hashed
several times in series leading up to this.

> > [..]
> > +&i2c_hub_2 {
> > +     clock-frequency =3D <400000>;
> > +
> > +     status =3D "okay";
> > +
> > +     spk_amp_l: amplifier@34 {
> > +             compatible =3D "awinic,aw88166";
> > +             reg =3D <0x34>;
> > +             #sound-dai-cells =3D <0>;
> > +             reset-gpios =3D <&tlmm 103 GPIO_ACTIVE_LOW>;
> > +             awinic,audio-channel =3D <0>;
> > +             awinic,sync-flag;
> > +             sound-name-prefix =3D "SPK_L";
> I guess there's no real standard/convention for the prefixes but maybe
> worth changing to the more readable "Amplifier L" / "Amplifier R" that's
> used on e.g. the fairphone,fp5?

I guess I could.

> > +     };
> > +
> > +     spk_amp_r: amplifier@35 {
> > +             compatible =3D "awinic,aw88166";
> > +             reg =3D <0x35>;
> > +             #sound-dai-cells =3D <0>;
> Also #sound-dai-cells should go last, with a newline before it.

Ack.

> > +             reset-gpios =3D <&tlmm 100 GPIO_ACTIVE_LOW>;
> > +             awinic,audio-channel =3D <1>;
> > +             awinic,sync-flag;
> The awinic properties should also be a newline-separated "block", before
> the # one.

Ack.

> > +             sound-name-prefix =3D "SPK_R";
> > +     };
> > +};
> > [..]
>
> BTW, do these "just work" right now?

I get sound out of the speakers with no additional aw881166 driver
changes or manipulation on the amp alsa controls, so yes. I do have
instability with sound in general, like the active stream will
randomly stop making noise until a pause/resume or something in the
kernel (or adsp?) will start infinite looping, taking down the entire
card. But that appears to be related to the adsp or qcom dsp drivers
and how aosp interacts with them. Still playing whack a mole with
that.

Oh, and these devices also need mi2s clock support. Still waiting on
some version of that support to land. I will have to follow up with
whatever final form the dt plumbing for that ends up being, if any. I
do have to carry out of tree patches for this at the moment.

> If so, I guess you're lucky and the "firmware" / register config binary
> for these devices configures a 16-bit 48kHz format which is the one the
> soc driver forces.. because the aw88166 driver, just like other awinic
> amp drivers, doesn't negotiate the format stuff at all and blatantly
> lies about supporting multiple formats :) I'm currently fixing this for
> aw88261[2] but eventually we'll probably need to actually kinda unify
> these drivers..

I would assume that's what is happening. Having a more robust and
unified driver would be welcome, however.

Aaron

[0] https://lore.kernel.org/linux-arm-msm/20260207-sm8550-abl-dtbo-v2-1-83a=
faa6f3ce9@gmail.com/
