Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A87DA1FE47B
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569002; cv=none; b=MzmiiQ4pW4r1Q8D3sttB09xV3t4rZ6kS119BU6nGIdZn2TFP9SpDQ1bKqoF0Vytj8UrPM0rgTmMEIjOwpWHpPn+4Sl9ks/uOMuhb29rx0d5GvrPFQbUp8Ly7Xksa96c6ZbNoe+mW96lqraFSrtVybyvGb5xg/eYOHXJWsA745gQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569002; c=relaxed/simple;
	bh=rv/FEhfy8/wZSM3dFUCj5+4exGV4kNg7f0Y611gcldo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GRF4tKJgjvqMbt6u3T+KNTues1gQ4rHVAzBSl26cYth8KJl7pFlhDSEAJEKHeMpAlSuyUZExOYNe1KsLw8DQFbQqdBMeZrmWQGNALbUm3cnnQxE7+2B8s91oSzJmt6izbQYPrEiQPmXADtwmBM0KgTNyDs3tUxEvOCa4v9pOl20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kx923M2c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kx923M2c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6991F00A3A;
	Tue, 16 Jun 2026 00:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781569001;
	bh=PCA2FfeB9PmQpn0NQdZWTB0z9X1+9DoHU9IqL0Gj22g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Kx923M2cHkrrPh6HhbWFCKKR/AMiw6tm+RuFxW850I2Vdf6xnEQsmK2lWSbSwgo9G
	 yYqFTqOHkIiO/u5AHYtLtdAAdHGk5dlNKfEjNldWzrHNejM9dyNNCNPhu4Pgvrqn4a
	 ddlqHBf8TE54AtHGAX+qbMQaVJWxeXZ5d45/N3KZjDsZWpkwGWcvMwUfcYas1k8yP7
	 Fn82lMTukOCn/ZSF5sVktlqG0hvfP0KugMU0Xfow0ksvnS+jPTjYD2knjevJMMmY0U
	 KbtqNUOwl/IGQ3bVlOun//atOaDbTleN8/E/YZqTd0u8Rr5T2rEunfXZBB5TBjLLzW
	 scGQdFuu62k1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 05/16] media: iris: add vpu op hook to disable ARP
 buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260616-iris-ar50lt-v5-5-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-5-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 00:16:40 +0000
Message-Id: <20260616001641.0C6991F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Permanent memory leak of DMA buffers in `iris_core_init()` on hard=
ware response timeout, which can be repeatedly triggered from userspace.
--

commit 3a7fc135bf016aef8f9196cb8a7b617066640e5c
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: add vpu op hook to disable ARP buffer

This patch adds an optional disable_arp callback to the VPU operations
to disable the ARP internal buffer on AR50LT platforms. The callback is
invoked during the core initialization and power management resume paths.

> diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media=
/platform/qcom/iris/iris_core.c
> index 52bf56e517f91..bd22076f35576 100644
> --- a/drivers/media/platform/qcom/iris/iris_core.c
> +++ b/drivers/media/platform/qcom/iris/iris_core.c
[ ... ]
> @@ -78,6 +79,9 @@ int iris_core_init(struct iris_core *core)
>  	if (ret)
>  		goto error_unload_fw;
> =20
> +	if (vpu_ops->disable_arp)
> +		vpu_ops->disable_arp(core);
> +
>  	core->iris_firmware_data->init_hfi_ops(core);
> =20
>  	ret =3D iris_hfi_core_init(core);

[Severity: High]
This is a pre-existing issue, but could the error handling in
iris_core_init() permanently leak DMA buffers?

If iris_wait_for_system_response() times out at the end of this function,
it sets the state to IRIS_CORE_ERROR and returns a timeout error, but the
DMA memory allocated earlier by iris_hfi_queues_init() is not freed.

A subsequent initialization attempt would then trigger this path:

    } else if (core->state =3D=3D IRIS_CORE_ERROR) {
        ret =3D -EINVAL;
        goto error;
    }
    ...
error:
    core->state =3D IRIS_CORE_DEINIT;

This transitions the state to IRIS_CORE_DEINIT and still does not free
the memory.

If a third initialization call is made, iris_core_init() proceeds with
normal setup because the state is now IRIS_CORE_DEINIT. It will call
iris_hfi_queues_init() again, overwriting core->iface_q_table_vaddr and
core->sfr_vaddr, leaking the previously allocated contiguous DMA memory.

Is there a missing cleanup path for the DMA queues when a system response
timeout occurs, or should the transition from IRIS_CORE_ERROR explicitly
handle freeing these resources?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-iris-ar50l=
t-v5-0-583b42770b6a@oss.qualcomm.com?part=3D5
