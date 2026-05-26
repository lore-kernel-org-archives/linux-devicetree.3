Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681842309AA
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779800122; cv=pass; b=VvvwRZuPDw4QalQGzEqeFAktqjIMlaTepvxhakLU5FN7+5WhqyIfgEMwpIONg9wu7rK0lJsEGICz/mD8PsnkqnPExJzpAOztySyjt1NFuYcfbPIxo5aR76YS0K45ttiikdx7T96LPFuz+sR5mFkjdQkOYvlc2QYQNocgmFYporo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779800122; c=relaxed/simple;
	bh=NPceGcX3PswichgjQ3Txb5qWCLz/58AAZcjid0lj8wA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7RNExAsEW3ITiU2WpGOzUYx9hFcKoLNHlcvWpmqCiXeIcNcsmsc98mW+BAZb8qymLSaCBt4sqGLhrjZCdm/Q3I51ffg4DBwhHvRhPsqnoEU5zdHcflVUYIpkqEKYByXKCYq9M5URfjz40t12Ck3NBUuKTX0GKiYwyglYvcCQow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HMHj5qIZ; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HMHj5qIZ"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ee990e8597so25316301eec.1
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779800119; cv=none;
        d=google.com; s=arc-20240605;
        b=Z27vFzFSBx/zyaGZ5xK7N0+5Yhcug0CbNcFRZSJ4e3bwq4Db+j1TOOgg0nDbkiFVu1
         3aMTHKIhFv12AVOdhx9ANuWEpDCEhP0U30NaBVUzPAN5Io8+Oa0lFAQ11IJe72pjU2Ge
         ktw39k2xFWRtPUhzDywBIwmmV9TYWQi34oZ1tmO7zl4prwWEAEkBAUOKwNMLEZk7n8fA
         4WwQyo1U8pO7ZOmQc2b/LZXzwRsPdD7QHeNY/Lz2vNGI+LkTj43/0biLk3jTBuQUDAQE
         m10yZaWfsaf5niFkwS70ObfBIVYtrVys0yo2GGMitMuYw7lzLyyi2uifUQFW9xmW6zv7
         U2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kzs/MAQKWcUn71oLtzdfn8RCw0kMPvaTRDu9OkTS6Wk=;
        fh=0YGQZlWHkYeUbmooEX6p4IRWrvbEuFWLeQAPzHcVaJU=;
        b=AdH0N5yj7QKV+DmsQNoQhVDIJyZjftuN54l1VgkKQf5RWFI6oHABQ5grP37+AXXzrx
         TZP5LKfiwWpYx3RY87/1cPKS82WsCnF8Qw/rrL2tyHMC5Uxe2t6GvDeEOSLaGqIRk/06
         TFzEB/KCd2oPk2fyqgda4OBilDKcl9Lz1eQ2eYMpIQXlcRYPVq8nuF7CYrixdPvqUGiA
         zIN34gfnNHKpJmNaJDEddLJRSz9EMxcW65dMDh+Gzn09sxyHEkKkd4RfZtKMLU860cNJ
         0FwWK6yrKrIQ2sp3J7MRzo3tOC7I7MrxTFDBm9tbWk4lG7GxrAV0USu5wWu0UDHyPwpI
         g8hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779800119; x=1780404919; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kzs/MAQKWcUn71oLtzdfn8RCw0kMPvaTRDu9OkTS6Wk=;
        b=HMHj5qIZOSSAZ3YUxZvOk5DybWyUJ0KFBMaYJQ7yP9DS1Zq0n74/jikx6k9tk6wixN
         yDqxurLqxjoxgVMkXvLDl+M/QVeQMXo3GcMm1XxpKhlIbvoiKKOgUnAFvlz4/bBDdvMs
         Byxml+vTBSuVk3MveAwMvwhPD+0PwYIlSMTBYetjisHx/4J+5e7owBalLn7pzcDNj373
         VQLA9rv1GI4XN9GsGUSoQYmTnN0C260D4hB5MB4TuW57cQ0hxhwMqRsqrW2SF+pPstsM
         A2DUFb289rm2dL5MFZ9b18ybVJ3Px5jRs+/OYufoANM5dh2vGR33SaChwipGDb9CylEl
         6aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779800119; x=1780404919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kzs/MAQKWcUn71oLtzdfn8RCw0kMPvaTRDu9OkTS6Wk=;
        b=QIVD+6K2l7Ai3yjIULYd723bbeW9EXskP4Fb94t+zHGheGZx+JPkql/2Tj6YTSdky/
         E4AW4Ild0YKFTXVhJI+mhFyfRuocLqMAC3H4vdlLZWiq38A+v+Pl5BXmRanjVdm/6RCF
         YAaJZBGL0jmDVy3wSCnaQOVnfM7aepbYZmR/wacqoODvdA2MrnOLeKM3RCAkfJ1STslj
         F4R4QldnbD2lKBwMrfUw+YEmOd8AAR0EaM5hpJno5NP69hAeo6sVfNxaD55aMHPNWEsx
         ArZB8X77epxawAEdrQYUsh5BG5ngniVKd0N5hJznR6ob1xk4EqLgBan0GlipEn7fHKNK
         lsXg==
