Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793238617;
	b=GSxcBSFsmrDYnjIf8PK6WrTnmctULlGoY1lMuwp+GstEJuFWxrXy/TUjH11REysQCoMl
	 QQh6HL9JooCkrBwomo4sA+A+BmKrEWveM989ZD7dXLR4kDcfrOJ3pk4KLbSd/Fk3tLrr0
	 2ojpBHG1RsILfLROgKLICg4Zfldz7pee3446kVahEGgaspATtVFGJkmIl1aoV8UVOV6uE
	 qz8Sajh5P+rXn/nnhRmemex3Lectl/lCUNU/yesnv5OjkXatU9RpS3xTUMSyD1gxKEMsz
	 c3txAFi7mRwFNR6wOR2nmodXDZm3KSBZk8WT7EHVTU5j+TJq6bqlczwIetyE8X8xVVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793238617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=1IGTvqOaIXaosXRusH+LH79qQVRmzVc9OzbNy7vNHrs=;
	b=BZ1skL3OCxPmKlOZcswG1PqQrM7XA0BhAuMUeWA7oNm62mYur4kI9lZX+1/fqZM+G3Du
	 OXj0x4iTWeBDn6AvwncJmkUiIP7GPXLSosAK9OtwvtdCs2J3tRJ5LftSWu0WcsNo1mGF8
	 2KaeovAZ63voq//jFXbe/iflq4sURmIM2eioSO5us4B4WXXm8tLlY32iTscZaf5hRbOGE
	 ++F4MFxzI+o4fMLsLzgvIID2fSxkz1fq6R28BGT4YJOVPB6Zg5zbRpmJRXf1lGcoLItFs
	 ZKjUCWdCSy1BrjM4pOPfiUsRudGnQRPMG4/DAQr9DDzYRaxDosWKER5ojzm/hGUxtHA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zDR+sfOu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BA4606A331
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42BA4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zDR+sfOu
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ab432273c5so16093747b3.3
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 18:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793238611; cv=none;
        d=google.com; s=arc-20260327;
        b=baTuqOVM94ZL4vxkwOweh812oWvVIsyZa4bSUeZowP9w8S3mudQcOb4sL9K7YGiuY+
         tWr4b7ZWteowVdzL4Zvo+C4L0tt0rGxznwLrbeYdsrfgVpY4DZq2TiLZ7Z23dP9LZuOb
         gNTzenYnc47/drmXdemjVzlZ08yNqWyk82mq1nGhhBDS+XN+0Jd4sVPtJnpE2sCgH90/
         d/5Mn1J/pOHub1xqFY5XSwfBLLYk5uJGqsdZIz8729OlZkUhx22Ki36eziRlVcHmCFAy
         5chjveOoIJjIhfMKVFSUCbh0TOfmnx34huYxpg1WJCfsiSZjupfPWX5c6bUIdrBv6IWB
         g+Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1IGTvqOaIXaosXRusH+LH79qQVRmzVc9OzbNy7vNHrs=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=fF1vcoxPgtXci/ujZ9xPJAxvZFzdOPfCzmeW6K2lU1atUo9MTFPYEaM6qiErk0egBZ
         spb1ardKMhkox651BxDyu6WBwi7b/wIQo1nBodArf6RT4y6Xl8X3NzxI4Dx9F5tKP+zx
         qgX7XBW1N7DMrllH7oe1LrIeaXik1acUxZQ9mME9cpLbQSPP/bSOVhjDCH9rNbxEnDbE
         8biTiM0ZCVWqryRYiRcvOKymufREIpQBNSYE87eJGY6jPiWknH8uAH3bEzbXtY7ECoUG
         RzMzib9GJtKSeV9I1S2u+bxgt6rVIaNHc/Hsy11lP3EutFNmztgdm4FiMQtANj9BNQqo
         UjOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793238611; x=1793843411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1IGTvqOaIXaosXRusH+LH79qQVRmzVc9OzbNy7vNHrs=;
        b=zDR+sfOukFa9kaJbzyUu+cyRslQ/JnJVArrLXNdYywziGdSzvhWg9RrzkfSX0aB5II
         qy4a90i0PHmZeA/bTAAqWuReroDeJw5cKgn25lsX8TXr4jMinVWEx5R8TSjXpDo+WEX/
         aniQJKdougMBSwFQo5B84Fneh5NzdLvv20HOOX9PH16CNqOG4j2N7yxHVQ0NQjytSeag
         uPlKYdb65Ny9Asd/eUpp7kdPnTw/mescfTq5pqWv5zTLfJYgk3DaDZ/5l5SbsO6SJj9q
         noMmkIrAUxYIGu1s22H036sgpE/oWjp3ioNQItuhb4dEoOApOCNNJAy/4GFhKteA0Nfd
         o2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793238611; x=1793843411;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1IGTvqOaIXaosXRusH+LH79qQVRmzVc9OzbNy7vNHrs=;
        b=TP6EQNdcnQ1/RoePCNODU7IYFUlKaMBe34zlx9asrzUPX8bnWsp4psAkPpcWR5ebxt
         RO2upJ/4jvFiX7WlQqCgbFzqwG4qjaercUrL9dghL6i3oMDZg2B8/flB5ne+EuWYNoIv
         TWpDJu5xfktb27OfeKU4CmGy+XNchTw9J5bxoZMRcHhMrnlIHhUQECfyyn/CvcJnr8X0
         0oo91AdOh9QHRTR+QaJnhS2Jf+/SsXw1QV/C7wK80FHaLsG4VCUjWIYSKilhtmg3Sgqv
         lQ1xbTD5CxL5bvLmLTbv7cIoK9HqyaGJ5pfufr837bSglREhG8+56cJayF0joT0B7FCq
         sr7w==
