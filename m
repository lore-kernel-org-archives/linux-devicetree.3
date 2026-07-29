Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4F24446E6
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327020; cv=pass; b=i+J9nC7VmxgZDfJfP/UxG9ezDhk9JnrcAD9uF8tQF/XQB+SVGbdsgtrbEeAM/W8ef/VPKMiwSI/8c/klZKQzdG7QS902ep4QCwU/k8GzWQ23sre8NML6vPAShOiOr/YprsieAptye1RET9K4YKXR3woThY4gkMfamy+zcB0aEc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327020; c=relaxed/simple;
	bh=XUGcCmIhNgHPxGmy+I7u5lQ5TeoD2906Q7Yn3cntuVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOKeAVCaY2qPQuXjUTINK6o7xTx2VNPzziVRPnTurXHr3m1NLv1LiPVZMdXEQzW3AZTK/YSvPBRA//+E950P8zHRWC3PkJTvgHOGP+HRjk4BUrmgovXWH5rWCQDqLZcJZbY3xNOKv5PfrsgDjG6bha9cfS4ipxSgsuCHt9sYDPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMwh0tpJ; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMwh0tpJ"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso677008a91.3
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 05:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785327018; cv=none;
        d=google.com; s=arc-20260327;
        b=hllM7PzarZcfj0ZifmL5xjZDK8AKX+Nvw1hGdBSoYpeQRUyXKj7yoPYX6CwXNSy7JL
         RjGuOnGucCuX7UqDDLm1TOVWioDbqGwvFNFh5c4SErt0HvEsyf7+D6nxWuZUBbUGWe58
         8jOoXQLcQVGgBl/yna8N7GJdiEqVAt7AqsluMTqIVqnV0PoqJuS0yA5hVIxOKLDOdyFP
         xxC+wq+w+3sazrIq01cTpq2NfvKIeMhLef4YYUcBccTyQfPV05VptJplz57g/od8V7T5
         JuaXfrn5byJ9brSs/1vJc+WDQTc52gqBXl6EyCD9hb7w2/xuG8OyQ/SyryY06/DWUyxd
         SMSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P1fFeqBdTSvS5DElnkKPCOeQbS6PZaEvevS5BkPtZxk=;
        fh=aU3zD5PJAdDgXByayfP94i4Kw7BfRFVI3QXCTo03TOE=;
        b=BZzDPiefcuCzFkY13plVSYkqm9vjchQILQkUIqxwQr2hSztWIzaIz3mzrEa68nDBYm
         6zjx8MOoPvzyPEutLBUaLdxdaFb4HHtUvAxkG099/xtra59oO8YhBc86fHdp0bd4EikJ
         xN43p0wruvSHgOhRzCHYmajkVCWM/xwjnMX9AGdRQrwrPL140Zl1lOBOOb5MZJHdJDpT
         BDlr93Y0iTxcgJlo+rspfTY1X2xNPpBn83mrj8YhaAt8do3pQAEjsyZ8xbdlqflH78Wg
         wXfk6VloXmnN4hR7Ufjtp5oLkAa1yyYKBZPTDIJ965luxwbFjM5et50N9Py6P3m7SrvN
         DbvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785327018; x=1785931818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1fFeqBdTSvS5DElnkKPCOeQbS6PZaEvevS5BkPtZxk=;
        b=aMwh0tpJa3U/0aoxIuNXIoGVjNkcuvdDjAux7VBymPqmLh2GNGhjlnKy6NbbfxTICR
         DCooYcoOrMik7M0HTTpfNYRY2SfbjLf77cF2mtqIQOhYZwM+Z+2PqXQYILkiXacMqjRT
         9Pv7hkqmqTZwp21Q/1yvCo7fnPvTql1LmmrK9hkJvA+yfVJa7NTJyrIIReL6H1GpymRX
         DYphkxT0f64xbZZg6TXbrJuPYzW+CntwcIkzu9OZRFCDsM4BT7n0fxqE4fvlfXpw7ez+
         m/Ohg/boCtn+Zd4J9aTkWQ6c7nY0WRMz3GYyQvXL5U+qr2R5tSQ6bF8bEt0E5o3S+umf
         oV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327018; x=1785931818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1fFeqBdTSvS5DElnkKPCOeQbS6PZaEvevS5BkPtZxk=;
        b=Ty1BDFbsTvnHZzOx00A40JVWrU/CeeF2oZIs6uAJXm/t1WyUdaiusS+cCDnT9AYVr2
         XYCk3iuqbf2acTn/zjW2MfnzCz52AtCPSj2tU9CCTN9oMzVUhJEloNnueHSUOTlrXuQR
         OXminyHlmym47LjdVoodwka71l1mlXoqqY2ZC4CUBYIHPnqwytnes/O6SQbsVJYeygD0
         X7m3p5LecJ4D/SjuTpvZegNeAzbxagh7XoGUEd3rFARgjwvYpvtIe5+P0uY6wsOBRQp7
         K8lfUYLdXeLUvzVqRvEz9JZEB/5syKrAxagYn85edb/CNjTGQfmcspzV2dKs/vOQoCws
         iXKA==
