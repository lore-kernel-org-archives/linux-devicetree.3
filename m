Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881AD36EAA4
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 06:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789454011; cv=pass; b=bOBNIZRptsKPjXV3TP5/aqCJT+JN6WmKmkX9QRSqcu39QXXq79gIfTXdSkCUDuNptk+hJruRlLSxv59JkSMkGGuK/TG1hGu7A52x2K8ghwy+z1BPD99kYppLE5i9iIKLk7z/eDjDnO5CmRnNWMM6ytXhnaEyYD0PiOx/OtV4wMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789454011; c=relaxed/simple;
	bh=BZEOoUQ0Lo8ipUdfeprRBNlw3oHG9gKfH8cF4qSYIoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=piIvDK77wWcmvAVQzTUqwkRna8vlEKw/SAYKtPl9hES/EbtswbfZWMu/F+T1T+9bEwdlWjWYzeCsRkO2VIgvrOEUd/Ct0K8lQMb5nzOrjEKsGl0HApyB51l9oMrl9xypPI6tJ6h7QcszbtfVlW2GTHstbDlmvqcogcyUlc24vZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=INEVnWV0; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="INEVnWV0"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a49a40209dso3496071fa.0
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 23:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789454007; cv=none;
        d=google.com; s=arc-20260327;
        b=knwypw5JHyF/MWYFYCzNc2TWeoLaQ2YlFqoMp0kvQ/OCpbjnQNqq2JiHfXplq4oJaf
         gK9hEFnqkiyn74TNDJR0WWGhaR2/XFb8jGMFLuSJb7iXBJ30A6DDZriYb59hmFWJRIUw
         aXHhFBfsvJBKIhEMzgE1l+C7lpgGrx6gl2AtruvQTYK4PsnZ2iiD/jwCqIiXwkfcXue3
         krzV7iVFeosZHozmwIZ4UPm8Q5o6AXEma533kTsTdJDE4DoiGICExnPxXGMXZ/QlcnoW
         WcfjxMjn1wmBqY/mmQl2X6JqhB2q+3tvqjmDsarcxpQDCb1QPdnq9eJchMzFJFsLAwu9
         ArkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=casfK5KttDr72ePpP2HDg9NJjIeM9xhCgNcIOIAZHLU=;
        fh=2cbILyfxpXtNXasshUMQ95yG1YHohJJjWH69p6XSj7E=;
        b=Ns2pEMJeEsUzCzNppiGHxtWeEbiYu4N9VPq+MJF872bp3+lee82s/V8lyOIXEgRz2D
         9uEp8Zxq4WCKESMNvaF0QfOjsaTwIhEce4w21JqE/majSRapFi+zv/DizcLwsl7EvQ5p
         XXwmcPFNGBvGcQV1Idov+/2IbtJZ5MGIFwBsdEaN+NehQUI4vfL0RMl2zUPx7ty6AXBg
         TGwP2zjHzoXA+xZzgCseMbhO0hecfzYtHPJbtzmuUB1IvDQOrKkjpMXGbr0/kKMHaAVp
         r5xnFlThwV28qICkLpuCwUj7bUpAwQKV1i/PJgi/3OqpEEeigk1haD1GNA2lYBzyxD9K
         jV8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789454007; x=1790058807; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=casfK5KttDr72ePpP2HDg9NJjIeM9xhCgNcIOIAZHLU=;
        b=INEVnWV0PvdxQlTaTjwdP2xGWFazm551SmIDA4IRh85WL5aZbeQlkRtOKglJ3dyrvK
         KQRhFMyiY+YdHC5utMdDi7ZBnkbWN6l+2vPokNj3Ez3MDpdytuJNWFwtOtcFUrRP9gUJ
         EfFypWsrQQ0Lg7N/t4WhBgaG0USpxscw6GPLulrOe8tY47AMqxGtZifJcXjrgh7BFCIG
         lNI3z3ziRAj1x0To9LypcIzK2oOuvh03gVaEe1NRvunPRPSGAUbeV4n499A8JWgcoUV2
         Uneq5jl+hr4jwnfseQpTCB8t24Y+5lGEZGwF+a67vOiXtlfmx4zXNHg+WIoU8UhkEYCa
         6c+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789454007; x=1790058807;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=casfK5KttDr72ePpP2HDg9NJjIeM9xhCgNcIOIAZHLU=;
        b=Ws9ytiRNYVqqmvscvfqNeu+2CYTt9a/ln5dd09QFeHxT6yHdMvSYX1S+G7ZnJ7Xq4C
         IgX+WkUam20zRyDh4zNUouwULyxlREiDRZnSWvznAFGv2zRaB09jZphHWS1cUwfx0vSu
         q/ofMmswKZ+V/6mw+tfHtldxigrXxfxzfIaVa6n+j8EHSTS88dk2NPMmBzk0i8QDXWvP
         jxlqDEVm9fsRf+0oTB8bLQgVmYVdi1FSn4579+0KcRc57Vr41Yr6zNwINXTpldltK51U
         0vcRakxH5jqxUOPmSjz53FwojsdnKSWjBcGGLLAWx5qbTP6EFMrM/ghuZXYFtzz0aADB
         s8iQ==
