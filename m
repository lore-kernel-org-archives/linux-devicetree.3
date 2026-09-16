Received: from mail-ej2-f6.google.com (mail-ej2-f6.google.com [74.125.228.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE87750C294
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 15:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789572634; cv=pass; b=DkE8lHAZJEPgghvLGKBaazNBWEu4LUOOF74DutT5kA/Pasl6daTzvP2oF5rEi+uVq80IQH7VMvxNJSHIyvMRyGGrCUDZcYYO2JG/LtCshgDHr3t0PhMvnVnhhj8Sv0nEW9gblE1t5i3VgW1qzip6zkQazWGSbXKmuYRGz09kXqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789572634; c=relaxed/simple;
	bh=O3QLn2CpPoW3DrWyVcpQzdDveriLtVtFogD3GR0l6ko=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YkVhj1M2V8HbJwQHwwEOt80HzTMRpNrHJKa8WsW4rn/QH5GkNpAMUTsBQEE/TGAaNnsSlerxFcNgPgsL5yonGKAsbJ9y1TTKeki/9s0O26kNR7gnoBsZY3bT2xkUHMs6YKIh1g6SFhuxektR6YS8np3jG1OQ+mZ4ofx6iMIkIbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXb68Myz; arc=pass smtp.client-ip=74.125.228.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXb68Myz"
Received: by mail-ej2-f6.google.com with SMTP id a640c23a62f3a-c29440ee0e7so299891266b.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 08:30:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789572628; cv=none;
        d=google.com; s=arc-20260327;
        b=rM0axd8QSdPlJURm+1AKvVwEP5JiAf5Lg1j+J3LxSwRqib65hd/nw6/U4fbDPWG6OS
         l0LQRXvJDSWXOyXmbYvCkMTlvaDF/r4DjfoilGsKhQPSmR6q+U/i/UWw5vYULyoH6esf
         eMthrpKUMqHf9wc2LwFR3ixGhL5EuJqYQ5NMSA+hZX8kxw7ExiEdJMQOIzTFurF6bgwE
         YhDfd3cLR+aIbRD4Q212Qjey+ucBYlE2ezOOM7pVD9hJbRvTtKsTp7yTI+RBrg5vfQ6+
         NwIffiK8TsM2Sdnb8NIF0Wj3Ggo/AeXZ9MT3HwL4qHm7yI05WvHPSyqJAfeF+MCsCSX8
         oFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3iZhP1DReptHMS9Q1/qn9BvRZUgDeQPXvK/H8HNEb5g=;
        fh=4nXj6kn3mmZtuMBMudISXllqIQu4SUz+oNhCLAyuGo8=;
        b=jnmcv338rYlohL5UCUwtv6PA8lxeZ/vJPNYvrNIfdRiAEN4d2JbJHqOPUixf4cAyJz
         OQGhsUookCPt2tuwnHa9nLqIusl517Rp8/7BwhDQKsGMWyggxfBcmV1yT58/SWSNpSPs
         7D3aGLTRCzC3tLHMCzwBKqcrW2LwXHI7gGRGMl+XeFoZLzuu/JWxV3Ji1ruXOdcqGmiD
         5aMosh515dj7Lt+0oLxP6u8yVWJwPHqurAcvtOALceKrej8tKwO8niOWxtkN2uRYmcsH
         rSIf50GxKMkMgIZC8U06czkG3G0p9a7X8gcYM9by8Ybjh8HyI2/NUJvJJJuY+u5/QbK/
         zPTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789572628; x=1790177428; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3iZhP1DReptHMS9Q1/qn9BvRZUgDeQPXvK/H8HNEb5g=;
        b=lXb68MyzqMQFzdVyfKZcX59SOBDq9BWVhJABddx6JiJogkkAn4HkfJnPDuP2Y1AY6+
         CTTvuok73zJZs6jgzbpRqRgQ1b+VQpAIcOUBnq7Dd/ubbB/VSL3nWNaEMGBH4jFwYXe8
         MXZtG6RyD56+RomFJ80+W2kfXR4MbQ0rG7udXgW+5Vps2uDNj3qd3MgtFAZItM3J63Xt
         ROrBtTlQETtXQeE4qTCGWJ1PhYwzDQLkP12W4dGhMd9SImyMjm1AGj7opFchIlBNT5Qp
         A5Exhs1UKxu36WUtLeQhC3Gcq67DjnHPWNtWbQAq8Aluqm0BjdL8lYDf8QhdkJbJpVnc
         xgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789572628; x=1790177428;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iZhP1DReptHMS9Q1/qn9BvRZUgDeQPXvK/H8HNEb5g=;
        b=eexYp5w1rGYBOnh0yxrkx3xLxiftR3QIcu+lkJw4PG7wyi7XVrqZzDLCKh2HqQ06Tc
         Z1WV2687bkcd2fLjp6v3hDYJ3naKYOfOtRk2IvhmK8977e1/di+wMeMJyFV7U6WmnA5r
         npB3TMBieYoKS+KMgsxuwuCOv/vhykUYR/Y7+2o4r7RNaAa1+9+RIlN5YjbpOgw+UZ87
         aC97TAM9CW+6ih9y4b3zw4PxI6oGDTFfMxUJmvpbt31dPvdfev3gEylswHwoLnomGiUE
         aOg4PkXetSAB8UDx2ar/qCwy6KfU35VuuIxh3YtHIQU81ow0P3Mq6sS1WGtUPh0Pf5+r
         p3qw==
X-Forwarded-Encrypted: i=1; AKwUvBzBms1f7ZxtKhMrtcL+dJT1RKu4PKs9jcFGYFr+HFvjMs1bIvTSpWhjads0HiSKyEGsbwiZ2s8rbFBK@vger.kernel.org
X-Gm-Message-State: AFuF++nYRtYpVKqYa3US7zvexEv1agVuNOTcgUK3xsotmhygK1OVz8wb
	b/vkKsP8AhzVRdOxo9D5FlQHV5cYgg0VFyK3gzN/MB1k2ihrNNgeoszAXqrGgxIUI12AYE2LyfE
	B6gR0jSstNySDWv0s3sKTQrsM9gcs954=
X-Gm-Gg: AYBFou2kLPt6uTU0K2ywfSULMjCuyiiTo0xye84lceaiQ0EuWbkpWtE7oZjz4QciyFA
	KTtE54FejNuNPFlKAR7oPfhCC4VEUU5BloCVzckGEj69OcV/U47aGOOU6hL1pjGLGFbW16Ij2RW
	RtQ1GED186dhX8sXEzT3UqufMNRxUKI5RI7wvdlvI2FRNG6MAFZDM6jsljFDT4c6Irs5xw8Sw+w
	DI0Vop55sRH8oZUSN4Uk+oxffZIFnWJf27WErbEi8B6jWW8Rk2NPrl9dFvnllbQ6zj6s9mQmzKS
	nD8On98KYu7RDHPl2e6xF5/LJBPefJ7P26kuDxDq2JghAJ1stdYKXGRoTg==
X-Received: by 2002:a17:907:c49a:b0:c25:8e53:45ca with SMTP id
 a640c23a62f3a-c29e52bf59bmr425926066b.21.1789572627794; Wed, 16 Sep 2026
 08:30:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915123802.1561724-1-coiaprant@gmail.com> <20260915123802.1561724-6-coiaprant@gmail.com>
 <20260916145017.00DBA1F000FF@smtp.kernel.org>
In-Reply-To: <20260916145017.00DBA1F000FF@smtp.kernel.org>
From: Coia Prant <coiaprant@gmail.com>
Date: Wed, 16 Sep 2026 23:30:16 +0800
X-Gm-Features: AcwNN1VAHr5mQCG8cyXXjxTi5LTBgNFWZMnSTKdoeh45_aT0Zqjxqq28yQF9Z9M
Message-ID: <CALj3r0hA00u7E-N8o+rkMae_8wHt9s=EfAcHO8TE=ERHKmmYWw@mail.gmail.com>
Subject: Re: [PATCH net-next v6 05/11] arm64: dts: rockchip: rk3568: add XPCS
 and fixed-clock nodes
To: sashiko-reviews@lists.linux.dev
Cc: vkoul@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	wsa+renesas@sang-engineering.com, olteanv@gmail.com, 
	devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=97=A5=E5=91=
=A8=E4=B8=89 22:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dts: incorrect fixed-clock modeling for XPCS generated clock
> --
>
> commit 18edca8a678c045ba2fe3270b1f3ca0505b94baa
> Author: Coia Prant <coiaprant@gmail.com>
>
> arm64: dts: rockchip: rk3568: add XPCS and fixed-clock nodes
>
> This commit adds the DesignWare XPCS node and its sub-nodes for the RK356=
8
> SoC, mapping it to the APB3 bus. It also adds two fixed-clock nodes to
> provide reference clocks for the GMACs when operating with XPCS.
>
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568.dtsi b/arch/arm64/boot=
/dts/rockchip/rk3568.dtsi
> > index 3bc653f027f1f..227d03e336043 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568.dtsi
> [ ... ]
> > +     clk_gmac0_xpcs_mii: clock-xpcs-gmac0 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac0_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
>
> [Severity: Medium]
> Does modeling the XPCS-generated clock as an independent fixed-clock bypa=
ss
> power management and dependency tracking?
>
> Because the clock framework has no dependency link to the XPCS power doma=
in
> (RK3568_PD_PIPE), it seems it will switch the GMAC to this clock even if =
the
> XPCS block has not yet probed and is still power-gated.
>
> When the GMAC device uses this via assigned-clocks, the driver core switc=
hes
> the parent clock before the GMAC probe function is executed. If XPCS is
> absent or uninitialized, could switching to this unpowered clock hang the
> system at boot time?
>
> Would it be safer to have the XPCS or SerDes node itself act as the clock
> provider so the clock framework properly tracks power domain lifecycles?
>
> > +
> > +     clk_gmac1_xpcs_mii: clock-xpcs-gmac1 {
> > +             compatible =3D "fixed-clock";
> > +             clock-frequency =3D <125000000>;
> > +             clock-output-names =3D "clk_gmac1_xpcs_mii";
> > +             #clock-cells =3D <0>;
> > +     };
>
> [Severity: Medium]
> Is this second XPCS-generated MAC clock subject to the same decoupling fr=
om
> the XPCS power domain as the first clock?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915123802.15=
61724-1-coiaprant@gmail.com?part=3D5

Thanks for the review.

The dependency is enforced by EPROBE_DEFER instead. If the XPCS has not
probed yet, pxpcs->bus is NULL, xpcs_rk_create() returns -EPROBE_DEFER,
rk_pcs_init() propagates it, and the GMAC probe fails and retries. The
GMAC cannot reach a state where it uses the XPCS clock while the XPCS
is unpowered.

On the assigned-clock-parents path: fixed-clock has no provider driver,
so the clock framework registers it during early init. Switching the
parent to it only updates the CCF parent pointer and does not touch any
hardware. The actual clk_prepare_enable() happens in the GMAC probe,
by which time the XPCS is ready.

Making XPCS a clock provider would require a clock controller driver
for a block that has no controllable clock output. fixed-clock is the
correct description for a fixed 125 MHz output.

Thanks,
Coia
