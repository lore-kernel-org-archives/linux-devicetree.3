Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FBE448CF1
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 14:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785248279; cv=pass; b=CHrEQaZovQiP2l6P3aaOg2Ug2FZSIwr5O+OTkGbM633K88e3HQdKoaX71UOs/igM3D1j4dNm52kpGk9f6lov1RNuPbG1goWbPj/fMLLT6eBU0rpgLd6Hrfjbkmt9Cg1ZtjENBHgQx9dMZW5DeYVuho91DWarzTupbnU212W3XyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785248279; c=relaxed/simple;
	bh=s0L6BAhWQAP5ekhIx6eSaVT1WWCc3scLWsxKArPZM+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J16ySLT3o2/lM7azOgNlBr5aSH6ax+OhCQIAGvlvzlPIyz8lfHSdXjY9XPwfELnIpSObIyN8yjp5CvByNyGMXnB/w1XnbvuJE9LxfuAknejP3g5hMl30aI8wzoVjYsSAWgPBam8rsvB2Rio4BPqzAMJvpE+T3bIw7Q1bHIeUxyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJQEJp/S; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJQEJp/S"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38125cebfdaso5495787a91.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785248277; cv=none;
        d=google.com; s=arc-20260327;
        b=n4N40RUnIP92UMrGEbWc4+6b9BpQgnhgh0CFpOZaTKPD6SaBmbp81+efE4BvQBZB0i
         pKfvhiOFMGYOhxHz3nDAKycvr2L5tdDoLkJaqQ6SVfoa9xR192/cCaya5uKWqq8nmb8B
         5yI0KwRrVGUAAMbKbIc8RZjdb6ec98Yo5tfMHbmmqY2eKXiD6j/gpOVRBsL/Cg2hMhFk
         AkdX8E5hTBsxP7SqFBcUeDw++e/ZgPqk5dGa5hy1Xw4yvySY6hmqW05R0gcCBMJrEkW5
         w9yKAWSpXVbY7e/YauRsM/jLwMczpuBHoPpsFmQyamLtTlufP0Tl7/RZMhONFO3NYTi+
         /g0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YL5Iy3naCnnlYB9h+hgyvohN7nDYnPYG3Swu9uEYbAs=;
        fh=8mBEXeDU2qv+LC8p82wVxSdqNbx0nYH+hy9UWqU41Ug=;
        b=B62699aIrxfqyKjtZ5C79ROJtL7VZ0eRo8QVImZfhlLpE0jTlzwPtMTc3ik1UPO4lm
         KmoOQmcVChobdQy49ym0LjiBofbnj/Ky8pOo42GVOdZkDX4yrnBwh0bvMIv0HVfzZ2vX
         4UlD1jHw+ubJiVUoOMDiHpp1xmxqd1OsuuIoWdvhTjMEiAuq2p/quQqBcqDyONNZhtJw
         Lvuh8F+OnHR7e3/8c8l0YXBeoLro+iMM+0Bc+ztjfxFPA778u6t1XdJ0ro8IOqMjapOX
         uoQk9pRqHGrCaLY2m9ryi6LjH42efkQsCXAwCw9vr0KuuXVfdSuUlZQn4+qKsEAb9O5y
         rEBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785248277; x=1785853077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YL5Iy3naCnnlYB9h+hgyvohN7nDYnPYG3Swu9uEYbAs=;
        b=CJQEJp/SgiCvghXYapbOzlPgVC5SsLMSsN4BXVIsg6TSe+W6zdzuJ0rmszncKm8SLV
         H5uD8gz9eSEeCcHzVFhq5raBYmYPUbF7vTdYTDSdIKc21DUbiCwLBtRwB1UJnxnp9Afb
         SiFT+/+t+HncT+mMsyZ5Sk5scRF/a5Khn8m9Te/e68EgYSnk5A2niMzhluP1LNGyzuDV
         O5kGPke9eRvZTQ459bvPYXzJ5ZUGW3qW+x15zAGCH1pL77tU8nrqUGAsfQbk4fYSE6wn
         D5JqGJufvuHIpGwxuU93pbHnCeDImtmC/MAvZ5C5BFIuHcg3zW9j6FXwHfRX3JnYmQeM
         hyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785248277; x=1785853077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YL5Iy3naCnnlYB9h+hgyvohN7nDYnPYG3Swu9uEYbAs=;
        b=nUHwAh2B5QDNVyRt9i4UFRUA+GaqhTyvcRjmN/x48Cfqfxx2d8hBcgOES/zTTDZYpa
         WpNgfa8jN2WI98Mo6NVck2GqtnizrS9tO97N4hizeFvzFByQNDVrtQspFu4QuUU1PXCb
         04WO1bejGiLkehfcLAWIfn2iOUfl6b+czT74Utc7rL8/hgrJf+d9rSedSh3fq5sSYTah
         hyNZl0ku88tBKwfzjw5kSvLVukOE1ihLeMuic31nT3AyMy0amxU9SEO0BtrRz3kDmqGa
         TfqPExhlfunShjayjWx1ZFui2/VGmu3+lPEpqmEkoUhhJpInZQdhGTn4ncIqnbmobyLg
         +mAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqF7TSBk7a/hYX8mdcsUYwP4CCj6jWbFUyEkop5LHZmas9eG2DRUaq7IBwt8nODxI9UB/57ofysqrJC@vger.kernel.org
