Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080C5296BAF
	for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 07:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784445161; cv=pass; b=pVEQBvxYXMMm0ymSzZYSCsNuTwbC+4oarWk5TFwAVk3WKYVjjqs/TH/sNMww/07g6t/wx7eLAiP1I0tbvUZTP0x2IrCan6p/W93DaeyScvEmfIsHurYm07a3eDMj8+nfJVJ5wBru1sPAw21+WN8oKge5VbVqAM3i8LDFYFLYALI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784445161; c=relaxed/simple;
	bh=F1lTGunzt27WbdZSuJqoOYveszw8SDxRZJRer04R1HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrpE13MMVSF+iTRZTcu2Nvdq3/fU2IvT1bD/1pqRJC7wPst3gtgcndjQZpvzthz2ZeE5u7BVRoqSjGZMnUtGx8GqBtjn50pVhjoZlWVe5Jx7+gIL8xWJQJhFsXeL71Pq8wxP70O2IR4ckO+toHl8injLHspNVqg3R9t8HhudXqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qktzlvbb; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qktzlvbb"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-81e8c68c0cdso12533597b3.2
        for <devicetree@vger.kernel.org>; Sun, 19 Jul 2026 00:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784445159; cv=none;
        d=google.com; s=arc-20260327;
        b=ePUBQjUOOK/tNT81GP5xioOYjC74MRdNbhXB1/n87Kg47opCstr31n4oYJmQ0DJPXw
         4QnNe4eoU5hZAG67cSlgoMpl6iz/rrln1Yb7UUzIAbFJXyfGkeuf7TNcwlXipXCEhRtV
         xqOAQRzhOrcZqO2SkbkUOXTChiot6ZmRZWbRz/3saG1PFJrztJYerBIkqAROpSuLqF97
         /HY8QR7aWkoxlVorvZtB8+PY4trC1SFlVkwpKK45hngUMxe/sO8TTcFbF1oJ8sH/qGeX
         DkoTZgqcpM7nEQVo0XOVhyZzah5q6mXhtbEjFyeMncZ694hVOeWI9QiQhUScrgC60eqx
         enCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=23v+TCRaHL97qB9X+OWsm5RcYY3oynhNHZYAO3tEqAk=;
        fh=DHI/rRNm3TFHGru6LArInrVb8As5zH6D3WWZTkEFEkA=;
        b=qCkLhIJ+Cr37OlUxiTXq81VDx7+Mefgy61RXfdxMbBFH0EtYYB1knkUAL6W3kXBfzm
         2IkHrim8DzjUri2BDExWQ8J87n8QzW1g8+Qyv6A+tHWS+pCg3ZFeStR0gMBh/ih6kZXl
         6s7HAkFA9AEDwdsgbcrCTkKZZ98fYkyjcxQJqTFHL/1uKrOvB3iwlPg4qxnbH4H0OEvQ
         cApg0bGhszfMMcDxyTgjY8AN7rEGMml4bqq5MbbuDq2jpKbAzyMo01k5+lBp+jaPNFPX
         X3ivy9yk2OypPh/DC1+cjhhv0seRH07fFBjq3S+qVD1ISQ7YVo304p5qTsPsz+Fq+DvI
         Mtgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784445159; x=1785049959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=23v+TCRaHL97qB9X+OWsm5RcYY3oynhNHZYAO3tEqAk=;
        b=qktzlvbbi0j9sQSG9aPRFHzJ3jnRpMLcS1QtsDC4XpL3cTPqvzad0ZpbQ9PDkiv1HE
         mFF+4/44Xf9HzZdxkcD8cbywplYbedGBMiKMsmJQTAWP9VhNM4rFo/09CeGmJm3mkHqT
         JDeqU2jjagchZzsjz/Y4AwbnnPBgd42MQDPEkfaK6luTVofJTkolHIxUHXCVCdmr2dd9
         1vQQmaByPOYmq8NxYOzTNPSq9LX0Rob7twulF24wJSkv6zubXKSmfOjV7VJ07BFvnBH5
         RhE2GHCdE+O78kurCoLerXJ9Azzo12Wr7ieG5tRmcaZ7wdMB+sLACPxcTctCtnwWvXDN
         saIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784445159; x=1785049959;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=23v+TCRaHL97qB9X+OWsm5RcYY3oynhNHZYAO3tEqAk=;
        b=p4Lbc5vQrcl14Q/Z6sZENxpPggoiDU3gLae7+B4hh4NyYrV2kMr4g8yPn5/n2+QkWv
         w+vZB6k5qPe9kCYStRsT1PfCDijsYobucUhi01Ikla4VStybN4alyZMnF7Tdf59QwbAF
         KOmZ8WYc/OAjtuAPkxE62REs3rQInW59TDjzOZvrfIFeVFg9ZcKCngeHIPu0s6HoLNEY
         VgKDCyofxVSUy5zGiN7LiX6jFAq0OhxZwHHXrcQSm6ivf1zN7OEoMrr5vyYiexbnAj8N
         nlyjfrs4yvhGZJgkP+9n0owQBT8iQfDFC17NzeBt9dr2TMuAhsZqJVyjE1tUq+6lVm5i
         V/xw==
