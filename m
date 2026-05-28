Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104D1279DCC
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 05:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779945493; cv=pass; b=ChCP/o4BvsVLBn1QsRKCZ+EWoxI2hlAxJXCFokqgarBzp0vco/vujkRKTHDy9jl1JNKIwS7tzOg8SyLatNSc+VfglBvdy3tpga3loA2q8W9YNfZpFr3HHK39+zxIb1Ppo8ttubT+UWpj8CBRCJG9DahZGrl96yW2FZ33o/FBKnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779945493; c=relaxed/simple;
	bh=areaKIufC0+d86tvfvrvo4dZTcUhI7C5ogjdZNZnqyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kl6ZFI0h46mw4sbA5OVTNPAjM18wFZCOlWmr4KgqFlEciiAPoV1H466BOOH5ptLmrXJQ2ikiSC8XuSzvoB6/fIHvJeEiluNmKzjuJUvVJVGugpQGFS5PWkvhBOvWvgYaaulDxaogs+QY3JtBFQjC8dG47laoBjxJDTxi5nI1CG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O31d1GGs; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O31d1GGs"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-137335bc3caso3466985c88.0
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 22:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779945491; cv=none;
        d=google.com; s=arc-20240605;
        b=CitbQMUXpN1caG+i67lzNs1xZeKvnq34HvS1DnyFgHAf4xbsPMVi/aYFbbiT3eLvTA
         yeugTbcB8Xqm/ijg6KXMnHyOXGOLelSUp7cpKXfmg1dukMx7FQ1iIxlUYddxCIdvtEoG
         R9N9d1DRlpHulAOjEMIpT0pR7e/+fDp4vlnnBum/KU7DuBP5M3sR/msO2gZiwY7d1AMS
         EGYahSC/M55m0u/Ssarxp9e82KzcIACzwZJniGXNWMWmU3r2qffwxm4ug6KjkJts4JZz
         wtV8BdUitxOnqZXFMm0ClayZ466mP8XnMM27+255REGR/xH/+Q99jpd55AiT3gchj0bA
         b/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=areaKIufC0+d86tvfvrvo4dZTcUhI7C5ogjdZNZnqyE=;
        fh=mBDAjAlZo5n9sngyfldo2v76NJ0J3xzPlmo5VadEU/0=;
        b=AKl6AWN0nfKUgezeP1t62b5BhXJ4RqLpgIGgvUFDFM2vd4awV1t1snaqpid6/rxruV
         MOsq1HTuBhQB+WMmF1O2m4bZjNmQe44UkVphBIYhaAOPSdjnKIM2KgJqOz0l1njY7P9g
         7v29aeeVHikv9aS//wc9o+DLAKcH+cubZqhh07UEsBCbe7bRqxO5sFdwkh0qEuIhuRfE
         y5Qr1oYcnKeFCl8mBePOziMm9bUp29mllmbnW90lmacP3kFnfZ9l5NLIfEItr3DhHS+o
         COKCDKW3msxiZKHybJ5mCsWIpOtcEF+FW9SL7SX7TdMW+LSXtHyeXNW2UAY8FWgrGP7S
         m7Kg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779945491; x=1780550291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=areaKIufC0+d86tvfvrvo4dZTcUhI7C5ogjdZNZnqyE=;
        b=O31d1GGsez0AtaRwSwqxBrHeSyVWjhLE/UAWc88iBOgcgGt0N1ZCoGtjI0nbHHxc6y
         FJcKH4nDnVs0ySg+3OXXaOQW0QM7BC9bRwuVdI4IUx3EXhAip6JbcALoPdRfCprNBLhd
         u69R3Y78pm3MPbu9ii+UJlAz8JL5RVDOQZTA2LyutjJIFJhodsPtozCEHkv+AvDG2nDP
         UCZez+o6x83DNaXTG3Qekw20De616Zgy8TINZeLHn2H5VOkecU2iEJ7B7S7y5WkHs0M0
         cB9GdSskoGpbdTz4wjq6dK6fIR/J5rpDGzbfmdR25z515oegdRPaUoMr2jWgbAdSWhjW
         Fj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779945491; x=1780550291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=areaKIufC0+d86tvfvrvo4dZTcUhI7C5ogjdZNZnqyE=;
        b=S/nosPSVynQtFXM+DlgfO0FCTp+Xe64xjHLQr8x0xVsGKvga9XhYW7BICwHK7OEbc7
         sufWXgBy5babwACbCRs7r/SJIuF2H3r0VhApXB3URXhwZpe5WxL7wNXKMLdF82G+3emk
         bUT3dT9VwDRTaGCBMIt8DG8uFQJLzI+HuIUAng8ToSRRONo4XRoicigBakhPGhnQTsSM
         5iWC3qqbmSgPT3IqdWZlpM9bPyvubBv3GAGj4OXnrPIV7pIdOK3NzLNu8Y9H4317ru1f
         33fNxM6jDYmHkFvoV/ZRauvHaC7qi2chZIJlLXNPPDnweeiWyNW+rXBQPxhDQJzdNYms
         Tuig==
