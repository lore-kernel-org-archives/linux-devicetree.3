Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794459807;
	b=KmRWPzXUlJdhddy6Qoly9osTDOAooK9A72bJBqkJS11PvxY6wwCCDyVK7Fg044WX+gDp
	 0O5Z8/PBye76Ex64uATcSzPG0dhIM3wO96KePx6m4dtvGpHKRT+OtDPeLENqFI0TttkSB
	 UwgIT0vOQGEAYiUgwbN7d1Dc9f9bsvPnjfaReBMA7UwjH1DxpBoEGJ7PhQPq/3wwzCDiB
	 zHwP13Yi0upOQBaWiQdV5WS4lHY9OOMh7CONcAdVPfwJDEr/XTBw4E1ahiE/mlwNjDh98
	 2Y8lD5j8rHeKb8YCy4RF/R/QB28g1/SxEwPTPgIrIujBio9Gtc11m/Dd9kGjsGAgsVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459807;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
	b=LXGlooAdJhv+7NsnKf01MEVyA1gPUZfZfZDiAV41xKqYfUoPgf55HeHrokArT68qDG8K
	 7vjyKiEM4a5LEekcypU9UUJQAAg1yFSbv/QfgmQj86w8Ua1KZvciQ/OG8umcr3qIeTdel
	 Ll43B8370R5qooywwM5SescRgpDuaDvBr1mbs/90q2g9okfIH1CleyGEQDAL8VkRY8ODw
	 MP2lTfbQ2GJ+CKGIVjkxIT1Uu7E3JenKCr+v+A40YKK77EV42pvnbWfUZNYTfBvVsb8dJ
	 0B7/pskFkB580NECfDYbFkyzcOr6F+NqPAeqdQyga+VtuOwKQm4NqXsywk++6hIBPAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaemNLOU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.177
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B944606A31C
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B944606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gaemNLOU
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab43d1dbceso2055481fa.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 21:03:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794459805; cv=none;
        d=google.com; s=arc-20260327;
        b=Z16FIXnHhol2kP26FF7Ovx3B8TLwo1MPZIcUrhjDO8rx4BwTtKhV9+SNdo+JVxIB81
         hdC0KVyVW1RQV1y7/Z3Vlu2WCyqecaQ7UWV0ipC5LBtBF4LmU7xepinBTuEIrADjsqqr
         yIeGgup7KBicAku6Xj4oCsuX53LfUwJ3qtYZvEM7/jQWZNQJVdx4Zq4xzDq6XxU8gX65
         7M68h725iyQkl8NLUKW4e9W6apzRxwoMGe5AMYhfXnP+U+lelSlYc65DjrUVXaNjuOhw
         w8XZXVKn7GwtlSzYY0WEU6uC8OCk3F8BqTq5EHEW58Qd/kcdkEEbclgkltCor9wZuqJW
         OYJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        fh=R0mjQMlEwYdCBYczDitf/bh0IqkJHVRgH7OsAdeQx1s=;
        b=kO/kAt3/Ol+CfwHftRJvCUOtC+EcpVZVzTYe/UF84AwOWSikYGMnC2pk8OjlzzC7j0
         5XUzRa2YFPc6w4paUKfVtuoX+OJSLsJodaFWE4FZ3q0/FUXQ0CojSOh8Wdnyk3QW/WNF
         tXzsijjcED5v5cNcMF/R4UL+cPshhzwITDFmdQ6FhHD6KZbJon8dvSHI+Kf3hjlQfuw6
         rUP1Qn3xwmpS6C+J+yrPbLRvEzQRjvlmcqzH7NMWpqUA+oPwMGO/pyjWsXcUNNZjQY5q
         X6pnYirs1A8gY2GR4OZTdRXDUwQeyBd53Yk2REo1F6dXoIDVpB11BDu/L7YEZeaiPiwk
         G6YQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459805; x=1795064605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        b=gaemNLOUmMlOj79oNRsDVgPcnpn7O7LSUXjc3Z9LQes5hys/5UrxmwWdqdVCGvBUwU
         +W8tFrrKOU+12KJ/LOuGu9kAooCzky7Xdm2lGJnpzrHN8PMTriAC/ja00bjhDL90Dnxz
         js/vaDgdJHekplKfZKF6dkMBx3t1kMwTpdaVJooJacKipBVoceS9DhbVh4rmPqYjptRn
         vohBQ8BSbqQddzriTcvFGOomzeOR/kvTP6PjurupmLHPC0XPmQ3X77Q5v2Ru8EuqPaKK
         CDiIRnNyZV5eChxvCDDYJv/z40MMxzKZONPs3ombVXGp2r1yJsHjswXSfBTMeXe41jqg
         dcEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459805; x=1795064605;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wojn57CdK3ADHCAhmqBfKGAS91+qGaFp/WwM/gNTuCE=;
        b=n08bBxs1auI+Njj/5PnL9rTK6mCgts/4gtDEDU8/L2lkGfg5a33STJuTooGcYrXz9W
         izO6+YadL//t+HZOkIAHOVNL9H66FoFaLCIE5+DT80+NTrbNHQ/XEBHfnNO1JGDQvYmK
         1ePSTeSFpSnsFzYZZIZF1rlvlWlmCBxEuoUIRzwnTemEVEYGmqr5g7QSseHJmzcGkKtj
         8/JKqmuDNuN8SCO344J50h6/VoATMFDp5m7D80ohIS/OypPiv9xv9LvNYMdBcz0BkFcK
         aV76SuKNFYzWivLq+kdZK9ZGILZsV6Z0UF1fT0QAnaXYuTZyQT3BXeqTYMYUYmeCJi17
         /9tQ==
