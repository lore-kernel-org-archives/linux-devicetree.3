Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2273A2F4A05
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645732; cv=pass; b=dG64ZA/hJ/CjGJSButH9wZwZZkFn3IDDVkYwASEE8xScL2y0GmBFQBsGFIyFZdLuRSb0BxegsnkdoO9wZlmWdsUgyDQIISUwdFM6SBuv3hLKHdXF5ZZ+bW0ke3k5DTfctTnWmfPmrSIj23x64pgAXAymv96eshgQRa7suWLWw8k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645732; c=relaxed/simple;
	bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQDtD9mjD7Tdeo3gHcPEJ23GBzOmGlmNcnF1IPjoekaCMm1hyONZAf9Kw3p/tu4MtkD9ZIws7VapuMGyN0wCPh9+HeFEIan/OdlnHElnEgY7TntIEk+qHT4JeNIj8DX6bQuZjL0kfcQfFOvHYjZohytgyiHQ4oPfaixY9LtBdEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIW6fuKd; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIW6fuKd"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-39c953950dfso1261311fa.1
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 11:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786645729; cv=none;
        d=google.com; s=arc-20260327;
        b=m5AMq8vUn62PyWsVozWDFwSnQBPD1hRtgAT37r/XcuU6npCqn6ClSdOA21HxcNzyXs
         s0SQ6pNlGVsXBhZno6bL2LWUyL1wrajHAWVsjHnSYmB7W80b452KHxcIBkFNgQ+NzCz0
         MNBYAkXb4wJE2Cz7T8VE0xJKifMAYdDSQviaPzzLIX8VsGuszfAEVHF/EiSf2cGHT/iF
         kSAuTusbA/bNhhRRCnyVywaW9bxViL5Dw60Gn0XcmZYQmB7/KHyC564sN4Y7JYSSKhk9
         sGnucj4vIUgvcZfAimxKfb84fR4qQ5j5xmKdOQKS1MICZU4l44W6jMAL4TA/gC7yv3sv
         EfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=;
        fh=5fFN1ad0o2dfU9S62RabIbpRLABuRHrFbtfoOffAQVs=;
        b=fyXsMW1PYpU2qLobZQ9e2HtnZ2FncdnGMGyzcrAIYrmRpinv9psl47eu+tsYa+NSYZ
         Bf7GW76zZCh8duaobMR/tuAAt7QAJBuuPvntZ36PtaEuIkPJchB84HV5apPt1V2rQoSm
         imBE60acZav2LWLuNFTPcELfbNFxIqiNIwjPXDeeBrJGSRSCisP4P/RUZ0SCbqd9Auo5
         kZvbP9zCC6MRBG5JVIJb0OH29dHiLpcsIbEfg7gx/0fZVzY+B8G/28CFBaxG8cLEt15g
         9ZR4zKXhLzQw77GuJLJhUvn3zrzzHgALODsM4FQbB5DJbdMJ+xaxxRMpZ5iA3ahoGa/B
         YFfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786645729; x=1787250529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=;
        b=KIW6fuKdBFW64QK8X9b0BlFYsWpfziz2xVwC05LMcHpe6tmYfD7xoit9MUb4Q2DSXS
         znNqYHU/8ZwYu0WT/pAEN/QVqZumP3N9qQlekxCuluYxfwVww3gZ5C7bJBmbJeURnZR1
         lyhgnGLEM0Of5jvWAVxX9vU8yTaIPiK07lVZ/P3g0Lr6n76xa3YhMkZbXn782U/o0UIE
         CVjX0txvLnceXMZDAqhuQEJ57lyi+aoFhLEpvZ9sZAnz4P4dcIXpyV0wK4UkkwHww+u4
         Hv0VtK6E1SztVN+3ixRvY0Y74ML0/TecwKGuKHjsFRMJTQHVXlTYZl6OjHFELVB7VUbh
         cdJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786645729; x=1787250529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=;
        b=lQKCFogDI3lMU0WcRnxFeRilBydPs6hORxpX+9f9rclTZayfaAZAzqPbMJhDC9i3TX
         cMWJvwYMJZnN4FZ9y5GScNxASp02O2mjTeOEJlrUQR+4FbRhYdLwTHScc5ZYtc3YVIgO
         mtOZjPRypbmMzsftVb3udf6bBHX/vQ7p533KucYOEWVQ9G3ZoJ3KpU5rGrBvfBIEdIBP
         FmgJ8esD0U+6FYknhnhiC9EXHCQhfEZ5FXzSdVs+DQ1lcw01NYTGeg8az/6wvxTqM6xc
         82njdaUjyUkONcZXzBMSw/3pV8SXKfQU+DuUW2b3zyHj6OAFuPx8OcGK/ykHWTAWDsrH
         i0kA==
X-Forwarded-Encrypted: i=1; AHgh+RonX2pyF5t2ZmXlDkKy/5o37mWYg7xPF2UjEoDbLZxHDFlIgm9/yLO4HobTKOOlbQUPKKXaDH1vKd5K@vger.kernel.org
X-Gm-Message-State: AOJu0YxqNPebymCftqYWaf4XK83RyGUtxyzS6OULZqBXa5f18iUBceV4
	6sSdesB9xkOTP6zauuim3st2c0+ZID68GAhinke7dgRXeJaOqldy+jzBU94OkeiCh5Li1oIHEaM
	5adsiimbQ4tgR0iEnYE1AAV0EZyWvJQE=
X-Gm-Gg: AR+sD11hggUlyvSlZHCxCcj+iFFdZMlSP9oDl4zXW3EXEejhVyc2jIMHaTU+M22fcMM
	TcfvTiQbY4mrVe19Uyg3kgw5CVvrqlyWMauLB017TmmBouGhoHelCXvHDEaGuot4unW/po+vtUV
	xYGLw0ljt/YVMOKFZ0C3CyTH9VEYr9sVSp3LIOba8lQJZGgCkX7kYu4Pn5fLeqTD7hDbFewfRGD
	5PIuCS1xCk4oRX2lQnI+UNfFdmuLvrCo+oCqKpAn5S9W12+byiaeBq0BlKS92/83Mfcm52/N939
	qBGaSdBQ3hasL9LYurNVqyvFMVq7ALMrsb6eNAWAIPAW6qLA8CHQ6GyR1Wa44xcxu+W6d9Qs+EB
	JWzvIBCuoqOYixFEOu34Q6/j4fJO609CMIw==
X-Received: by 2002:a05:651c:144c:b0:39f:a2be:bc3f with SMTP id
 38308e7fff4ca-3a1324a50b0mr553821fa.16.1786645728923; Thu, 13 Aug 2026
 11:28:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 13 Aug 2026 15:28:36 -0300
X-Gm-Features: AUfX_my5p0yWdwpoBKfTk9A0esYAtB3NODe2jCHwBG5CaU5OZpEHLSdJGKH_EW4
Message-ID: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] ARM: dts: vf: Iris carrier board for the Colibri
 VF50 and VF61
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco@dolcini.it>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mehmet,

On Thu, Aug 13, 2026 at 1:11=E2=80=AFPM Mehmet Fide <mehmet.fide@gmail.com>=
 wrote:
>
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> This adds a device tree for the Toradex Iris carrier board carrying the
> Vybrid Colibri modules, plus two small preparatory patches for the
> module-level dtsi that the i.MX Colibri variants already had.
>
> Everything was tested on a Colibri VF50 on an Iris V1.1 running 6.18.

What about the latest mainline kernel, 7.2-rc7?