X-Gm-Message-State: AFq9FYLvCa7s2BuKl4XzM8v+aO+wZyu05eTsfeqnboFBewrXVWFLXuYR
	ZgEv7Ezvifmcw/NTpXigGpYrzWVSw0bpBgb7LCtd5k805unu8Ewyb9qmhsZdPJjbg8MiXBvcon6
	+u89HgIH60M7Ey+FpGBdXWZiEXpAsm7E=
X-Gm-Gg: AYBFou0JF2mCa7NCEFBa8QGl9w2hv8dxnsivJwz4KH/AwcrDP/9l1a9F/Yn9DIniHIy
	1tVcb9hmUoS0VtferYt9kn7bQa0XcDJkrAry+jxZEdS05bD1M+YG0x4OfVrP1xboA1ucEX8+uA5
	6nu+i+htZ+fTCm4bKERTCuCSHKrmoo+kEOUE7OX/tOeKDdXmOT7ql3OqkEHRc/MeIKGtmAl2s1C
	5o9ueqKl6GZXXR/V1EWz4unoXm8lWqeOZN1XFoOUGqs02UOFZ3k62yANieLR3b6wgyqcVlTVCoZ
	KM+eihweNsvDpGYa/4r2XRRDpTOTkY+IuopXkuuTMlAL21j7qRs0rtAGTYQqJwUbtd2lfWk8Qth
	ePQA2UQnBO017RKzijOCCbyvdo1Tb+bGWcASa
X-Received: by 2002:a05:690c:38b:b0:8b0:c71d:2b2b with SMTP id
 00721157ae682-8b1b5d115f8mr38039877b3.45.1793238611233; Wed, 28 Oct 2026
 18:50:11 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027034911.99482-1-prasanth.padarthi10@gmail.com>
 <20261027034911.99482-3-prasanth.padarthi10@gmail.com> <sashiko-outbox-186061@kernel.org>
In-Reply-To: <sashiko-outbox-186061@kernel.org>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 29 Oct 2026 07:20:00 +0530
X-Gm-Features: AclHuK_4V4-6JjYI5xwd4wQKypfFHekosxQ467fFd16gHBxLUQfaqfsdhwDLghU
Message-ID: <CAMFFDGi-8hzS1xe3EyK2iiyz3VEbcdr-MMCbw5XODPna=OUj1w@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Thank you for pointing this out.

The serial0 override was intentional in the tested local image:
UART5 is exposed as ttyS0, and the image's console/getty configuration
uses ttyS0.

However, the override leaves the inherited serial4 alias pointing
to the same UART. I will review the alias configuration and verify
the console setup before the next revision.

Regards,
Prasanth Kumar Padarthi

On Tue, Oct 27, 2026 at 9:26=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] ARM: dts: aspeed: b650d4u: serial0 alias on uart5 conflicts wi=
th aspeed-g6.dtsi
> --
>
> commit c5dab769447b1fc4b06269064e28141f872a8a59
> Author: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
>
> ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
>
> This patch adds the device tree for the ASRock Rack B650D4U BMC based on
> the ASPEED AST2600 SoC, configuring memory, SPI flash, UART console, GPIO
> line names, MAC0 with EEPROM NVMEM, and ADC channels via iio-hwmon.
>
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > new file mode 100644
> > index 0000000000000..630588dcb9f3c
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts
> > @@ -0,0 +1,173 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/dts-v1/;
> > +
> > +#include "aspeed-g6.dtsi"
> > +
> > +/ {
> > +     compatible =3D "asrock,b650d4u-bmc", "aspeed,ast2600";
> > +     model =3D "ASRock Rack B650D4U BMC";
> > +
> > +     aliases {
> > +             serial0 =3D &uart5;
> > +     };
> > +
> > +     chosen {
> > +             stdout-path =3D "serial0:115200n8";
> > +     };
>
> [Severity: Medium]
> Should the aliases override be dropped here and stdout-path set to
> "serial4:115200n8" (or &uart5) instead?
>
> In arch/arm/boot/dts/aspeed/aspeed-g6.dtsi, the base aliases node already
> maps serial0 to &uart1 and serial4 to &uart5:
>
>         aliases {
>                 ...
>                 serial0 =3D &uart1;
>                 serial1 =3D &uart2;
>                 serial2 =3D &uart3;
>                 serial3 =3D &uart4;
>                 serial4 =3D &uart5;
>         };
>
> Overriding serial0 =3D &uart5 in the board DTS leaves both serial0 and
> serial4 pointing to &uart5 while stripping &uart1 of its alias. During
> serial port probe, uart_read_and_validate_port_properties() ->
> __uart_read_properties() in drivers/tty/serial/serial_port.c resolves the
> port index from the first matching alias:
>
>         /* Get index of serial line, if found in DT aliases */
>         ret =3D of_alias_get_id(dev_of_node(dev), "serial");
>         if (ret >=3D 0)
>                 port->line =3D ret;
>
> Because of_alias_get_id() returns 0 from serial0 instead of 4 from serial=
4,
> uart5 is registered as ttyS0 rather than the standard ASPEED/OpenBMC ttyS=
4,
> which breaks serial console output when booted with standard console=3Dtt=
yS4
> kernel arguments or userspace getty configurations expecting ttyS4.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027034911.99=
482-1-prasanth.padarthi10@gmail.com?part=3D2
