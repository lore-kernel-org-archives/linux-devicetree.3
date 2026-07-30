Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FF0372691
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785425847; cv=none; b=dXb7r1d1/TmlDt5CWp/W/6PEU+7kRxRccEYilGNoxRuF8zeCrMD7BlImwl6pQRY7qhO7xooLqvNk2B/c/6q5OXhXslavqKx0smnRNnQ1wjXH0y493s78ww0b8eWpuamGKgK7GZ5dx6u+FULZKm1PkW9FKS7GGpELSqhmAOgaS4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785425847; c=relaxed/simple;
	bh=muQ41BBIvJHoOxz5cFni/iyyAXpAj/IirsfRFXeCOUQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QXzRmngqUkp59yu4P9QAffda/GX0lrkdnKiQhfEM9A2j4ONgyzcfh9cT0/vB5QcZ65PcKxh7hdT11h0liLlqD1NWyf26I/drcQtL7cYtjTuGFvLOgeTT2/c1ECLwUOQBpdyOr6jiht+SlptiQ2c2Z2VeVpcK+DrQfHLsCY9jqDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UOYVCrtG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UOYVCrtG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2E781F000E9;
	Thu, 30 Jul 2026 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785425845;
	bh=FA404+Y56ggcLeHwFqylQnOLtTMi5CGdSyLThudGl90=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UOYVCrtG1ng0Snom/6RFWU/umOAiDrf5Jl130WuayHTFk42hJi0lvNWjNhA3UEPOm
	 UUjYYGNXhuk+sIXOejQL7zg8OwbeVoZsHIJiVcNSfDAbNhZ2SfpUOlAu5cZ0EkjBcc
	 Opl0PCFsDaesIob67KJByq5iR82aXAzATAsekl2kdkle7luLEiZXvRVGWbhoGHcxBz
	 M7jWqVup15/8yBjeRHXlGLCo0nlNC73lKioc6rL2vCx01YtHHUdvSpVVqnHg2MY50x
	 TnoT7QxZEOZrSDyAnTAZAxbn/DEG9KtmhxMnRlcI2qB3QPmDoOGEMIfDkUv0U4Luix
	 NGqEF55CH+jaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 01/18] media: iris: Add Gen2 firmware autodetect and
 fallback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260730-iris-ar50lt-v8-1-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
 <20260730-iris-ar50lt-v8-1-6597c08cea6f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 15:37:25 +0000
Message-Id: <20260730153725.A2E781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Uninitialized memory scan in firmware generation detection.

Pre-existing issues:
- [High] Kernel crash: IRQ is enabled before the HFI ops are initialized, l=
eading to a NULL pointer dereference on early interrupts.
- [High] Use-After-Free of `iris_core` due to uncancelled delayed work duri=
ng module teardown.
- [High] Race condition in `iris_open` allows concurrent callers to bypass =
the hardware initialization wait.
--

--- Patch [1]: [PATCH v8 01/18] media: iris: Add Gen2 firmware autodetect a=
nd fallback ---
commit a2c8d521a685de60d5919ebd8f396f7a268a25cc
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add Gen2 firmware autodetect and fallback

Some Iris platforms support both Gen1 and Gen2 HFI firmware images.
Update the firmware loading logic to handle this generically by
preferring Gen2 when available, while safely falling back to Gen1
when required.

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media=
/platform/qcom/iris/iris_core.c
> index 52bf56e517f91..6dbe18be5b495 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
> @@ -79,6 +80,7 @@ int iris_core_init(struct iris_core *core)
>  		goto error_unload_fw;
> =20
>  	core->iris_firmware_data->init_hfi_ops(core);

[Severity: High]
This isn't a bug introduced by this patch, but could this initialization
sequence cause a NULL pointer dereference on early interrupts?

In iris_core_init(), iris_vpu_power_on() is called earlier, which unmasks t=
he
interrupt via enable_irq(core->irq). At that point, core->hfi_sys_ops is st=
ill
NULL because init_hfi_ops() hasn't run yet.

If an interrupt fires early (for example, from the VPU firmware booting),
iris_hfi_isr_handler() will execute and unconditionally dereference
core->hfi_sys_ops->sys_hfi_response_handler. Should init_hfi_ops() be called
before enabling the IRQ?

[Severity: High]
This is a pre-existing issue, but does this function have a race condition =
that
allows concurrent callers to bypass the hardware initialization wait?

When a user opens the device, iris_core_init() acquires the lock, sets
core->state =3D IRIS_CORE_INIT, drops the lock, and then proceeds with the
lengthy initialization and iris_wait_for_system_response().

If a concurrent thread calls iris_open() and acquires the lock, it will see
core->state =3D=3D IRIS_CORE_INIT, immediately return 0, and proceed to int=
eract
with the hardware before the firmware has actually finished booting. Could =
this
lead to undefined behavior?

> +	iris_session_init_caps(core);
> =20
>  	ret =3D iris_hfi_core_init(core);
>  	if (ret)

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/m=
edia/platform/qcom/iris/iris_firmware.c
> index 1a476146d7580..c5d2b9fd0502e 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c

[ ... ]

> @@ -56,6 +209,9 @@ static int iris_load_fw_to_memory(struct iris_core *co=
re, const char *fw_name)
>  	ret =3D qcom_mdt_load(dev, firmware, fw_name,
>  			    IRIS_PAS_ID, mem_virt, mem_phys, res_size, NULL);
> =20
> +	if (!ret)
> +		iris_detect_firmware(core, fw_name, mem_virt, res_size, desc);

[Severity: High]
Could this scan uninitialized memory?

The memory region is mapped via memremap() using MEMREMAP_WC without being
zeroed, meaning it could retain contents from a previous boot or firmware l=
oad.
qcom_mdt_load() populates the memory but might leave gaps or leave the tail
end untouched.

Since iris_detect_firmware() is called with the total reserved memory size
(res_size) rather than the actual loaded firmware size, could the loop in
iris_detect_gen2_from_fwdata() scan past the valid loaded data and falsely
detect a leftover QC_IMAGE_VERSION_STRING from an older firmware?

> +
>  	memunmap(mem_virt);
>  err_release_fw:
>  	release_firmware(firmware);

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index c2dcb50a27824..7fe31136df21b 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -251,8 +251,6 @@ static int iris_probe(struct platform_device *pdev)
>  		return core->irq;

[Severity: High]
This is a pre-existing issue, but does the module teardown path leak a runn=
ing
delayed work, leading to a use-after-free?

iris_probe() initializes a delayed work sys_error_handler which uses the co=
re
pointer. In the teardown path, iris_remove() unregisters devices but does n=
ot
seem to call cancel_delayed_work_sync(&core->sys_error_handler).

Since the core struct is managed by devm_kzalloc, it is freed when
iris_remove() returns. If the delayed work was scheduled and runs after
removal, won't it dereference the freed core pointer?

>  	core->iris_platform_data =3D of_device_get_match_data(core->dev);
> -	core->iris_firmware_desc =3D core->iris_platform_data->firmware_desc;
> -	core->iris_firmware_data =3D core->iris_firmware_desc->firmware_data;
> =20
>  	core->ubwc_cfg =3D qcom_ubwc_config_get_data();

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-iris-ar50l=
t-v8-0-6597c08cea6f@oss.qualcomm.com?part=3D1