X-Forwarded-Encrypted: i=1; AHgh+RrtX9+OdNmdz5h/IL3zYDak8LLD2OgyVNR9advWZevw3o1BO5z/XXFkccLdbCl9hUJDYmL7ZHEjSoYA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/fgcJwRIp9xr0ZL7+05emOn3GtjXY2qZtKH/zB4/2qL61KYHc
	ZJMOc3TT6ATaL2ga1ACqndUxvUMTxP29lXNj5LuSPjlDclvK9DwfFVlUOFO/zevHLnyN2408Um+
	KU/x0pVua320Tb8ok0Bwlr1MOvrbEPAA=
X-Gm-Gg: AfdE7cmss0u/dYgi7eSFpdkkrJoQ9FjjVL1qkyMLVRQzSpvtZztDKUayFY34DNZNwhm
	F3cwaVq6Oi+E7N9QS8t9H1JH/+jQaM1GhSmyCWIZuJQpEN+cgPP1piyqGfZZCd9NGbv/u+ehG92
	0mEXe1tEv2+NB3zY3DZZ/Lc2MqPS9oU4/zt0nEAP7PVC6SAUEhnWoPai9wA5WGW8J4eW23xFKfO
	YcSTiuH/LhDGnnMP0G9E7L0IXmkeJEFt+gCcBJrazjh0vj2hr6l0VCSdVLHnk0Q6/VW/lC6oD4D
	KQSZxVMlk/k63VF1V40LT6CzzE9I54E=
X-Received: by 2002:a05:690c:83:b0:81e:6c2c:3ffc with SMTP id
 00721157ae682-81ef2629e3bmr32786207b3.6.1784445158857; Sun, 19 Jul 2026
 00:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-5-royalnet026@gmail.com>
 <alwKdkNsMi9L4ZiY@venus>
In-Reply-To: <alwKdkNsMi9L4ZiY@venus>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sun, 19 Jul 2026 09:12:27 +0200
X-Gm-Features: AUfX_mx_RiwSU3kUGsytx0X-0-rCnuMvcdXhkd-AchBz93x27nuKFpMthFPgCLs
Message-ID: <CAEWPSH7wGBatr7zUp07Ekz-_-9MWaFv1wYFHrawGUvV+U09meQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio capture
 on Orange Pi 5 Plus
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sebastian,

Thanks -- both make sense and both are done for v4:

The card is renamed to "RK3588 HDMI-IN".
The card definition moved into rk3588-extra.dtsi as
hdmi_receiver_sound, disabled by default, mirroring the hdmi1_sound
node that already lives in that file -- and the Orange Pi 5 Plus dts
now only flips it (and i2s7_8ch) to "okay".

I'll hold v4 until Dmitry's testing round on the driver side so
everything lands in one respin.

Igor

On Sun, Jul 19, 2026 at 1:32=E2=80=AFAM Sebastian Reichel
<sebastian.reichel@collabora.com> wrote:
>
> Hi,
>
> On Sat, Jul 18, 2026 at 10:57:28AM +0200, Igor Paunovic wrote:
> > Route the HDMI receiver audio to i2s7_8ch, the receive-only I2S
> > interface dedicated to HDMI RX, through a simple-audio-card with the
> > receiver as bitclock and frame master. Together with the audio
> > capture support in the snps_hdmirx driver this exposes a capture-only
> > ALSA card fed by the HDMI input.
> >
> > Tested on the Orange Pi 5 Plus with multiple HDMI sources: capture
> > follows the source sample rate and stays in sync via the FIFO-level
> > clock tracking in the driver.
> >
> > Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> > ---
> > New in v3.
> >
> >  .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/=
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > index 9950d11..d5840e1 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > @@ -37,6 +37,22 @@
> >               };
> >       };
> >
> > +     hdmiin-sound {
> > +             compatible =3D "simple-audio-card";
> > +             simple-audio-card,name =3D "rockchip,hdmiin";
>
> The name is exposed to userspace and visible to the user (e.g.
> in alsamixer), but also used by Alsa UCM2. I suggest to use
> "RK3588 HDMI-IN".
>
> > +             simple-audio-card,format =3D "i2s";
> > +             simple-audio-card,bitclock-master =3D <&hdmiin_codec>;
> > +             simple-audio-card,frame-master =3D <&hdmiin_codec>;
> > +
> > +             simple-audio-card,cpu {
> > +                     sound-dai =3D <&i2s7_8ch>;
> > +             };
> > +
> > +             hdmiin_codec: simple-audio-card,codec {
> > +                     sound-dai =3D <&hdmi_receiver 0>;
> > +             };
> > +     };
> > +
>
> Move the whole card definition to rk3588-extra.dtsi with a new label
> (e.g. hdmi_receiver_sound) and add status =3D "disabled"; Then just do
>
> &hdmi_receiver_sound {
>     status =3D "okay";
> };
>
> in the Orange Pi 5+ DT, i.e. just like the soundcards for HDMI
> output. This reduces a lot of duplication as the soundcard is the
> same on all boards considering there is a dedicated I2S channel for
> it. It's disabled by default as some boards do not route the HDMI
> receiver at all.
>
> Greetings,
>
> -- Sebastian
>
> >       ir-receiver {
> >               compatible =3D "gpio-ir-receiver";
> >               gpios =3D <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
> > @@ -247,6 +263,10 @@
> >       status =3D "okay";
> >  };
> >
> > +&i2s7_8ch {
> > +     status =3D "okay";
> > +};
> > +
> >  &led_blue_gpio {
> >       gpios =3D <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
> >       status =3D "okay";
> > --
> > 2.53.0
> >
