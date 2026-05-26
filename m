Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDF23F8704
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 12:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779798580; cv=pass; b=CeeaaJjr1vmBJCeuw+iaD3ePUH7nJ0X2/dhfxZ9+Id+3nn77abQkG9hLba0r0B9iK7YkPVTHQgYGTvj8HBHj/eH4iWBw63/IylSVUq0Y4EphddxAi4IFiNEmc7BUEapTvdA5MfUq/pDR+8u1Hq9EdDxMLSXmDiVqOKx8tC1CKf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779798580; c=relaxed/simple;
	bh=Dg3mTo5Mcn8ngqMvpVvFnTbUkbCXNIGOywIbkn4YrmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LwBzMREYAvL3upmjlTv62bCxlB9m83iPGZ/SiQFnUoXnh4j7bpz1d1Vpsa0qN4c045JB9zxo/ugW3TmCiL+F8NsNo1oZ0hdGP3lPyg7q8QFVN4cTTys7FqK9Ht8T0B41Z5YSXI4A+/6pEO8AhQjQX7Nl+kJY4aMhcrikgdoV4Xg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h1yXffAp; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1yXffAp"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304545f5206so5513727eec.0
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 05:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779798578; cv=none;
        d=google.com; s=arc-20240605;
        b=XeIOs/2azEgh+jR6I/uKD5PgZY52gGU1CPP3ibPkHPBzOGxxRvifcSMLxyiaEQRm1m
         CVEkgMSKsREcXnoLKS1UQM8OQ5UZdwgQybO52G2XJGS3DjRiPiBZpYNNNEeU9IXNCgxH
         W+oYf4lp2NtxnpI60WdtkW/TQpxwAaHA3A5G4wu/egtsv8KmXpATFFt3eKXxeMBShopT
         0E5DGXyvL7l6xr1p3g06bvorkBnMHhSdA5c2C6xGYH/VbQihpvPXHaPFvRQav1/3sb5o
         jd9WNsPNz946nllAiA3owT8FtjAGY6TSEngjxwqgh6XAh21wNFaaJz7yxFctdq/no7Wd
         /1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=prH/VGp3s5plVdS0J3nbTvDbEC8lmkPqocrz3Fq1Ipw=;
        fh=eCasnmCrf2jBLDwC2DZSKj3MnkLjX5WxWPYpXbO59SU=;
        b=GB5IX5tDqySeJATbdm+ABGA4Wmd41bhdw13qH+r03dzOsT4+qGy5vnkkR2oJGDjS60
         fqyBMBVhce+wLszLgXuaro1Se3n36cS/pZ8xON1NV1i5TSG8cmTVp4Mmp8B9unClorI5
         wIABfVgMkxeFWSOoWJqBs/P/rvFFD5zkhOk15BxyIGlRW4Zc4IrmCrqFfxfVXxNlt5hn
         A2wBJr8SxMOQVDCeMd2pJosGypcxATG9H/txdSZg6qzSbueZeM+tauWHtRPbSb1j75Oc
         cBCCDJLPCEBauZSd47a6AzTwXfJ4qexYtZQIgGHHaKT729Nhhf9GoAt6kOHx1sBtChCN
         cp7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779798578; x=1780403378; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prH/VGp3s5plVdS0J3nbTvDbEC8lmkPqocrz3Fq1Ipw=;
        b=h1yXffApRVj8DnmaJq+9aVe0KzjkXkD7ErPjhLHgtj/9+w+F562VG8pO3sXXPDfzE2
         CsSZfsBa6BLtwlYJNE7WfvqJRJe1MIUNQr4fygoIXnczSysRZWfOTnRUfm8rR19kXgIp
         d0xTUaowzopt2gjqzp8V2gX2NFivEX54c6vmjR1rv81VgWFK+dafm39kA8NvPbt1SATc
         maOUrWS7XlbNMJIdhE36j37/+6IT+SgmPpyCil8GJOFBNRL72ei83nTIWYykjANfazrp
         WI6XWQgRWIJf3V2NpZTvq6MurtJU2Bee8QV6/mNIpZlLi9lHDcNVgZ9if4dcCyUf0bgw
         lY9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798578; x=1780403378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=prH/VGp3s5plVdS0J3nbTvDbEC8lmkPqocrz3Fq1Ipw=;
        b=DBJ7FzZiKbZuaGb9k4dKGbJFB8ksdVT7fVVtTyvOglrqsGsmovuXVOFPrUKma9kaLt
         0/eVsmsst94BrY4HcvR9sFayyTLeR3S2zUyrN3cRrIZtoXTPEFpO9H/fWUXuHm811zYy
         euvA32JFPzXN6jXCVh7XQsAXMei2/aQVeymyR7dQ8KCrk/MeLhZ4SKax7L2PX6PqGm/7
         bOV/LIoFotp7vrMTRihDs9K0uyTpGTIJ08cHERFv/zoKl2H26+bkHj09EhyTGtuMjp++
         cI+0dm/vfz/3Hb/zrPfyX3p/U5yzahoxY0EzLw2FmXQ89Yhp+ENuCJIaov8Z7yT7smm+
         xtOw==
