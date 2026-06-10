Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1812F8E93
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781104599; cv=pass; b=eNVYYwRCB39zrT81E14rK0+PCG8e1Av/trqA2wyBzJdYzhHvK8J3wws9G5CWGvO2WVud0XjTv53Dv2fZ8x6CdWFopKG0Opdm9N5RLO66Q9s0KjaQJjNrItiqN8/EIIwReN9niPkTdH97xILED8W3vaZGyJ2+AYuy5RTNNjpicBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781104599; c=relaxed/simple;
	bh=2mStBc/q9uongs3VNllgSG+bzxWsj1RdHY7iaZeJbx8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ux1/32OxGy/LTT50nqsH/SQbECeQU2YSjVC5YB0GD6jkQgs+7/yaoJvmpXhrGRE9ujTWCeALT9TWU1rqohotQD95mCc1W1Mp6zfd6e7C2oJtQ4uVEnKRpDM6Wakjgf3m5elWhBkq3Lx8YBesrtCwuYUNNkssF4cr3UmyCeHoodE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5cF8fWD; arc=pass smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5cF8fWD"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-963a722ed59so2252104241.1
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:16:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781104596; cv=none;
        d=google.com; s=arc-20240605;
        b=Qxrjyq2b2gIFQSSXzucA/f+oDRZC9V+sxMPaNW6tFr/vOxRgTr0W389TgcJ0Hi+lBV
         NuSb53mCy7pFKMwe7t6v1Ipj2AuAt5I30O8fDqjQwFpIcg3kzzGYwz5dLlEjLb0cGzme
         aCMv+fKDYz0hCoNR3XlDxym7tS7mG6iOrfudBg3aMVt2w9pmpzPbmB9H9IJXszM5PD0C
         CYm6u9q3Sa1o5Cu6D19fezIE/D6k36oIkzHzaVjv182jNXArsX/hAp12IYN+B4SxOeW+
         tK6jur/k2EU71ysn5rYAtGLDbuioMBqdbUOGeB9i25YHz8cH7UI4G+V34AbBPVbcea4/
         5XkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ts8wGeDzZal8GxfKYhzw5ox6k82S2BLaK+sms3HyOZM=;
        fh=v0ODguR2MtWRaGev+oogc+8VNaOp1Z1PGsp2AApzCcc=;
        b=KAiVSJlUKri1mqUz8m3/tmVYhj3PBwBLK14dA27p90bLCS7baMedxLYRrKZYedis4U
         glgOa/9QyiD+FPyc4rxNV0ETAUsidG6HGhqa20s88DIJO3JLHwYyxnkUf6P55IKY0Nzs
         wgYmEnEvf8k+VqPB/3S2INslQD9lykZc+LNTTA4DyDKuot65WDztV69bjmQNf9oVcpPQ
         z/+1J0CU+eWTEpx6i3q111fn5tKKdpx8frtKjvbLwsyaxU76oRkcir51R0YqwK+z50O/
         w6UIzSmwuo20XhXamdmPwyO+aqmS7CYRnkQRvNSDTflAqqscuCO6NcDm5Mf5daSgmTea
         ghiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781104596; x=1781709396; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ts8wGeDzZal8GxfKYhzw5ox6k82S2BLaK+sms3HyOZM=;
        b=I5cF8fWDB3havD4AYU+TcmiZeCNyWKN5e+DXk9uGe748WUhlI+irB0M17ljZoQsMX1
         5dQD/2yLGwlSVKWQSoUyRSio+qIwKQRar8h2MajdMSCKXmiV+59XAzfhINxB2fLcvcq6
         6wFrjO2OxqUGxHh3AF6uacIQgMyeWOMPxNJhmjDYNhxrm3iKhLFVEyGUjDdyYINHtgSv
         5kxGMk7QWF6GxPmxbtxBixXX1Uw7pFaTvJRe8g5O429pDM1rs5kLUCCrfvo55EFvvbNo
         cdJ6zpy0et5RFddpziTqvyHcOkffNgnSoRufySF1yqXdGG1veruVlVM26EqycBvVH22T
         udEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781104596; x=1781709396;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ts8wGeDzZal8GxfKYhzw5ox6k82S2BLaK+sms3HyOZM=;
        b=he+m9WAAMFqvDbXjsi7Lty4YpQ+m6+wSNQinACeTODnnP/dvuZLKcdqeD2nSFQoaCG
         Y/QuYFzqy2+nLSDSLmL2rWhwu68p6BE9WwW6JnGa385tFZhV0IAhi1NDUBOrVZaYmQC0
         TFiWRwiAGEK5tFjv1uSPr8Q/e9J6fHRepHVtu7+AFlISAkwwj51mtOnCiTjzcn45yA2g
         DsPg++eaBZ07YggFxto1Np6SLN770+m3DRms0HRLd20oA+WeSPIcM7yGVNpIr0vQz5Hf
         01PsoYmy8clJqUq7UE8mCZsdOQ12gwJVOdNMeOI1YDyfMaJf3AGjnFBnNOnlzLUZpU2L
         Xy3A==
