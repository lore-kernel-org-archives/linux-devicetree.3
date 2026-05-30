Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F901427A
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 05:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780119614; cv=pass; b=N39MjW2ds5L3opYWgDDhA/LS2asTUPxVNNfPOUYxtd609NjRat768yXf38oq/Bj9hklwzkC1O6udAa3sktxl2JyQWaUk/MAivo7mpmUEEDkAKPWb6FXKgbZbP9NJ/OF24/ReFKoE5zX//q5HIq9ObwQ0ludNNdnMoVKqSgWNz4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780119614; c=relaxed/simple;
	bh=fcMiBykd2m247M2S8w3zuUBx++iTdz41/pyQA3cMvZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mj5cHkPLaKKQuvL3hay0Cx4dxcTMXHc7rmsTbh9dZXVk9posazHAObzSQ+DsSGmqUeFMlYUzb4lCDvZI86maKC2YAaHFj+cuipuY34t0o+/FhM1nSmodHTqF2t2vifliLGPNIKTz37xUyPkM3iM5q5HVHHKug0ZVEM5+0Y+dKXU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZbHxWxB; arc=pass smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZbHxWxB"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8ccea53f35cso13958226d6.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 22:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780119612; cv=none;
        d=google.com; s=arc-20240605;
        b=GIjcR+HW8R7l61evUPyJcGnCa713U5tIeKovsg5N7p/XMmRtpiMTxA/EDrutoKt5QO
         FFX0niSO0Vx3cl9JagXvhPJWTu/n0BoT+fg1wrpbtIY4AYvW/XXPkAg79TQPnXsY7gAH
         gh44w+P3kiUBWsH5LRSB0W/UKrER5nZgeu7w/Woq58GkUepx2vsNK5Anat9kfwetmuFT
         KR8nZoWOEE2HYfyNcZAoX4kFD8b/EDopXSkDhe6x10xpTkl1CqHBoHmQ6t5ni81pjrUf
         7pOlSv3HmdDMQFue4/dMooV9ldfnjtPBcigRKa8bBpSiaqmMYpzIzyDrJQQGofWKNYX3
         jwgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Lip9dASBZ4072fUZd4OlCA8STD2eKlIyWdvqrb/3yE=;
        fh=aUQ1sTZkUd/g4VvLPKcCYMUr++M0aN2sMcbMXgZDPr8=;
        b=cGpnMQJpcNfSXpQVglCe3EAfJ8hejtM0Giu+oiU6BiqrZmhKCXR+5pvHk9JcpZuTU+
         riu9+4UiPVW7fXyLnf5oD8MQsGFAq9CwjefqSg4XvrDPOUnXS5Ew8Ikq8pKN+uPmY/3f
         LM7uRUMFFVeJVyo/yJxKj8C1vi8eaJ/pkgtyl84oRYLvIbW34sjJd+dOBzgOtG9n2Ed3
         Yklz+8V7cY+CYyplzzxs3QWIO4YVgkZtuRIO7BpuJ6BQclfcV4VfEEBFqmokXfGZaCuR
         CYIfavdEJynyMscpZDUEe0cx4K526SnYOSsMzLM8/j+s7IEYOkcig5v/PJdiYQBIHx4j
         BIAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780119612; x=1780724412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Lip9dASBZ4072fUZd4OlCA8STD2eKlIyWdvqrb/3yE=;
        b=ZZbHxWxBHlu5T0Od6eqLM58trwAXbgImOuPdnBdqatG1enNxEJSvueEK4I6b6olaR2
         Qyd1urJIw6Wtb+YkKwekE2kRlVQxd3vKxEG/nBS2oxm2vV+Z5IU9u5V/RD94y6q5htSM
         nrrWHCKbqTbrDxMKuSp1FezIZKAmMYbaKUsHvE248roCYcjeskuVF3TvXYbAgkVvPEPl
         I0j4DwDl/KdfR/Vnoz4A1uwwW5wyWmtChqDxYgUMZOqmozbPKK+/wOV834Ok/8u8yYEH
         V+Ywmx9GFeAcSXzmkue+iorH0gxPAOp1YuXYf+illOMWqS/SeAk0gS7kq2PR2OtmCdpM
         f/zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780119612; x=1780724412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Lip9dASBZ4072fUZd4OlCA8STD2eKlIyWdvqrb/3yE=;
        b=PRJNX2mzIDMd9+Qe5TRGkRpJ2oS3zq0HoB/wjUGOUFEHWQYUDIBoOzQNe1ondwbPtA
         PluiwY6m9EoX086XVPI3mnZ5B432ERI7N4PYYiaKhZ2HHMKg2/3x91GAumNWrYNHCj49
         gGMnNAYOOB2YRB7nMMi7lwU8UJFJIKrA/HCzxrHbGqUUxvaaFC1RdDaBBzDvUEHf/M1P
         popoL0Kpl945ec6b68T00HjqHb4rXWEhCsqMTSAMwR2yjR5vlQXS3vwbdU+pzmxbNZSc
         Pz6jTlsZ8oEzErBJeYDuc2U7ZykEtbkniHjQANqn4RF1eeYjTf3x1caqEM/Y4d/3T715
         USjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OTCcHRk1nTNNJPbUGeJxBxcDOAh/yS3lk7/UoUIheRFyCtGPnAZZCjON2EENm4fM3D9eG0m7uwPXp@vger.kernel.org
