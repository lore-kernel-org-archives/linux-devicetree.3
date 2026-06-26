Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504183BB118
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 13:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782480152; cv=none; b=pVjWJJQMwQY8EGqFCWj4Rz1N++Xj79cDEYVDa7oGXbNJYy89g53NZRvopHRw8YpsJm9GGHnY8QX5b+G/Xf9Q5+EUe+BtENlaR6QZ1QtUhh86KF/+OY6oIQBkNGBheyB3Gxd6szO9pcW0npkFARJKFMEpfxNUHvVph/eyFj/59TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782480152; c=relaxed/simple;
	bh=q2OQEI6d+Tec35kArN+O+0T9NYgl5oyAH46QKy9KqPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tmjvr2XbNIhdtYLb+hRdSuAGJpSg2/g7Z8keQJUw/6TRxZe8CXGpb/3hDkaMRYuXkSROmvLWxloXWyHlj6bEuI5VnDYqbMr+KrI6yF31eyzFKhBH3F9QAPXFrct27/ECu6sW0bqwFDTPs36usCu9M2yPE5qXnIDwU36fbedxQgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dE01KKpC; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dE01KKpC"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5ad519f5f13so85134e87.1
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 06:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480146; x=1783084946; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oQ23aqtvHk/KnAoTWB/JH/fphJ2pYqYtw5YHFybaZsQ=;
        b=dE01KKpCwvD6mEFfkrhc5h0fDAQbU4VSjs3tJ5sOQCiMhxzk1s6GNBVRupxnVxUz3n
         gkzkzOLpRXo8fB4bhseoPyzfFkzzUc6Ws38uMS7a5upffH/jM76fOwFjJsb2Sw6ovTSn
         yJCvcY99gLeHImZDyPJQoV+rfA4CtMNMDMtzOvvebqegMcE73CdMxYOom425sC544/na
         QHqkRpcYYfCD7qwIwSzONsEWezu703GV5wVFnlDhDBjQ2BnIb2pJs2tBaNeQka97O9xv
         VjJZAei8EenEIHPxKdCMLQOCrxiG25nCW4EFx7EUCybYeBpqeSeuVfauR/VXAcucOwWq
         TVag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480146; x=1783084946;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQ23aqtvHk/KnAoTWB/JH/fphJ2pYqYtw5YHFybaZsQ=;
        b=nvhBaIDP4RiAq2WDkaUlpCwEXCNAuNprhVanfXyFIQ1c9EOpTfCYAyDoMFv0EY1XmU
         tNoB7MruKRRT+2enIShKsytNaxYgwuJpZuKSBCEvz2F7H6WvO8qhC21F/H8WRZFYN2tQ
         V1AM4utYmoqb0DswjKwWH/1Xxgnsb58N/upe1BX6+Pj4lEQT7FmzfmfjY9OdGeuW5BO3
         1YTm2VjSWdRBaEpNyiFoATv2IX3haz1eXLlh9esg9ohz41ojdCjChUX+qdHSktKmVDeY
         Cc5ZcLnfevEYfk5HCqoPJzB/6cVyOleAFafwEKXE5UauhK+O0kSBQkxDW0NYCbtc6hIX
         M+8Q==
X-Forwarded-Encrypted: i=1; AHgh+RrJ/drE0k+JldztJAtv/NmxFzrL2A6RIpmb+3ep8dwDF0uQEgfZNpo9C6j4ZakMjw8tyhU2Olyd407n@vger.kernel.org
X-Gm-Message-State: AOJu0YyBL6ClWrsBmVJscaaQARyxJ+t3hUZuEemYIWctEVwt/bTtkq9x
	OdBkoX+P2+6cbFxkM+2Sng6wfA6chzkMtgkbPleWbpeb7U1x6HSIePdzngFCPvYaXLY=
X-Gm-Gg: AfdE7clnTkNOn25GM6F1z64rErz8/r4hn3WFWcQeUo11XJUGchTSamMeYCl8Quog/1D
	k8AbtEdyFePj6JQVY/viWicBG3PduTB7Q+CvAiA2LlOUPMmFMsx8VWkD8jHuQQ2p3keFmJPuPSN
	k7203DWk6xPFRxzXOj1pqxqeVDJ4RjC9IVel/CpC75PZZDcsMsyKIZlfW965B2pIf305CXltYIq
	Va2+HxL95bBfycCCWHl+2vjH2OdO52+iDDIXbTVKC5MUjetIYf1X4kdtXwo5xccEt78NR89CjQK
	x7fjRAHtmZf7IPVkm9kgDCLM958xW/WJ/qw++nlPkRfyEy9PU+0IgBS+YEt+qNSQqmIegmr4pfk
	4j4Iq0N6UGhq5SRq75RJlyZWdfHpUUfj7Va64L6cN8EZlNDNwhSNUc+kqur5d+hMaUPCKqLJI5L
	TX1OXYhYIit9f0qa2FKZGR9aNI8PPCpwMI3JG1OJDjLoCcAiF0SdUBgwLo+5Bf48SX+4U=
X-Received: by 2002:a05:6512:1252:b0:5ad:4ead:72d7 with SMTP id 2adb3069b0e04-5aea1f630cbmr1249234e87.5.1782480146180;
        Fri, 26 Jun 2026 06:22:26 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aea5195050sm816328e87.83.2026.06.26.06.22.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:22:25 -0700 (PDT)
Message-ID: <eaca986e-81d5-44f7-bc64-8e89e5a1f823@linaro.org>
Date: Fri, 26 Jun 2026 16:22:24 +0300
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: Convert to new media orientation
 definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-6-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/26/26 15:07, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the qualcomm device trees to use the new
> definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts         | 3 ++-
>   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts | 3 ++-
>   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi         | 3 ++-
>   3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> index 04cb9230d29f..d79be22108c8 100644
> --- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> +++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
> @@ -13,6 +13,7 @@
>   #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>   #include <dt-bindings/leds/common.h>
>   #include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include <dt-bindings/sound/qcom,q6asm.h>
> @@ -701,7 +702,7 @@ camera@10 {
>   		pinctrl-0 = <&cam_mclk3_default>;
>   		pinctrl-names = "default";
>   
> -		orientation = <0>; /* Front facing */
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   		rotation = <270>;
>   
>   		port {
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index abd9c5a67b9f..543fc691fd3c 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -11,6 +11,7 @@
>   #include <dt-bindings/input/gpio-keys.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   
>   #include "sc8280xp.dtsi"
> @@ -682,7 +683,7 @@ camera@10 {
>   
>   		clocks = <&camcc CAMCC_MCLK3_CLK>;
>   
> -		orientation = <0>;	/* Front facing */
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>   		avdd-supply = <&vreg_l6q>;
>   		dvdd-supply = <&vreg_l2q>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> index 0f57b915186b..375b3c0edea7 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
> @@ -9,6 +9,7 @@
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/input/input.h>
>   #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/media/video-interface-devices.h>
>   #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
>   #include "sdm670.dtsi"
> @@ -460,7 +461,7 @@ camera@1a {
>   		pinctrl-names = "default";
>   
>   		rotation = <270>;
> -		orientation = <0>;
> +		orientation = <MEDIA_ORIENTATION_FRONT>;
>   
>   		port {
>   			cam_front_endpoint: endpoint {
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
