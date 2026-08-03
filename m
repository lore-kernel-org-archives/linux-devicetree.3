Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8762539F166
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743670; cv=pass; b=tnVrZXucTkYgW3k8Yiyc6YU/mLG1lj95RbS9EON+zFfhAEXjxqHmliA4Rp+f0qN9jHAJmZjzebE4PAhVYgeAhYB/1I1V0YZujswXqo/ERABNyT0oJ60V4YRzvfghKf1GieAKv2bieDWJYubOoarUdPF3mqhceQGsiI/c/NpvBq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743670; c=relaxed/simple;
	bh=BfoGLnxKqkGHS3lXZmpg5V4S04rgmYKSRo//J2O5u7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGwIk/ad1M0EV2jI0i3noHP+F7qdpyTh4fIU0v/JzOTzS/vPDhr7+CJYTUrkokRE558byMmNUogAX4yQyC3rB+Wr+t0JfpzsAd9fgjdQysTrE6AjLMYIcJ21KVI70Kv4k1w0wVE+2h4LlBJD880w3WAPoTEGmwUInWW6rL9qP5s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PA3iWe/o; arc=pass smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PA3iWe/o"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9673385b1efso1037536241.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785743667; cv=none;
        d=google.com; s=arc-20260327;
        b=OR9JvBLHCOz/knokF6IfpjTR66eItbbwGfJzoen7sjs2p1WP7vPH9w6Kg4U1dluNao
         A+W7Er6YWz3NPlNef4UoK8l4ShrylMpk56znOmRbgNzD5m/f8mgum3d4XMmQL9CjgdHI
         tcDUhqsnUy1CGoOJxAIz4OA6ZKN5d8ngQG4y6j4wae2MOnCFtEt9SkXPPpDORMT7Xq5o
         PZvka031jm3AhbIfGxzYNtcORv2JhDxlD7cfSP7Qs7hIQEA9oylIDLJ/+XmIrKV7UIeJ
         L8YDn4GH6RsU3gks1nxEMib/5+HLQKjzuo93VODEJCDticOs4z78gkQlS8cJhjtKBtLi
         dpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=psfVqHSrgaZTUpwYinIDfYYI61bABe7ffXMHd3MgwJ8=;
        fh=rjnZAT/gx4emucSbg2rdNSV1FNy4FqDIGcxjVgLHbls=;
        b=ZkW3/9gCWWl4IFP/YbDdy12O+gowglIerxQfzbWFcObVky1zX+wQ+g6R0+saQX+Oed
         iP51hMU281+ta93NrVp0dnOt4aqVQP9A8d5ZKvqfFRiQGuxpqp7MzmIDEwk5Sc5x1p64
         5ox47XZB7bA2XFXVwWAFcZ3su6qIxT+pFlnjGYhImo2qffJ4wFO8Aa+FgJgi54VeeHIZ
         SBAcsLSqTmNwHKwoGR/4EgrqaKNyFtzSMfalCvJw16mJqrgnfR7ZgV39QjJpRH1T6HaY
         V4es+TovKLOHadTsL+O15x6smJn+Ifw60hXVqz40dQ992P0MIPMUFH+o7wRQ9aUx3rCZ
         PYoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785743667; x=1786348467; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=psfVqHSrgaZTUpwYinIDfYYI61bABe7ffXMHd3MgwJ8=;
        b=PA3iWe/oEWZEuC3LIWxmC553fpSLbGw/IDCbHHqTqmP+LN6RQHf4nzjamfd5V+D8J2
         M8GnKDzNfuPoizj7Lm1J6PzvoIgXhy/Qxw19WjnWQVGlu447My9v+K7EqyufCbrWWQ2i
         D3tmDjfieJNUrI/032Y6ewKklek+TvHqbBCXv+DDU+/ykQhzlCgOPJGGIMk/mtIGsZ2/
         9v3OAa9FphGNqwDTzbS99nrzXqYhA/G4HN91FQdQvF74Vz5NZ5WP//2cLKSnC8vEE7f2
         07PKbfG6a2xk+t9yg9Nc3qEwpKu2PqJ4u/GYMqBh9WfpLN+N1YmtIhiDVlXN9uxPnShp
         GkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743667; x=1786348467;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=psfVqHSrgaZTUpwYinIDfYYI61bABe7ffXMHd3MgwJ8=;
        b=pIpbwn5zSsCdD+R8vkmNdD2u3mlytUCgTebaWtqByaLYFlMR9yUjbYbN/kU8S3LHMy
         w6EOM+e3W/QbkXqmjZnADIsKoxF+Q9V/EO1zrjSEbnunaFPXGd/2PMedPDGfzMngpF7f
         lJDa37SZRlzm4rxR2N3vHFro/3MDGAtSSMHElpUJJ0ng1/m8OJpv+YKyyMiUq/2MVu0A
         okTcqsvZFUVh1EQB9blbOKzKJrvZ2vhLC+TRVGiNRWlZF06IWW5C/Plz98t5E6xNx9/u
         hjnYxX5Id5acgnhlXZ4kiNXlDfahh2CJDh0WaUm7t7E0HdjoygZZvcNrpzVg6s88qD+E
         vHYw==
