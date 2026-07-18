Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B0C314B9D
	for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 11:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784372687; cv=pass; b=Kl435hDFxvBNP8Bt3wYQOqDVlcYYhj8M4EwoQHfIrWq/plVuH/bzkmXuYFJ2pE9vxvf0I/0bb+FsKqvy5yNK6yksszukR3GjLcre2AvKvYjVHqQALOX7Ty0flUMcs+CKZZRHTxPP/YqeRXIlyh3PZ5hsJoAb4ZLC5IHS3HUxUsk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784372687; c=relaxed/simple;
	bh=9oXnPdc5M5kFL0zR2usbcRQetuEtaE9CxxIQBqFaYTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y3yYIIsnQifqQAhgKbM0c9rpSVew22tAI/I3palpFnY3X8YvQuOxQuUU9jEU9X/MYGnHcky6RLSkxhsl9og8zSuQb3392ZcJZY23w7cPQpJgIztf5RMbwdaCM84aFOqsgK1nAmJJlZyRWRLA3tzdaUgSiaU3MqRNdHyIYcVJ2d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9K/qlbe; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9K/qlbe"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664a5193741so1081900d50.1
        for <devicetree@vger.kernel.org>; Sat, 18 Jul 2026 04:04:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784372685; cv=none;
        d=google.com; s=arc-20260327;
        b=VYINTqO27X8F/KT0QNBQ8UEk11yoq3iaP05v/ngxm9a7O2G5FMLJ7rOOOqw6fGIBz9
         6IEREu9xrOKKscj4k2DQAz6BxosmOsahZHNjuHZhGYUWzI1k0bt7UY8QB6sRxrWNVQoV
         9f20z9JtPx0k2E6CCrozHzqQ0vamSTsGrf2wPC6bcGbApmrvT/U4MOB9LKFQ9/invvRT
         DvX0Py1m567EE8e77HQQ0ITZCL/JtG0C7Liyzy/sNRFYYUa3iQfK1u+Ll8/8MSDF3C70
         U72mv3h3QumluEiQufOIR1LEXllZwTqD+VUlpuf7FarV0FgLEUqSus+s4Q6UYEPL8EIk
         CwWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vt2l2OcHA0eMP2cNyDZEsGAIycIWGJ5grI24JGOYQmM=;
        fh=lLYVFdCfQY33a68ZL8cGni2XsKIguC6zI19fz2fG1Qc=;
        b=n7qNYdTNTEh3BzFDRdBB290XzLmTxlZzZye9Nab5/GIgiJpQL8IRF3JqEabcWWboOH
         J22AZUxjRpp9S8I3ACY829g/Q1wVlqXSH23+uESLWshx/q3Y08lSFnug7CEsElcLFpu1
         geHYd4uRlLQoR3o3BpBQXjfcUH5hHwwchZQyVPj3t4t2O3CLN+rrURWgL4VYfRQMKfLr
         5POtl5LKXY0do6shMPi789IZRtuXhzkn3JVUvYbqggxskxw/msRHHTcnHBIJ2LeiFHVz
         6CX59MGGGqytugyN4PD0Z/zTKMVFOeu4qiAzbM7NktmpU2+4b4krOW2AdR0kdo3eVN6a
         AuTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784372685; x=1784977485; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vt2l2OcHA0eMP2cNyDZEsGAIycIWGJ5grI24JGOYQmM=;
        b=C9K/qlbeNwcWfw9A7gsE2z7iSSgBo16eu1c80oG/LdDxQERiF4+W0Jm+e5BKPl3uRz
         OftPr5NadcBaHlQ5w6fDRIa2QN0ucMKRzQVlyeqLz0IuJRlkLidGP29NQ4HVKyRcup4J
         C9Ams677XqtP8VIEJdmT69jrlsWpuwdgLOSjPBExEtKb9HD5E2FSd2nRHNiQPDZntKEw
         k9B9xQWsGgoxPfDAinZkDdUPiohQ4hcdtJUK+YuXde3imoOw+VLQDCaVATDgDAhlfnN2
         S1/hPuI3sj3spzGDsw5cPVW37t1657IRfMolHQzhCtoG4oD9EkeMdwTbIBHMw7UUi4Mz
         esnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784372685; x=1784977485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vt2l2OcHA0eMP2cNyDZEsGAIycIWGJ5grI24JGOYQmM=;
        b=C1YYW2+i8gkiHNQoL1iWpuzexKLaL12EgjSWR1pKLTo0+AsCRoYfOmERY0etGL3Tmh
         M3a6cZl5yoKLcHR2dPdB1gGB4fHXvZugUC2xS4ciQXvQlQQNIvGrnklUZYCs9Ve90djc
         5i6/iYbjoD/we8mep7QywkSIcdH+a8zplSYQdDItPuqzC0tLJLOahCPimXqDW7mOAbzv
         5BbHH+73cWdWfIhCPjBTMiO7OLh8627S/sYqeZ+R1X5P2A3hA71/j9wnlCBlnUo4PDiw
         wl3HFxBIjcNQ9hO+I9avcVNbUR4z4pkoE9QCt69CJeZyB6vR6gnl71lg+fhbdsgaLrnB
         pEYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPbEaXSGnWSuuRrWHKj3QshiW4eBiPPNnmR4IaHv+H27S8GGXszYXxZzYAdCw/QDlpF2kvYAnUqq/s@vger.kernel.org
