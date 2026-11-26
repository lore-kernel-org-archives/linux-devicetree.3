Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678648;
	b=cXCmDWs2Ozs+KVvj/OXBaPlNbVQMIDjDAkNiNXbgEV+LYnn9dzgn4aAdPG0IjMKpxwat
	 gw+2tE4AmOmbU+a5FwWi3Jv5bWXDGWwp07OAe5C013uXl6gsAgix4Ue5wti3j8lUQ02jf
	 Ry4nXU7oVUMgSGnRAeK64N75OTCR8eLIb6BIQJp4k77wVhv7Q/vNRydhy09KrEhfewhOE
	 9qFyF50gs3FPdBQpDqOjAaRHbik+rtsTLw6KCDmc0yqjvy24FcYkFKOJZ3mC8kbVn09oN
	 tCUm/XKJBz6gyywvy+3VTRpHHMgGsBaMZxoi8vkoMtZ0LdSkXVrbLnt3q8OqPTk/wgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678648;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oOGf7KAPLK/rsS2lJgQdqknjMetzjvTiovAER7aNfEw=;
	b=HznczIGRnRLhlDkGOf9qZizrdmO8H6/V3WHNCarMsOTOW1+8zPMlD+erJ4bNO19WcOnO
	 uQNE7rFqgAO+I/y/aXZviMn/mObMyA6NHtlCFVd49YGbJ+TeZGoquY8Q9OYuZw+WQnKQi
	 jwiUfwDfbUuF6yssACzMGRYrFoDWIjmTceipMTd+wthG5VVXvxv/raUEk0gUKa503Ul1P
	 Ot/oWxkI9Ah923lll9NWA/d9o3Szx/8cQ7ex78HsRwq/i94M3JmpTlGxzXNz+UgCo1DT8
	 iPSJ8+P3c6MiiLNSoC3eeSr8u2+EBErXZR9mIFBxNba8UB9sa8fUIkxiPFbobCueRvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LRJ8Vqnr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6F9606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LRJ8Vqnr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367251F000C0;
	Thu, 26 Nov 2026 07:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795678648;
	bh=oOGf7KAPLK/rsS2lJgQdqknjMetzjvTiovAER7aNfEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LRJ8VqnreOi/V2q97hNYHrGO0SLV1+Bz8sCqnQPHctJEqzEUuHCIHhHeBZtgA/Htl
	 q4yPEXPhOOXSqiUSOGyL4i9ILA2zwojjBY7+dieGATCche36E9gfwmwHb9nZHQ8Td5
	 J3hstAUA4gojTjvcqLNJ+EvuP4rZVQ4aHJJBZPbQK9mJBa9/3aevFDEkJds9cEQhVQ
	 +yl57P7WqYUCF7f4VgtMUTBtDSTZLs2HhwBrxtpCidUaY0OizinzWNpeOHCoT5w8WD
	 TA86wsZZLVk+atH3COTPgJkj9enW5EYs3gwto3JtXbbolwfFKo9a5GbtqcTqqa/MjS
	 Ys3aZ3u7Do1Ng==
Message-ID: <sashiko-outbox-234963@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-oob-support-glymur-v4-3-ad4ec5dd4b0a@oss.qualcomm.com>
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
 <20261126-oob-support-glymur-v4-3-ad4ec5dd4b0a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:37:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] remoteproc: qcom: pas: secondary coredump after masked
  qcom_pas_stop() error
--

commit b35e3edb6dd10b71c4535134032bc2aa2b922d43
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

remoteproc: qcom: pas: Add coredump support for secondary processors

This commit adds coredump support for secondary processors by registering
their dump segments, translating secondary carveout addresses in
qcom_pas_da_to_va(), and mapping the secondary carveout during
qcom_pas_coredump().

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 1e51371e445f3..1e55b00357c80 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -748,11 +800,27 @@ static void qcom_pas_coredump(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas =3D rproc->priv;
> =20
> +	if (list_empty(&rproc->dump_segments))
> +		return;
> +
>  	pas->mem_region =3D qcom_pas_ctx_map(pas->pas_ctx);
>  	if (!pas->mem_region)
>  		return;
> =20
> +	if (qcom_pas_has_secondary(pas) && !pas->secondary_mem_region) {
> +		pas->secondary_mem_region =3D
> +			qcom_pas_ctx_map(pas->secondary_pas_ctx);
> +		if (!pas->secondary_mem_region)
> +			dev_err(pas->dev, "unable to map secondary memory for coredump\n");
> +	}
> +
>  	rproc_coredump(rproc);

[Severity: Medium]
Can rproc_coredump() read a still-locked secondary carveout if shutting
down pas->secondary_pas_id fails during crash recovery?

In rproc_boot_recovery(), rproc_stop() runs before rproc->ops->coredump()
and aborts recovery before the coredump only when rproc_stop() returns a
non-zero error.  However, qcom_pas_stop() overwrites the return value from
shutting down pas->secondary_pas_id and pas->secondary_dtb_pas_id with the
result of shutting down pas->pas_id:

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_stop() {
    ...
	if (pas->secondary_pas_id) {
		ret =3D qcom_pas_shutdown(pas->secondary_pas_id);
		if (ret && pas->decrypt_shutdown)
			ret =3D qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
		if (ret)
			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
    ...
	if (pas->secondary_dtb_pas_id) {
		ret =3D qcom_pas_shutdown(pas->secondary_dtb_pas_id);
    ...
	ret =3D qcom_pas_shutdown(pas->pas_id);
    ...
}

If the secondary PAS shutdown fails while the primary PAS shutdown
succeeds, qcom_pas_stop() returns 0 and qcom_pas_coredump() proceeds to
map and read the secondary dump segments while the secondary carveout is
still locked by TrustZone or the hypervisor, triggering an XPU or Stage-2
access violation.  Preserving secondary shutdown errors in qcom_pas_stop()
(as done for dtb_ret) would prevent rproc_boot_recovery() from dumping a
locked secondary region.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-oob-suppor=
t-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com?part=3D3
