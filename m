Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017368;
	b=TwXic+Pr8UuReWtNeNYWYaPdywhrN4UdXxjwMiIH8RHz/NNGk2yCnIY0pUMGsXoSzj7b
	 vqdaEv7kc3vV5cLdmiss00uzelCbXuMrbagwZ+FUgdKd+xIG5krVt1hE1DcnA2qWkAt9n
	 lGa80nOvPV3/64uwMHZ9Z4gUhiv6nOzuJQayiLfH9pGjdP2910l52+DNMVJ22B723IEwz
	 Xn2sUXSp5qnc4xOb0tokJn735ygTJyxexny3wbeRyfSsvLYnmaKvGe9PnZqVH2axkMFMr
	 HXRlweDcyEEw4N7EiEVip0TRRYl80TRzffyqlQd/AX/jwznQP2b62lkUVQVtMs4Omxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017368;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fJyS5eA4WoNYZTtkx3UVYJzyNFD1DkUvgnHaNnM4fKI=;
	b=AKMfL36ixapk7gI0HMlnwmjRvmIf4Mc5BzEOglIlnXQjbg5ZPtHYHqyG+eFxMDeszjOJ
	 q7TA8VgQG8CaVo+sCoKUaQC1Wb7lzYCWhBi75/2WjDimB7svU77q59OSQvDeD4IIxUst/
	 ezeCBxYmO0TdPWD1MpND2aBsaWH7qWGk2NsNrKAzhjeppMvqIh74XBP7VO/KelfAlVD0y
	 atsDd1CbOKvzpQUePsFV9u8o9yeO/cEQwjmxlZydVx0CLZ/P6E1O0TJASIh/7QXI6Zpl7
	 tzP6Ha5ZAtf66Lfe1Zsv7KPo9Vs0ImHSccPZ1fd0YTFcrEkAWeBmfT9DDpAiaEHGc1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdFp1rbC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17307606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jdFp1rbC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692201F000C4;
	Wed, 18 Nov 2026 15:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017367;
	bh=fJyS5eA4WoNYZTtkx3UVYJzyNFD1DkUvgnHaNnM4fKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jdFp1rbCPaoQeQ+kF+VNwp4GS8VGCMlM7bTPudCMoIurx5IyYI+6pALWdEKcK0dML
	 Ulbkslx9AhrcoMpAOE9kK7brVJuxEGsw+DtT8kk+OMP8zfN98AN8AjFlc4+DWk5gsh
	 EJkqg/jL8aXmiVWDymLmpxkbwk944Mn6M6/T4AvRI+gYpdsUePyKYFadtQt3eqyhZP
	 mPpJsLPmvLAu2Z3xUTlvWzwWkRoVKKq1Ty8R9mP64b3UGSk3mK7qTitE485KhxWBFo
	 Ha7SzZax84Uk/KbrqnzG/jfcAyyQ9fKveETLu7j3Pat1LtIr36fqkB1raof46dEeMn
	 b4ZGYjL+wlBcA==
Message-ID: <sashiko-outbox-221390@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/4] remoteproc: qcom: pas: Support secondary images
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-oob-support-glymur-v3-2-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
 <20261118-oob-support-glymur-v3-2-2cbdfe208d56@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 15:56:07 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] remoteproc: qcom: pas: masked secondary shutdown errors in
  qcom_pas_stop()
- [Medium] remoteproc: qcom: pas: unauthenticated PAS shutdown in
  qcom_pas_start()
- [Medium] remoteproc: qcom: pas: firmware leak on boot failure after
  qcom_pas_load()
--

commit f4e5bc32dd6dbd8e248f2fc47b7078b505ef5dfc
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

remoteproc: qcom: pas: Support secondary images

This commit adds PAS remoteproc support for loading, authenticating,
mapping, shutting down, and releasing a secondary image and its DTB.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index e7dfad27e5263..1c8c0c22c34d1 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c

[ ... ]

