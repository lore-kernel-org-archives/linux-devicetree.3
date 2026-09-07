Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F06F477E4B
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778961; cv=none; b=CL4/v0KYsYOAB0X2Aeubmm0jE/pT+HD4qmX/HXlcD/IxNJQ41blHQHygtCqLprb6ZRPkRB9Blm2Wrp0+TbQwNInV+SpUGpruSyoaiqQ2xf8TvH/CrVJQHgBc7n/mXUf6mKZl87+wmTmncUzVKHofH68+12epk5+/uByN3hqahRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778961; c=relaxed/simple;
	bh=jvpEXc1X5zJe14oIs2WdfZBF/aGQ9MUxceU+a88+zQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nkvsuY82UaX7/1ZQOgpmlPw62gLND6Zev0JdNcOhuRKeB1GhFurdN51YM/aq18eXI0a6ivDcQO5uuKcqU56H9yM7lfcOws3TweJIZMNZAp5vNxBIxanZqY9YGGDVV5/0ffZtCddbkw9wturWN0ZqgxqTTt2v9WfwkhCNBRuaV4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FD3HdRbP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FD3HdRbP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2451F00A3E;
	Mon,  7 Sep 2026 11:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788778959;
	bh=w3Y9ezperWRyiNOYv+8nWYRZgl1bR/cgUpwdeno5i1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FD3HdRbPlQyzwCQXYC7nlQ+n6xSvfYL/Sp/4CsomDS+mlTmF+1ZMixpuqdSVzI42c
	 KU2RFQmk5I8nDdPE3F7TSiZeCOSucUso7bm7GKuJT75I66Nk2Nj45E8jmHi+EGSn/M
	 e8TupI70CGRNll++WQr7C0P5AOJVHEqtLvhSjVWWSdPQec4/BCnV/dzP8gz1Hk/1m7
	 zB25G9UoCx1lNYeX0uo/5n0rsDHAgppLQ9EnoTJrdA8qGq0joor2Imc4eMq1bf7kZo
	 p0WDhyHmE8tPGCotKaDH4De5/hvrRMXYpsn13+9QRWv85/+sIUJDX8toNnuz3PrRZW
	 /T0ena9TS47Ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 5/8] media: Documentation: uapi: Add qcom-camss ISP
 params documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260907-camss-isp-ope-v6-5-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
 <20260907-camss-isp-ope-v6-5-6b915b9c5131@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 11:02:38 +0000
Message-Id: <20260907110239.6C2451F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The C example code in the documentation uses a bitwise OR operation=
 on an uninitialized structure field and fails to initialize padding and of=
fset fields.
- [Low] The gamma LUT initialization in the documentation example directly =
contradicts the formula defined in the uAPI header.
--

commit 3ecf0034d91da8edcad212fbbdb3de261d905083
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

media: Documentation: uapi: Add qcom-camss ISP params documentation

Add documentation for the Qualcomm CAMSS ISP parameters metadata format.
The format is built on the V4L2 extensible ISP parameters system and is
designed to be shared by any CAMSS ISP engine exposing a parameters
metadata output video node.

> diff --git a/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst b=
/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
> new file mode 100644
> index 0000000000000..da3dd5f3a5899
> --- /dev/null
> +++ b/Documentation/userspace-api/media/v4l/metafmt-qcom-isp.rst
[ ... ]
> +	struct camss_params_ope_wb_gain *wb =3D
> +		(struct camss_params_ope_wb_gain *)data;
> +
> +	wb->header.type =3D CAMSS_PARAMS_OPE_WB_GAIN;
> +	wb->header.flags |=3D V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;

[Severity: Low]
Is this bitwise OR operation safe in this example?

Since the struct is cast directly from the buffer, the flags field is
uninitialized memory. Using a read-modify-write operation here leads to
undefined behavior for userspace applications copying this example. Could
this be changed to a direct assignment?

> +	wb->header.size =3D sizeof(struct camss_params_ope_wb_gain);
> +
> +	/* Unity gain on all three channels (15uQ10, 1024 =3D 1.0) */
> +	wb->g_gain =3D 1024;
> +	wb->b_gain =3D 1024;
> +	wb->r_gain =3D 1024;

[Severity: Low]
Does this initialization cover all required fields?

This code sets the gain fields but leaves mandatory zero padding and offset
fields like g_sub and g_add uninitialized. Applications copying this example
might unintentionally pass garbage offsets to the kernel ISP driver.

[ ... ]
> +	struct camss_params_ope_gamma *gamma =3D
> +		(struct camss_params_ope_gamma *)data;
> +
> +	gamma->header.type =3D CAMSS_PARAMS_OPE_GAMMA;
> +	gamma->header.flags |=3D V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> +	gamma->header.size =3D sizeof(struct camss_params_ope_gamma);
> +
> +	/* Identity curve (pass-through, gamma 1.0) */
> +	for (unsigned int i =3D 0; i < CAMSS_OPE_GAMMA_LUT_SIZE; i++)
> +		gamma->glut[i] =3D gamma->blut[i] =3D gamma->rlut[i] =3D 257 * i;

[Severity: Low]
Is this gamma LUT initialization formula accurate?

This calculation uses 257 * i, which contradicts the official uAPI header in
include/uapi/linux/qcom-camss-config.h where the identity curve formula is
explicitly defined as lut[i] =3D i.

Could this contradiction cause confusion for developers implementing V4L2
userspace applications?

> +
> +	data +=3D sizeof(struct camss_params_ope_gamma);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-camss-isp-=
ope-v6-0-6b915b9c5131@oss.qualcomm.com?part=3D5
