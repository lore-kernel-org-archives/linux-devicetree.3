Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973494;
	b=UNfrHJmRpAF739Ny/ijzftUIZ9p0CGO8dTVSja4wO2O4sm/NAQnQO/z2T1PQk6lLiaS1
	 K+QZcGdyj9OduHCno2kYzTm1lAtMtlxhQ6qnWt7X62sZeOSflDUAe1ZaphBL0vusZjXUa
	 jVFvLj3yro9odabTOFJtD1IXEFUSyfAJNO4uoWyAm/NkWsSd1fNNwJa+VTWUFwYacS4WL
	 LzWCn+56LLqq6RHKbPQ7Iq5y3L2dLxVCoD8R6WkvKwV9Q6aDwnMauvaEsZGHAzC2EsWV1
	 vbxSB32rEt93hAQh9BImORCn+7uC+poDxOh+tzPd6YXbJJ7/91HwFWaNhaPgAOahZqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973494;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0GRShxihRTPB2/qgIwaFflATDmXBg23KR4tKQ1snkPU=;
	b=BGYigEZ00TIHtNwK2KwOFQrRmOSRt4eZN+morunAd+sfpXSZMYzkPNNGtbQm+FceL5HB
	 1njJFCPu1iwiJzTVIQeuLA+JUwAMHJJZUKNRxqW/m/uqsHPxhEr1Hjh+07ry7FFOyDPVK
	 TvUJXpuIm/1JqH25Bu32RdoRcrUJsMGIST7hfo4JtuQEsOpZBmn3pt4hPFdmW04BMc2IR
	 Balw4MYcNNQECh9eRK2WjKRShsM2ruzxBoOVUmi9ThRmheT1wU4ZOQmDsXJ+jmBBji1M4
	 CvITWQ5Ua2gF+wk4j8fDxcyvuIGB0l56ahpH16trO5/PNiiO+hua4YhUI4zMhmAWtQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoAFTLLe;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F346606A31D
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AoAFTLLe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0291F01829;
	Mon, 26 Oct 2026 00:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792973493;
	bh=0GRShxihRTPB2/qgIwaFflATDmXBg23KR4tKQ1snkPU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AoAFTLLevWygTSmHSjNAI0YQSMzb2bgr/UoMaJWE1Vzayw2Jt37j2IrAjZrhWk7F4
	 y/sb9gdCS4IS6tsFC0p77U6kKKJRlujhCqMKFap0JE7Y96yT1fDrwq5910zNsXuhRa
	 CV4WK30GZA0kUEAIfYc+4KEmvzWcxhnpgGtv7ETWSIQjS7cN1hx6G0AQai2t6EUiSO
	 eHAKQYrLiLy7OC/ROYj5GKmMmceBHKHRcgxd1rp8a+LJazk5ZEWZe1CsneLP+vIG+5
	 NJmY26F/P5iSnOrlz5zF8WBDRM8p8fe+IibUgkUHYeJYzrAg4GTHmO4uV3u2OgtAIY
	 8PxYMi5pGAVJg==
Message-ID: <sashiko-outbox-184557@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/3] platform: arm64: dell-xps-ec: new driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Aleksandrs Vinarskis" <alex@vinarskis.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-dell-xps-9345-ec-v7-2-828ce301b839@vinarskis.com>
References: <20261026-dell-xps-9345-ec-v7-0-828ce301b839@vinarskis.com>
 <20261026-dell-xps-9345-ec-v7-2-828ce301b839@vinarskis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 00:11:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] platform: arm64: dell-xps-ec: level-low IRQ storm in dell_xps_ec_i=
rq_handler()
- [Medium] platform: arm64: dell-xps-ec: temp_work not rescheduled on resum=
e error
--

commit 40d07e79bd3d5e1fdf49249741f6c1ece2a424aa
Author: Aleksandrs Vinarskis <alex@vinarskis.com>

platform: arm64: dell-xps-ec: new driver