X-Gm-Message-State: AOJu0YzAApM0qJ1eyJwgfJttc0SMQ3/NuCfqQcYB7XVehQ6AbrlIHCeo
	topK8xL0nYnyHtC0NqFgsC1a3ZjcG2yRBSG8E5gQOofXJWzmKHS7R2/w/tZNTzcrRnP8wPEVGNC
	orBnuUoc2wUKBYpeY5sfAg2eoe8axl20=
X-Gm-Gg: AR+sD12tcCXgM8LyqhBSt1T3O8lQ96oHSmc96SPpenE9HlBFHdzOq68598MpdUILbr7
	8QAak7/pNyjXJ4EckOINx75M9NpUbjehUC6bLskYbnRUaxurBwRKl/uK9wVPzj7i6D3jM6MhMbF
	7i+Fb1gLCNWNxoOZXBrJ65J28mu5JvtKvE0O69tirkuGsxVW5vnidIpAuX6ULCnDR/qLdgIUYOp
	HooX1lnZiWIsC7yj/2nOE3DulToLhZWxDUJ6An2kDqPqaK/z9GMPz1CHpnLpKl9G7ZicEKWvOMN
	H/ZBlqNKcM533S4IvtU=
X-Received: by 2002:a17:90b:1806:b0:380:fead:448d with SMTP id
 98e67ed59e1d1-38f6a40bd7cmr3263576a91.13.1785248272625; Tue, 28 Jul 2026
 07:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721101059.451699-1-clamor95@gmail.com> <20260721101059.451699-7-clamor95@gmail.com>
 <L1pGU82wTC69ycdbd3YRJQ@nvidia.com>
