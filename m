Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72DC83CC315
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080172; cv=none; b=mensBEUVSdR1Mwgm12NbHuImdrjw0OHV3mMHtyWPF8Ae1eTpz9qo/OF151P6Nq7tEB95C0If4D7Z8YvudfuT2ZV9XfYEKXtzeBAC6tr6HLI/XHVB/hlQAwaF1kdsVOfOe+sX5ZsFR1A30/tL9aYnN5rTkQui035224kXR0S0ANY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080172; c=relaxed/simple;
	bh=ggRStb4HgUJvhugFGDYMmK6PVC19pawPQOW6T9gR8lE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FqOMCfRbDbrLcHWMLlxAoCjpv2qt0oRc7+sgmziKU4MvhEGa4FBWH/GAV4WhWXaB5uItbnM8w5e2yNqzvUAdAswJSXfwzllhRz7kHuIJd0S2fmZPTeLireAHduKKFcM7if2dK+2RTfL+IQ5RdJXgG1J2RS1u/aooQxeiuSbuKCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEaz75B7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEaz75B7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E049F1F00A3A;
	Fri,  3 Jul 2026 12:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783080171;
	bh=TsrwiKW1voSugbsio658mK865DCUVG5jBEiRTvO/Alc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LEaz75B7S5FbOve8FF+U/ffc/KWfrQzj8IAYtKVRU6CtF/sBLHKETpocDLzwGpq6i
	 7X1Nu4SngW9eAuSEGqdDVcOPAmRNXiZXjg3PtyMoJShxg8yOKn2QJMayci2KafY40X
	 n4YtoKYxrRTI2C7yQDcE31uvy1fXZYmWdHu5g+J+S1+tamgkg9uQ0X31Rh22/0xPCR
	 /L3qdK//jkXDc6cz249Ysi2JEs+bwD1unSjj1pKJhYYflGMhJ1DZGKApPMrKATbeoE
	 DASbjfE8MUvFBaXSHNmfg8/vd3uP9qRzMzsZxFOfoOJdPaEiDNQfQjfOdXwLyWiV14
	 TU7BZ254ZN0Ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 13/14] firmware: qcom_scm: Remove SCM PAS wrappers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Garg" <sumit.garg@kernel.org>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260702115835.167602-14-sumit.garg@kernel.org>
References: <20260702115835.167602-1-sumit.garg@kernel.org>
 <20260702115835.167602-14-sumit.garg@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 12:02:50 +0000
Message-Id: <20260703120250.E049F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Time-of-check to time-of-use (TOCTOU) race condition in PAS API wr=
appers leading to potential NULL pointer dereference.
--

commit 979ccc647befac000888b4c5f41818fc1037d4ff
Author: Sumit Garg <sumit.garg@oss.qualcomm.com>

firmware: qcom_scm: Remove SCM PAS wrappers

Now since all the Qcom SCM client drivers have been migrated over to
generic PAS TZ service, let's drop the exported SCM PAS wrappers.

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 7933e55803dc2..1deee6aea3874 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the new
generic PAS TZ service usage, I noticed a potential race condition in the
API wrappers in drivers/firmware/qcom/qcom_pas.c:

drivers/firmware/qcom/qcom_pas.c:qcom_pas_init_image() {
    ...
	if (!ops_ptr)
		return -ENODEV;

	return ops_ptr->init_image(ops_ptr->dev, pas_id, metadata, size, ctx);
}

Since ops_ptr is a global pointer and isn't accessed with READ_ONCE() or
protected by a lock, could the compiler generate multiple loads?

If a PAS backend is unbound and qcom_pas_ops_unregister() sets ops_ptr to
NULL concurrently, can this lead to a NULL pointer dereference when
accessing ops_ptr->init_image or ops_ptr->dev?

The same pattern appears in other wrappers as well:

drivers/firmware/qcom/qcom_pas.c:qcom_pas_metadata_release() {
    ...
	if (!ops_ptr || !ctx || !ctx->ptr)
		return;

	ops_ptr->metadata_release(ops_ptr->dev, ctx);
}

Should these wrappers use READ_ONCE() or some form of synchronization to
ensure safe dereferencing of ops_ptr?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702115835.1676=
02-1-sumit.garg@kernel.org?part=3D13
