Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com [74.125.230.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FD8494829
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 11:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.235
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162555; cv=pass; b=dDKJ5aP1r1V4QmWaEjalpeuVFRN38RlY5+zq3yejEJmExYwWnsiqPQW+3N9Ckn5f3KVGKp1yG6ngPuYe9YlCQLCpB021Pht5OAEdv+iKo9VFOts+Ji5jpTygoJmyRJ8qru8VEgFEC1yqFbamwlUxxd6/8TRcwqjU1o/klktsHyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162555; c=relaxed/simple;
	bh=aslJG+w3cMQHAWQW9rbg0eDe2JUIpTkkt1yvgS0DwGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WZ3EqaMWSmFFd5IRBAdQVYAo1rESxJteTnhwgBv0g0tSjsExtUBZbWgOvSCYZbLMQkFxbCB/NPOHNtSsR0XT2hUhH13qe4r0ugTjvLlVBCnwjJv+7UsXpIEpq0gD32KMRUYKxaAg3E1sDka+is0/+ZxWB08n3TKEqhl1f9y9nKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Py/vpVoa; arc=pass smtp.client-ip=74.125.230.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Py/vpVoa"
Received: by mail-qk2-f43.google.com with SMTP id d75a77b69052e-530301ff353so11636521cf.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 04:22:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162553; cv=none;
        d=google.com; s=arc-20260327;
        b=cMgkEq6Euw4T8YqRWyELopoPt8tkw+pWpwu1Zf2YSY6Vn5P9I+VoE/pl+Kr3+PTWAo
         0KiwP8PRTaprBdlJBuZARwsgEu7V+YG1UkonuNMNsmvSr0yvSlgGn3dB1NL3k6Fq/6va
         IWEli1oc0zr6Q4k+AwVHc+qwSSGRIIk3c1DYTohWI0ukp9vASbl4/LC7J/yddO4MEy48
         o98uL0B6YiNV0H4LkOXeoej8aHYxSzWBaruAQX8/EF/SpnBY05zIsrUlPEAVYAEffydY
         7bqxygL5eYeDFHtIOPzbgenfhZOnAEsp20+0ZMHGLiktrs3t1gNkYGDWt1BkWxXB4Zla
         gfNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6/yEKR8o1ROxNSwNl5napETaMfRqIurYCtQTLFeCXcg=;
        fh=TrpflnMp6fR7FHi2qTvKjZc2rVI/DuxrZJjXdSq4Wao=;
        b=Izdrp6ahfC20qa3Wk4+T5MbuosgP+WZB/BLWFrVdtFpEpic1+LIutLa6mzCD8PnCGO
         76XKTM+F/cbikGZTC1mAmlgzL3aC5lk2FcJ3TkBuDxxPxetNEIeRe6fQI6oAtty8dc7I
         zQxmRHVEUn72ZL2iScLhm6untenjlzT7Gvb9nt7Kh8tBE5m4kJZ4ohigLaZzrz7gNUXM
         uBF0pk52aJ+I2WG/nBMTShFpT87jXgBm+qYp77EFXP0/8Tm9ATmaurHF5FPnaD9gQfAq
         C+t4p8cf61/bQkkPR5WgWxO28nhD1ElleEK51HyWG1QtwiAzeU9h63LkVhFwRuLh1SoP
         JZNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162553; x=1790767353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6/yEKR8o1ROxNSwNl5napETaMfRqIurYCtQTLFeCXcg=;
        b=Py/vpVoad3ucj74l+v5OUkBuVQsNPURpY9XqshQ9sT3OJy0bI05qr8RXkWS4qG+scL
         /UHXgAzr5FSKwUrGrNeMS77uno+fnwtkQxK49CPlfEpIDZUP1ixM6f8lN9kFZzBMNhMd
         i9A5AetHo4FtBJUgj4WISAjFv5otd6xld7YdR+63qLEzBTA/70D1HUJvhKG5ZfAyJOGn
         BQOUzUeaHjeI8tuaogUyferjtMgPOsiOH3BuYEDp1N8SaFUTKCALDGYAEq04xKykxIRk
         5LtOHIGS2bD0dw16U7iyAUCMyniJi78lIPlq6ys03gjGpQiJXybZPZHnoiTm58Ow8Ncm
         cWVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162553; x=1790767353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6/yEKR8o1ROxNSwNl5napETaMfRqIurYCtQTLFeCXcg=;
        b=XIIiPPNqqXoSXgR1P8zRE0GAnAm5uMU7nDvE5vc+I/Wp9mJIYy1SDSi4sBEK8LJvXL
         zo7Aikm2/CfVVDOu7rmlTa0KU9ku22KZXeu5BTl/KiTz32eBNfrUSOiFLHW6T3d1JGfh
         RicqmqKrqIHxhYpTwBZi8hzFMp3+UTbH76t8YBw4OO4OnzK3Cjb2q5AVIJU/skW+Xt5P
         KTN38nQeCv5ulWGYDYLkh4uj64pTZclWxd/a7n4dvNJtjLDRsb1+L3gq4SGgfAfSd8JH
         QPtKAOWScaepAsmsXyiJ3q3xcO5OEgXZcvBFxngvhvWGezdl1evOrLVqz2usPmIjxgMr
         uu9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqt76bDNiLLandGAURk88jWBkBygq9dyC63LiaHMUwRhxyjZSj0w4EMKbldM3SdVeKHzo+BS2IJmJE@vger.kernel.org
X-Gm-Message-State: AFuF++nUPHzDd8faSIicbWSIllPO/6OUQuZ3aicfk5lZCa+pCbBevK0U
	d6Hs83GXZONKdUqQYqYGWY5dfce2tyuumqDpgG9HEAVaNGFFe/HTiQ38IXK/T9eHcoThzkx1Kp4
	KkIjJWwoTB5P88NYkVlbUCXpdqjvzTyLzW0DFbBX16zNh
X-Gm-Gg: AYBFou2RLgCBZu/Zg2nsFzuJKDx66XqWAt4iyRMRvGNB/Z0m8iiZTAYxzY/QF++v+Dq
	BpUY0zIj2yZ5RAjglq1cQhDqvo/FFzoqFiy/OOJqbbCWlYyJCnXYJQdgiN1jZTcNyDB2zDFtazL
	u60jBMn2XCMhXcrKFa0HOiOSQNVz063FcPDiZOgzmk9SzkkRbygx8Kz5KDrwCs5sDXsa8LnJ9LP
	RFIxyrxyfBrspqNysAfmO59YUYyHPQH595SU+ljes/RocIQpZQy8aNLjlcDiNRKftRdj4Ir7pYs
	2qltRSaztGk68i8ioA1GaAdlUD2IY4s0s6gznYpztTYj1Lx5gJC/9m9XYg==
X-Received: by 2002:a05:6214:2e48:b0:912:5ac0:861f with SMTP id
 6a1803df08f44-9140c1b0f18mr35187016d6.0.1790162552706; Wed, 23 Sep 2026
 04:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923105208.198-1-anykey196@gmail.com> <20260923105920.CAC761F000FF@smtp.kernel.org>
 <CANHPwARNHjh92DFd30rdbkqzGw6jhQQoKdQhHUx09gTTu1C5YA@mail.gmail.com>
In-Reply-To: <CANHPwARNHjh92DFd30rdbkqzGw6jhQQoKdQhHUx09gTTu1C5YA@mail.gmail.com>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:22:21 +0500
X-Gm-Features: AclHuK-G7kblUAb1JNixL0kLwSeuWnesiMXkdWuZUry8w7-I-stza3Or0Pd8q9U
Message-ID: <CANHPwASywA3B6M+q8STWrVbknjXHywu8jp9ePS-DdqgAVv-v9g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin
 expansion buttons and IR
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review - you are right. The two buttons and the IR
receiver are on the optional 24-pin expansion board. With the board
detached the LRADC input and the IR receiver pin are undriven and
float, which can lead to phantom key presses and interrupt storms.

v2 drops them from the base board .dts and provides them as a
devicetree overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a
Makefile entry, following the existing
sun8i-orangepi-zero-interface-board.dtso approach.

Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion boar=
d.


=D1=81=D1=80, 23 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 16:1=
1, =D0=92=D0=BB=D0=B0=D0=B4 =D0=A1=D0=92=D0=9D <anykey196@gmail.com>:
>
> Thanks for the review - you are right. The two buttons and the IR receive=
r are on the optional 24-pin expansion board. With the board detached the L=
RADC input and the IR receiver pin are undriven and float, which can lead t=
o phantom key presses and interrupt storms.
>
> v2 drops them from the base board .dts and provides them as a devicetree =
overlay (sun50i-h618-orangepi-zero2w-24pin.dtso) with a Makefile entry, fol=
lowing the existing sun8i-orangepi-zero-interface-board.dtso approach.
>
> Tested on: OrangePi Zero 2W (Allwinner H618) with the 24-pin expansion bo=
ard.
>
> =D1=81=D1=80, 23 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 15=
:59, <sashiko-bot@kernel.org>:
>>
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [High] arm64: dts: unconditionally enabling optional expansion board r=
isks phantom inputs and IRQ storms
>> --
>>
>> commit 51b58a06db4b29809dc98ff86ac9cae923d63f7c
>> Author: Vladnwx <vladnwx@users.noreply.github.com>
>>
>> arm64: dts: allwinner: h616: orangepi-zero2w: add 24-pin expansion butto=
ns and IR
>>
>> This commit adds device tree nodes for the LRADC buttons and IR receiver=
 on
>> the OrangePi Zero 2W. It maps the buttons to KEY_1 and KEY_ENTER and ena=
bles
>> both the LRADC and IR controller hardware.
>>
>> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w=
.dts b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
>> > index ff9b40352a545..1b690e3cd041e 100644
>> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
>> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero2w.dts
>> [ ... ]
>> > @@ -189,3 +190,31 @@ &usbphy {
>> >       usb1_vbus-supply =3D <&reg_vcc5v>;
>> >       status =3D "okay";
>> >  };
>> > +
>> > +/*
>> > + * Buttons and IR receiver on the optional 24-pin expansion board.
>> > + * KEY1 -> KEY_1, KEY2 -> KEY_ENTER (LRADC channel 0).
>> > + */
>> > +&lradc {
>> > +     vref-supply =3D <&reg_vcc3v3>;
>> > +     status =3D "okay";
>>
>> [Severity: High]
>> Could unconditionally enabling the optional LRADC on the base board caus=
e
>> phantom key presses? If the 24-pin expansion board is not attached, it s=
eems
>> the floating LRADC pin could drift into the configured 1.0V/1.6V voltage
>> thresholds and trigger unexpected button presses for users out of the bo=
x.
>> Should this be enabled via a device tree overlay instead?
>>
>> > +     wakeup-source;
>> > +
>> > +     button-1000 {
>> [ ... ]
>> > +     button-1600 {
>> > +             label =3D "KEY_ENTER";
>> > +             linux,code =3D <KEY_ENTER>;
>> > +             channel =3D <0>;
>> > +             voltage =3D <1600000>;
>> > +     };
>> > +};
>> > +
>> > +&ir {
>> > +     status =3D "okay";
>> > +};
>>
>> [Severity: High]
>> Does unconditionally enabling the IR receiver risk interrupt storms? If =
the
>> optional board is missing, a floating IR RX pin lacking an internal pull=
-up
>> might pick up electrical noise and oscillate rapidly. This could severel=
y
>> degrade system performance. Would it be safer to relegate this to an ove=
rlay
>> rather than the base device tree?
>>
>> --
>> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923105208.1=
98-1-anykey196@gmail.com?part=3D1