In-Reply-To: <L1pGU82wTC69ycdbd3YRJQ@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 28 Jul 2026 17:17:40 +0300
X-Gm-Features: AUfX_mx6nAQUP8140au6l006nq8pIwhJbqbjeri4r4lcGh_AF4WWT8JcJVxbdyI
Message-ID: <CAPVz0n2cBDZ16rek-phtp0J5QKSfyZHWHtJX7CeWjraEuz=5qw@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] ARM: tegra: tf701t: Tune MMC devices
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 28 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 15:09 Mikk=
o Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> > Add SDR104 mode to WiFi SDIO and uSD device nodes, remove mmc-ddr-1_8v
> > which is eMMC specific and improve their power sequences. The uSD card
> > refuses to work reliably with fixed regulator and 1.8V IO supply. Adjus=
t
> > configuration to mimic setup proposed by the vendor in the downstream
> > kernel. Add HS200 mode support to the eMMC sdmmc device node.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 35 +++++++------------
> >  1 file changed, 13 insertions(+), 22 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/a=
rm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > index 83f8dd84d28a2..3de5c84d5f009 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > @@ -1645,9 +1645,9 @@ ldo8 {
> >
> >                                       vddio_usd: ldo9 {
> >                                               regulator-name =3D "vddio=
_usd";
> > -                                             /* min voltage of 1.8v is=
 not stable */
> > -                                             regulator-min-microvolt =
=3D <2900000>;
> > +                                             regulator-min-microvolt =
=3D <1800000>;
> >                                               regulator-max-microvolt =
=3D <2900000>;
> > +                                             regulator-boot-on;
> >                                       };
> >
> >                                       avdd_hdmi: ldoln {
> > @@ -2350,9 +2350,9 @@ brcm_wifi_pwrseq: pwrseq-wifi {
> >               clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> >               clock-names =3D "ext_clock";
> >
> > -             reset-gpios =3D <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
> > -             post-power-on-delay-ms =3D <300>;
> > -             power-off-delay-us =3D <300>;
> > +             reset-gpios =3D <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_LOW>=
;
> > +             post-power-on-delay-ms =3D <100>;
> > +             power-off-delay-us =3D <100>;
> >       };
> >
> >       /* WiFi */
> > @@ -2372,9 +2372,7 @@ mmc@78000000 {
> >               non-removable;
> >
> >               sd-uhs-ddr50;
> > -             mmc-ddr-1_8v;
> > -
> > -             power-gpios =3D <&gpio TEGRA_GPIO(CC, 5) GPIO_ACTIVE_HIGH=
>;
> > +             sd-uhs-sdr104;
> >
> >               nvidia,default-tap =3D <0x2>;
> >               nvidia,default-trim =3D <0x2>;
> > @@ -2396,14 +2394,18 @@ wifi@1 {
> >       /* MicroSD card */
> >       mmc@78000400 {
> >               status =3D "okay";
> > -
> >               bus-width =3D <4>;
> > +
> >               cd-gpios =3D <&gpio TEGRA_GPIO(V, 2) GPIO_ACTIVE_LOW>;
> > +             power-gpios =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>=
;
> > +
> > +             sd-uhs-ddr50;
> > +             sd-uhs-sdr104;
> >
> >               nvidia,default-tap =3D <0x3>;
> >               nvidia,default-trim =3D <0x3>;
> >
> > -             vmmc-supply =3D <&vdd_2v9_usd>;
> > +             vmmc-supply =3D <&vcore_emmc>;
> >               vqmmc-supply =3D <&vddio_usd>;
> >       };
> >
> > @@ -2414,6 +2416,7 @@ mmc@78000600 {
> >
> >               non-removable;
> >               mmc-ddr-1_8v;
> > +             mmc-hs200-1_8v;
> >
> >               vmmc-supply =3D <&vcore_emmc>;
> >               vqmmc-supply =3D <&vdd_1v8_vio>;
> > @@ -2608,17 +2611,6 @@ hdmi_5v0_sys: regulator-hdmi {
> >               vin-supply =3D <&vdd_smps10_out2>;
> >       };
> >
> > -     vdd_2v9_usd: regulator-vdd-usd {
> > -             compatible =3D "regulator-fixed";
> > -             regulator-name =3D "vdd_sd_slot";
> > -             regulator-min-microvolt =3D <2900000>;
> > -             regulator-max-microvolt =3D <2900000>;
> > -             regulator-boot-on;
> > -             gpio =3D <&gpio TEGRA_GPIO(K, 1) GPIO_ACTIVE_HIGH>;
> > -             enable-active-high;
> > -             vin-supply =3D <&vcore_emmc>;
> > -     };
> > -
> >       vdd_1v8_cam: regulator-cam-vio {
> >               compatible =3D "regulator-fixed";
> >               regulator-name =3D "vdd_1v8_cam";
> > @@ -2655,7 +2647,6 @@ vdd_3v3_com: regulator-com {
> >               regulator-name =3D "vdd_3v3_com";
> >               regulator-min-microvolt =3D <3300000>;
> >               regulator-max-microvolt =3D <3300000>;
> > -             regulator-always-on;
> >               regulator-boot-on;
> >               gpio =3D <&gpio TEGRA_GPIO(U, 1) GPIO_ACTIVE_HIGH>;
> >               enable-active-high;
> > --
> > 2.53.0
> >
> >
>
> Which vendor BSP are you referencing? The one I have seems to set
> MMC_UHS_MASK_DDR50, but I'm not quite sure what board definitions these
> devices are actually using.
>

TF701T is based on Macallan board file. Downstream sets
MMC_UHS_MASK_DDR50 for sdmmc 1 and 2 (sd and wifi) and no flags for
mmc. From extensive testing on the device I can confirm that sdr104
mode can be used on sd and wifi sdmmc (in addition to ddr50 which is
not removed). Same story with eMMC and HS200 mode.
