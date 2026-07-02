Received: from mail-ed2-f2.google.com (mail-ed2-f2.google.com [74.125.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6508E395276
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 19:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783022211; cv=pass; b=ZZW/7OyecvxlDCMmtKzcJD2rB0ZhqAxAT6GpOcK5eQ9ZmTnem5GI2qrrjh2D3OcxJ3tzv+bX5wkZAUVcnYDihZ+ZIt8yyd9vtP8VmAa6eNo58ELkEVtJFKD5wY+7CH4C5zuCf/iqpN3XQQf4tpjxRWKB/zis90Wtv3PngGj+I4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783022211; c=relaxed/simple;
	bh=78XKiTTX6No/T/hR8Omcb5xp2aN7XcpwRGVep5gRzTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F2jB6DqkUBzRKIA9whbzjDu5U2jNImFwtu5QqpXA8/DGYcDrcvf4pFFKK26tYt6jEQlMWPcI+Ie9n9j60051J1oyjFHmoVAT2w3Iu6lZ5kQ6eF6ckXvKn5ej9n+3d3uFBxV8t6kZZ/24CErhFln3vBwtve97WItKNVz6e79EFwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kiJ1RLAC; arc=pass smtp.client-ip=74.125.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kiJ1RLAC"
Received: by mail-ed2-f2.google.com with SMTP id 4fb4d7f45d1cf-69867726cd3so534604a12.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:56:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783022206; cv=none;
        d=google.com; s=arc-20260327;
        b=L3NxIWUosICoybomO3vYUOjI221O0UY4sAdge9+bqvdN1HV1JyATdeelTtQkrr817u
         LGrPcGB2HGStnCxcckIqYTdfYDA1jlTHpMfQjTrsBTC5Jb2g0LeO44fhDPBPnpclagTS
         RpZXDJGfWxlfdk7wi+NmzMfTGVIrC2/xYuiSFCjhWYLPbLqCHbQMNx9Nd8vsRdi2jluW
         q70qdOdj8nKR1uB8Q1TVaDHI9BrYRDupqRXUrKmHc5Y4S+sgnzfBf7H0khJAqYQ61JRh
         x5Pwusx3AI6uPc4fr/cka4DajjrgUJY6QwmxbvSHSJ+pU+H7p7N0CMXnuh63Z40DbiI7
         +BRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+R43ySXquKh2cdUqDoV82BuWFAxJ2P/AxP58siYwe/c=;
        fh=TZ8xjOU5kM2kZvgMecSaLmQYC8kHoKEO8kS5eA+HkFk=;
        b=Zjw3bKf70keas10jZ175nZsrbAQuYfPjJhmDGr1FDcQmk0dtxteuPWVNdIqLNShBEp
         y3Zb6p4ePaST6N6v+Ngj9yQPrMTC+BAEJTJMUVArnuyPiqfN+I9Rc/tNpFp4SY7FOC72
         gIgRUIgvD1y+JkEcisPkaRc1SONAXkjOnO66/W4JThSMnMInmy0LiBit+RO9wbBnHva3
         eUYwI/ImcR6uHOTyzQ889EXEzoxCNCTxlAX5bAmIN+PGyuwhA5BU++X46Fv6FDiIBn+Y
         Sa9jHUJunDLBbvncPVujPE7WYZmR4kyS8p0mdRsbRp+Xu4PrqdV0mfUhl1GDIovQs3U9
         Z7yw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783022206; x=1783627006; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+R43ySXquKh2cdUqDoV82BuWFAxJ2P/AxP58siYwe/c=;
        b=kiJ1RLACMimNEWuzLgR6URJrRf4EYumy/bSngcJMPEQvdVZ7REcyWie06qTYSFLcBZ
         d2oN9WBpxEp8rS1cQnxnq7VR8PVB4xNCgOvcnaYj1l+eZ4OGwulMvflE8AuKyQE4A7yK
         amJcoWaaHdSerOu1LvM2THoVmiKIwlapponS2W+2ykl5LlyOBETm/1/J2kMMAYhbt8kB
         auYv6agciuUzawMNtARD4evPePf+lMpEISsBieTXHVx00JnBKzSHnej1kAIqb2m7GDA8
         2TWSGSkpLsMM7WVA/J/J7QOFU/sB8GslHEtz1sCXvwD4tVw4X4AEaLpGW6RrVMpb/ZCd
         jxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783022206; x=1783627006;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+R43ySXquKh2cdUqDoV82BuWFAxJ2P/AxP58siYwe/c=;
        b=Tede+t1NtaZGuGCD0tgWA+Mu8nwuB3oe0FKjmP0yw6WDZ2MbstFqEJCpK/wLBh81kf
         98M1Brk3uk2j+WepGO1VnGU1JsBX6Dl+AIZO48dUzM8yc+7l4cZnTtn2h1+VlZHU5aG7
         WZ9SkOvVHoXk3PHvbn6IoHa8n/zd+TLlZJz+H4r+8DWwNUhNYnYojZz1JZdoqIi3ekPt
         jaJvOZw58yTMvECtiVGl8DNv1MLaa0cf5b/mgjvO27DyWTEpxAFM4qDNedyAe5HVGW30
         oQo0kJm0BSa1VguScipvezfuHU2QhYACRb22E+/oiW420ULUVSebgpR2IelnrWfM7YQ2
         s/4Q==
X-Forwarded-Encrypted: i=1; AHgh+RpCsc2s6ghG/HFgVHRU8g+AkM/l9092hz2Lk7n5edbFj7nubsZ1msd0upB1cfTDf1fpx/KkOkpCUqQ7@vger.kernel.org
X-Gm-Message-State: AOJu0YwGjL70zNCrEvLHNdpeKcskMlOzPn6rxZyooDpOt3n0O4J2y3nW
	fZxC+ysFODDbGzPuPfW48PE8/Ulbr5SL5e9QN+mxeqAh+yVU8A/JKqR3TtJn0/nmPV5c4mlh7u6
	RflPsNmhHIbE2Z0Y4xM7VPNFJnGvAcVmek79miMMzCZr9
X-Gm-Gg: AfdE7cloUSK37Flzc8o8liQCTrXZUzXwatwcaHVVwt13J4Rtl4hHifbO4f85gf8XoPJ
	eiO/7GSAck3XQlMeaJeaC2VOtFWU2cBTfPuHmAyPQs1A6rfz3HUh29hmT9rMmzAHsIcX0Wtijww
	HeXA8Qoio4KScjA4Ac5EzkqVaJS2QrvB8cQBKzf1cxieLMJfbv6tG8u8knlS/9O0rrZUbc+ANcA
	2batxrRQ9TkOVAYdUJLb2LPxNZ+qCKu0zG/mr5D3eFLyRbCySHwC1rtWL6I9nZQA6iPIS/2
X-Received: by 2002:a17:906:7312:b0:c12:a425:cbca with SMTP id
 a640c23a62f3a-c12ae74dfb1mr317838366b.54.1783022206297; Thu, 02 Jul 2026
 12:56:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702193538.2195973-1-coiaprant@gmail.com> <20260702193538.2195973-4-coiaprant@gmail.com>
 <20260702194430.91DB81F000E9@smtp.kernel.org>
In-Reply-To: <20260702194430.91DB81F000E9@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Fri, 3 Jul 2026 03:56:35 +0800
X-Gm-Features: AVVi8CdiP4pJCcVRB6E2EMlXWI1JezCP9aABddnM42SkyjD3EjNWOO9ItXcLxbE
Message-ID: <CALj3r0jJm+VXBi22g9ebqA219=V1vUHvsfT6NgNmOhcLaJnt3w@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: rockchip: Add devicetree for the
 Graperain G3568 v2
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +     wifi-irq {
> > +             wifi_host_wake_irq: wifi-host-wake-irq {
> > +                     rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_down>;
> > +             };
> > +     };
> > +};
>
> [ ... ]
>
> > +     wifi@1 {
> > +             compatible = "brcm,bcm4356-fmac", "brcm,bcm4329-fmac";
> > +             reg = <1>;
> > +             interrupt-parent = <&gpio3>;
> > +             interrupts = <RK_PD4 IRQ_TYPE_LEVEL_LOW>;
>
> [Severity: High]
> Will this combination of an active-low level-triggered interrupt and a
> pull-down resistor cause an interrupt storm?
>
> If the WiFi module enters a sleep state and leaves the pin floating, the
> pull-down configured in wifi_host_wake_irq will drive the pin low. Because
> the interrupt is configured as IRQ_TYPE_LEVEL_LOW, won't the kernel
> continuously fire the interrupt handler?
>
> > +             interrupt-names = "host-wake";
> > +             pinctrl-names = "default";
> > +             pinctrl-0 = <&wifi_host_wake_irq>;
> > +     };
> > +};

It should be IRQ_TYPE_LEVEL_HIGH, wrong value in OEM SDK.
