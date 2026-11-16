Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794847456;
	b=seBhQYnxVKGjiH6VBme+ueuuutuZVlH32/WjFOZR8/1NI2B03RV/U9HVPyxdPxrrxeWI
	 EqbUzzeaojoL39bCOMtMacYQ33YbcSwbv5QuilvmxiKrPI0f2Vh5SKCbuT2AsPka+5pnS
	 d35F+N0UZjUzgAzLTgUYLWminxvaWWnRpZZS+nBJwE3vPhjB8SX7yHenw8JSvBFVK5jCu
	 qESMu5xV5YVxM5vKCE88Ki9ikqp9Nue97UDinRlDSGkX5bYZR+koOc+R/ufkpPtBX3e58
	 3/tMVPOr/aj+mQdXPOk/r5YHNRmg38D2D2Hnqb87DMwkdFRxJBhDilFfplrkBUhOHSQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847456;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
	b=lypBYtzzar6mnbW7pPQJvZD9xLB0zwfyyVln7iIdyB1Q0Y0jNb601qVV/d1kUEMRGZ9b
	 IoImkZq/k4iTW+GEa5DIACH7elGun/xs0XhqoC9Ps0L8ZE2j5VTJzBwyX4XGmMSGwBOCq
	 2oOfUyUnBa77BYSjZiYL0Ppo+44kf4ejcUZh0zz8LaMc8R5s4XIShuMKj9dIJ4i2W76B2
	 GmJParEdZDg5lnTI2DcPKvgRmLef1qEphSeqy0MkxIlUVuHZ17EYvja1pNvUasQFrnggW
	 +StLS3oEMthiIzwNV7n/VgPppyvj9DY2g8XDsOAm5ZDGVGModvsqBealFfjzW5mSZRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTtDBo6K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B857606A883
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 16:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B857606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iTtDBo6K
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eae1276409so1339494e0c.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 08:44:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794847455; cv=none;
        d=google.com; s=arc-20260327;
        b=HUa85IR7Kphe6YHWS+inGVYQxhezy1j8B+45/gSZd6ZDjKEWO/EVdPOb5orMNGbk7L
         M9ozdPnMb9xMix/JQbPDz3rCYS5ydy4pcHA4h3Q3VHs+O0ftphKCfXUNcgks4iAIoaf4
         YjJ350/SgEoct24RVni5hnaChhDNHaK7RX77emPBn+Qq47+2f74DZSckV3VtimjISaux
         jy3FtSKQVQM0Pp7PJA7rnlDuy8TyB/uJ3AJGmbIko2MOmD7gQrM3yIWyL2NTVrCzV5VC
         QGduCK07lisbRit8f8zJXmiP/Ew0zIb4CCm7UpZ44kBl6Dx/vhWprefCWsJ7RtiT0Zfj
         zVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        fh=TSCxzc6QckJ9BP4GapBeDr5AOvtEavxlFu8Ze5gN5Oo=;
        b=m9fFfkKBSZw7CPTZeWUY8fDViL0mQwxAXnxLFEULxeuheN+5FY8cx18tyAnTl/QZVh
         8KQ57NRK7hs9v94i8x3PBkoHJQYmW5iMXKGmOaHpao3UIxagpc0+jazw/Tx+L57LRfwd
         8E4gi2pVueNDxiGN4lT/rf0jLkVwNerW8w1ILmXXIJ05d9olUM3XbbSVr1VIPw5Ii3SF
         r4Qm/Tf+ZIu4VVbg7MLIjZtCTzO00bJux5dGqWOwbGy0nOJCSk/Z64zEj9WfG7pBabFk
         3ee0bdlnXMetmR+a2pJZwHApcDbuWE3+TmfwHxHfJgYMWXMc5SUq9RE1bMbWGBgwqNnF
         Tn3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847455; x=1795452255; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        b=iTtDBo6Kk2Q4CljPkycU6qu+JfrYwUurrLMJEv7e7BJcRsJfeLg0v5BzqjWQzcJQps
         +GAkNNhCOtKxve9dKSG8tPUVWxFmc5/gj22YaH/U72/n0AjTXNtgfFbEcgzaVnbreVnF
         /9qoNFm/W/xondSZ6QoFjc9OkKqh8UyAQ910226Ed0BtQ67DAq3Ud7mJ2bGPHTAO7/4o
         9wqPmohwLy/Jzey5Uf0Bk/6m+GWwDOge/l5z8jKMF803BLtMLVKZFJIYyyVk4l7fTBWO
         U6CeYQQGKNWXImLLLe/9VELwb9bNU8iTw1le0s0XQDBPxonOMnZ7zw/7Rqm0Q83cthf1
         WZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847455; x=1795452255;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dvRea7RkLNWOZktMsIshQYmOR+oUMa2n+1hk9YTFeo=;
        b=KniDfnamfq2m85WIwrxMNPx6B6TNTrmVRsOybYPEK04ENvV318p4xmPmXsBRMgEZyi
         a0YHosRS2849hJEgzWxh24Rdb+vJngUM54cT5EbA/vADsmlr55LwmQYy25wz5RIX4XAL
         hRerecy5rCbdLsXMNdf8n4ywkVwaed0SpH1d8ESNQ9xGAM23PZeo8ezWeNkMqX8fdyDI
         ZkkqCpkeTNMcKZRZte8N7rd3HOybiEwRN3j+awCCdrpu2fFJAZFvu3Wqu9+xts9l72kT
         VzrPz73UPcfb4/9LpyalcyYxyTkhDVnM9B5AL5gKXr5DOCT5baJsH8tMWdCyDqhDeOwh
         bd3g==
