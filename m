Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71613A05C4
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350425; cv=none; b=ICiqurronvPPUmia1UD9YzmHA1lqRfEEKmz8qRh1PiWG4M8AOdcypE4pjQDd3xiXLcUhcLn3U4Dn2BV6zMZcyCCsIqdYnc4Cjw2S5PowpWJAj7dp40Aiud3tWa61rDrHrpwYtKqTmjxB8sIEFByMYF+Vnty7YCK61e1g5+2sPXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350425; c=relaxed/simple;
	bh=Tx53MwLePeLZ23fDtjKJB5lRx3lgXxTNcSrKPTCnhJw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hKx2FelHNXAoGicPoPqF0tV1ilRozJNX/5Zfv0t9/GDFKsuEhu/qsy4OtEA6AH0kpN9i0HQbWddHKuNA0F4iGFlRbqgta0gKtNUFWtQo4IJNwBBMyQYX6VHmk8xx3iNdW6HgjmniF7VsgBOUxZzWzmakh6sdwf/m2TiKy5ReMF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCWK7EVH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCWK7EVH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49039a8851fso2490295e9.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 01:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779350422; x=1779955222; darn=vger.kernel.org;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9PrdA31q5x8SAejtf+3EF1jeBrhc3Rg2VGzoBKR6RQ=;
        b=TCWK7EVHMf/5GAkugSVV+3lI+EoG3kfcJnDy406vfnum1aZ8h2etHEtGxrK0yCdqWs
         6WT7PzY342FN2oMLt/6RN4xMvpXEMswcCaDoaRKXN1QycWYAv1JlR4Td6osTn67uO2zu
         6SqAq1Sh2da151pdZ7Thd6QjQOQbIONGzZ4sKB85xf/B/xLEJCJLMwP/Sli9a3rgYoIy
         NosIwzNnoHrDjIturAb5+uYjgkqVxXIQGOVAejj8xWyOMTc3ELp+KhyodrfWbhw5YqrC
         2at/1SErzn9Sq7JSPko0ZpImjvKqfUdOHuh2tnVIDQz3gq0ACSgyFucB84+EvUGtv2t0
         BpPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779350422; x=1779955222;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9PrdA31q5x8SAejtf+3EF1jeBrhc3Rg2VGzoBKR6RQ=;
        b=jlVk5sz8US9rwtlz6AE3dW1omYVZf7Ab3HogyJn2sYhZH9zLaELXlpUi6T8AivPCAK
         B5AsjhLgsEXIaeBNF2RdFJRi73IIkJUIAqaiercI66HHKYhy0gbsEJB1m45qerM9OfXp
         PeghOxJAmacnmFqkQwGSegiUdaNS+KtGAASCJRciT1FiAA3QdNKe8dXcD15ZemFrc+kF
         w5kAJlsc4l0AmVd9QhXtN//MiVzquqR2YiQd7HEbAeyfpeP7qkWV6LccKqTN8vTY77bL
         jfv7440M6T0TZWX4+KQEHrt+ziOzLc1IA8ZCCo9+aWFjAURAQDUOVDnSgaGcu3Corw5N
         Ks5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/BTwQZHpHrzp7p+U/ZOjp4I3b7e9QJFT2eH8CMCBZ75E5XRdeZlvUOJKuTZgKZ9oK+ogR6HjwC3sM2@vger.kernel.org
X-Gm-Message-State: AOJu0YxPMNez0vrQOSORFilq6t3gJAD/PcXLrv0ujX/19s7s9+zR+7Na
	Isg8O/jHhNALCrJBuDq6j51oFyR/V2gwLZS4L65KggOL34uhGYRm7+td
