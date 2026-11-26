Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678131;
	b=lvBqONFTAaHcN8KpLT/RIKAsAIfavvUl1tTi0XAUS9Rl8OXT1xGunMFf97nm/yhLJd+1
	 Gfto3pkvEjjMUO3HjZuLt+Amk3w6u3aluN3ZBrihY1H+ABXY5igmazmlaJs4er1LCJDrv
	 jAvcpGmOPEGm0SAziPBeXiwMOyVkfwxzAXg8aN9KErRtUyGDrM5dnJldJIBWZyQq9rMyN
	 cnNzDtovDMcj97h5JnFD2gWzyiJQRthEezdJtRmrOKXPJSZJFnJEfY7m1CXQQMOBSG5Gy
	 MznLfji4AoldFvoQDmJRef2otIBBSOeoYLhI7lkOv8ZXv/LU9/qIhBhgp4LVppNzYUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678131;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DyOSJX986Z4RQQbKW8xrcE+PJ5PRKBKUU/4ul9Dz3/8=;
	b=Z/XrO5Ne6K6Q4Dg0XSRM1O7ZR81P55cnp6s3/uzbjVasFWHnRIXbkn1VZAw6I0O0ayHZ
	 jLH/vqUQhvsNRKn6GVN9d//hfJzUkSdIq5Y91lS9+hKHOAjxQSrIvxMxeUKUnfVUg4AaY
	 QFt0rn2arg8/b4lR5W/S0OVMefhqb6cAjRJ75y3Tv5JFjwTEKoopE2viO+ZGTSdUr/Ebw
	 oBdUlJUnwr1LUii9XtCCSJV/M+aYYarkzZt+8o+2/V2kf1+oECbo8ypCTyAnsXxxAbmEK
	 kmPCdN1Jon4aj/N7F0bogGNbRxjeGv/qYNpZYqDFTEqoZ+rHwP7Uh64b8GQaeOqGjUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="jXzLhI2/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F8B606A327
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jXzLhI2/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC85D1F00ADE;
	Thu, 26 Nov 2026 07:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795678131;
	bh=DyOSJX986Z4RQQbKW8xrcE+PJ5PRKBKUU/4ul9Dz3/8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jXzLhI2/4MEtBBnDab8hn1KAxZP5EABPUnt3TA2kQuWR5w467QrQRbQiKRLzliNuy
	 +yCyzY1HYZsn+tcgjjlXlY0ASlng85spsxHVyi8oGjZOxY7bIi8WjLQaDZL9izxL1o
	 Q390SgldmToXeNKSFmsvrxGZKN797EHvFfUhKS1Cp5+GyelESTV2HHfQ6JkrvwXkxM
	 nd/MwtfdHJ7dVI4jMqKKHCausolbEvZRtDwmxwoR7b2+6hle99KDQkFj9CrsIOhVuX
	 TOD1uZGMDJFKWd0Te7RxEL4Ek1X9BWMvFNFqAndZ5telTCXDI+6up0rv9N9ndQE9ts
	 SotUo4osVmJXw==
Message-ID: <sashiko-outbox-234955@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] remoteproc: qcom: pas: Add Glymur OOBMSS PAS
 parameters
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anvesh Jain P" <anvesh.p@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261126-oob-support-glymur-v4-4-ad4ec5dd4b0a@oss.qualcomm.com>
References: <20261126-oob-support-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com>
 <20261126-oob-support-glymur-v4-4-ad4ec5dd4b0a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 07:28:50 +0000
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
- [Medium] remoteproc: qcom: pas: secondary shutdown errors lost in
  qcom_pas_stop()
- [Medium] remoteproc: qcom: pas: firmware leak after qcom_pas_load() on
  start error
- [Medium] remoteproc: qcom: pas: missing decrypt shutdown poll in
  qcom_pas_start()
--

commit eeb577211ecb1e7bd112a3fc4d396f7f8f51017c
Author: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

remoteproc: qcom: pas: Add Glymur OOBMSS PAS parameters

