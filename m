Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7A9379C47
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784193874; cv=pass; b=qJl1hO8pzXYjiKXlh2ZPeE3wZXl7DvcSEs+NNNpoTgBEx9dyDCMuJajj/9atbyFUgxW93Te7cLRUVJiwjR0U+2QmLAPrtiNK5YsnUELV3A3zAR6BcskRERb9PFiNUm9X1MxbIkZizANVQW92oMRnrymCADJwxsBbTy2DTtsgYXU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784193874; c=relaxed/simple;
	bh=GvSH71Mgio9+/dFqhEYp2Ny9KgmU25cJ8taf/z3B8M0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3YCNgFQr494fr798X3jHSsYEPVeBF2ZpW0Ouk0kN1Ax7ZhEYUCDsrVaotr99CrqK0N0JwXlb6dICv4NUPXtGQKhZrYAHg0OydarPBvBViRl6C9O/1bIUDbm5XZ/kyaxSeNs3SjPsiezjRZ7AbAO1ZxJ9QXQji4lPnWpr78HqfI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQ2xt/hp; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQ2xt/hp"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso3196769b3a.1
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 02:24:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784193872; cv=none;
        d=google.com; s=arc-20260327;
        b=sHEWRYVAvgLy+dLQD6/mN+fFDdEjDKyQly7s6hE1Hj00lBcvQkLoB37oKog1SXXopu
         DF1RDZ3ZUZTgpNJevSpNXsip/59+m9YlMdczPhF8609MXHOhXeKNlRS1Ra59GmyASwUQ
         4ulTqd/ReIU4fGsH9CNXynIoBS1S4A2duvZsfL+l3YiZfBpzlrj8pHxGVIe8SdoVYHCD
         lZdIofaKJ0wSTkHVm/ShJ6Le3yoi6i8QFpjMnrfHEMbeWOfhyZ/LvYne38a0beIGhXWE
         jK3nbRBBi0bHGcTDKUgWL7MfqQYvVKmFawuegxBA1d+7dhNjthS1K8E68W2A+jVFF8sW
         tglw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D5AXjA9Tcy5dG64KZLElqY/MzuwlW4GyobQ/vNPe094=;
        fh=BhsCJmwl2JIbugAEE64JfEAGJ99w8jzoIruq23vOTcI=;
        b=efaHWli0IhLLDuuxlU3lEkDmCIqwAeN75L496gVxvRFuyfiJIDCAFl4hsXZgBA6hpH
         R0g0quqFUD87OsRp9QGXA6wxUKf/w5E5uanA7bR61L015B/Pm2+yZJAQ55Fa+ywhfYL0
         KskzbJ1DzugKsnNL0hsmw9GrHMHYngdKTJ059jDWwO0cDLrR8KhumLu/gPO/pxpf+YKe
         qggOIR8ds1vQ8UPVb3J9VY5IZ9Twuwb8LYdeEUzVtZntNjtdzfYD1gxo96bktbSkmoiM
         NDVP7KWrgXFJzs3WLbzefjSe/PbyBT+pvu9pgU5HRX7KM9Shwmf96jfwCbHf2OXc6DYs
         5/Ag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784193872; x=1784798672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5AXjA9Tcy5dG64KZLElqY/MzuwlW4GyobQ/vNPe094=;
        b=nQ2xt/hpl/7xuF2RhBK55L7oZ27hKNuQbCc9jL+QKs7k+RCpfKVIoxpis90d9riHL6
         bIjgbcZbX/JA7ukmGc995MDlrgmMt0XNeFxMCocxrqnrgaVRKwfpV9EdlmWswF2swaeq
         9XX4jzQGp7QHdkeZx9yPIPK6hMkfUhh9Evesk7M1LyDyZU5RlAioW55EHbfXhmflUI2F
         QhHsl2r+ZrB6BYaC4QKuE/bPU3cxgFmCqRX10BiqUFIjT6hXmXshskikU/fYHN8ZvuZP
         pGk9IW99p2hk11oNTIy6zMRxO/xUMxwuHoNAH1w9QnT/AYbxWVmuukeHdjnYseDUXJTF
         +rEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784193872; x=1784798672;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5AXjA9Tcy5dG64KZLElqY/MzuwlW4GyobQ/vNPe094=;
        b=Y5IECLv+h0TKsqzvADx1RSBElv7FPTOQag105+JMWm+Ad0MS5hc4WdeQtL6Y1xBthT
         Z008hhqhH7U6m8ynAmzIfd9MGuXnW8LP6dAP69H2nv0MV3VuB6XmfbkjUFeEUNiMD2Sh
         +uWFITMqeZa4zdBcJgC2nPZ6VrxJcLRRQDxITylKg7c9nLYO7z6/FBJwnTT3jqQ9/ACv
         UtXAANNGOxX/n6NV3N+ZQiWDwGh+MpWd03A5cxeDEEJv3zCrPjRLnyPSmIor1j2mkYOT
         NDT5sCsLaaW5wDQxp/0B6MBzw8ZZZ4kcsLSHAGzrxELe0LW9sTpZ0rHD9rJvYl2RoVLo
         TI3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrTIuKTTnpxDF0VIWedYJT3ahppmxHxky/VlBFw9zsICMFKn3jcxelrxzs0Z1ApEQxA9i8Q62CJrL2A@vger.kernel.org
