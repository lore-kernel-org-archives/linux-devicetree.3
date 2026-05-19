Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ABB377558
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 19:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779219792; cv=none; b=UTTGPW9rg64DKi5/x4bI1eB3XHDq8p+XMSJb9uGiqDTZc0eGydta7SWu/Fsytz5Z01DGXrWT3HDlZMdrsrW5OfnwFq/cGaBUZz82w6RA+Sj8VzHhw8uIujf7JHewmOTUopIuGzs6spEDMXlj7150bP+cGDZ3MWM/j7dpxKyTakw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779219792; c=relaxed/simple;
	bh=INkvEX9r1DC2AgrRTEEPfRc9vzCSCGhw5PAbuUfRhTs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CcH+WDJ2SI5wYOYh3wPtEZd/c+Aoye0fA8a8aLAYFlerpYHy8demi3CZMLaY7/EcNKl74DusVJsOjkTFA+Et7WgwDKiVmwrpxlFVedMlz+wGtnwnnOogQrZa+quRhQrUg4IVxI6YLk0daMh226lUGr54Dr/4qx/hNBdEHbhbWx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TO9/6xRc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TO9/6xRc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9BB01F000E9;
	Tue, 19 May 2026 19:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779219790;
	bh=2fzQT3dU860YMkyyMaO0az78P7sJEEQ/H8SK0Ad8dQk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TO9/6xRcrGQsMUO9TpNXdOurS1AlePq9zwF4fzRAemg2JZx76eHJYeSnPINECItVF
	 QIiNovgBxrO1/YZwEoWqd2ZDITa1NYImpD0Xku5QvtN8CN0iG5Fo06HF3ZbQKomwRt
	 nfeBGUT1nQrfccRUtWiXVBAfyfB5NGTLJr+5I+Tx5++G1UQiFxB447y1HRTpHESs8Q
	 Eroi6+e5AsO7Pqz7HLOeSMpmc818KaJo3PCtwV8LkUmpP0f3hw+r1Veh19XKfQhfH3
	 9wInSW+rI/DvpUZ82FTeiWgr/xdqUtPqRY+dbCVEppmobrHKtld6Ft4D8OxBs+V82o
	 qqqPTAdH1Pxyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: Add CDSP power management driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vignesh Viswanathan" <vignesh.viswanathan@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260520-cdsp-power-v1-2-85eb9501a1cd@oss.qualcomm.com>
References: <20260520-cdsp-power-v1-2-85eb9501a1cd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 19:43:10 +0000
Message-Id: <20260519194310.B9BB01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Incorrect lifecycle management of the workqueue and devres-managed=
 IRQs leads to resource leaks and Use-After-Free vulnerabilities.
- [High] Multiplexing a single regulator consumer handle across both the vi=
rtual regulator API and internal LPM callbacks corrupts reference counting.
- [High] Deferring the hardware interrupt clear to an asynchronous workqueu=
e in a threaded IRQ handler causes an interrupt storm.
- [High] Incorrect placement of write memory barriers (`wmb()`) allows the =
remote processor to read uninitialized or stale SMEM data.
- [High] Dropping a DCVS request without clearing the SMEM channel state pe=
rmanently deadlocks the IPC channel.
- [High] Unconditionally clearing the persistent SMEM region during probe b=
reaks the protocol if the driver is unbound and rebound.
--

commit 1ef19287a540425b15ca4042d29c79412afa4538
Author: Praveenkumar I <praveenkumar.i@oss.qualcomm.com>

soc: qcom: Add CDSP power management driver

This patch introduces a platform driver to manage power for the CDSP subsys=
tem
on IPQ9650 platforms. It coordinates low power mode (LPM) sequences via an
MPM handshake and handles dynamic voltage scaling requests through a shared
SMEM channel. Virtual regulators are exposed to allow the remoteproc driver
to control the rails.