X-Gm-Gg: Acq92OEFleqB5V8Mvx8vuDhd3CJMdZ+f9zVBkXp4QotZqLQsGcaC0sNh+gsPnJ5pGlk
	95qa7aNcGM1tonkPt1R/Wkmr6wDT5jJ1SIs6beRiAKVf4IS24IrTLyjGOLbAbIOpKkT3l2wXSkr
	qYDGzpSp4AdgbpmrLNtFkQacM4VC7Pfr6qchfcT7DzaRW0pi69UTD+RyqoqLxhriCC8oEUCpJZD
	q4NSrasnMhaR5TUTbyBFOSGHKBkqgx5NQiVN3CqTFZg9qas/jPQlOzhz6iU3hJ0O7lhvjkdcEVZ
	f2zX+B8+HhXd6c/sWACi2+irhgdMzMY0ezkAf21qKcCW59ICGoIChBc9+VRzNT5g+shXREhLGgQ
	oXOlFtiE5fQ9SBC2dVHfocNCF4TOohMfWlBY+qai0ETf4gekWia+vretjztxfe9tv+Q/xtFXTu4
	9BPTYENAR8W60tb9CqSDxunVoIdz15lEcPrg==
X-Received: by 2002:a05:600c:468b:b0:488:aa33:dcbd with SMTP id 5b1f17b1804b1-490360c12cbmr24099035e9.26.1779350421276;
        Thu, 21 May 2026 01:00:21 -0700 (PDT)
