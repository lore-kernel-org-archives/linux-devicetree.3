Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1141C5F11
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 20:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780171507; cv=none; b=LWvZg1cLRpmZ63WS21AX+WYKJUpafuLPCXZfod9uAgBg0xAG8GZL5Bn05WBpdOzox9oBdxwRvGjI/xvPa5SN+XCGHz6zinez9A5cp6mdxVEDDARteF4x6Wc/DkTp05XcFy3ktA71ObXKHl0Drbd7DbWcVH3P5zTIgKfJj4fZ9SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780171507; c=relaxed/simple;
	bh=PRdoQ2yE3nFcVuMZ5q1zSZ/dS6OKSPcr191FBwuiSiY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qwr4FoiXLsSqLtGLj1Tyovz9AJjZrtpUQj3UInng0mBbJnRo3mzBbD7lIgSM9tuofTKZMvD2A+pzCg2A5Mk+ug9PCLucZgvORap8/Pb60JAvR4mR/vZM4UkPJcesQPR3i1/dfedvcH0ufSI8fs0SK4q+jzWOT6WRpIDH2MiCLZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TRJSFZXX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TRJSFZXX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE141F00893;
	Sat, 30 May 2026 20:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780171506;
	bh=6v2aeEiQ1NeMDwCQKrUg2PVS5AwcY9UsZtzA8l/3lYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TRJSFZXXm8ksprnT3KNNM7vLXmookDWUBSgd9g8SvYjY89m5s2OjX4cyLZknEXpWL
	 vnOXFGQBnq5AenEv0bPnEs3379zPag326cWD0xVwN5k9ZhpohquZ5Yj1bUqmpMULq1
	 vDG79unoUwFcF4KkzqdESuvcr/ukc3PQC2epfbTl7/+AAmUCVPY2kVyIAWXcCbJ7pD
	 RDbH299za2ue/GTser5CM83snI6uQ3ieIqmifyNNBDA+Pnhn95wjh15nWGH8pdxqsP
	 fky1tXcH02r2t0d/kYiSSP3a1yctQbNAgNfyRe6IJ5GvyBEpffgdSZSe9nZCSClYH6
	 LZd1WNB7TZDew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net v2 2/2] dt-bindings: net: updated interrupt type to
 be active low, level triggered
Reply-To: sashiko-reviews@lists.linux.dev
To: "Selvamani Rajagopal" <Selvamani.Rajagopal@onsemi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <CY8PR02MB92497E67D5AB4C72E7A4C12683162@CY8PR02MB9249.namprd02.prod.outlook.com>
References: <CY8PR02MB92497E67D5AB4C72E7A4C12683162@CY8PR02MB9249.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 20:05:05 +0000
Message-Id: <20260530200506.1FE141F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The DT binding correctly updates the interrupt type to active low,=
 level-triggered (`IRQ_TYPE_LEVEL_LOW`), but the `oa_tc6` driver hardcodes =
`IRQF_TRIGGER_FALLING` in its IRQ request. This mismatch causes dropped int=
errupts, and attempting to fix the driver to use level-triggered interrupts=
 would currently result in an interrupt storm.
--

commit 50f6d43fc72305690796fcff8249a6220cbe4714
Author: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>

dt-bindings: net: updated interrupt type to be active low, level triggered

This commit updates the LAN8650 device tree binding to specify an active
low, level-triggered interrupt, aligning with the hardware specification.

> diff --git a/Documentation/devicetree/bindings/net/microchip,lan8650.yaml=
 b/Documentation/devicetree/bindings/net/microchip,lan8650.yaml
> --- a/Documentation/devicetree/bindings/net/microchip,lan8650.yaml
> +++ b/Documentation/devicetree/bindings/net/microchip,lan8650.yaml
> @@ -67,7 +67,7 @@ examples:
>          pinctrl-names =3D "default";
>          pinctrl-0 =3D <&eth0_pins>;
>          interrupt-parent =3D <&gpio>;
> -        interrupts =3D <6 IRQ_TYPE_EDGE_FALLING>;
> +        interrupts =3D <6 IRQ_TYPE_LEVEL_LOW>;

[Severity: High]
This is a pre-existing issue, but this DT binding update highlights a
mismatch with the driver implementation. The hardware uses an active-low
level-triggered interrupt, but the driver currently hardcodes an
edge-triggered configuration:

drivers/net/ethernet/oa_tc6.c:oa_tc6_init() {
    ...
    ret =3D devm_request_irq(&tc6->spi->dev, tc6->spi->irq, oa_tc6_macphy_i=
sr,
                           IRQF_TRIGGER_FALLING, dev_name(&tc6->spi->dev),
                           tc6);
    ...
}

Does the driver need to be updated to respect the device tree's interrupt
trigger configuration instead of hardcoding IRQF_TRIGGER_FALLING?

If the driver is updated to use level-triggered interrupts, could this
cause an interrupt storm? Looking at the current hardirq handler:

drivers/net/ethernet/oa_tc6.c:oa_tc6_macphy_isr() {
    struct oa_tc6 *tc6 =3D data;

    tc6->int_flag =3D true;
    /* Wake spi kthread to perform spi transfer */
    wake_up_interruptible(&tc6->spi_wq);

    return IRQ_HANDLED;
}

Since oa_tc6_macphy_isr() returns IRQ_HANDLED without clearing the hardware
interrupt condition (which requires a slow SPI transaction), wouldn't the
IRQ core immediately fire the interrupt again if it were configured as
level-triggered?

Would it be safer to migrate this driver to use devm_request_threaded_irq()
with IRQF_ONESHOT so the interrupt remains masked until the threaded handler
can clear it, properly supporting the level-triggered configuration defined
in this binding?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/CY8PR02MB92497E67D5=
AB4C72E7A4C12683162@CY8PR02MB9249.namprd02.prod.outlook.com?part=3D2
