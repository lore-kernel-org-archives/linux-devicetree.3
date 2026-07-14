Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8307032B12A
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 07:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015811; cv=none; b=bTMnPWeRMKZkroZGamiMEDm7XDSrqBImSHNSFOYXbfOV4W0xF9LYVFdMEu7PQZWJaB/mP+CVnO6+36eJa7kCp2zg9b7dVsEE35XBg9jsoA9H2FjQXqWcHSoodjLFjeyS4+H0tvF7RJXuJ1Ht2rEYmX4wm1f9V08JYABA+yrKzmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015811; c=relaxed/simple;
	bh=2c23hnHbxkBExZB7nH4pIX+K3SFqxqXRVjY06EBZlVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uHUuel4O9Qs2HjtnvnuM5VI+yIrBwn7XmS4CleXiiMrnhC6t1j4tHY17p0HBLDbVpH6CIcGehzWk+pWeKD9u6ZiXvADLoGWfeMJIiGh5tqhSL24yflRrnTLUh8BSOawVMQv9F1NC4WX2sGM6jNhYl1KOxurQDexp8MpRLQTffnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4WFRo4e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4WFRo4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17CA1F000E9;
	Tue, 14 Jul 2026 07:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784015810;
	bh=EM0WrW/1uVhB7fD8+h4eV+IniHcUxE028WTSGH+BZU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R4WFRo4e7UBYM9oL+0TC8EkWYCYwm+/a05ZxxiJ90FGjTECi6F8X7d6hlIAuyPuNa
	 KGz/7KVAeDbtEFRpryTA+go/u99QC5Kxr5oUNPl0Tv9ehlkQnlAvZ8M4j5F073Rbj+
	 JTe5fvoZlzs3SdmeSDRe5oK39+z2+qS2wC2aUGSrOQr88L01IN9Jo3qtcOWvh2a1GO
	 q5ZkQWYnf3gCUTjcFWtuP01KOOyTwKQaSPHazCjCbwfNCuv42v7XobwiVkp9GGzQBC
	 6oeNnWeJR29obVRamMG10qpU5qY+ez29gRF5nPOoizkslXDVc7A44s+x9Kp5yuJbeh
	 KWYpMKf4W9zFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] riscv: dts: thead: Add IO labels for the IO
 expansion on I2C1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Icenowy Zheng" <zhengxingda@iscas.ac.cn>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714074515.1959352-5-zhengxingda@iscas.ac.cn>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
 <20260714074515.1959352-5-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 07:56:49 +0000
Message-Id: <20260714075649.D17CA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `gpio-line-names` array added for `ioexp2` incorrectly labels p=
in 4 as `wl_host_wake` and pin 7 as `bt_host_wake`. This is physically and =
logically incorrect because the PCA9557 IO expander lacks interrupt output =
capability, meaning it cannot be used to receive asynchronous wake signals =
from peripherals to wake the host. Furthermore, pin 4 is already configured=
 in the base device tree as a `reset-gpios` output for the `wifi_pwrseq` no=
de, directly contradicting the input nature of a host wake signal.
--

--- Patch [4]: [PATCH v2 4/5] riscv: dts: thead: Add IO labels for the IO e=
xpansion on I2C1 ---
commit 0fffc115b12752f1a08b3dcb530cafc2d17759f7
Author: Emil Renner Berthing <emil.renner.berthing@canonical.com>

riscv: dts: thead: Add IO labels for the IO expansion on I2C1

This commit adds labels for GPIOs on the IO expansion chip on the I2C1 bus.

> diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/ris=
cv/boot/dts/thead/th1520-lichee-pi-4a.dts
> index 74b120c6b063a..78f5979a56c14 100644
> --- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
> @@ -128,6 +128,14 @@ ioexp2: gpio@18 {
>  		reg =3D <0x18>;
>  		gpio-controller;
>  		#gpio-cells =3D <2>;
> +		gpio-line-names =3D "",
> +				  "cam0_reset",
> +				  "cam1_reset",
> +				  "cam2_reset",
> +				  "wl_host_wake",
> +				  "bt_resetn",
> +				  "",
> +				  "bt_host_wake";

[Severity: Low]
The PCA9557 IO expander lacks interrupt output capability, meaning it cannot
receive asynchronous wake signals from peripherals to wake the host.

Additionally, pin 4 is already configured as a reset output in the base
device tree for the wifi_pwrseq node:

arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts:
	wifi_pwrseq: wifi-pwrseq {
		...
		reset-gpios =3D <&ioexp2 4 GPIO_ACTIVE_LOW>;
	};

This configuration contradicts the input nature of a host wake signal.

Are the labels wl_host_wake and bt_host_wake correct for this IO expander?

>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714074515.1959=
352-1-zhengxingda@iscas.ac.cn?part=3D4
