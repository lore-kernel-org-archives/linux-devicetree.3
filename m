Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601EE446078
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523287; cv=none; b=Mm82i2ZfteaTN5m04bFFxqEvAFTOMTaZJlNm1SUL88GeOobrhNKh/ssHlUWfIgMhh8yNkrcvi4trNQkZe7l6JnA/B6bn+iJeppiDPmNfyf5sxYfXCl+O4IPHBCoSNtWHfhj25nvopS+qOZUeodTb+qiL2mXgk4WCsfG2avP3b/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523287; c=relaxed/simple;
	bh=blAii82+Lu+iwapwDLUW7lRyif5eXPz2+gobwdw6g9U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MNL4DiI6qryn3jCt80Grj1Y6O2T5KJtv+rpuIFvv+wvuRYSGAdt2tM5hyABq3/6zfAGQUEORLNI+kJ1eR5MgtKbSlHLyn51wiI4bu0/4dIsVf1WS4zMDrqQ83cD2um17c4RbtieZXNB0ewf5eqIf9+VGvCJe07mKmFzj6HDnWhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsyRJmY+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsyRJmY+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94ED61F00AC4;
	Fri, 31 Jul 2026 18:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785523285;
	bh=OV5EHwb5NM3HAQ4JWEPX0z3FIi225APGExPNADCiQF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WsyRJmY+AeenjbdZLDE7mHlYaOYf1rgmKgDmgohgpYZnU1qNUQLANFMFDJcNxjA4+
	 TqbUDBM69if/TYsFjPWozbhltFCMS+jEDKhrFIQukmQglQJ48FwOHAZOsy4R1Uhm05
	 4fHOHWxZuNzk+5gCNCNzmfrOR/Mma4TBtO36RW2NDxXS96+lHsVMuXhGswe0SFUPrV
	 n7CowUMbwH2WjduWIGTB5/JPsT5QtU9kFnTzQsdEjMWb55uFSBP6/i6msQKiN+2hWL
	 U9VP808EZ2C47fIbNwdUSelytFwySC9MYDD6NzXfqq/R/gYyOqyk2RgOXenUQSfQiK
	 bLSljmvegxPkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/12] media: iris: Create pixel and non-pixel
 context banks on VPU3x
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-7-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-7-da52b5228dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:41:25 +0000
Message-Id: <20260731184125.94ED61F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Unregistered and freed platform devices (p_dev, np_dev) can be use=
d by concurrent ioctls during driver removal, leading to Use-After-Free.
- [High] Context bank platform devices are missing DMA configuration, causi=
ng fatal SMMU faults.

Pre-existing issues:
- [High] Missing cancellation of delayed work sys_error_handler causes Use-=
After-Free on module removal.
--

--- Patch [7]: [PATCH v2 07/12] media: iris: Create pixel and non-pixel con=
text banks on VPU3x ---
commit 6bf8596f13d0c7afe5ee94339e572204b2a9c6df
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Create pixel and non-pixel context banks on VPU3x

This commit implements context bank hooks for VPU3x to create "non-pixel"
and "pixel" devices from matching device tree subnodes. It wires these hooks
into the ops for relevant platforms and handles device registration and
unregistration.

> diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/medi=
a/platform/qcom/iris/iris_vpu3x.c
> index 3dad47be78b58..623a0f8a7982c 100644
> --- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
> +++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c

[ ... ]

> @@ -254,6 +254,40 @@ static void iris_vpu35_power_off_hw(struct iris_core=
 *core)

[ ... ]

> +static int iris_vpu3x_init_cb_devs(struct iris_core *core)
> +{
> +	struct device *dev;
> +
> +	dev =3D iris_create_cb_dev(core, "non-pixel");

[Severity: High]
Does this new device need explicit DMA configuration?

Since iris_create_cb_dev() creates dummy platform devices for the IOMMU
context banks without a driver, the kernel driver core never calls
really_probe() and never invokes platform_dma_configure(). Without an
explicit call to of_dma_configure() in the driver, the device lacks an IOMMU
domain.

When iris_get_cb_dev() returns these devices for buffer allocation, will the
DMA API return raw physical addresses instead of IOVA, triggering an IOMMU
context fault when the VPU's enabled SMMU streams access this memory?

> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	core->np_dev =3D dev;
> +
> +	dev =3D iris_create_cb_dev(core, "pixel");
> +	if (IS_ERR(dev))
> +		goto unreg_np_dev;
> +
> +	core->p_dev =3D dev;
> +
> +	return 0;
> +
> +unreg_np_dev:
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));
> +	core->np_dev =3D NULL;
> +
> +	return PTR_ERR(dev);
> +}
> +
> +static void iris_vpu3x_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->p_dev)
> +		platform_device_unregister(to_platform_device(core->p_dev));
> +	if (core->np_dev)
> +		platform_device_unregister(to_platform_device(core->np_dev));

[Severity: High]
Can concurrent ioctls access these devices after they are unregistered?

If iris_remove() is called while userspace holds a file descriptor open and
executes an ioctl (like VIDIOC_QBUF), this function unregisters and frees
p_dev and np_dev. The pointers in core are not cleared, and there doesn't
appear to be synchronization with active file handles.

Could a concurrent ioctl call iris_get_cb_dev(), retrieve the freed p_dev or
np_dev pointer, and pass it to the DMA API, resulting in a use-after-free of
the device structure?

> +}

[Severity: High]
This isn't a bug introduced by this patch, but does the module removal path
leave delayed work running?

Looking at the removal path, iris_remove() destroys the lock and exits with=
out
cancelling the sys_error_handler delayed work:

drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
    ...
    mutex_destroy(&core->lock);
}

If a hardware error schedules core->sys_error_handler with a delay, and
iris_remove() executes immediately after, the devres manager frees the core
structure. When the delayed work executes, it will call
iris_sys_error_handler(), attempting to access the freed core memory.

Should cancel_delayed_work_sync() be called during removal to prevent a
use-after-free of the core structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-vpu_iommu_=
iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com?part=3D7
