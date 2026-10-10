Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17F5377AB6
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644740; cv=none; b=KFnpOqDij9cj62GF5OSO9f6YkpsloU6e2RazhgYg2A4xVtkBzYXW3xfWFBfr3fBEeY9wkJfh3CiS3vBa4+tfodq13LFauH/9ziSR7kLFnvq3UjZQt95weU/5slGKQoeW2mVtmttpN4TJ00n9oVrWh464XmIL/6bctFNW1jePp08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644740; c=relaxed/simple;
	bh=AKgVVsl6pvtIsQ/Z8vXfUWv20pi1t25xBZRN7jc0lik=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=AoS8aaF+wOaTQBAKFzoIRQHu4xVBJTU5KPHrIDPequlsmYd7QjtGKY9Wp3AGxr/eMaRFMXjCyz4jmoWBULkt0pfMz5l1fx0/TjxmXwuPGb5aT09OGnlF3tvjetcVm9vHU7cKCEEt7foXPsC4xiajHvutgiQSe7JfsuPBJWJi2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HUx1mJzv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HUx1mJzv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC751F000FF;
	Sat, 10 Oct 2026 15:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791644739;
	bh=IwasOWH2xfPCisr7eJdbd+TmxwcD4ZfpLSgz+FT9DqY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HUx1mJzvO86pWx40NJc+9jQ+LMfxRvv4wHibBzGO9r6WZ0D1UvixwWyLDIcsK0ykt
	 keopbNNV96ZnlSeOMJHG8pXYWXBaBVi7YJZEfAfqINkBkklimBYruCuAI9YXB+38X5
	 H//yESZAUqy3iqDF64j87pJauKQkFnI0/VgD8/3P5Ik7YF2KBOXh5PW+6aIOL7pwRj
	 EyuKQt9X73ZGFRV32SpjIFScuwNmqnOAK5TB+gagG2hRfzc+fto9FlBYmrcseSP8Ez
	 v23XySGJZ20H4l4PQR6FnBTNMrCY1PupRjZtA6Tc4NuRoCl2AhcuNvoHbDWkS433Og
	 OeemVj2Yodocw==
Message-ID: <sashiko-outbox-166680@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sc8280xp-x13s: Add embedded
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Robinson" <alex@ironrobin.net>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010145519.8370-4-alex@ironrobin.net>
References: <20261010145519.8370-1-alex@ironrobin.net>
 <20261010145519.8370-4-alex@ironrobin.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 15:05:38 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: dtbs_check validation failure due to forbidden input-enable pr=
operty
--

commit a33aecbbb5f75c5311ccdc6af88f07e6aaed6105
Author: Alex Robinson <alex@ironrobin.net>

arm64: dts: qcom: sc8280xp-x13s: Add embedded controller

This commit enables the ThinkPad X13s embedded controller to provide keyboa=
rd
backlight support when booting with Device Tree. It also configures the
necessary interrupt lines and pinctrl states.

> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b=
/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 218573a97785b..1e29bab37de6d 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts

[ ... ]

> @@ -1571,6 +1590,20 @@ sc-rgb-xshut-n-pins {
>  		};
>  	};
> =20
> +	ec_int_n: ec-int-n-state {
> +		pins =3D "gpio103";
> +		function =3D "gpio";
> +		input-enable;

[Severity: Low]
Will this property trigger a device tree schema validation regression during
make dtbs_check?

The DT binding schema in Documentation/devicetree/bindings/pinctrl/qcom,tlm=
m-common.yaml,
which is inherited by qcom,sc8280xp-tlmm.yaml, explicitly forbids its use by
setting input-enable: false for qcom-tlmm-state nodes.

> +		bias-pull-up;
> +	};
> +
> +	ec_power_state: ec-power-state {
> +		pins =3D "gpio176";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010145519.8370=
-1-alex@ironrobin.net?part=3D3
