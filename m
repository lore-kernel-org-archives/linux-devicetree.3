Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDED4282F2C
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 22:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783464371; cv=none; b=dPqc1nc3MRCsPZorlkdVDnxdQPTHl1efobspdr/G/Ap3gIolqeIqruaKzvJ42bTrNn+VKTDmJU3mK7rkIjXgnVluGTFn/ZhnCwrGEf4Nka3f+1DQ1lNfHCBg/u63UXe4mf46IeaPDejOU5BOmoY6jIiFGqprDHZXVv8ToXQHywI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783464371; c=relaxed/simple;
	bh=gnUsD+GvnpBQsLpGNIBUioBcH9K7C8965Vvj3tKtibA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dQGU2wnJHvdv4mTGDpeA1lA5Pd6/OK9qpJXmTYBNLGVtqHfMXXX1NPyQ+APdEkDkJLtFu464NcY8r+O9rdVQ0OSX+mdFhA3S0+Tq7zng5IE0dirXeTulKHsaHwlw6b837UTD/f8XRtqvJfTKKB9uPYzUIvmAgwvVdHY/PIAMWnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VIfgA0/2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VIfgA0/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C6221F000E9;
	Tue,  7 Jul 2026 22:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783464369;
	bh=xtN4zr0ZnP7FP7NZB+sXIZxo0IA/OUQrrmql6tRo5HI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VIfgA0/2tLGg/RyeSV2LmkC3AQ+xk/qGy144zG5aNX0DcRZwEYOKNGdnpNt74WFxE
	 ZbSnra6mr5F3/9+Yz5rdeXEvHn+cOCJe1RFU+vhOZOg6h+/JQqKMPhK5/3dsm5Dx0x
	 v3z44WSmApL7CJS1fkPzT/BG+YCGSj32EDXhc2lX7sVcsLmnaPELkPzFL7AnZSgO4F
	 zo0BWkT5CIfNhZVSDCXbZUw00nZt2iDRY1XgUJtb11NorXGXyouzk9lk0U/HE7FAic
	 9Z4xrNbBVhgzvgj0Gd24sel32wrUUss7ukAJjAo4cKjQGLAQVI8+NNPmpUBlnaFnRy
	 suoGsVKXNyeeg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 01/18] media: iris: Add Gen2 firmware autodetect and
 fallback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260708-iris-ar50lt-v6-1-374f0a46c23b@oss.qualcomm.com>
References: <20260708-iris-ar50lt-v6-0-374f0a46c23b@oss.qualcomm.com>
 <20260708-iris-ar50lt-v6-1-374f0a46c23b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 22:46:09 +0000
Message-Id: <20260707224609.8C6221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unprotected concurrent modification of shared core capability stru=
ctures in `iris_open()`.
- [High] Lockless reads of `core->iris_firmware_desc` and `core->iris_firmw=
are_data` during ioctls can race with their reassignment.
- [Low] Missing `firmware_request_nowarn()` causes misleading dmesg errors =
during normal fallback.
--

--- Patch [1]: [PATCH v6 01/18] media: iris: Add Gen2 firmware autodetect a=
nd fallback ---
commit 877740428251d1096cd14181b1ab991b0027ac73
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: Add Gen2 firmware autodetect and fallback

This commit updates the firmware loading logic to prefer Gen2 firmware,
detect the firmware generation from the firmware image itself, and safely
fallback to Gen1 if necessary.

