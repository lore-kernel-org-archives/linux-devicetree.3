Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A370429BDB5
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783606471; cv=none; b=FiGbHSWuWQ3qJXS04PJQJ3KgLjKFFHeMIoycoG9bL5k5B7tYRZyqbNunhj5GQ5CSekciTrmGCIeWxWZfPx0+kSJKMmHgaoCTtl4zA7b1LhhuvR4SHsWJB9QvjQ6QwNUMxuCbdAqEBRy6MgcoEYrPJNlFExobwQVpQvb2ENOAbZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783606471; c=relaxed/simple;
	bh=EYdwdhe4Da+l4BPzZPsmOfT2MbK6EF7bA3WS4GtbTYw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Cpkf1DH2w6PEVGhLEFTLs7UJnxBKQK/JhptM11gWImy/0xd8ZnF3wlhOKfO3uf+lTY87ddEGZGvbiht27sTzBVuB2X1EN/VJJxR0wJti3uapullVKnl9V8Vyp1N9eiAQ3cAHm1icZouHayLea6QxcquF9NEE0Sd7p0V8tTC1NR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dtMW5IuK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dtMW5IuK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AC51F000E9;
	Thu,  9 Jul 2026 14:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783606470;
	bh=TGwlCoHFagGEaeGOoFilwLIw4Jj5JkXqf/nROCgTU1s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dtMW5IuK5QmVvNFVxjBJwMLewBfktlhAoDK57Gv5nbfjRXA450+hBy0kI0eHDyrN3
	 +1rO0UdE4pw/vTlM4LVpu4XEwk/UVnlZmUIOtY9rpseZTcd3ZzeNo7CEHC2No2Pzls
	 HhUaM0ZjGWnpGGjsinD86P0OEdmv+ruQh2UJes23Jx6pLrIUR4fV3eiEXSlQ7DvFJu
	 W8qQHv69lW5D/p/igDqBW1Kwezt0o4S9bruCUVz1gv5z2R5VQtz5Hq1M6wuLulcJRd
	 YpLnIniRmkQi4GVYoBzkR+d/qWi+v3yZSdrCmTub78OdNJImrZ3KD9wPywjMUV98Dt
	 f+5yONewFGgjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 10/18] media: iris: skip PIPE if it is not supported
 by the platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709-iris-ar50lt-v7-10-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-10-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:14:28 +0000
Message-Id: <20260709141430.01AC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing `PIPE` capability results in a latent division by zero=
 in `iris_vpu3x_vpu4x_calculate_frequency()`.
--

--- Patch [10]: [PATCH v7 10/18] media: iris: skip PIPE if it is not suppor=
ted by the platform ---
commit 3fc5cca6cb7d8fdca8a5f48a5b724d09591a0347
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

media: iris: skip PIPE if it is not supported by the platform

This commit skips programming the HFI_PROPERTY_PARAM_WORK_ROUTE property
in iris_set_pipe() if the platform lacks the corresponding capability.
This prevents failures on platforms like AR50LT that do not support it.

> diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/medi=
a/platform/qcom/iris/iris_ctrls.c
> index 10e33b8a73f60..33a34573391a4 100644
> --- a/drivers/media/platform/qcom/iris/iris_ctrls.c
> +++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
> @@ -534,6 +534,9 @@ int iris_set_pipe(struct iris_inst *inst, enum platfo=
rm_inst_fw_cap_type cap_id)
>  	u32 work_route =3D inst->fw_caps[PIPE].value;
>  	u32 hfi_id =3D inst->fw_caps[cap_id].hfi_id;
> =20
> +	if (!hfi_id)
> +		return 0;
> +

[Severity: Critical]
This is a pre-existing issue, but does skipping the PIPE capability here me=
an
inst->fw_caps[PIPE].value remains 0?

If so, could this cause a division by zero later in the VPU clock calculati=
on?
Looking at iris_vpu3x_vpu4x_calculate_frequency() in iris_vpu_common.c:

drivers/media/platform/qcom/iris/iris_vpu_common.c:iris_vpu3x_vpu4x_calcula=
te_frequency() {
    ...
	vpp_cycles =3D mult_frac(mbs_per_second, caps->mb_cycles_vpp, (u32)inst->f=
w_caps[PIPE].value);
    ...
}

Because mult_frac() divides by its third argument without a zero check,
this could result in a fatal division by zero when a userspace application
opens the encoder on a VPU3x/VPU4x platform omitting the PIPE capability.

>  	return hfi_ops->session_set_property(inst, hfi_id,
>  					     HFI_HOST_FLAGS_NONE,
>  					     iris_get_port_info(inst, cap_id),
>  					     HFI_PAYLOAD_U32,
>  					     &work_route, sizeof(u32));
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-iris-ar50l=
t-v7-0-76af9dd4d1f6@oss.qualcomm.com?part=3D10
