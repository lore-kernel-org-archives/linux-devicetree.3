Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB377342509
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785442753; cv=none; b=nrhbNhCYZDfZuUXuAiDRFIOB6f9ajlGHnbV0IDX4+HdG46yTkI5Bo9W5IjPbv6pBYeeqLOHtaitglqKDxI227sCevBPNlCL40txmoE1x6mA8EczPFYXX6UUbhuEJcy+qdzQ5bjzTsuHqyTx5epsunhpO+3yhKJ9MDPDxLfuxWfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785442753; c=relaxed/simple;
	bh=w9pqK8fP3brD0prcz8D+uwcpsoZp2BFTN1aZthSqfAc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NfcwH53ZjtZZq4xhk+/d5Vm5OW85o1oX1AelhWiUodpTSlS6Z+6QuFGD+CWCfnw47+6D8QEcdxN/cERD0J9ugnqgX2vtHZAia0PcHBGHo9awqJH87J/cqLxLXeMQWnRzLxiR6ZUboM8/cgEem7rDlmolZhl+AfbRv4c5PKittzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB2LVJ2i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB2LVJ2i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A9C1F000E9;
	Thu, 30 Jul 2026 20:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785442752;
	bh=fV+g4Re49+YD0PpyqGUBWFTua/OsWCrYCApwuM82WNE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YB2LVJ2iEQ4t9McOynl/+UubK1+WkG0NebL2owFct7n7C8OrJW1+Xm/BxDz2tlykP
	 MhushSGRQCnmMCQ4zazsjRPnnwc9FCY/T+YRLq1GnDLe+VDmwD0hQpa3+lE5sPmun0
	 1mlJRX5Cfj/tveJkkjNejkiBUGz60W3255ZGRVvZUeD+CRUYsC3SuVUX/tr+P5Awj5
	 JkIvMW+Pqnas3zqbUsreeOTajtwn9GPndLHZQMFOPekLXYeSVJg02Cir5AfbsRwfXg
	 GRl0lF/4mTWVM9OZ3snOu3Vt8rIeSGjm9Trd45cFYT0CwzdLa6+VjCGeSB3jyN8PqY
	 SjgAGGEENsJ7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: exynos7870-j6lte: add Sharp
 GP2AP070S proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260731-gp2ap070s-v3-3-d1f5cecf9fe7@disroot.org>
References: <20260731-gp2ap070s-v3-0-d1f5cecf9fe7@disroot.org>
 <20260731-gp2ap070s-v3-3-d1f5cecf9fe7@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 20:19:11 +0000
Message-Id: <20260730201911.F3A9C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `i2c_proxm_bus` pinctrl node assigns a hardware alternate pi=
n function (`EXYNOS_PIN_FUNC_3`) to pins that are driven by a software bit-=
banged `i2c-gpio` device.
--

--- Patch [3]: [PATCH v3 3/3] arm64: dts: exynos7870-j6lte: add Sharp GP2AP=
070S proximity sensor ---
commit 2279f9b3f632fe5641c2ffa9eb9b410688448a06
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

arm64: dts: exynos7870-j6lte: add Sharp GP2AP070S proximity sensor

This commit adds the devicetree node for the Sharp GP2AP070S proximity sens=
or
which is connected to a GPIO-driven I2C line, alongside a new fixed regulat=
or
for its VDD supply.

> diff --git a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts b/arch/arm64=
/boot/dts/exynos/exynos7870-j6lte.dts
> index de30d0970336f..dd493138fed6e 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
> @@ -73,6 +73,35 @@ key-volup {
>  		};
>  	};
> =20
> +	i2c-proximity {
> +		compatible =3D "i2c-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&i2c_proxm_bus>;
> +
> +		sda-gpios =3D <&gpf4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +		scl-gpios =3D <&gpf4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;

[ ... ]

> @@ -579,6 +624,12 @@ bt_enable: bt-enable-pins {
>  		samsung,pin-pud =3D <EXYNOS_PIN_PULL_DOWN>;
>  	};
> =20

[Severity: Medium]
Is it intentional to configure a hardware alternate function for a bus that
is driven by a software i2c-gpio device?

The i2c-proximity node uses the i2c-gpio driver for software bit-banging, b=
ut
the i2c_proxm_bus pinctrl configuration below assigns EXYNOS_PIN_FUNC_3 ins=
tead
of a standard GPIO function.

This configuration can cause the pinctrl framework to briefly connect the p=
ins
to a hardware IP block before the GPIO framework requests them and forces t=
hem
back to software mode. If the underlying hardware IP is active during this
initialization window, it could drive the lines and lead to transient bus
contention or glitches on the sensor during system probe.

> +	i2c_proxm_bus: i2c-proxm-bus-pins {
> +		samsung,pins =3D "gpf4-3", "gpf4-2";
> +		samsung,pin-function =3D <EXYNOS_PIN_FUNC_3>;
> +		samsung,pin-pud =3D <EXYNOS_PIN_PULL_NONE>;
> +	};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-gp2ap070s-=
v3-0-d1f5cecf9fe7@disroot.org?part=3D3