X-Gm-Message-State: AOJu0YxssTd3l8j4xz5KlYm9sSsJjFSChQo3qXeDPk47CeDkGl7MMHt9
	OJww7HdMeog/jZ9mWxk1bnKyPWl+o7lHahQz+m0URtjuhvB17d6wDXtyTOV9qJ4WbNDZnb1Vh5J
	/e8C/cMDCmcYQKRy3wBhjERxTDF3J5z4=
X-Gm-Gg: Acq92OGcCRVnwP50Nq7muW49Hun9bueZflY+DxE9AJHaWUA6f3LZO8KUF+LGk+qqi2y
	3Awhi2pFeeHN8l9MfSP6NGjkp1W04kEg9OE9ezjX7KMCAjsB7mEwEh6QI0nQrdWEG4dhYKbl24I
	gYk5igVJnZcqW4RX37QAu64A9rX/aM0A7szZZx7JVC9k6mpBje0zi+TrivN+1BNdL4YVYFw6xuO
	nZo11+4EJenPzvo3v8nhXB8gjTWy7jjOcOz67Haz1jQJOVYrqEka6SeB5NfjaAunX0QD8PphEqv
	HcSZZ4XzdNdhuFRr761ea7W9gOssVFfn+jazdpws2JA2QgxqfhQF00sE29muQFnplPKy/vOPpyx
	eJvkA
X-Received: by 2002:a05:6214:da6:b0:8ad:87a2:3c1a with SMTP id
 6a1803df08f44-8ccefe014e0mr47109986d6.46.1780119611758; Fri, 29 May 2026
 22:40:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260524094616.106660-1-manishbaing2789@gmail.com>
 <20260524101513.A76711F000E9@smtp.kernel.org> <20260525-radio-ungodly-9725b95ed67a@spud>
In-Reply-To: <20260525-radio-ungodly-9725b95ed67a@spud>
From: Manish Baing <manishbaing2789@gmail.com>
Date: Sat, 30 May 2026 11:10:00 +0530
X-Gm-Features: AVHnY4J4LRcPDSm1Jb4TgJEmvmkzMlak8iXI4y-cVUJQB65oF7f3ugFuB7bHFKI
Message-ID: <CAJvdc_fabG+ks-DaV5yF0uc0ZxGkOrJNqzn0jt9rKvzGt+kbpQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: mellanox,bluefield-dw-mshc: Convert DT schema
To: Conor Dooley <conor@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org, 
	robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,
Thanks for your review. I=E2=80=99ve already submitted a v2 that address th=
e
unit-address mismatch based on the Shahiko bot=E2=80=99s feedback.
You can find the updated submission here:
https://lore.kernel.org/all/20260524111528.107251-1-manishbaing2789@gmail.c=
om/

Thanks and Regards,
Manish


On Mon, May 25, 2026 at 10:11=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
>
> On Sun, May 24, 2026 at 10:15:13AM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Low] Mismatch between node unit-address and `reg` property base addr=
ess in the YAML example.
> > --
> >
> > commit cdc4e472d6093984a0a6b661575b015b013ec9d6
> > Author: Manish Baing <manishbaing2789@gmail.com>
> >
> > dt-bindings: mmc: mellanox,bluefield-dw-mshc: Convert DT schema
> >
> > This commit converts the Mellanox BlueField SoC extensions for the Syno=
psys
> > Designware Mobile Storage Host Controller from text format to YAML sche=
ma.
> >
> > > diff --git a/Documentation/devicetree/bindings/mmc/mellanox,bluefield=
-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/mellanox,bluefield-dw=
-mshc.yaml
> > > new file mode 100644
> > > index 0000000000000..32d50e45ddb86
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mmc/mellanox,bluefield-dw-msh=
c.yaml
> >
> > [ ... ]
> >
> > > +examples:
> > > +  - |
> > > +    /* Mellanox BlueField SoC MMC */
> > > +    mmc@2804000 {
> > > +        compatible =3D "mellanox,bluefield-dw-mshc";
> > > +        reg =3D <0x6008000 0x400>;
> >
> > [Severity: Low]
> > Should the node unit-address match the first address in the reg propert=
y
> > here?
>
> Of course it should.
> pw-bot: changes-requested
>
> >
> > The converted YAML example uses mmc@2804000 as the node name, but retai=
ns
> > reg =3D <0x6008000 0x400>. This mismatch typically causes a unit_addres=
s_vs_reg
> > warning during dt_binding_check validation.
> >
> > > +        interrupts =3D <32>;
> > > +        fifo-depth =3D <0x100>;
> > > +        clock-frequency =3D <24000000>;
> > > +        bus-width =3D <8>;
> > > +        cap-mmc-highspeed;
> > > +    };
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524094616.=
106660-1-manishbaing2789@gmail.com?part=3D1