X-Forwarded-Encrypted: i=1; AFNElJ8I95/uR9c5E1Y0orLsiqRr9qDtLi+ms0REgaLEqCr8ovziIu0/StjnlrgokfmRFnwQWoB/TwiiNdek@vger.kernel.org
X-Gm-Message-State: AOJu0YwNu0qhHurBd79pwhGX8NWXEmm+f1EdaS7aX3bT13VB9DtUjgS1
	5Nv4qPOwRyvIjbpT3Wif8a9A4K54PespGDxLtTq687kwfOvoHPFan00yDnlH6AnbRbIh1ooDKMu
	85nAAzQ0ZU+xdRRqWWc6eTaXtPGXMvLQ=
X-Gm-Gg: Acq92OEXiUCPz3ONVy0jNt7rO1hbj5t/RCPrMJIZW1vMyHgNkS0TMafrvvzPsmuD8/6
	hDuHfRPNE1hPQQ8YVNtz42HvZ35MF5b585bB+h5oKvahBoNsIFe8u+rVkbArZXsGooJlfAxE4Em
	PipQI6efNXxVnPIDfRSZ8TqSwxRYlmbRtMy+7FVr98wj4HOSuIgTOW2P6NzoX1J/D/8UwVY+/3y
	njswi3l41JQDWqQARn2/X+JZtntk4BRiYJ9l228NRXOqeofEHZvR02V0C5w2ZnyiyORKbo9beob
	itPOHuQo/cJ82o75aWj3
X-Received: by 2002:a05:6102:6447:b0:631:b834:e05f with SMTP id
 ada2fe7eead31-6ff0610caf4mr14199152137.11.1781104595646; Wed, 10 Jun 2026
 08:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602-anacapa-devlop-phase-devicetree-v3-0-7c93c5df8d9b@gmail.com>
 <2d1095b342fe0f4b1b4b99b22bb3af410d9aa60e.camel@codeconstruct.com.au>
In-Reply-To: <2d1095b342fe0f4b1b4b99b22bb3af410d9aa60e.camel@codeconstruct.com.au>
From: Colin Huang <u8813345@gmail.com>
Date: Wed, 10 Jun 2026 23:16:24 +0800
X-Gm-Features: AVVi8Cc7NRfVUhw9WT9jp6Y4XQLBetD1jrzFvFoN05U7Qh5wPj_DELWRqc2qZTs
Message-ID: <CAPBH0A-8VcJ7zDfKrhKn3ZhqdKxz2vt1umJShtHre4=H31pkcg@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] ARM: dts: aspeed: anacapa: restructure devicetree
 for development-phase
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, colin.huang2@amd.com, 
	Carl Lee <carl.lee@amd.com>, Rex Fu <rex.fu.amd@gmail.com>, Andy Chung <Andy.Chung@amd.com>, 
	Peter Shen <peter.shen@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andrew Jeffery <andrew@codeconstruct.com.au> =E6=96=BC 2026=E5=B9=B46=E6=9C=