This commit introduces an I2C embedded controller driver for the Dell XPS
13 9345 to configure thermistor profiles, periodically feed IIO thermistor
temperature readings to the EC, and notify the EC across system sleep
transitions.

> diff --git a/drivers/platform/arm64/dell-xps-ec.c b/drivers/platform/arm6=
4/dell-xps-ec.c
> new file mode 100644
> index 0000000000000..20cb2a1b7bbd4
> --- /dev/null
> +++ b/drivers/platform/arm64/dell-xps-ec.c

[ ... ]

> +static irqreturn_t dell_xps_ec_irq_handler(int irq, void *data)
> +{
> +	struct dell_xps_ec *ec =3D data;
> +
> +	/*
> +	 * TODO: IRQ is fired on lid-close. Follow Windows example to read out
> +	 *       the thermistor thresholds and potentially fan speeds.
> +	 */
> +	dev_dbg(ec->dev, "IRQ triggered (irq=3D%d)\n", irq);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int dell_xps_ec_probe(struct i2c_client *client)
> +{

[ ... ]

> +	/* Request IRQ for EC events */
> +	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +					dell_xps_ec_irq_handler,
> +					IRQF_ONESHOT, dev_name(dev), ec);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +	return 0;
> +}

[Severity: High]
Will requesting client->irq here cause an unmasked interrupt storm when the
EC asserts its interrupt line (for example, on lid close)?

In Documentation/devicetree/bindings/embedded-controller/dell,xps13-9345-ec=
.yaml,
the interrupt is specified as level-triggered active-low:

    interrupts-extended =3D <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;

When the EC asserts the line, dell_xps_ec_irq_handler() logs a debug message
and returns IRQ_HANDLED without performing an I2C transfer to clear or
acknowledge the event on the EC. Once irq_finalize_oneshot() unmasks the li=
ne,
the level-low interrupt will immediately fire again, and returning IRQ_HAND=
LED
prevents note_interrupt() in kernel/irq/spurious.c from detecting and
disabling the stuck interrupt.

Should requesting the IRQ be deferred until the EC event readout is
implemented, or should the interrupt be left disabled for now?

> +
> +/*
> + * Notify EC of suspend
> + *
> + * This will:
> + * - Cut power to display/trackpad/keyboard/touchrow, wake-up source sti=
ll works.
> + */
> +static int dell_xps_ec_suspend(struct device *dev)
> +{
> +	struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> +
> +	int ret;
> +
> +	cancel_delayed_work_sync(&ec->temp_work);
> +
> +	ret =3D dell_xps_ec_suspend_cmd(ec, true);
> +	if (ret) {
> +		schedule_delayed_work(&ec->temp_work,
> +				      DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * Notify EC of resume
> + *
> + * This will undo the suspend actions. Without the resume signal, device=
 would
> + * wake up but be forced back into suspend by EC within seconds.
> + */
> +static int dell_xps_ec_resume(struct device *dev)
> +{
> +	struct dell_xps_ec *ec =3D dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret =3D dell_xps_ec_suspend_cmd(ec, false);
> +	if (ret)
> +		return ret;
> +
> +	schedule_delayed_work(&ec->temp_work, DELL_XPS_EC_TEMP_POLL_JIFFIES);
> +
> +	return 0;
> +}

[Severity: Medium]
If dell_xps_ec_suspend_cmd(ec, false) fails in dell_xps_ec_resume(), does
returning early leave ec->temp_work permanently stopped after the system
resumes or thaws?

During suspend or hibernation freeze, dell_xps_ec_suspend() cancels
ec->temp_work via cancel_delayed_work_sync(&ec->temp_work). On resume, thaw,
or restore, the PM core logs errors from dell_xps_ec_resume() but continues
resuming the system without re-running the callback. Would it make sense to
still reschedule ec->temp_work even when dell_xps_ec_suspend_cmd() returns =
an
error?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-dell-xps-9=
345-ec-v7-0-828ce301b839@vinarskis.com?part=3D2
