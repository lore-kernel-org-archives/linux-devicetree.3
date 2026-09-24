Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855DF4A1DF4
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 19:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790276597; cv=pass; b=MOKAPVCo7UOcgoHZoHsJA7k5ZJQkJ1smUQ9YyHFijV6018JlnjwhQsQ90crYY8xM9eFIRPHImsT50o9tu4Om0HoJnfwUqffWS6WC8COPi3oDj1lYRoUHdrNnyFktAsBURYSXmzFpSi8J61ZVzV2bdWMOUfyQyQXNX1DbQbF79Yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790276597; c=relaxed/simple;
	bh=FyJSk2EQr9jIUBsLW3d+Qp2TNqU0yBEdip2Oe35nzRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9jhvCItDJHUntx88JqHFJF+JxupJv5DKH8ZFAxJtkvhJm+T20uON/XMJOBJ7n97XKun7iFCCviHnFfbX7OFRJ0eTrQ7a7yBUrRPIPncZC5xuTKvpVDGbR/mL3EjNtPC8P8jpXVhJCjaLlRaWczG1s55s43VP0T6ZNAgFzIHzqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl; spf=fail smtp.mailfrom=wermuth.pl; dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b=eMnhG4ZU; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=wermuth.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wermuth-pl.20251104.gappssmtp.com header.i=@wermuth-pl.20251104.gappssmtp.com header.b="eMnhG4ZU"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff148dfdso752811fa.1
        for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 12:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790276592; cv=none;
        d=google.com; s=arc-20260327;
        b=HIsFVC+frhc9SpTSAZ081243/GdzqDoRZ5mXNjJJvefFLOe2mc4HCd5Mj3rw1rHGfw
         +H6aKDVA/VxOJ/Puk2crFG+0ibFgIFa0za5mh18rIO9NGSP+zl44vxJTMrZkOffNQbX7
         esFmB6Z04mOiJKydXYlBjREmh+5GrTOIQtTz6WJSC2teSfjdX0mnlL5KTviwvvuSRVwd
         K4lq4Vus6V+yg7S9FhTIiJLpWWHxAhGeCpev+xUPhK5eVbLA175LVde1zfqCOh3vchiA
         jnQN+huUp0nJC76snDB+9m2/fJzH1GXayRhzjZEAWeHgJZK+5sS17RQtYAXIDsZSUwIK
         zfig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EJ1c4rHsHJGZ/tEYJFAlykm9/fk5FPrkQdOE5F+Bc3A=;
        fh=FN7WL0vodTNbQ2yO65Shbrhiu/spkXFTKt8fCxuO8oY=;
        b=Gp35fIBnCP2nd3SGSTEjKpYxnKx3DBwSchQxVFqzluw36TamtUT3sDMoNmDnN9vdgK
         xZL0Ven3jJLpL9N766IV5MH7x/7JESRjV7NlfK/6ajXGjpwSvVBHV2OS4nfxCIwTjoge
         iDIdLCEkoLHPeLbTq7zOGH8f+7G7ymkuvxoyAJNQFF8ysDZrpcNVyK+EykLu0Gd2WtP9
         cdmV51t6mFDvHj8EZEi4QEpemO/PUx3yoGZDC+SmE0YWAw2uCAg++OCiIOZnubWDKev+
         CZg8Re7jHExh45YmjUvIU+Cbicn/xJeu5eq0EYFroX1HXQcq6A55L90AnnPGDV/WfyPb
         ABkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wermuth-pl.20251104.gappssmtp.com; s=20251104; t=1790276592; x=1790881392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EJ1c4rHsHJGZ/tEYJFAlykm9/fk5FPrkQdOE5F+Bc3A=;
        b=eMnhG4ZUQHGNTYLIKbnqZzGH4cdC77mLfcHTUQA4EJNrM1CDjG8CjxszKYNbgWIKEh
         Vi1XPEgB670mxJthc5ZjqV8zmM/qm0dnQkLlnZR0omm9X3SK3kgH9ryLM8dift7v8qUE
         XbnYDqNS58eKkVP41iF7iionX7XRNolHh8GilYrpTuEqYL1nrb4dxqfkgM41e+41cI8x
         oI6Oq4SVS/IfJ9wZ9mBhuPnuQDLJIH7Kg6JrUsalQ8CMUUAc51+YOBYGC1J82XWQIC+E
         G6ahkEmThDTPHToUXCAyaDUl3XOLs7EM/xwHOhcpakY1vjgYlaz+gM46/5zrgPG7jWLc
         anIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790276592; x=1790881392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJ1c4rHsHJGZ/tEYJFAlykm9/fk5FPrkQdOE5F+Bc3A=;
        b=Klb0NLQ5bQanYcQ8pxF9WVe7QrL4ggCZxqMQ9Cio1XVrlBC2X1LZR1QKA7NSAAyfB5
         GGhih8NtU+Qo5CevrOiUnD5O0C4MOP3E+onVvz7vBks6dGlZFOTxb6FZAry/ZHYqkt+9
         HujP0eCcL+t9yqsW2MQoVmGtHyMTiskZlo/cMcAG1udZokVt6Jj7qt2KZfgi6Pk+LXcN
         JIR5XO24ZXCgAqvS6sUfrQUC1J5M/M2uh2MR7CubtLf2MgFCVNHeTcZWNsNaoNYHbiJr
         eAy5zZOiTcTfwbfgdl8CJ5TAPjFhCORo1dGQ0EIU5AFC61CtrvyJWcMnb5OfsMbMKI3n
         plPg==
