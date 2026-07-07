Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA32233924
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783422539; cv=pass; b=X/mmumf9hk6QmtQC4XnrAn01KRrqMn+IGa7ZydRo+bqnXOJkU4yFGKbDyo+TseMYGR9RyH9C70ScNmUfry9uQTsdTef85TPqBNe9VujIsEWOUmTJ1fyOYc8iC+qzFmFrHUTnz+0qivk1O3kIiulAnIsM1/uVYjCfxe77XVLen5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783422539; c=relaxed/simple;
	bh=EHpTg5yqJ8Jt5bQRnJKHIpsROamTgCooXvnDJ6GCHE0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nr561Ii8l80pvG0WphoYfwYd/IpNGBvV/FPHWGGdnzPI/m0UtEudFXNwsoHhMzxFFogwhmkxYG5DeH3/9Ys4es5Rg+plCtwRTK8120FltB7S4mivQxJpPd7pkufhlbyG2Q6hda7PYb0LuCrAJxA8h9KquvA0NojV3VBSXATDGI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YVja8bLq; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YVja8bLq"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664bb15d05dso5641638d50.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 04:08:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783422536; cv=none;
        d=google.com; s=arc-20260327;
        b=cL4nrPBl6OGTN/Wl3hTxwV8B0cmx9/oFGp0+UYaIGb0hcjRsUoeODAezWTM1wmQ00T
         qw/YxEE7kC0v1xYYP9c6VWWyws8yNNjNjdXpPt4xPyJZimWtNkE6C/pervB2WsvaKv9r
         8ePOtWtUOzy8BQacM42R7HzCQ6avuFwBUMRAnGq5wK8+7IRZ/HQ7zh7BW2u6M2oO9WXw
         eBQoRuEYRLCQNnNcpCkPaaB4X01B/w+ceS8zF4intC2mQcY/m+DijF3J1kmoJDeWyJU1
         sUIZEJ0aYwlk/rlmB9NvmjD9/FgT2gVZcyN7zaX3WNJbY5g4nVNnETvSpFtfFRArA4yJ
         zqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tMpJXM9fHbDA78kVCJHA7qkcWOkk5FJ4dRDV3gbDV4k=;
        fh=uGjXP78f0RpxxJYUNKkil4+ZIr/5pUNCDwT4n9dxn7g=;
        b=M/X3Or/sx+pA6f5NXG2s1puc3G9J1Gs1N+rnJrfR2KPrT16+cCsJ2mnhxuYBDPJeII
         n5h+OP+PtWLV8rByKZw4Vmljy69N9hHOUMpHsxKzpHHSXoSIzkn99wL/LjWlNnTaWCcB
         FH5USjBUVjAs4vV+9I9M1cxwvPcjFbfUnXzu/6+HBCns6H3hjG+M9Z75gpKJt/E2lVOZ
         ilakMuSuGyjVyk06b2U6t3NqFIFpXOwmacf59FHZXL1/GHhOwxUWf4/B7baqUgM7xnV0
         kIkA8cxu5krP0fKeH3W95YdjPxhMwaN9/aRkIx/+KhO4pEHOwHLUGCKz06B1EVN/YfIv
         9RMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783422536; x=1784027336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tMpJXM9fHbDA78kVCJHA7qkcWOkk5FJ4dRDV3gbDV4k=;
        b=YVja8bLqWY17No0gxC3PcY+SfvgCPDzQo3Midvw7TvtATpTRAfiQf6bW2ZDqMRngQ+
         ed8fnQ0kvQoMpAZJ3f9UtWlEeknDw7PzYoXqJgoXULoeeAIfYxWJ5fxWeEfivZFBK0Se
         qRaozQfusIbWveOaqE2l8SiJArpwS2BdQB1ho=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783422536; x=1784027336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMpJXM9fHbDA78kVCJHA7qkcWOkk5FJ4dRDV3gbDV4k=;
        b=YvaGqJ9qnAlaQjcagQEJyRW8fnC+f7jKf9i4c7CzVKGUiXaev2h58zP9lN8KbwMXgA
         H7Wx1L7v2NJltC5Io7b1iRKoFlwb/eaNo7cuFF88/7WSSoAtbhIbHQBRZgT4AdHQM2/V
         gW7OBEzPnCsbhLBr5OYrdaI018FxxNt54KLjkFV21dC1Tb5qpbariipBMgKK2DIohkx0
         je3MEzLdv/FmMRgxIzWhcX6zbhrI5pDFDbIbMuP0csAe63XhWxx8CsDEcaTnUYaikf01
         qzrdH7V/Y05FJ05e38iYrRye1/bW9w6lp7C/wqJjUoViIoB0LEErxJdE9G1G7OHSzjTG
         DVIg==