X-Forwarded-Encrypted: i=1; AFNElJ/t96gEMgrPjsrDTcQ66ExRh4OYc2L1JRSPdKCBLKODZU/v88k5omWpUK+n3R/E55tA3K/GN8ZeptDE@vger.kernel.org
X-Gm-Message-State: AOJu0YzAgDS6W36ikGFyX8lAWTRBhcoRM8If1zOuiZW5/vN3pW6vms95
	WF1FrkAIVmFPxC9Ol19hoPj3TnUa+dNrY2+J3Ok3NlqhdUhnZCux2lNGGR886NmW6lagttIXmxm
	JDsasFe5r6UHLFXq9Zb9HsE664Gm5SY5Xvg==
X-Gm-Gg: Acq92OGDjzCer2KQfAtLDjhNh9/qIF34Q4eOvqADm4iFH5fVi7JMcxqHLNjEEC7nvuO
	IH+ajz+sQiZEQO4Qs/FEer1eV9GpGAgheTHHbHwK7m0NiC+60hqzXT4K2qS3A9ObNLXg4KXJA2p
	dK0alh4qCJyz5wDgRXM8gLdyHhEA4tWOjwhS/o/f72oHWA32NiR8gkJXY6QPlv5rHnzW2orkaIa
	hWeZV1uB/iR1CBsc6/VOa02giJwwj/qYftgWYi5mKRi0b6/47ECDdI7VKtqRG3fGmT+WI4+sqWh
	6HuAkbGQ
X-Received: by 2002:a05:7301:d0f:b0:2ed:e15:c923 with SMTP id
 5a478bee46e88-30449142740mr8172308eec.31.1779800119575; Tue, 26 May 2026
 05:55:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523085102.51000-1-clamor95@gmail.com> <20260523085102.51000-2-clamor95@gmail.com>
 <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
 <CAPVz0n1G5Yu2X5f+=q90RAbnsWi9psMq-L5tWDMM4JRC4R_mPg@mail.gmail.com>
 <CAMRc=Me4G-YqKoFan3epofXk2OWzxY1iPE1mP=uwEjs9wgA6Cw@mail.gmail.com>
 <CAPVz0n2P-zB1_uetZN9pVcQChK+FkdQowbF4Z0YZOBQBsB76WQ@mail.gmail.com> <CAMRc=MfAAE4UtnW4S1=pY+2yvS6Hsd-U9+uveUFtPGoJPrv6aA@mail.gmail.com>
