Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD7D31AA8F
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066747; cv=pass; b=frE89UrIYUYW0/1b4Q/GEirBqLwla/55DJt78Zy7rxF/5ZtU4j7c98mT08hQvLYT+1z6iGGw8ZYq1eII/nuipksFdgneW8PHayqvyn3EPx9LyJl9Bogw4As1b9feegxQs68CoCEv/F1mNVKYs+665UTLXRAYjK3esf5guV1V0/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066747; c=relaxed/simple;
	bh=nQCpACxM/NNDWLD8aG1f9Y5eQyxFb13mKb3dIoAiQz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKhe+PTFAVGtJNlNphmx2h+uvUuHNtgJ3RP1lqmEOCDI33ZkXKhGf2X/a2FyZ8hsm1lRB4XfPoyKDPbcRjxubPgl4swAh5Uwenw6lcpgFSnaYRygl5Mfo0pPt+BRmR0+GL7JhFcAjrlBDVIYHNiLbWlsK8iHcbhxCZF8wfggFJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNMwL1Yb; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNMwL1Yb"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1363e78746eso10453297c88.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780066745; cv=none;
        d=google.com; s=arc-20240605;
        b=fGczEbqGhhda63Yg4FeOS4U+ybFPHwVH2zogzrGce87zarep9JNWMOHB/D6oi8cEOK
         pqVQPMxxq02GV0fn7SjckCydX3O8Iwnf/ZWeCKKDa6/9ej6tio3KEYVv70YSMJFU5uPh
         ExIjFu34zLraQULr6GBLPRvjiGHOL+5Zgctr+fsm6jpbpSbNC1B9PJdYftRUGaYIsoTL
         EexiPVAORRbEYvi2YE6eod42IuImT56pFBZkmcY06HHh4Ndhib13B5VLfQ5Mx/BPzZiK
         c8x32sWF4Dna8o6CvUGxp+ZwMYo14q849EG9qL/kZV6a8dK3xpBO67UscaYXjb2DhbZT
         3Law==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PgXHcM39V5zvAXFHcyS55ak/JoLwnSwxluSWMdfV+ZQ=;
        fh=lyfQyaShSEbjYqzj6feHy6RVr/kDcCIQsr99gaY6qNQ=;
        b=SPnbZcLWoflZxg72HB02cOuHDW1achR0twa+KEDj3/EUNUPJWQBPDaKRmOpKYnU+zr
         EQV169Y3+MI8uDMRtxIB3OEjB29HEcrFfxF72nS6rA8b0RMv6oAyLxRlDNxVXWklnNwg
         nNPbQQ3ymq10OuF/Mn/5y/D+ngk5+vWsZEkzdXHwq4lXjWLfHdmRU/9g14JLDrf/Gotw
         5vLOG35n9wwJTSxGixPXk93O5upOAPjqZbYGghiVcA2tA+4Z6n/I9cDreMDIQK3ENGYM
         Njeigds+y3TOcPy0FAOwC46Zd9dUBhqA1CoC0m0q7qexe1ZnBlATmLCFn+KLnNl1UqO1
         Pmng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780066745; x=1780671545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgXHcM39V5zvAXFHcyS55ak/JoLwnSwxluSWMdfV+ZQ=;
        b=gNMwL1YbBRZTB7NSZ4KCgt6SbCk7Nhp0rcGLAn43t4CF0eLO1A3IWnkWm/CTuhlCdZ
         JzRwmtVYUdrS9YjadYk7X8Abc3sIH93tG1cfCprE/YmBLJwIcLLuGl9D4yECP64cD2gX
         pXFNiRLIJhztez1AihysMIusiyY0KU9zuVXRv4DuQeix8mcdUHx4Q07Lhd2i2nkhY2GV
         cBYzN7QPh2hXyEuy7TNXjgYfk/T/vIdZwTe75PLkGcZjNgFTRLf716UBbZ95a9Gyxpy8
         h5r5wr88j6Ys0twBVoj5QQkRQdCpgejw4OrsYOlNAaJWCEjieQHiXZ5zFauyeKFT5uyg
         NECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066745; x=1780671545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PgXHcM39V5zvAXFHcyS55ak/JoLwnSwxluSWMdfV+ZQ=;
        b=dXDQ5bk6bu3MOKYMdO83ggA0nLnza0ga6+GWGyABL7qdit46CIk6eGMlVOLQ1Kh0r1
         TjSTm8itl7JGuaUICJ4ATIR4FVCIVHFVxvF2edD5GskwqCnBPSvp1uTDGV1qnMnEoW13
         wIHAhxJDw6rWYsah3EiZ11DJQpe2YoLE3IA9fOutWikGOWRskfXg6GJSj7hISDQaSgDB
         crfgIbg1n4YTubrLE5UM3PwPaPByagYlP5vwSUtv4DN4/WqZP5gzWklBwUKaBkiN1eLj
         py+r+EFiiBpFU89MBD4noPMJvx+/jRtZ2anIThOGM2lWfRx5aC8jmbypr4yfuSNkr/Hr
         r0qQ==
