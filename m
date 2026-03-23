Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAFF3C2799
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 17:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285730; cv=none; b=Q6Tk7RoGn+Ic+JMmoQzdIJ26jpJHwXduqDh2mUn2+85nYEa0Ih9Nujy4nffdyohB4l7TBK2d6NHtJ/4ZkNwelcDUqFELrruNOT9JOu/kpu/SuJOqveCoKjTuEH2amsT6G3k5KQ1hs6HOuWy6zKeaLKTM20+kCLPTRU9iNANLCkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285730; c=relaxed/simple;
	bh=ea014rg9Id3LjbCkFFKL5NQgh0vM+cp3ePkl8S2utWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lPlGNHufDyASVgsG3yeHIuQF0xTNv5yF8OTNoAQ6xYqLi9t5tH5NSrbr9EtGfLJX5A2c/OVGebLbXezhb/tky4AoELB9Es8xEXpgND5ZceP5caXcs3R6rcPRz8QKxEOnJNVTGtHI/mCX5LzlJtCisu0BMkRkaklIASbeiOMWRAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38a23dd61c1so36846791fa.1
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285726; x=1774890526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ea014rg9Id3LjbCkFFKL5NQgh0vM+cp3ePkl8S2utWg=;
        b=M5rY+q3/fNm/Lu7HC0zzyrKFgLStxeotymurcJwEbia9Lpz6I28RjYfXCWk3ZaTdX3
         8WQc/o3Bu1MXC/y9AOMn1yxP7qdZSprNJeaNiVAQIEWlJqCg00+W/HA8IW7128MlY4n3
         kr0XuOUX9lpNzKKGSsz0fEkTAXKak7ZSHX8rLDH5lX+R1dWTw9zWwbfWZJkflU1CPCIz
         n8QJMuck9rrBmOV0Kae61HtHSEAU3ogD+2sKVbapqYCgeRgBm+/U+bic6b7crRnpL4BL
         Q1l+Uj0M2Xa1/1bnR2MCMpXaTbeduYDkZ+0glsgHxMV3Npl6DP+4SUGzLhfmJw66w/f+
         wSiA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ97a35MJYjcoZXHx/jPFNkIUt4pYipEFZD5P85Ha5Hv2G5tB0XCOPM4gTcRk56gilOhGO0IIv0p2u@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3jepArDVnUSPamCH6tr8lfHABlQh3gUUZzO+SYqKsmoqnu2ju
	Qmyc51ReenZC3OTubQn+IYav3xoVVwvYcZiDSAPQ2/LdzxdDUcXTNw50CXGCFk+z
X-Gm-Gg: ATEYQzwh7u6AVNembkTrsf07xtSuaOKyNooQl7OIqhDTseEcKLG7jDXpg8IIDTOmFpD
	/ssyimAQquueug7GZyZAQPMM8hO++5gi5HNwH84rouss+fydAsWC/bNTDRx17mFdQSrBqOkOPu3
	MvV8gXMEF0O8y9L83spBejfk6131IjXHs1Wx7PakOciUehoDGGwsuL9Y8adzmdWiCPIZ3eD/dkR
	A0HxnW8bfhCcEtBSfa6WJuuqhSiMnA1oXYjMAz1SGcxlqiuXylCrHZdRyRUd3VfuS7q8/kwsHs8
	5y57Ns/LzqQZGywWzCyzWWSzkDC4oCMAjfd0UN+PPpf1Uh9sgpQ0ur0of9J/TiBXpv8GoRH0ZRH
	JLb7wgsV7ZqLjjx5E4gyeNgKHb7JtAGkNI99kYga1eNDAHAxaa7HGxhuwAe3qwlKN11bHbKTIVg
	Q6oQJ3hSiLnMBtNidgwYsOVRf3T3aXXJIjjwAVJHDFqs4oFjMwv58=
X-Received: by 2002:a05:651c:150d:b0:38c:e63:698b with SMTP id 38308e7fff4ca-38c0e6373d7mr23533401fa.13.1774285726045;
        Mon, 23 Mar 2026 10:08:46 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9aa7cd0sm27107751fa.32.2026.03.23.10.08.45
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:08:45 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso4274710e87.0
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 10:08:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYG9ic0GzkuqO5ZdkvUlb0GPGbRtIwFojoBsLcg/kcKwdi8igbAank/v8fDJgmpEiPtinaj9LBq1it@vger.kernel.org
X-Received: by 2002:a05:6512:3b2a:b0:5a1:3400:f937 with SMTP id
 2adb3069b0e04-5a285af5768mr4364578e87.7.1774285725281; Mon, 23 Mar 2026
 10:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260323110151.2352832-1-andre.przywara@arm.com> <20260323110151.2352832-5-andre.przywara@arm.com>
In-Reply-To: <20260323110151.2352832-5-andre.przywara@arm.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 24 Mar 2026 01:08:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v64+bQL7a4C=+ja15wN5=JZM9EN6KL3i3zKiSSOH_VjycQ@mail.gmail.com>
X-Gm-Features: AQROBzCe4pxhD7VX5GMz8Rw4tgWfnVyG9ksfoBVa9-SlxUX0n6uC5n3LkQE4wJU
Message-ID: <CAGb2v64+bQL7a4C=+ja15wN5=JZM9EN6KL3i3zKiSSOH_VjycQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: allwinner: a523: Add missing GPIO interrupt
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michal Piekos <michal.piekos@mmpsystems.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 7:02=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Even though the Allwinner A523 SoC implements 10 GPIO banks, it has
> actually registers for 11 IRQ banks, and even an interrupt assigned to
> the first, non-implemented IRQ bank.
> Add that first interrupt to the list of GPIO interrupts, to correct the
> association between IRQs and GPIO banks.
>
> This fixes GPIO IRQ operation on boards with A523 SoCs, as seen by
> broken SD card detect functionality, for instance.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: 35ac96f79664 ("arm64: dts: allwinner: Add Allwinner A523 .dtsi fil=
e")

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
