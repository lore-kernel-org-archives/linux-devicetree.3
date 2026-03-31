Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BEB3A4F25
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 19:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986126; cv=pass; b=FPXgfEWFITtUqocDkhzdwEecHnz6nCC4rW2z+aDoZ7P3n/zquZ1yNn9Dv1uY2BQYUQDh+KjP2Yj9Pg0WghR517TtNFPbDZ4rw4DwpgTHPkSvcmBnNqLQXTknNbjqnuV1q9Q5/7FjJKFFzHWCB9KkyJSjaB4j9jf++mTUsaLDFg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986126; c=relaxed/simple;
	bh=FWgkOXMUwnt18dWCxZSFtwZN74ofX/zX8OPQuY+UGxE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RPIQteXLXBNIjXpvM3YmmW7o9cCxx/FI/e5OBe5zdB4g1KYYm2wuBRlz7PgyfasQ4t9cB7/O2Vci/DdZeVy96QrxZvuu9PcU/sgLuw9QSRYcMkg/b6hNhytJEbsF0BxxvqiPzuBhWJECy8mxLlI3nITWW+1reHoTbwrX/jHCPiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=gilmore.net.au; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=ckqtPR4U; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gilmore.net.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="ckqtPR4U"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89cc71f4311so71936356d6.3
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 12:42:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774986123; cv=none;
        d=google.com; s=arc-20240605;
        b=DnUO4/yn8R5WuxGBJgh5gambrcJjPUK1EezXuK30Yu1ZT04nqc5DWShDLe9SB3TI9u
         CH10cNQKxmkHRDGpIt8Wsy2pLukiwzw/ISBJ1sBc9WLx1boBGzEX1js5WrEkDgm6oCgi
         Kac+fOAQiEm0aU/uEe15Ao6zjzJ+/hKi23vF2T7+l3W5Wka78ugXuhwQUgm4Y/Pbeoqp
         kP1MxuyaJ4BBLgjkAHXfDbYRlqR8HMVvXhrJ/lUcD+0ja/GCb3/Z7WobRWH5JGPxS0z+
         cJzX9ZfxHnLnZ95XXSDQB60TV3hWpVyLz3acqeQAItTmV16WsVXje7uNKXj2ANnfwd/c
         rfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/y5CfNmiEJ0DIyea4capDIT3MgKL12KOZPGdN7RFQc4=;
        fh=9hThCdeLGELTO9HTMtwh4L/JbXJ3Q/VJxDUF0bZ5dGs=;
        b=am0KyJlq1KtfHj1FLZuCHmoitEjGz/zjv4bW3upAk/3Dg8yEjiwaOulXuUEuz3ohFf
         jF9kYtfMi87ege2a0AwuEVw869ft2lBn+DYPqDCCCD7/broUu+UpddsqI8Zqxq+ciYGw
         lLh91K3t0iRRlo9zsjSknA8fIxPAym+MgIVNmaPGmj3q72h4v37O+wd5u9fw4VbD6jY2
         Say9z3MvG82aF+YCwJ3s3TTt1g766/VyWIbBdkdQnxvREl1hMKPNOkZoa8mpvPGgMn0u
         kc6HXB3+ZxdQ6v/qAkI+ZjTA1Uy72seh/AGKPy8nqcHK2mc8qWKg8isxPUqj746o3VTs
         Pvkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1774986123; x=1775590923; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/y5CfNmiEJ0DIyea4capDIT3MgKL12KOZPGdN7RFQc4=;
        b=ckqtPR4USaSZcOhNOMh94RLe3CNxfOFHf2MRAFvN2szPl+U8V5IE0kjBuAb9mIsXPr
         glu8JW8ZIS54znKZ8frRzi3NODqCjp7tro7e71P5Qo4jMDzwmWQlq48NU9cS0ePiTiPY
         u4xCPzbqwdTlyF3MRg/v++1L0aCAFk5Nu519LOl754dgmcsne1jR9/mS+AVzuVk0+d2b
         SJqSyA7rW5iHDHmD5WD3fZ1PdTzqPacyHfydW9gJEUbA9oOcQ6RIqpkYjlKyR1Ko7h2w
         eeU5IffraxliAplokwKoB5/ALIeZYOoSIG198mJun192UkCps6RCDrgKEQm02aw5Mstt
         sxqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986123; x=1775590923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/y5CfNmiEJ0DIyea4capDIT3MgKL12KOZPGdN7RFQc4=;
        b=WrGADsVLcSq+gIaoWNiGk8V7758q+lQMt631pn1jzV4pH+Jj+8akMf51r3Jr3sjLrT
         jKrLcExHF7AjR8CXemY3aB7ObjxDIkH55UliuZSySNwJfg5MVxXWqWsILdSfFh4pYGEJ
         lElLJZn3I2Ev9BFfcICGsy8VZscmhaJ0ITSN0vupH67WdXQLV8hiU0mD3dJrtJTltlP1
         ZRt9grzdW/w5iY2ouEdhMor6SfRUKaHow+02/3oaKd0i4KxjCIwhN58VfHpohnJyP5MJ
         eb5lghuPacl1RjlGfowG/sXo/Mte84/KxfQ0KQLS+AUl1v7q1QCGfNzK1vdAOMWanfYk
         +Dpg==
