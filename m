Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A818B403AE8
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589281; cv=pass; b=uGobd7I/hg5X6y6rtOzdn+jHUOd+sLRHtNEnRMC/fttMMOkC+lLmlHTp7J2OJo066CTwOK1wvUgC6pkrna/7+3rvz9y1au2Cbrw8YaoHkMTEugZmk+jKSdrSaGUoJzqr6cDbNaK7/MOxs05RZtBMmhAdqDxB8i6pMgrmUwqjhX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589281; c=relaxed/simple;
	bh=mekk8Qs9paOr/JOz+cCQQowV22V0kdNKPamGxe5W2bU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlU3fuyJSIEZgmbkKG/qzF4hhopqEMXADKkwdwTG/Aasm96fuJpLyP+QaPgHrv4DEIgViWueQ2u84AstgTdkC35x5vw5lq6JJbJTdicNYI11iPaBvSEwtczZt1F1b/Nfr15eLfpYbM4um/6QuG5w2uxj46B/oBydFWefaN+LEXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Pta5oDD0; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Pta5oDD0"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-66628618509so976142d50.2
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 02:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783589271; cv=none;
        d=google.com; s=arc-20260327;
        b=spcf79aU9wcXl0loX2Zwy3uGaor2nAWAK4F5UYrh5PJAENMN0y4ex/O8IMKA+8HCxT
         ZiG++sH0uUjo1acoLJ1ShMyYKc9PsdqoOm7o+6/uQMAQE43X6lUAIVtT2tRNF4uqUuC7
         j705Hce2O+t5gKKfJtYWfupWDCns3Thobaek6NlIAwyR5PzICEPSyBTuV+nc74kis0QU
         rZxuelBOW7lsTF1QACMsRnnBTmjw0fcx2JCfzQhbNak0EF4PIz4gkkYPPV4A7zyBUPKg
         IX0W6zHksZ0pJAaF9+QDDsIGZXJxtypYEovxbSCIYBdNOu2d5xb7/WdANsgF/tqrHMcD
         9Geg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=74c3zDUYj1sq4/rZ6bxjy4uiRjT7W3hHmw8hfbbGZdU=;
        fh=Dcsate2Q5+LeS9EBFWreJHWg2I7PTdSXNFgEHIV76Us=;
        b=UagNm2awZTib/7efDPomOm6kbYGGJarJBzZoDhvrX4qGe/AUdyvQONowk0fEqF1ULK
         fgJR8csDRaQ7nMnUEm44DWbmBT+tmwmyRKE0CEFs+7XQ/+PBnULk/gQv5rb2CQ0GO8s9
         +hBKLfzp/mX3ZyTmFtxsoCj2tyqKjFtDOKPU1TwFKnrGGgxBtQR1Cr0kX/ldq3NISaNu
         adwtWw1BtV4iiSdvn0cUCAKS6emuGqK/wW3bl8GeZpvS78pOyVFMkaEXWFYUdZZJDPuO
         9YMmTOpfeDXqwGwguW9OuTqrrChVOPwb/zyEkmL6nmIWchV4yCrVtHsoTVbk6j+bHkIP
         txHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783589271; x=1784194071; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=74c3zDUYj1sq4/rZ6bxjy4uiRjT7W3hHmw8hfbbGZdU=;
        b=Pta5oDD01+qqIiCQKZxYoV7CXTd9/YDc+ExqWz/u9YbuO+rYq3V9nt2jiZhUpI8fNf
         5kYIXrJDZ8B1pKnjVvxzyaxeZQ49YEB6sqXd1twA0qvoFsvLni5SzZWWPJ3lBlfKVIJw
         IA0dyYW70iyzh+d0Nzi6M/AmGSd1HgJoYmZjI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783589271; x=1784194071;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=74c3zDUYj1sq4/rZ6bxjy4uiRjT7W3hHmw8hfbbGZdU=;
        b=ELHcZRYhllcOwhzwlD6fBNYBbF/dn6PeS4y3V6UzvKwpyrGZibNo0Yt8nGH4KkRLtT
         iCt4VYDdPwavbI9r89zic4enI8xNUMuLWWwqiSw7hWu+0eEWEkmo/KBv8KAiHLt+gtTb
         RSkigHOnwli9ISYIL7NfKPDnM2Z3zU+eGi12nxIbXcCsgFdo4hDi5k6xTYoXpWZP2nQw
         3gKIxCl04aDadciRx0BlnqiROZseEbfTfiYFNMW0CNjfVJHyhMBlVZSV/w77/XK+5isV
         2np5a6eZEolLIGmp3RDIbNqzVN9fy99SHGkCbfHyYp0zDEJWRYWbDp3QjiHa83zQES7W
         jXQA==
X-Gm-Message-State: AOJu0Yw4g7R+W8sqyQsYk/9SRnklJ9WLqWFoInU6faCJIZFGDWCKkl2S
	CxiDkgOiGE7cSnAoLXDLxI112rgR1wy4xBxTfFnmjd4gjj8OE9swrYAw3gsJaiSB1P9lbe0Mmfa
	BkSVZD+EjnJiyBDN3pO/IcaHF4sOciHgYSOpnkS4p
