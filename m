Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F174A207C
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344582; cv=pass; b=b6pr91rmQDU97fYtwZgDIpZfOhlquaSy+NF+HHPD+k5ww31EJIsQHAMRv8EQY2ZrzTJL62FmiNMn1JiY/eYKjCtEGe1lKQTSL4jV++JV2grT/P55+pT+K7EhRBoQMUOJjHS+sHfOYC06Mij0J8C4r54abdqGd4yAlU30/e/dSfI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344582; c=relaxed/simple;
	bh=UgUMTxBPxmEW7PQnJjEcpbON6QG5O3T1GA+P3aAl2VY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oF8gttTnH3G0DybuI29NAig93VPr41rhRFY0UgwLa3V1nzIeMsQgzsIyx6bYdR4jCf8jYnTOH5lN5nZ6Gazio/LWm24CWk68mJmgDOg3rVwH84aR1IyzA8Dx7WxR7+921WitqCfZokyngbqtzj40ti8I+PMUtTrv61r+RpC1QCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=RpIeIv/f; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="RpIeIv/f"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59fa3112cso7227591fa.3
        for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 06:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790344578; cv=none;
        d=google.com; s=arc-20260327;
        b=BisOBRMJwVwaKCz8j8eNCo5JpJCmUnP/4CsdAZ009OGNgPMKHhh5qRmxIRJYpji0/x
         LjVSG1Qbd9GjE0JbpmTVR+NSoNT8L2rRi+3hdJK+QIMof7/13XNbjtpoXpPA2Tu4XhwI
         ObhuKddMU07ivAjsXseJ9y4wKoJrD7t7VDH5z15Mq1Yovj2DFsBlWguJ2rIjr0Vq5Om3
         dZ+qsFwK3K5shxoMTRCbnUTrSWB+xXGfbyPLaFOXhWc/y+KBpBtprEdrpZiCWI+N9FVf
         li2inVQWX9RuNECe03toXyFxBbxHx7xsxsDZeqe0rC94Rtsdpk0x+uNnHrGLBEe/NuHa
         7+zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5RSbzXLvSVEOnRR2F+nkCevP1o0t0p9ITeJnENpJDZs=;
        fh=Rr7XTPoM6lND5VewmfDZpBr8FCafffZWXFPFShVfGYI=;
        b=XcPthZKJ2kaFtaOTtNx4cLK1mISL5t1IKchpe95DA6DEcAAwwXQz/dAYi/RgUl50r9
         LJZZWXHMltbCoAiybhTgRv53VJdwrCwyvwzZBCP1bOqVFc4XZfyCxJMPdnA4X8CpIhNa
         FJD4eH9LAQ78uuPh74EekqUmIDjVtBYjLzDLFT4j6UvGKRMU2IgGZ9OMgTIyeVj7t4VD
         4BAlKcx0JBHsq1zYY2V87keUkb8lj9l6uP2J0eGsG0BggWmzCCssIaKl1q+IexWzVLa2
         j4/a8FAew2GEwhFY2VqU2KICaYXLDA3ZDHHcH7QkYQvzBHNAb9ocze+VXV57ixBD9RDK
         wEdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790344578; x=1790949378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5RSbzXLvSVEOnRR2F+nkCevP1o0t0p9ITeJnENpJDZs=;
        b=RpIeIv/f6mph8QLw8rkLYJ1gRaJjpkeJzUS9d2LuXaHVY2eQ/P25Hnf4BzSPIJ5PJi
         K1A6W8FktbX5PIL7hQsCdAbEDspF72nDpJhy5QwkJ+Cy7I3l/4PLR90Q/5Vamao7JJxE
         0BwogzeyFPJphLqn2hYJ4PdKa24LDNaXIiy4YD++djUxObHaAyXyOIuPS1ZPurjhxg92
         8CzHuSuILYuiZo37MEOMgpCQpURZmfWMdzURAFqiE7yRwC7DxN3w/RIg24SY80gWO+P6
         66LA36uRNZf57Kl6W+37aClsWd0DyrSu8PvT0i7t6n2VDi3sSfktiG3o8HoWnLx45St4
         JUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344578; x=1790949378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5RSbzXLvSVEOnRR2F+nkCevP1o0t0p9ITeJnENpJDZs=;
        b=zIyyFc2EIessFXVrfO/R4Me5GwJeYx0aeqJecm3tHZRaZlPgb3xUwPB3o6gYj55Nd4
         Y0zAOkP+gI9LsEucwB4bUwmNw9KBZMaCVl0p5ICr9nTPaLmFtyk9IPJJwhecf6huxCke
         FdeVKGfaepp/aB7ptWQMoFm885xX86HdLdArJ2gm/RpcsqhidwLMXkdbaHSXcpLOXO/T
         azZupaPu9m6ckFFd2G+B7xr34s2MNiIKHm+cgBQXCOZuzs/Ju43hA08f7IL0UlSWAyKv
         Jg04LciNrtP22EZ05b1w5NoJOtE14ebYD3DKMQgn4WNRJ6mC6Zusx7AsyVmrWFrDmKlh
         8hAA==
