Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D44395AF5;
	Wed, 15 Jul 2026 20:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784146143; cv=none; b=VeJOtMREBFkt7F+sT4z8m8rbBnVtHLsQD+jf26p6nJP+DvaeT1HcnZcU+m9w+D1NF4gwWfxEtJCklegthC4geBzJoL3z2o2i8ptfCuFBDdYnoQZLhjjvbn3Pqg/wxKcLqHfCj++WZeU4eAsXA3totb+OtvP9RZHn1TXELJ/NBnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784146143; c=relaxed/simple;
	bh=KtvDwVZZOYLgcjER8SCI/pgXca4Ek++IvocS0sdjWr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcRZxOnjZHX+guCDEkD3TI04br1Cd+s0DvhgBiD384KYDsCAtB1nIqZjI1486SPAuywhm3b6HwkVo7QyyTB9w++CmZj9xpAdZX+Re5ntBlVlgiLvUuTQ4nULXV3P1fSDohJJutZBfsNY+BptKSULbUmmtfAF1laVzufyvj+v5oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NDaZQVqD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NDaZQVqD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 234C11F000E9;
	Wed, 15 Jul 2026 20:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784146141;
	bh=4G3HDMxqjzRxoO5aAWMt/Yk6P9jkpOshboSqefNWXrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NDaZQVqDfOGGF1Roz+SD7ewcYzXVjrXsBy7LO4lYjMB5TxXXaldha7HMjcCRHqO24
	 TgDQjnr6pfTc3yyBwp8DeoEW7+RF/Ewm8coAATz09hFy+8ZGDYEWCVCu/ER2bWoN/2
	 Bbnx0xjeeFSwSA3WqZ3oCDg9x8++qwPfr/3CRA4YMVACC3mz5gGx1oVeH4uOqxza85
	 LXpf93GdAOzuNIW+mb1Ia1HXW7IdBot7FIMPs7bBnBb7964wjOsskspYClNbV9b9Mv
	 CDq4F8DWqHDAhXuGY2uS/iUPUz2wZEkLKM8M8cGtcnJ6EPhenc/wHn4elF0iX1AAq4
	 1wfbAnApapu4w==
Date: Wed, 15 Jul 2026 15:08:58 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	Sachin Gupta <sachin.gupta@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hamoa-pmics: Add ADC support
Message-ID: <alfn2U2IR2BLCwGh@baldur>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
 <20260614-adc5_gen3_dt-v2-4-32ec576c5865@oss.qualcomm.com>
 <alKYqD6yp97DV6R-@baldur>
 <27141365-9fbb-4377-9db4-dae281741d0e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27141365-9fbb-4377-9db4-dae281741d0e@oss.qualcomm.com>

On Tue, Jul 14, 2026 at 05:34:31PM +0530, Jishnu Prakash wrote:
> Hi Bjorn,
> 
> On 7/12/2026 1:11 AM, Bjorn Andersson wrote:
> > On Sun, Jun 14, 2026 at 01:35:11PM +0530, Jishnu Prakash wrote:
> >> From: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> >>
> >> Add ADC node and define channels for:
> >> - Die temperature for PMK8550, PM8550VE* and PMC8380* PMICs.
> >> - PM8550: Die temperature, VPH power, and system thermistors.
> >>
> >> Define thermal zones 'sys-0-thermal' through 'sys-6-thermal' which
> >> correspond to the off-PMIC system thermistors connected via
> >> PM8550 AMUX/GPIO lines.
> > 
> > These are connected to thermistors on the PCB, which would make them
> > board-specific. In fact, you specify all 7 thermal-zones, but at least 2
> > of those are not connected on my board according to the schematics.
> > 
> > So, I think the thermal-zones definitions should be deferred to
> > board-specific dts.
> 
> Yes, I see your point, since thermistors can vary between boards,
> it may be better to keep thermal-zones definitions in board-specific
> dts files.
> 
> > 
> >>
> >> Also,add io-channels and io-channel-names properties to the
> >> temp_alarm nodes so that they can get temperature reading
> >> from the ADC die_temp channels.
> >>
> >> Signed-off-by: Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>
> >> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 250 ++++++++++++++++++++++++++++++
> >>  1 file changed, 250 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> >> index 6a31a0adf8be..2e746ede850f 100644
> >> --- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
> >> @@ -6,7 +6,9 @@
> >>  #include <dt-bindings/input/input.h>
> >>  #include <dt-bindings/input/linux-event-codes.h>
> >>  #include <dt-bindings/interrupt-controller/irq.h>
> >> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> >>  #include <dt-bindings/spmi/spmi.h>
> >> +#include "qcom-adc5-gen3.h"
> >>  
> >>  / {
> >>  	thermal-zones {
> >> @@ -189,6 +191,90 @@ trip1 {
> >>  				};
> >>  			};
> >>  		};
> >> +
> >> +		sys-0-thermal {
> >> +			polling-delay-passive = <0>;
> >> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> > 
> > As I said above, this doesn't match my board.
> > 
> >> +			trips {
> >> +				active-config0 {
> >> +					temperature = <125000>;
> >> +					hysteresis = <1000>;
> >> +					type = "passive";
> >> +				};
> >> +			};
> >> +		};
> >> +
> >> +		sys-1-thermal {
> >> +			polling-delay-passive = <0>;
> >> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> >> +			trips {
> >> +				active-config0 {
> >> +					temperature = <125000>;
> >> +					hysteresis = <1000>;
> >> +					type = "passive";
> >> +				};
> >> +			};
> >> +		};
> >> +
> >> +		sys-2-thermal {
> > 
> > This provides the temperature of my keyboard, so I'd certainly want to
> > override the properties within - and perhaps use this for throttling
> > things.
> > 
> >> +			polling-delay-passive = <0>;
> >> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> >> +			trips {
> >> +				active-config0 {
> >> +					temperature = <125000>;
> >> +					hysteresis = <1000>;
> >> +					type = "passive";
> >> +				};
> >> +			};
> >> +		};
> >> +
> > [..]
> >> @@ -277,6 +363,142 @@ pmk8550_pwm: pwm {
> >>  
> >>  			status = "disabled";
> >>  		};
> >> +
> >> +		pmk8550_vadc: adc@9000 {
> > [..]
> >> +			channel@14a {
> >> +				reg = <ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> > 
> > I guess per my own argument, you don't know that this channel has a 100K
> > resistor...
> > 
> > But that said, people have waited forever for this to be ready to allow
> > thermal throttling of overheating laptops. So please just drop the
> > thermal-zones, address Konrad's other comment and resubmit this.
> > 
> 
> OK, please let me know in case you see any issues with the following
> changes:
> 
> I'll drop the thermal-zones nodes for now. To avoid any error messages,
> like from attempts at thermal device registration, I'll drop the "qcom,adc-tm"
> property from channels having it and also the "#thermal-sensor-cells"
> property from the main ADC node.
> 
> I'll keep the ADC channel nodes under the main ADC node in place and
> delete the ones absent on Purwa boards in Purwa board files, to address
> Konrad's comment.
> 
> Later, I can push a separate patch to add proper thermal configurations
> for thermistors per board, and only for the boards we use internally.
> 

That sounds like a good plan. That will allow us to move ahead and add
the board-specific thermal zones and cooling maps.

Regards,
Bjorn

> Thanks,
> Jishnu
> 
> > Regards,
> > Bjorn
> 
