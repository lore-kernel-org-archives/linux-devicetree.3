Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678153;
	b=BcNWIW1RTrb8BNEcual41igIUqz6w57SALDJtZ8yzubXMQslzUhOtrHNSaKzHkji/xt0
	 rdGEkzxXfyx8ian81PYNCVZ8pFR9YDewIitT8TWqH0jPm3/4rN7eo4EFM2N6CxJffxoOV
	 yDX9F42kxeWFFyuk9aY34Mru/2gp1jwsKh0/f4UyM/zyIuoEpXOA4KdPgaBXBB3tOCc7M
	 +slstNI0O2llud7hSUWms5WqzCpVbMxbqtDFu8gAywxVkBzgLHuREfk+uUyYuvKfC1QEY
	 HI/uECZQwhq8l9rfDMZuNSceUkTFCYK4PRj9cY/ojTPRAIuuhcR6EAbxhyJMnWkv98A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678153;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Rh/L4GAW1pCVNZs0b8KXmgAoLL1y5oDef7lb0me1RRc=;
	b=lLqBdT3bbtHyMpCv0ufFMlzKd8QJJ1sZrvqoEp4KTrQpzb/L4hSpG+0M3sdi/kvx9peF
	 9H09FE0oZVuH1mnEerLKvqgBVzpblGtTBxJUPJ9Xk+f9nXTeY2EQWcImTOeN+35SXd7Nj
	 T8GWod/SlhJpiI3tdD6NvtFGNlnzpZ/Ya8xpbPeohAZMA+EqT4L4DDwz7LPKZ8tY1Mybq
	 OCIu33g6Ta8b5/ls0ywzS95mgxOwh05mQ1/x1lU3YStOe3AG5JN3o83hRVcKXSn/HolUN
	 ZuIak81lYkYCzSbI84g53uPsXhYeGpMkdL0dyoRGEVkkNAqWzl23WCWGLzEXGHB0fFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SiH2rQ2b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89430606A323
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SiH2rQ2b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C479D1F000F2;
	Thu, 26 Nov 2026 07:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795678153;
	bh=Rh/L4GAW1pCVNZs0b8KXmgAoLL1y5oDef7lb0me1RRc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SiH2rQ2b3BSAx+UGnzD7Sut0uS+NehaNE3NViwjMCV2QO5+w9hllZ/Y/SLCc1NvK+
	 OVvBMfHl/viDXvPDBFfCD2XqMnjaRJUxb4wEsqoKc0oiFz4Pbfa417pvhVr8H5OdDp
	 Q2dkMHH0QRczlmN76UXjNKK3vzVLAesp+AHbxQOhqTD5aA0+YSPzkzdrpjy6A20h0L
	 c4ei1dPRE5zrnirDsrgU11Sz9Ap+pOOk3lI7wU8dRfq3e26sYeuUArfO7Y7oBLI9km
	 BmD03YWzAVOtG4RsAQ5f4ZQEuc74ezJxNF96C8fVwQ87y9diBSWQ1qlzK+/d5flzC1
	 YxijjP6jwSYDg==
Message-ID: <sashiko-outbox-234956@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] remoteproc: qcom: pas: Support secondary images
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-oob-support-glymur-v4-2-ad4ec5dd4b0a@oss.qualcomm.com>
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
 <20261126-oob-support-glymur-v4-2-ad4ec5dd4b0a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:29:12 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] remoteproc: qcom: pas: masked secondary shutdown errors in
  qcom_pas_stop()
- [Medium] remoteproc: qcom: pas: firmware leak on boot failure after
  qcom_pas_load()
--

commit dc23d946a37b9cfe0d13e4638daa0d99a7b84a72
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

remoteproc: qcom: pas: Support secondary images

This commit adds PAS remoteproc support for loading, authenticating,
mapping, shutting down, and releasing a secondary image and its DTB
alongside the primary image.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index e7dfad27e5263..1e51371e445f3 100644
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
> +		if (ret) {
> +			qcom_pas_release_firmware(pas);
> +			return ret;
> +		}
> +	}
> +
> +	if (pas->secondary_pas_id) {
> +		ret =3D request_firmware(&pas->secondary_firmware,
> +				       pas->secondary_firmware_name, pas->dev);
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
Does this leak pas->secondary_dtb_firmware, pas->secondary_firmware, and
pas->dtb_firmware if boot fails after qcom_pas_load() succeeds?

qcom_pas_release_firmware() is only called in qcom_pas_start() on success
or under the disable_irqs error label.  If rproc_prepare_subdevices()
fails in rproc_start() before qcom_pas_start() is called, or if
qcom_q6v5_prepare() fails at the top of qcom_pas_start() and returns
early, qcom_pas_release_firmware() is skipped and qcom_pas_unprepare()
does not release the firmware or clear pas->firmware.  A later boot or
recovery attempt then overwrites the pointers in qcom_pas_load().

[ ... ]

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
Does overwriting ret with qcom_pas_shutdown(pas->pas_id) mask shutdown
failures for pas->secondary_pas_id and pas->secondary_dtb_pas_id?

If secondary shutdown fails while primary shutdown succeeds,
qcom_pas_stop() returns 0 to rproc_stop() instead of preserving the error
the way the pas->dtb_pas_id block below does with dtb_ret, allowing crash
recovery or shutdown to proceed while the secondary PAS carveout remains
locked by TrustZone.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-oob-suppor=
t-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com?part=3D2
