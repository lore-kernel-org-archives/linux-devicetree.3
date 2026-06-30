Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9F83F0ABB
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816194; cv=pass; b=i7bxv5ywov6rRfa0VNU01zalfLQ+TvsdltKtSQDqBTsBZ8mht8EuZVjJJ47PmS8ir6zGM2aELdWTSITYcsLlzK/zKBLZxQTbIQAH71wsmtCNDnFZVWlVyRdsKIWPDGi4xnqc6AasqUGjR+ITIV9waq0hi5WH9OVXFVx6WTS5Q8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816194; c=relaxed/simple;
	bh=kZuTI4Val6atdatwnnOJuPX+lLeSM3tO4Th0XAESsRg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LaycqnhrisNsd5JdYbU/S4Wq5jOExIpF89WkJA13x3ZjZ+1W99Bbqze32Oao40HHC++UsNSY3B5u+ORTxsmzgom5IgQMLNAzPb+AfiBuFobX9Ud48ALuuygEIVaxH1G/qf+h/knZHusLxJQp/xSxuo2aVE+Afpt+VHA3R47Laxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJOB+5zU; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJOB+5zU"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493ba701891so3885275e9.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 03:43:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782816190; cv=none;
        d=google.com; s=arc-20260327;
        b=TqcYyCQ1aZ4kmmgY/2HzPPV5mJaTIJVUO9D0K0giTtppmHqPb27x87NOn3rJI2M7n2
         1xCasp59SpEBM3rs9peyhHaYiHjhlBWDU9dnJwlbe8FXJg0UXeuvoPDgnfRjQoSeZ6SX
         qizqMgti6DVN3dPSumaQO8ih+YqEirohgf7zj0DaNA0SxEMTPAL+IL9Kx0zvR9ZaOodV
         o4SEMrxpjkkIMrbz4pBHu8mtAwjrgYCPdR5vSzL/Y4bCaYz6FRbwsehQoklcKlS/8wuV
         7E4oynckh4wuvROKAvouFmxsZyXYdIcmgjFT+r5zVYBqzKg7xavg6CD0ejLceNwQaIG4
         Je9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HkmUBXDajSN3qSNsXr+nPaq3QE+94PgPpUX4FydW+ZY=;
        fh=pIM/fhYnx2vSUqiPQqUPORdyFnWky6ksJVvngft0NtA=;
        b=SNnJEn+QyHoinBw9V6WH4kcSDUjdW39uiQv+xlXDoce1w0SmHSXHuRK0Rhw7oJgjqm
         NlEpSa4YAdgEx2m5kAM7oyZNo0SpzE/0F5eJIzGDNt+p11y3Enyhf6gFynb5n1FdsZ62
         elW6e0on5X6dSDVhejcpexy56EYwwRgODPtMucibsNYsXbB/a8VZGXiEoYog9VWgG++T
         g6HpxnMo/qVh3EoTCXpeq/4hIBul5d+lULJrKEOL2tYigZydbSPoYQ8y50MshvXAMh3G
         SBM3/MMjo0b5tTH5Fxs9sv6UrMVuOXaqgbjvQihjnj5ViMTad+VJl+sLGfp8i6httC/6
         BQrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782816190; x=1783420990; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HkmUBXDajSN3qSNsXr+nPaq3QE+94PgPpUX4FydW+ZY=;
        b=UJOB+5zUcc/ZYIWMON9uP4zKCeK+qn/pFZRH18YOHuOn9T51o9a2vjgt9SzPtzZrgb
         jJVNjgujdcMr1+IFwOajthLkQPYzHkwENJtBgSHmHKjK1v0+o5onGQZ2+WxWSswDH0Hh
         Ycw3unX8QfeswBIhwMAbzO7hL22C4DTFRTSV4uQcibQZoK38VxKQeQZU99kt179nbYKj
         LfgtVFm3LfJGNAmutvnpgRlukGai64Y9sGH1a7S9HzIOQBlNfg/kgV1D9yxoyu+1/h/N
         BLV6B3miOjnp3cN9Wkg6BzjYk24mbbBKdx9MGpcNGyqyTaR0NxDM2dG7GIR4+0q1gH38
         YkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782816190; x=1783420990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HkmUBXDajSN3qSNsXr+nPaq3QE+94PgPpUX4FydW+ZY=;
        b=emHydE/g9masoOOsO2Y+nQ1N45hbpaPgihSn08DaJ8bPNFrw7tpKYjRKr8EwVLP+wq
         ++6ssVYr5XXIerypCOWfKxJw52shrNHxDGJfuRgvPTdjwzG1w5C4XlOKtoaj0EdB+9Fd
         Y12mX0pJW4xwQ5BJ3zEE6MSD8cZeQM9QeQT5ny5bqwqwQSYXsKLKH8VZM55EjA7icotD
         kXJ+l0QwKqfSXdSgVYb5l5Nrjj/7i5PrWTN6+kq60I0pT/q8OBj0Ms42q0wSPf3u/IJK
         unXxa2hCtat6NAKhxF8MW0VVV8o4oIIJQTS8yON9xrHCmh0RGm+1TO7pnhIjzwUUEFqw
         iOtg==