X-Forwarded-Encrypted: i=1; AFNElJ8lO8ZxaG370Ep5iPP0Ofu6m27l7dkBHlDl6gzS2uqhym18s5UPWp1ECE3foCF0jUvn2TkTl2JggOpo@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7HlFLH0fobkf1TTuw2YROCI4nonldu4psZvJu9kIp9MXfjd6E
	mAcB9IZVSzkOuRYx1C/gJXmLyR97nJp9VLHqZMQ4/b/y0388nG2G2DVpqIFq3flG3tY3KYmyk2+
	+/5X7Rjr4NyzRIsmFaq+OT6BQ/U0qlno=
X-Gm-Gg: Acq92OG5IPpOJv0qHK86ZpueLv93a64y1yUg+dZSdH9Mf5+fP9e4rlBQAssaQX0vGAv
	104QAY6V8WrcGjgBc5wIrQQpVgOkb+eMO3MIX7FSPGXM2ghKngI6vs+fgHTBMcM6VYLzoa75duv
	pwPupngCxhSIV+zB+prEvKGs5i1PFfCeHDwk5anuVQktQTPrijc479uM+fATwmqRLByDIU0lpQs
	3wE6D+E33ZQUAZCJyMAAybbSyI+4Jz4BTbQ2ArvPzg5vP22jmGRjWDQF6Cy9t5RkHFxf4qEe8fN
	JNO26dKOJ7h2HuVjy1fPxn88Gt7V6g==
X-Received: by 2002:a05:693c:2285:b0:2f2:6dde:df66 with SMTP id
 5a478bee46e88-3044905daafmr13410331eec.22.1779945490943; Wed, 27 May 2026
 22:18:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520182124.117863-1-clamor95@gmail.com> <20260527151432.GE671544@google.com>
In-Reply-To: <20260527151432.GE671544@google.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 28 May 2026 08:17:59 +0300
X-Gm-Features: AVHnY4IwFtKSnlUuqqQMSGRUcAGiZFh32kg3QDjdUxx72WXz6drvM_0v5ARcn1g
Message-ID: <CAPVz0n2b2LphZgw7FeqMTw1gfKuMdagQ9pt-GJ4sziC5Atx9mA@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] mfd: cpcap: convert documentation to schema and
 add Mot board support
To: Lee Jones <lee@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 27 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 18:1=
4 Lee Jones <lee@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, 20 May 2026, Svyatoslav Ryhel wrote:
>
> > The initial goal was only to add support for the CPCAP used in the Mot
> > Tegra20 board; however, since the documentation was already partially
> > converted, I decided to complete the conversion to schema too.
> >
> > The CPCAP regulator, leds, rtc, pwrbutton and core files were converted
> > from TXT to YAML while preserving the original structure. Mot board
> > compatibility was added to the regulator and core schema. Since these
> > were one-line patches, they were not separated into dedicated commits;
> > however, the commit message notes this for both cases.
> >
> > Finally, the CPCAP MFD was slightly refactored to improve support for
> > multiple subcell compositions.
>
> Once you've fixed the DT issues that Rob pointed out, I'll merge the set.
>

That is already done. The address-cells and size-cells props were
removed from the main node in this iteration.

> --
> Lee Jones
