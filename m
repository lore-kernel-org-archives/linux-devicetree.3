Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F8E367B7A
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 05:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781672767; cv=none; b=HMNwIao8XwKn9khy5dZLBwoND7UMvyBPwerlieOwSaYFQHuPUD30f83J/4fh9wtB4r3vR6WFSoyrOWaUI7Hs17ir0mCCwJhow80u6s42aesJLZax+/Ctt5eQEqQdKuz+vsEMd80hWBC1whbHG0fGgOBvOIdcb/pkPFNgniLoraw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781672767; c=relaxed/simple;
	bh=eS8RVfgarWB84X0khJgcVBEkt/3Zifixzrecdv2rPIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lJZL/jF/LI+joQu1cVHc2R6ClMtZgtbmk+jJki8oith1H5lc/sL+WPhCkvRZSIzZpFqqtHrvYBQibhEJgyXvfOzqCRVK3NXfCqGGolNVfxMFB++BMm6/kKwXm/o/Hz7BbhkbKDMSWmtB6WEI/GsuwZ4VcbFv/RGok7D3Up2kD3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlfjR+kE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlfjR+kE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970C21F000E9;
	Wed, 17 Jun 2026 05:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781672761;
	bh=ErpGYDkK1l62fEo8rZOdyBmFgZ+p+8seWBbarnk2L3Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SlfjR+kESMo+yZ+GP/Zu3rwb0pjAXcMNO1tckLBdiQpsJziRpi63QGpPzgNJ44LYz
	 gRDiwBQuiAkH3KXjJuR1oDSxAkZrXwhpK50XfTxH7FFd1TtC/jPsKbqbzyyta/cVGx
	 3UgZdJCmQ9dd8D/6tvRXoePaM6+4cJdVNqaODBK3/zVdtXt5B4B05UuZv16znW53tZ
	 nl6dng1X4XmrDfKcUOu3gmONDP9mlBVZmXs/77xGkhpA78zC9+uDTTAfoXtVYk+xY5
	 iU4f6TQcJgbyl6tVt+gLpInLI+8XCqbSnDP4tLS+r65iUjuD8u2Q7dNpfhEQsCLheI
	 wCJCVX0yi8I1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/6] i2c: qcom-geni: Use resources helper APIs in
 runtime PM functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Praveen Talari" <praveen.talari@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260617-enable-i2c-on-sa8255p-v7-4-ad736dbeab57@oss.qualcomm.com>
References: <20260617-enable-i2c-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com>
 <20260617-enable-i2c-on-sa8255p-v7-4-ad736dbeab57@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 05:06:01 +0000
Message-Id: <20260617050601.970C21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [Low] The patch calls undefined helper functions `geni_se_resources_activ=
ate`, `geni_se_resources_deactivate`, and `geni_se_resources_init`, leading=
 to implicit function declarations and link failures.

Pre-existing issues:
- [Critical] Stale `gi2c->dma_buf` pointer causes use-after-free and double=
-free on DMA mapping failure.
- [High] Pending asynchronous runtime suspend is cancelled by `pm_runtime_d=
isable()`, permanently leaking hardware resources (clocks, interconnects).
- [High] Memory leak of multi-descriptor DMA arrays on transfer error.
- [High] The system suspend callback executes a sleeping function while int=
errupts are disabled, causing a BUG.
--

commit 495d087d0c5bbbc5ad2b355b642cfdc5ae9439b6
Author: Praveen Talari <praveen.talari@oss.qualcomm.com>

i2c: qcom-geni: Use resources helper APIs in runtime PM functions

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index a7672b6c2bc07..8f8b74c4e88a4 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1172,15 +1172,14 @@ static int __maybe_unused geni_i2c_runtime_suspen=
d(struct device *dev)
>  	struct geni_i2c_dev *gi2c =3D dev_get_drvdata(dev);
> =20
>  	disable_irq(gi2c->irq);

[Severity: High]
This isn't a bug introduced by this patch, but does calling disable_irq() h=
ere
cause a BUG when suspending the system?

Looking at the suspend paths, geni_i2c_suspend_noirq() runs in the noirq
phase where local interrupts are globally disabled. It calls
pm_runtime_force_suspend(), which invokes this geni_i2c_runtime_suspend()
function.

Calling disable_irq() explicitly invokes might_sleep(), which triggers a
"BUG: sleeping function called from invalid context" when called with
interrupts disabled.

> -	ret =3D geni_se_resources_off(&gi2c->se);
> +	ret =3D geni_se_resources_deactivate(&gi2c->se);

[Severity: Low]
Are the implementations for geni_se_resources_deactivate() and
geni_se_resources_activate() missing from this patch series?

These functions appear to be completely missing from the kernel tree at this
revision. Does this lead to implicit function declarations and build failur=
es?

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but does the error path in
geni_i2c_probe() and the driver removal path in geni_i2c_remove()
permanently leak hardware resources?

In geni_i2c_init(), an asynchronous pm_runtime_put() is called. If an error
occurs later in geni_i2c_probe(), or during geni_i2c_remove(), the code
immediately calls pm_runtime_disable():

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_probe() {
    ...
    pm_runtime_disable(gi2c->se.dev);
    ...
}

Calling pm_runtime_disable() invokes __pm_runtime_barrier(), which cancels
any pending asynchronous suspend requests instead of waiting for them to
complete. Since the suspend is cancelled and the device remains in the
RPM_ACTIVE state after the driver unbinds, do its clocks and power domains
leak indefinitely?

[Severity: Critical]
This is a pre-existing issue, but can a stale dma_buf pointer cause a
use-after-free and double-free if DMA mapping fails?

If geni_se_rx_dma_prep() fails in geni_i2c_rx_one_msg(), the local dma_buf
is freed and set to NULL, but the device struct's gi2c->dma_buf retains the
stale pointer from a previous successful transfer:

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_rx_one_msg() {
    ...
	if (dma_buf && geni_se_rx_dma_prep(se, dma_buf, len, &rx_dma)) {
		geni_se_select_mode(se, GENI_SE_FIFO);
		i2c_put_dma_safe_msg_buf(dma_buf, msg, false);
		dma_buf =3D NULL;
	} else {
    ...
}

During cleanup, the stale pointer is evaluated as true:

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_rx_msg_cleanup() {
    ...
	if (gi2c->dma_buf) {
		if (gi2c->err)
			geni_i2c_rx_fsm_rst(gi2c);
		geni_se_rx_dma_unprep(&gi2c->se, gi2c->dma_addr, gi2c->xfer_len);
		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
	}
    ...
}

Does this unmap the stale DMA address, copy data from the freed bounce buff=
er,
and then double-free the kalloc'd bounce buffer?

[Severity: High]
This is a pre-existing issue, but is there a memory leak of the
multi-descriptor DMA arrays when a transfer error occurs?

In geni_i2c_gpi_multi_desc_unmap(), the arrays are only freed if
unmap_msg_cnt reaches gi2c->num_msgs - 1:

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_gpi_multi_desc_unmap() {
    ...
		if (tx_multi_xfer->unmap_msg_cnt =3D=3D gi2c->num_msgs - 1) {
			kfree(tx_multi_xfer->dma_buf);
			kfree(tx_multi_xfer->dma_addr);
			break;
		}
    ...
}

If an error occurs during the multi-message transfer, msg_xfer_cnt is less
than num_msgs, so the loop terminates early. Does this bypass the kfree()
calls and leak both tracking arrays, potentially allowing an attacker to
cause an Out-Of-Memory condition?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260617-enable-i2c=
-on-sa8255p-v7-0-ad736dbeab57@oss.qualcomm.com?part=3D4
