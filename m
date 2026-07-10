Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1462B3A1A58
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 09:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783675079; cv=none; b=oZ2+1cuXZAt0+/Z36yybLzTddUMVzLy2DXlCypPUA0WVXkl8PEnaqOsNh3T2ijx+Wo76L5ZVcLvMa+qINGrXzIB4CPO32IciVi8Nd3oL+UNiqDbdAcH7D2Wkqt4+C2HG54vwnfwVzsWQWZZ9MvwxQn7Q67HGif1xymLU1ISEBLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783675079; c=relaxed/simple;
	bh=AeYRrAs4HaLc+iUr2QEzfzC9x8Y6ei7c/EanjA4nG+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gMg2JZVguazR0eloO7UhYUImHpPv+QLbQFqd6+5WZF71KnJ2O6CloaReMMgS9qzZ3Bd9b00sRpvLMlEvRg7gtGgLRVWD7n7E96C+jxvkQlP+2515L1m5KAbEyN3G1WYXx5x65DskD2RQrDKXhMPwahSxhEMPEP83SgSC95Bz0Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GpbR83E+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GpbR83E+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6701F1F000E9;
	Fri, 10 Jul 2026 09:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783675077;
	bh=yl9VsTlP0xnL3zR0mMTRRHkpPmRAP08j2scTCGY9M0s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GpbR83E+UV0THN7l1gjHxzU/MZ7fdazAslMka4t1ULvBAlZGd/+mhOIla9chKUIor
	 CIaONJgyxAWvt8l1anN6lPCab+0OudBoRN1S5FoNlycSOD4aAAn6qrI99Qbqn8Qm0j
	 7AGE6UZ9LIxSGxoJL8w4didE7ftAfyUhBUl7CN8Pz7+7m0Q5RPJuY+jyKzXXOHcAMs
	 x+ws3ZsKFUm3YF9pJEbCUUOoFGW+f2ld21yhotrt/4QGF5dHExrGSHdVcMceD5n9GK
	 keVDP9K9A+sMnc/gN1CCMTmo0g+YlVGi+ugSzGW4vqimCDo03MTgSEzMKFC5aVTL9W
	 IL7uZbA0JF5LQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] media: qcom: camss: Add camss-params helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260710-camss-isp-ope-v4-2-51207a0319d8@oss.qualcomm.com>
References: <20260710-camss-isp-ope-v4-0-51207a0319d8@oss.qualcomm.com>
 <20260710-camss-isp-ope-v4-2-51207a0319d8@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 09:17:56 +0000
Message-Id: <20260710091757.6701F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The result of `vb2_plane_vaddr()` is used without being checked fo=
r NULL, allowing unprivileged userspace to trigger a kernel crash via an un=
mapped or invalid buffer.
- [High] `camss_isp_params_apply` introduces a Double-Fetch (TOCTOU) vulner=
ability by re-reading size fields from a user-shared parameter buffer after=
 validation, allowing malicious userspace to cause out-of-bounds reads or i=
nfinite kernel loops.
- [Low] The patch introduces a new file that relies on a non-existent UAPI =
header `<uapi/linux/camss-config.h>` and an undefined constant `CAMSS_PARAM=
S_MAX_PAYLOAD`, breaking the kernel build.

Pre-existing issues:
- [High] Preexisting vulnerability in core `v4l2_isp_params_validate_buffer=
` allows bypassing size validation via double-fetching `buffer->data_size`.
--

--- Patch [2]: [PATCH v4 2/7] media: qcom: camss: Add camss-params helper -=
--
commit e5eb27065c51794fadaae391d80e83b70481fa0d
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: qcom: camss: Add camss-params helper

Add V4L2 ISP parameter buffer validation helpers for CAMSS ISP drivers.
Provides buffer size validation and per-block type validation for the
extensible V4L2 ISP parameters buffer format.

