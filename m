Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A21A304BCB
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 12:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779278898; cv=none; b=jCfztMxe2OXbSXW0SAy/ScnXKmHXAn6IsyQQsm7NSSwB0aw/Os2/8CLWX/pIrfVpv/DjAv6E1v+Pf55/JY7Zq8lLJA2SJ9tE9P8YY01RANSn3OpQbtaQ8h9Uh8ABLkVLiB1+fR+3rhSPJYyCwPaUHZe0SXPIc6jTOfy8/U5qQ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779278898; c=relaxed/simple;
	bh=EiXLOtCfYu1cfiWpOLFErURgHZRyvxXjiWAJII+esnE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RbCommOH9LRc5QRbxV/WLq3kYCYtH074gXD5JepAlVRSwXoSuUg2KzSBV+Yk/ejCGrAl1CrjK3CokAhCfEUMBjJNZUoyBkLVeEoAW5gwOxj/34bGZ45RZG3Zer/GaOYerVTwH4lShA5MzHCuiHAazJC8tNvHS6rk2UFZClgQ2jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIlh6ger; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIlh6ger"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29DCF1F000E9;
	Wed, 20 May 2026 12:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779278897;
	bh=epNscJ+yHQtG4QczeevZUme06IdptawE1NXG9VbftHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IIlh6gerq0J0Ui1TVrYb5PQ5kutJnd9t+HqNyJuf5tRVsmr0Sv949tHBxhUwceX01
	 4TtrS5HKSwJD8u7UrZUyv8gVMxJ8gx8nyRMeedWinBF8zfpiAEC0PAPR8HtVeRCSTH
	 axpqqUpqDFgf3QEg15xKUao6Svw/hkwk2+OUeahk8cC7O0E0N7AcQ303pLg19I5CrN
	 jsiTn+YGtvSn5+zzPNGVi69vprGYVRD6eewCrNSNDrOGa+WjuR7+e/1QsL691+Iuxg
	 GCJLFAaZyqeRTEgBbfkpoHIUQ0opHaYSwhYX8T9e1iwdFiGqGR9LqqNztEIUAJ3ZEy
	 MoR1KrcjVpqHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: media: i2c: Add imx576 sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Himanshu Bhavani" <himanshu.bhavani@siliconsignals.io>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260520115641.11729-2-himanshu.bhavani@siliconsignals.io>
References: <20260520115641.11729-2-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 12:08:16 +0000
Message-Id: <20260520120817.29DCF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] The voltage specifications for DOVDD (I/O) and DVDD (Digital C=
ore) are swapped in the property descriptions.
--

commit 9b15ba2292de0fba24f7e296cd6c14ec7bd1a56b
Author: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

dt-bindings: media: i2c: Add imx576 sensor

This commit adds device tree bindings for the Sony IMX576 image sensor.
It defines the hardware interface properties including MIPI CSI-2 endpoints,
regulators, and clock requirements.

> diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml=
 b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
> new file mode 100644
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/sony,imx576.yaml
[ ... ]
> +  avdd-supply:
> +    description: Analog Domain Power Supply (2.8v)
> +
> +  dovdd-supply:
> +    description: I/O Domain Power Supply (1.05v)
> +
> +  dvdd-supply:
> +    description: Digital Domain Power Supply (1.8v)

[Severity: Critical]
Are the voltage specifications for the DOVDD and DVDD supplies swapped in
these descriptions?

For Sony IMX sensors, DOVDD typically operates at 1.8V and DVDD operates at
~1.05V.

Following this documentation caused a subsequent commit ("arm64: dts: qcom:
sm7225-fairphone-fp4: Add Sony IMX576 front camera support") to map a 1.8V
regulator to dvdd-supply and a 1.05V regulator to dovdd-supply.

Can applying 1.8V to the 1.05V digital core domain cause permanent hardware
damage to the sensor?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520115641.1172=
9-1-himanshu.bhavani@siliconsignals.io?part=3D1