X-Forwarded-Encrypted: i=1; AHgh+RpomaVaGNzB0HFnidUJXKC2QGI6oz+Uhy/D+1RDPi+Qo+SprMy/TKXyyk1tOrV1DfKne1WJVPpXFU2f@vger.kernel.org
X-Gm-Message-State: AOJu0YyVzoQEYgWyaujFazqCCHrFmgkOd8kFo1Eu1m1qFcNQt7QCVKv9
	o+m8DSe6/osIyL92ZkFhnqcWy+w7gCILOABfLJLA8FysvMDOfc9ZQg1bh49mE/e86deMBt8Ibln
	mV+ZrrEsLqVmBAy8NIoyvoAnEU0dwrhGdquDf+zPY
X-Gm-Gg: AfdE7clGxhW5XIdobxjPSiAXYLHcrGNYi8TUwaRz2HQIepvEmHjRYginCR37O2GciJs
	LSa1PK6CHUatCnPLVR0GrG6B8Q1Uj5OmIGAYI4JMGVPaC8IgyWhVD4RJdfyLsA8nFUcQBsF0I/R
	fphvfIPJAoNG5d1AA+gNwd3AqhDBjXeJB9F5i+9KtyGWtRKlt6lZXHLljoEvAD0kQ4mgidAs5Y8
	nF04Ms15VLwg9xit3d0S/GCWN6QWtSE2FbdJiieem+DXy1zrvcWgrU5qi84vJDh21IKRrAmqY6o
	ZiuQsAMirEpnQSsskp53DJ1+EyM=
X-Received: by 2002:a05:690e:c4d:b0:664:d7aa:3eb3 with SMTP id
 956f58d0204a3-6677faec2c3mr3752539d50.12.1783422535581; Tue, 07 Jul 2026
 04:08:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707104427.3409290-1-wenst@chromium.org> <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
In-Reply-To: <176dd24c-c3cf-4ab9-8497-594ed65d10ec@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 7 Jul 2026 19:08:44 +0800
X-Gm-Features: AVVi8CfL_5JVdKBWQj1eUZZBa-EhN5C_J2kjO8U6LC_EYJUTpwV01pG1PV1A2Kg
Message-ID: <CAGXv+5F86JU9+LPSy8PtuCPrdhBnvcA=PX1d++Yh3u7mK_Jxmw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 7:05=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/7/26 12:44, Chen-Yu Tsai wrote:
> > The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
> > DRAM.
> >
> > Add a device node for it and hook up all the supplies.
> >
> > This change requires a firmware fix for the SPMI bus to read back
> > correctly. The required firmware version is 15842.175.0. This is
> > included in ChromeOS releases R150-16700.22.0 (available in Beta
> > channel as of writing or stable channel in mid-July) or
> > R151-16721.0.0 and later.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>
> This is a big problem then.
>
> I take it as if the firmware fix is not in place, probing the CPU power s=
upplies
> will fail, with all the consequences.

That's right.

> This means that with this, we're breaking all Geralt machines with older =
firmware,
> which is not acceptable...
>
> ...so this needs a different solution, or strong reasons to make me under=
stand that
> I'm wrong, if I'm wrong.

We can drop the CPU supplies (they don't matter since cpufreq is hardware
driven) and just add the regulators. How does that sound? If the firmware
isn't updated, the PMIC will fail to probe, but since nothing is using it,
the system will continue to work (with some annoying error messages).