> diff --git a/drivers/media/platform/qcom/camss/camss-params.c b/drivers/m=
edia/platform/qcom/camss/camss-params.c
> new file mode 100644
> index 0000000000000..ebb75a191d375
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-params.c
> @@ -0,0 +1,67 @@
[ ... ]
> +int camss_isp_params_apply(struct device *dev,
> +			   struct vb2_buffer *vb,
> +			   const struct v4l2_isp_params_block_type_info *type_info,
> +			   const camss_isp_params_handler_fn *handlers,
> +			   unsigned int num_handlers,
> +			   void *priv)
> +{
> +	const struct v4l2_isp_params_buffer *buf;
> +	unsigned int remaining;
> +	unsigned int offset =3D 0;
> +	int ret;
> +
> +	ret =3D v4l2_isp_params_validate_buffer_size(dev, vb,
> +					v4l2_isp_params_buffer_size(CAMSS_PARAMS_MAX_PAYLOAD));

[Severity: Low]
Where is CAMSS_PARAMS_MAX_PAYLOAD defined? The kernel build seems to fail
because this constant is undefined.

> +	if (ret)
> +		return ret;
> +
> +	buf =3D vb2_plane_vaddr(vb, 0);
> +
> +	ret =3D v4l2_isp_params_validate_buffer(dev, vb, buf, type_info, num_ha=
ndlers);

[Severity: High]
Can this result in a NULL pointer dereference?

If an unprivileged userspace application queues a V4L2 buffer lacking a
virtual address mapping, vb2_plane_vaddr() will return NULL. The NULL
pointer buf is then directly passed to v4l2_isp_params_validate_buffer(),
which dereferences it.

> +	if (ret)
> +		return ret;
> +
> +	dev_dbg(dev, "params: version=3D%u data_size=3D%u\n", buf->version, buf=
->data_size);
> +
> +	remaining =3D buf->data_size;
> +
> +	while (remaining >=3D sizeof(struct v4l2_isp_params_block_header)) {
> +		const union camss_isp_params_block *block =3D
> +			(const union camss_isp_params_block *)&buf->data[offset];
> +		u16 type  =3D block->header.type;
> +		u32 bsize =3D block->header.size;

[Severity: High]
Could this be susceptible to a double-fetch race condition?

The function validates the V4L2 parameter buffer, but then iteratively
parses it while re-fetching block->header.size from shared user memory.

If a malicious userspace thread concurrently modifies block->header.size to
0 after validation, bsize becomes 0. This means offset and remaining do not
change, which would result in an infinite kernel loop.

> +
> +		if (type < num_handlers && handlers[type])
> +			handlers[type](priv, block);
> +		else
> +			dev_dbg(dev, "params: no handler for block type %u\n", type);
> +
> +		offset +=3D bsize;
> +		remaining -=3D bsize;
> +	}
[ ... ]
> diff --git a/drivers/media/platform/qcom/camss/camss-params.h b/drivers/m=
edia/platform/qcom/camss/camss-params.h
> new file mode 100644
> index 0000000000000..058e3f158b42d
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-params.h
> @@ -0,0 +1,62 @@
[ ... ]
> +#ifndef CAMSS_PARAMS_H
> +#define CAMSS_PARAMS_H
> +
> +#include <linux/types.h>
> +#include <media/v4l2-isp.h>
> +#include <uapi/linux/camss-config.h>

[Severity: Low]
Is this header correct? It appears that <uapi/linux/camss-config.h> does
not exist in the tree.

[ ... ]

While reviewing this patch, I noticed a related issue in
v4l2_isp_params_validate_buffer() in drivers/media/v4l2-core/v4l2-isp.c:

> 	/* Validate the size reported in the header */
> 	buffer_size =3D header_size + buffer->data_size;
> 	if (buffer_size !=3D payload_size) {
> 		dev_dbg(dev, "Data size %zu and payload size %zu are different\n",
> 			buffer_size, payload_size);
> 		return -EINVAL;
> 	}
>=20
> 	/* Walk the list of ISP configuration blocks and validate them. */
> 	buffer_size =3D buffer->data_size;

[Severity: High]
This is a pre-existing issue, but does this core function allow a bounds
check bypass?

The buffer->data_size field is fetched from shared user memory to validate
it fits in the payload, and then fetched a second time to initialize the
parsing loop bounds.

Can a userspace program concurrently modify buffer->data_size to a large
invalid size between the two fetches, bypassing the bounds check and
causing the block parser to read out of bounds?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-camss-isp-=
ope-v4-0-51207a0319d8@oss.qualcomm.com?part=3D2