X-Forwarded-Encrypted: i=1; AKwUvBx+VeI7z0AVwtnOWpyzNUJYDKQ0TlyycBaQlJkWDP+U/up5l6KT0Bg8BOxYki9pUl+OU1q0yTF87hMP@vger.kernel.org
X-Gm-Message-State: AFuF++nqDodmEvEJtdlmIEWhNbpd0QR8NHdkFDwPhwEVIm83TECcWVLt
	VRscyiiJf1i7IMy5SeayDpLHwID0x3gvpho2W0aQFW+NU8Pecy6XXKT86h3XwITIJod81VjUY7i
	hOYfAlx4jwUq0R+HZxXOxseKCcS0vfNtYPTkpsxU=
X-Gm-Gg: AYBFou37DX6H0DWHiBWFjW3x/Hr7YqAHVjusfg67M669RytFC5SNUN8xQdbTPG83B42
	o46YBr4DMBWX8rURGpZcHX9PNwn4dcrWPjaLJ1mFjTP99ST9JLlEZtj9QUOBcHqvxwYUqoBrmTi
	sK587KC/6s2CJ8hNProRC+G23BHJe8wEktXsIubvJvQMdrkIM0KCUIkiqCHPln85CrPMN7kX9W7
	x2vqswFwv8sOY3Vzsrn6DdRBqKL9n6gNAely4u64JZQ44lfb7E7Pjxdy/WvAgygIXdmPhXgmraH
	8YFFExyy5+RSjjT/2+Hbl5QNxcljN3AaZczpA2Xus91kONwEGeZ+mMO1HCw2cb2jYjoAm7LgwKn
	c5qGdLKJ26Nye
X-Received: by 2002:a2e:bc8b:0:b0:3a3:29d8:8b00 with SMTP id
 38308e7fff4ca-3a5d19a7c11mr2780671fa.10.1789454007172; Mon, 14 Sep 2026
 23:33:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915052021.6959-1-syhuang3@nuvoton.com> <20260915052843.397FF1F000FF@smtp.kernel.org>
In-Reply-To: <20260915052843.397FF1F000FF@smtp.kernel.org>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Tue, 15 Sep 2026 14:33:15 +0800
X-Gm-Features: AcwNN1WwzpMg6DbhyfieH-d57sUuGMCMER0oo83Syvu7n2pAq0NeQmN3AZLllEU
Message-ID: <CACW=pY5n1ku3m4QPgBkx4+r_nHr7s8GqYWUZ77DH+rgOvNq9dw@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (lm75) Add support for Nuvoton NCT7715
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8815=E6=97=A5=E9=80=
=B1=E4=BA=8C =E4=B8=8B=E5=8D=881:28=E5=AF=AB=E9=81=93=EF=BC=9A

> > +     [nct7715] =3D {
> > +             .config_reg_16bits =3D true,
> > +             .set_mask =3D 0x8060,     /* 12-bit mode, 4 samples / sec=
ond */
> > +             .clr_mask =3D 1 << 7,     /* no one-shot mode */
>
> [Severity: Medium]
> Will this leave bit 14 unchanged if it was previously set by a bootloader=
 or
> left over from a warm reboot?
>
> During driver probe, lm75_generic_probe() calls lm75_write_config() to
> initialize LM75_REG_CONF. The regmap update mask used is:
> clr_mask | set_mask | LM75_SHUTDOWN
>
> For nct7715, set_mask is 0x8060 and clr_mask is 0x0080. Bit 14 (0x4000) i=
s
> missing from both masks. Because of this, regmap_update_bits() will
> silently ignore the 0 in bit 14 of set_mask and preserve its prior value
> from the hardware configuration register.
>
> If bit 14 remains set, can the sensor operate at 8 Hz instead of the
> intended 4 Hz, leading to a mismatch between the hardware state and the
> driver state which expects and reports a 250ms interval?
>
> Should 0x4000 be included in clr_mask to ensure the hardware is properly
> initialized to 4 samples / second?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915052021.69=
59-1-syhuang3@nuvoton.com?part=3D1

I will update the patch in v4 to include bit 14 in the NCT7715 clear
mask, ensuring that the default conversion rate is initialized to 4 Hz.
