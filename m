Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973555;
	b=m65SkWKAblXBuTo5aBvzAQ4Usp0fa5eJ6ABBcwMOhxservPHlBGg+uV0YPvMcU+2K3U2
	 KrQ6hUSsvpA+bk9u1vyr8OiOFKP/syA3sklRTDDLQvJO7fBKp0qZD1algSta7w2uVAcav
	 oHPlU0QuX8dvDScY6vKdOenkvmDa8lF6GeWOG2I0WbkH0cDp8LtFWM6fic0cl8LlfHb/U
	 L0DJ+3y3dSznt1+0TMGHuze1LBKfCTXRcaaKx5jSn3SzjhNWoOkcjqjy+o6YjP2r1S22S
	 15zA6ij5QsIBaL4cT6K96SNy5VDWjYmC8aKY44+8yo7u/TrmZlXXPIEPKk0fiiBaoUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973555;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sxqycRChkNWLhbotzMIZyBsfJgDD9+fF2xdg2Mah+Z0=;
	b=PTGhrJ/tTqI0YF35iJQrYkk3wPqd89AlZQawcT+YNfnKrz+gwkYtkIOZ8njTcIUKxrc5
	 M9TbhTQHaTl7s3fhy205lNxnC/7OBtG9B+PbJj2sL0u1rFc1djr8r5usYf5pq9eEHS/De
	 mo3nYpoxwMoy21kXbynRebUaP7NmGBClxHzFWxaD9mx0GmTTR5HJy1ayQGFv63s7tE7qi
	 +jk9EYo3beR7jTj1rqWNWbHKuSND0HzZH7XsAvfrhiQxaH0oRcIk6ks/DNVLMkZstQEXK
	 RT5EOCnOsvLXRo3eACYBGzzaxaKo+NxyKViBSzWfAQbrAIbpM+x9WO8FPTpU+ShTeng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="aLcBM/+6";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA79606A31A
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aLcBM/+6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559C11F01825;
	Mon, 26 Oct 2026 00:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792973554;
	bh=sxqycRChkNWLhbotzMIZyBsfJgDD9+fF2xdg2Mah+Z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aLcBM/+63YzTJTpMvaDGTDAi7Mtuid5dQ+a5KNb553D6VITOCk+DlxsOfHkvXNyS+
	 IPmXUKOTyKgHV+6l3O6217eoTVsvqCN/RLQ3wT3bV6hWsVOTHsg7TMjsTrMh5tiiSz
	 NVDoeaDV8kIS8xI7LDk/yXwKR+uLLkHhKNVofkILdijOYvyY5n1r+mZOOEzSumAuMd
	 g8f7guyqG188k4PzQArLY4SqMze3OJoRNxgsueUtDL6qoocpTLmjJqSaw1pQdUz9iO
	 Me+Y0Tk36Aqnkr/vDuXV05oAtSv0T7hCEAwWZxXbxDHLogo4nxkVz1C9z6CPs7f8HC
	 lT6gGSpi0zigA==
Message-ID: <sashiko-outbox-184558@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-dell-xps-9345-ec-v7-3-828ce301b839@vinarskis.com>
References: <20261026-dell-xps-9345-ec-v7-0-828ce301b839@vinarskis.com>
 <20261026-dell-xps-9345-ec-v7-3-828ce301b839@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 00:12:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: level-low EC IRQ with stub dell_xps_ec_irq_handl=
er()
--

commit bdc3996f914e2f3bd3df5f76f45237ab26fd449b
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

arm64: dts: qcom: x1e80100-dell-xps13-9345: introduce EC

This commit enables i2c5 and adds the embedded controller node along with i=
ts
interrupt and thermal ADC channels for the Dell XPS 13 9345. It also adds
labels for the known PMK8550 VADC thermal channels.

> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch=
/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> index f48e6bc350063..3f0c17c845b3e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
> @@ -759,8 +759,32 @@ retimer_ss0_con_sbu_out: endpoint {
> =20
>  &i2c5 {
>  	clock-frequency =3D <100000>;
> -	status =3D "disabled";
> -	/* EC @0x3b */
> +	status =3D "okay";
> +
> +	embedded-controller@3b {
> +		compatible =3D "dell,xps13-9345-ec";
> +		reg =3D <0x3b>;
> +
> +		interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;

[Severity: High]
Can configuring this interrupt as IRQ_TYPE_LEVEL_LOW cause an unrecoverable
interrupt storm when the EC asserts gpio66 low (such as on lid close)?

In drivers/platform/arm64/dell-xps-ec.c, dell_xps_ec_probe() requests and
enables client->irq as a oneshot threaded interrupt:

drivers/platform/arm64/dell-xps-ec.c:dell_xps_ec_probe() {
	...
	/* Request IRQ for EC events */
	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
					dell_xps_ec_irq_handler,
					IRQF_ONESHOT, dev_name(dev), ec);
	if (ret)
		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
}

However, dell_xps_ec_irq_handler() is currently a stub that logs a debug
message and returns IRQ_HANDLED without performing an I2C read to acknowled=
ge
or clear the pending event on the EC:

drivers/platform/arm64/dell-xps-ec.c:dell_xps_ec_irq_handler() {
	struct dell_xps_ec *ec =3D data;

	/*
	 * TODO: IRQ is fired on lid-close. Follow Windows example to read out
	 *       the thermistor thresholds and potentially fan speeds.
	 */
	dev_dbg(ec->dev, "IRQ triggered (irq=3D%d)\n", irq);

	return IRQ_HANDLED;
}

Because the interrupt is level-triggered (IRQ_TYPE_LEVEL_LOW) with
IRQF_ONESHOT, irq_finalize_oneshot() unmasks the line as soon as
dell_xps_ec_irq_handler() returns. If the EC continues holding gpio66 low
because the event was not cleared over I2C, the interrupt will immediately
re-fire in a tight loop.

In addition, because dell_xps_ec_irq_handler() returns IRQ_HANDLED rather
than IRQ_NONE, note_interrupt() in kernel/irq/spurious.c never increments
desc->irqs_unhandled, preventing the spurious IRQ detector from disabling t=
he
interrupt line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-dell-xps-9=
345-ec-v7-0-828ce301b839@vinarskis.com?part=3D3