This commit adds PAS resource parameters and the corresponding OF match
entry for the Glymur OOBMSS subsystem, including primary and secondary
firmware, DTB PAS IDs, and decrypt_shutdown support.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 1e55b00357c80..a0807615b0e7f 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -2194,6 +2194,30 @@ static const struct qcom_pas_data kaanapali_soccp_=
resource =3D {
>  	.early_boot =3D true,
>  };
> =20
> +static const struct qcom_pas_data glymur_oobmss_resource =3D {
> +	.crash_reason_smem =3D 669,
> +	.firmware_name =3D "oobmss_tee.mbn",
> +	.dtb_firmware_name =3D "oobmss_qc_dtb.mbn",
> +	.secondary_firmware_name =3D "oobmss_ns.mbn",
> +	.secondary_dtb_firmware_name =3D "oobmss_oem_dtb.mbn",

[Severity: Medium]
Can this leak pas->secondary_dtb_firmware, pas->secondary_firmware, and
pas->dtb_firmware if startup fails after qcom_pas_load() succeeds?

qcom_pas_load() requests those firmware blobs, but
qcom_pas_release_firmware() is only called in qcom_pas_start() under the
disable_irqs label and on successful start.  If rproc_prepare_subdevices()
fails in rproc_start() before rproc->ops->start() is called (where cleanup
only runs qcom_pas_unprepare()), or if qcom_q6v5_prepare() fails at the top
of qcom_pas_start(), the three firmware objects are never released and
pas->firmware is left non-NULL:

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_start() {
    ...
	ret =3D qcom_q6v5_prepare(&pas->q6v5);
	if (ret)
		return ret;
    ...
}

> +	.pas_id =3D 0x42,
> +	.dtb_pas_id =3D 0x43,
> +	.secondary_pas_id =3D 0x44,
> +	.secondary_dtb_pas_id =3D 0x45,

[Severity: Medium]
Does qcom_pas_stop() drop shutdown errors from pas->secondary_pas_id and
pas->secondary_dtb_pas_id when pas->pas_id shuts down cleanly?

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_stop() {
    ...
	if (pas->secondary_pas_id) {
		ret =3D qcom_pas_shutdown(pas->secondary_pas_id);
		if (ret && pas->decrypt_shutdown)
			ret =3D qcom_pas_shutdown_poll_decrypt(pas->secondary_pas_id);
		if (ret)
			dev_err(pas->dev, "failed to shutdown secondary: %d\n", ret);

		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
					pas->secondary_mem_size);
	}

	if (pas->secondary_dtb_pas_id) {
		ret =3D qcom_pas_shutdown(pas->secondary_dtb_pas_id);
		if (ret)
			dev_err(pas->dev,
				"failed to shutdown secondary dtb: %d\n", ret);

		qcom_pas_unmap_carveout(rproc, pas->secondary_dtb_mem_phys,
					pas->secondary_dtb_mem_size);
	}

	ret =3D qcom_pas_shutdown(pas->pas_id);
    ...
}

Unlike the pas->dtb_pas_id shutdown below it, which preserves an earlier
error instead of overwriting ret, both secondary shutdown results are
overwritten by qcom_pas_shutdown(pas->pas_id).  During
rproc_boot_recovery(), rproc_stop() returning 0 lets recovery proceed to
qcom_pas_coredump(), which maps and reads pas->secondary_mem_region while
the secondary carveout may still be locked by PAS.

> +	.proxy_pd_names =3D (char *[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name =3D "oobmss",
> +	.sysmon_name =3D "oobmss",
> +	.ssctl_id =3D 0x21,
> +	.auto_boot =3D true,
> +	.early_boot =3D true,
> +	.needs_tzmem =3D true,
> +	.decrypt_shutdown =3D true,
> +};

[Severity: Medium]
With decrypt_shutdown enabled, do the error paths in qcom_pas_start() leave
pas->pas_id or pas->secondary_pas_id only partially shut down?

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_start() {
    ...
	if (ret =3D=3D -ETIMEDOUT) {
		dev_err(pas->dev, "start timed out\n");
		qcom_pas_shutdown(pas->pas_id);
		goto unmap_carveout;
	}
    ...
	if (pas->secondary_pas_id)
		qcom_pas_shutdown(pas->secondary_pas_id);
unmap_secondary_carveout:
	if (pas->secondary_pas_id)
		qcom_pas_unmap_carveout(rproc, pas->secondary_mem_phys,
					pas->secondary_mem_size);
    ...
}

On platforms with decrypt_shutdown, the first qcom_pas_shutdown() call only
initiates decryption and returns -EINVAL until shutdown completes, which is
why qcom_pas_stop() follows up with qcom_pas_shutdown_poll_decrypt().  If
qcom_q6v5_wait_for_start() times out, or if starting pas->dtb_pas_ctx or
pas->pas_ctx fails after pas->secondary_pas_ctx has been authenticated and
reset, qcom_pas_start() unmaps the carveouts and disables clocks,
regulators, and power domains without polling
qcom_pas_shutdown_poll_decrypt().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-oob-suppor=
t-glymur-v4-0-ad4ec5dd4b0a@oss.qualcomm.com?part=3D4