> @@ -252,6 +288,10 @@ static int qcom_pas_unprepare(struct rproc *rproc)
>  	qcom_pas_metadata_release(pas->pas_ctx);
>  	if (pas->dtb_pas_id)
>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
> +	if (pas->secondary_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
> +	if (pas->secondary_dtb_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
> =20
>  	return 0;
>  }
> @@ -269,19 +309,29 @@ static int qcom_pas_load(struct rproc *rproc, const=
 struct firmware *fw)
>  	if (pas->lite_dtb_pas_id)
>  		qcom_pas_shutdown(pas->lite_dtb_pas_id);
> =20
> -	if (pas->dtb_pas_id) {
> -		ret =3D request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, p=
as->dev);
> +	if (pas->secondary_dtb_pas_id) {
> +		ret =3D request_firmware(&pas->secondary_dtb_firmware,
> +				       pas->secondary_dtb_firmware_name, pas->dev);
>  		if (ret) {
> -			dev_err(pas->dev, "request_firmware failed for %s: %d\n",
> -				pas->dtb_firmware_name, ret);
> +			qcom_pas_release_firmware(pas);
>  			return ret;
>  		}
> +	}
> =20
> -		ret =3D qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
> -					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
> +	if (pas->secondary_pas_id) {
> +		ret =3D request_firmware(&pas->secondary_firmware,
> +				       pas->secondary_firmware_name, pas->dev);
> +		if (ret) {
> +			qcom_pas_release_firmware(pas);
> +			return ret;
> +		}
> +	}
> +
> +	if (pas->dtb_pas_id) {
> +		ret =3D request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name,
> +				       pas->dev);
>  		if (ret) {
> -			qcom_pas_metadata_release(pas->dtb_pas_ctx);
> -			release_firmware(pas->dtb_firmware);
> +			qcom_pas_release_firmware(pas);
>  			return ret;
>  		}
>  	}

[Severity: Medium]
Can this leak pas->secondary_dtb_firmware, pas->secondary_firmware, and
pas->dtb_firmware if boot fails after qcom_pas_load() succeeds?

qcom_pas_release_firmware() is only called in qcom_pas_start() on success
or under the disable_irqs error label.  If rproc_prepare_subdevices()
fails in rproc_start() before rproc->ops->start() is reached, or if
qcom_q6v5_prepare() fails at the top of qcom_pas_start() and returns early,
none of those firmware objects are released and pas->firmware is not
cleared.  A later boot or recovery attempt will then overwrite those
pointers in qcom_pas_load().

Calling qcom_pas_release_firmware(pas) and clearing pas->firmware in
qcom_pas_unprepare() (or jumping to the cleanup path when
qcom_q6v5_prepare() fails) would avoid the leak.

> @@ -338,10 +388,51 @@ static int qcom_pas_start(struct rproc *rproc)
>  			goto disable_cx_supply;
>  	}
> =20
> +	if (pas->secondary_dtb_pas_id) {
> +		ret =3D qcom_mdt_pas_load(pas->secondary_dtb_pas_ctx,
> +					pas->secondary_dtb_firmware,
> +					pas->secondary_dtb_firmware_name,
> +					&pas->secondary_dtb_mem_reloc);
> +		if (ret)
> +			goto release_secondary_dtb_metadata;
> +
> +		ret =3D qcom_pas_map_carveout(rproc, pas->secondary_dtb_mem_phys,
> +					    pas->secondary_dtb_mem_size);
> +		if (ret)
> +			goto release_secondary_dtb_metadata;
> +
> +		ret =3D qcom_pas_prepare_and_auth_reset(pas->secondary_dtb_pas_ctx);
> +		if (ret)
> +			goto unmap_secondary_dtb_carveout;
> +	}
> +
> +	if (pas->secondary_pas_id) {
> +		ret =3D qcom_mdt_pas_load(pas->secondary_pas_ctx,
> +					pas->secondary_firmware,
> +					pas->secondary_firmware_name,
> +					&pas->secondary_mem_reloc);
> +		if (ret)
> +			goto release_secondary_metadata;
> +
> +		ret =3D qcom_pas_map_carveout(rproc, pas->secondary_mem_phys,
> +					    pas->secondary_mem_size);
> +		if (ret)
> +			goto release_secondary_metadata;
> +
> +		ret =3D qcom_pas_prepare_and_auth_reset(pas->secondary_pas_ctx);
> +		if (ret)
> +			goto unmap_secondary_carveout;
> +	}
> +
>  	if (pas->dtb_pas_id) {
> +		ret =3D qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
> +					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
> +		if (ret)
> +			goto release_dtb_metadata;
> +
>  		ret =3D qcom_pas_map_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_s=
ize);
>  		if (ret)
> -			goto disable_px_supply;
> +			goto release_dtb_metadata;
> =20
>  		ret =3D qcom_pas_prepare_and_auth_reset(pas->dtb_pas_ctx);
>  		if (ret) {
> @@ -372,13 +463,17 @@ static int qcom_pas_start(struct rproc *rproc)
>  	ret =3D qcom_q6v5_wait_for_start(&pas->q6v5, msecs_to_jiffies(5000));
>  	if (ret =3D=3D -ETIMEDOUT) {
>  		dev_err(pas->dev, "start timed out\n");
> -		qcom_pas_shutdown(pas->pas_id);
>  		goto unmap_carveout;
>  	}
> =20
>  	qcom_pas_metadata_release(pas->pas_ctx);
>  	if (pas->dtb_pas_id)
>  		qcom_pas_metadata_release(pas->dtb_pas_ctx);
> +	if (pas->secondary_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
> +	if (pas->secondary_dtb_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);
> +	qcom_pas_release_firmware(pas);
> =20
>  	/* firmware is used to pass reference from qcom_pas_start(), drop it no=
w */
>  	pas->firmware =3D NULL;
> @@ -386,16 +481,37 @@ static int qcom_pas_start(struct rproc *rproc)
>  	return 0;
> =20
>  unmap_carveout:
> +	qcom_pas_shutdown(pas->pas_id);
>  	qcom_pas_unmap_carveout(rproc, pas->mem_phys, pas->mem_size);
>  release_pas_metadata:
>  	qcom_pas_metadata_release(pas->pas_ctx);
> -	if (pas->dtb_pas_id)
> -		qcom_pas_metadata_release(pas->dtb_pas_ctx);
> -
>  unmap_dtb_carveout:
> +	if (pas->dtb_pas_id) {
> +		qcom_pas_shutdown(pas->dtb_pas_id);
> +		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys,
> +					pas->dtb_mem_size);
> +	}
> +release_dtb_metadata:
>  	if (pas->dtb_pas_id)
> -		qcom_pas_unmap_carveout(rproc, pas->dtb_mem_phys, pas->dtb_mem_size);
> -disable_px_supply:
> +		qcom_pas_metadata_release(pas->dtb_pas_ctx);
> +unmap_secondary_carveout:
> +	if (pas->secondary_pas_id) {
> +		qcom_pas_shutdown(pas->secondary_pas_id);
> +		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
> +					pas->secondary_mem_size);
> +	}
> +release_secondary_metadata:
> +	if (pas->secondary_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_pas_ctx);
> +unmap_secondary_dtb_carveout:
> +	if (pas->secondary_dtb_pas_id) {
> +		qcom_pas_shutdown(pas->secondary_dtb_pas_id);
> +		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
> +					pas->secondary_dtb_mem_size);
> +	}
> +release_secondary_dtb_metadata:
> +	if (pas->secondary_dtb_pas_id)
> +		qcom_pas_metadata_release(pas->secondary_dtb_pas_ctx);