X-Gm-Message-State: AOJu0YzYQN5YgI0KTbkQPnjzvSC7zPnUC5M3cbGHukajp4aoKFL3aodl
	3uvhczQc2OkXk9VWkmJs8y5CznfWm2xmWMiI/19iZ+Pq1KDPtRUBRcGiHzEWNuL+XtFt5yf6Ej9
	UG8oh1LQhIfA+eSzRPcQXS4OX10sGB+o=
X-Gm-Gg: AfdE7cnR6vxK+720Bgu4pssS6KelmKRh8ppmIX2oVE8eOlPyymuuah7QGbhNw3jqOqh
	T3OvC8OTWwWdbp1uUvd3My8oLJeTyLpwTz+emoJE0dpgISxcv3KAnnODs7/OlK/QHRlTJsb8dNA
	wy2fEX8pwonccitkjxiUkPuo4qc4gpwj+eGVmqwm89q6Htow2x/T1jnwUjrjc+/316/iveGtDLl
	jycIcjxb0vrGkazuDyekUein9qMTUh/zjyx6FX/Kx4vEXxxoW1wGoaEYL/krzTAaPoEqFf/OnmV
	PmDFnub00EANI7dMWXYIOSuNEfkeJg==
X-Received: by 2002:a53:b19d:0:b0:667:8db0:76a7 with SMTP id
 956f58d0204a3-6683be700d6mr1278751d50.9.1784372684813; Sat, 18 Jul 2026
 04:04:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-5-royalnet026@gmail.com>
 <20260718091200.65AE21F000E9@smtp.kernel.org>
In-Reply-To: <20260718091200.65AE21F000E9@smtp.kernel.org>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sat, 18 Jul 2026 13:04:33 +0200
X-Gm-Features: AUfX_mzv1PFiBSswpTxs5ztrtbcERZseF6OCGF3wFsdhSvoLcm5qvDBSH066Hi4
Message-ID: <CAEWPSH7CMoQB=ypHQvrV058VxpX_+Wdfthb9SJrHczVPZKqmcQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio capture
 on Orange Pi 5 Plus
To: sashiko-reviews@lists.linux.dev, 
	Dmitry Osipenko <dmitry.osipenko@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	linux-kernel@vger.kernel.org
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Does exposing this codec to the ALSA subsystem trigger a suspend
> regression in the hdmirx driver?

Good catch -- this one is real. The audio worker missed the pattern
the driver already applies to its hotplug and res_change works,
which hdmirx_disable_irq() cancels on the suspend path. Fixed for
v4: suspend cancels audio_work before the controller clocks are
gated, and resume re-arms it when a capture stream is active; the
worker's FIFO error path then resynchronizes the clock and the FIFO
on its first run after resume.

> Should swab32() be used here instead to ensure the byte swap happens
> unconditionally on all architectures?

