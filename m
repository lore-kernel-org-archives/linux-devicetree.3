Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094733A872C
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485865; cv=pass; b=HD2GH8RnvvxQfL+b/MuPVxU1BXAyNsDmyTctHa48EC7xEiImbqTOSZVe/ZCm75QNNYiNKziV9893So0dEiqfIWBNXRAq3YO630Yu/64P9BMDqYw7d9EMtipSJJlxLG6a61pAzAlo/3oIKrKD+8fccpWEDG3kT/1yLoIp4FJRWJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485865; c=relaxed/simple;
	bh=re94KlHHKVD5VQwjuk/UtyqmSoROW0QE/hNcCoTSgaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5Fndm2J55I5wlWcsMyYEgcPLkGDOeJogk/wqyYIQPRry/rhtr2e6wyBdEt9DzdWNixPL/HMbiYevxN+wPtxP1V5uIYOoqokWtNkND5Le9rAESAXX42wcagKuT9U1FaO253B+OPvdn7DRjN6yHv8MJviK7tkxBCFoNIR0ggO6ZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dg+rOw3S; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dg+rOw3S"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso6065599eec.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 00:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485845; cv=none;
        d=google.com; s=arc-20240605;
        b=WLImoI9gW9pGNo9v9CfxU2QWnXzwnoW2qHRncztqjuzNUEK42mI/S6pOLu4FPlGJP5
         k0ZF4+8e1UYUV5AfTPyqU6G54yhtzFOPJWsJ0TbbjbFlkL7AbMhv7B6sCaU3jyrgqlCl
         QMcnNrxqwreVMElm25TIAPFqaWy8sUvYYL1gXhZB3XniaCOIeiCqcOQ5s6Qtex6AC+Ry
         x0Uwul3aWZe8whlk0AXxUXO+pQ0o056RbsTDMv65r96IF2kLO6PnypdvHnvtaJ/gUj6X
         iA2AATueqtpSIyskwxartCpAtXh5qsalG0IoEB3rjW7XVmAAygUFqOx8mgkDbfF660qH
         vcVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7SyAk4iVepITB2rBUej8UdXxBx9zKqBP0ZKuTVk+m9M=;
        fh=MIIjKpfBEZwWPv16oI7u0/9951h5hOfDd2WN5Rc6we4=;
        b=NrUFODVEQfjXXbZRz2E1hjb8bJOAIOtm6R3aMWWOI2vcCPTAIkC78sDCNzLwXlGE1y
         StlpUBSYCJvVNCdfjrsCaSoLUhQyZ5OFZu8PQaABMK6AI+XG3eIzhXzeK7D8huIWipDf
         nVGYTVekbkEP02CqUYxq4NzlelJL08paXUy3UBQ1LmNyHVCPMvjlU4B+lsdNI4uBqIHD
         g6IyS5axSvzFl63WTgALUpHHBGELq/mInSLpcvMT2UhJfBJgGmLCpzP3UA2ZtsrPq4QX
         N16Qd8nn+uNPWzuO1Gmu69FZ7mdUsy26VI68aaLIN1tsUAuE9XfFcxvrCw/8U5Tjk5cD
         bDoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485845; x=1779090645; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7SyAk4iVepITB2rBUej8UdXxBx9zKqBP0ZKuTVk+m9M=;
        b=Dg+rOw3SpzsgV+gPI/bp/Sy8qO5za3AWGoUZuvLuFHnHvlbXcr0QxEgiVBwIYEM3dS
         S/HfR04gFriuZx8MZSOsAXKXSryx2ptgdsE4QB4EG1L5GSooPHzLvczrmWxp9+CfWHrw
         Gkm6qWZ00mZB2WMIuYxwEEuYr1IT2dzGn914YCrunkYpiWM8ctC8eZHZJquorPPCj0CB
         +/ll/Is+6Iwpa798tdmJVzHVWZFP5CorGAFW9zVTnpkWuTxcVKGgVpdgyFT9DJIhkdKl
         6nsfpiTD8TNJb5LzMxVZGAPan1iraDG/foK3582K1lSo/ONMnrqB2Hr07L0FcbQgkQmM
         qOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485845; x=1779090645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7SyAk4iVepITB2rBUej8UdXxBx9zKqBP0ZKuTVk+m9M=;
        b=UI8U9lYHW4hWR3EekQ+mOBR0GQenIYF0IK2hMWQZ2oH1UtWeGZ5sMcuTqkn0RUrb2t
         vqgQwmvDxBpUC8/lgl1tBfVpWsBh7ia5F7lIyeWnJnPAPJvSx/e0Z/ZZ3GVhZvHYA7ox
         HBap5PcGiC4mNCpkzdsScC1uWteAxEPDgfss1IRD4ge7Y/FRBielE40jkI/shSlW7CDn
         5g5YECpOHp3wEq4CxXCdNAgfv32k8eNLOpmBIHjmAzPU49krj/yQfxD+F9AWd+6eQ/KB
         0l+UOiGouS88QjlG585vGxzVwlgH3wtcTWdR5vDq0ADNsZ4YsYmjsKcOuu5gfPgJshrD
         AShw==