=8810=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=889:04=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Tue, 2026-06-02 at 21:24 +0800, Colin Huang via B4 Relay wrote:
> > This series refactors the Anacapa BMC devicetree layout to better suppo=
rt
> > development-phase hardware revisions (EVT1/EVT2/DVT) while keeping a pl=
atform
> > entrypoint.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> > Changes in v3:
> > - Restructure the EVT2 devicetree to inherit from the EVT1 devicetree, =
making it incremental rather than standalone.
> > - Add the DVT devicetree, inheriting from the EVT2 devicetree.
> > - Enable MCTP and FRU support for the NIC.
> > - Align PDB fan GPIO numbering.
> > - Add an EEPROM device node for the NFC adaptor board.
> > - Add an additional EEPROM device node for the SCM.
> > - Add shunt resistor values for HSC monitors
> > - Link to v2: https://lore.kernel.org/r/20260409-anacapa-devlop-phase-d=
evicetree-v2-0-68f328671653@gmail.com
> >
>
> So just to check, the changes in patches 5-8 inclusive are applicable
> to all of EVT1, EVT2 and DVT (given the way you've structured the
> includes)?

Yes, these patch apply to all development phase.

>
> > Changes in v2:
> > - Fix dtbs_check fail.
> >   Validated by following command:
> >     make dt_binding_check DT_SCHEMA_FILES=3Darm/aspeed/aspeed.yaml
> >     make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspeed.yaml aspeed=
/aspeed-bmc-facebook-anacapa.dtb
> >     make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspeed.yaml aspeed=
/aspeed-bmc-facebook-anacapa-evt1.dtb
> >     make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Darm/aspeed/aspeed.yaml aspeed=
/aspeed-bmc-facebook-anacapa-evt2.dtb
> > - Link to v1: https://lore.kernel.org/r/20260407-anacapa-devlop-phase-d=
evicetree-v1-0-97b96367cac3@gmail.com
> >
> > ---
> > Andy Chung (1):
> >       ARM: dts: aspeed: anacapa: Enable MCTP and FRU for NIC
> >
> > Carl Lee (1):
> >       ARM: dts: aspeed: anacapa: Add eeprom device node for NFC adaptor=
 board
> >
> > Colin Huang (5):
> >       dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 DVT board
> >       ARM: dts: aspeed: anacapa: add EVT1 devicetree and point wrapper =
to it
> >       ARM: dts: aspeed: anacapa: add EVT2 devicetree inheriting EVT1
> >       ARM: dts: aspeed: anacapa: add DVT devicetree inheriting EVT2
> >       ARM: dts: aspeed: anacapa: add additional EEPROM node for SCM
>
> If you need to respin this series for some reason, can you please
> capitalise the first word of the short description (the bit after the
> last ':') for the commits above and the one below?
>

Got it.  Capitalise the first word.of the short description.

> >
> > Peter Shen (1):
> >       ARM: dts: aspeed: anacapa: evt2: add shunt resistor values for HS=
C monitors
> >
> > Rex Fu (1):
> >       ARM: dts: aspeed: anacapa: Align PDB fan GPIO numbering
> >
> >  .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    3 +
> >  .../dts/aspeed/aspeed-bmc-facebook-anacapa-dvt.dts |  178 +++
> >  .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 1179 ++++++++++++=
++++++++
> >  .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    |  228 ++++
> >  .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1077 +-----------=
------
> >  5 files changed, 1589 insertions(+), 1076 deletions(-)
> > ---
> > base-commit: 7ca1caf017d34396397b19fb4de9ecef256f4acc
> > change-id: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0
> >
> > Best regards,
>
> Andrew
