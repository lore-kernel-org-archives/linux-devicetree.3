Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCA63C3F5B
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 06:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022049; cv=none; b=fnfsw1hcz6wyKePOzP2G8qOmgkg6nqVhw41lv8UZJH27w8cR7bf1YO0zS7m7EKvZz7IOCY81XCkwA/8JZhMe6z1n7DNqQ90D0vyBiRIAqSCnpmUws3xF0P3BkCEpSOxpCpjeMTlXvB+gPHPoHUKgO1KabA2eKPg8Cw3HKM00oI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022049; c=relaxed/simple;
	bh=npcBFgV7Qn8ck8lM//UN7/T3mJwi4yhray30kienIZc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XxUa3cqLEc1YjlWzDLrUxOaiRZABwc+1mUQPjRBXGOQxBR00M5wDPVV6xvpxUX2ghxmYan+He+8Szkk3Ujeh364t4kWzK8IQD56za5jNYTgBOYOcqbe55I2208O4sFf4m/Tx9ptJQ/C6HLEI9/rMgsxkNwb2M4Nmbucw0gKRh5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODqFBcr/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODqFBcr/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CBD11F00899;
	Thu, 10 Sep 2026 06:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789022042;
	bh=vqnIfXnldyGd5lJ29aMEI76xUer00ebrN7yFwu/WcII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ODqFBcr/93b+cJO4lNj0lDRruqMPKXg2XS4qoXv1RZNsW1qS9BgjfoodQh0/GRGfe
	 Huz8X0oh3NCzBNgC35Szt7SWbKX7trd0d47Q/xBznsyXwn/rROYbsVA9b2ecZ4Lt3X
	 46TfCnabDndGujeI3/RhOXY9IV5QxBJ3Q0ArXUNrJpyV+Ow8N9qYgPPnX9dlGlxjoJ
	 5vcN/GwsD94aRwtGSvNYdU7KIU30pisoHrzgPLqFzXZjfzbvG+SKK8HZ/mOuFLHpOe
	 N3usfyKu1LAiagiWt/xhps3uK1e2jfIe9y+9rv+FKOMx4cmqlEQ+DyFfV+QcPADv9B
	 J4innfIgDJc6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] soundwire: qcom: add EE-aware register layout
 for Shikra
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260910-shikra_soundwire_support-v2-2-f98c9a6ea1e1@oss.qualcomm.com>
References: <20260910-shikra_soundwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com>
 <20260910-shikra_soundwire_support-v2-2-f98c9a6ea1e1@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 06:34:01 +0000
Message-Id: <20260910063402.1CBD11F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] IRQ handler remains active after subsystem unregistration (Use-Aft=
er-Free risk).
- [Medium] Missing clock cleanup on error path in probe.
- [Medium] Missing pm_runtime_disable() in remove.
--

commit ea7f212648855ca1f1b27ca9b52687d659dc81f7
Author: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

soundwire: qcom: add EE-aware register layout for Shikra

On SoundWire v2.0 and later hardware, FIFO, and status
registers are banked per Execution Environment (EE).
The existing driver assumes the SoundWire controller is
assigned to EE1, which is true for all currently supported
Qualcomm SoCs.

Shikra is an exception and assigns the controller to EE0.
As a result, the relevant register windows are located at
different offsets and cannot be accessed using the default
EE1 register layout.

Add an ee field to the SoC match data and introduce a
dedicated qcom,shikra-soundwire compatible with ee =3D 0.
The driver uses this information at probe time to select
the correct register layout, while all existing platforms
continue to use the default EE1 configuration.

> diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
> index 35ffffd541bd1..6e0c5fb10efad 100644
> --- a/drivers/soundwire/qcom.c
> +++ b/drivers/soundwire/qcom.c

[ ... ]

> @@ -1659,6 +1711,7 @@ static int qcom_swrm_probe(struct platform_device *=
pdev)
>  	prop->default_row =3D data->default_rows;
> =20
>  	ctrl->reg_read(ctrl, SWRM_COMP_HW_VERSION, &ctrl->version);
> +	qcom_swrm_set_ee_register_layout(ctrl, data);
> =20
>  	ret =3D devm_request_threaded_irq(dev, ctrl->irq, NULL,
>  					qcom_swrm_irq_handler,

[Severity: Medium]
This isn't a bug introduced by this patch, but looking at the error handling
further down in qcom_swrm_probe():

	ctrl->wake_irq =3D of_irq_get(dev->of_node, 1);
	if (ctrl->wake_irq > 0) {
		ret =3D devm_request_threaded_irq(dev, ctrl->wake_irq, NULL,
						qcom_swrm_wake_irq_handler,
						IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
						"swr_wake_irq", ctrl);
		if (ret) {
			dev_err(dev, "Failed to request soundwire wake irq\n");
			goto err_init;
		}
	}

If the devm_request_threaded_irq() for wake_irq fails, the code jumps direc=
tly
to the err_init label. Does this bypass the err_clk label, leaking the clock
reference and keeping it prepared and enabled unexpectedly?

[ ... ]

> @@ -1769,16 +1822,19 @@ static int __maybe_unused swrm_runtime_resume(str=
uct device *dev)
>  		reset_control_reset(ctrl->audio_cgcr);

[Severity: High]
This is also a pre-existing issue, but I have a question about the teardown
sequence in qcom_swrm_remove() which sits just above this function:

static void qcom_swrm_remove(struct platform_device *pdev)
{
	struct qcom_swrm_ctrl *ctrl =3D dev_get_drvdata(&pdev->dev);

	sdw_bus_master_delete(&ctrl->bus);
	clk_disable_unprepare(ctrl->hclk);
}

During driver unbind or module unload, this function tears down the bus and
slave devices. However, the driver uses a devm-managed IRQ handler which
remains active until devres release (after remove returns).

If a hardware interrupt fires during this window, could qcom_swrm_irq_handl=
er()
execute and operate on the already destroyed bus and slave structures, lead=
ing
to a use-after-free or null pointer dereference?

[Severity: Medium]
This is another pre-existing issue in qcom_swrm_remove():

The qcom_swrm_probe() function sets up PM runtime:

	pm_runtime_set_autosuspend_delay(dev, 3000);
	pm_runtime_use_autosuspend(dev);
	pm_runtime_mark_last_busy(dev);
	pm_runtime_set_active(dev);
	pm_runtime_enable(dev);

Should qcom_swrm_remove() call pm_runtime_disable() and related cleanup
functions like pm_runtime_dont_use_autosuspend() to balance this PM setup a=
nd
avoid leaving the device in an unbalanced state upon driver reload?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-shikra_sou=
ndwire_support-v2-0-f98c9a6ea1e1@oss.qualcomm.com?part=3D2
