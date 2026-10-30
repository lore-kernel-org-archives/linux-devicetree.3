Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793357510;
	b=ti1VRTwyjc7pw/jsFmucPOeg6+tDyAg26jRw+X6mLDQlLb8rIXl6GGjBsrhKV9am4K5e
	 GrtPIHFIM1Wt4LIljExb27YcaYsXf/ovF5ZSsmtSNiVmo80sP2OIQt5GC8RT20cEcsUPE
	 of6R/+ELgHRWv3Ee5x1YF/I2uNqBW2Sfkf5JgV4kOGyeS5fIKEDkQ8aUkQJLDN01/Hvef
	 NhmasayPFh2WC9GcRqQJJMVk8bfnL34agCxmeGfvzwhAys9p4hoBA+ZrfOXr49nvF3qYK
	 2EIvvzjnAyLxD8ZZiYZjAVZPc3AKNcysDUYkvZIK7VgSC1tZyMDG+6b5ULlFp9Pu0pQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=vjqb7aOYYDJNIVxBP1D95TfPNom/ysDepCvkxpveSIQ=;
	b=dLPu9VScyvj/F4KLyGlU3ii4/fUCg2YuDIADMmLKwyOZmgjElO58uS9F7VyDUPx49wPs
	 RC53XkLUKAE/OcoFaEruQKQ7wPoWP45sPN5mJkTtJS7TVgyEiwlOmcaT2HR+u9yny8d9c
	 gIXO07SxvXGxsh8PdAJTuQ/L25Je2iVH8WOQlKibElkIX3dBqvjmsupTosSDqGXzgAb5U
	 wPSQmnNQPaF+/o/u8+la9qb7XLqwtF+bqqIr58gEHflnAmCQ/Xql+Per8GZY/mKSLocHA
	 yqTU2jD/rtTQ0Xq86D4hLWipn/7MKY7u44fepPgpy1NRDv05bBg1RGZM1N7RXeJkVYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="FJ1u47j/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859D9606AC24
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 10:51:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 859D9606AC24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=FJ1u47j/
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8ad98c3fb15so4684457b3.2
        for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 03:51:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793357508; cv=none;
        d=google.com; s=arc-20260327;
        b=pmq4PY/ycjUel/CFsf7HLu0//t5LhsDA5HIdZL4GVyWaSvX5+Bswdbc7kx4VbF0WI+
         8+k+fxd3aOrGbo64pwVrkdHkQLf/cvk4mw2d8QAEpLd0BDcFiZD8s82kR7wmVzqcUSHI
         V2xMHBnlELberbZt5WJpAo3Zw0RO8tOBEHBOm+rpk/H5BkSRNp0KQWaEbFIO6LOVVPm1
         tY8aaLUntG6KqVS36087A7HhvWo4XI7x1X7z18GedWKCOQ4eQikiXa4h5t5HcFS/HPuz
         nhBbuCphL7RU9pPykiXsBNyeqS4ft7YSuaFUEjR3DgWgO+Cs+W76BOhoILc0nNI9goUk
         O89g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vjqb7aOYYDJNIVxBP1D95TfPNom/ysDepCvkxpveSIQ=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=gPigq5G3G+1YDVpTTUEk5lqkjPNJrwtJ1Zfal/+Ys7XdfrOVcEnrwdgipf6l+Oy65L
         I8QsLMSaurwsDwoSQBRAfcDIo1Dku+dnVIa2sVqacSjuT3s5O4HKWdhsH5w966czvKs/
         Bg/yIV+O+m8/YJK+XP8hGdUx6rduY6I/I5Bw6KTdqR35gpipHvL7LsW9C3dNzh0C8O5g
         W0RQx5KPwX0n6bN0QvOmOCi0kAbhR2Lr8BVA/FWPNsfvFOB5xZlRnJKxPVhOoHqC29rU
         tIKwFGfUQQzH7deibQDPvRzflFKTsYyxGkdU9ZzeqAbTO1+NhOE0I6D3NZr/t7rcaAt4
         VdyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793357508; x=1793962308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vjqb7aOYYDJNIVxBP1D95TfPNom/ysDepCvkxpveSIQ=;
        b=FJ1u47j/URdVJkqvDM5TrTNUEqopLH248C0DWIBv+OHU1vmIT5pHrDSiGAczbnhK5b
         9hrXs8GkNjVcPPF14nmSaDtCMbyRwP0KO+uGNeVIVLOGb1lmD3oSclqzjnd17L5HPcEu
         Zk3dLH7xUzI+j1eeQvJtkf+cyaF5FZMb64/ZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357508; x=1793962308;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjqb7aOYYDJNIVxBP1D95TfPNom/ysDepCvkxpveSIQ=;
        b=pmWhVcktjwDilZrKp3S5KtbJosmgtS+k3u+bDi1lE/f7ofRZqajdXVvB67WaJ9lOpZ
         63JDwXj5Fi88FGIi9CsBSmfg4U2XFlWmq5jQ0FCDI8mDCe+N2EwBv579NCZr3jwUqUpw
         8Jy1awiKZVp3yznQepzqfE3aAdmW5GEXgZGOIOwm4Xvqzvdy43KlX87pvVPetKGDz4k3
         nix9bThSLuoFEqj4TGi2ZnCMTHqpvTZBi3008+Hetn3qLdDrCpjXrtIBGhTPfn8/JPps
         CZa5rrZ9gL681StpMEU1PMLQvmfdPDzf9sOlqcipnjl6+J5Rm9C+ZnJaLDU5TmL38PXQ
         HyBw==
