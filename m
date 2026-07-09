Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D84331EAD
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 14:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783607104; cv=none; b=WOhxLUQG/u3G3bl17t35AbNXyklNgYuSPT81nlDe5B2YyTci3J93qyC8a1IV8ZyH6V14ksWNqBfRh/D4JcyPtfFOVMT9I9nVuvWVvpWUPouAi0O5SWLdm7IGhbNs8vAcADpSjHY6oxfqXa304tHM0d7xbSqAaX5dx5kyXZVtWVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783607104; c=relaxed/simple;
	bh=0R6o5tXGg9r+ia7xYXgIqd62dU50g8XMfE3VhcSo2Qs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eqX5af0v9vP9RbuAgkPH9Kzm+2/4udyWqPSiNoMrfpvomLSmJk30380wkyPkIqWxVrXh7fhtWmE/tf7g5XQKLQmmu9uME5+vljsKRz7mnXYDuNVcA/gs1l8n/ycapOjMIWeJ152+YHXY0gf2MlK2IKzrc2VbiGxcYJTVHJ23GUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gtv15BfV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gtv15BfV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A8C91F000E9;
	Thu,  9 Jul 2026 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783607103;
	bh=Z+4pwgf+XYVLVh244acZA7zna3+DjBQmi1Sb9j/5f2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gtv15BfVx4xx5OoUio1Oj2buO1talgWbFNc1IRBIOm9bi7Lxw0Jyk5JPXMlDEzdT3
	 0eO6WE86EDceXIoREUcr+0HQznObqzfKkYrYcwOq5Hqx21Cc24qktAYb6fHPKkXOYg
	 U+5U1UXFF3B+spmdl5azfxDmCJzFIXayNFJUfghdcKSks4stPB3KhGpKSgWHT/t+P9
	 Ji0nQPO9YcRHVIXHDSA6pfyeKFFrhV05mBdXxDCJXyO3JMKC9/ibhrHIn8sKRLhN+q
	 lxvpJ7JJA3SNDHPzmk/b0prQmdYVTzLjb527VZuc8FdNjtjzZh+RzpBFIm619ZT/xa
	 KrJUw6WW40kWQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 16/18] media: iris: add Gen2 firmware support on the
 Agatti platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709-iris-ar50lt-v7-16-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-16-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 14:25:02 +0000
Message-Id: <20260709142503.6A8C91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect maximum QP limit for HEVC encoding in the Gen2 firmwar=
e capabilities for the Agatti platform.
--

--- Patch [16]: [PATCH v7 16/18] media: iris: add Gen2 firmware support on =
the Agatti platform ---
commit c95f463971a4ef87470f272f24b4d448ca8c4ba8
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: add Gen2 firmware support on the Agatti platform

This commit extends the Agatti platform support in the iris driver to
include HFI Gen2 firmware capabilities. It defines the capability
structures, configuration parameters, and initialization data for Gen2
encoding and decoding on the AR50LT VPU.

> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
> @@ -1118,3 +1118,616 @@ const struct iris_firmware_data iris_hfi_gen2_dat=
a =3D {

[ ... ]

> +static const struct platform_inst_fw_cap inst_fw_cap_gen2_ar50lt_enc[] =
=3D {

[ ... ]

> +	{
> +		.cap_id =3D MAX_FRAME_QP_HEVC,
> +		.min =3D MIN_QP_8BIT_AR50LT,
> +		.max =3D MAX_QP,
> +		.step_or_mask =3D 1,
> +		.value =3D MAX_QP,
> +		.hfi_id =3D HFI_PROP_MAX_QP_PACKED,
> +		.flags =3D CAP_FLAG_OUTPUT_PORT,
> +		.set =3D iris_set_max_qp,
> +	},

[Severity: Medium]
Should the maximum bound for MAX_FRAME_QP_HEVC be set to MAX_QP_HEVC (63)
instead of MAX_QP (51)? This limits userspace from setting HEVC QPs between
52 and 63, which are valid values for HEVC encoding.

[ ... ]

> +	{
> +		.cap_id =3D I_FRAME_MAX_QP_HEVC,
> +		.min =3D MIN_QP_8BIT_AR50LT,
> +		.max =3D MAX_QP,
> +		.step_or_mask =3D 1,
> +		.value =3D MAX_QP,
> +	},

[Severity: Medium]
Does this also incorrectly limit the I-frame maximum QP to 51 instead of 63?
This same MAX_QP limit appears to be applied to P_FRAME_MAX_QP_HEVC and
B_FRAME_MAX_QP_HEVC in the array below.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-iris-ar50l=
t-v7-0-76af9dd4d1f6@oss.qualcomm.com?part=3D16
