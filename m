Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10C523E342;
	Sat, 11 Jul 2026 19:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798923; cv=none; b=rKOO33sa1P3k1NP1u1nNzd1R6sS8wd7F8IWVuqm+xWdhH/JktL+hwWBLWqYvDKK6jiga/3tO6+EpLIKqE1vkI5e3KEUVzs1XbtAOM2exbGV7Kgc1bdI2jbQdEJPFvCDDP0ARPP3r87JNJQvnQOoecmPuf9cmOsc17/Kn3ilxCxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798923; c=relaxed/simple;
	bh=5FrZAplXQGM4oZiVrQ30pqsmSa4NcA93A0NvdHzbBZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gsd0Dn3zQrnrO3kTloZVPLym5G56j0RKGiv5qSiwLH+yc+QcZhLhtGPgFxCby3zrt7FWQAiJ4rIZL3o8PsvxxqBnGwRpNgER2EHqGdcJHdiUTIDmb9ZKvuwuyNvpoKCWI4Co7p7IKiwqjxlJ0l9xrDdqFCw/Rxx4556iHzGeUJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WtrKFXyc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WtrKFXyc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30FF1F000E9;
	Sat, 11 Jul 2026 19:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783798921;
	bh=Sm5ZTDa73Hao2D2pFku+zRQxRO5Zct8747XqElzDyX8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WtrKFXycHVFBFQ1Nk+D5WCfFSLl965T3DYtnr7hVNaBhJcsjS1L+oj1KdDGZ1oyk+
	 UrZqEs4NAUzt0Fy7/X4ArMPQ5/gZvxIJ3emWMXErI5EnJMnU0e86qvU/9BnOSlWbB0
	 weRU7Rsu3segxdKRoIsU1siDq5g79ASntKIfsuLt2yyFKluFXVYcxV0P4Zwb9x163X
	 xA3dEk45/PCcvegJzssG4wNySFlUAQKLrdiaFwpzrmO6X4+FaeezZmOi26MXYIUKnn
	 kWjDI33eF52Tk6BgMQKlfphHTbcPPzin0tiPrSe6njVTdyfKdmqZCSs535l1VWuCGw
	 1HjNKfSr8M4tQ==
Date: Sat, 11 Jul 2026 14:41:58 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
Message-ID: <alKYqD6yp97DV6R-@baldur>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
 <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>

On Sun, Jun 14, 2026 at 01:35:11PM +0530, Jishnu Prakash wrote:
> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> 
> Add ADC node and define channels for:
> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
> - PM8550: Die temperature, VPH power, and system thermistors.
> 
> Define thermal zones 'sys-0-thermal' through 'sys-6-thermal' which
> correspond to the off-PMIC system thermistors connected via
> PM8550 AMUX/GPIO lines.

These are connected to thermistors on the PCB, which would make them
board-specific. In fact, you specify all 7 thermal-zones, but at least 2
of those are not connected on my board according to the schematics.

So, I think the thermal-zones definitions should be deferred to
board-specific dts.

> 
> Also,add io-channels and io-channel-names properties to the
> temp_alarm nodes so that they can get temperature reading
> from the ADC die_temp channels.
> 
> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 250 ++++++++++++++++++++++++++++++
>  1 file changed, 250 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> index 6a31a0adf8be..2e746ede850f 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> @@ -6,7 +6,9 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/spmi/spmi.h>
> +#include "qcom-adc5-gen3.h"
>  
>  / {
>  	thermal-zones {
> @@ -189,6 +191,90 @@ trip1 {
>  				};
>  			};
>  		};
> +
> +		sys-0-thermal {
> +			polling-delay-passive = <0>;
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;

As I said above, this doesn't match my board.

> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		sys-1-thermal {
> +			polling-delay-passive = <0>;
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		sys-2-thermal {

This provides the temperature of my keyboard, so I'd certainly want to
override the properties within - and perhaps use this for throttling
things.

> +			polling-delay-passive = <0>;
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
[..]
> @@ -277,6 +363,142 @@ pmk8550_pwm: pwm {
>  
>  			status = "disabled";
>  		};
> +
> +		pmk8550_vadc: adc@9000 {
[..]
> +			channel@14a {
> +				reg = <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;

I guess per my own argument, you don't know that this channel has a 100K
resistor...

But that said, people have waited forever for this to be ready to allow
thermal throttling of overheating laptops. So please just drop the
thermal-zones, address Konrad's other comment and resubmit this.

Regards,
Bjorn
