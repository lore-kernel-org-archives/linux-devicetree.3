Received: from mail-m8351.xmail.ntesmail.com (mail-m8351.xmail.ntesmail.com [156.224.83.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47031C695;
	Thu, 25 Jun 2026 15:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.224.83.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400130; cv=none; b=WX4WmvFsLA71yLG4oOtgqt25ONpLS+eKZnB2AxrZPXbzBY6gv3AGLAxv6lbg1lw2/0+PPho+x7J5DoQDl9aDkN/Xjz++AdRd92GM+bIRKGVmxK9j59DowcmKK78dkRrKQDoz37zjUCxJJUuMj+lq8lti1/iItLjH2E4xf63z0Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400130; c=relaxed/simple;
	bh=5PDI949WqwECacuZSse14ihAIvpV6sTw4T0OgiRTigI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N+2+sxDjt85OCf/8cRTkJe9woQ5/u+5co9UzlYldbr9bpLPLUeGfakA/ZuKIz4Ken8byaHNkX+dc48X3V05kP5JW+ZzxSQ0S+dmL7/QMcggrmqmOc13S5wB3r6nr9UHSYMQxJ5+zbVNUxxyYycULnquXHGSWf5siQeOb1EeOvd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com; spf=pass smtp.mailfrom=thundersoft.com; dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b=Ia7Xplho; arc=none smtp.client-ip=156.224.83.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thundersoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=thundersoft.com header.i=@thundersoft.com header.b="Ia7Xplho"
Received: from tsdl-HP-EliteDesk-880-G6-Tower-PC.. (unknown [36.129.139.90])
	by smtp.qiye.163.com (Hmail) with ESMTP id 43c686575;
	Thu, 25 Jun 2026 23:08:41 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	hongyang.zhao@thundersoft.com,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	rosh@debian.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rubikpi3: Enable cameras
Date: Thu, 25 Jun 2026 23:08:21 +0800
Message-ID: <20260625150821.3579971-1-hongyang.zhao@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a4073f5a-1965-4a6c-ba39-c236429e2db7@oss.qualcomm.com>
References: <a4073f5a-1965-4a6c-ba39-c236429e2db7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9eff537ae809d5kunmce1d94d1ce236
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTksaVkkYSUkYGR9OGhpPQ1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0
	lPT09IVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=Ia7XplhoNo65RRM2WKXPWw6WzgZ2Y5FO6mn6VyLdasrnrJypduTQ8qUj0CRLv3l7ibUnheek2cnN4J2CFeryZ89NSVwk/Y7DrwsJ5uqe6u251dOK0JhOlml+gj1iviPrdRD8iBxSl3setuqKDJtwT8ZrJDYH8qi4Q7FCCZryB2s=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=jXIh1pNtTKhdJ3oiCrH8Lqr6TNXGeF7i0dedwODPk4A=;
	h=date:mime-version:subject:message-id:from;

Hi Konrad,

Thanks for the review.

On 6/16/26 9:29 AM, Hongyang Zhao wrote:
> > Enable the two Raspberry Pi camera connectors on RubikPi 3 with
> > IMX219 sensors. CAM1 is connected to CCI1 and CSIPHY1, while CAM2
> > is connected to CCI0 and CSIPHY4.
> >
> > Add the shared 24 MHz camera oscillator, camera power enable
> > regulators, CAMSS endpoints, CCI sensor nodes and privacy LED GPIOs.
> >
> > Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> > ---
>
> [...]
>
> > +	vreg_cam1_pwr: regulator-camera1-pwr {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "vreg_camera1_pwr";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 57 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&cam1_pwr_en>;
> > +		pinctrl-names = "default";
> > +
> > +		vin-supply = <&vreg_vcc3v3_output>;
> > +	};
> > +
> > +	vreg_cam2_pwr: regulator-camera2-pwr {
> > +		compatible = "regulator-fixed";
> > +
> > +		regulator-name = "vreg_camera2_pwr";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +
> > +		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +
> > +		pinctrl-0 = <&cam2_pwr_en>;
> > +		pinctrl-names = "default";
> > +
> > +		vin-supply = <&vreg_vcc3v3_output>;
> > +	};

> Are these supplies part of the baseboard?

Yes. These are board-level camera power switches on RUBIK Pi 3.

The public schematic shows this on page 13, in the Camera1&2 sheet:
https://thundercomm.s3-accelerate.amazonaws.com/uploads/web/rubik-pi-3/RUBIKPI3-IOB-V02-RELEASE.pdf

CAMERA1_PWR_EN and CAMERA2_PWR_EN are driven from the SOM side and gate
the camera connector power rails derived from VCC3V3_OUTPUT.

> [...]
>
> > +	ports {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +
> > +		/* CAM1 is routed to CSI1 / CSIPHY1. */

> I believe these comments are self-explanatory given the names of the labels

Ack, I will drop these comments in v2.

> [...]
>
> > +	cam1_privacy_led_state: cam1-privacy-led-state {
> > +		pins = "gpio18";
> > +		function = "gpio";
> > +		drive-strength = <8>;
> > +		output-low;

> Please drop the output-foo properties from TLMM pins, the GPIO
> state will be controlled by the driver

Ack, I will drop the output-low/output-high properties from the TLMM
pinctrl states and let the GPIO consumers drive the state.

Thanks,
Hongyang
