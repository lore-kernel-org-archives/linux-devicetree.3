Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF13DA7D0
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176028; cv=none; b=SYOaNzxA/rWeMvdI/y8DYBICke4SKNPbdDPuOU0wM6HLYzJZFjKI/k6CCHrTZbniesaGy8Et4+FKOaB5RT02cYk4euXt5l7d2Csfhk9XUjmufsM3KRWDS9aYgB2FU4qVDLYoaT8qLA17dGzHUOKYKUoSw+Am8DFGMvfiX4AEyqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176028; c=relaxed/simple;
	bh=R2TpZUlwVakvyMjb1YBUdD04POap58ojOiVhaWrGIr0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NC2zE3uwavDFO5lYfnWaVMRORo+GX50LxJsbkztVP6rLgXR2dxEiyen/yP+p2KdBaNxy0nX47gSb7KYbNzlhvEJ+Fi/SK4Zk8E5s7diqDwJVWuvpG6XWL6+oerzKkJpNI6obs+GPx+gBIpbDQJPLfUW5r1V0MDzS4LiXdIPrvRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNom61dk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNom61dk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B999AC2BCB3;
	Tue, 19 May 2026 07:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176027;
	bh=R2TpZUlwVakvyMjb1YBUdD04POap58ojOiVhaWrGIr0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=bNom61dkzXK22NugcUZY5yLV2iPhNx73RkHCpCpYL9IHfalhbATY5IZ+F2o0VU/Do
	 Bb3m09BUCEHqEIplBdA8Bm0WSzeBB55E86yAGpQXX4V2Rn0XJYbYpTq6qz75lSXRA4
	 0ryq/t4jzS6w6zLcmxfmsvsRdddlgX5KkBrgQqU0/B8nLomgc/JOf05dDHo4qqp1aE
	 ZBBIxvu2TmBHLI7dEH+y/jLizQioiELk2u6lO5MBFG8tXsQUE5vCmhuNpq3REL2bAN
	 TKfIRi7V9TX5xqQ/cMEKQ3cWG/d7JRoy5jQ9OKEEqLCXXO1+ZUWpE7Y3rASURH5p09
	 XvjO8YA12llfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 03/16] firmware: qcom_scm: Migrate to generic PAS
 service
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260518072856.22790-4-sumit.garg@kernel.org>
References: <20260518072856.22790-4-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 07:33:47 +0000
Message-Id: <20260519073347.B999AC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing NULL pointer check in `__qcom_scm_pas_metadata_release` =
leads to a kernel warning on error paths.
--

commit d6345df3a23d159b333a40adf86ed6859c37ccc5
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

firmware: qcom_scm: Migrate to generic PAS service

With the availability of generic PAS service, let's add SCM calls as
a backend to keep supporting legacy QTEE interfaces. The exported
qcom_scm* wrappers will get dropped once all the client drivers get
migrated as part of future patches.

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c

[ ... ]

> -/**
> - * qcom_scm_pas_metadata_release() - release metadata context
> - * @ctx:	pas context
> - */
> -void qcom_scm_pas_metadata_release(struct qcom_scm_pas_context *ctx)
> +int qcom_scm_pas_init_image(u32 pas_id, const void *metadata, size_t siz=
e,
> +			    struct qcom_scm_pas_context *ctx)
>  {
> -	if (!ctx->ptr)
> -		return;
> +	return __qcom_scm_pas_init_image2(__scm->dev, pas_id, metadata, size,
> +					  (struct qcom_pas_context *)ctx);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_pas_init_image);
> =20
> +static void __qcom_scm_pas_metadata_release(struct device *dev,
> +					    struct qcom_pas_context *ctx)
> +{
>  	if (ctx->use_tzmem)
>  		qcom_tzmem_free(ctx->ptr);

Since the original if (!ctx->ptr) check was removed here, could this result
in calling qcom_tzmem_free(NULL) on error paths?

Client drivers like qcom_q6v5_pas unconditionally call
qcom_scm_pas_metadata_release() during cleanup, even if
qcom_scm_pas_init_image() failed or was bypassed. In these cases, ctx->ptr
would still be NULL.

Calling qcom_tzmem_free(NULL) unconditionally triggers a warning inside the
allocator.

While this is fixed later in the patch series when all callers migrate to
the generic PAS API and the legacy wrappers are dropped, does this
intermediate patch break bisectability by introducing these warnings on
error paths?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518072856.2279=
0-1-sumit.garg@kernel.org?part=3D3
