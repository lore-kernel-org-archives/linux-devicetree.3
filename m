Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25673A451F
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 16:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059241; cv=none; b=Gphu4cuWeMznl5su3ukBho6FXJBbPgU0DeZtjAVYUd+ZAdZVf1XfeB4NeidiIIGRKvrLr7/3JkinhCaWunXdAOCoWmSXcSlnZKb39AQv2EECI1ODhIDtlst69dT9ySno9VcYf39ET7C8XmaHv7DhyvDTvUG1rxe2r/6xLHQaHnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059241; c=relaxed/simple;
	bh=kFXFgOEhKlngjPkjJ1DPF1n2S680Kf5nf8debqxzhDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaqNNnu8eJi8eVgaE6omgdesL39Kdd9wxf43Asw+bM3S1hsEfYFwAnOojqv1/R0lkAaljDCDPjntxGCyJIfzYJr3zFp7pJotW8J1v96nl51EuIX3R9SyRjNt+uc4FhvoIq1NtmBFCNO7tslDOlFxKkLhL+T+eko4r1SVZL+gOkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkbaOgjG; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkbaOgjG"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso40216a12.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 09:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789059238; x=1789664038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EtBz5QzHQc+Th2x67irNYDwYKHrb3yatIwwlwUzsjwc=;
        b=ZkbaOgjGdWglyuAeA/8vTXybXRMKhA7y6BXpNjJvWodKab+dSXbrtTibFgGz7gWHoM
         bxMTi1DXkWGgrnyjZ38f0irfgwpxaxeQyaj6Mc5tJW7jgnWynKTbut75kxEO/nJ1uXbt
         kF5PgUgWU09jdA9gEAbRtmwAH9ECcxL9gSfswknqQqrl5p+U9VeKn9PIBLXZvs5+3NlE
         OnRV5PiFcp/DJEl8bcWdkVYsSZR2L3K1wIBvfV2ni4xDB5OpMD0jJPVPZ+RrheXuj+7K
         tIeF4L2w0vLDkA5lwC2sfG0YJM6sjoe/u8J/ofKLHyzY93uBjhE6X3S89MyDW90UiLCH
         rEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059238; x=1789664038;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtBz5QzHQc+Th2x67irNYDwYKHrb3yatIwwlwUzsjwc=;
        b=SDxoQlWMTPHxM5HI3I9rWqkziPVio9D3T3Vpgt4FDU3pZp/fr2/It7ZkAFoXqYj/Fo
         Oz9hAGY20/zXMNtxAP8AfcpG4PWbC9Br7pRTsg6Z4FbMcXlkyLnuzrTDi0cPI/UGxqG4
         27nWRi/TKyGOB56l+ww6/FWyDwhU2HTfH07O7n3mytwiVEKjNBPVCgnPSJOhsiAjzfHi
         y6whNgVOezZj27lIylUT2bz+aSD1IizKfYbNOMwb4pomOo+Pw8C8YyaE97uvCIy4B1sZ
         to2WUaLsv8SIttI5m5sa4gC3DJC870y3/6cXyiQWuLR7y0zrPJKbBESBafWH9SaRPqL9
         cR0g==
X-Forwarded-Encrypted: i=1; AKwUvBwEjhWcl5KIqbXJnL9m29kJ+YFKF+patez8FZ+crGlWBZMcjNbden4D0o/WiEObZIRTx33ulOtL7xsf@vger.kernel.org
X-Gm-Message-State: AFuF++m1eEUOnvXP9+Q5IlCv+NC2r0sTgy+AXUvMbg+z9jaNKEMF5jhu
	uJ62EwjpM47dFtwaP/8kug0zIbCGydNJ21xkOc0w/k/hvGHZsjjZTkV/
