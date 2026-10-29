Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282540;
	b=fZLjVvYWN9Dvq3hiUwjdfN1UojW8PjJ5D6LhVibViK8/Je6XTqx9iy6PZsPoT2NgbQHP
	 RL2gojS8/H5sfRCDqVmkgG0hHgdF8Cbhkx4N5itK7edfp1O3MJXV6HXOyHsaWGir4ionh
	 Po5+2QdIqiMvT1PdBg/DvOa35IVG4CtdzQZfT5YOV7Qq0QkdRPTp2qvEc2mSv9+dxtTJW
	 J6urMhNbsZ8lGdxcdGYmd2W/I+qChjOKgo89mTA3imbQ3rI+qY/vaVlPl/ZXuAMuXQa44
	 1ucPfixgwp8ZQgfEuPyxpAdd9JZ4bqQqUpHh5FadDPYssXCW+IbXmP9GnDuRffdHfSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282540;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HspYwDU9CzG3EZ2ACvXbU+wlxAv0lvQqvHSOq7AMHzE=;
	b=OT/lheKpYQHJH/03I8DZx6rE852Uz4zxqNy1EHyZqPp3luWqNIbzZuCeqqcr4TcErwon
	 eax/ae/Mo08Vy9susLsltpRRwe/tjb6hFDzYCvygZQtlx9MTP0OtwErTEmfxh+N4sUd8I
	 a+iPJsa/HRGUvy9wO7TjVzwEf276vLYDvqTdwR0AcndOCRuxVpde18e9mAQSHZdq71Sv6
	 6UnWHQm6FH/9IOVmBMkj+V7obzD3f5Tl4uvnztn4UABoVn/kVbkJ9D43MUg3LuU9F42Ae
	 Q4fusxRHM4Hn5tFZhiFiMizAdXPzwpstKxE8KsySYQ7smF8nfWyR3afitUkLT4TNkPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDZFrNSC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E9E606A332
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EDZFrNSC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBF31F031E9;
	Thu, 29 Oct 2026 14:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793282539;
	bh=HspYwDU9CzG3EZ2ACvXbU+wlxAv0lvQqvHSOq7AMHzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EDZFrNSCuUsOJh4rDNCB+uVTpT3ruy0XHLC2DF4c/LbqesqB/50hIA6bA4hd6HiIf
	 2AakvXPyoDi1qrvBpbvK7CF8Jr7KEyfs+vEkP7FbNMwkdbWfoJU/fbm5+2P4DGsl17
	 tYuyCPHJn1grgEFmlZK+8UkZjxsMi3/LOFrUEyPEVUBhAFGPmbnN3/VZpRR4zPpmg6
	 xjqVlBwmAGt2/UjWTi5YRSS3X3LY6xA7I0R5x1LD8J9lle7ILuc4q62pnOohJCurlL
	 qlT3/7WfhnhqKsdnJzL7k0DfNWn9bE+5hdLlZzJI4zJHaxAsFhoNkiCcZuQgdtz/Ee
	 VSWgpjs53rGQw==
Message-ID: <sashiko-outbox-189462@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: Add PMIC thermal support for
 Agatti QRB2210-RB1 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raj Aryan" <raj.aryan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
References: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 14:02:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: missing polling-delay on qrb2210-rb1 ADC thermal=
 zones
--

commit 38fb45777755ec6c570eb782acfb19540ef209d8
Author: Raj Aryan <raj.aryan@oss.qualcomm.com>

arm64: dts: qcom: Add PMIC thermal support for Agatti QRB2210-RB1 platform

This commit adds PM4125 ADC channels, generic-adc-thermal bridge nodes, and
thermal zones for the msm, quiet, and xo thermistors on the Agatti
QRB2210-RB1 platform.

> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot/d=
ts/qcom/qrb2210-rb1.dts
> index bf6fb12ad9906..17bc2b984c75f 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts

[ ... ]