X-Forwarded-Encrypted: i=1; AL+hErGldPUZjXwOEWYWWMN3/PGd9nCnGNtekRLoqaOQLZc9uEX8WPsKTggxgoet8V27qXIymjhKQ+iPbJDV@vger.kernel.org
X-Gm-Message-State: APuU4Z84KIiFL1Zb3Cd6/DdIBoal23kV353Ia2cM9/QSxH4TQCfyA/S5
	3PjgUOUc3fgEsibgJSGbBokFXQz9if9UO2DCeE6oK+VwRPeC/Xt2KMkheNkPoQLuM8HBkSM4sxN
	ma7xtA5XsiqAImnT46yWrR/kFQn3Nd5U=
X-Gm-Gg: AYBFou0DC//RPrXzjEDcnzdbnsTY1N/Xm/WKwzeW2bbZUh03Mneyzo2Jpzw7xGD4+EM
	ugqEhcAlLM+Wqt5Du7WpxxaRCehqlp/vxr+rB1yIumZOQVLi3a2XuAxNTQdYtbUlfxQZaPNDyjb
	rvzaC6XGqBbyeHvCCfUgWtYe3Ui7YVaYdVwIZub/aj9QLBMNTv082TtWUdiFdoDVvdU3yvpUtRa
	+wLBUAqgTyWrPKCqb5JUWiAibd70e96Av9FpqN87qXJ5WVRrN6J8d0PIR3o91VbfIri4mhZumI4
	cdvDmXkhC6TA7F13ZvMfgGnr4VU1QMbPOydw0C3poYqwVVfiSFduPjxwx4RagG5hejPTaO41kX5
	fdRGweVNBcVW27ExuRnj6/YtqaGoqmXoBiFMOkdI62onvvkvJ8efD6TGs8JPZa+/Wo6Gzew==
X-Received: by 2002:a05:6122:1d15:b0:5ea:b294:f0ab with SMTP id
 71dfb90a1353d-5ee3465027cmr4058583e0c.2.1794847455049; Mon, 16 Nov 2026
 08:44:15 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-sunxi-orangepi-3-lts-v3-0-98fef4f75184@gmail.com>
 <20261026-sunxi-orangepi-3-lts-v3-2-98fef4f75184@gmail.com>
 <CAGb2v65eCotQPfnFsj6XfExs=ybE+xPWMFUhC9DFJRehfv7XAQ@mail.gmail.com>
 <CAH87RzSWDuiA9w8-ZkZXjVmQ_3EbRGKu8dKUzBf=KhNJHZFgjA@mail.gmail.com> <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
