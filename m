Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F74B3DA5B9
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176030; cv=none; b=KcoKq97ZXEZ2st7CbNym75JfGr7c0hxqRD2P/J2CPb+ouxXIhTqOr6VOIBqliI8b017+kDwpG2i5pXjC8GyNPsVRd1PSTV5ZnScGwrWfGOjafj/QHeQZHELHx5zsJBmgRldx/Yo6mxwEuEWPjOW17EcHtQ+Z58asLomNm4TvHU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176030; c=relaxed/simple;
	bh=mZp56ll6jM+EBKafYseDUqLJWSu37q8jPRE8adU8jUs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NAU7UjNqJgH49vtUID77YeB5U1GDtlbk2l7dEG1lk3IO5PWR8m+a6Rt8XVk2FLuLpvuzrm2BwMhOGYlFltjtf7E8vNidp9dv03hmkbF2L84gj+buSLspCYUL1SNxv/6/xTDUbLua1Mkwqfx15reiE+rM8Xeir4N28SR6BMbmK+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCarblAK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCarblAK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC75C2BCC6;
	Tue, 19 May 2026 07:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176030;
	bh=mZp56ll6jM+EBKafYseDUqLJWSu37q8jPRE8adU8jUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=RCarblAKz2c20Vkifo570vTLXHx0fO/3dN51J/1ezei6abY3yljCpPKzKmTPSLBi3
	 WbMhuvmB8oAJBMWEiMWuUZAabI+TxF/o09lUxoDH6RmFkGfQbbPTyNnKw75FTFfNbv
	 cnT8joqlMiIXCO4/AUtmMl8U7ZzkKqtlwVSAuN/UpQkAjTITjJ+pup7iUQaqe18MaG
	 eiIefLQCwSq4NMIcMsocFX61cQSIiKd5kisMXJvYpIHrg4vCEnDMORcB/H1kGNsIV6
	 xHuhl0u/v7feTb4J/eL6GYsFlxmb8csZjfMNfQtSOYMmWeoQdcwxj18yKpDg6zYreg
	 vFuH4cLV2+MPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 08/16] remoteproc: qcom_wcnss: Switch to generic PAS
 TZ APIs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518072856.22790-9-sumit.garg@kernel.org>
References: <20260518072856.22790-9-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:33:49 +0000
Message-Id: <20260519073350.0AC75C2BCC6@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The switch to the generic `qcom_pas` API exposes the driver to a l=
ockless TOCTOU race condition and Use-After-Free if a backend module is unl=
oaded concurrently.
--

commit e4aabb52d1f1c2288fe5314795bd4781f09c76b4
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

remoteproc: qcom_wcnss: Switch to generic PAS TZ APIs
   =20
This commit switches the qcom_wcnss client driver over to generic PAS TZ
APIs to support multiple TZ implementation backends like QTEE and OP-TEE.

> diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wc=
nss.c
> --- a/drivers/remoteproc/qcom_wcnss.c
> +++ b/drivers/remoteproc/qcom_wcnss.c
[ ... ]
> @@ -257,7 +257,7 @@ static int wcnss_start(struct rproc *rproc)
>  	wcnss_indicate_nv_download(wcnss);
>  	wcnss_configure_iris(wcnss);
> =20
> -	ret =3D qcom_scm_pas_auth_and_reset(WCNSS_PAS_ID);
> +	ret =3D qcom_pas_auth_and_reset(WCNSS_PAS_ID);

By switching to the generic qcom_pas_auth_and_reset(), does this expose the
driver to a race condition if the PAS backend module is unloaded concurrent=
ly?

When using qcom_scm_pas_auth_and_reset(), the direct symbol dependency prev=
ented
the backend module from being unloaded while the wcnss module was active.

The new qcom_pas_auth_and_reset() function appears to use a global ops poin=
ter
without locks or module pinning:

drivers/firmware/qcom/qcom_pas.c:qcom_pas_auth_and_reset() {
	if (!ops_ptr)
		return -ENODEV;

	return ops_ptr->auth_and_reset(ops_ptr->dev, pas_id);
}

If an administrator unloads the backend module and ops_ptr is cleared right
after the check, could this result in a null pointer dereference or
use-after-free when calling ops_ptr->auth_and_reset()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518072856.2279=
0-1-sumit.garg@kernel.org?part=3D8