X-Forwarded-Encrypted: i=1; AKwUvBwweXaqhz+/tfmnH/sGHyd/nXwAixhJmxssX7wG8qQOaMNH379AXNwNjnlPcGWshyAe0GSzu91kskmS@vger.kernel.org
X-Gm-Message-State: AFuF++lHLtUYqIl0ONieoOX4Y1Z+4Rp3M5Dqc4vUl2x319/gDJATmKv8
	VVGSD8sVfpdJQMS2fQRk2RBcSFF6AkrE1MAzpVB9aca+mEDvPsWaGk9ciDqJarsY14lKz8AHqUM
	f26ZCe+p7Om4ic5gqlgu6BQe7YI82qQsY+gT4Iynk0A==
X-Gm-Gg: AYBFou1/9JbJWcxUIJl0xP1oRXjDAJbZ6A1ONxYKvmdGE+j198RauxkrJtrGG3JOaT+
	Qfy1Y7M5SQ76hViWgz2oa2gghdU0vLBSKOrYETzHbJ09B63IELSXSQQ/NNvKY0psh3ORiYd998b
	+cDUX/P6oOxglFMDwtmHcB6fX3d7Dqy368wwZhZTtsJDkjdZB1wBcPliCeGbpzH1pCLKNA+DqQy
	Cv6WKb2LSsPQ5ccsv4i073rprpas+6ulGg415uKNi15KoQ1zPiCyzSanyOYPHqyQiG8BXp/j0rR
	fDI7tz2VcVsE7VFyXsYVldBGCgCVpNP2aFaQvpmadxPMlG4P1zYi0F0sCHVGCPhjyrs=
X-Received: by 2002:a2e:bea8:0:b0:3a5:b507:dfb with SMTP id
 38308e7fff4ca-3a63c408eb4mr9542881fa.29.1790276591671; Thu, 24 Sep 2026
 12:03:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924071445.441822-1-adam@wermuth.pl> <20260924071445.441822-2-adam@wermuth.pl>
 <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se>
In-Reply-To: <e03db2e9-085b-49ff-8d4a-bc112bc4ddd7@kwiboo.se>
From: Adam Wermuth <adam@wermuth.pl>
Date: Thu, 24 Sep 2026 21:03:00 +0200
X-Gm-Features: AclHuK9IKF3aAn5suDmSsCEFKxWsKS6ErHA9CID8WYyLrPR40kN4mqnvEj86JPs
Message-ID: <CABkrwJ6uvjS8bez6j0MZbp2Y+O9RhyU09YOLrUzHaeUEVC=Qkg@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Enable USB 2.0 host1 on Radxa
 ROCK 3B
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jonas,

On Thu, 24 Sep 2026 6:12 PM, Jonas Karlman wrote:
> This and next patch is likely best suited as an dt-overlay.

Thanks for the review. That makes sense, as the B-key slot is not
always populated.

For v2 I will move the host1 enablement and the WWAN power, RESET#
and W_DISABLE1# handling into a new rk3568-rock-3b-wwan.dtso overlay,
and keep only the fan patch in the base DT.

Adam


czw., 24 wrz 2026 o 18:12 Jonas Karlman <jonas@kwiboo.se> napisa=C5=82(a):
>
> Hi Adam,
>
> On 9/24/2026 9:14 AM, Adam Wermuth wrote:
> > The USB 2.0 data lines of the M.2 B-key slot are routed to USB2_HOST3,
> > which is served by usb_host1_ehci/ohci through the host port of
> > usb2phy1. Enable the controllers and the PHY port so that modules in
> > the B-key slot, such as LTE modems, can enumerate.
>
> This and next patch is likely best suited as an dt-overlay.
>
> Regards,
> Jonas
>
> >
> > Signed-off-by: Adam Wermuth <adam@wermuth.pl>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm=
64/boot/dts/rockchip/rk3568-rock-3b.dts
> > index 149a5306bb03..ad9a91c0d0d0 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > @@ -758,6 +758,14 @@ &usb_host0_xhci {
> >       status =3D "okay";
> >  };
> >
> > +&usb_host1_ehci {
> > +     status =3D "okay";
> > +};
> > +
> > +&usb_host1_ohci {
> > +     status =3D "okay";
> > +};
> > +
> >  &usb_host1_xhci {
> >       status =3D "okay";
> >  };
> > @@ -780,6 +788,11 @@ &usb2phy1 {
> >       status =3D "okay";
> >  };
> >
> > +&usb2phy1_host {
> > +     phy-supply =3D <&vcc5v0_usb_host>;
> > +     status =3D "okay";
> > +};
> > +
> >  &usb2phy1_otg {
> >       phy-supply =3D <&vcc5v0_usb_host>;
> >       status =3D "okay";
>
