Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0DB27453
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 21:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778792501; cv=none; b=JLiRCR3CGMJhVvuQIgopaqQQEFdK/K4rhWzniwgsGAuqqs4LSQKaYGZs7IRFUsE5ROpVuixSa7RWUflvyobqVK69PaEVaKaI3GV7uA6QlX+FzmPBvF+Iw+Bxhzn6Oc0Ulco0STBWRYoKkw/bRfZvbVTLMfDQMuXHp0RDQEoOMGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778792501; c=relaxed/simple;
	bh=y828qZKZXqXpcyLAvoLbRNnJVpagChG8tHWaYyCg7jw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TxTjCTVTT7CFY/kwSBOVwcv0mqH/yjIJG0cP9mn6tESbfSjof+QlMNMT9+1d0+IP8BpbqaRwG+FSEPJt5im7K2zxV/xhHmpwtpC4fvv549ei9WY1/4pTHndmgCPYpwLmXU+0LX6jq1ruLYF5V8H0/bh/BtwaYak8Y7wUQmjp3T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gl2i1GCF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gl2i1GCF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B9B0C2BCB3;
	Thu, 14 May 2026 21:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778792500;
	bh=y828qZKZXqXpcyLAvoLbRNnJVpagChG8tHWaYyCg7jw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gl2i1GCFvMVeFfFxZCw81DgXB5JZV2xF0oTXWeysb0WRvGwIXfKZQ/5JHpuRl6pW5
	 naFKB37pdi3SfO5amY0326jqyQZc7I/0mVKjRVfr1IgsQJ4+ggZqS32kAiNI07pmTw
	 eKKWyRX/yKPieCoYHYnkVduSXgCbF1RdFmx7+O7zsbcUo/tbZfhPnFs7SiivZPEwmv
	 8DUZHnLNdhL2SHAvsVpwicjXQ2Cph7ZB50cVToykGDBW5AueDKCS9fwvT127sdN8ds
	 MK8ovabg29E9sXg5/Gi8H24+/sW6kD0lWsSOrwR2WFa4DoOg4f6RkmkwdM4hzNtCIa
	 fV0Uu0RWtaALw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/10] ARM: dts: qcom: msm8960: add RPM clock
 controller and fix USB clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antony Kurniawan Soemardi via B4 Relay" <devnull+linux.smankusors.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260514-msm8960-wifi-v2-5-7cbae45dab5e@smankusors.com>
References: <20260514-msm8960-wifi-v2-5-7cbae45dab5e@smankusors.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 21:01:39 +0000
Message-Id: <20260514210140.6B9B0C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Mapping `USB_HS1_XCVR_CLK` to the `fs` clock slot causes the USB c=
ontroller to lose its transceiver clock during normal operation, breaking U=
SB functionality.
- [Medium] Improperly assigning an interconnect fabric clock to the `core` =
clock slot of the USB controller.
- [Low] The updated USB node violates the `maxItems: 2` restriction for clo=
cks in the `qcom,ci-hdrc` device tree binding schema.
--

commit e540b9f85ba14f0ebee0eabb79c077903050c001
Author: Antony Kurniawan Soemardi <linux@smankusors.com>

ARM: dts: qcom: msm8960: add RPM clock controller and fix USB clocks

This commit adds the RPM clock controller to the MSM8960 device tree and
updates the USB controller to declare a dependency on RPM_DAYTONA_FABRIC_CL=
K.
It also moves USB_HS1_XCVR_CLK to the fs clock slot.

> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts=
/qcom/qcom-msm8960.dtsi
> index fd28401cebb5e..0601680cd8dd1 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
[ ... ]
> @@ -507,8 +519,12 @@ usb1: usb@12500000 {
>  			reg =3D <0x12500000 0x200>,
>  			      <0x12500200 0x200>;
>  			interrupts =3D <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks =3D <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> -			clock-names =3D "core", "iface";
> +			clocks =3D <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
> +				 <&gcc USB_HS1_H_CLK>,
> +				 <&gcc USB_HS1_XCVR_CLK>;
> +			clock-names =3D "core",
> +				      "iface",
> +				      "fs";

Does adding a third clock here violate the devicetree binding schema?

The qcom,ci-hdrc binding in Documentation/devicetree/bindings/usb/ci-hdrc-u=
sb2.yaml
restricts both clocks and clock-names to a maximum of 2 items. Applying this
without updating the schema seems to trigger dtbs_check errors.

Does mapping the transceiver clock to the fs slot inadvertently break USB
functionality during normal operation?

In the ChipIdea MSM driver in drivers/usb/chipidea/ci_hdrc_msm.c, the fs cl=
ock
is used exclusively to propagate reset signals during probe. Immediately af=
ter
the reset sequence, the driver calls clk_disable_unprepare() on it and does=
 not
re-enable it. Since USB_HS1_XCVR_CLK is the required 60MHz ULPI transceiver
clock, turning it off would cause the USB controller to fail entirely.

Also, is it appropriate to assign the interconnect fabric clock to the core
clock slot?

The fabric clock is an interconnect bus clock rather than the operational
core clock for the controller. Usually, bus dependencies are managed through
the interconnect API or by adding dedicated support for bus clocks in the
ci_hdrc_msm driver, rather than taking over the mandatory core clock slot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-msm8960-wi=
fi-v2-0-7cbae45dab5e@smankusors.com?part=3D5
