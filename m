Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CF53E49E2
	for <devicetree@vger.kernel.org>; Tue, 15 Sep 2026 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460507; cv=none; b=FWaFa9cADtyk0/KgbduTYROBCA2IZmZGHV3h69228/hpFuyrQj8gz5ElSWc58SHnImc10ZsPkmS0J6B+8Hxxx9QCSrq3jFNy3Pb5sLobjrXcf6glZ3d9Myvwj7CUvL6Z4Yk47BrwXExPrmumbObbdTX78bx5Uhv4gV+VxitLC9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460507; c=relaxed/simple;
	bh=CiwtNhL5ssny8Du2s8ebe1tLaK/AzI2vhKRNqEVgwhs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WiPIDUanwoCYUEc6hp9h/ABJRauzvClZ4RkD7nv3slYYU73FyME3d1zH6nPUVmQK9hocbKpOqaKZVyyucdGPgv0hMTLia8RIhT6kFVi4zAzb8/t0QdsnKmbbjLeyKFgVhpFggFuifhKvmTmdjFRPEFzSnmYh+9tv5quF08Qw1+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RgWhkwTe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RgWhkwTe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B68A1F00893;
	Tue, 15 Sep 2026 08:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789460475;
	bh=SDlO/+d+OkbOZ7NF2+DwukzAO/rqlDHzTVYhWnwUah0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RgWhkwTep7rxFbbXvHL+TOvEBthY9RawPp9LlgRnI/l3/7lDsyrXcXtRakyHMQP3w
	 vGiiPsoLIPLvsDWzNM96XycVabveD7aO4ck0ltxvWRepXJW0N+2KXLFf9H+1uO9ZIG
	 nRZHhf0gCoJ7a9JB03B6JYdvWvAB/slxoIn8urmTTvExeCHjpAUM8ndDwe+sZGnrnq
	 tQ+tGM8F/xPodfOhdMDzeZEZ7MrMMMQQPQbHFOKWCevuZdPcHrT9q4whBUwDY0Og2I
	 Ue0uwUC43HggTGdNUy6TU1oTJcIotdXNYo9OokK08qT8KDe+W2m6aCTUIPWGTY6obJ
	 kD+xLxDE+nFTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 5/9] media: Documentation: uapi: Add qcom-camss ISP
 params documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260915-camss-isp-ope-v7-5-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
 <20260915-camss-isp-ope-v7-5-77b13d131d3d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 08:21:14 +0000
Message-Id: <20260915082114.9B68A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] media: uapi: qcom-isp redefines V4L2 ISP block enable semantics
- [Medium] media: uapi: qcom-isp code example uses uninitialized memory for=
 ISP params
- [Medium] media: uapi: qcom-isp code example for gamma curve conflicts wit=
h header
--

commit e41b4aecb94fe466cf8c4b1792d1ce5d03151ede
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: Documentation: uapi: Add qcom-camss ISP params documentation

Add documentation for the Qualcomm CAMSS ISP parameters metadata format
(V4L2_META_FMT_QCOM_ISP_PARAMS). This describes the OPE processing
pipeline and provides a userspace programming example.

> diff --git a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst b=
/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
> new file mode 100644
> index 0000000000000..da3dd5f3a5899
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
> @@ -0,0 +1,145 @@
[ ... ]
> +The set of supported blocks depends on the CAMSS engine consuming the bu=
ffer.
> +Currently the Offline Processing Engine (OPE) is the only engine defining
> +parameter blocks, exposed through its ``ope_params`` metadata output vid=
eo
> +node; additional engines and blocks may be added to this format in the f=
uture.
> +
> +Blocks whose header does not carry V4L2_ISP_PARAMS_FL_BLOCK_ENABLE leave=
 the
> +corresponding hardware module bypassed. Blocks omitted from a buffer keep
> +their previously programmed configuration.

[Severity: High]
Does this redefine the standard V4L2 ISP block enable semantics?=20

If userspace follows the standard V4L2 ISP UAPI to update parameters by=20
omitting ENABLE/DISABLE flags for an active block, wouldn't this cause the
QCOM CAMSS module to be accidentally bypassed?

[ ... ]
> +The input node accepts 8-bit and 10-bit packed Bayer RAW formats (for ex=
ample
> +``V4L2_PIX_FMT_SRGGB8`` and ``V4L2_PIX_FMT_SRGGB10P``). The output node
> +produces semi-planar YUV (``V4L2_PIX_FMT_NV12`` / ``NV21`` / ``NV16`` /
> +``NV61`` / ``NV24`` / ``NV42``) or luma-only ``V4L2_PIX_FMT_GREY``. Each
> +configurable stage is bypassed unless its block carries
> +``V4L2_ISP_PARAMS_FL_BLOCK_ENABLE``.

[Severity: High]
Similar to the above, does this documentation break ABI compatibility with
generic V4L2 ISP userspace tools?=20

If a generic implementation writes to the metadata node to update a block
without the ENABLE flag set, this rule suggests the module gets disabled
instead of just updated.

> +
> +The following example populates an OPE parameters buffer with a white ba=
lance
> +and a gamma correction block:
> +
> +.. code-block:: c
> +
> +	struct v4l2_isp_params_buffer *params =3D
> +		(struct v4l2_isp_params_buffer *)buffer;
> +
> +	params->version =3D V4L2_ISP_PARAMS_VERSION_V1;
> +	params->data_size =3D 0;
> +
> +	void *data =3D (void *)params->data;
> +
> +	struct camss_params_ope_wb_gain *wb =3D
> +		(struct camss_params_ope_wb_gain *)data;
> +
> +	wb->header.type =3D CAMSS_PARAMS_OPE_WB_GAIN;
> +	wb->header.flags |=3D V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +	wb->header.size =3D sizeof(struct camss_params_ope_wb_gain);

[Severity: Medium]
Does this code example use uninitialized memory for the ISP parameters?

Since the buffer data memory isn't initialized, applying a bitwise-OR to
wb->header.flags could accidentally include the DISABLE flag or leave
reserved fields undefined. If a developer copies this into a userspace
application, could it cause silent data corruption or an -EINVAL IOCTL
failure?

[ ... ]
> +	struct camss_params_ope_gamma *gamma =3D
> +		(struct camss_params_ope_gamma *)data;
> +
> +	gamma->header.type =3D CAMSS_PARAMS_OPE_GAMMA;
> +	gamma->header.flags |=3D V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;

[Severity: Medium]
This seems to repeat the uninitialized memory issue for the gamma block.

> +	gamma->header.size =3D sizeof(struct camss_params_ope_gamma);
> +
> +	/* Identity curve (pass-through, gamma 1.0) */
> +	for (unsigned int i =3D 0; i < CAMSS_OPE_GAMMA_LUT_SIZE; i++)
> +		gamma->glut[i] =3D gamma->blut[i] =3D gamma->rlut[i] =3D 257 * i;

[Severity: Medium]
Does this calculation conflict with the UAPI header definition for the
gamma curve?

The calculation 257 * i distributes the 8-bit index into both the high and
low byte. If a future or different ISP implementation uses a 10-bit or
12-bit bus and masks the LSBs, the upper bits of the 8-bit value will spill
into the active LSBs. For example, 127 * 257 =3D 0x7F7F, which masked to 10
bits is 895 instead of 511.=20

If the UAPI header explicitly dictates lut[i] =3D i for identity, shouldn't
the example strictly follow the 0-255 scaling to avoid a distorted curve?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-camss-isp-=
ope-v7-0-77b13d131d3d@oss.qualcomm.com?part=3D5