> diff --git a/drivers/media/platform/qcom/iris/iris_firmware.c b/drivers/m=
edia/platform/qcom/iris/iris_firmware.c
> index 1a476146d7580..965384fdd339c 100644
> --- a/drivers/media/platform/qcom/iris/iris_firmware.c
> +++ b/drivers/media/platform/qcom/iris/iris_firmware.c
[ ... ]
> +static const struct firmware *iris_detect_firmware(struct iris_core *cor=
e,
> +						   const char **fw_name)
> +{
> +	const struct firmware *firmware;
> +	bool has_both_gens;
> +	int ret;
> +
> +	*fw_name =3D NULL;
> +	if (core->iris_platform_data->firmware_desc_gen2)
> +		core->iris_firmware_desc =3D core->iris_platform_data->firmware_desc_g=
en2;

[Severity: High]
Since this patch changes these pointers from being statically assigned in
the probe function to being dynamically mutated during iris_core_init(), can
this race with lockless reads during ioctls?

For example, if a STREAMON ioctl executes concurrently holding only
inst->lock, it might read the pointer locklessly in
iris_fill_internal_buf_info():

drivers/media/platform/qcom/iris/iris_buffer.c:iris_fill_internal_buf_info()
{
        ...
        buffers->size =3D inst->core->iris_firmware_desc->get_vpu_buffer_si=
ze(
                inst, buffer_type);
        ...
}

If sys_error_handler executes iris_core_init() concurrently holding
core->lock, could this result in dereferencing an invalid or mismatched
function pointer?

> +	else if (core->iris_platform_data->firmware_desc_gen1)
> +		core->iris_firmware_desc =3D core->iris_platform_data->firmware_desc_g=
en1;
> +	else
> +		return ERR_PTR(-EINVAL);
> +
> +	has_both_gens =3D core->iris_platform_data->firmware_desc_gen2 &&
> +		core->iris_platform_data->firmware_desc_gen1;
> +
> +	ret =3D of_property_read_string_index(dev_of_node(core->dev), "firmware=
-name", 0, fw_name);
> +	if (ret) {
> +		*fw_name =3D core->iris_firmware_desc->fwname;
> +		ret =3D request_firmware(&firmware, *fw_name, core->dev);

[Severity: Low]
Since the Gen2 firmware is optional and the driver intentionally falls back
to Gen1, will using request_firmware() here instead of
firmware_request_nowarn() print a misleading "Direct firmware load failed"
error to the kernel log on Gen1-only platforms?

> +		if (ret && has_both_gens) {
> +			core->iris_firmware_desc =3D core->iris_platform_data->firmware_desc_=
gen1;
> +			*fw_name =3D core->iris_firmware_desc->fwname;
> +			ret =3D request_firmware(&firmware, *fw_name, core->dev);
> +		}
> +
> +		return ret ? ERR_PTR(ret) : firmware;
> +	}
[ ... ]
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media=
/platform/qcom/iris/iris_vidc.c
> index 14d63dc76c9ba..372408b894c19 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
[ ... ]
> @@ -196,6 +197,8 @@ int iris_open(struct file *filp)
>  		goto fail_m2m_release;
>  	}
> =20
> +	iris_session_init_caps(core);

[Severity: High]
Can concurrent opens race to write to the shared device-wide array
core->inst_fw_caps_dec?

This patch moves iris_session_init_caps() from the probe function to
iris_open(). Since iris_open() does not hold core->lock when calling this
function, multiple concurrent opens will unconditionally write to the
same shared array in iris_session_init_caps():

drivers/media/platform/qcom/iris/iris_ctrls.c:iris_session_init_caps()
{
        ...
        core->inst_fw_caps_dec[cap_id].step_or_mask =3D caps[i].step_or_mas=
k;
        ...
}

The racing values are then copied into the instance in iris_vdec_inst_init(=
),
which could result in copying torn reads or corrupted bounds:

drivers/media/platform/qcom/iris/iris_vdec.c:iris_vdec_inst_init()
{
        ...
        memcpy(&inst->fw_caps[0], &core->inst_fw_caps_dec[0],
               INST_FW_CAP_MAX * sizeof(struct platform_inst_fw_cap));
        ...
}

> +
>  	if (inst->domain =3D=3D DECODER)
>  		ret =3D iris_vdec_inst_init(inst);
>  	else if (inst->domain =3D=3D ENCODER)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-iris-ar50l=
t-v6-0-374f0a46c23b@oss.qualcomm.com?part=3D1
