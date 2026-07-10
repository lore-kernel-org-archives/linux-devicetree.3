Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732D33E274C
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783672160; cv=pass; b=S/uCN4aiSTTaHJIuC9zQTr+h3h04uRCJey9HLVlVBuIjfDua1eAWpthaBwwmXvcIL8H7pbgIsjpEJYI7/RyepH6bmbbC4ClsqN0LhLOOawMjdVTXo6OC2KriE6c32Y4dt3sdLYTy2yH3mBj3XzGkuA4eE6/I1ThNpZE6pyZnubY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783672160; c=relaxed/simple;
	bh=p0/dPgVbPuapVdCqzOBsxdrszU2WBAq4JUc01Bho6Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKRyOcaacMxd2+JnWOkBqLBXlt+XOt6w9sDlMhTH8SjkNtwCPYBh9lj+ak/VFkW+3GxDR5x+tHHlb5yw+PExOeqza0jydFLD6Q2553wZU+wmrxXgoq0kHDyzaWBeEZG4wK2pgS2Zy7S064Qmt5JSyukEVRWQf6vhB6LY1EMg1ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DG5NuFOx; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DG5NuFOx"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6676fc59e59so936643d50.2
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 01:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783672157; cv=none;
        d=google.com; s=arc-20260327;
        b=Aq90e0zRh0Y4eE24mYUkoreAWXRC//72sTos0Ajo1UJnfmq9bxgkEIsg29XA0VnUgd
         8egDZde2kB8GUPjCEq8f8tdEtr8pKDFPwFt4LEDxs9EDQjJz71mgOd/tSLaidFGlwj7E
         ThdVdsEu41Qiecq72SNIafQQTOAFYHIjVWjYoJfeml5T5fL7rGbaKi+XEBfSPcILkC8+
         cGRPra3thq6CtWuOfVcoIS9xii/xFGya+LAfuzQuN+9+5LuvwyB8cVL4eIAQSwDAgPTI
         jJbFdO8p8PbOhXUPvSDia1RiVK0IZcCDHdLR36RetXx2HhdcA3PH73ie5/Cz91ci9Xd6
         Jt8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yg3WIUMjqkv5biKdZK6h43CMAQuq2sky4pwK8+fCYuk=;
        fh=noB+HTn8YIA8Ex7Zfd5qogjOrBj66hvgaLKtfXEB7Qk=;
        b=irPiV1tNMJOOS1ea58TgYoi65qa9xoNjsEyVt44uRLilXV1vmN/BS15oGDy0QiXYwZ
         tDuOz3QQUYTx1zRhNpGdxfi8xSvE4fCHho/7Aq79ZT2SRqqH0KdkrCBQRpq9bRSOAU50
         t/NhdJBHAgNNv4bTMhiR61aEuToAbYENyUcfyXr2oaO0cwNt68dRTRGpS+6ELOSdIsXQ
         r5Yp0VyeLvgqoOpvFVH6xI6d/e3j2En6KcFhsv7JAggSq2dXdOjVuMHpZ/KQXX0BopDT
         x0v0osgKFNfgIIu9t92rF14LtvDiliKGv51cjIv4Ni80VzwmzO8IXZ0PnGgZRNBJnKsY
         Vlvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783672157; x=1784276957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yg3WIUMjqkv5biKdZK6h43CMAQuq2sky4pwK8+fCYuk=;
        b=DG5NuFOxH0D8+moeU0jCbuvptoyhgKE2aUoGgv3JFafCTDg/V9SBwliFjvsfs3ZDpc
         b6OgsZekkjNdtrbQZYh/rTvz0t1AJj6oL5M7S6BbHDZXlB63NFRRzFwICX5aNLn++IiK
         5egf1r9kPNDAVhWwzguFZ7DV8Oll2xvs8Pkh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783672157; x=1784276957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yg3WIUMjqkv5biKdZK6h43CMAQuq2sky4pwK8+fCYuk=;
        b=hKZKi3Gdtov0gja/Avtn6cg68+2XS7XY3r2/D6qLqSpDxeKSV7OrSmQ14fACgn7nkw
         Pa1mFruiMWw9BscFtj+/wwo5IZbwahU7P+CoGwExxfBKGKc67EbB058Ek1SjjJyPPYME
         HbgIaUT5f04Fw2KfYi+tP0SJgZfnLGT1klnTtI7MG92FUm2Q/jNLBZc6+pRmvxZ6cvJJ
         EPw9Q43N51t4P/MATOsUfG2VkHgkIUMq9rizPke4GHH9o5VAFoWr0IZnMQwaDeWoO0tA
         TEfBsOtyRBJq3FXNgJuvl1Jn58WHijpOYGnqxFx6J+UncsQBD298Y9jcBidjtbDOsVPH
         XmjA==