[Severity: Medium]
Does jumping to the unmap_*_carveout labels when
qcom_pas_prepare_and_auth_reset() fails call qcom_pas_shutdown() on a PAS
context that failed authentication?

Each image maps its carveout before calling
qcom_pas_prepare_and_auth_reset(), and on failure jumps to its own
unmap_*_carveout label, which now executes qcom_pas_shutdown() before
qcom_pas_unmap_carveout().  That issues an unbalanced PAS shutdown call to
TrustZone for an image that was never authenticated or brought out of
reset.  Separating the shutdown labels from the unmap_*_carveout labels
would ensure qcom_pas_shutdown() is only called for PAS IDs whose
qcom_pas_prepare_and_auth_reset() succeeded.

> @@ -440,9 +557,30 @@ static int qcom_pas_stop(struct rproc *rproc)
>  	if (ret =3D=3D -ETIMEDOUT)
>  		dev_err(pas->dev, "timed out on wait\n");
> =20
> +	if (pas->secondary_pas_id) {
> +		ret =3D qcom_pas_shutdown(pas->secondary_pas_id);
> +		if (ret && pas->decrypt_shutdown)
> +			ret =3D qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
> +		if (ret)
> +			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
> +
> +		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
> +					pas->secondary_mem_size);
> +	}
> +
> +	if (pas->secondary_dtb_pas_id) {
> +		ret =3D qcom_pas_shutdown(pas->secondary_dtb_pas_id);
> +		if (ret)
> +			dev_err(pas->dev,
> +				"failed to shutdown secondary dtb: %d\n", ret);
> +
> +		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
> +					pas->secondary_dtb_mem_size);
> +	}
> +
>  	ret =3D qcom_pas_shutdown(pas->pas_id);
>  	if (ret && pas->decrypt_shutdown)
> -		ret =3D qcom_pas_shutdown_poll_decrypt(pas);
> +		ret =3D qcom_pas_shutdown_poll_decrypt(pas->pas_id);
> =20
>  	if (ret)
>  		dev_err(pas->dev, "failed to shutdown: %d\n", ret);

[Severity: Medium]
Won't `ret =3D qcom_pas_shutdown(pas->pas_id)` overwrite any error returned
when shutting down pas->secondary_pas_id or pas->secondary_dtb_pas_id?

If secondary PAS shutdown fails in TrustZone while the primary PAS shutdown
succeeds, qcom_pas_stop() returns 0 to rproc_stop().  During crash recovery
in rproc_boot_recovery(), a zero return from rproc_stop() lets execution
proceed to rproc->ops->coredump() while the secondary memory region is
still locked by TrustZone, whereas pas->dtb_pas_id below uses a separate
variable to preserve earlier shutdown errors.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-oob-suppor=
t-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com?part=3D2