Received: from smtpclient.apple ([197.250.51.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa92ca96sm726769f8f.19.2026.05.21.01.00.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 21 May 2026 01:00:19 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5D209284-6E0B-4B8C-B2C6-1CF1063CB628";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.500.181\))
Subject: Re: [PATCH v5 8/8] ARM: defconfig: Add a zx29 defconfig file
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <30b96e0d-f296-4c31-8701-a15c568ebffc@app.fastmail.com>
Date: Thu, 21 May 2026 11:00:01 +0300
Cc: Linus Walleij <linusw@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Drew Fustini <fustini@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org,
 soc@lists.linux.dev,
 linux-serial@vger.kernel.org
Message-Id: <3B300E28-8603-4881-8A47-E9B86A355090@gmail.com>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-8-ace038e63515@gmail.com>
 <CAD++jL=_eDY_mG_QBreSrZiho0hUrDSciedq=vrxXaTiMwrSyg@mail.gmail.com>
 <30b96e0d-f296-4c31-8701-a15c568ebffc@app.fastmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: Apple Mail (2.3864.500.181)


--Apple-Mail=_5D209284-6E0B-4B8C-B2C6-1CF1063CB628
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Arnd,

I saw your reply to my defconfig pull request, but apparently never =
received your original reply. I only found this mail here. It looks like =
I have to look for a better E-Mail provider as gmail is choking on the =
volume of the linux-arm-kernel mailing list.

To answer your questions I found at =
https://lore.kernel.org/all/61452117-0cdc-4ec2-83eb-dc03ccbd410b@app.fastm=
ail.com/ :

> Either way, the patch description above should at least explain
> why you think you need your own defconfig, as we don't normally
> take those.

It was more cluelessness / being new to kernel development that gave me =
the impression that boards should have defconfigs. Since then I ran =
across scripts/dt_to_config. I haven't tested it yet on my DT, but if it =
does the right thing I don't think this board needs a defconfig.

>> +CONFIG_CMDLINE=3D"console=3DttyAMA0 earlyprintk root=3D/dev/ram rw"

> A definconfig should normall not rely on earlyprintk, just add
> that when you actually need to debug the super-early boot
> stages. With "earlycon" it should pick up the right console
> from the stdout path and work almost as early.

>> +CONFIG_BINFMT_FLAT=3Dy

> Are you actually using flat binaries? I wasn't aware that this
> is still possible on MMU-enabled kernels.

>> +CONFIG_BLK_DEV_RAM=3Dy
>> +CONFIG_BLK_DEV_RAM_COUNT=3D4

> The old ramdisk boot is going away in the future, please use
> initramfs instead. This should also save a good amount of RAM.

I'll fix those in my tree and keep the defconfig around just in case, =
but otherwise drop it from the submission. We can revisit it later when =
the board is more complete.

>> +CONFIG_DEVTMPFS=3Dy # FIXME: This is specific to my initrd. Remove=20=

>> before upstream
>stale comment?

I believe I removed this in later versions though :-)

Cheers,
Stefan

> Am 24.04.2026 um 11:54 schrieb Arnd Bergmann <arnd@arndb.de>:
>=20
> On Fri, Apr 24, 2026, at 09:13, Linus Walleij wrote:
>> On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
>> <stefandoesinger@gmail.com> wrote:
>>=20
>>> This enables existing drivers that already are (UART) or will be =
(USB,
>>> GPIO) necessary to operate this board even if they aren't declared =
in
>>> the DTS yet.
>>>=20
>>> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>>=20
>> *I* personally (as SoC maintainer) think that having a few more =
defconfigs
>> is fine, even helpful.
>>=20
>> But I would defer this to the more senior SoC maintainers because I =
think
>> their stance is something like:
>>=20
>> - We have multi_v7_defconfig for compile testing
>>=20
>> - We know that binary gets way to big for your system: it's for build
>>  testing and perhaps booting in QEMU or systems with many MB of
>>  RAM, not for actually running it on products.
>>=20
>> - You are encouraged to keep your own defconfig out-of-tree.
>=20
> Right, we clearly need to do something better than what we are with
> the general defconfigs, as I'm sure many of the existing ones are
> never actually used for booting a machine, and are horribly out of
> date with the Kconfig options.
>=20
> I wouldn't object to adding another defconfig for a new (or revived)
> soc family, but I don't want to have more per-board ones.
> Overall, we have about 70 defconfigs and 55 soc families that have =
their
> own mach-* directory (plus a few without code), and the number of
> defconfigs alone makes it hard to keep them up to date.=20
>=20
>> However I even challenged this myself by adding a defconfig for =
memory
>> constrained Broadcoms a while back (NACKed/ignored ;) so if it was =
all
>> up to me I would merge this.
>=20
> I don't even remember that discussion ;-)
>=20
> One idea might be to have a tiny base defconfig, plus platform
> specific fragments that add drivers. The problem is agreeing
> what bits are essential enough to still get enabled in the
> tiny config.
>=20
>       Arnd


--Apple-Mail=_5D209284-6E0B-4B8C-B2C6-1CF1063CB628
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoOu4EACgkQPRO8yFRP
GiL8IQ//Zm20DYooaVaVCuklde82UX5X2MHKLX3bEwoqFm8OwrwK1a0bu61uKXRd
TTj/RVjingjzc/MWqbhSiDLM+1tvrMaa8bhi16TRYn5upIa71KlieKL5Kd/9cmoW
fqmI+HoIIq6mQTIYJ2GMCp0/ciADEXnE41buFWzPiu7BMeVInJMaYpX6NKyXd7ZG
oAf3t5tCMMxrRfBq7bv4JV8TAjLdibq+SNyxH6xYoZwrW7J6pLYGeHJcbUNNHJFD
Vl5PgpflnmNhfcQk7nTKufpY44szSAwB9GmiuOemwzmUEGv3V0e4t8Rni1FlHQsR
gAUiB04OMbDSDV9kntSrZwbEUR4UkJLZhKanfJOTv/Sy6pNZLpcS0TB5YY7TEfcy
lr1oKB9HXUka9mhPKFmGrC0TN7jkPKmkTLK70RXVtNX/pU4dFSsm0yP76XL2KrBA
rfvH0At+i5cU3nPYvoOm56VkiOfHsnQB9adNQ5l8GeAUpQB6HI4jr23IhD8BYvsB
yKxccCZ4tkD05c9InZqE+lsxvB9esDjo4gKZzFWhuXY/+4rOcRowbxsFGHt/TCWn
9U7SU0cAsuce6Ex+oPs62EkqM0yyZ0FMVlmVGI9PJ5O1sJ5W6xYOlxwnLGH6TJNE
bOIJ4WxSJmZra+QaQXak7qAOxAV92+Du/IioWZnoXjGc0BzTjhw=
=rcPP
-----END PGP SIGNATURE-----

--Apple-Mail=_5D209284-6E0B-4B8C-B2C6-1CF1063CB628--
