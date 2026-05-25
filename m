Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1F23D4127
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 07:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779695115; cv=pass; b=Jq4gzowQ08KD3RPpXXc4DfIhtkuOacq6lhSWwbIafcTzviL4/Au/TgJ72owmrOoBaHaYHOsU7TBMklGWnrkSRYFBny+tzWzXXzOnf9b2StBhGWF2+xFQGQqGU3eJlLyHa0JuEObk3daf11bmXIrm9OJ/ZSXgjK6/BMr4Mnzdg7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779695115; c=relaxed/simple;
	bh=nqsZdMf/BBR6bmZa7PHlqIirSjOFDpDYL5VK3Qr4DD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cyfv7UcgSyYwjNPL+yT7mR2gf92kbtGgHPpnyMfh+fWGXsMmegeJ/iCnoz0Rsv16VtmXaWSxc8maHyIEf9oAqsoBTJjPtWjv02Od6+a/kcBn6h2U/1RTpVh4RHKpL9QQO2e5Oq6lTOjtUa2WC7Yb8sodE1UJI5Nd9pEqQcTiTlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VbBBaLPA; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VbBBaLPA"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso15180513a12.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:45:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779695112; cv=none;
        d=google.com; s=arc-20240605;
        b=Yieb3ss/61O1QMSdcI+u9rMpaJRdyeaP7pdP/9lesEI/KLo5+3B9lVWdo1Fwsx4ZUE
         iq7+UPfEID0zo5hA6tnMq2TnMPbRt5G6r3hqJDghu7cbVYWD/SyWKX+DaTHlwl+cyrTU
         ApcejmxOpA4oN3V15X93VqkuscPDKsJM7NrZA8At2VPb1UsyY71wPQY6ooNxl+pNTlx1
         IbdVKpgW8xuiq0cVVnWvbhMtVlDr/HnfmO7Q0jiCghOjkNdyVAIe4eLmBWAD2gfkwO2e
         91deAu2sWaMkd6uH+C6FlHdQ4LPYoN1VsA77bX8uKQXdmQl33VrraGVE71UIUSYtVLqB
         jzsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=11TeJZv77ZnpXb/3P3ZRF+nGs5n1ErGbq37h0PDsIHg=;
        fh=YGHlOFahmdzHrHok1Sn39Alun2Jv+DDOdSmDV2m2Gek=;
        b=aaD0tJzpCNgffTX93ze2cRltEFEZIl98AfPJDQexfFDdB5A1g0boRL/7HPcM9knXXf
         DhR1s7cDCBy4yiT0N+u6cPWUjgOijqZNUCMLL/Tt+c56u6rG9oqiGGAUB/PMqctTjVX9
         04flpBhSEryfDHWFNyzgVDgYTt5KCDHQxStDagxRlzCYHRqcPSNW02GbX+waWAiRXvUX
         2B4PPvmXEwW7F+PWyeynkjrqOkyy/vAsszgZAXlMhN/z+YEvnfaZQ3ps7LZ5qXixP5Rt
         uViAeKqNdnTcr2YSrkr1WwWneoJpSqxezvoeP+jX/sN3dddLR2OgfUm9IU7CnJmazqLO
         Fg6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779695112; x=1780299912; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=11TeJZv77ZnpXb/3P3ZRF+nGs5n1ErGbq37h0PDsIHg=;
        b=VbBBaLPAHxqCacTP1YSBEer3oKVRZkdClyqxUjON0HgD02C+7CJDfduCj4scKlkSNZ
         lkW0RWhhsS3InNV2oPRafQt5KeF88lBq0vCFjoEh6blhMd/wiUa9XKRNfsPI8jAgctkL
         vZBNH3wpO0icAgKAZoY3uhPSwe2JVkTkmv7lbkK94soxzbrq1RAcNQWJpO6yXbKbAleG
         dUQLoGw9cYu4ZM+FnUdWOFEDbJHAunuF6EQyuBJ03j/a62Iynlp7e/b/4rJgUh1Svbzv
         xsfa1U0fq8c0E3r36mor9U0bHfufy9Dpf2ul4RcYD8qSDvMxtqLhBNxx0f5ZcKKgHfGb
         mLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779695112; x=1780299912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=11TeJZv77ZnpXb/3P3ZRF+nGs5n1ErGbq37h0PDsIHg=;
        b=CZAN5Gne6LZNumOtujSKijir9f1T5Twp6IG2vy0BQ/uF2IPPfXOvJ2neE7E4uZpaNt
         KWJz0A/MHcmyuokMDSoDTWkg/MaPAfcmJZxb6ZKicNzFhhiT3xuaOu2A9JlizHdOaHzx
         6mv6latg9w1vYXXGG5eUGanb2LecZQ0nm5+IWOC61qh+zdtYGwv3ZDtJ4NtzyvVfG60m
         DcD6w8lc5/W0L/7DL3+VXAXUgxTO9cbYMxECsahAkvvT0C4NoQMETqc6KjXub7nmYboj
         tMZ9gmgtYPyr+ehXL+2BXGmPrKn6wGHKYNpKoHiPEzm1RTur0KItcsDb6xm1pnAz1XJf
         JyiQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cHeORIEQxmSAyu8iwU/DIvqzMp0AxdwKERxPCDmqW7apTS4YN1heApGLKACM+H0uGdBsYnBisGqnW@vger.kernel.org
