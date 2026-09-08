Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87B595735
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 17:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788887717; cv=none; b=D50YgMmqtg3AMVCbsMewrQMcXsE0Es+ZvqCZ4zeeogZ0jgKExQpgX/WrjUgv+ARZdP6jGfV4Ne+Iuol8vqJ1AzrUNcwC6Kt+AQcqsT0ojX3c3bk3Dc9jwI1bSWSlyp+BZD6owLvcuRpE1cdZ5CxiLt8AWxjOhxIYKKX9VABEht8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788887717; c=relaxed/simple;
	bh=8D3VmgyCnq4jz4UIrd/QbKVqxG1R9LXZrmNAyJfshJY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CyR5lfOoIHsY8nRTHjgUgpUxG32og2c+/YHLrM5pJ6yYvcIWQJFZ+y34KnagaWm3oyKKSCbXT019LzSfP1rid1F0jLgPxWHFn/nbIh8k+28/bNBGu1LSc6RUImWpI5v8PYf6n8WXJst/O0gnfdKrdeaHIge1O1vquWvYqXaVxyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fA4eafXe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fA4eafXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E35991F00A3A;
	Tue,  8 Sep 2026 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788887714;
	bh=HxNm6ZEcAt+VwKyF0/zlU8w+W6SfokXKRRDiVzeKe3w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fA4eafXe5gizITKIw4nUJ8KjzsmGcoZCM2Qeh+5A0mqzgrqZzhVVJmyNADQJ/9GwS
	 34umj7LqK1uJp0tqg5Ypz4TTAfxqJn0ayTysoRR/TS/C6aXp73bb1Y0Ja9DaUsPw1a
	 y7WHqXC6IXgN4eBORvhZ6Y3ONLxWKhhwprrMbED/koz+HWJ3hMAdUhntNvLWDYvB2J
	 RDTpEHJ8j+jcj5XJkaFT9NJmpqaYmOVDg/XOkIHfrI2pGyAMLHh2fDlRDmgO93P7gl
	 rD54VAAUwB96XRq4TgEoLegrC2c5eC2j5iuUviSBlIBj7uGwcJlXOMFHNqf6fv/2OU
	 WYSsnIbBb3atw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mmc: dts: am654: Add 650ms power off delay for proper
 MMC power cycle
Reply-To: sashiko-reviews@lists.linux.dev
To: "Judith Mendez" <jm@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260908170635.238775-1-jm@ti.com>
References: <20260908170635.238775-1-jm@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 17:15:13 +0000
Message-Id: <20260908171513.E35991F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `power-off-delay-us` property is added directly to the MMC h=
ost controller node, where it is completely ignored, rendering the boot fai=
lure fix entirely ineffective.
--

commit 02105a5fc6c6d24da9df99e671b001a1f3cd6d1c
Author: Judith Mendez <jm@ti.com>

mmc: dts: am654: Add 650ms power off delay for proper MMC power cycle

This commit attempts to fix a boot failure caused by incomplete VDD
discharge during MMC power cycles. It adds a power-off-delay-us property
to the sdhci1 node to provide time for the RC circuit to discharge.

> diff --git a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts b/arch/arm64/=
boot/dts/ti/k3-am654-base-board.dts
> --- a/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am654-base-board.dts
> @@ -460,6 +460,7 @@ &sdhci0 {
>  &sdhci1 {
>  	status =3D "okay";
>  	vmmc-supply =3D <&vdd_mmc1_sd>;
> +	power-off-delay-us =3D <650000>;

[Severity: Medium]
Will this property actually be parsed by the MMC core here?

When placed directly in the MMC host controller node, the power-off-delay-us
property is completely ignored. It is only parsed when placed inside an
mmc-pwrseq-simple node, rendering this proposed fix ineffective.

Furthermore, even if it were parsed via a pwrseq node, the
mmc_pwrseq_power_off() delay executes before the VDD regulator is disabled =
by
mmc_set_ios(). This means the delay would occur while VDD is still actively
driven, failing to provide the required time for the RC circuit to discharg=
e.

Should this instead be implemented by adding an off-on-delay-us property
directly to the vdd_mmc1_sd regulator node?

>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&main_mmc1_pins_default>;
>  	ti,driver-strength-ohm =3D <50>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908170635.2387=
75-1-jm@ti.com?part=3D1