X-Forwarded-Encrypted: i=1; AFNElJ9J3/yTTuNheDOsum5+VMLW3kHWgYrXv2D4XO2uggig95fUxI4dnMz4jQ0B8lR+2QxyFzIvejpvHyGK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3pNfiS53tIkpxPKct7ymfq3h9aMop/OuCd/WxYsV1AX6wMqLd
	UK34HZmaCF/d1zF3ZdbqlfVV2eGSdCRc8yljRj3i/PPpr8LIOiSTeErdg9Ai2i+ClnPurhLtIDr
	o9i38MAvb71SvwJrqUI2eQWTun73lrXM=
X-Gm-Gg: Acq92OEnmk0R3FlQftWjmVVMSl8noqTvTdPMTGktfVOY6W7vsS+xMWIuVLwjRR51rFO
	bJcrtRE0aq/lAelzz1H8ZzAL0ETEwtCS7W2bqgoGojIv9815QA2iYbZvPWfcqhAVEBA75yBUXZZ
	4rj+4A24Z9rJKPhlaO4eMan/PntNPSm+0HOFM4VCGWqYmLnc6YfIrgbdHdJ5QrJE5BTlxHj5yKR
	4gDOHQyAg3yd8zybZW17PWQL28w2qNFx/pXblzzHLKnCcmekEx02hQiZnYTkiaQTyqUllZkl0W9
	TTps16+O
X-Received: by 2002:a05:693c:2c0c:b0:303:a1af:5042 with SMTP id
 5a478bee46e88-30448d51723mr8826200eec.0.1779798578350; Tue, 26 May 2026
 05:29:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523085102.51000-1-clamor95@gmail.com> <20260523085102.51000-2-clamor95@gmail.com>
 <CAMRc=MfXVwD2u0e115RapnyLzf5JRjWMs=2PSNzMnm0GDd7aaQ@mail.gmail.com>
 <CAPVz0n1G5Yu2X5f+=q90RAbnsWi9psMq-L5tWDMM4JRC4R_mPg@mail.gmail.com> <CAMRc=Me4G-YqKoFan3epofXk2OWzxY1iPE1mP=uwEjs9wgA6Cw@mail.gmail.com>
In-Reply-To: <CAMRc=Me4G-YqKoFan3epofXk2OWzxY1iPE1mP=uwEjs9wgA6Cw@mail.gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 26 May 2026 15:29:25 +0300
X-Gm-Features: AVHnY4LlPJQvUtSK0QH2SeBmOMPhEhv-MZAC_ScpGO8WYUg9vZq45m_SVat0lzY
Message-ID: <CAPVz0n2P-zB1_uetZN9pVcQChK+FkdQowbF4Z0YZOBQBsB76WQ@mail.gmail.com>
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

=D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 14:1=
4 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 26 May 2026 12:03:59 +0200, Svyatoslav Ryhel <clamor95@gmail.com>=
 said:
> > =D0=B2=D1=82, 26 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE =
12:51 Bartosz Golaszewski <brgl@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >>
> >> On Sat, May 23, 2026 at 10:51=E2=80=AFAM Svyatoslav Ryhel <clamor95@gm=
ail.com> wrote:
> >> >
> >> > Document the Tegra modem pwseq used by various devices based on the =
Nvidia
> >> > Tegra SoC, describing its usage. The power sequence provides interac=
tion
> >> > between the modem and SoC-specific interface configurations.
> >> >
> >> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >> > ---
> >>
> >> ...
> >>
> >> > +
> >> > +examples:
> >> > +  - |
> >> > +    #include <dt-bindings/gpio/gpio.h>
> >> > +
> >> > +    pwrseq-modem {
> >> > +        compatible =3D "nvidia,tegra-modem-pwrseq";
> >> > +
> >> > +        enable-gpios =3D <&gpio 165 GPIO_ACTIVE_HIGH>;
> >> > +        power-supply =3D <&vdd_3v3_vbat>;
> >> > +
> >> > +        nvidia,usb-bus =3D <&usb2>;
> >> > +    };
> >> > --
> >> > 2.51.0
> >> >
> >>
> >> I assume there's no such component as the tegra modem *pwrseq*?
> >
> > Hardware component, I assume no.
> >
> >> What is the relationship between this node and the "infineon,xmm6260"
> >> compatible node?
> >>
> >
> > The xmm6260 has a phandle reference to it. Since there is consumer
> > matching logic in the pwrseq driver I am leaning towards removing this
> > node entirely. This patches is still in non-final stage and I would
> > like to hear any opinions on the way to improving it.
> >
>
> The node attached to the pwrseq provider device should represent a real
> hardware component. Are the enable-gpios and power-supply lines connected
> to the modem package?

Yes, enable-gpio is connected to the modem and signals that USB is set
and ready to work with the modem, while power-supply is an optional
supply connected to the modem's vbus input.

> Is there an internal structure to it, like a PMIC to which these lines co=
nnect
> that controls the actual modem IC?

Modem does have internal PMIC to power up all its components, but they
are controlled by the modems internal firmware and are not accessible
via any standard means.

> Bart
