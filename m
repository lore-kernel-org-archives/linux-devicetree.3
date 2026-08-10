Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1EA37A840
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346615; cv=none; b=rEBKj51F0DFw4IuHsdP4gIeTBmx7tnfWsfiXgdlMjKncHD4EUpetSO7Y3es4ha7hEKCh9puXj3glXXgAMVazB6Si3nIc72RXt42DVTvUhnPy0KAb8Yh0zN2DSEBDm2sWAGstVWexjl2J9/nYVepzvZOFKUV388lTD7Tw9AtYThI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346615; c=relaxed/simple;
	bh=WCowh7oPKQDKfddKouHpaByvNjhTD1qDX3l1ombbgok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+ZVEvY+6OcRIvDRqIYfB6Pp/T+P3Ck0pEdA5DsGBJ7TfGCVL3rYbP07MQuarVBA22XRdD9BCePysBu3UcfwqQkJQ6yyDq2HBpjmYRk5s8eu8RK9SdchmMbpislf4BuMKcF0/QvF6fKZBqU5dO9aovydeJiY+HF7WcIvvDKg6LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jZS4Pydd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jZS4Pydd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2061F00ADB
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346614;
	bh=WCowh7oPKQDKfddKouHpaByvNjhTD1qDX3l1ombbgok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jZS4PyddW90wd64RsAZDXEDTDc8z7ncRc8ghSnHjqMRfNocu0OllRQvx0dthxmDA5
	 7iB1NH6/N/XpF33sOYvrWNJT7OBVsB9jbkQIgWUU2XW4vrjcSR0dYhU/H90b5gVGyQ
	 gPS5cRTLKxfWKmuUH2Pj34/Hw1MVW6uBci9EO6TjSdVsCen16XjMnLsaHEHhcuzRAS
	 /+f6DA6R3rFHX33fw2Hj/n9r4ChTmjHiVMH4vwL1EuPy0bba8O2cEE2cUE3BLZRNfM
	 e33/DpqgGhzJKdou0GlsNzR3d9/DiBzmTgjGpDXeKSEnnvbc9Wru1h5eYaVMqaH0Fa
	 TRSG3/ZMA84Hg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b2aab18795so1473379e87.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 00:23:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqllTCV541gUG3dd0ORIyW26wHiSKPLynMJodOzmxxK0D6Kd4THwFQg2IXKelB9dtKjx0PWiWsuntcl@vger.kernel.org
X-Gm-Message-State: AOJu0YxkROT/XpKNPPO0GSzETeT7XoyBmZ8cP+/vhkQHDOrtdfpt30Ap
	pdySnA9gqfz5vUo/9H+2omtjpVpMU+dx5cZLeKTcGaR6/wqjT8GzicLFFSMU69AwxeGukXGV9D/
	9w+GBhbp7Gl7QOnL+4DhzU9Bw6cgDXmE=
X-Received: by 2002:a05:6512:3189:b0:5b1:5379:8b6d with SMTP id
 2adb3069b0e04-5b30b72c871mr2256251e87.23.1786346612692; Mon, 10 Aug 2026
 00:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786262697.git.naseefkm@gmail.com>
In-Reply-To: <cover.1786262697.git.naseefkm@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 09:23:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
X-Gm-Features: AUfX_mzVkSbHAHgL9M7a1IoNBPEOmu4qBOswFPvdaIh1-PehrZuAw66Jtzg-62I
Message-ID: <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-gpio@vger.kernel.org, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ahmed,

thanks for your patches!

On Sun, Aug 9, 2026 at 10:05=E2=80=AFAM Ahmed Naseef <naseefkm@gmail.com> w=
rote:

> The series is based on linux-pinctrl/for-next, as it depends on the
> per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
> phandle that landed there.

If we can get a speedy review on these patches I don't mind merging
them for v7.3 already, it's nice to get some movement on all the
nice Airoha silicon.

Yours,
Linus Walleij