X-Forwarded-Encrypted: i=1; AJvYcCUVXxnqCTP3MbCplgunYMiTUaTTpuqR3wdzRhwJs63lxqSqajEmeJFDs1Frfan9XhvsjbzHaDfieAnI@vger.kernel.org
X-Gm-Message-State: AOJu0YymGAjHSt7qqgrAkLH1b1O5UXW69srZm7MWyr26eY0xuxYm3HZO
	Ov6pxfzLIn2jAJCsswd0saL/XDLuLTi3i3MoxR2gGqA44YPGe6wp1LwjbxB9pVaIAnfAQfkvpaS
	29mfW9uMQ2NytfLi9liXbPzfbzqcZSyoFiBWfmt0gEQ==
X-Gm-Gg: ATEYQzzKvjtvVAvXov+vwNF0cOUpX8obiUnc5AGoOMCCfgHYqOyFXNxBIL8VQNe0vNf
	/9j0nvLlhAcGfJaBuTQ2A0OBs9G7pRfQcdIQ4p5yGTDxbh11SPGEq8gruhdgFqtdJFQQBUaEQbg
	TLGORNjqlgqtnTKWRYRCzr2MavMAZeW3YLeOd5mLiri62fwVBhy12kvhgydOqrVefNFYXHA3Dzn
	sDT1MAZrnVDoR8WcjoI9HZDBjbgSqQErF49z5Yv41AT5VMxz635RFgq82HC86a54rTg9c6JOlbu
	FvNtfSUpjBW6a7tAFqJQRUJgRjK6uHD8egSn1MH/ILUHHDdBdaYHtZLPV1A3cMR4KtP7Flw=
X-Received: by 2002:ad4:4eef:0:b0:89a:116b:e67c with SMTP id
 6a1803df08f44-8a43a464ea6mr12862136d6.45.1774986123445; Tue, 31 Mar 2026
 12:42:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310031002.3921234-1-dennis@ausil.us> <20260310031002.3921234-4-dennis@ausil.us>
 <CALWfF7KD1=U-gC4wC9M49kEYD3ijcfr+XSmMeh_-zAvjO2JVoQ@mail.gmail.com>
 <CAABkxwtz7KjVJpSzYhUWGyEym5k4d3NJq65OS_E3NCnrNUBTZw@mail.gmail.com> <CABjd4Yz3MKOp-gE8kNc4EOt3-a0mKZsxvbVYCN4KsbqTRDtWgA@mail.gmail.com>