X-Gm-Message-State: AOJu0YxTx9l7VDYAgm6imrJYk93aTpYsqkdMZkc4zQdFLVtiSMozvTIN
	7pQjQzuuMwv7adiLhN9Cghjx8ggkd4YRPX1WonYr6d29SadweJ+OPZDnXgZkW6iqDFYhlogi4Xf
	embEXzFrajnBMI1/TlZ2hR/NYCE+e9Ig=
X-Gm-Gg: AfdE7cm6iwyHCd6wbg3srrzqTHDGjHRrysXUdrk/WItrwc7PRlfkSXnNDD0N2I1QQej
	74mm8AXLM5Z2UUogVrf7rV8uug3knBFEHHs7x3xOmIOx5U4k7FAx9lKp+FOZn0oyTI3jtoKuebH
	lfcR7Cn/0BJn3S8VkS9MkJv0hqrKj6GOzS1dtoE7oU2CaGrnrKklCCL8f375/o78dOZJs51CDxk
	iKWy7qxLAe2ul0YXVZbWruwjz6ioQWeuHnDw9D7ahOAgh7GtV5svcU+KONPqo1ijuyhldp/Hq9Y
	Wov8djgunsh5hMb7OnY7UchBo6FGWkLGkAbcTN4L29Y=
X-Received: by 2002:a05:6a00:f08:b0:847:8504:9946 with SMTP id
 d2e1a72fcca58-84a6726b83dmr5832591b3a.25.1784193872009; Thu, 16 Jul 2026
 02:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-nanopi-m6-v3-0-227567ffc5dc@gmail.com>
 <20260713-nanopi-m6-v3-11-227567ffc5dc@gmail.com> <20260713204131.C58091F000E9@smtp.kernel.org>
In-Reply-To: <20260713204131.C58091F000E9@smtp.kernel.org>
From: Joachim Eastwood <joachim.eastwood@gmail.com>
Date: Thu, 16 Jul 2026 11:24:20 +0200
X-Gm-Features: AUfX_myLtG8XdKEHnucqiDRzCNz_tCXXHKJzmB4U4Ch-HDmXpuQEg3jOwAHCgo8
Message-ID: <CAPSPb=v=ZDGJ41auxGgSOpKo69MycE=FtMyHf9sG9a3ju9PAaQ@mail.gmail.com>
Subject: Re: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r6:
 refactor to support M6 boards
To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Diederik de Haas <diederik@cknow-tech.com>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, 13 Jul 2026 at 22:41, <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Medium] Unintentional restoration of `regulator-boot-on` for `vdd_npu_=
s0` during refactoring.
> - [Low] Dangling phandle reference `&vcc5v0_usb_otg0` in the common `.dts=
i` file.
> --
>
> --- Patch [11]: [PATCH v3 11/12] arm64: dts: rockchip: rk3588s-nanopi-r6:=
 refactor to support M6 boards ---
> commit 056adff75ec08989b96f09adc0efff6c3a5d662f
> Author: Joachim Eastwood <joachim.eastwood@gmail.com>
>
> arm64: dts: rockchip: rk3588s-nanopi-r6: refactor to support M6 boards
>
> FriendlyElec NanoPi6 series consists of four distinct boards; R6S, R6C,
> M6 and M6V2. Refactor FriendlyElec NanoPi R6 base dtsi in preparation
> for adding NanoPi M6 support.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> > new file mode 100644
> > index 0000000000000..a8e532ad8b7a8
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
>
> [ ... ]
>
> > +&i2c2 {
> > +     status =3D "okay";
> > +
> > +     vdd_npu_s0: regulator@42 {
> > +             compatible =3D "rockchip,rk8602";
> > +             reg =3D <0x42>;
> > +             fcs,suspend-voltage-selector =3D <1>;
> > +             regulator-name =3D "vdd_npu_s0";
> > +             regulator-min-microvolt =3D <550000>;
> > +             regulator-max-microvolt =3D <950000>;
> > +             regulator-ramp-delay =3D <2300>;
> > +             regulator-boot-on;
>
> [Severity: Medium]
> Is the addition of regulator-boot-on here intentional?

Seems like I screwed up the refactoring of the code, and Sashiko caught me.
I will fix it and send out a new patch set later.

> This appears to accidentally revert a prior fix that removed the boot-on
> property for vdd_npu_s0 to save power during early boot.
>
> > +             vin-supply =3D <&vcc5v0_sys>;
> > +
> > +             regulator-state-mem {
> > +                     regulator-off-in-suspend;
> > +             };
> > +     };
> > +};
>
> [ ... ]
>
> > +&u2phy0_otg {
> > +     phy-supply =3D <&vcc5v0_usb_otg0>;
>
> [Severity: Low]
> Does this create a dangling phandle reference in the common dtsi file?
>
> Since the vcc5v0_usb_otg0 regulator was left in the board-specific
> rk3588s-nanopi-r6.dtsi file, it looks like compiling a new board (like th=
e M6)
> that includes this common dtsi will fail to build if it doesn't also defi=
ne a
> regulator with this exact label.

I don't think this is really an issue. Both nanopi-r6.dtsi and nanopi-m6.dt=
si
will have those regulators defined.

Unless someone tells me this is bad practice I will keep this as it is.


best regards,
Joachim Eastwood

> > +     status =3D "okay";
> > +};
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-nanopi-m=
6-v3-0-227567ffc5dc@gmail.com?part=3D11
