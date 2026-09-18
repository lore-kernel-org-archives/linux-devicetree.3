Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC7351FCDD
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756259; cv=pass; b=hBPJkfnWp+lyQjaTHNBEuVKr3OHC9vzrK3nNenI5nPNh9Yk0BLf18Vds4Bhs1PjX7oGemDEO6bgWLjOJAKyanqwtAi3rA0Ie8H58Fb4P0kC/BIX0Yv/waDTfZ9UUKrpKuc6GjR2BqtLOep4LptyM8Bb7SiikhifdEHHHCaei0q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756259; c=relaxed/simple;
	bh=Z3GCDadB22nJ3H8dlp8oFEKsrJ7JLQwFPKhgk/HwR1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJS7eJo04Zn8oGPh/rQL2j0jv723ky0Eo0tPy/T9SOB3328qsCEdYjVSAdDGhyVstqLzepG/XtkL3ifkzM4TDWn9eRYpLhslKxnP9w/t9eZdsHj5n+cWypu6O23Cuv10cbH3rmFltdgzii+ANiR03bbOn/5qL+RMd5kdxTvhdgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7pXUP8g; arc=pass smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7pXUP8g"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc5256c2a4bso751332a12.1
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756253; cv=none;
        d=google.com; s=arc-20260327;
        b=jzLzjSvEHjddunuZ9BwHfBcQRMfAdEvBfJ3k2PhCeX9vC2K+x5ocTeYHFGUEteSgfF
         vxhnznsE2uRHeVgMiVlRZ5M+lIDtN3qEWFrgjPjs19WI96HoZ9e6VdVrECVmqi+z1oue
         zkMN4HuibW0Xli75YmHbqqkIwM/hhSBt9CyOwGEtL8YcKQ8tP97f5SC8Apje1MwsRlYj
         tJ73hUWMC7+SMXOy4hPEpbiUuIvrc617HvvUN51i0XUJ6HklQvZZSIHBXN7zZJT5x4qI
         byGjqH4fSzi+kQzCbHqYI7i5TpJBjXvSw07Vs29CTy7FFeG6BmB8YA9MFIP4snxtZFS3
         Vp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        fh=5+y7mdbjvC2dddo4ParPYT08mxKS1/jnbo+Ip22djVQ=;
        b=UQz0CAuFrhUaXBd9uKJ1OrMtwJ3MFGC6YZZhIo2dYpQmF8zA7RUluwcMTCFpAzqlJp
         3rCS5xydvpxsGlPyo1XgIl0n+wPv9j25w+z6L/OfaLR8EY+qS4UDWByhKRmt90EG7r3T
         s7FwwFmBbmu0mlTt6pT8CpB5tgj0Qr+MKEWT7C9jgfXXZI7MtOYwi8jJM/kuQqZybr1Q
         9XjMjg0vlgz8nnVQ/mzVgPHEYh69wk+lKSYehdAv6t5RfGpk/i1UmiAHG16Kgn+z1lUH
         4fSHe1xE1b0w0P4ldJgWPe5mRzkVaIURkPhVL4ZOu4y6cUz+amr9l9MrTia+bFh9dMll
         9ubw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756253; x=1790361053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=C7pXUP8gPhskr6JrmaOqzZbQFyo1KCY0eWKQkzc1OTFuEgVNYdOOrYRvHXw4nvnV9X
         mBJPmUNTK38gMHYRi6phSIKGl4On4aHQGIrh/tv15tmpYc/TdZdWJidlJ3FLVoSdZv3A
         FMoXWk0qCpi8QwmMIh9pp8LuAIMuI+NYcr6bn5YVg8vUm4kSXDfisDdtDWvcU+0buAPa
         GATSG9GzrWjt6/EwRXvdqd5nItW2XnjP5ciEFJ4zvwfY4YLLtuNpZ/+47iKZdFBt2F+a
         GbejvzsiPaxFvUyr4smI7t8qM4KBpFVHBG175O6AcfOs0HAmLG3eoKCS1AFnL6nqubHI
         npyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756253; x=1790361053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=WHfC3D1KvGmdMVPIsi5v0G1EySNg2nuZfiB2/pOtC+a3euhUQxEk/B7n2VzjwcvX4G
         C8Sfb8+Yej3r3WtQcsamfYU8Gfjz1v/UzEl+OiVTK6mHzvvyCQdPBdYNU4VuGRtfsWUh
         dThBz7IDfUvg6A4A1UPcW+fvy/ThjaImIY7hbuqCraHFNpYG9LRKxTHUtLck9EAl1jWh
         Zocbx1fnkI9mJrdUoN1Oj3hYG3aHKo3jIFjXSWeix8+XIFxJoOIrYJ48eFATnDOOUfNe
         R3YFvw+L71rOqlVQLyCqu5Ubdl6PeERilEEk3dmMhMIe7Nt2rNVcBS55ige6bPQRLk2j
         0wZw==
X-Forwarded-Encrypted: i=1; AKwUvBy70opi35hcocfKi8smucukxKaS4Bv7ayL2znpNBp68v71/f1KYQ5BG1E0KYBonJ8ynMeyXmGWw8blX@vger.kernel.org
X-Gm-Message-State: AFuF++m5CCR13vIRv49IzupWKTSXlPIlulYxF7fWGeH3cihj7kRYqHHX
	FEhwRjm22n7+lOnNkARDcbBhoN385Dn+dradIn0mCuE0tQPVuwez3aDRpnnYrHtKmWIWyCYAuW+
	25/Gsc92GOtLIL+X/IwX974N6J3kgK+Y=
X-Gm-Gg: AYBFou3hNLSGhFYdU8MQTdbrPmTp7DqDDQbPkEZP3T0YwXvtCZ4JWFwJFGblUYaiY+g
	6kURZp9kNNZDsgOCdSdUh+Nj6P5zTYX4e5Eexk6fAJQwD7aNwgONtfuPAyCaSw6vVqzoVPJyCFZ
	XA3E+OaEpmpfEkWwEgvQ/1Yop+IsCvDaCymVp6zwR/waeIwxzJPjOMm2fqAU5Zjl3tUxemnvwf0
	ZtlYcIPdkj1FVFDDqf1WLALlpmQe8ewfrVHIwvjacncwNsiMpuMKRDshslipOZeCQF/rsns98zJ
	K/i63EpQgZOC8kqziE0llqM6NY7toCbRjasTIfZMU6p1Df6+gCi0+MFV/rmOk24FNGKkBRO3yQb
	LjSH1JZTcpmPZ
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id
 98e67ed59e1d1-39e6c69f55fmr655165a91.65.1789756253090; Fri, 18 Sep 2026
 11:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Sep 2026 21:30:41 +0300
X-Gm-Features: AcwNN1UUuDTcQsQdT6LSC3YiQR-XJenFcyp7p3MxtUdbO4cYi1dTxigUEDSEcPc
Message-ID: <CAPVz0n2pZukL2tnaJef-N=kRiudVLN7RsTjKJJkTqp9-_k7HwA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] ARM: tegra: Convert to new media orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 18 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:44 Kier=
an Bingham
<kieran.bingham@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the nvidia device trees to use the new
> definitions.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++=
-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)
>

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