X-Forwarded-Encrypted: i=1; AHgh+RoqN6H5WVLa/2Dh+iDvd9UxWidJCspOwRR+wTtGqzwZN1ll8NlYnxArPbbUFqtoZ42gQBVHUw70tUGd@vger.kernel.org
X-Gm-Message-State: AOJu0YzFKLJlR/n0iQHMdeskyazubjYVFUXSjxISy+5Hoz3X6Qoj4rgL
	PkuaU+4azeKVCxpzeZYyxSOWBB1tItdgWRs7lIyl47SZeG2AXRSFrjaJypr3ZrVemZZcf6WMbU+
	MWc6k5F05ymtMDsTNIVwbpZsbAkJ8uYI=
X-Gm-Gg: AR+sD11uyFXiwihe/4n2x0AWAK+GkYV2a06pJMMQSNj60p1tuv9ls7RNk8ye/9i5hZf
	CskagjEQpjgEkw4PfuCtrFoLudYeUsak4GQSLNf5SDWnJb0MQHq4ohGN2sCRLGvfeTsNo+ODd2J
	nnjjRSyfiN49RkD5rY2XGDQGBfP58GU0thwBxnZHB2BwfkouW32QPpT7oTfP7y2E0Bbp8/QKnTe
	PKIOmijQofylyJbanmPr0aB/CxMH8tXlpW/yWmgwCiNov6+vuzmBfBpjBxEZQ1dTAWOLcXu25dV
	Y18+ATHJQMzCOXLmnfyEAPWEhT4owd1jcmvXeh/w7jZCyEsnqahaEFEzhEArAoVEsuuea6ziHN6
	3I/4utM/9g5x6Y6e0f27RV7Y8m5Yv16zf3dtJ+MBmsL1+iqKovcelryV+wftUq7pQoQSpCPW1+J
	hLsv5nLb6gsQJb2ktVCB8yO0EhGO4E6rn6l3fphn1B0ImLMtE=
X-Received: by 2002:a05:6102:160e:b0:65a:fcea:5a8 with SMTP id
 ada2fe7eead31-75b21860c9dmr6557280137.3.1785743667347; Mon, 03 Aug 2026
 00:54:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-8-0a53cd9e21cc@gmail.com> <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org>
In-Reply-To: <f2cc3c90-060f-40c1-a55e-e2ed91e65487@kernel.org>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 01:54:16 -0600
X-Gm-Features: AUfX_mzypJX8cJAuXN5et4vt4pytYhwgZWhNFqSZnDYLwz1Lp-gZapkTkGPrkCE
Message-ID: <CADvTj4q7HnOYJZE-M070-1npEdne__Ct5D9FeUNVVXa8Bsm7qQ@mail.gmail.com>
Subject: Re: [PATCH 08/21] dt-bindings: mfd: x-powers: add AC200
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 1:07=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 03/08/2026 07:14, James Hilliard wrote:
> > The AC200 is an I2C-controlled mixed-signal companion IC containing
> > audio, video, RTC and Fast Ethernet PHY functions.
>
> This fails when applied, because you did not explain the
> dependencies/merging of this patchset.
>
> This is THE MOST important information of cover letter. The first thing
> to explain.

I did mention in the cover letter that the pwm series is a dependency:
https://lore.kernel.org/all/20260703152215.192859-1-richard.genoud@bootlin.=
com/

With the pwm series first this should apply on top of master. Should
I just mention that it applies on master or should I reference a specific
commit hash or something?

> >
> > Describe the parent device, its input clock, required function supplies=
,
> > the optional SID bandgap calibration cell used by the vendor initializa=
tion
> > sequence, and its optional Ethernet PHY control child. Document the 24 =
and
> > 27 MHz rates encoded by the public EPHY clock selector.
> >
>
> ...
>
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - ac-ldoin-supply
> > +  - ephy-vcc-supply
> > +  - rtc-vcc-supply
> > +  - tv-vcc-supply
> > +
> > +dependencies:
> > +  interrupts: [ interrupt-controller ]
> > +  interrupt-controller: [ '#interrupt-cells', interrupts ]
> > +  '#interrupt-cells': [ interrupt-controller ]
> > +  nvmem-cells: [ nvmem-cell-names ]
> > +  nvmem-cell-names: [ nvmem-cells ]
>
> Why do you need all these dependencies? What are you trying to express?

Looks like we probably can get rid of all except these:
interrupt-controller: [ interrupts ]
nvmem-cells: [ nvmem-cell-names ]

I was just trying to express the MFD controller dependencies.

> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        mixed-signal@10 {
>
> ...
>
> > +...
> > diff --git a/include/dt-bindings/mfd/x-powers,ac200.h b/include/dt-bind=
ings/mfd/x-powers,ac200.h
> > new file mode 100644
> > index 000000000000..cc59e2ab4912
> > --- /dev/null
> > +++ b/include/dt-bindings/mfd/x-powers,ac200.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Interrupt numbers of the X-Powers AC200 interrupt controller.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +#define _DT_BINDINGS_MFD_X_POWERS_AC200_H
> > +
> > +#define AC200_IRQ_TVE                        0
> > +#define AC200_IRQ_EPHY                       1
> > +#define AC200_IRQ_RTC                        2
>
> Hardware constants are not really bindings, even though you use them in
> the driver.

Should I do something different for this?

>
> > +
> > +#endif /* _DT_BINDINGS_MFD_X_POWERS_AC200_H */
> >
>
>
> Best regards,
> Krzysztof
