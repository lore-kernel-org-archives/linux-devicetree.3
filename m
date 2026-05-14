Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA54F5E0
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 19:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778788095; cv=none; b=ulr/aFRoTsGNoO6FBQTXeAQrVfmxkRD+TVDcg8u/hHTPPTHZOHXled58c779AIznC7W0hqaqDnHguTDyu4nUuG3TKMO/hlODcFNXexX6K2kFawGNKcbbLn6HMzYv2bBxhYATxfiQSpnlDt5zzY3Tx/O3GUX9rcPRPOY1tML/0hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778788095; c=relaxed/simple;
	bh=eTrx/pBlFhV9uEx4jojp4Mo3mf88u30r9n8gLWP9vuo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JDHx3Fx9iu0c2scqDJee37aHm/G6fvvqaoen3LYS2DIFflab5Vd/BG0KuYdo5Odk4XKfQL+x34USvY7KDtnA4QtmNHuvl8nWLkJLb4leocjIt2CtYO4/+e4s8XBwJxKLw4qc9HNx9f4vKBe1KF5ChG+beIZFBuKJCxlQANzeG+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G2IfPriv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G2IfPriv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3483CC2BCB3;
	Thu, 14 May 2026 19:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778788095;
	bh=eTrx/pBlFhV9uEx4jojp4Mo3mf88u30r9n8gLWP9vuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=G2IfPriv5ELxlt9fBm8z52g1mUhwwK1tFZIzsJsNIAVeOt/+qlRWRTutKKbLhyZtB
	 AK2qhhhFgDTH4mzJBOH9UFQD1voadaKFwibJGe+blPlhVuWX8Z9kCbUHuhv4F4pir0
	 YyJKtTYRjHlI8RVmmWDBvXuOzTZUy8/sG00OaOMoVLp9kMl2M3kxMbrtA3fJmdbMKy
	 fq7fOPb2frLTYXlkN6t94r0GQnx5GwQmTJdL7FIVD2IbXxSimZfFAUN34s6rT3sZDy
	 pWyYu/6DBwnyOppqticEyn5//qlkiSMv6eUkkmolh1us+vNWHUAAGjlz+4LxyL4pSm
	 La2cmnSMbDGXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] riscv: dts: anlogic: add clocks and CRU for
 DR1V90
Reply-To: sashiko-reviews@lists.linux.dev
To: "Junhui Liu" <junhui.liu@pigmoral.tech>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260514-dr1v90-cru-v5-5-34f3021aab51@pigmoral.tech>
References: <20260514-dr1v90-cru-v5-5-34f3021aab51@pigmoral.tech>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 19:48:14 +0000
Message-Id: <20260514194815.3483CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `can_ext` and `wdt_ext` fixed-clock nodes are missing the mand=
atory `clock-frequency` property.
--

commit 2b9cd6d4a55b4608470fd48bd92b6cacba368046
Author: Junhui Liu <junhui.liu@pigmoral.tech>

riscv: dts: anlogic: add clocks and CRU for DR1V90

This commit adds clocks and introduces the Clock and Reset unit node
for the Anlogic DR1V90 SoC. It configures a main crystal oscillator
and two optional external clocks for the CAN and WDT modules.

> diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dt=
s/anlogic/dr1v90.dtsi
> index 9fe183f5f5c8d..574c6608aef01 100644
> --- a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
> +++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi

[ ... ]

> @@ -40,6 +43,26 @@ cpu0_intc: interrupt-controller {
>  		};
>  	};
> =20
> +	clocks {
> +		can_ext: clock-ext-can {
> +			compatible =3D "fixed-clock";
> +			clock-output-names =3D "can_ext";
> +			#clock-cells =3D <0>;
> +		};
> +
> +		osc: clock-osc {
> +			compatible =3D "fixed-clock";
> +			clock-output-names =3D "osc";
> +			#clock-cells =3D <0>;
> +		};
> +
> +		wdt_ext: clock-ext-wdt {
> +			compatible =3D "fixed-clock";
> +			clock-output-names =3D "wdt_ext";
> +			#clock-cells =3D <0>;
> +		};

Are the can_ext and wdt_ext fixed-clock nodes missing the mandatory
clock-frequency property?

The fixed-clock devicetree binding requires a clock-frequency property.
Without it, the fixed-clock driver fails to read the frequency and returns
-EIO during both of_fixed_clk_setup and platform probe, failing to register
the clock providers.

Because the cru node specifies these clocks as suppliers, the kernel's
fw_devlink mechanism will indefinitely block the CRU driver from probing.

This recursively blocks all CRU consumers, including the UART console,
leaving the system without a working console.

Would it be better to add a dummy frequency, mark these nodes with
status =3D "disabled" in the dtsi, or define them only at the board level
when they are actually present?

> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-dr1v90-cru=
-v5-0-34f3021aab51@pigmoral.tech?part=3D5
