Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066A023645D
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 19:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792007227; cv=none; b=oXUoi4dSozmLVaTVTkvPeJ3FxG1NXPi28ehdKH7Uyc3I07qDEfsafto8F67sn/JtMklc0B6ywqmCfQnPvqS7CPwNjA/MdTH2HiLmbbizcHDWqPM6FOZPP/UmORKbDe6FM8oKoQSVwxFdrmCzGFcrMr5MsIXFAaRLkFUWkzvljvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792007227; c=relaxed/simple;
	bh=KRZ9xbiYTZncg18vGkuraSMBFwUu8OGLGOTjJrqHZJE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=e12MnvSCGGXd86eoYwfV4BXNP27GMVESjUkV1ERmPObmLPWAOjfIyqLv+f1Rvi/kmJvwczdU3yiR3h8GofPaOCKiITNlkW9+FuauOQDBZ6yvqVz1XpgohhoiblsCWYaTC+i9Sna2pExEhAmVEeqyNn9FU+FdULPM8xzmhwJ/ljE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTcvBjm1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTcvBjm1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653B71F000C4;
	Wed, 14 Oct 2026 19:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792007225;
	bh=t06XAyqvwvh7BldG1BbSsR/GGcpf+GHIBagbv8XRRPk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lTcvBjm1tasmAmvdH0VLZLAo0FoJ6b5M2jo4ZbH4Ee1Ji2jIlpOqxOyYwqgWw6C/r
	 HJZ73rYjAJCAR9YOvSDNqxhU637D7G2LMQEof/G+fd0BzL9J5Q4xR3bhoMXUiH0UCo
	 1o0rldtQP3MYjIYk4cFzCvufnLLSYMPT1CJIcG3EA4IXJAY7qk1dl5kVbQzwy1p6xw
	 v1cmVNLXCFQgfYdcqLgBKeTt1YFJEE6iOL4SeG/MCtj3vhnCdlgwMOU9TRgqH68QUu
	 TyHPu1JGgg6HxjCdyYmdmtAZR84PAY4Az19U0T2stiG7orBXcwZIxFjsQaGYedAtzS
	 uUCnRuZjABUSA==
Message-ID: <sashiko-outbox-171811@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add
 thermal zones for PMICs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Lezcano" <daniel.lezcano@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
References: <20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 19:47:04 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: missing #thermal-sensor-cells causes thermal zone registratio=
n failure
--

commit fd5ef96fe4a4a5f82c85c0157e689c00a5a97d30
Author: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal zones for PMICs

Add thermal zones for the ThinkPad T14s and describe the board
temperature sensors exposed through the PMK8550 VADC.

> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 0bee2a3d6e7a9..9586421553442 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -502,6 +502,81 @@ platform {
>  			};
>  		};
>  	};
> +
> +	thermal-zones {
> +		backcover-thermal {
> +			critical-action =3D "shutdown";
> +			thermal-sensors =3D <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;

[Severity: High]
Does this setup cause thermal zone registration to fail at boot?

During boot, the thermal framework resolves the thermal-sensors phandle usi=
ng
of_parse_phandle_with_args(), which expects the target node to have a
#thermal-sensor-cells property.=20

Since the target pmk8550_vadc node lacks the #thermal-sensor-cells property,
will the device tree parser return -EINVAL, causing thermal_of_zone_registe=
r()
to abort registration for all these newly added thermal zones?

[ ... ]

> @@ -1285,6 +1360,36 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
>  	};
>  };
> =20
> +&pmk8550_vadc {
> +	channel@144 {
> +		qcom,adc-tm;
> +	};

[Severity: High]
Should this override block include `#thermal-sensor-cells =3D <1>;`?

Adding the missing property here would allow the thermal framework to
successfully parse and register the thermal zones.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014193524.5590=
-1-daniel.lezcano@oss.qualcomm.com?part=3D1