> @@ -33,6 +34,68 @@ clk40m: can-clk {
>  		};
>  	};
> =20
> +	msm_therm_bridge: msm-therm-bridge {
> +		compatible =3D "generic-adc-thermal";
> +		io-channels =3D <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
> +		io-channel-names =3D "sensor-channel";
> +		#thermal-sensor-cells =3D <0>;
> +	};
> +
> +	quiet_therm_bridge: quiet-therm-bridge {
> +		compatible =3D "generic-adc-thermal";
> +		io-channels =3D <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
> +		io-channel-names =3D "sensor-channel";
> +		#thermal-sensor-cells =3D <0>;
> +	};
> +
> +	xo_therm_bridge: xo-therm-bridge {
> +		compatible =3D "generic-adc-thermal";
> +		io-channels =3D <&pm4125_adc ADC5_XO_THERM_100K_PU>;
> +		io-channel-names =3D "sensor-channel";
> +		#thermal-sensor-cells =3D <0>;
> +	};
> +
> +	thermal-zones {
> +		msm-thermal {
> +			polling-delay-passive =3D <2000>;
> +			thermal-sensors =3D <&msm_therm_bridge>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <80000>;
> +					hysteresis =3D <2000>;
> +					type =3D "hot";
> +				};
> +			};
> +		};
> +
> +		quiet-thermal {
> +			polling-delay-passive =3D <2000>;
> +			thermal-sensors =3D <&quiet_therm_bridge>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <80000>;
> +					hysteresis =3D <2000>;
> +					type =3D "hot";
> +				};
> +			};
> +		};
> +
> +		xo-thermal {
> +			polling-delay-passive =3D <2000>;
> +			thermal-sensors =3D <&xo_therm_bridge>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <80000>;
> +					hysteresis =3D <2000>;
> +					type =3D "hot";
> +				};
> +			};
> +		};
> +	};

[Severity: High]
Will the msm-thermal, quiet-thermal, and xo-thermal zones ever be polled at
runtime without a polling-delay property?

Each zone is bound to a generic-adc-thermal bridge node, and gadc_thermal_o=
ps
in drivers/thermal/thermal-generic-adc.c only provides .get_temp without
.set_trips or interrupt-driven trip support:

drivers/thermal/thermal-generic-adc.c:
static const struct thermal_zone_device_ops gadc_thermal_ops =3D {
	.get_temp =3D gadc_thermal_get_temp,
};

When thermal_of_zone_register() calls thermal_of_monitor_init() in
drivers/thermal/thermal_of.c, omitting polling-delay sets *delay to 0
(leaving tz->polling_delay_jiffies =3D 0):

drivers/thermal/thermal_of.c:thermal_of_monitor_init() {
	...
	ret =3D of_property_read_u32(np, "polling-delay", delay);
	if (ret =3D=3D -EINVAL) {
		*delay =3D 0;
	}
	...
}

In monitor_thermal_zone() in drivers/thermal/thermal_core.c, periodic polli=
ng
is only scheduled if tz->passive > 0 or tz->polling_delay_jiffies is
non-zero:

drivers/thermal/thermal_core.c:monitor_thermal_zone() {
	if (tz->passive > 0 && tz->passive_delay_jiffies)
		thermal_zone_device_set_polling(tz, tz->passive_delay_jiffies);
	else if (tz->polling_delay_jiffies)
		thermal_zone_device_set_polling(tz, tz->polling_delay_jiffies);
}

Because these three thermal zones only define trips with type =3D "hot" and=
 no
passive trips, tz->passive remains 0 and polling-delay-passive is never
activated. As a result, after the initial registration check, tz->poll_queue
is never queued and the active-config0 hot trips at 80000 mC cannot be
detected.

Should these thermal zones define polling-delay (or set polling-delay-passi=
ve
to <0> and use polling-delay =3D <2000>) so the ADC channels are periodical=
ly
sampled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-pm4125-adc=
-thermal-v2-1-8f405d9dac96@oss.qualcomm.com?part=3D1