> diff --git a/drivers/soc/qcom/cdsp_power.c b/drivers/soc/qcom/cdsp_power.c
> new file mode 100644
> index 0000000000000..97aff858b1395
> --- /dev/null
> +++ b/drivers/soc/qcom/cdsp_power.c
> @@ -0,0 +1,1065 @@
[ ... ]
> +static int cdsp_virt_reg_disable(struct regulator_dev *rdev)
> +{
> +	struct cdsp_power_driver *drv =3D rdev_get_drvdata(rdev);
> +	int id =3D rdev_get_id(rdev);
> +	struct regulator *reg =3D (id =3D=3D CDSP_VIRT_NSP_CX) ? drv->vdd_cx : =
drv->vdd_mx;
> +
> +	if (!reg)
> +		return 0;
> +
> +	/* Disable the regulator if it's enabled */
> +	if (cdsp_virt_reg_is_enabled(rdev))
> +		return regulator_disable(reg);

[Severity: High]
Can this cause a reference count underflow?

cdsp_virt_reg_is_enabled() calls regulator_is_enabled(), which queries the
physical hardware state. Since vdd-cx is a shared SoC rail, it might return=
 1
even if the internal consumer count of drv->vdd_cx was already dropped to 0
by the internal LPM sleep logic.

If PAS disables the virtual regulator in this state, regulator_disable()
could be called while the consumer count is already 0.

[ ... ]
> +static void cdsp_dcvs_work_fn(struct work_struct *work)
> +{
[ ... ]
> +	mutex_lock(&drv->lock);
> +
> +	/* Drop DCVS requests while the NSP Q6 is powered off */
> +	if (atomic_read(&drv->power_state) =3D=3D CDSP_POWER_OFF) {
> +		dev_warn(drv->dev, "DCVS request while powered off, dropping\n");
> +		mutex_unlock(&drv->lock);
> +		return;
> +	}

[Severity: High]
If this race occurs and the request is dropped, will the remote DSP spin
endlessly waiting for the request to complete?

It appears the SMEM channel state flag smem->hdr.request_in_flight isn't
cleared when returning early here, which could permanently deadlock the IPC
channel.

[ ... ]
> +send_response:
> +	/* Write response to SMEM response area */
> +	smem->response.msg_size     =3D CDSP_RESP_MSG_SIZE;
[ ... ]
> +	smem->response.timestamp_us =3D ktime_to_us(ktime_get());
> +
> +	/*
> +	 * Update header statistics and clear in-flight flag.
> +	 * Order: write response data -> clear request_in_flight -> wmb ->
> +	 * send interrupt. NSP Q6 checks request_in_flight =3D=3D 0 to know
> +	 * the response is ready.
> +	 */
> +	smem->hdr.apss_rx_count++;
> +	smem->hdr.apss_tx_count++;
> +	/* Mark channel idle before sending the interrupt */
> +	WRITE_ONCE(smem->hdr.request_in_flight, 0);
> +	/* Ensure response data is visible before sending interrupt to NSP Q6 */
> +	wmb();

[Severity: High]
Can the compiler or CPU reorder the flag update before the response payload
reaches main memory?

The DSP polling request_in_flight might observe it as 0 before the payload
stores are visible. Is it possible to place a smp_store_release() or a wmb()
before updating the flag?

[ ... ]
> +static irqreturn_t cdsp_lpm_irq_handler(int irq, void *data)
> +{
> +	struct cdsp_power_driver *drv =3D data;
> +	unsigned int client_rsc_hdsk_irq_val;
> +	unsigned int rsc_hdsk_irq_val;
> +
> +	regmap_read(drv->mpm_regmap, RSC_HDSHK_IRQ_STAT, &rsc_hdsk_irq_val);
> +	regmap_read(drv->mpm_regmap, CLIENT_RSC_IRQ_STAT(0), &client_rsc_hdsk_i=
rq_val);
> +	if (!client_rsc_hdsk_irq_val || !rsc_hdsk_irq_val)
> +		return IRQ_NONE;
> +
> +	/* Schedule work to process LPM request */
> +	queue_work(drv->lpm_wq, &drv->lpm_work);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
Will returning IRQ_HANDLED from a threaded handler cause an interrupt storm?

Since the hardware interrupt (CLIENT_RSC_IRQ_CLR) isn't cleared until the
asynchronous cdsp_lpm_work_fn executes, unmasking the level-triggered line
could immediately re-fire the interrupt and prevent the workqueue from
running.

[ ... ]
> +static int cdsp_power_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	/* Create SMEM entry for DCVS */
> +	ret =3D qcom_smem_alloc(CDSP_SMEM_NSP_HOST_ID, smem_id, CDSP_SMEM_SIZE);
> +	if (ret && ret !=3D -EEXIST)
> +		return dev_err_probe(&pdev->dev, ret, "Failed to allocate SMEM\n");
> +
> +	/* Get SMEM pointer and validate size */
> +	drv->smem =3D qcom_smem_get(CDSP_SMEM_NSP_HOST_ID, smem_id, &smem_size);
> +	if (IS_ERR(drv->smem))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(drv->smem),
> +				     "Failed to get SMEM\n");
> +
[ ... ]
> +	/*
> +	 * Initialise the SMEM channel header.
> +	 * Zero the entire region first so all padding and reserved fields
> +	 * are clean, then fill in the fixed protocol fields.
> +	 * apss_state is set to 1 last (after wmb) so NSP Q6 only sees a
> +	 * fully-populated header once APSS is ready.
> +	 */
> +	memset(drv->smem, 0, sizeof(*drv->smem));

[Severity: High]
If the driver is unbound and rebound while the DSP is running, will this
unconditional memset wipe out the DSP's entire IPC state?

qcom_smem_alloc() returns -EEXIST when the region is already initialized, so
zeroing it could break the SMEM channel without restarting the DSP.

> +	drv->smem->hdr.magic           =3D CDSP_SMEM_MAGIC;
> +	drv->smem->hdr.version         =3D CDSP_SMEM_VERSION;
> +	drv->smem->hdr.request_offset  =3D CDSP_SMEM_REQUEST_OFFSET;
> +	drv->smem->hdr.request_size    =3D CDSP_SMEM_REQUEST_SIZE;
> +	drv->smem->hdr.response_offset =3D CDSP_SMEM_RESPONSE_OFFSET;
> +	drv->smem->hdr.response_size   =3D CDSP_SMEM_RESPONSE_SIZE;
> +	/* Signal APSS readiness to NSP Q6 */
> +	WRITE_ONCE(drv->smem->hdr.apss_state, 1);
> +	/* Ensure SMEM header is fully written before NSP Q6 reads it */
> +	wmb();

[Severity: High]
Does the wmb() need to be placed before updating apss_state to prevent the
CPU or compiler from reordering it?

[ ... ]
> +	drv->lpm_wq =3D alloc_ordered_workqueue("cdsp_lpm_wq", 0);
> +	if (!drv->lpm_wq) {
> +		mbox_free_channel(drv->dcvs_mbox_chan);
> +		return dev_err_probe(&pdev->dev,
> +				     -ENOMEM,
> +				     "failed to allocate cdsp lpm workqueue\n");
> +	}
> +
> +	rdev =3D devm_regulator_register(&pdev->dev,
> +				       &cdsp_virt_reg_descs[CDSP_VIRT_NSP_CX],
> +				       &virt_cfg);
> +	if (IS_ERR(rdev))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(rdev),
> +				     "Failed to register cdsp-vdd-cx virtual regulator\n");

[Severity: High]
If devm_regulator_register or subsequent probe steps fail, will this leak
drv->lpm_wq since destroy_workqueue() is not called on the error path?

[ ... ]
> +static void cdsp_power_remove(struct platform_device *pdev)
> +{
> +	struct cdsp_power_driver *drv =3D platform_get_drvdata(pdev);
> +
> +	/* Cancel any pending work */
> +	cancel_work_sync(&drv->dcvs_work);
> +	cancel_work_sync(&drv->lpm_work);
> +
> +	if (drv->lpm_wq)
> +		destroy_workqueue(drv->lpm_wq);
> +
> +	mbox_free_channel(drv->dcvs_mbox_chan);
> +}

[Severity: High]
Could this cause a use-after-free if an interrupt fires after remove()
completes?

The interrupts are managed by devm_request_threaded_irq and remain active
until devres cleanup runs. If an interrupt triggers in this window,
cdsp_lpm_irq_handler will queue work to the destroyed drv->lpm_wq, and
cdsp_dcvs_irq_handler will queue work to system_wq referencing the soon to =
be
freed drv structure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520-cdsp-power=
-v1-0-85eb9501a1cd@oss.qualcomm.com?part=3D2
