Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017787;
	b=u4ihrEvNez1Y4uKr5qRs+BmIM+XX/Ez2afBlkV2PrtYwH0YNQVExraEEEy+ZPJJkm0ge
	 SiJyplyyOdQu5DAxvTk8mCrXUrP3hyPRK4HPTnRC6UbR3rKlkFAjE3MrxiC07jdlEy/ku
	 WY6lOZA+8DCi7rqYjOREsIkLbC7Ex1PW2ffflaDPw9G+nackyzVgbKUk6Y0REI95aqbbm
	 AJouO1KTpExUi1vo8aNxTtqxCr0xnvvnHOgwZ1EYpnkKYBcsVZzTtlKEuBe6i6iNYC38w
	 /BBoTTy/nLUmEfnlE1zEm+CX7MeFKaq11sq0weYGyIVrMd0JlvDBHcq8Pj3cue4osMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017787;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SfxkgkklZFDwMiQmRqpsbaDI/SFDH4vGbJf1ROYYmDM=;
	b=WI9Sv1pOjw5SVWf4mPnBI/OcJXjn4u2MfvouXxfVQxj7JV93RIibWFpQ1TG3xU4/Ug6v
	 I1fasekkpq3UTfB+CdG/mCKHjK196sWnzfEN82DAyM14aRClxC7ekXELUKQORnT7wq30q
	 y2R1Ek9LYPj4xc3DPgfQTW6/Wxozwmw5YoZ2BSl/l/h2yF/HULj883Ly4abVXm3u/DrNk
	 fCDcJQ+pQLn87Vb1cQQGiHY7iqV+Zh2LYv1/AK2a+UStL7FFydrs2eOciijHnYYjW+Jwb
	 ouTRFzX8roD85jvu+6+Ti6erqyQccBz9axNuvdFrwJBckHU9oc4a8N15OWstOaOBX1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iUMKDXME;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBA0606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iUMKDXME
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FD71F000C4;
	Wed, 18 Nov 2026 16:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017787;
	bh=SfxkgkklZFDwMiQmRqpsbaDI/SFDH4vGbJf1ROYYmDM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iUMKDXMEWEYAkXnQ/zf0rZ4XxfMSQDnfVwuEWZWayhr5x8mXYz3d/bieSfAIsCVmR
	 mGnxEwQqEaKOaE90Oyjl8njLpag1BgWfIQ28e7yQnzb7bZtJTulOnuOSNE42sKxywh
	 lBO4ITX/UP4UeslHpi7vhqHZ0ZHL4pkBuDjV977RaKrIQtGaz0Q+8nqmSvD3WgsZaK
	 z9q/K3zW5FfAhoYVoJ1uvz9Qj289z4FjVCxuQv4Rq9uL+ypLqQ2am/1Qhw+JN+WeJt
	 J1gpH32OXwX0uXb/jsY0qvagRFF9LgQEDkjRCC/ZYLuJpYPh5Llab5ciwH+8hs7o5D
	 rzZJ070f8McBA==
Message-ID: <sashiko-outbox-221408@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] remoteproc: qcom: pas: Add coredump support for
 secondary processors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-oob-support-glymur-v3-3-2cbdfe208d56@oss.qualcomm.com>
References: <20261118-oob-support-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com>
 <20261118-oob-support-glymur-v3-3-2cbdfe208d56@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 16:03:06 +0000
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
- [Medium] remoteproc: qcom: pas: duplicate dump segments in
  qcom_pas_load() on recovery
- [Medium] remoteproc: qcom: pas: secondary coredump after masked
  shutdown failure
--

commit 18ab6cc078bc90d357be63c7984c43a899ef428d
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

remoteproc: qcom: pas: Add coredump support for secondary processors

This commit adds coredump support for PAS remoteproc instances with a
secondary processor by registering dump segments for the secondary
firmware and mapping the secondary carveout during coredump collection.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 1c8c0c22c34d1..a167bd6072c94 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -336,6 +342,17 @@ static int qcom_pas_load(struct rproc *rproc, const =
struct firmware *fw)
>  		}
>  	}
> =20
> +	if (pas->secondary_pas_id) {
> +		ret =3D qcom_register_dump_segments(rproc, pas->secondary_firmware);
> +		if (ret) {
> +			dev_err(pas->dev,
> +				"failed to register secondary dump segments: %d\n", ret);
> +			rproc_coredump_cleanup(rproc);
> +			qcom_pas_release_firmware(pas);
> +			return ret;
> +		}
> +	}
> +
>  	return 0;
>  }

[Severity: Medium]
Does registering secondary dump segments in qcom_pas_load() append
duplicate rproc_dump_segment entries to rproc->dump_segments on every
crash recovery?

Primary dump segments are registered in qcom_pas_parse_firmware(), which
runs only during rproc_fw_boot().  On crash recovery,
rproc_boot_recovery() runs rproc->ops->coredump() and then calls
rproc_start() -> rproc_load_segments() -> qcom_pas_load() without
clearing rproc->dump_segments, so each recovery allocates and appends
another copy of the secondary segments and produces corrupted coredump
ELFs with duplicate PT_LOAD headers.  In addition, if
qcom_register_dump_segments() fails here during recovery,
rproc_coredump_cleanup(rproc) wipes the primary segments that were
registered at initial boot and will not be re-registered on later
recoveries.

[ ... ]

> @@ -748,11 +787,28 @@ static void qcom_pas_coredump(struct rproc *rproc)
>  {
>  	struct qcom_pas *pas =3D rproc->priv;
> =20
> -	pas->mem_region =3D qcom_pas_ctx_map(pas->pas_ctx);
> +	if (list_empty(&rproc->dump_segments))
> +		return;
> +
> +	if (!pas->mem_region)
> +		pas->mem_region =3D qcom_pas_ctx_map(pas->pas_ctx);
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
Can rproc_coredump() read pas->secondary_mem_region while the secondary
carveout is still locked by TrustZone or the hypervisor if shutting down
pas->secondary_pas_id failed?

rproc_boot_recovery() only skips coredump when rproc_stop() returns an
error, as fixed for primary and DTB PAS IDs in commit 9db31edf92dd
("remoteproc: qcom_q6v5_pas: Fix error masking in qcom_pas_stop()").
However, qcom_pas_stop() overwrites the return value of
qcom_pas_shutdown(pas->secondary_pas_id) with the subsequent shutdown
calls:

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_stop() {
	...
	if (pas->secondary_pas_id) {
		ret =3D qcom_pas_shutdown(pas->secondary_pas_id);
		if (ret && pas->decrypt_shutdown)
			ret =3D qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
		if (ret)
			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);
	...
	}
	...
	ret =3D qcom_pas_shutdown(pas->pas_id);
}

If the secondary shutdown fails while the primary shutdown succeeds,
qcom_pas_stop() returns 0 and rproc_coredump() reads the still-protected
secondary carveout, triggering an XPU or stage-2 access violation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-oob-suppor=
t-glymur-v3-0-2cbdfe208d56@oss.qualcomm.com?part=3D3
