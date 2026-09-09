Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2571559CA5
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 15:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966837; cv=none; b=oIwyM3T1gv830PnJu29HVTcZreP1eFZiZW4qCp+Ucojj4CG9QtQM9bcGP65e2qs1gSVvhKslo4j9HhM3b8h8jxvOnB0Bo2saS5Gez3JtKibU7FYhnEEtewTr9AtsknN1Kjqe2R6t4/ISlhYFfhekFGo8R99nGgSu+wD9Q4JiXXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966837; c=relaxed/simple;
	bh=Q76seR7gqTVi8gVXtpUpO7g8aW7FkFDtxS59KpV9Z4E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GITW94qqE70G1k9z9g96ai1erssIsRP0+UywB37P7DdKdbeB5mjQ9JANMqM6f/znC3BisYGF0SY7LhZegSzsVQbU8180FAfOTh5PAS57d/vg4EscpWwe5idmnKU+Jaz8AqsYRtuFIYtbw0olEhIvQ7afNshyhxVJT4MzBjAtB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nG7LCQc6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nG7LCQc6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2FE1F00A3A;
	Wed,  9 Sep 2026 15:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788966835;
	bh=Uqiu2JlFau0H8iGvXgnSpWsV7nDxs0owL3JtIDFO6Ac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nG7LCQc6XcTU9Bs2yeudBEKZHQn/ngLBNV91s1y1xUUbJ+MZYC5xTNTfR3m+1y4CO
	 vhiKlRrRqDixfdUbF6ZBkQ7j5VQH1fuvnKeMim2NMrkdzCCjFZAJ1DigSN5TxHedDU
	 xpNRD77Fdv+BQff3iULVHVDqVrOkZHsmPSuzPq0kHPu/0Z+KZ0n1l062BDMh6YhTIo
	 cMyQjujDMzr9xz9+k+CzbtNGk8r4T5vWIbmkB2J/GdmK3qCvQ274qy8gKqrtNyOtb2
	 XeJSenYDR2F0PC+MEAmyo8mSch8Of+UNIF0KONjMMmqYmi0NNuQ9BE2AmEqd91ktOD
	 q38i4M+ZqtPJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/13] media: iris: Route buffers to the matching
 context bank device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260909-vpu_iommu_iova_handling-v3-6-2fe43ae45495@oss.qualcomm.com>
References: <20260909-vpu_iommu_iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com>
 <20260909-vpu_iommu_iova_handling-v3-6-2fe43ae45495@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 15:13:54 +0000
Message-Id: <20260909151355.3A2FE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Context bank devices (np_dev and p_dev) are unregistered and f=
reed during driver removal while V4L2 queues and internal buffers still hol=
d references to them, leading to a Use-After-Free and IOMMU faults in dma_f=
ree_attrs().

Pre-existing issues:
- [Critical] V4L2 instances access devres-managed `iris_core` structure aft=
er it has been freed during module removal.
--

commit 0b3161aa43cd126ba013789330d51a653b78bf3a
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Subject: media: iris: Route buffers to the matching context bank device

The VPU issues direct memory accesses through several stream units, requiri=
ng
non-pixel streams to use a specific context bank device due to address range
differences. This commit updates the buffer and queue allocation routines
to fetch and use the matching context bank device based on the buffer type.

> diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/med=
ia/platform/qcom/iris/iris_buffer.c
> index eb8de60c1177f..6e03d13ac1a79 100644
> --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
[ ... ]
> @@ -650,10 +650,10 @@ int iris_queue_internal_buffers(struct iris_inst *i=
nst, u32 plane)
> =20
>  void iris_destroy_internal_buffer(struct iris_inst *inst, struct iris_bu=
ffer *buffer)
>  {
> -	struct iris_core *core =3D inst->core;
> +	struct device *dev =3D iris_get_cb_dev(inst, buffer->type);
> =20
>  	list_del(&buffer->list);
> -	dma_free_attrs(core->dev, buffer->buffer_size, buffer->kvaddr,
> +	dma_free_attrs(dev, buffer->buffer_size, buffer->kvaddr,
>  		       buffer->device_addr, buffer->dma_attrs);

[Severity: Critical]
Does this code introduce a use-after-free regression for the context bank
device?

If userspace keeps the device node open during driver unbind, the context
bank devices might be unregistered and freed. When the file descriptor is
subsequently closed by userspace, tearing down the internal buffers will
invoke dma_free_attrs() with the freed device.=20

Since we are using these devices for memory tracking without taking a
reference, can this lead to memory corruption?

> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/=
media/platform/qcom/iris/iris_resources.c
> index 2c4d34c7bd77d..a6c3df892ca98 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
[ ... ]
> @@ -138,3 +139,43 @@ int iris_disable_unprepare_clock(struct iris_core *c=
ore, enum platform_clk_type=20
> =20
>  	return 0;
>  }
> +
> +struct device *iris_get_cb_dev(struct iris_inst *inst, enum iris_buffer_=
type buffer_type)
> +{
> +	struct iris_core *core =3D inst->core;

[Severity: Critical]
This is a pre-existing issue, but can this dereference of inst->core lead
to a use-after-free?

The iris_core structure is devres-managed. If the driver is unbound while
userspace still has the file descriptor open, devres will free the core
structure immediately.=20

When the file is closed later, teardown paths that call into functions like
iris_get_cb_dev() will access the freed inst->core structure.

> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media=
/platform/qcom/iris/iris_vidc.c
> index fcbc60016beec..064cf0a80748d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -108,7 +108,7 @@ iris_m2m_queue_init(void *priv, struct vb2_queue *src=
_vq, struct vb2_queue *dst_
>  	src_vq->drv_priv =3D inst;
>  	src_vq->buf_struct_size =3D sizeof(struct iris_buffer);
>  	src_vq->min_reqbufs_allocation =3D MIN_BUFFERS;
> -	src_vq->dev =3D inst->core->dev;
> +	src_vq->dev =3D iris_get_cb_dev(inst, BUF_INPUT);
>  	src_vq->lock =3D &inst->ctx_q_lock;

[Severity: Critical]
Can assigning this dynamically unregistered context bank device to the
queue cause a similar regression?

Like the internal buffers, if the driver unbinds while userspace
holds a file descriptor open, the queue teardown during the deferred
file close might dereference the freed context bank device.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909-vpu_iommu_=
iova_handling-v3-0-2fe43ae45495@oss.qualcomm.com?part=3D6
