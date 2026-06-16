Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24141FE47B
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781569568; cv=none; b=NHevOrIVEl082AEiYYkNtxqXlG8+PudpHGdxUZJpDWBFm7wyduc0shRYlJyFQ1kI048u8KfiqMIfyVtyYA9FhJL+HWcAyWmjrcxNq7IACgaz6ZUC+dIq4qpdKZlxK7dS5BaEORL7JdD1at4eovILv5D67wkSa5PYmzZtaMBFL1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781569568; c=relaxed/simple;
	bh=PEtPHYwcQNck2qS6iJEE6ETI0hrKqTkeW2eHDJTuOvY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=A2UPUNfpXXAvEBR/95CAc2dV8xuvS3YFueN29QP9AW/sgQoTWEYUugkMNACIscddp3gqZm8ojPoo8FdOmCC20fJ6Zj4czDE4SdfshEFsAJR7QfeWQZvgoUgIfraKU8ShIPjrLk7Q57xx1ZM6Ih231zfF+gE5mOHuwXyxXKiBGgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtGMC/vD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtGMC/vD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BABA1F000E9;
	Tue, 16 Jun 2026 00:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781569567;
	bh=yam0sdDjnmLZ6SMTYcnIVM4xG1hBs4A1iKAb3MwBs4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HtGMC/vDDeqMnNanbwPGqBv4wMNT+fDbzczoFt1KmQjlhTlY9YfTPtGtv5UzLPRt7
	 Zg/ToCXz2ceiNk9FaLJjiEXffMsKDOsGJmQI3D0EQf9RCChxuU5Z6c7jHsQY8ilz8o
	 wNGglzIqUrXtQ3cCKEuE3JGSxKNeOwVjO5NO8DwsoX4KM77rtNZeSLAQPSQHZI9DDH
	 L/0OHW5Z+nRNFDuEy5d62TP9d/FwGbGEXU4skgAKFptqONUyElwTN9H2M9myVSCSRQ
	 EzvzuY1wIONBz4i1f96/BlirQ0bKS2bZ9PXa+a3LwYeb2Qnp0xqKQ8hRmOlqYxacNq
	 ZP6mI1eoykLUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/16] media: iris: add Gen2 firmware support on the
 Agatti platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260616-iris-ar50lt-v5-14-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-14-583b42770b6a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 00:26:06 +0000
Message-Id: <20260616002607.0BABA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete dual firmware refactoring leads to build breakage and N=
ULL pointer dereference during device probe.
--

commit 56abb89242d476eadcfa7c399ffc9ee1dfc1fca4
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: add Gen2 firmware support on the Agatti platform

This patch extends the iris driver to support both HFI Gen1 and Gen2
firmwares for the Agatti platform.

> diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c =
b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> index 393256f39112b..d9de7dcb59e3a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_vpu_ar50lt.c

[ ... ]

> @@ -78,7 +84,8 @@ static struct platform_inst_caps platform_inst_cap_ar50=
lt =3D {
>  };
> =20
>  const struct iris_platform_data qcm2290_data =3D {
> -	.firmware_desc_gen1 =3D &iris_vpu_ar50lt_p1_gen1_s6_desc,
> +	.firmware_desc_gen1 =3D &iris_vpu_ar50lt_p1_gen1_desc,
> +	.firmware_desc_gen2 =3D &iris_vpu_ar50lt_p1_gen2_s6_desc,
>  	.vpu_ops =3D &iris_vpu_ar50lt_ops,

[Severity: High]
Does struct iris_platform_data actually contain the firmware_desc_gen2 fiel=
d?

It looks like this might cause a build failure if struct iris_platform_data
hasn't been updated to include these specific gen1/gen2 fields.

Additionally, does this introduce a NULL pointer dereference during device
probe? If iris_probe() in drivers/media/platform/qcom/iris/iris_probe.c
still unconditionally reads the legacy firmware_desc field:

iris_probe() {
    ...
    core->iris_firmware_desc =3D core->iris_platform_data->firmware_desc;
    core->iris_firmware_data =3D core->iris_firmware_desc->firmware_data;
    ...
}

Won't this dereference a NULL pointer since the legacy firmware_desc is left
uninitialized for this platform? It seems a prerequisite patch refactoring
struct iris_platform_data and the probe function might be missing from this
series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-iris-ar50l=
t-v5-0-583b42770b6a@oss.qualcomm.com?part=3D14
