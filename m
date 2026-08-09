Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514652FBE
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786279568; cv=none; b=LyFFjB9cjry8dORDhm8lsawjzq/8nkvruomZcfMIpf27BbSQfwZBgYEqDsG7l+Em6rpeSMHn4lqok6AFQAMvsJ88noK+sjC6blK9GWSievBUjyoFDPL2AL99UQSR+N24UuRdvnYkCPxJcZO3fZLaO3JrUEwj4mD5rtn4d9YFrm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786279568; c=relaxed/simple;
	bh=E4mIkrOijwheGpzV4sSB4jDm6xJjhAXaY0u6MfhVbXs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FKX6+qLmlvKC7x2l0vVMkg8fvKCSwRBCaK6AeB//PnptEc4mx8YzFtyzUWpNocLTI9EUJCKZZM8DLhFHQvdwnqmqlgydMh3C2qbfUHmRRBTzR+uUO5XlzpJf1BmORkYvirn8QxdpTfoeaWVbuZpnP39wM5MRHWLoSOOw7OLRgwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=njF3ooKA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="njF3ooKA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B433C1F000E9;
	Sun,  9 Aug 2026 12:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786279567;
	bh=PuY6XYVsBKmlkMmlZG3HMGDY88bTiUiUEWDAjQSv+c4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=njF3ooKA4IOO/MIJts7636wfOPCZD9AZtV9RslLJ28Xq8t8PMzW6RwppcdA8wMQPe
	 1+z8TFhrC/4P0jcTapKQ0krVtxBSkQ5OnVLSpXy18YsIfuEqfyon7f1cKpxUJIiYFb
	 NLXGSOMWOVif8NSCw3F7o57gAvLhAaXiKwz6Xvc+PyoLvqK6OueTFHELbWIlYUQa0J
	 IBVYk+329MU/Oow1Xn26e8eFmY/GXvL+X0lZpeTWtluDX8E1gLXa1JPuukF9CPSEs7
	 n0u0j5JHDufxcBwvuyBH7vWDI09pm4siKJrI1ohute4+d6LNmT7pczcmCuWuLGhRYb
	 P83RPHY7Y/QsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/9] remoteproc: qcom_q6v5_pas: enable QMI TMD
 cooling support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260809-b4-qmi-tmd-v8-4-b15d47adc379@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-4-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 12:46:06 +0000
Message-Id: <20260809124606.B433C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The dtb firmware requested in `qcom_pas_load()` is leaked on the s=
uccess path.
--

--- Patch [4]: [PATCH v8 4/9] remoteproc: qcom_q6v5_pas: enable QMI TMD coo=
ling support ---
commit 58dbaa804b582ef4740c9e6df30c9004a8e9ffae
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

remoteproc: qcom_q6v5_pas: enable QMI TMD cooling support

This commit enables Thermal Mitigation Device (TMD) support for PAS-managed
CDSP and modem remote processors on platforms exposing the QMI TMD service.
It adds per-platform TMD configurations and uses endpoint names for cooling
device registration. This allows the subsystems to act as cooling devices
in the thermal framework.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 24a766718b107..732fe2961a965 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c

[ ... ]

> @@ -1366,6 +1387,9 @@ static const struct qcom_pas_data x1e80100_cdsp_res=
ource =3D {
>  	.ssr_name =3D "cdsp",
>  	.sysmon_name =3D "cdsp",
>  	.ssctl_id =3D 0x17,
> +	.tmd_instance_id =3D 0x43,
> +	.tmd_name =3D cdsp_tmd_name,
> +	.num_tmd =3D ARRAY_SIZE(cdsp_tmd_name),
>  };

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing it I
noticed a pre-existing memory leak in qcom_pas_load() that affects
devices like the x1e80100_cdsp_resource modified here.

When dtb_pas_id is set, qcom_pas_load() allocates dtb_firmware but
fails to release it on the success path:

drivers/remoteproc/qcom_q6v5_pas.c:qcom_pas_load() {
...
	if (pas->dtb_pas_id) {
		ret =3D request_firmware(&pas->dtb_firmware, pas->dtb_firmware_name, pas-=
>dev);
...
		ret =3D qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
		if (ret) {
			qcom_pas_metadata_release(pas->dtb_pas_ctx);
			release_firmware(pas->dtb_firmware);
			return ret;
		}
	}

	return 0;
}

Can this leak the pas->dtb_firmware buffer on successful loads since
release_firmware() is only called in the error path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-b4-qmi-tmd=
-v8-0-b15d47adc379@oss.qualcomm.com?part=3D4
