Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196C2199D8
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606770; cv=none; b=G+92FaeMZuOCa5RTOY896085ldtodsDCvy6KywytB6WogliPpZuil/V+JNY2SIaUFJquuQwU/32IEkrtqkUpij0mWgGSbfJ/Rlf7+Fto963wIC9wIRskpqfy8CekkVFxqd054QjJ5CzsTaVHFIhhNvl5/LkpxJdljlNpJ6aulAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606770; c=relaxed/simple;
	bh=jzayrIo1NKP6Zlso7ln074KuCATdoqV+jIAuhFBKLh8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DlPhlayeK1Is/C1tmrFvY6RMH4JLVbxazEypNbLJpTKFfLX3NdYFgJX6zgPcSKx7ofQrjitlFm/1UD5E4RWwm74Frk/7oheUUW3AiaDSmy+aMn42DPWRlkEbK9saDV9KIhMKzShEtIZPtw4YkxPeXGpAn2AMCCjWZcei/ROyCTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvdK7W2+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvdK7W2+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 963D81F000E9;
	Thu,  9 Jul 2026 14:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783606768;
	bh=i07oWIKz2SYc4FMhuHkbpgjUCz6RqiKKw334TT2lRRQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RvdK7W2+lb6fnxqJD7dUpp+BdvhnfQxfYVZs+pGQsCuKOY88AfqOJQeptO8gDaPpm
	 /l6rHmCZ7Xj4PxF3oioi/OAjkhx3WPxrWlFLID2/tRB12xiUwLG5XQqm8l1tb8fkBB
	 IMr1dz8LRICSh2mN43/HTsqU8z9RWSlNLxPvCQSyMrBy4rzRErfqvKGb+DHTv87PPa
	 DXlCr3/zSgHxR3Tv1YgubknzcYWRAngaiz1MJeHqv594ZIoRbQNoxqIrJBYY1G1VP4
	 1/KoqhJntXRYG1xSWEPcQQhe85CneeUtNH0QweTZSy7pxN6lbflVai9d4+FfxXol9K
	 38bLz/EQqMHKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 14/18] media: iris: implement support for the Agatti
 platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-iris-ar50lt-v7-14-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-14-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:19:28 +0000
Message-Id: <20260709141928.963D81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] Unconditional firmware query for buffer requirements during ST=
REAMON overwrites driver-calculated sizes, breaking Gen1 decoders and causi=
ng DMA buffer overflows.

Pre-existing issues:
- [High] Completion crosstalk between a timed out `GET_PROPERTY` command an=
d a subsequent `SESSION_STOP` command causes premature buffer freeing, lead=
ing to use-after-free.
- [Medium] The GOP_SIZE capability is missing the .hfi_id field in Gen1 enc=
oder configurations, causing silent failures when setting the property.
--

--- Patch [14]: [PATCH v7 14/18] media: iris: implement support for the Aga=
tti platform ---
commit 50a13c3b4c9f960eb99c4401684a9076ce008a44
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: implement support for the Agatti platform

Port support for the AR50Lt video codec core (present for example on the
Agatti platform) to the Iris driver. Unlike more recent cores this
generation doesn't have the PIPE property (as it always has only one
pipe). Also, unlike newer platforms, buffer sizes are requested from the
firmware instead of being calculated by the driver.

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c b/drivers/m=
edia/platform/qcom/iris/iris_hfi_gen1.c
> index ca1545d28b531..60bc1339ddd41 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1.c

[ ... ]

> +	{
> +		.cap_id =3D GOP_SIZE,
> +		.min =3D 0,
> +		.max =3D (1 << 16) - 1,
> +		.step_or_mask =3D 1,
> +		.value =3D 30,
> +		.set =3D iris_set_u32
> +	},

[Severity: Medium]
This is a pre-existing issue, but the GOP_SIZE capability is missing the
.hfi_id field here, meaning it defaults to 0.

Because of this, when iris_set_u32() invokes session_set_property() with
ID 0, the default case in iris_hfi_gen1_packet_session_set_property()
will return -EINVAL. The caller, iris_set_properties(), explicitly ignores
this return value:

    if (cap->cap_id && cap->set)
        cap->set(inst, i);

Since AR50Lt lacks the B_FRAME capability (which applies GOP size on other
platforms), does this completely prevent the GOP size from being configured
on the firmware?

[ ... ]

> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/d=
rivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> index 99e82e5510abe..c4baabbacefda 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
> @@ -970,6 +970,11 @@ static int iris_hfi_gen1_set_bufsize(struct iris_ins=
t *inst, u32 plane)
>  	struct hfi_buffer_size_actual bufsz;
>  	int ret;
> =20
> +	ret =3D inst->hfi_session_ops->session_get_property(inst,
> +							  HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS);

[Severity: Critical]
Does this unconditional firmware query during STREAMON break existing Gen1
decoders and lead to DMA buffer overflows?

When the firmware responds to this property,
iris_hfi_gen1_session_buffer_requirements() blindly overwrites
inst->buffers[type].size with the firmware's required size:

    inst->buffers[type].size =3D req->size;

However, userspace allocated these V4L2 DMA buffers during REQBUFS based on
the mathematical size from iris_get_buffer_size(). During QBUF,
iris_vb2_buf_prepare() incorrectly validates against this smaller size inst=
ead
of the firmware's newly required size:

    if (vb->type =3D=3D V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
        vb2_plane_size(vb, 0) < iris_get_buffer_size(inst, BUF_OUTPUT))
        return -EINVAL;

If the driver then passes the firmware's required size (via
HFI_PROPERTY_PARAM_BUFFER_SIZE_ACTUAL), could the firmware write past the e=
nd
of the physically allocated DMA memory?

Additionally, does applying this unconditional query to existing SM8250 dec=
oders
force an unsupported state transition?

[Severity: High]
This isn't a bug introduced by this patch, but can this session_get_propert=
y()
call lead to a use-after-free if it times out?

iris_hfi_gen1_session_get_property() waits synchronously on inst->completio=
n.
If it times out, the command is left pending in the firmware. Later, if
userspace stops the stream, iris_hfi_gen1_session_stop() reinitializes
inst->completion and waits for HFI_CMD_SESSION_STOP.

If the delayed HFI_MSG_SESSION_PROPERTY_INFO arrives during this wait,
iris_hfi_gen1_session_property_info() handles it and blindly calls:

    complete(&inst->completion);

Will this prematurely wake the SESSION_STOP wait, causing the driver to
mistakenly believe the session has stopped and free internal buffers while
the firmware is still accessing them?

> +	if (ret)
> +		return ret;
> +
>  	if (iris_split_mode_enabled(inst)) {
>  		bufsz.type =3D HFI_BUFFER_OUTPUT;
>  		bufsz.size =3D inst->core->iris_firmware_desc->get_vpu_buffer_size(ins=
t, BUF_DPB);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-iris-ar50l=
t-v7-0-76af9dd4d1f6@oss.qualcomm.com?part=3D14
