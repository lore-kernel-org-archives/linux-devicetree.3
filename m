Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDC838A29A
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163077; cv=none; b=sn4Ruql0UqBqs5v+WTB7r0sgx1bfsCgfsNutYEsYLk1MtR89pJRS6A5VSm/cV2+fjGsatCtCrRp8NHcs4jj4OqWHtRPaS9NYbUwwWsgYKpX9SV3ZMlF1tusRHG/FnBFrpLlcRFUQU4vxfdBI2FuW6f2bHozujB5c9B589UGWD/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163077; c=relaxed/simple;
	bh=8eJ7mKfM3HEq/9yG4DCU7h5MS0cQnJ5gUc97Tn7Ym6s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pVqip6KQ82MkClh3qq6jlMxmTRq6V+vlS2Jd7h+MWFv0+b/lKn5lLWIxHt5BbKfFHY8V2zpeWxz+qjDtlgt4ZNLjLik+ZuWKsSyevf1ZWXFb6OLnd/8XyynaPbJYqwJZprswaGuYSdVYBVYZQThaWedkZEcVJVzovNSJixB3B2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eSwJDFYZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eSwJDFYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6C51F00A3A;
	Mon, 27 Jul 2026 14:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785163071;
	bh=lqHY9L4JVgO+uXILv6FZQX/+bnB5rX8NOv4mEwcyEKA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eSwJDFYZlp67yZiKjNP1tMjotssC9oX8mpSoFKbtIHoBWIXH36M38ijP2N829eEDJ
	 yvt28wKY/+3GvSe2HUSFBSYzvBUero0gVkakCcpdu9r/IiHPPh7pqKHvvHzI6IRDK8
	 cX2GmJ4ehBIoQOlvFpP5GwN3NaAMCub6TJKt/VjEIxDNVfwl41+nlieP0nlXbnu/ck
	 D7P+thmtVwdAcByjaR3WNCRWzkigchjeJJqTNP5KpsWK6SxWGm3AcqLXJ2ddlu2c13
	 vp3dCFJlaokRYQJ3Z8sevLtCheyK7e1xae/XSWRh0q6CGEozBEIrcnbpTo2DaBYTL1
	 4W//z9OvisHcg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/9] remoteproc: qcom: pas: add support for TMD
 thermal cooling devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260727-b4-qmi-tmd-v6-3-973cd3a226af@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-3-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 14:37:51 +0000
Message-Id: <20260727143751.8E6C51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incorrect teardown order of the TMD client relative to the remotepr=
oc device in `qcom_pas_remove()`.
--

--- Patch [3]: [PATCH v6 3/9] remoteproc: qcom: pas: add support for TMD th=
ermal cooling devices ---
commit 96a80a2d7479048c20fb270197f15552907de3de
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

remoteproc: qcom: pas: add support for TMD thermal cooling devices

This commit registers Thermal Mitigation Devices (TMDs) for PAS-managed
remote processors to enable thermal throttling through QMI.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 25599d7282083..07336a2d75f73 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -960,6 +1045,9 @@ static void qcom_pas_remove(struct platform_device *=
pdev)
>  	if (pas->bam_dmux)
>  		of_platform_device_destroy(&pas->bam_dmux->dev, NULL);
> =20
> +	if (pas->tmd_inst)
> +		qmi_tmd_exit(pas->tmd_inst);
> +
>  	rproc_del(pas->rproc);

[Severity: Low]
Does this sequence unregister the thermal mitigation cooling device in the
wrong order?

Looking at qcom_pas_probe(), qcom_pas_setup_tmd() is called before rproc_ad=
d().
Should qmi_tmd_exit() be called after rproc_del() in qcom_pas_remove()
to maintain strict reverse-initialization ordering?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-b4-qmi-tmd=
-v6-0-973cd3a226af@oss.qualcomm.com?part=3D3