X-Forwarded-Encrypted: i=1; AKwUvByNEQbZTzg7Zaiw+Rt1oQAR8KAH/ghFmHADpzE2lg2IKrDkxbEDxTtE69xz00TmD4xrdzXq6mD6/RQu@vger.kernel.org
X-Gm-Message-State: AFuF++nnzrXdzqm3Nq37k7wpX2goYMusD6l/CPgGQPF2+MQu37yLru8/
	ForviMCZ6FT+jkoZvgr5Nze2ODWxvSgkQuvO7M5Sx/AJIyP7jtRQvbd1GaJrqJUyj1j+RHn/aWq
	HcIB4gEMWj7iXQNUEWrn9BqQnxriCB4G8SURxvEBuOw==
X-Gm-Gg: AYBFou2W1FKzKZ32kLNusVlMdQcUdVBEKNgnGmEmfWjPnDBZz5DzDsde49yW1Uwl5mE
	ljHbMpxG0t5UJguKfY0N4bh8+L9YV1A8/zJln9ubaPHJbBM9HO1r3jZfWHX5oRKBhU+Dg7Y2abq
	GC8Z8JDwIOoWlXFQhA3ju4QPO0lDXuVhAAwYmnmujlLpaFvx8F07dEcXbQVa053DYXvJxSzmxgr
	q1rj8tiXxXKYsi7Zr8NfbUpLZ4nfvhOY+H7DtsftWXtE+Wgp4E3SgOgL8rq+ipseomf0LcOtd8t
	ColGo8kkKY0/l4wz4aKjE3A+RSZzOeREslUBBL8s08K1+HWbZwK0ACgc
X-Received: by 2002:a2e:be1d:0:b0:3a5:dfe2:7f5c with SMTP id
 38308e7fff4ca-3a63c0df7bemr13420501fa.16.1790344578255; Fri, 25 Sep 2026
 06:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924071445.441822-1-adam@wermuth.pl> <20260924071445.441822-2-adam@wermuth.pl>
 <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se> <CABkrwJ6uvjS8bez6j0MZbp2Y+O9RhyU09YOLrUzHaeUEVC=Qkg@mail.gmail.com>
 <arZ0nqBvHDzSbZOE@venus>
In-Reply-To: <arZ0nqBvHDzSbZOE@venus>
From: Adam Wermuth <adam@wermuth.pl>
Date: Fri, 25 Sep 2026 15:56:07 +0200
X-Gm-Features: AclHuK-tBvtfu3ULfg1Xof4vNjCZDJ-C6A-b4CKwc6HFF2K6CA8VYr9U3QBsxtw
Message-ID: <CABkrwJ5xdMcRJsjubSJcfMkTs5CzKdAvQK83Xar3gZPvO_wa0w@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 25 Sep 2026 3:26 PM, Sebastian Reichel wrote:
> Why would this be better suited as an Overlay? Nothing describes the
> specific card plugged in as it is auto-discovered via USB. The
> overlays are mostly required for things that cannot easily be
> auto-detected. FWIW we don't have M.2 Key M as a DT overlay either.