X-Gm-Gg: AfdE7cnIvfjCjb9xyM5vj6dbCEOhSuQOt7Dl843LdjH5YAaOq2AmbSffZ5IfA4+kEj+
	XRPKJVGw303e1gdzVNN5WQzxc1bQekfPqfbYxxrrILAyUVYZ4T6KSsiqhyAewT26wVFlW9lPV3T
	sy2dVd5QpBQzvIPUHtAxx5730WhnaGO/45FrUI8X83aizSesmRWt/lWMikIBflEWXRyRBfkE87J
	Nxe9+9VGyjtIkx3lJjB1tj34LQwCGMGkuNPVe/uB2vG/ET1rdwOZ+74bv4ok9nSXy4FP58ff9fz
	qmthrBemHZqJPd5zL+Ww9q0Qp38=
X-Received: by 2002:a05:690e:134a:b0:667:b262:16bd with SMTP id
 956f58d0204a3-667b26234b2mr2825271d50.81.1783589271117; Thu, 09 Jul 2026
 02:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709081928.612294-1-wenst@chromium.org> <20260709083024.330381F000E9@smtp.kernel.org>
In-Reply-To: <20260709083024.330381F000E9@smtp.kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Jul 2026 17:27:39 +0800
X-Gm-Features: AUfX_mx_3xgToBgzkBmOX1DPVDvwVrzb4et6fk5WWd8Ysjgsr4mMAnsSLQdDprs
Message-ID: <CAGXv+5HO5eWaJ-AhH9JG=aZ9f_se8L8Ebz-NRHfKMsNXvGnQTg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
To: sashiko-reviews@lists.linux.dev, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 4:30=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] The MT6319 PMIC fallback compatible triggers incorrect MT6315_PP=
 mode ganging in the regulator driver, causing silent cross-talk between th=
e CPU and EMI VDDQ regulators.
> - [Low] Grammatical error in the comment explaining the firmware workarou=
nd.
> --
>
> --- Patch [1]: [PATCH v2] arm64: dts: mediatek: mt8188-geralt: Add MT6319=
 PMIC ---
> commit 0ff94c6622559a57199ed1f2d1f4063c6c911df1
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> arm64: dts: mediatek: mt8188-geralt: Add MT6319 PMIC
>
> The Geralt design uses a MT6319 PMIC to power the big cores and LPDDR4X
> DRAM.
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index 8e423504ec052..af05315092f53 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> [ ... ]
> > @@ -1225,6 +1235,70 @@ &spi2 {
> >       status =3D "okay";
> >  };
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
>
> [Severity: High]
> Does this fallback compatible trigger incorrect mode ganging?
>
> The mt6315-regulator driver maps USID 6 to the MT6315_PP variant, which
> hardcodes mode ganging for vbuck1, vbuck2, and vbuck4. On the MT8188
> Geralt's MT6319, vbuck4 is wired as an independent regulator for
> pp0600_emi_vddq.
>
> If a mode change happens on vbuck1 (which is allowed by the
> regulator-allowed-modes property), the driver will apply the ganged
> mask and silently overwrite vbuck4's mode bits in the PMIC, potentially
> forcing the RAM supply into an unexpected mode.
>
> Could this silent cross-talk between the CPU and EMI VDDQ regulators
> lead to memory voltage instability?

This discrepency is actually bigger than Sashiko mentions. The ganging
supported by the driver only applies to the PMICs in the Asuarada design:

  - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
  - SPMI ID 7 has 1+2+4 (big cores) and 3 (little cores)

On the Cherry design we have:

  - SPMI ID 6 has 1+2 (GPU); 3 and 4 are unused
  - SPMI ID 7 has 1+2+3+4 (big cores)

On the Corsola designs with beefier chips:

  - SPMI ID 6 has 1+2 (big cores); 3 and 4 are unused

On the Geralt design (this one):

  - SPMI ID 7 has 1+2 (big cores); 3 (DRAM); 4 (DRAM)

Any ideas on what to do about this mess?

Another thing is that I kind of wonder why the mode configuration register
setting isn't ganged in hardware like the enable and voltage settings.


Thanks
ChenYu

> > +             pvdd1-supply =3D <&pp4200_s5>;
> > +             pvdd2-supply =3D <&pp4200_s5>;
> > +             pvdd3-supply =3D <&pp4200_s5>;
> > +             pvdd4-supply =3D <&pp4200_s5>;
> > +
> > +             regulators {
> > +                     /*
> > +                      * vbuck1 is the cpu-supply for CPU6 and CPU7.
> > +                      *
> > +                      * However, this device originally shipped with a=
 broken
> > +                      * firmware that causes register reads over SPMI =
fail.
> > +                      * This is fixed in firmware version 15842.175.0,=
 which
> > +                      * is included in ChromeOS releases R150-16700.22=
.0 or
> > +                      * R151-16721.0.0 and later.
> > +                      *
> > +                      * Assigning the cpu-supply properties for CPU6 a=
nd CPU7
> > +                      * without the fix will likely cause CPU DVFS to =
stop
> > +                      * working. Hence the assignment is left out to a=
void a
> > +                      * regression of the function. If the user is con=
fident
> > +                      * that their system has the fix, they can added =
the
>
> [Severity: Low]
> This isn't a bug, but there is a typo in this comment. It should say
> "they can add the property themselves".
>
> > +                      * property themselves.
> > +                      */
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709081928.61=
2294-1-wenst@chromium.org?part=3D1