In-Reply-To: <CAGb2v64Fd4ZN7fbTwcz45wK4Sc=hD10gjaVCYgW+HDa8O7W7_w@mail.gmail.com>
From: Cristian Filipescu <filipescu.cristian@gmail.com>
Date: Mon, 16 Nov 2026 09:44:04 -0700
X-Gm-Features: AclHuK8dnGWqOScVe0Mt4jfgEl7XJ4HJYdFbZQ9_mRCIbIF03B9UBE-gzV7FCFI
Message-ID: <CAH87RzSJsk8ypdw0cDZzopeUxgPR1VdyiF_sHDLjKYR4AfzWXQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: allwinner: h6: Add Orange Pi 3 LTS
To: wens@kernel.org
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 7:38=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> wrot=
e:
>
> On Mon, Nov 16, 2026 at 7:47=E2=80=AFAM Cristian Filipescu
> <filipescu.cristian@gmail.com> wrote:
> >
> > Hi Chen-Yu,
> >
> > On Sun, Nov 15, 2026 at 3:14=E2=80=AFAM Chen-Yu Tsai <wens@kernel.org> =
wrote:
> > >
> > > On Tue, Oct 27, 2026 at 7:34=E2=80=AFAM Cristian Filipescu via B4 Rel=
ay
> > > <devnull+filipescu.cristian.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > >
> > > > Add the board description for the Allwinner H6-based Orange Pi 3 LT=
S,
> > > > including its regulators, storage, Ethernet PHY, LEDs and USB ports=
.
> > > >
> > > > Specify the Motorcomm YT8531C PHY ID to avoid early ID autodetectio=
n,
> > > > which failed on MAC driver rebind. Reset the sole PHY at MDIO bus
> > > > registration and keep reset outside interface detach so its configu=
red
> > > > 125 MHz clock output is retained. Use PHY-internal RGMII delays.
> > > >
> > > > Select the weakest GPIO drive level for both LEDs. Enable 1.8 V eMM=
C
> > > > DDR52 and HS200 modes; retain the H6 maximum frequency of 150 MHz.
> > > >
> > > > Link: https://lore.kernel.org/linux-sunxi/20250413134318.66681-3-je=
rnej.skrabec@gmail.com/
> > > > Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > Signed-off-by: Cristian Filipescu <filipescu.cristian@gmail.com>
> > > > ---
> > > >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> > > >  .../dts/allwinner/sun50i-h6-orangepi-3-lts.dts     | 379 +++++++++=
++++++++++++
> > > >  2 files changed, 380 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/bo=
ot/dts/allwinner/Makefile
> > > > index aa21f58a4..7ea136380 100644
> > > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-=
zero-plus.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h5-orangepi-zero-plus2.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-beelink-gs1.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3.dtb
> > > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-3-lts.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-lite2.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-orangepi-one-plus.dtb
> > > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64.dtb
> > > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts=
.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > new file mode 100644
> > > > index 000000000..e2ca41b94
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3-lts.dts
> > > > @@ -0,0 +1,379 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +// Copyright (C) 2025 Jernej Skrabec <jernej.skrabec@gmail.com>
> > > > +// Based on sun50i-h6-orangepi-3.dts, which is:
> > > > +// Copyright (C) 2019 Ond=C5=99ej Jirman <megous@megous.com>
> > >
> > > We now have a common sun50i-h6-orangepi.dtsi file. You really should
> > > rewrite this patch to just use that as a base.  It is mostly the same
> > > across all the OrangePi H6 boards.
> >
> > v4 now uses that include and keeps the LTS-specific additions
> > and overrides. I compared the resolved DTBs to check the inherited
> > properties and preserved the LTS electrical settings, except for the
> > review changes described below. Common naming cleanups are deferred.
>
> [...]
>
> > > Set the supply on all cores.
> >
> > Done. All four running CPU nodes reference DCDCA, and all four CPUs are
> > online with the shared cpufreq policy.
>
> I should've mentioned that since this is already enabled at the .dtsi
> level, you shouldn't add it anymore. If anything, it's the .dtsi file
> that should have all cores referencing the regulator.

Understood on the CPU supply. I have rebased onto sunxi/dt-for-7.5 at
098728144545 and removed the board-local CPU0-CPU3 supply declarations
and CPU/GPU OPP includes. These are now inherited from the common
Orange Pi H6 description. I also removed the redundant ramp-delay and
CPU maximum-voltage overrides, keeping the existing LTS 800 mV minimum.
Any all-core supply cleanup belongs in the common include.

>
> [...]
>
> > > > +&mmc1 {
> > > > +       vmmc-supply =3D <&reg_wifi_3v3>;
> > > > +       vqmmc-supply =3D <&reg_bldo3>;
> > >
> > > Something is fishy here. The schematic also shows vcc-wifi-io (on the=
 aw859
> > > side) directly derived from vcc-wifi (reg_wifi_3v3). I suggest at lea=
st
> > > checking with a multimeter to confirm what the voltage is on the VDDI=
O
> > > pin of the module.
> > >
> >
> > Regarding the AW859A I/O supply, I traced U60 pin 22 (VDDIO) to
> > VCC-WIFI-IO, which is connected to BLDO3 in the schematic. I measured
> > 1.8 V at an RW1 pad relative to board ground. This supports keeping the
> > existing BLDO3 vqmmc assignment; I have left it unchanged.
>
> You traced it on the board or on the schematic?
>
> Can you test at U60? The schematic has two options for I/O voltage from
> the LDOs, and then another from VCC-WIFI, hence I would like to be
> certain. I imagine the SMT components aren't labeled on the board, so
> it would be somewhat hard / eye-hurting to trace the board directly.
>

The Wi-Fi connection trace was from the schematic. Initially I was worried =
I
would short some pin, but I see pin 22 is at the edge. I have now measured
1.8 V directly at U60/AW859A pin 22 (VDDIO), relative to board ground after
the kernel boots.

> [...]
>
> > > > +&usb2otg {
> > > > +       dr_mode =3D "host";
> > > > +       status =3D "okay";
> > > > +};
> > > > +
> > > > +&usb2phy {
> > > > +       usb0_id_det-gpios =3D <&pio 2 15 GPIO_ACTIVE_HIGH>; /* PC15=
 */
> > >
> > > This isn't connected to anything but a pull-up. And you already speci=
fied
> > > host mode only above.
> >
> > Removed usb0_id_det-gpios with /delete-property/ so the common include'=
s
> > PC6 setting is removed too. USB0 remains fixed to host mode. The runnin=
g
> > DT confirms the ID GPIO property is absent and dr_mode is host.
>
> Thanks!
> ChenYu


Regards,
Cristian Filipescu
------------------------------------
