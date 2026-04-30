Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEC93FFAD7
	for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 09:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777542779; cv=pass; b=OORNsnFVWVDlMsIHR3/ZkQXnADmGE6riQI37cPpdD3Rdcl/LiPp/+EVgLK9iNjXdrzYyvu8Is25HDyLBaqiUoMgBjpQE+XXeNec1md/z7jPZmrKziRDV9A3jNyeBwrBJWXbnYE2z4CQCp07U/vP2zv/RuVTt9RFnmcw+KZ0ci90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777542779; c=relaxed/simple;
	bh=L5+adarktYuRtDfgEfgFMAOiTqqk/oh/KE7e/yvrlcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXhShUpQz7+5SyadDOuyYBf8Z7bSB7alvhd0WBCXFJi8kDD45Vc/KwNvkuA9BcjDre9pVkbH46cRteXk4CmwO/6dTeNEoM8Sk2uLNY2odXu8kLeojNMS/t6Dxrt/1/fpee5sX/Z3XKlYGYVxBhSkV9pSnYHkItt3L73/KPfjioE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7/TVStF; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7/TVStF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so4430655e9.3
        for <devicetree@vger.kernel.org>; Thu, 30 Apr 2026 02:52:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777542775; cv=none;
        d=google.com; s=arc-20240605;
        b=dRUuYl9u+Oy1KBVLRwmNjminIgx3krlEh7YMadQrgBqJDlM8zWXTgLFKZI3Uwbmk/n
         2+8EHKwgc6VVEfJ7tnF0XhpfpBxmPQeOjrBobO9/7IXELz2PzqczjhVlfqOYPIl2iiww
         FHfgu1N3N+I8oB5q4EUVk0jVVzyO0419JqezpHVW7Yf/knvbASrXlzhQfpm+dDM2OGY2
         apVmHqFJxHQMb5HV3NwEuCmaEs5QTu6oC+OCXab9nWfs6r/VDxfMaghMMyulZrPZl9me
         27d3G4R+p8CSw2ukscJ8ShtXUzvaj/8awr0iXISWsjRU7/G74h/R7ppBY4AMBcrXaB0v
         vn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=80nYfLrL1k2QOZW/UyIa+gL4sme0jkc9ZbDotf2ijH8=;
        fh=CJaIDYADmPxpJxY6Jl7dOs2FZLsolj+07i8AnVWLanA=;
        b=OIeVxEM4PU9XHxm2QFTzl21nUt/KuAcdzRG63Ad9j3hTNIy+sZspEA96k1GCkMGs8V
         XmBnz2fH9MGRzwVlU3YsA/OyZv/82bihEdMFKuXVa8yWL2Xu9YkVtDVN48KiirP2qnQ7
         2bjA52J6dxaha7WUbeskWps9C640wOMnGu8cZWUzFTbzoNfQMC46Q1kL2+9Kv4Iyus3X
         GbXGUy5Hxg9x/t1gHGzuKm/cLM6xYYbgPujTde7ZgC6A43QKRosGI0zyiKz4QvoJPJ0H
         9htTc5jehz64n4YdrryYHfn3B6PSf8mcuICr8Das2JHw4b2Ev3Q9TvV435IV4t12vR3P
         FC6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777542775; x=1778147575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=80nYfLrL1k2QOZW/UyIa+gL4sme0jkc9ZbDotf2ijH8=;
        b=D7/TVStFH101vuh3fk2xevKpUYH+u/BmJVj6m8KH7WnewRGkSPaWexaOoSSn+CgvgU
         HBDZk0SlGxM+6dxoi9acT2qy52Wl0KGxQyh51AAf75OJuguu7Vs0gfHcyOONAlz9T+Th
         qWv8IawLRQt/N4iAdAUJhGk7CcddlT5w4I+O53jSITQZKZXNcJ1gYBEL5gGewTA2sfqQ
         VTF1EMXd0ofmoTO6SaqrbE7RDI/bCo6H1MR1Zd+g3unwpxIQ/+cPhBfbO6bKyI8uOkE+
         xdgk4YifkIYd3tScI3qXrBPNd+nsGDvAqDrfol68E76RiqF2nQUjPjHC28ZQdfd0lTnW
         L0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777542775; x=1778147575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=80nYfLrL1k2QOZW/UyIa+gL4sme0jkc9ZbDotf2ijH8=;
        b=n5tRzhn079hBSewK6MM6GTFUDB66HNyA6wlWQaMMm6iD81Zf3Kcfkaw/J3Yu/HZ83B
         y3qEtorg6Um88m3jW9o1QkuClc1xOYuNXYsSsE9MwAeN/4XmDy+4V5+ISpMtURdhR2JS
         QPi37SmKSDFJL5K11G2+P0yIkEued5jEwaHG9GSLPZC529ypwCTjpUu6Zw0xA1yFvTVG
         VUS9EJUcT+LGmt7/QKToktLLtwYVY46ClTbmV1H8INpcGUrHBaBI7WXF24cSXKLTyV2U
         20NuBa10a3nRkkUiq9Mz4U8tateI/RNUOaSmZ4XFLI63w8v2XwU6L31hk8pbN0/lMMVX
         W02Q==