X-Forwarded-Encrypted: i=1; AL+hErHLcwjHRq8L6FFH7IsbVLt/+sv9BNhZoOSbOb/0E6vz3+NvhcGw2+ESRO1CJu4I3Jd0wci78lJncQ2s@vger.kernel.org
X-Gm-Message-State: APuU4Z+NraZFcRhZZv+2v9rq/VS8KMFU+HZANMxLDF0Z58feHsMucCQG
	JOI2A7UNyXBndK37z7oSnD7uQ9MqZp/iLhg3MU+gFoFwkRzwh5JC59y7c9VKKUU5MN40Q4Jy26j
	2J/oGBjG579dYpfZ/d6tV/zdX6+aHYaM6GNXPiWE=
X-Gm-Gg: AYBFou3LQZvvZtndiIj57kURyFzIMClCqADL8sDFN93Edl4fb7bXJauhNvqd3OnfV4x
	4ZQHuRwFWGlxD5FUpT0SlM+PRsECu59R8oG1jV/2OJdBwH9eHKMccNwQzjz8JMZDH7DunQYXXzB
	5d08ZSszw/TSmiitghsMzD1Pg09jR3qSQ12GwmCN0ydugIaGEyS1dt3rAMq6IChLGXaLGBN2pBe
	VNhru340KdISWR2fqpxKg23Q9e5FdHREMcMIz62y+IuI0RQ/csDGrAdRiv0FqFex4dk/pMpVcvV
	YEx43ZWgq2o/qzgxA14VLRF0ont83HlgNCeosXZv2IpS8eAxhC5wvZqI++9pyFvNJ8UXKRxV7z5
	MtMlRsV8D1ZCk9B/3nfLyXyHXGfAASv003MqtcmaoEgKeSe5uDZ/y/K6zxG+k4RBlE49pgfg=
X-Received: by 2002:ac2:5683:0:b0:5c1:4f83:180f with SMTP id
 2adb3069b0e04-5c15d79ea99mr1533353e87.6.1794459804558; Wed, 11 Nov 2026
 21:03:24 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-h616-zero2-dt-v1-0-05506d760f21@gmail.com>
 <20261110-h616-zero2-dt-v1-8-05506d760f21@gmail.com> <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
In-Reply-To: <ekjxzCRpRcWPwcDw_lDV4g@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Wed, 11 Nov 2026 21:03:13 -0800
X-Gm-Features: AclHuK_1HOFnNDyAInx4WxkF0Jpvdf0PJfEA3HHVUlfWeMJnLB-aUMtv6VNxQng
Message-ID: <CAEy9hNV+tiw6RgjTz2zvCFriLb9Y9-aDhgfZMF9mxzUryGWqYg@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: allwinner: orangepi-zero2: Add i2c aliases
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Ryan Walklin <ryan@testtoast.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Understood - please disregard v2, v3 will fix this issue.

On Tue, Nov 10, 2026 at 8:11=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Dne torek, 10. november 2026 ob 06:37:02 Srednjeevropski standardni =C4=
=8Das je Arun Iyengar via B4 Relay napisal(a):
> > From: Arun Iyengar <aiyengar1990@gmail.com>
> >
> > The I2C core numbers adapters after the "i2cN" aliases and hands out
> > dynamic numbers, in probe order, to adapters without one. The Orange Pi
> > Zero2 DT has no i2c aliases, so a TWI controller enabled by an overlay
> > for the header pins gets whatever number is free when it probes: TWI3
> > on header pins 3 and 5 does not show up as /dev/i2c-3, and the number
> > changes with the set of enabled buses. The vendor manual and the
> > vendor BSP name the buses after the controller.
> >
> > Pin the numbering as the vendor BSP does: i2c0 to i2c4 are TWI0 to
> > TWI4, i2c5 is R_TWI. Disabled controllers get no adapter, so nothing
> > changes for buses that stay off.
> >
> > Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
>
> NAK.
>
> Extension connector is not covered by board DT. Use overlays
> if you want to use them.
>
> Best regards,
> Jernej
>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts | 9 +++++=
++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.d=
ts b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > index d5d39bac5915..98fc83291dc8 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h616-orangepi-zero2.dts
> > @@ -12,6 +12,15 @@
> >  / {
> >       model =3D "OrangePi Zero2";
> >       compatible =3D "xunlong,orangepi-zero2", "allwinner,sun50i-h616";
> > +
> > +     aliases {
> > +             i2c0 =3D &i2c0;
> > +             i2c1 =3D &i2c1;
> > +             i2c2 =3D &i2c2;
> > +             i2c3 =3D &i2c3;
> > +             i2c4 =3D &i2c4;
> > +             i2c5 =3D &r_i2c;
> > +     };
> >  };
> >
> >  &cpu0 {
> >
> >
>
>
>
>