In-Reply-To: <CAMRc=MfAAE4UtnW4S1=pY+2yvS6Hsd-U9+uveUFtPGoJPrv6aA@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 26 May 2026 15:55:08 +0300
X-Gm-Features: AVHnY4JRp0uoVu7T9D5O6sRRvjrX-3sJh-DKTWd-v6Qt1vrT7npN-zOtTEgIKHE
Message-ID: <CAPVz0n2COsDL+fNBAuKr1ty_AVe9sK5yNJithkXex6GNa1T_Tw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: soc: tegra: Document Nvidia Tegra
 modem pwrseq
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 15:3=
5 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, May 26, 2026 at 2:29=E2=80=AFPM Svyatoslav Ryhel <clamor95@gmail.=
com> wrote:
> >
> > =D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
14:14 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Tue, 26 May 2026 12:03:59 +0200, Svyatoslav Ryhel <clamor95@gmail.=
com> said:
> > > > =D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=
=BE 12:51 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >>
> > > >> On Sat, May 23, 2026 at 10:51=E2=80=AFAM Svyatoslav Ryhel <clamor9=
5@gmail.com> wrote:
> > > >> >
> > > >> > Document the Tegra modem pwseq used by various devices based on =
the Nvidia
> > > >> > Tegra SoC, describing its usage. The power sequence provides int=
eraction
> > > >> > between the modem and SoC-specific interface configurations.
> > > >> >
> > > >> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > >> > ---
> > > >>
> > > >> ...
> > > >>
> > > >> > +
> > > >> > +examples:
> > > >> > +  - |
> > > >> > +    #include <dt-bindings/gpio/gpio.h>
> > > >> > +
> > > >> > +    pwrseq-modem {
> > > >> > +        compatible =3D "nvidia,tegra-modem-pwrseq";
> > > >> > +
> > > >> > +        enable-gpios =3D <&gpio 165 GPIO_ACTIVE_HIGH>;
> > > >> > +        power-supply =3D <&vdd_3v3_vbat>;
> > > >> > +
> > > >> > +        nvidia,usb-bus =3D <&usb2>;
> > > >> > +    };
> > > >> > --
> > > >> > 2.51.0
> > > >> >
> > > >>
> > > >> I assume there's no such component as the tegra modem *pwrseq*?
> > > >
> > > > Hardware component, I assume no.
> > > >
> > > >> What is the relationship between this node and the "infineon,xmm62=
60"
> > > >> compatible node?
> > > >>
> > > >
> > > > The xmm6260 has a phandle reference to it. Since there is consumer
> > > > matching logic in the pwrseq driver I am leaning towards removing t=
his
> > > > node entirely. This patches is still in non-final stage and I would
> > > > like to hear any opinions on the way to improving it.
> > > >
> > >
> > > The node attached to the pwrseq provider device should represent a re=
al
> > > hardware component. Are the enable-gpios and power-supply lines conne=
cted
> > > to the modem package?
> >
> > Yes, enable-gpio is connected to the modem and signals that USB is set
> > and ready to work with the modem, while power-supply is an optional
> > supply connected to the modem's vbus input.
> >
>
> The modem is a hard-wired USB device? Do you implement it as a
> platform driver or a USB driver?
>

It is not a traditional USB device. XMM6260 is an embedded modem used
in the Tegra phones, it is linked with the AP using USB line in HSIC
mode. The driver is implemented as a platform device since it does not
interacts with the exposed USB device directly, it just ensures that
USB device is properly configured and is ready for IPC.

> Is there a connector of any kind that could be used as the HW
> component represented by the pwrseq device?

I assume control over USB line is the HW base, but as I have said, I
can integrate binding in the modem node itself, and pwrseq can get all
it needs from the match. Pwrseq framework states "This framework is
designed to abstract complex power-up sequences that are shared
between multiple logical devices in the Linux kernel." it does not say
that it must represent some specific hardware.

Using pwrseq allows modem driver to be SoC independent since USB line
handling is moved into SoC specific power sequence, and this modem is
used in Exynos and OMAP too with similar setup but they all have
different USB controllers. Maybe you can point me where SoC specific
USB controller handling can be implemented?

>
> Bart
