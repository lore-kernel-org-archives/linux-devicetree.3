Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4632E3783BE
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 08:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142021; cv=pass; b=RLrJV6xQg4yZN6iOwlwONqkSSZIVUjKiFY+vDmRzj73iMl9uwjNfKiMCMcaeGZAEk9ypnjfYVsfT5p80oaabyo32qPj73+fy22BFS5lcNfypQ2ukyVyqyUleJcMqoCeZ2qOiCQ4Ai41+R5cMKBtVk61wsAbOyxBj9BsXhy+CN8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142021; c=relaxed/simple;
	bh=wajiAQ3MdgD5qZ4qOwSJHk+gv8ufR8tUJYp4k5ntU6I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rXtOxJ6PKBOCMC/ATfaddq7Ga+KzGX1NUIKxKESTegxZzATVPeKyMfSQrVjOc0HKLKOsMMNt4dikfXaHYaUDYE/dXmY1LXFtS9WhRCFOHXY5xrK/2Q16mz8VKaUfr7HUOZgzWYD8IAFo0nNEgJbqSLBtn/Puc2jOJJVbKcdpdnc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ayDfjjBL; arc=pass smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ayDfjjBL"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-662efd1bdd4so329673eaf.0
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 01:20:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778142018; cv=none;
        d=google.com; s=arc-20240605;
        b=NZ5Xg2LpplIVMU22r5gHrvL+RpqN++MEQGxZos91biXlqQ0A9ZUD32cA3YrhyFYH7H
         fouJV90W4vWFdGPDLUFzNy3NJleMw5/m5W1cW6k03lBc3Lr7MglcyZVUc0HywcQvFA9r
         CIOCzUo6Pvrp9I24pZmSnl238PYQoIG+EkF4On0lqtYbxLCQ/zq1MMVtKKDTGfTuZ2qk
         y8mJg2BGUj/zEr+18Bn+terw+mZVwOO80k/jgdK/r5cJha5nqEwU5SjOXNhdhFhKoY2J
         TMF8HdI6FF9PfmEiwTwal7DdNgm2xG0+FeTmd2fNYZQXL5oS6wxTa6voG80E9RQPTZ+E
         b7Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bWYx5HG66i84XevwfveNmgHdFOQmLx/UvaTFzQl0TiU=;
        fh=xgTKGLk9Ptae1bdXHqVJQqfG5FNhzQ/9NDjRAWfnfLc=;
        b=JKz+JGDjlPSOxGxIZM/xwm6dNvoxFD7aX85ZcnV7zwc/iGAv5Zp3Dz4YIk6z6uULy4
         hI2wRry1buyPgukYms8XC+QZB8Gn6o7YKGqSOMun5gOxVgLG32DyEG24cE6aq3WGGwET
         nqiXjzIHA86cEIP9SE3v9DodskFDk+13LL+Bw2bl89naUk2mPbBMpyrev3Iq+d9TWqnt
         4ml+4gm2aIlRgT4ALtBszPc5mukUYxzIUYtc66VjbdU/UFln7/R9NQthDaDFnc1RzROr
         xqHsFGWBY0Q9Sfze+7EyeYEPhKp3vZpfRMfe5CmffaoYZna5cMd1hbJC63WDK1U4Upj0
         bO7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1778142018; x=1778746818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWYx5HG66i84XevwfveNmgHdFOQmLx/UvaTFzQl0TiU=;
        b=ayDfjjBLlFqLnlZ0PnS5UgOxLtf0PqVoGoJBhpp/7IRF9Nl80kDbMCQEK6cESOII4J
         t7Jh0oH1qxI9pmhW9AaB31Ak2Oy4I1RTg1fP3y70J7uOTy0UNeyp1XjBjVnlIL0OZ15D
         BcMbzujuM+vLaRpagHbfk0W6mZsQZy9k1HZxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142018; x=1778746818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bWYx5HG66i84XevwfveNmgHdFOQmLx/UvaTFzQl0TiU=;
        b=IHO8SZmNTqragoG2y+JThEuOYGHBrsT3C2MBhxzZtNjnbsbCO74LwAlQ8bvcx4TAnW
         0lALifGwLx0VUPqDl+7+Jk5aRoUXkG6OTDPtSJdGIgZJv9fI9XhlIfPmjp2tJds9n29c
         NeKK7ZeA1rRrhdfZRxAbCjAqwRj9AeMwFRgRnQ3g9U708ifFRBYAWCRhya190E/2GDVm
         hGunZBulCHuk0unxB/3y3t7IWa1PEvxFEyW2gtitMsm4rBgYZeB/W9eDRkcUF2/B20nv
         mVNyQ8xo9XuOcsu87U5EmSgwU2E1I8s5hJx+QjkmuzptJxbAi0UrgRSbxEv1K4bIbL5I
         sLkg==
X-Forwarded-Encrypted: i=1; AFNElJ95cCAq/BQLo/lDFZh3cbIwGaNlC9jt+IqXdkYHT0TP/NzwRPJJuKhiZNxi8xrQQGtvS79G5eXT8JGG@vger.kernel.org
X-Gm-Message-State: AOJu0YwNOOG7g8ibYtXyyve304zVJn8FJg6Y7/J7kq4sQXfT+6p0GgUZ
	thU+7iipXGE38Jh2NTSODv95U/2AenTw+yUKihiKL2K5QsmV+FhXID3WV2Gbm6KUNfOTHAK6k9G
	PMFVm81GYMwhn50no5jwmOzwpglrNhIbAHJXMy1QOgQ==
