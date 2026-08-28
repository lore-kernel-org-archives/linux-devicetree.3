Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BD6472F62
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787930099; cv=none; b=lvIAIijL+jpsoLJuwFi8JakawYiaRbWSY5X6G9krCc6f8RGRSURzP8rcAODXoaN+3R9E7lpVIe1+mz5eyGkpjpOrIrPdMAzNRcmsC4qZThRgC4TsSxvXNwcB4fmPYiMhSJMpaspd8Bo1FTLUU+Aj80au2TBo+folmsHArQH46is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787930099; c=relaxed/simple;
	bh=jGKno5WiCNRrDIXwMeqONleTOMo/uAY57o6p6DzEBjM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rneEUw4OvHp2kYyjOT3IR4BEzK8JDHjKp158zICbnAfIwuqKLxJZu+6JVsYN0VSuNkOjHj4i+WVrfE87CPemki20tWQSVxbMkcFy7OLWJutEKkBIeBQ9EP20b6oycaHuhHoRHDXL5oF4DfYZZbVeuB0Jdp+FhN/MZa7Af/LFLak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HynXVgEn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HynXVgEn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8756F1F000E9;
	Fri, 28 Aug 2026 15:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787930097;
	bh=kbSMOFHXHs7Xowgmly5LrPktz97+ovtrqtvQhOmwEYs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HynXVgEncqaCfaS6jbBPhSBLuMaV5VRoMj8I0wLAxMXPsZcwHGP1jZk0f6qlrx3Ko
	 naYJ8JoTVGBGkbmA7m2Swtm3qVEmWFB/FznEmuyw2XLKvGktEhQDxBEmpvmst1U3rQ
	 rQL4GLtpKxIm03m369KwAEDkajBtCQtJk5rTK4BCkPASsjBLfp1918jtPVUWUcBiFi
	 ZJRmKkdjEl1SYbTSRdcubsRmMm5LzRh9LLmuRaOk7QIAdhzPHA/vQ88wnY1TyQ7bm9
	 jCpbjyb96O7HYsD7K6ZFyWdkhM9p6cOpbetBe0z2Nep4Xeo9gtMmFiR8pYwaw28js0
	 DWOJ2KtuQu3XA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] dt-bindings: iio: adc: renesas,r9a09g077-adc:
 document DMA support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmin Tanislav" <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260828145943.2077589-8-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260828145943.2077589-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260828145943.2077589-8-cosmin-gabriel.tanislav.xa@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 15:14:57 +0000
Message-Id: <20260828151457.8756F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Medium] The `dma-names` property schema dictates `maxItems: 3` and `item=
s: const: rx`, which inherently conflicts with dt-schema's `*-names` unique=
ness constraint, making it impossible to pass validation for multiple DMA c=
hannels.

Pre-existing issues:
- [High] The consumer's software read pointer (`period_index`) permanently =
desynchronizes from the hardware DMA write position when periods are abando=
ned during a backlog break, causing permanent data corruption.
--

commit 0d72d8676d8ea20bbe7d6a24553312b902a516ce
Author: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

dt-bindings: iio: adc: renesas,r9a09g077-adc: document DMA support

The ADC can transfer conversion results to memory over DMA. Allow up to thr=
ee
DMA specifiers, as the ADC conversion DMA request can be routed to any of t=
he
SoC's three DMA controllers.

> diff --git a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-=
adc.yaml b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.=
yaml
> index dc0206b282315..4b5934ac296b8 100644
> --- a/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> @@ -57,6 +57,18 @@ properties:
>        - const: adclk
>        - const: pclk
> =20
> +  dmas:
> +    minItems: 1
> +    maxItems: 3
> +    description:
> +      Must contain a list of references to DMA RX specifiers.
> +
> +  dma-names:
> +    minItems: 1
> +    maxItems: 3
> +    items:
> +      const: rx

[Severity: Medium]
Will this unconditionally fail device tree validation when multiple DMA cha=
nnels
are specified?

The core dt-schema strictly applies uniqueItems: true to all properties
ending in -names. A device tree specifying multiple DMA references as
intended by this binding (e.g., dma-names =3D "rx", "rx", "rx") will trigger
a validation error due to the duplicated "rx" items.

[Severity: High]
This is a pre-existing issue, but does the software read pointer permanently
desynchronize from the hardware DMA write position when periods are abandon=
ed?

In drivers/iio/adc/rzt2h_adc.c:rzt2h_adc_dma_thread_loop():

	for (unsigned int i =3D 0; i < pending; i++) {
		unsigned int backlog =3D atomic_read(&adc->dma.pending_periods) +
				       pending - i;

		/*
		 * Bail if enough new periods have completed since reading the
		 * pending_periods that the next period about to be read is at
		 * risk of being overwritten.
		 */
		if (backlog >=3D RZT2H_ADC_DMA_PERIODS)
			break;

		...
		rzt2h_adc_advance_period_index(adc, 1);
	}

The thread extracts all pending periods before this loop. If a backlog
accumulates, the loop breaks, discarding the remaining periods from the
extracted pending count. However, it fails to invoke
rzt2h_adc_advance_period_index(adc, pending - i) for those discarded period=
s.

The next time the loop runs, won't it resume reading from the old,
unadvanced period_index, corrupting all future ADC data reads?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828145943.2077=
589-1-cosmin-gabriel.tanislav.xa@renesas.com?part=3D7
