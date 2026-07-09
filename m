Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A9A244661
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605260; cv=none; b=Txexsa8QWV/pk69QcC2FOiaT2J/Mm8SrrLY+4xLrYPTyzSGxJY+9hEmkwsMEY0lI1gbGNffP909rrnJ/x0eXvaR4kPdfmGAPSqousiY9WEpbug0haB0B/fp3UHsq7J1zUQETrzlqrarzIP16zcH46ThC6xP3sW2Djz2/r9qLTqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605260; c=relaxed/simple;
	bh=JE06n19fj89DtD98QIGe4Eu+0ooIquemuxqBRlpEtk8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M3xU+URa36cmZr0SOzRfQoGiNsXoLYDLCo8uwxISuoGjcBgCsxMc73A121cSZO/iSzeGjXVrY77jynJVZaW5R2BZn6vNGTeV8cql24YvjN4KI5WEto5sFjOhK5jrTIBAaiA2AtLopyo+Hl7BCevxRPhDy+haq1B/5oXuh+JpB0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D60pDBEP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D60pDBEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9421B1F000E9;
	Thu,  9 Jul 2026 13:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783605258;
	bh=dVUJlaH/y+Uaehg0hwfcjbEaynQqpPtsp5WYpmW1C0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D60pDBEPuGueDK4zGHJxEkPFG7iBEXCSnKIFnm1Unf4Hrv1Ap9ex8YAO3xtmk3Q5A
	 2Tf/Ge3izXvSwGYrZqsG3MCECtw+Y2PYpOve7wTekgBlq6XGKr4NJOH467QoiEfQuk
	 DegUrzbfPaphlP8VTuW1pI1nqtWrCEaEGy9e+tYufd5hzI3d1wG9KAI8SsBjZ8Qjhc
	 ep3VwYmp3tFkp4c/KmJuUiKtN605fU2C04Ws0SfDSoZ7IlRuEmXxnHlbZPsBc6Qz6i
	 M80sbIL4aTzoRr+UIvYTonTF0zeNlzOGv0tto+cxV+hNC4bZo+o97Zw8Rey1I2yZxB
	 EBjLpEKWjkRBQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 06/11] media: iris: Add hooks for pixel and
 non-pixel context banks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
References: <20260709-vpu_iommu_iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com>
 <20260709-vpu_iommu_iova_handling-v1-6-72bb62cb2dfd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 13:54:18 +0000
Message-Id: <20260709135418.9421B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Unregistering context bank devices in `remove` while V4L2 FDs are =
open causes DMA API mismatch and IOMMU faults.
- [Medium] Hardcoded platform device ID causes name collision if multiple I=
ris instances exist.

Pre-existing issues:
- [High] Missing cancellation of sys_error_handler delayed work leads to Us=
e-After-Free.
- [High] Use-After-Free on `iris_core` during deferred V4L2 close due to `d=
evm_kzalloc`.
--

--- Patch [6]: [RFC PATCH 06/11] media: iris: Add hooks for pixel and non-p=
ixel context banks ---
commit ac38538cd2eb8a1aa776f7262b1bd953d7ac3a78
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add hooks for pixel and non-pixel context banks
   =20
Iris platforms use separate context-bank devices for the pixel and
non-pixel domains. Add platform hooks to create and destroy those
subdevices, and wire them up for the affected platforms.

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_sm8550.c b/dr=
ivers/media/platform/qcom/iris/iris_platform_sm8550.c
> new file mode 100644
> index 0000000000000..bea904a9249ba
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_sm8550.c
> @@ -0,0 +1,71 @@

[ ... ]

> +static int sm8550_init_cb_devs(struct iris_core *core)
> +{
> +	struct device *dev;
> +
> +	dev =3D iris_create_cb_dev(core, "non-pixel");

[Severity: Medium]
When creating the child context banks here, could this cause a name
collision if there are multiple Iris instances?

Looking at iris_create_cb_dev() in iris_resources.c, it zero-initializes
struct platform_device_info, which forces the device id to 0:

drivers/media/platform/qcom/iris/iris_resources.c:iris_create_cb_dev() {
	struct platform_device_info plat_dev_info =3D {};
	...
}

This causes platform_device_register_full() to assign exact names like
"pixel.0" and "non-pixel.0". If a second Iris instance probes, wouldn't
kobject_add() return -EEXIST? Should PLATFORM_DEVID_AUTO be used instead?

> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	core->np_dev =3D dev;
> +
> +	dev =3D iris_create_cb_dev(core, "pixel");

[ ... ]

> +static void sm8550_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->p_dev)
> +		platform_device_unregister(to_platform_device(core->p_dev));
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +
> +	core->p_dev =3D NULL;
> +	core->np_dev =3D NULL;
> +}

[Severity: High]
Does unregistering the context bank devices here cause a DMA API mismatch if
a user-space application still holds a V4L2 file descriptor open?

V4L2 file handles can outlive the driver's remove callback. If a user closes
the device after remove completes, iris_close() calls
iris_destroy_all_internal_buffers() which calls iris_get_cb_dev().

Since p_dev and np_dev are NULL, iris_get_cb_dev() falls back to core->dev:

drivers/media/platform/qcom/iris/iris_resources.c:iris_get_cb_dev() {
	...
	return dev ? dev : core->dev;
}

This means dma_free_attrs() is executed using core->dev, but the memory
was originally allocated with the context bank devices. Could this mismatch
violate the DMA API and cause IOMMU unmap faults?

[Severity: High]
This is a pre-existing issue, but does tying the iris_core struct to the
device lifecycle result in a Use-After-Free during a deferred V4L2 close?

In iris_probe(), core is allocated with devm_kzalloc():

drivers/media/platform/qcom/iris/iris_probe.c:iris_probe() {
	...
	core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
	...
}

When the driver is unbound, iris_remove() returns and devres frees core.
If an application holds a file descriptor open, iris_close() is eventually
called, which dereferences inst->core to clean up sessions:

drivers/media/platform/qcom/iris/iris_vidc.c:iris_close() {
	...
	iris_remove_session(inst);
	...
}

Since core is already freed, won't this cause memory corruption?

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for the
sys_error_handler delayed work to trigger a Use-After-Free if it runs
during or after driver unbind?

The sys_error_handler is dynamically scheduled on hardware errors, but
iris_remove() does not appear to cancel it:

drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
	struct iris_core *core;

	core =3D platform_get_drvdata(pdev);
	if (!core)
		return;

	iris_core_deinit(core);
}

If the unbind occurs while the work is pending or running, core will be
freed by devres after iris_remove() returns. When the workqueue executes
iris_sys_error_handler(), won't it dereference the freed core?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-vpu_iommu_=
iova_handling-v1-0-72bb62cb2dfd@oss.qualcomm.com?part=3D6
