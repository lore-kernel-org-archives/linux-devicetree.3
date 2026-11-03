Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793721934;
	b=YAMq4khQVND7/KS+DeqaKwU3aY9Q60w5uVYkw9GdTtkVLmwlJBOk+ZuYVcLk+XwGWSr4
	 22pLOBkFelxw8Bgjr5QhdqqxPJ2WcO65QYhKXgq02nTcc8eLmpg16m8LCMpAl9ovSs18A
	 WHmNwiGHWXaepvz1kk0oIA5uK4Ejkn8uPKoP57rJERYxSBDwiQ2R+1WUnFqvY7dAk0qZ7
	 37pHxR2d9s2E3B9vmJIUcfMe0P26K6ikbrVIzxhEB9nd5cxDUutbvJ+3TsJ/e+f2j9MU0
	 WNc8ehMjYagwOQRTfH9U+09AJwYTiS1hp6+Uf+vp5+Q/Hz3OimLaSobHhHq/F318GIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793721934;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=x4d66wtWU9DF+MgZLnRVsBRGamXIRXy7PpNGD9nzWSA=;
	b=qL9AoCfCdGhthZJ339CtugzxVhk5Utll/BsnwbkloX27RY1N7gwu3GwCYhPU2bsSL7TN
	 WsdAi7u2AtK/h5/7UREuL1xhlU3E01GbZx5Q/y1z9g0Vi/ZQlO+KmysbO9gtuxPFLthBW
	 TCP/YbK1rJgm6TLLq69yy0PFDdiqJ2j6kiclMHLCk4Kgxr/k6uVRtKlWwegaKq/0q7V4V
	 3Wazndjv+YsTEzPEtr+NPweeh6+q+UNT0R5i7xUMg+kuyoeSLVrcpImytrXXCn7gXOigo
	 SAEiAxFP6+9mMNJwoFa/fxwtEhg44Y2RZUy+EkaWmciyHVyo8NvvI6t8pRIRZ48xqwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ky2NVynq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C29A606A326
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ky2NVynq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1A51F0093A;
	Tue,  3 Nov 2026 16:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793721934;
	bh=x4d66wtWU9DF+MgZLnRVsBRGamXIRXy7PpNGD9nzWSA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ky2NVynqKSjOhUKrVMjF4qriQlMLhMIbd7YcxZczR0GCRqbFJANPjj+dmTAxE2SZQ
	 W7hWkzxsC5tJMYSqLFIBRtI6YG59yU0WAK6PJihBjj1CESq4Uy8l509Un9yuxoX2Qh
	 cNNBXOVZdfmQ9qWRY2IXZwY+DWntsZ40HGXywL01UykT9sqerZTTekXmsYcraSffvN
	 mDFwVXrBNuP/J8MrMW2jHFB05wNXrv12mDofdHFz9PiXzUjWuhqc9XNpVW4RUlCKNv
	 zOi1jQ/BVnvyJ3fcP7A3/pGrCHPx7FfCnleFlodoZAzw0q+Uq7ZIYSW9tjH5GUjCP7
	 nT+97ommjV06w==
Message-ID: <sashiko-outbox-195695@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 04/12] media: iris: Add non-pixel and pixel context
 bank devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vikash Garodia" <vikash.garodia@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-4-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
 <20261103-vpu_iommu_iova_handling-v6-4-e4b6ad864f8f@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 16:05:33 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: iris: leaked IOVA reservation in iris_probe() on cb_dev i=
nit error
--

commit 67ee85a9fa8ce0ee52eff0dcecaffb30a10495d5
Author: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

media: iris: Add non-pixel and pixel context bank devices

This commit adds helper functions to create and clean up separate non-pixel
and pixel context bank platform devices from device tree subnodes during
iris_probe() and teardown.

> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/medi=
a/platform/qcom/iris/iris_probe.c
> index 25876957381b9..e659461716ba4 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c

[ ... ]

> @@ -351,6 +413,10 @@ static int iris_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_put_core;
> =20
> +	ret =3D iris_init_cb_devs(core);
> +	if (ret)
> +		goto err_put_core;

[Severity: Medium]
In drivers/media/platform/qcom/iris/iris_probe.c, iris_probe() calls
iris_reserve_iova_region() right before iris_init_cb_devs(core):

	ret =3D iris_reserve_iova_region(dev, &core->iova_state, IRIS_NP_RESERVE_I=
OVA_START,
				       IRIS_NP_RESERVE_IOVA_SIZE);
	if (ret)
		goto err_put_core;

	ret =3D iris_init_cb_devs(core);
	if (ret)
		goto err_put_core;

	ret =3D v4l2_device_register(dev, &core->v4l2_dev);
	if (ret)
		goto err_unresv_iova_region;

	...

err_unresv_iova_region:
	iris_unreserve_iova_region(dev, core->iova_state);
err_put_core:
	v4l2_device_put(&core->v4l2_dev);

If iris_init_cb_devs() fails (for example, if platform_device_register_full=
()
returns an error in iris_create_cb_dev()), jumping to err_put_core skips
iris_unreserve_iova_region(dev, core->iova_state).

Does this leak the IOVA reservation in the parent device's IOMMU domain, and
should the error path jump to err_unresv_iova_region instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-vpu_iommu_=
iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com?part=3D4