X-Forwarded-Encrypted: i=1; AHgh+RoG4xHmROyuO4gn1MFbmQt0TOyxrrvaMsFqigAfXC9xZkTiQndxeON6Icxejbenoq4EGpOVNUb0jJvX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3xqt+Z2oSk62UGxT1+Ft3DeUMlyrxgHS2p+PWTZuh+4Zoevtl
	GtUgIsUtn3T4CEYWPbrdce3NRKktAa6lI2wrTh0jo3UILSsxdf4EhwFW768zq3PY+9UD/AoZN5c
	pGpNLwJfHhHck6c58NzTrlsKQuGsp8gKPcHvSHX+L
X-Gm-Gg: AfdE7cnbRRANxnbFjKdT7w6UkxeWlgzTHWf776PVQmxO2bs3LEhbvjZLz1J+sN1UP2M
	ZTJcgChf2nlBa54U9OnOl5VmX25zkLgelF7mBPNemCztTO7zYlRw9guWM7XbA2BmWxa6VUHFswO
	s4TLuEzf1GpmU4gl/MoFcZzZt9HSMdzFIgUVU7kU9iLmXqSzRzugotfpcimdiLcxduwukjSQJiT
	3LHm9qMKtavpkHbr80S+hsRQHNzb+g8so5Vc1sVaW8C3NogdZUuyEGTRFYtktl9z44lKdaq/Qo=
X-Received: by 2002:a05:690e:d44:b0:667:8a32:fae1 with SMTP id
 956f58d0204a3-6679f0a52dcmr6501916d50.41.1783672157223; Fri, 10 Jul 2026
 01:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709081928.612294-1-wenst@chromium.org> <20260709083024.330381F000E9@smtp.kernel.org>
 <CAGXv+5HO5eWaJ-AhH9JG=aZ9f_se8L8Ebz-NRHfKMsNXvGnQTg@mail.gmail.com> <be903cb1-8184-4112-9672-ea262716e5b9@collabora.com>
In-Reply-To: <be903cb1-8184-4112-9672-ea262716e5b9@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 10 Jul 2026 16:29:06 +0800
X-Gm-Features: AVVi8CckLfX-jPmLiB6-FBxM08KapSlFQ-lWffFShhwa4hHsSl2udMCCyyq6MUY
Message-ID: <CAGXv+5Ey+hvVZP-wu3-5oSwXQ9Rdxr8kf9BuiA-Qr3_px7uPGg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mark Brown <broonie@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	conor+dt@kernel.org, robh@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 6:52=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/9/26 11:27, Chen-Yu Tsai wrote:
> > On Thu, Jul 9, 2026 at 4:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >>
> >> Thank you for your contribution! Sashiko AI review found 2 potential i=
ssue(s) to consider:
> >> - [High] The MT6319 PMIC fallback compatible triggers incorrect MT6315=
_PP mode ganging in the regulator driver, causing silent cross-talk between=
 the CPU and EMI VDDQ regulators.