In-Reply-To: <CABjd4Yz3MKOp-gE8kNc4EOt3-a0mKZsxvbVYCN4KsbqTRDtWgA@mail.gmail.com>
From: Dennis Gilmore <dennis@ausil.us>
Date: Tue, 31 Mar 2026 14:41:50 -0500
X-Gm-Features: AQROBzAJGaJIP3nK18K6kC_9mEp5NIzQoY1iqunk6Z7DDcVgaVEtYTtM-9GKruU
Message-ID: <CAABkxwsD_59G3YrpMdUi7D1fVHruSuDHn9-gQAZbwTdxGBHaBA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Alexey Charkov <alchark@gmail.com>
Cc: Jimmy Hon <honyuenkwun@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Hsun Lai <i@chainsx.cn>, 
	Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Andrew Lunn <andrew@lunn.ch>, 
	Chukun Pan <amadeus@jmu.edu.cn>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 9:26=E2=80=AFAM Alexey Charkov <alchark@gmail.com> =
wrote:
>
> On Wed, Mar 11, 2026 at 5:29=E2=80=AFAM Dennis Gilmore <dennis@ausil.us> =
wrote:
> >
> > On Tue, Mar 10, 2026 at 7:20=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.co=
m> wrote:
> > >
> > > <snip>
> > > > +
> > > > +       vcc5v0_otg: regulator-vcc5v0-otg {
> > > > +               compatible =3D "regulator-fixed";
> > > > +               enable-active-high;
> > > > +               gpios =3D <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
> > > > +               pinctrl-names =3D "default";
> > > > +               pinctrl-0 =3D <&vcc5v0_otg_en>;
> > > > +               regulator-always-on;
> > > > +               regulator-boot-on;
> > > regulator-always-on and regulator-boot-on does not seem right.
> > >
> > > Why were these added? The vendor did not have them.
> > > https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65d=
a2b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5=
-pro.dts#L216-L226
> > >
> > > Was this mistakenly taken from the regulator usb 20 which is powering
> > > the onboard usb2.0 hub?
> > > https://github.com/orangepi-xunlong/linux-orangepi/blob/232ed4b97b65d=
a2b7b647c4e3c496f8594b9f3f1/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5=
-pro.dts#L111-L119
> >
> > It may have been a missreading of the schematic, but it was added to
> > get power to the USB3 port. before I added it devices plugged into the
> > USB 3 port would not power on
>
> Hi Dennis,
>
> The schematic says that this regulator supplies the VBUS voltage for
> the USB3 part of your Type-A OTG connector. If you make it always-on,
> you'll likely lose the possibility to use this port in device mode
> (which you would need e.g. for flashing images over a USB cable in
> U-boot which also takes device tree sources from Linux via
> devicetree-rebasing).
>
> You also link it up as the PHY supply of the USB2 controller, which
> doesn't describe the actual hardware.
>
> Please see if you'd rather define a connector node for your Type-A
> port, and list this regulator as its VBUS supply explicitly. I've
> recently submitted a patch [1] to make the "onboard_usb_dev" driver
> take care of enabling VBUS in exactly this type of situations (it's in
> usb-testing now and will hopefully hit -next sometime soon). If you
> need an example for its use, please refer to [2].
>
> Best regards,
> Alexey
>
> [1] https://lore.kernel.org/all/20260217-typea-vbus-v1-1-657b4e55a4c2@fli=
pper.net/
> [2] https://github.com/flipperdevices/flipper-linux-kernel/blob/2f814cdf0=
7f50e901fc1b1328213e76460864c20/arch/arm64/boot/dts/rockchip/rk3576-flipper=
-one-rev-f0b0c1.dts#L303-L328

Sorry for the delay, I am taking a look at it now. Please let me know
when it lands in -next. In the meantime, I believe what I have is in
good shape and is working well here. I am happy to make a change once
support lands upstream.

Dennis