X-Forwarded-Encrypted: i=1; AFNElJ+jBXsUgn2BZR4FMuxlZmQapNx4hU4kYg/CxYerpTRDQTfqRBshtIwBafzu43Zx8ySKbzLmS3Fa2eKW@vger.kernel.org
X-Gm-Message-State: AOJu0YxCYhZQYLUl1o1/9b331maP86gbYDRcLDSfXrOLaaCv00wk1uBw
	Fh3ahpffpVLYa0ZXIgJ3zxIIvduK0+0ky/pJW5vjnuGL7iolnibNfw3eHxjaeLJilDrcW89Owyu
	zEmjSvZTJznxoGjNchL6uwCOab/YPsWA=
X-Gm-Gg: AfdE7cn9qhPsTtHIiJbk/si8svLeunAhBxOGa8HlfWH4yb2EQUOWBwvEE7SPXzLGSDh
	hzYNaz/+xwsVJBjRfws5CeQ/BhqsH6dvJWUDPrgYAk81purGDeFX+QuTe6O7b4jaI//DXvvwnTs
	otlxxafMslu+sdXV6DacOgkB/Ybf7C6Ra/lKEQc9RptmxSVaK4wLYustJ1W8Im2kA7/HaWcwhFA
	FGJEHDzH2EUE8v9Qr1YKMF+2CXk9FQVJmphhHw0bPhGvhLLZ8uR090/asmAB0kRLCuuDsTXsccW
	g83yQX56BCQZh/9IOhzfm3ZIAr87WAKK/hSAp5U=
X-Received: by 2002:a05:600c:5392:b0:493:b720:ce11 with SMTP id
 5b1f17b1804b1-493b82b95eamr46268295e9.31.1782816190313; Tue, 30 Jun 2026
 03:43:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630042229.277799-1-mitltlatltl@gmail.com>
 <35f13ab2-cdba-426f-bf4b-36f53ce1d4bb@oss.qualcomm.com> <CAH2e8h7p-i3epbxD6Ks-ru2OP+qY6nYXA+Fm+Luexo3cZ2Eucw@mail.gmail.com>
 <cbfb770e-0e27-4254-a3c0-6011e8eb37ec@oss.qualcomm.com> <CAH2e8h4ABRuOTe8Qu-iPEk-i6r-Le3bzmwFSEG_c7YmBu1LjCw@mail.gmail.com>
 <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com>
In-Reply-To: <250311af-0860-4a76-9799-c01608b87293@oss.qualcomm.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 30 Jun 2026 18:41:40 +0800
X-Gm-Features: AVVi8CdJEbozbW4vdA2vBUciHlr1gDX4-YEEjXIVSnVBH6KJ_r7m3jc4o5HV4ro
Message-ID: <CAH2e8h65xgLnqusTMw1QnAMSmf__YK0PsWY-w0D=32US1d9L2A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-huawei-gaokun3: Add dsi panel
 DT node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 30, 2026 at 6:34=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/30/26 12:30 PM, Pengyu Luo wrote:
> > On Tue, Jun 30, 2026 at 6:29=E2=80=AFPM Konrad Dybcio
> > <konrad.dybcio@oss.qualcomm.com> wrote:
> >>
> >> On 6/30/26 11:28 AM, Pengyu Luo wrote:
> >>> On Tue, Jun 30, 2026 at 5:18=E2=80=AFPM Konrad Dybcio
> >>> <konrad.dybcio@oss.qualcomm.com> wrote:
> >>>>
> >>>> On 6/30/26 6:22 AM, Pengyu Luo wrote:
> >>>>> DSI panel driver have been added for a while, so add the DT node to
> >>>>> enable it. vdd{a,s}-supply for dsi, dsi_phy are blank since the DSD=
T
> >>>>> describes the wrong, no impact after manual disabling these wrong
> >>>>> supplies.
> >>>>>
> >>>>> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> >>>>> ---
> >>>>
> >>>> [...]
> >>>>
> >>>>> +&mdss0_dsi0 {
> >>>>> +     /* real vdda is unknown */
> >>>>> +
> >>>>
> >>>> L3B: DSI core 1.2 V (both?)
> >>>> L6B: DSI0/1 PLL and core 0.9 V
> >>>>
> >>>
> >>> Yes, that is what I saw in the DSDT, however, I can disable them
> >>> safely (hack the regulator driver to add a sysfs to handle these
> >>> regulators), the panel works well.
> >>
> >> L3B additionally powers CSIPHY2/3, EDP0/1, REFGEN (probably why it
> >> ends up being on), UFSPHY and USB1_PHY
> >>
> >> L6B additionally powers the same components, minus refgen and USB
> >>
> >
> > No, I confirmed they are totally disabled, since there is a way to chec=
k it now.
> > https://lore.kernel.org/linux-arm-msm/20260420-read-rpmh-v3-v4-0-70c152=
e6c958@oss.qualcomm.com/
>
> This presents you with the status of the votes casted by HLOS, not
> the actual hardware state
>

If so, non-HLOS will vote on some critical regulators to keep them on,
IIRC, once I disabled L9D, system reseted immediately.

> To get the latter, you'd have to dump the SPMI registers
>
I will appreciate it if you provide more information.

Best wishes,
Pengyu

> Konrad