Yes -- readl() already abstracts the bus endianness, so what this
code wants is an unconditional byte reversal, not an endian
conversion. Switched to swab32() for v4 (no functional change on
arm64, where this controller lives, but the right primitive
regardless).

Both changes are in my tree, compile-tested, and will be part of v4
together with whatever comes out of human review of the series.

Igor

On Sat, Jul 18, 2026 at 11:12=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The audio_work delayed work is not cancelled during system suspe=
nd, leading to a fatal bus fault.
> - [Medium] Incorrect use of be32_to_cpu() for unconditional byte swapping=
 breaks audio capture on big-endian architectures.
> --
>
> --- Patch [4]: [PATCH v3 4/4] arm64: dts: rockchip: enable HDMI RX audio =
capture on Orange Pi 5 Plus ---
> commit 030cd8fd5334b79e1751dec57b1de1f5fa4e3df3
> Author: Igor Paunovic <royalnet026@gmail.com>
>
> arm64: dts: rockchip: enable HDMI RX audio capture on Orange Pi 5 Plus
>
> This patch routes the HDMI receiver audio to the i2s7_8ch interface. It c=
reates
> a simple-audio-card configuration to expose a capture-only ALSA card driv=
en
> by the HDMI input. The setup uses the receiver as the bitclock and frame =
master.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/=
arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > index 145986695720a..2a68610cddbc3 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
> > @@ -37,6 +37,22 @@ hdmi1_con_in: endpoint {
> >               };
> >       };
> >
> > +     hdmiin-sound {
> > +             compatible =3D "simple-audio-card";
> > +             simple-audio-card,name =3D "rockchip,hdmiin";
> > +             simple-audio-card,format =3D "i2s";
> > +             simple-audio-card,bitclock-master =3D <&hdmiin_codec>;
> > +             simple-audio-card,frame-master =3D <&hdmiin_codec>;
> > +
> > +             simple-audio-card,cpu {
> > +                     sound-dai =3D <&i2s7_8ch>;
> > +             };
> > +
> > +             hdmiin_codec: simple-audio-card,codec {
> > +                     sound-dai =3D <&hdmi_receiver 0>;
>
> [Severity: High]
> Does exposing this codec to the ALSA subsystem trigger a suspend regressi=
on in
> the hdmirx driver?
>
> Looking at the underlying codec driver hdmirx_suspend() in snps_hdmirx.c:
>
> drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c:hdmirx_suspend()
> {
>         struct snps_hdmirx_dev *hdmirx_dev =3D dev_get_drvdata(dev);
>
>         hdmirx_disable_irq(dev);
>
>         /* TODO store CEC HW state */
>         disable_irq(hdmirx_dev->cec->irq);
>
>         return hdmirx_disable(dev);
> }
>
> The audio_work delayed work is queued on system_unbound_wq, which is not
> freezable, but this suspend callback doesn't cancel it.
>
> If system suspend is initiated while audio capture is active, the worker
> could fire after clocks are disabled via hdmirx_disable(), resulting in
> a bus fault when it performs MMIO reads.
>
> [Severity: Medium]
> Will this audio capture work correctly on big-endian architectures?
>
> The underlying hdmirx_audio_fs() driver function uses be32_to_cpu() for a=
n
> unconditional byte swap when calculating the ACR subpacket:
>
> drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c:hdmirx_audio_fs()
> {
> ...
>         acr_cts =3D be32_to_cpu((__force __be32)acr_pb3_0) & 0xfffff;
>         acr_n =3D (be32_to_cpu((__force __be32)acr_pb7_4) & 0x0fffff00) >=
> 8;
> ...
> }
>
> Since be32_to_cpu() behaves as a no-op on big-endian CPUs, the bytes rema=
in
> unswapped, causing the bitwise masking to extract the wrong bytes for the
> ACR CTS and N fields.
>
> Should swab32() be used here instead to ensure the byte swap happens
> unconditionally on all architectures?
>
> > +             };
> > +     };
> > +
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260718085728.67=
97-1-royalnet026@gmail.com?part=3D4