The overlay was Jonas' suggestion, so I'll let him explain his
reasoning. My own understanding was that it would avoid powering the
slot (always-on supply plus RESET#/W_DISABLE1# hogs) on boards where
nothing is plugged in.

That said, I agree that the module itself is auto-discovered via USB,
and the Key M slot on this board is described in the base DT as well,
so I'm fine with keeping the B-key slot there, as in v1.

> Something to consider is, that for Key E and Key M there is a proper
> DT binding now: Documentation/devicetree/bindings/connector/pcie-m2-*.yam=
l
>
> We probably want the same for Key B.

Thanks for the pointer. As far as I can see, a Key B binding would
also need driver support to handle the supply, RESET# and W_DISABLE1#,
so it is a larger piece of work. Would it be acceptable to describe
the slot in the base DT for now and move to a connector binding once
one exists for Key B?

Jonas, Heiko, what do you think?

The fan patch is independent of this, so I could resend it on its
own in the meantime.

Adam

pt., 25 wrz 2026 o 15:26 Sebastian Reichel
<sebastian.reichel@collabora.com> napisa=C5=82(a):
>
> Hi,
>
> On Thu, Sep 24, 2026 at 09:03:00PM +0200, Adam Wermuth wrote:
> > On Thu, 24 Sep 2026 6:12 PM, Jonas Karlman wrote:
> > > This and next patch is likely best suited as an dt-overlay.
> >
> > Thanks for the review. That makes sense, as the B-key slot is not
> > always populated.
> >
> > For v2 I will move the host1 enablement and the WWAN power, RESET#
> > and W_DISABLE1# handling into a new rk3568-rock-3b-wwan.dtso overlay,
> > and keep only the fan patch in the base DT.
>
> Why would this be better suited as an Overlay? Nothing describes the
> specific card plugged in as it is auto-discovered via USB. The
> overlays are mostly required for things that cannot easily be
> auto-detected. FWIW we don't have M.2 Key M as a DT overlay either.
>
> Something to consider is, that for Key E and Key M there is a proper
> DT binding now: Documentation/devicetree/bindings/connector/pcie-m2-*.yam=
l
>
> We probably want the same for Key B.
>
> Greetings,
>
> -- Sebastian
>
>
> >
> >
> > czw., 24 wrz 2026 o 18:12 Jonas Karlman <jonas@kwiboo.se> napisa=C5=82(=
a):
> > >
> > > Hi Adam,
> > >
> > > On 9/24/2026 9:14 AM, Adam Wermuth wrote:
> > > > The USB 2.0 data lines of the M.2 B-key slot are routed to USB2_HOS=
T3,
> > > > which is served by usb_host1_ehci/ohci through the host port of
> > > > usb2phy1. Enable the controllers and the PHY port so that modules i=
n
> > > > the B-key slot, such as LTE modems, can enumerate.
> > >
> > > This and next patch is likely best suited as an dt-overlay.
> > >
> > > Regards,
> > > Jonas
> > >
> > > >
> > > > Signed-off-by: Adam Wermuth <adam@wermuth.pl>
> > > > ---
> > > >  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 13 +++++++++++++
> > > >  1 file changed, 13 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch=
/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > > > index 149a5306bb03..ad9a91c0d0d0 100644
> > > > --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > > > +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > > > @@ -758,6 +758,14 @@ &usb_host0_xhci {
> > > >       status =3D "okay";
> > > >  };
> > > >
> > > > +&usb_host1_ehci {
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > > +&usb_host1_ohci {
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > >  &usb_host1_xhci {
> > > >       status =3D "okay";
> > > >  };
> > > > @@ -780,6 +788,11 @@ &usb2phy1 {
> > > >       status =3D "okay";
> > > >  };
> > > >
> > > > +&usb2phy1_host {
> > > > +     phy-supply =3D <&vcc5v0_usb_host>;
> > > > +     status =3D "okay";
> > > > +};
> > > > +
> > > >  &usb2phy1_otg {
> > > >       phy-supply =3D <&vcc5v0_usb_host>;
> > > >       status =3D "okay";
> > >
> >
