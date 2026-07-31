Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2264499B9
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785524234; cv=none; b=aRYDU57Dcsp7uRJah0TlP/QGCxetZ6fZdiSOJZqDGodN3WqJQ/aLqNA6spEPfpwBqpAm1y7NdeqFqwg84RlCjvT3OLb8qPlTXGxgAMRrKTozLjlieE+A5PZOHS9/87u3t2QvHpv/C6qjNOVCwM8q+24gaQ2rfCw9tbLVAQh6Gv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785524234; c=relaxed/simple;
	bh=fQ80BNmOIBsCXieGxAh4C9KHgECE6FiDGMkdlvXbbA4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l712RrHfRh+GaRYctNk57dNB2BfpCsnaDAgrT/u0SKA+vFQfuFWDjW/OY2DOlmWTWuwPEV/DxCvVlX7lDKgAUH/irv9pIzUipfYqNeD7nrc3OR/BOCE89eGBnCECkqZZqZoPtAfWpqY6hh0PXaoDBZh5NPmypbQ9V+3vZqygqZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJiej2OI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJiej2OI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BFF1F00ACA;
	Fri, 31 Jul 2026 18:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785524233;
	bh=a3MLLcy1Jks7meJrYAT9nZal2RYxIwC7K9CBDaH/aG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OJiej2OIBUk32oaJYgIgBpnzegrMe03ZDgiA5Otu3m7XjxDzqbEvIKndTqRe7Nz1P
	 gqLSEipJee68p/fyl55jUEj0jy1uFVg24RU8gvP5cgE4Mfaoh+781yXgSAEy+tpl95
	 PjuZY5opzHJAGg5YveWMjh5lY2MrgsZ4+vLojNB+01zzFABMxyJ7fNSynf3ndGUtME
	 TyNKkL2EXApGZXTwerFb25qZswrQYSTN+U+Og+8XJ/Od0rGnYX8ByEUVrNT3wMNVUK
	 iN3CWiAjbGmtbsan5/rzr1X6aoEpCUzTr/iGjdXhoszm7bBWly7AZtKj18vlEs6cBD
	 nSb/w9wV6SUXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/12] media: iris: Route buffers to the matching
 context bank device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-5-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
 <20260731-vpu_iommu_iova_handling-v2-5-da52b5228dbd@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 18:57:12 +0000
Message-Id: <20260731185713.04BFF1F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] In `iris_vdec_inst_init`, the memory allocations for `fmt_src`=
 and `fmt_dst` are not checked for failure, leading to an immediate NULL po=
inter dereference on allocation failure.
- [High] The `fmt_src` and `fmt_dst` allocations are leaked if initializati=
on fails during `iris_open` or at the end of the inst_init functions.
- [High] Use-After-Free of `struct iris_core` due to `devm_kzalloc` mismatc=
h with V4L2 file descriptor lifetimes.
--

--- Patch [5]: [PATCH v2 05/12] media: iris: Route buffers to the matching =
context bank device ---
commit 727c95dcb8829de9509a16605cf4666c250086ac
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Route buffers to the matching context bank device

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
is restricted to use 0-600MB of IOVA space, while the pixel stream can
address the full range.

> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media=
/platform/qcom/iris/iris_vidc.c
> index 14d63dc76c9ba..26df872fb4fa1 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c

[ ... ]

While reviewing this driver, I noticed a few pre-existing regressions in
the related code that might need attention:

In drivers/media/platform/qcom/iris/iris_vdec.c:iris_vdec_inst_init():

> 	inst->fmt_src =3D kzalloc_obj(*inst->fmt_src);
> 	inst->fmt_dst =3D kzalloc_obj(*inst->fmt_dst);
>=20
> 	inst->fw_min_count =3D 0;
>=20
> 	f =3D inst->fmt_src;
> 	f->type =3D V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;

[Severity: Critical]
This isn't a bug introduced by this patch, but could kzalloc_obj() return
a null pointer under memory pressure and cause a dereference when setting
f->type?

In drivers/media/platform/qcom/iris/iris_vidc.c:iris_open():

> fail_m2m_ctx_release:
> 	v4l2_m2m_ctx_release(inst->m2m_ctx);
> fail_m2m_release:
> 	v4l2_m2m_release(inst->m2m_dev);
> fail_v4l2_fh_deinit:
> 	iris_v4l2_fh_deinit(inst, filp);
> 	mutex_destroy(&inst->ctx_q_lock);
> 	mutex_destroy(&inst->lock);
> 	kfree(inst);
>=20
> 	return ret;

[Severity: High]
This isn't a bug introduced by this patch, but does this error path leave
the memory allocated for inst->fmt_src and inst->fmt_dst leaked?

In drivers/media/platform/qcom/iris/iris_probe.c:iris_probe():

> 	core =3D devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);

[Severity: High]
This isn't a bug introduced by this patch, but since core is allocated with
devm_kzalloc, its lifetime is tied to device binding.

If the driver is unbound but a file descriptor remains open, can a
subsequent close() lead to a use-after-free?

For example, when iris_check_num_queued_internal_buffers() is called
during close:

> 	const struct iris_firmware_data *firmware_data =3D inst->core->iris_firm=
ware_data;

Could inst->core have already been freed by devres at this point?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-vpu_iommu_=
iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com?part=3D5
