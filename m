Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795162612;
	b=nbZJzh72ULJ3wV1o3w8q2Pn2JG9vRRZdIpApybp3vuKtGeV/nT/wMYL+T0RF9JxQgaj7
	 0RJeyrVZj7rlaJiNoCRFi1/mVkx043Xpgs8gHttSJGlGx84CoS80hFHQ6Q0ZU37OpZ/YM
	 0F3kYqQ/EHzKUoNqNZWdK+EiOGFLUn4j3gFYvzy4uXcLH4oFX+XXgQbDZnDt7SK2ryljO
	 gcUCs46vj+hxfAi1BrVgWchGFyMR0yLie50StQFCasNlVc3YKZ5+zfUbpQRL/hzB1+XP6
	 vxy7WV+wv6Fsv6sZ/N8BGbtRJYybWUMvmS/nazH+30HHTNVYNyi8KjDbe65RV3ZXi3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162612;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
	b=II/WWGdUydlC0NQcI4InJXyUwnGA6LhiAfHaxeh2xIMx/nv64csoXrTiM2LITfzsyjKV
	 4qkexDM1hD/ayfD15CVyt6H5EEa2bPk4CYzyGhDJQWozh2TdPwS5WnvyXFNpXnW7LJrc3
	 0WBnidF0WqugAihTA7eaC2QdfxWgjk5lgONaMqdG+4F1dFaUbKXAcaN6je031yZAsjqHk
	 7T3BQ38HvAbNvFc3E5yBNk4BRQR9Qgz641O3sFOmMOoOI2tOlYNfuO3XOH6BkkhSCqxHX
	 05CMFyq2botSBGb0dckU1FOac75YYVJj5hkA7ImEGd/QlNgc96D/zkn6rvH3Uon2CGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OidJyP58;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F1C60A2600
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 08:16:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76F1C60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OidJyP58
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7cc91ddf447so178161137.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:16:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795162609; cv=none;
        d=google.com; s=arc-20260327;
        b=FS9LTPyTuwX/F6hegW7OmTihZhEStlZJDu8qyv1ifpUxD2kzSPkzjIO/XbEXGrSXln
         oXExn+/QvxBx5Ul9gMXtH2+OBm692zcSI6QUyCG3jVvEVgtJqcQMzr8aypBD9ZsKxv9n
         Ym9GPKhzI4VmdbLO6N1TIxVHXrM55yJukaaRrc/UM7DkuAnH0q1d540uT6+6aq6Arjsk
         Jcvyg9N7tXk38JBbGf4NGPfqCjZ7RuFPkKnr0u9FMAAKg0rYWHX0FuLU6jD+cKMg7bT4
         JhBn3jZVJfH4e+ADwUBkkWZYWdhtnXEXuhv67iOYhIYMALW6cjbgNxvmc0z0pzAcDXMJ
         e8pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        fh=F1PletHQGLuLuBRF5OZHBFmZrDsfUBO3IHcT6dJqcV0=;
        b=QNgIa0ZQyvuOEAjF+GeJWVqg+lZa6b3MB1zsf2bddlpLetbvd9FJApaXrAW/TVQGt5
         SjqGCt7+2tv3HVsa/UBBC6fadAv2guSM+HWKsk9mU7SxESxp72Q1lYcBetVGZyeBKxwH
         eFAWFsg2jQePSCGPxXv2WTISN1pLCwGFzbO/ZLdmk3ZSMuArgVKqrFDTHbHkBVbxgyQd
         0PjxmgWz6BPDwOPlqNvUIaDeHl1Ll/rP0Zf0+6tW+gS0IReehiS/PJPjSFb6DUP3vhs/
         ihIUHvnKEP5nZ0Gmnx4ushZglFWIoPTiaaUR3t7vzHkTnkmHEB/yZdpORAsqGaLBHPq3
         gtNA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162609; x=1795767409; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        b=OidJyP582FX73SpilfBJrOmiXhxrJOYCltwuoU44dARQd6knYJbLoNgzzr2QZ/AjoL
         HGCKHEEsI3bmshiQlfpEnTfkM5hcAJsX9eANMoJEg9e3CY466eqHmlenferkg4xMEhkc
         xpOd6DLKN5qeg8dTs+yv7+uyQgIAz4Xzk2X/hfkkSTc67c9yvB0IWX/bcw/vN7UF06Oq
         KNFPsahTkSsJrS8+tZFSqCtMwRLOddaXqTkAsYE3tFmraWqdL37SQVgkUcjqC/2YhYmQ
         4AbAtUlx78qBQjO5gKgsyULaQp3LIrBnyCzG+hBL4bE867SrG+nklbMutTFgtKsdHJOz
         IZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162609; x=1795767409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTrRBBbOjFLAct0zJAH34zNdYPnC8LWnjifmPkUTr3s=;
        b=c5AlxIGu3JALpVsUGrZodF+74eA6jBv3mU70NCCNknzmXF2w3w5k4mypX6a/H58TQn
         FTM73MeDLmslGGYvSP0GORSP+4TkO4SaNdFqdQbOp4MufBWLDh1LtRNE4moRfrpaqIRi
         7y1SdmxrgDrlKaxMmnwZ8EL8EddirXfJ6zT8mQcqhaQTK5n32vV4ZXdwoSN+odVIt8aN
         ye6xSIExLpko/2oFFxJgYZJDpascVqtsRQuwN4LB8L5OvU0s0yTbs9XpIzMt3U89N5f4
         NyFcB+zZiv1qLNnM1nZk343SiKtOQHs9+r9ZT2ZjRCwcBsqcFRcJR8zGKBoZPz2x94y9
         W9fg==