X-Forwarded-Encrypted: i=1; AHgh+Rp8u7qed1vd2wMsKEKksRxB5QGdR8CQe68+tS1aAzeIXY1NvXJE/P44GuEgRsiBXdPZWvVOCQOYhf5n@vger.kernel.org
X-Gm-Message-State: AOJu0YyKCjkb5lBk0XGsAbIavLCTMHWgOR26kFpoH1rctP3RVRRh19um
	MbstpO3JCrKWWZ5fpW7GYQktcrAQeS8wgkuGFge9pIkiB6Cqgx4QnJOY4DJqtT86T6EHPcZcArM
	4qeyCOt3V5fhXjH0pl5twH1ejhLO3AXo=
X-Gm-Gg: AR+sD10NE2KLopdCpkPZ3+k/PIisogaXiqaJlCHpnFauc0DdgZ8z4VYKoNv+PBooWeh
	KB2YBXYXAlovo8C+vRCcR2NiNcQTF+vb+LgLjFSAOPO/mD2Zb2A6GAr9nZkZGoD1qCt2tCx29y9
	M1H8EOkXlHJsXhX3UIjW2jev16iz4nHpwsP384sNfVSGFacgcxeJfVy60+Cnh/3gf+OCyk61yZr
	0JuBTKZIgaiIy1kG30LjseZrUA8KsQgD7PguBLQ1n/cowY2IZPSUekN8sy9u6aDccl6d0CTeTSa
	+nIbd1iPAizmmnk+pRwn+c8V8gJAxi5OdSQe4oBOaoLWjUXVWBD0mXnQKZaKF9TC3pqOlmd9qjm
	CPw==
X-Received: by 2002:a17:90b:2747:b0:37f:9ce1:735e with SMTP id
 98e67ed59e1d1-38f6a57fb65mr6732166a91.31.1785327018081; Wed, 29 Jul 2026
 05:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721101059.451699-1-clamor95@gmail.com> <20260721101059.451699-8-clamor95@gmail.com>
 <AHCWpU8lS5mcA3Do5U45Xw@nvidia.com> <CAPVz0n2AOJ_rcsCEhVQWUq1fXtd7kXkE9yScY1VwGyZefz50Uw@mail.gmail.com>
 <amnVVwVoZ7NnclWQ@orome>
In-Reply-To: <amnVVwVoZ7NnclWQ@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 29 Jul 2026 15:10:06 +0300
X-Gm-Features: AUfX_mzZGmZZSlJ542WOtleodu7fRHFeQqx0BLso3-8iZXD4OCqbnM_3YWVcmek
Message-ID: <CAPVz0n0T_U1UiN8FMe-efOmRJWRxcStn9qa4GAENv6ETotk_xA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 29 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 13:27 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Jul 28, 2026 at 05:08:40PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 28 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 15:13 =
Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > Drop reset GPIO from bluetooth part. Add lpo clock to both WiFi and
> > > > bluetooth nodes. Add 'brcm,bcm43340-fmac' as primary compatible and
> > > > 'brcm,bcm4329-fmac' remains as fallback.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 13 ++++++++---=
--
> > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/ar=
ch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > > index 3de5c84d5f009..b71a02b3fd86f 100644
> > > > --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > > +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > > @@ -1300,8 +1300,9 @@ bluetooth {
> > > >                       compatible =3D "brcm,bcm4334-bt";
> > > >                       max-speed =3D <4000000>;
> > > >
> > > > -                     clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> > > > -                     clock-names =3D "txco";
> > > > +                     clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>,
> > > > +                              <&palmas_clk32k>;
> > > > +                     clock-names =3D "txco", "lpo";
> > > >
> > > >                       interrupt-parent =3D <&gpio>;
> > > >                       interrupts =3D <TEGRA_GPIO(U, 6) IRQ_TYPE_EDG=
E_RISING>;
> > > > @@ -1309,7 +1310,6 @@ bluetooth {
> > > >
> > > >                       device-wakeup-gpios =3D <&gpio TEGRA_GPIO(EE,=
 1) GPIO_ACTIVE_HIGH>;
> > > >                       shutdown-gpios =3D <&gpio TEGRA_GPIO(Q, 7) GP=
IO_ACTIVE_HIGH>;
> > > > -                     reset-gpios =3D <&gpio TEGRA_GPIO(Q, 6) GPIO_=
ACTIVE_LOW>;
> > >
> > > I'd appreciate a note in the commit message on why this is dropped.
> > >
> >
> > It does not comply schema for "brcm,bcm4334-bt", further testing with
> > this reset gpio removed confirmed that it has nothing to do with
> > bluetooth and bluetooth works just fine without it.
>
> Maybe this should be a separate patch to make it obvious that this fixes
> a DTB validation issue. At the very least the commit message should say
> that this drop the reset GPIO because it's not part of the binding.
>

To be clear, I did not refuse to add note into commit message as Mikko
asked, I have just explained why this change was added.

I have included rese-gpio removal here since it logically can be
grouper with other manipulations with the bt/wifi chip binding. I
would like to avoid inflating patchset since it is already a big
series and tweaks to binding are small but significant. I will expand
commit descriptions for each change included but if you insist on
splitting this commit, I am perfectly fine with this too. Please let
me know.

> Thierry