X-Gm-Message-State: AOJu0YxNpapsG1b9j6xzXhrVExtu4UM4a/9/OoepWSS3WSKiUsWodFFq
	mdMFibTsmLLzkB3QnddNk5qb6Z1fjakY/WOA9DLzep5Wdq43uxjb2I410h0Ce4+dFd5YOmR+ybX
	pEohamTQVpeSm6XmpvouWFQLgPdHqrf8=
X-Gm-Gg: Acq92OEUffbn7Hj19vdaFpoyVW2AHxXJKuySsCKwZ0z6NAg+O+bhbLg/b0dN7TlBg8k
	utd2guou+5RhGR2QOrmLzk5bxJiFAWdjxoYwRcXVaPD3Uo/IfFfeyfIFUG+aLOJtgUrUVayeFLz
	MqCj4x54KZjLezKVbfeqIs4gLuJyO/B92VoSOsOuDFvl1OoiZ3igN/tsEdMOuycHEWsz8RB8ca5
	JzBDCYUR3llCDtxovY4uhtofYLeDBksx4Hcqk6uCzf/qScezGgobIn4qzzff+76eLaiwZBrqglc
	iLwMo7C95w==
X-Received: by 2002:a17:907:271b:b0:bd8:26e5:d79b with SMTP id
 a640c23a62f3a-bdd2aee6e70mr587552666b.43.1779695111967; Mon, 25 May 2026
 00:45:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524194457.479681-2-biju.das.jz@bp.renesas.com> <20260524195829.960401F000E9@smtp.kernel.org>
In-Reply-To: <20260524195829.960401F000E9@smtp.kernel.org>
From: Biju Das <biju.das.au@gmail.com>
Date: Mon, 25 May 2026 08:45:00 +0100
X-Gm-Features: AVHnY4L2cxrewHdjoi6U0d3gX5aaO0YVqb1OMYH4rfrIl1qNl3L7Ph_c-s2fQ24
Message-ID: <CADT+UeAYhrwpmApCWaJ9w0gK3zF4eR4LVptTTwegGucvF6mmiA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: bridge: Document Renesas
 RZ/G3L LVDS encoder
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bot,

On Sun, May 24, 2026 at 8:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [Low] The compatible string 'renesas,r9a08g046-lvds-cmn' is used in the=
 dt-binding example but is not documented.
> - [Low] The parent node 'lvds-cmn' in the example lacks a 'ranges' proper=
ty, breaking address translation for its child nodes.
> --
>
> commit be595c0db2d85d9ea1396f0f30ac7ad75f4101fe
> Author: Biju Das <biju.das.jz@bp.renesas.com>
>
> dt-bindings: display: bridge: Document Renesas RZ/G3L LVDS encoder
>
> Documents the LVDS encoder IP found on the RZ/G3L SoC. It supports
> single-link mode and shares a peripheral clock and reset signal with the
> MIPI-DSI interface.
>
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,r=
9a08g046-lvds.yaml b/Documentation/devicetree/bindings/display/bridge/renes=
as,r9a08g046-lvds.yaml
> > new file mode 100644
> > index 0000000000000..b1f6d020ae7b1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,r9a08g04=
6-lvds.yaml
>
> [ ... ]
>
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/renesas,r9a08g046-cpg.h>
> > +
> > +    lvds-cmn@108a0000 {
> > +        compatible =3D "renesas,r9a08g046-lvds-cmn",
> > +                     "simple-mfd", "syscon";
>
> [Severity: Low]
> Is this compatible string documented somewhere else? It looks like
> renesas,r9a08g046-lvds-cmn isn't present in the tree, which might cause
> dt_binding_check to fail when it validates the example.

This compatible is documented and is in next [1].

Q1) Can you please reun the AI review with [1] ?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/com=
mit/?h=3Dnext-20260522&id=3D51284d8b1dbcd7fa0220c49eeab29b14617e0d88

>
> > +        reg =3D <0x108a0000 0x10000>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
>
> [Severity: Low]
> Does this parent node need a ranges property? Without it, address transla=
tion
> for the child node's reg =3D <0x10 0x8> might fail, and dtc often warns a=
bout
> missing ranges in simple-mfd nodes with children.

I don't get any error or dtc warnings. Have you ran dt-binding check
before providing
such comment?

Cheers,
Biju