X-Forwarded-Encrypted: i=1; AFNElJ85WEebpE8UUEphubt64ZNFOpV256SWj3yHx0G2FFlxiiikSXXee8XPQd7+rjDbqkB6jermSR2xRyz5@vger.kernel.org
X-Gm-Message-State: AOJu0YxB3C3n20XaIbGVYQ74IlQcYJHC2+igqXhUAgxKNFXkJRM17ksD
	b6dJ/2u1sgATFj6zXVHuPBVsesZwAtYT2Ud84o7w55tShtLYhJ0/nLOdvVCdtbvvHtAKsjN4rLj
	UTHhowcuhePvFs3v71RgyYLa012ehGjk=
X-Gm-Gg: AeBDieuBd0ROyrruzdjN3MIECojpu8m/2Q2Ehr71dryjw5qWCoprEJq/9V376DYCkVa
	A6/qaeVvmSpv2RIQuCt8hK8IoG9voyyY15q/+Db0+XzA6XDI/YlR7K1r1t/1crEdqiXY7XRNvb1
	8p/Q38pZ4//lJ+7tAyNHlyEA7vzI4jL79von+sGJh+J7qQQP4UDs0ST8FUEHxWxVLtrtUDJPCmb
	bexLE976TyTNDX5APpX/fZr2k+9+GvWebeovIrkfVmSjVfgtaQET7waDAgBovGLOaiqR1bxsLPP
	jaIcdXFSHF6t6LjsQro=
X-Received: by 2002:a05:600c:a119:b0:48a:563c:c8c0 with SMTP id
 5b1f17b1804b1-48a84252bd3mr28233095e9.7.1777542775251; Thu, 30 Apr 2026
 02:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428114308.113253-1-clamor95@gmail.com> <CAD++jLmNKWwHAxV8OLK5wupwj4dT1TWEn2Dmd6gP-Ez9Pgk0tw@mail.gmail.com>
In-Reply-To: <CAD++jLmNKWwHAxV8OLK5wupwj4dT1TWEn2Dmd6gP-Ez9Pgk0tw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 30 Apr 2026 12:52:43 +0300
X-Gm-Features: AVHnY4InMnq5sIIvHuLuG3dBtCw9MXJXgSokBfxK9mzHcR7haNN_KHz91b9oE0w
Message-ID: <CAPVz0n119=Ec7qT4gXrqQGzm30X7oeD4DwKWEoFgaM6B=YwdNA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] input: misc: add support for Imagis ISA1200 haptic
 motor driver
To: Linus Walleij <linusw@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 30 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 12:1=
6 Linus Walleij <linusw@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Apr 28, 2026 at 1:43=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.=
com> wrote:
>
> > The ISA1200 is a haptic feedback unit from Imagis Technology using two
> > motors for haptic feedback in mobile phones. Used in many mobile device=
s
> > c. 2012 including Samsung Galxy S Advance GT-I9070 (Janice), Samsung Be=
am
> > GT-I8350 (Gavini), LG Optimus 4X P880 and LG Optimus Vu P895.
> >
> > The exact datasheet for the ISA1200 is not available; all data was mode=
led
> > based on available downstream kernel sources for various devices and
> > fragments of information scattered across the internet.
>
> I applied a patch to the Janice devicetree like this:
>
> +               /* Haptic feedback unit Immersion ISA1200 */
> +               haptic-engine@49 {
> +                       compatible =3D "immersion,isa1200";
> +                       reg =3D <0x49>;
> +
> +                       /* clkout1 from ACLK divided by 8 */
> +                       clocks =3D <&clkout_clk DB8500_CLKOUT_1
> DB8500_CLKOUT_SRC_ACLK 8>;
> +
> +                       /*
> +                        * GPIO194 pin HEN (motor hardware enable)
> +                        * GPIO195 pin LEN (motor LDO enable)
> +                        */
> +                       control-gpios =3D <&gpio6 2 GPIO_ACTIVE_HIGH>,
> <&gpio6 3 GPIO_ACTIVE_HIGH>;
> +
> +                       imagis,clk-div =3D <256>;
> +                       imagis,pll-div =3D <2>;
> +
> +                       imagis,mode =3D <0>; /* LRA_MODE */
> +
> +                       imagis,period-ns =3D <1340000>;

Hello Linus!

May you please try with imagis,period-ns =3D <12900>; and <11900> which
one will fit better.

> +                       imagis,duty-cycle-ns =3D <100>;
> +
> +                       pinctrl-names =3D "default";
> +                       pinctrl-0 =3D <&isa1200_janice_default>;
> +
> +                       ldo {
> +                               regulator-name =3D "vdd_vib";
> +                               regulator-min-microvolt =3D <3000000>;
> +                               regulator-max-microvolt =3D <3000000>;
> +                       };
> +               };
>
> It works, I get rumble on the keys.
>
> Tested-by: Linus Walleij <linusw@kernel.org>
>

Very nice! Thank you for testing!

> Yours,
> Linus Walleij