X-Gm-Message-State: AOJu0YxOypvrI1km3UcOqXXN3Cz9lV/ha2ShzxMGEo9oxECBxcUiAGVA
	YcrwUMZ5AEQeesVBT/cwMgIsvAH0/eKkzkHd2eIOa4hDSgfaDJaqR7ITvntVWKHl9Ooa9XopX1J
	s/RZBvESYVue80xdzpc1iTGvCJ89xzUA=
X-Gm-Gg: Acq92OGKKgROUz6HnrJVXlXHA4I4JbryHr32z0RGUTHDF7jSlC0oezsFZolM/WuKojf
	te/6+s+uIS/UPB4ZUsuWpa8c9q9c5dot67vbt75X7yLf/Cxs4zJq34dHqlZ7Nob1unIJbVkBmzC
	ozr9qAktEtVJVNKwnCJVcARIu53+18epxQtEBl/rsxb1BOm42w1KDN0Eag/ac+9x0yd3VMdvBGG
	k416AuBezw8jZSacxX04AXA/JprQzetPTwF5oGgn8Xt7wb8kueZXKCmBsfypH1qVc2uCmSxDl3B
	W+VID4+7mQfOdVMrq8E=
X-Received: by 2002:a05:7300:e683:b0:304:de26:3cb6 with SMTP id
 5a478bee46e88-304fa61b98cmr74574eec.23.1780066744852; Fri, 29 May 2026
 07:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523085102.51000-1-clamor95@gmail.com>
In-Reply-To: <20260523085102.51000-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 17:58:53 +0300
X-Gm-Features: AVHnY4I-sQrdOAdbDInY5d2djINIvTW6pdn0Pji3ZBEmd0xb_C9GzSfWWHFkO2w
Message-ID: <CAPVz0n0+FEpfnuoH9STZoRtLOA2YxD_FvvyVn+WdyahxmEA-Qg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] power: sequencing: Add support for Nvidia Tegra
 modem pwrseq
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 23 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:5=
1 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Patchset implements support for the Tegra-specific modem powerseqence,
> which handles the registration and unregistration of the USB controller.
>
> This patchset is a part of larger series aiming to bring XMM6260 modem
> support for Tegra devices:
> https://lore.kernel.org/lkml/20260511135703.62470-1-clamor95@gmail.com/
>
> ---
> Changes in v2:
> - previous phy driver reshaped into pwrseq driver
> ---
>
> Svyatoslav Ryhel (2):
>   dt-bindings: soc: tegra: Document Nvidia Tegra modem pwrseq
>   power: sequencing: Add support for Nvidia Tegra modem pwrseq
>
>  .../soc/tegra/nvidia,tegra-modem-pwrseq.yaml  |  49 ++++
>  drivers/power/sequencing/Kconfig              |  12 +
>  drivers/power/sequencing/Makefile             |   1 +
>  drivers/power/sequencing/pwrseq-tegra-modem.c | 209 ++++++++++++++++++
>  4 files changed, 271 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,te=
gra-modem-pwrseq.yaml
>  create mode 100644 drivers/power/sequencing/pwrseq-tegra-modem.c
>
> --
> 2.51.0
>

Hello there! There will be no v3. Sorry for disturbing LKML with 15
year old obsolete tech. My mistake.
