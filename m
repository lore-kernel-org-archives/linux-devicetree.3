Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D64733DEC2
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 18:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015459; cv=none; b=n3OV2DDmxAsZs8xZIej2qQJe9pFlDyATVNVy27gZ9RlbKS4d8hWF5LsjTuo1cJxaS9FOE4WTVbVe25HmZ5iqEVjsitvE6LkejhOPyP/SVg1OfbH5W2eR3rqU5Ql6bZXT0N4J5VIaxHOUCdUFGbKeuYyzfSWTNjfScIDXpc+dbwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015459; c=relaxed/simple;
	bh=l205TELwjjReSvFm8W6Nm/JrUCj/xzMcKfY9XPY3MCM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=anvdbf6vPJvtTOVdcEBbU8WfQnGTeG+Go6FoAbInZ8QMh8x2SANpdAal0jITFhjtyqWC0ajPmGZwA1HR6ekLHn5I12PxOukeOs+evfk6hliLZ1Oj5LZeKbzbxikHkpeeqjO3SDOrwLHesQobR5QlIbk/JdhqAthpyxyYvgNYny0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3rvphup; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3rvphup"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19D301F000FF;
	Mon, 21 Sep 2026 18:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790015458;
	bh=a5c0cPeinRekVe+UDx2lZJ4nYL+aCTmkMSg2X8XKWjk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E3rvphupe3gJst+q2kuC23QtHXhSKK+BoQKF+VX+5Z0YHA0tCKxMOS7pI9cMZb8So
	 G20YbB0awmKIs43qx1vEjYq5X689wq/TjuV1mcC3HzNyGTiHdmJLGRKqxXQYgttCXa
	 M+A6/KlacDl+HqXSzgcHrt5YLujDs0pI16KJrW/rmanJDaWQcN5IntOUE3f1wmAnLA
	 8VTbHgWL11Tqkdrn+SFjnxbnkC0ahyEWVZtwPQdWImyobDaXKOFg1GLvL7WNyyDMmk
	 GtM31QT7xKT53M0MXXfy07OC2kkhdWHiPmMsuFi/ZE4mGPgR4rcH9ZTledOFX4c8jf
	 5dyuhxzRsj5Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] arm: sunplus: enable SMP via PSCI on SP7021
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrew Gaylard" <ag@ffroot.co.za>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260921182620.17597-5-ag@ffroot.co.za>
References: <20260921182620.17597-1-ag@ffroot.co.za>
 <20260921182620.17597-5-ag@ffroot.co.za>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 18:30:57 +0000
Message-Id: <20260921183058.19D301F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: psci method smc contradicts commit message claiming hvc
--

commit ad7995ba29a2bfb8caf59ae3e73d64961f25f162
Author: Andrew Gaylard <ag@ffroot.co.za>

arm: sunplus: enable SMP via PSCI on SP7021

This commit adds the psci node and enables SMP via PSCI on the Cortex-A7 co=
res
of the SP7021.

> diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi b/arch/a=
rm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
> index 493d32357e4eb..b73cfde7ace4d 100644
> --- a/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi
> +++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-achip.dtsi

[ ... ]

>  	};
> =20
> +	psci {
> +		compatible =3D "arm,psci-0.2";
> +		method =3D "smc";

[Severity: Medium]
The commit message states that the SP7021 firmware implements PSCI 0.2 via
HVC, but the psci node configures the method as smc.

If the firmware actually requires HVC, will using SMC cause PSCI calls to t=
rap
to the wrong exception level (EL3 instead of EL2) or trigger an undefined
instruction exception during SMP bring-up?

Could you clarify if the device tree method should be hvc, or if the commit
message needs to be updated?

> +	};
> +
>  	gic: interrupt-controller@9f101000 {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921182620.1759=
7-1-ag@ffroot.co.za?part=3D4