X-Forwarded-Encrypted: i=1; AL+hErE4UFKkoxluqS/oApItU36NvJ51+d81dulDqnaRtaJ/6p/Nd7Tptrg7doMJ8wxGEvJIi7Jiju6WaKpI@vger.kernel.org
X-Gm-Message-State: APuU4Z/oKga/IPkkITUNmzbOMMlMljfxyovTMhF0HoSwB9f6C81/T80b
	hyeQFNFpAYo+HWKQfoEQutJmQVLWTbBT+5fClOVYrn7J4AgPDJeo/nqlR1sR9vsA8OAxqfH839R
	PFowLrNDOwIvyWLCiU67KiwOWtmkacTk=
X-Gm-Gg: AZFdTZdysCeBZggWGIq/37C7n7RCGtY86K8IyxPVSV9lu4t5K3wBXD2LvpFSsEgKAZF
	eB8spL0XiD6NcQO9J1BH/ZujadOT3opEvQk5L/pVxguF3mW8SOafavOfG/iXiRITRQElmx3sA9l
	q9lX1Ay7fCZKYykP0aDi8hMzCholE04S4OP9CvjTY4Ad8Os83Kgvso+S19KyON48J5EUYykaKWs
	zW9S9td1Q2svbeMem5pXVUY/fsVDfGScU9kAEHP4hqtmemLbgjFcOTD2J2BU+XX75AH60qo0vqU
	Ez/nJh5iOBJhjTtOoiIAP2ouzS0yUDMrdw0wjwAY//Pm3lVNKek4TlYebE84cZebTvg9ZlRAWav
	9/9xL17vgMqcXI0QuMwstIDpc9CeFZ90Na5WfSk9pIQtpZik+7hZ5EWugYdFahF32IvSKsDVClV
	4vSZdMgwbRbOB6khxUoLX1Tf42Pp4EELbJCdtFH/LcJuYY2ILmuVcIB75InGT2dStSW72FyjE94
	9HjJj3RoIzAXs7076hH+6e5NxgMOg==
X-Received: by 2002:a05:6102:5cc8:b0:7c5:4da3:aefb with SMTP id
 ada2fe7eead31-7d7396b4513mr725084137.34.1795162609310; Fri, 20 Nov 2026
 00:16:49 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021-submit-sun50i-h616-apb2-clock-v1-v1-0-7b857ad1198d@gmail.com>
 <20261021-submit-sun50i-h616-apb2-clock-v1-v1-1-7b857ad1198d@gmail.com> <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
In-Reply-To: <CAGb2v642E3bDZ60_3oA7CN=hOVGn757RwfVaZWXvRSuWoo5kag@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 01:16:38 -0700
X-Gm-Features: Aa3M54opK0HsAqJ5IKoxodsp8AVX0yGJFnC-piFBxQLeC7dh0z1JF0IENGFsfTk
Message-ID: <CADvTj4pkgZj77566ni_ifFJODRC0XvvOddiOij4kGRxoseBqfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: sun50i-h616: export the APB2 clock
To: wens@kernel.org
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 10:02=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wro=
te:
>
> On Thu, Oct 22, 2026 at 8:09=E2=80=AFAM James Hilliard
> <james.hilliard1@gmail.com> wrote:
> >
> > UARTs use APB2 as their baud clock. Expose its existing clock ID so dev=
ice
>
> And how did you discover this? How did you differentiate this from it jus=
t
> using a combined clock from the UART bus gate, which is also driven from
> APB2?

I got APB2 from section 9.2.3.5.2 of the H616 manual, which says
=E2=80=9CSCLK is usually APB2.=E2=80=9D I took that to mean the UART needed=
 a separate
reference to APB2 in DT.

> I'm not adding this simply because you want / need a baud clk that you
> can set the rate on. That's the wrong way to go about this. You should
> just add CLK_SET_RATE_PARENT to the bus gates. And making the bus clocks
> variable is a whole different discussion.

I tried your suggestion on H616. With CLK_SET_RATE_PARENT on the UART
bus gates, I can change the baud rate using just the existing gate
clock. So I don't think we need to export CLK_APB2 for the UARTs.

>
>
> ChenYu
>
> > trees can describe it separately from the per-port bus gate. Keep the
> > existing clock numbering.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  include/dt-bindings/clock/sun50i-h616-ccu.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/include/dt-bindings/clock/sun50i-h616-ccu.h b/include/dt-b=
indings/clock/sun50i-h616-ccu.h
> > index 6889405f9fec..e3318772c92d 100644
> > --- a/include/dt-bindings/clock/sun50i-h616-ccu.h
> > +++ b/include/dt-bindings/clock/sun50i-h616-ccu.h
> > @@ -11,6 +11,7 @@
> >  #define CLK_CPUX               21
> >
> >  #define CLK_APB1               26
> > +#define CLK_APB2               27
> >
> >  #define CLK_DE                 29
> >  #define CLK_BUS_DE             30
> >
> > --
> > 2.53.0
> >
> >
