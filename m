Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE2F1DFDA1
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 19:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782328936; cv=none; b=WacLRuW4loX5zevjfKTEAwXLmVvbs2H9IyQzKcfzTvDk9jXru6WhVUudBs00f6iCNRww5Y881fbWAAGaLbliUCL4wFWV4w6IvosAmwjOItVvhsKMb/LKwVeWh1VFSs9LJAL4fGx9O5BS+vW8912x+nQutUFhqxwMNaiLIha8srs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782328936; c=relaxed/simple;
	bh=LPlwRgr3R6Iq+VFR1nRnFqkR3KA9gixuhZ0y50vwQWI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Y7IipXDKzpgbq4f14SCxWOhdSMfMTmtGydyo7F8992SIRnQHY7IJXcCEIR9+8tBbtGHnhYk7MefepY0g4T6uV9dpYaU4m/pcqgRqweB8zVJSZ12sGuW5xzEGFnZtDmVKEk8WBDSdJ4Bt270Co4IiGmBIG3KqD/d2vAUxVLhpg2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJqVpKsc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJqVpKsc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82691F000E9;
	Wed, 24 Jun 2026 19:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782328934;
	bh=UoJHW8Ch9EwAdlMkqlm99jwUFEIhz+iF8LKOGntv4+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VJqVpKsc8iHJWgvPWLUULxWaFhls4iXqEwi1Ji1E4fMR24aQ2EQxWW/DNmfkfuuzY
	 11ZUgxZH6ADXdK/h3WgbOINyYObtMOMXbWLy02mIhj11ZBPtuFKTrDxaOMmu/mt3G3
	 YTcYxacofL3dI/2Ot+1bcRDkbhLUxFMh+j7ec7KXT8mPm6tUkEExVoZaXYjorTAqgl
	 ZWsO7lIswxoeRedTWo+CaIfCuNuPLw7BZvz8AMjoxnppxmu6tI1njd17ezZRC6Fofc
	 bzA5Y9FuSFjNPYByo4rCOWhzQZVtvrSjBFTdmy7xEmBkO2Jw7fw5du1eEq8nmAmc/y
	 1G9xfHpe4ZNFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 04/19] firmware: qcom: scm: use dev_err_probe() for
 dload address failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mukesh Ojha" <mukesh.ojha@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260624190830.3131112-5-mukesh.ojha@oss.qualcomm.com>
References: <20260624190830.3131112-1-mukesh.ojha@oss.qualcomm.com>
 <20260624190830.3131112-5-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 19:22:13 +0000
Message-Id: <20260624192213.C82691F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The global `qcom_tzmem_dev` pointer is set during `qcom_tzmem_enab=
le()` but is never cleared on probe failure, causing subsequent probe retri=
es to permanently fail with `-EBUSY`.
- [High] The probe function calls `of_reserved_mem_device_init()` but does =
not call `of_reserved_mem_device_release()` on subsequent error paths, lead=
ing to permanent probe failure or resource leaks upon probe retry.
--

commit 6dc15526252b78a9c217f06ed35ed4966a794450
Author: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

firmware: qcom: scm: use dev_err_probe() for dload address failure

Replace the bare return ret after qcom_scm_find_dload_address() with
dev_err_probe() to produce a consistent, deferred-probe-aware error
message when the download-mode address cannot be resolved.

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index c8a84836887f0..6cd4d9468456f 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -2750,7 +2750,8 @@ static int qcom_scm_probe(struct platform_device *p=
dev)
>  	scm->dev =3D &pdev->dev;
>  	ret =3D qcom_scm_find_dload_address(&pdev->dev, &scm->dload_mode_addr);
>  	if (ret < 0)
> -		return ret;
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "Failed to get download mode address\n");
> =20
>  	mutex_init(&scm->scm_bw_lock);

[Severity: High]
This is a pre-existing issue, but does qcom_scm_probe() properly release
resources on later probe failures?

Later in qcom_scm_probe(), of_reserved_mem_device_init() is called to setup
reserved memory:

drivers/firmware/qcom/qcom_scm.c:qcom_scm_probe() {
	...
	ret =3D of_reserved_mem_device_init(scm->dev);
	if (ret && ret !=3D -ENODEV)
		return dev_err_probe(scm->dev, ret,
				     "Failed to setup the reserved memory region for TZ mem\n");
	...
}

However, subsequent error paths, such as platform_get_irq_optional() return=
ing
-EPROBE_DEFER, exit directly without calling of_reserved_mem_device_release=
().

If the probe is deferred, will this cause the next probe attempt to fail wi=
th
-EBUSY, or leak memory by duplicating the rmem_assigned_device list entry on
every retry?

[Severity: High]
This is a pre-existing issue, but does qcom_tzmem_enable() cause a permanent
probe failure if qcom_scm_probe() defers later in the function?

qcom_tzmem_enable() sets a static qcom_tzmem_dev pointer in qcom_tzmem.c:

drivers/firmware/qcom/qcom_tzmem.c:qcom_tzmem_enable() {
	if (qcom_tzmem_dev)
		return -EBUSY;

	qcom_tzmem_dev =3D dev;

	return qcom_tzmem_init();
}

Since qcom_scm_probe() does not clear this pointer if it defers after this
call, will subsequent probe retries permanently fail with -EBUSY when
qcom_tzmem_enable() checks the still-set pointer?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624190830.3131=
112-1-mukesh.ojha@oss.qualcomm.com?part=3D4