X-Gm-Gg: AYBFou28UqmTo3bH5zrgsX95DDZ3Lfy+Ys37OL3KDYo+etVfUGNybiHmmRrsuhoyAH3
	toZW3Xu+cdDFMX/dc1s1TDCWRBvm6oFeuz4DkY1XBcd5ihyE5HLtaEv3xGfwjbw4IjzhJN/voRp
	o5v+FCVul5sdxJUgKIY2O+1ecN3xcxBXvIHAYyuq9e3Ee8FefFZRy1Z4X0Geca0RZD6+NeA0hre
	PjCx261gecA4YlAjJJgvS12HvDvMHtM1UD+LxZI7ZQc3UqimQ79GmJOV2DwFaz8lGKYtcUuTiIF
	Dx0DjBqlaPyS8+HyTgWF4rtv/1szz7PzFTAkZOOhX7hmhYOP7yrrIzNnx6TDhaag9Oy3kYjBHYb
	B+NWD5X1BJ9lo99mP5+onYSRcx3+91qmAVTCneY0T7n1OZGWt5iwgXnG4g7twuGgcJaH7UsXcOf
	DFOgLestb6oRtXdyDxl6V4iE+F3GGHHkslwxqQA1zHiZbaXbXXbqTR3A+ig6K3BoSKtD6q0ZO1H
	OyFqZXYGrplwmb7VX35M7J41I5Zgq2S6tlotAcVEKshfs8nUtECRSg=
X-Received: by 2002:a05:6a21:1b85:b0:3d3:adbf:7779 with SMTP id adf61e73a8af0-3da3a0af14amr66467142637.21.1789059237749;
        Thu, 10 Sep 2026 09:53:57 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c657156bsm10825a12.21.2026.09.10.09.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:53:57 -0700 (PDT)
Message-ID: <1ae22be2-b72e-4c23-9aff-ef1052a10c45@gmail.com>
Date: Fri, 11 Sep 2026 00:53:52 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: nuvoton: Add NuMaker board
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
 <20260904-perso-ma35d1-upstream-dts-v2-3-30ce255a401f@bootlin.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-3-30ce255a401f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Nuvoton MA35D SoC is used on the NuMaker SoM, itself plugged onto a
> carrier board labelled NuMaker. Create a DTS including the SoM
> description. As a first external component, mention the SPI NAND
> connected to the Quad SPI controller.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   arch/arm64/boot/dts/nuvoton/Makefile           |  1 +
>   arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 42 ++++++++++++++++++++++++++
>   2 files changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
> index 3bc9787801a5..4c82109c885a 100644
> --- a/arch/arm64/boot/dts/nuvoton/Makefile
> +++ b/arch/arm64/boot/dts/nuvoton/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0
>   dtb-$(CONFIG_ARCH_MA35) += ma35d1-iot-512m.dtb
> +dtb-$(CONFIG_ARCH_MA35) += ma35d1-numaker.dtb
>   dtb-$(CONFIG_ARCH_MA35) += ma35d1-som-256m.dtb
>   dtb-$(CONFIG_ARCH_NPCM) += nuvoton-npcm845-evb.dtb
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
> new file mode 100644
> index 000000000000..16c003998d3b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * Copyright (C) 2025 Bootlin
> + * Author: Miquel Raynal <miquel.raynal@bootlin.com>
> + */
> +
> +/dts-v1/;
> +#include "ma35d1-som-256m.dts"
> +
> +/ {
> +       model = "Nuvoton MA35D1 NuMaker";
> +       compatible = "nuvoton,ma35d1-numaker", "nuvoton,ma35d1-som", "nuvoton,ma35d1";
> +};
> +
> +&pinctrl {
> +       spi-grp {
> +               pinctrl_qspi0: qspi0-pins {
> +                       nuvoton,pins = <3 0 5>,
> +                                      <3 1 5>,
> +                                      <3 2 5>,
> +                                      <3 3 5>,
> +                                      <3 4 5>,
> +                                      <3 5 5>;
> +                       bias-disable;
> +                       power-source = <1>;
> +               };
> +       };
> +};
> +
> +&qspi0 {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pinctrl_qspi0>;
> +       status = "okay";
> +
> +       flash: flash@0 {
> +               compatible = "spi-nand";
> +               reg = <0>;
> +               spi-max-frequency = <30000000>;
> +               spi-rx-bus-width = <4>;
> +               spi-tx-bus-width = <4>;
> +       };
> +};
>
> --
> 2.54.0
>

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang

