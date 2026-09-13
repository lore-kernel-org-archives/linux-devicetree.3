Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AC43905F5
	for <devicetree@vger.kernel.org>; Sun, 13 Sep 2026 19:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789326796; cv=none; b=PXPn+jImol2cUwbocEL+dTo4abgQywZxHXC0+L2QgUnlH4u6l6iQ0thOLPaM8y0i7y7V6pyCSVGFOyw1dFqh0vg6kWCQkLv0bM9ks8ucIHTkoOIq+XjFhMAIqrhcaeYjeDblCyqD2vvAE2b78oYwI6zW01smDUIzbHVC+fJ63UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789326796; c=relaxed/simple;
	bh=Xe2CVxEMfG6frwfHKgZ2K8dX+dhmHlA45Le9ktbfb6k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=p733FhziURBW05l+WlNKCCDUUSdtlRWlYTU6KqrF3cziHEWb8Y3MfSo13sSBGE70uX3EG76EXUpES/GZs6axOwbzTeeS5MPOM01gnSj/x+B4gD3G2OaMZPvs3yqDcUk+qWuDSQL4XB8T9+5spS+KCQqfqux2r2pwtSNMD4IuORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+9nKkss; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+9nKkss"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2AD01F000FF;
	Sun, 13 Sep 2026 19:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789326794;
	bh=lV+ni+uZ4Bx/3SSVOyGwvIARqORHKPWCKNYIJ5OQZHQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W+9nKkssU9F3PfZySmC+01FiKfcmentnZIZ+JyNxd1q8o5Mzgs0rau20IFLP4eOLz
	 UiSzhT80zR4hPRktT/l0d/I28o3IgO0swGPvXRBkGUr+fpmuWq/tLCGXOEf7D0ZIjj
	 yTV06f1zYLGbCpa3fOd52Lwa1ts1A/BpwMCGU7m9wJBYI9rb4rqmnB1doRxb5luo4W
	 wVpimNWeoIqmkTQ5gMvSSMgAGH/xkyPTkFZg9F989lrJCfohA87jUYQ72jTMYK1asp
	 adbcJn3+zTsrwB3TqTXgVskPgknqCDfxbd63YTk36enHQXOSkKwf505Jzo+etFt92v
	 csnSFE7jyGNdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 06/13] media: iris: Route buffers to the matching
 context bank device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-6-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
 <20260914-vpu_iommu_iova_handling-v4-6-9b9074a73c41@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 19:13:13 +0000
Message-Id: <20260913191313.C2AD01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-After-Free of `core` structure and context bank devices during=
 deferred V4L2 file descriptor closure.
- [High] Use-After-Free of `core` structure due to uncanceled `sys_error_ha=
ndler` delayed work.
--

commit 6eb05ecb82941180acaafce80a0667d695f203de
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Route buffers to the matching context bank device
   =20
This commit introduces iris_get_cb_dev() to dynamically route buffers to the
correct context bank device based on their type and domain. It handles the
different addressable IOVA ranges between pixel and non-pixel SMMU streams.
If a relevant context bank device is missing, it falls back to the core
device for backward compatibility.

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
>  	kfree(buffer);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but this patch introduces
additional use-after-free vectors by dynamically managing unrefcounted
context bank devices.

If userspace holds a file descriptor open and the driver is unbound,
iris_remove() unregisters the context bank devices (p_dev, np_dev). After
iris_remove() returns, the devres subsystem frees the core structure. Later,
when the userspace application closes the file descriptor, iris_close() is
invoked, which calls into iris_destroy_internal_buffer().

Could this lead to a use-after-free when iris_get_cb_dev() dereferences
inst->core, and subsequently when dma_free_attrs() uses the already freed
dev?

While reviewing this code, I also noticed a pre-existing lifetime issue in
iris_remove():

drivers/media/platform/qcom/iris/iris_probe.c:iris_remove() {
...
	v4l2_device_unregister(&core->v4l2_dev);

	iris_deinit_cb_devs(core);

	mutex_destroy(&core->lock);
}

[Severity: High]
This isn't a bug introduced by this patch, but if a hardware error occurs,
the driver schedules the sys_error_handler delayed work. If the driver is
unbound before this work executes, iris_remove() completes without calling
cancel_delayed_work_sync(&core->sys_error_handler).

Since the devres subsystem then automatically frees the core structure, can
this cause a use-after-free when the delayed work timer expires and
iris_sys_error_handler() dereferences the freed core pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-vpu_iommu_=
iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com?part=3D6