ChenYu

> Cheers,
> Angelo
>
> > ---
> >   .../boot/dts/mediatek/mt8188-geralt.dtsi      | 66 ++++++++++++++++++=
+
> >   1 file changed, 66 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index f382f90c48f5..fea52c377d88 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > @@ -4,6 +4,8 @@
> >    */
> >   /dts-v1/;
> >   #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/spmi/spmi.h>
> > +
> >   #include "mt8188.dtsi"
> >   #include "mt6359.dtsi"
> >
> > @@ -241,6 +243,14 @@ &cpu5 {
> >       cpu-supply =3D <&mt6359_vcore_buck_reg>;
> >   };
> >
> > +&cpu6 {
> > +     cpu-supply =3D <&mt6319_buck1>;
> > +};
> > +
> > +&cpu7 {
> > +     cpu-supply =3D <&mt6319_buck1>;
> > +};
> > +
> >   /*
> >    * Geralt is the reference design and doesn't have target TDP.
> >    * Ciri is (currently) the only device following Geralt, and its
> > @@ -1156,6 +1166,14 @@ pins-bus {
> >               };
> >       };
> >
> > +     spmi_pins: spmi-pins {
> > +             pins-bus {
> > +                     pinmux =3D <PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL>,
> > +                              <PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA>;
> > +                     bias-disable;
> > +             };
> > +     };
> > +
> >       uart0_pins: uart0-pins {
> >               pins-bus {
> >                       pinmux =3D <PINMUX_GPIO31__FUNC_O_UTXD0>,
> > @@ -1267,6 +1285,54 @@ &spi2 {
> >       status =3D "okay";
> >   };
> >
> > +&spmi {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&spmi_pins>;
> > +     #address-cells =3D <2>;
> > +     #size-cells =3D <0>;
> > +     status =3D "okay";
> > +
> > +     pmic@6 {
> > +             compatible =3D "mediatek,mt6319-regulator", "mediatek,mt6=
315-regulator";
> > +             reg =3D <0x6 SPMI_USID>;
> > +             pvdd1-supply =3D <&pp4200_s5>;
> > +             pvdd2-supply =3D <&pp4200_s5>;
> > +             pvdd3-supply =3D <&pp4200_s5>;
> > +             pvdd4-supply =3D <&pp4200_s5>;
> > +
> > +             regulators {
> > +                     mt6319_buck1: vbuck1 {
> > +                                     regulator-name =3D "ppvar_dvdd_pr=
oc_bc";
> > +                                     regulator-min-microvolt =3D <5200=
00>;
> > +                                     regulator-max-microvolt =3D <1155=
000>;
> > +                                     regulator-enable-ramp-delay =3D <=
256>;
> > +                                     regulator-allowed-modes =3D <0 1 =
2>;
> > +                                     regulator-always-on;
> > +                     };
> > +
> > +                     /* vbuck2 is ganged with vbuck1 */
> > +
> > +                     mt6319_buck3: vbuck3 {
> > +                                     regulator-name =3D "pp1125_emi_vd=
d2";
> > +                                     regulator-min-microvolt =3D <1060=
000>;
> > +                                     regulator-max-microvolt =3D <1170=
000>;
> > +                                     regulator-enable-ramp-delay =3D <=
256>;
> > +                                     regulator-allowed-modes =3D <0 1 =
2>;
> > +                                     regulator-always-on;
> > +                     };
> > +
> > +                     mt6319_buck4: vbuck4 {
> > +                                     regulator-name =3D "pp0600_emi_vd=
dq";
> > +                                     regulator-min-microvolt =3D <5700=
00>;
> > +                                     regulator-max-microvolt =3D <6500=
00>;
> > +                                     regulator-enable-ramp-delay =3D <=
256>;
> > +                                     regulator-allowed-modes =3D <0 1 =
2>;
> > +                                     regulator-always-on;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> >   &uart0 {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&uart0_pins>;
>