X-Gm-Message-State: AFq9FYLR1cqtUmmDsfGE5L+x2kIqcvNH2kmlpbcVhYkHYsIMzrmgoZMO
	34y207mX11V08+bhp66hTApDRa1ZMIdzYMGJvp4FFz3Ngge1Pn+rjcy6AtxJWA+95jH+NngCe5a
	e0d7/wHnJ2q4+5JSdFVIUlvN9Ge6/UJbJsF9J2ALg2ZwIH8rhcC4=
X-Gm-Gg: AYBFou1jt3NqZgUui76NHuYrrPvVwI0jdeSx7+ihzJMB95ECSiWFzC8WJsBKyvt0j7T
	wJOJi2iPqiRwV3fBQJopo2yRIB+K1T67CqG+TGKkb2W3frY1a2+SiCkkHwsHoCMlD8im2z1cAC7
	23TaX9XdQJMwtNg9WxPR4rrcHT13cgtqnS5IUyXV+cjFOFwpxO3yZRUuk33lXKNu/1qAhSS5EHf
	DRM9DH0G0Gw56MnThXpaboufTHyXugLY1yRqGfEdfkDRGB3TqFlfGw7huVogjryaClJFksN85OP
	hKiRqPeK29jr6N0JmjWOMptJdWlCe+7vqKuX8+kESEFXXvUGYfA6nL06MMVMmj9H7fuv5S17ISR
	yr9dhxxlbzTIYr0sD6aUvQF0E/gUndwXn748ayeL9TEnWg98JSyoqXSeweMQfYttqHkE=
X-Received: by 2002:a05:690e:13c9:b0:677:b7a7:ba38 with SMTP id
 956f58d0204a3-67ba4c806b6mr1739398d50.14.1793357508542; Fri, 30 Oct 2026
 03:51:48 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030103418.2355854-1-wenst@chromium.org> <sashiko-outbox-190860@kernel.org>
In-Reply-To: <sashiko-outbox-190860@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Oct 2026 18:51:36 +0800
X-Gm-Features: AclHuK8dRbUC9YjGydnlkhS_CrQ4_pwnqLdh1PdQaR9I-6NADrsb2t_rTfbCb9g
Message-ID: <CAGXv+5EQTvKWYQOWEbW_EKRK98mWdVhtXd6AogifcW-NkDm8Uw@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8192-asurada: Add ramp-delay
 for MT6315 regulators
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 6:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] arm64: dts: mediatek: swapped regulator-ramp-delay for Vbcpu and=
 Vlcpu
> --
>
> commit 810dcac6146b830cb56f853c88e0887dc012ef9d
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> arm64: dts: mediatek: mt8192-asurada: Add ramp-delay for MT6315 regulator=
s
>
> This commit adds regulator-ramp-delay properties for the MT6315 buck
> regulators (Vbcpu, Vlcpu, and Vgpu) on Asurada to ensure voltage increase=
s
> settle before switching CPU or GPU to higher operating points.
>
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/ar=
m64/boot/dts/mediatek/mt8192-asurada.dtsi
> > index 40d34b16dc807..68d84fc55767b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
> > @@ -1500,6 +1500,7 @@ mt6315_6_vbuck1: vbuck1 {
> >                               regulator-min-microvolt =3D <400000>;
> >                               regulator-max-microvolt =3D <1193750>;
> >                               regulator-enable-ramp-delay =3D <256>;
> > +                             regulator-ramp-delay =3D <4500>;
> >                               regulator-allowed-modes =3D <0 1 2>;
> >                               regulator-always-on;
> >                       };
> > @@ -1509,6 +1510,7 @@ mt6315_6_vbuck3: vbuck3 {
> >                               regulator-min-microvolt =3D <400000>;
> >                               regulator-max-microvolt =3D <1193750>;
> >                               regulator-enable-ramp-delay =3D <256>;
> > +                             regulator-ramp-delay =3D <8000>;

It seems like Sashiko applied the patch incorrectly. I see why that is
possible: the .dtsi file gives the same default values for all the
regulators.

> [Severity: High]
> Are the regulator-ramp-delay values for mt6315_6_vbuck1 and mt6315_6_vbuc=
k3
> swapped here?
>
> The commit message states that the slew rates are 8000 uV/us for Vbcpu, a=
nd
> 4500 uV/us for Vlcpu and Vgpu. However, in mt8192-asurada.dtsi,
> mt6315_6_vbuck1 is Vbcpu and mt6315_6_vbuck3 is Vlcpu:
>
>         mt6315_6_vbuck1: vbuck1 {
>                 regulator-name =3D "Vbcpu";
>                 ...
>                 regulator-ramp-delay =3D <4500>;
>                 ...
>         };
>
>         mt6315_6_vbuck3: vbuck3 {
>                 regulator-name =3D "Vlcpu";
>                 ...
>                 regulator-ramp-delay =3D <8000>;
>                 ...
>         };
>
> Because mt6315_volt_range_ops does not implement .set_ramp_delay,
> _regulator_set_voltage_time() uses constraints->ramp_delay directly to
> compute the settling wait time during cpufreq DVFS transitions. Assigning
> 8000 to Vlcpu when its hardware slew rate is 4500 uV/us causes the regula=
tor
> core to wait for less than the required voltage ramp time before scaling =
the
> little CPU cluster frequency up, while waiting longer than needed on Vbcp=
u.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030103418.23=
55854-1-wenst@chromium.org?part=3D1