> >> - [Low] Grammatical error in the comment explaining the firmware worka=
round.
> >> --
> >>
> >> --- Patch [1]: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6=
319 PMIC ---
> >> commit 0ff94c6622559a57199ed1f2d1f4063c6c911df1
> >> Author: Chen-Yu Tsai <wenst@chromium.org>
> >>
> >> arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
> >>
> >> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4=
X
> >> DRAM.
> >>
> >>> diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/a=
rm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> index 8e423504ec052..af05315092f53 100644
> >>> --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >>> +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> >> [ ... ]
> >>> @@ -1225,6 +1235,70 @@ &spi2 {
> >>>        status =3D "okay";
> >>>   };
> >>>
> >>> +&spmi {
> >>> +     pinctrl-names =3D "default";
> >>> +     pinctrl-0 =3D <&spmi_pins>;
> >>> +     #address-cells =3D <2>;
> >>> +     #size-cells =3D <0>;
> >>> +     status =3D "okay";
> >>> +
> >>> +     pmic@6 {
> >>> +             compatible =3D "mediatek,mt6319-regulator", "mediatek,m=
t6315-regulator";
> >>> +             reg =3D <0x6 SPMI_USID>;
> >>
> >> [Severity: High]
> >> Does this fallback compatible trigger incorrect mode ganging?
> >>
> >> The mt6315-regulator driver maps USID 6 to the MT6315_PP variant, whic=
h
> >> hardcodes mode ganging for vbuck1, vbuck2, and vbuck4. On the MT8188
> >> Geralt's MT6319, vbuck4 is wired as an independent regulator for
> >> pp0600_emi_vddq.
> >>
> >> If a mode change happens on vbuck1 (which is allowed by the
> >> regulator-allowed-modes property), the driver will apply the ganged
> >> mask and silently overwrite vbuck4's mode bits in the PMIC, potentiall=
y
> >> forcing the RAM supply into an unexpected mode.
> >>
> >> Could this silent cross-talk between the CPU and EMI VDDQ regulators
> >> lead to memory voltage instability?
> >
> > This discrepency is actually bigger than Sashiko mentions. The ganging
> > supported by the driver only applies to the PMICs in the Asuarada desig=
n:
> >
> >    - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
> >    - SPMI ID 7 has 1+2+4 (big cores) and 3 (little cores)
> >
> > On the Cherry design we have:
> >
> >    - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
> >    - SPMI ID 7 has 1+2+3+4 (big cores)
> >
> > On the Corsola designs with beefier chips:
> >
> >    - SPMI ID 6 has 1+2 (big cores); 3 and 4 are unused
> >
> > On the Geralt design (this one):
> >
> >    - SPMI ID 7 has 1+2 (big cores); 3 (DRAM); 4 (DRAM)
> >
> > Any ideas on what to do about this mess?
>
> wenst, I think that the only way to fix that properly is to add generic s=
upport
> for buck phases ganging in the regulator API... because AFAIK there's not=
hing
> right now.
>
>  From what I remember from last time I looked, MediaTek PMICs wouldn't be=
 the
> only ones, there's something else that also has ganged bucks, and again i=
f I
> remember correctly, I remember seeing one platform data struct for each o=
f the
> ganging combinations in that driver.

Grepping through the kernel tree, I see LP8755 and TPS6594 having multiphas=
e
settings. Not sure which one you saw. Also, some of the X-powers PMICs used
with Allwinner Socs also support multiphase. For these we currently just
read out the multi-phase setting from the PMIC and don't register the
regulators for the secondary phases; however it seems with some recent
project, we actually need to program the ganging from the kernel [1].

> So.. especially because MTK wouldn't be the first, I think the addition o=
f some
> kind of generic properties (and callbacks) for this kind of configuration=
 in
> the API would be both profitable and welcome.
>
> Mark, any considerations?

Quoting Mark's response:

> > Unlike separate regulators that are ganged together, in the AXP PMICs i=
t
> > seems that when buck outputs are ganged, only the controls for the firs=
t
> > output have any actual effect. In such cases I don't know if we should
> > just ignore / leave out the secondary outputs from both the description
> > and the runtime state.
>
> This is very common, I would expect any regulators that are ganged
> together into a single regulator like this to simply not appear in the
> DT.

So if specifying polyphase settings from the DT is needed, it would
probably be some custom property, either under the primary phase, or
at the chip level. (Because the secondary phases would be absent from
the DT, one can't just reference them using a generic property.)


ChenYu


[1] https://lore.kernel.org/linux-sunxi/20250919000020.16969-1-andre.przywa=
ra@arm.com/

> Cheers,
> Angelo
>
> >
> > Another thing is that I kind of wonder why the mode configuration regis=
ter
> > setting isn't ganged in hardware like the enable and voltage settings.
> >
> >
> > Thanks
> > ChenYu
> >
> >>> +             pvdd1-supply =3D <&pp4200_s5>;
> >>> +             pvdd2-supply =3D <&pp4200_s5>;
> >>> +             pvdd3-supply =3D <&pp4200_s5>;
> >>> +             pvdd4-supply =3D <&pp4200_s5>;
> >>> +
> >>> +             regulators {
> >>> +                     /*
> >>> +                      * vbuck1 is the cpu-supply for CPU6 and CPU7.
> >>> +                      *
> >>> +                      * However, this device originally shipped with=
 a broken
> >>> +                      * firmware that causes register reads over SPM=
I fail.
> >>> +                      * This is fixed in firmware version 15842.175.=
0, which
> >>> +                      * is included in ChromeOS releases R150-16700.=
22.0 or
> >>> +                      * R151-16721.0.0 and later.
> >>> +                      *
> >>> +                      * Assigning the cpu-supply properties for CPU6=
 and CPU7
> >>> +                      * without the fix will likely cause CPU DVFS t=
o stop
> >>> +                      * working. Hence the assignment is left out to=
 avoid a
> >>> +                      * regression of the function. If the user is c=
onfident
> >>> +                      * that their system has the fix, they can adde=
d the
> >>
> >> [Severity: Low]
> >> This isn't a bug, but there is a typo in this comment. It should say
> >> "they can add the property themselves".
> >>
> >>> +                      * property themselves.
> >>> +                      */
> >>
> >> --
> >> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709081928=
.612294-1-wenst@chromium.org?part=3D1
>