X-Gm-Message-State: AOJu0Yzn3Z6wLpYs5sb+Pc1Kjc09220v+i2dpe+zcyQspoyN2f6cLHfH
	8XBPxRvZ6xRASf6OYuX316Rw4pVWcDVQId+kNB1r0j9E3M6BuiDjriRME8ACFfrw4rVaC/4wn2H
	TgP7/Gv4Lg2DeHRGTxxZVGHKuG4GpVUY=
X-Gm-Gg: Acq92OEVMEKCMG1Am+0Um0rTTUAVg0kK+mXYX6eZqXlEpIUXgezKUQZr/CmBpnFN0Yt
	9gjU+iI3jdSC5AZRNLUcYUp9oxO39D3MqSNT3MY6I5C6R1C8Y3QJAyNLXCNUjCC2299g4gEpNgY
	38yq07s/V0vqL+icXMiw4p+CtejDLNnmmNcwsW7rwzaQscA1kqF9h2lXLgF3XvAXmfx2b0hPVI6
	x2iMlVci2pOlK2UguzKbZgFrMBe1tgrtmCKbhpSVlSYf3zli+/zXdZ6R+F2NUQlgN+R5EqLbJ/m
	G1MhmwBnzj0MrxpQCQI=
X-Received: by 2002:a05:7301:1008:b0:2d9:b466:5e19 with SMTP id
 5a478bee46e88-2fb4b733d76mr3944062eec.21.1778485844839; Mon, 11 May 2026
 00:50:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511074752.24745-1-clamor95@gmail.com>
In-Reply-To: <20260511074752.24745-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 May 2026 10:50:33 +0300
X-Gm-Features: AVHnY4LhmDvsZ_CnFuECqUjDQDEyzCnSTnfQlaiMCmcaCZvop0DASzNSUfWKOkI
Message-ID: <CAPVz0n3Dh+Rjxo3_2zvfp_R97cHrSqRNTW7MCQhu950HGT0wdg@mail.gmail.com>
Subject: Re: [PATCH v1 0/5] gpu/drm: tegra: add DSI support for Tegra20/Tegra30
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:4=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Tegra20/Tegra30 DSI is quite similar to Tegra114+ apart MIPI calibration
> logic and clocks. With a few minor tweaks, existing tegra DSI driver
> should work on Tegra20/Tegra30 devices just fine. Tested on
> Motorola Atrix 4G (T20) and ASUS VivoTab RT TF600T (T30).
>
> Svyatoslav Ryhel (5):
>   dt-bindings: display: tegra: document MIPI calibration for
>     Tegra20/Tegra30
>   clk: tegra20: reparent dsi clock to pll_d_out0
>   gpu/drm: host1x: mipi: add Tegra20/Tegra30 MIPI calibration logic
>   gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
>   ARM: tegra: add MIPI calibration binding for Tegra20/Tegra30
>
>  .../display/tegra/nvidia,tegra114-mipi.yaml   | 41 ++++++++--
>  arch/arm/boot/dts/nvidia/tegra20.dtsi         | 14 ++++
>  arch/arm/boot/dts/nvidia/tegra30.dtsi         | 18 ++++
>  drivers/clk/tegra/clk-tegra20.c               |  5 +-
>  drivers/gpu/drm/tegra/drm.c                   |  2 +
>  drivers/gpu/drm/tegra/dsi.c                   | 69 ++++++++++------
>  drivers/gpu/drm/tegra/dsi.h                   | 10 +++
>  drivers/gpu/host1x/mipi.c                     | 82 +++++++++++++++++++
>  8 files changed, 206 insertions(+), 35 deletions(-)
>
> --
> 2.48.1
>

Please ignore this. This patch was send by mistake. Sorry for inconvenience=
.
