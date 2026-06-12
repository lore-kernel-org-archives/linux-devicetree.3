Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B453B3A9861
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781260785; cv=none; b=DE0do+iHWIIbH4nQn3sHa13TJmTpR4P75PLzUjcEZVaSqyPxm3nbODcUheTD8I4S/4M9lQSeHuriGc6ty7PhKx9zigfPsT3NCaODZjakc0quBd/HYLAlu5hgtRiZJXRGahA/34OW4d5HfNbYfKKqBgeor8BRIxoMN6teO0rPOM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781260785; c=relaxed/simple;
	bh=FhXhkGUeHEKEQ+b7fTq3xEA3teX7Fk53purGClGNHiI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Br1w6IyV/Zub9H8UaDuM+SrbhtPoZQrqNlJB27nrz3H8H3rfFMqgdqSh2A81UlJ+CIO7K8i5/2Ykd073vTUkKReQ5/KKfmvU7jm6DdE37z1pormYJt6Dy1ctTyCqodRXAgfVJWWlIrkGvmsLhP2rlJ1zCrUfXCCOyUk91KU7RfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RO2rZqal; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RO2rZqal"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F88D1F000E9;
	Fri, 12 Jun 2026 10:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781260784;
	bh=1A0f1xjI+uoHKdH3Lw0MORl4/Bci0kf1j5Yll1av9y8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RO2rZqalP7Svc/ugKQTeB1gyj32OV2ukeczEjU7f9+qXlr8UUJUXzWRwWuGpEMLTX
	 mu/WIpQ/XW2kednQB1k7CAgxjUGtiTOsUO8og3jPAjhPcQi4+lnyKimIV+dTlIfMbh
	 HrVLg0pCQm06EA3p3Y0elrCPOkl7oxRYGquUMwwa/U8g/v4wzMbDkZJ/bvhvAK8Dkv
	 w6ngXAbmCgRfA0rIXXg8OCSMsmkgiwa4q4alhtK9O61pQtScvzg8YF/kwecAqTsGNJ
	 d1Ju7xmFetprvxbEiPp304B0bqbex1x+VPa40Z8rJ9qcsZGUlKIWIYtPPVGe9xh0VB
	 GLzFujTDv2jjw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 14/16] media: iris: add Gen2 firmware support on the
 Agatti platform
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260612-iris-ar50lt-v4-14-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-14-0abfb74d5b3c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 10:39:43 +0000
Message-Id: <20260612103944.5F88D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The `qcm2290_data` struct initialization assigns values to non-exis=
tent members `.firmware_desc_gen1` and `.firmware_desc_gen2`, causing a bui=
ld failure. Additionally, the required `.firmware_desc` member is left unin=
itialized, leading to a NULL pointer dereference during probe.
--

commit 4f1d2454209dec3530526e228c0b4e78b6170ab3
Author: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

media: iris: add Gen2 firmware support on the Agatti platform

Agatti platform is using HFI Gen1 firmware, which is considered to be
legacy firmware branch. Follow the example of the SC7280 platform and
extend the driver with supporting both HFI Gen1 and Gen2 firmwares for
this platform. Like HFI Gen1 this firmware doesn't have PIPE property
(but unlike Gen1 buffer sizes are calculated on the driver side).

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

[Severity: Low]
Does this cause a build failure? struct iris_platform_data does not
currently contain a firmware_desc_gen2 field (nor a firmware_desc_gen1
field).

Looking at drivers/media/platform/qcom/iris/iris_platform_common.h:

struct iris_platform_data {
	/*
	 * XXX: replace with gen1 / gen2 pointers once we have platforms
	 * supporting both firmware kinds.
	 */
	const struct iris_firmware_desc *firmware_desc;

If these fields were added to bypass the build failure, wouldn't this
initialization leave the required firmware_desc field uninitialized?
This could result in a null pointer dereference during probe:

drivers/media/platform/qcom/iris/iris_probe.c:iris_probe()
	core->iris_firmware_desc =3D core->iris_platform_data->firmware_desc;
	core->iris_firmware_data =3D core->iris_firmware_desc->firmware_data;

>  	.vpu_ops =3D &iris_vpu_ar50lt_ops,
>  	.icc_tbl =3D iris_icc_info_ar50lt,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-iris-ar50l=
t-v4-0-0abfb74d5b3c@oss.qualcomm.com?part=3D14