X-Gm-Gg: AeBDies60HhOuYDY2N1Mg+ehbqub9PPpKLAYl/t+91oqnFAx4vfuMEoXv3r6caf61xV
	UOBBKYG3SBb2EkHGS3u0vA/UNwGmyNweNpUjG1+i+/J2XxYh0NgNEtF0ZdrkqYfRobUAxI/5aXZ
	vmTw4h+gHsDT4PloRCa8dphLI/DtigKvCUn9KXNV/HTkBi/bwOi2ns6hTnoFmYB/ubcvci770/U
	JBZslKHnFOrVKFwmtMzni9gs0s56FkUU581qqZ4jOh3NCykx1Es07DgB+64HRSNGMkAaAxPzCSB
	ZzXv7EMF/p4ObfUFyZwo3S/+/eWRmfxr7pPsiWm1kwqQ2vtXgw0=
X-Received: by 2002:a4a:e60a:0:b0:684:5e35:6091 with SMTP id
 006d021491bc7-699ab62b9fbmr808519eaf.26.1778142017994; Thu, 07 May 2026
 01:20:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com> <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-8-c21c40ec16d0@gmail.com>
From: Margherita Milani <margherita.milani@amarulasolutions.com>
Date: Thu, 7 May 2026 10:20:06 +0200
X-Gm-Features: AVHnY4L7xr25tCAps8SxEp-5ZjcE9EGySyy8fEWRsxHZhWT1U2K2LtQjEajPjlU
Message-ID: <CA+Xcp4nY9GVMOmtMG-PNhY2vqP4Cc_amAMSa+M3vuDjWUkuCHw@mail.gmail.com>
Subject: Re: [PATCH v8 8/9] riscv: dts: spacemit: k1-bananapi-f3: add SD card
 support with UHS modes
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.dev>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Anand Moon <linux.amoon@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Good morning Iker,

> Add complete SD card controller support with UHS high-speed modes.
>
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with inversion
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes


Tested-by: Margherita Milani <margherita.milani@amarulasolutions.com>

However I noticed it only works when CONFIG_I2C_K1 is enabled.
Michael Opdenacker told me it's necessary to enable the regulators
used by the mmc controller.
Should we add the dependency between CONFIG_MMC_SDHCI_OF_K1 and
CONFIG_I2C_K1? (Unless some boards don't have these dependency?)
Thank you for your patchset which was really nice!

--=20
Margherita Milani
Embedded Software Engineer
M. +39 334 758 9111
margherita.milani@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via le Canevare 30, 31100, Treviso, Veneto, IT
T. +39 (0)42 243 5310
info@amarulasolutions.com
www.amarulasolutions.com

On Mon, Apr 13, 2026 at 10:05=E2=80=AFAM Iker Pedrosa <ikerpedrosam@gmail.c=
om> wrote:
>
> Add complete SD card controller support with UHS high-speed modes.
>
> - Enable sdhci0 controller with 4-bit bus width
> - Configure card detect GPIO with inversion
> - Connect vmmc-supply to buck4 for 3.3V card power
> - Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
> - Add dual pinctrl states for voltage-dependent pin configuration
> - Support UHS-I SDR25, SDR50, and SDR104 modes
>
> This enables full SD card functionality including high-speed UHS modes
> for improved performance.
>
> Suggested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 24 +++++++++++++++++++=
+++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv=
/boot/dts/spacemit/k1-bananapi-f3.dts
> index 5790d927b93d..a7d88564630f 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -220,7 +220,7 @@ buck3_1v8: buck3 {
>                                 regulator-always-on;
>                         };
>
> -                       buck4 {
> +                       buck4: buck4 {
>                                 regulator-min-microvolt =3D <500000>;
>                                 regulator-max-microvolt =3D <3300000>;
>                                 regulator-ramp-delay =3D <5000>;
> @@ -241,7 +241,7 @@ buck6 {
>                                 regulator-always-on;
>                         };
>
> -                       aldo1 {
> +                       aldo1: aldo1 {
>                                 regulator-min-microvolt =3D <500000>;
>                                 regulator-max-microvolt =3D <3400000>;
>                                 regulator-boot-on;
> @@ -367,3 +367,23 @@ hub_3_0: hub@2 {
>                 reset-gpios =3D <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
>         };
>  };
> +
> +&sdhci0 {
> +       pinctrl-names =3D "default", "uhs";
> +       pinctrl-0 =3D <&mmc1_cfg>;
> +       pinctrl-1 =3D <&mmc1_uhs_cfg>;
> +       bus-width =3D <4>;
> +       cd-gpios =3D <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
> +       cd-inverted;
> +       broken-cd;
> +       no-mmc;
> +       no-sdio;
> +       disable-wp;
> +       cap-sd-highspeed;
> +       vmmc-supply =3D <&buck4>;
> +       vqmmc-supply =3D <&aldo1>;
> +       sd-uhs-sdr25;
> +       sd-uhs-sdr50;
> +       sd-uhs-sdr104;
> +       status =3D "okay";
> +};
>
> --
> 2.53.0
>
>


--=20
Margherita Milani
Embedded Software Engineer
M. +39 334 758 9111
margherita.milani@amarulasolutions.com
__________________________________

Amarula Solutions SRL
Via le Canevare 30, 31100, Treviso, Veneto, IT
T. +39 (0)42 243 5310
info@amarulasolutions.com
www.amarulasolutions.com
