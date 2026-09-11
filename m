Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91F834388E
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 05:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103345; cv=none; b=QyMY5AD+hMVmRgPStSe4mCfr6pBnD8px2lIAylEFDw4LAQIA7gL/I3taLrnuWvsGlrZNYyVz1ymf7uOevu43Ht4qvJ/H+vs49/5l0rCK2ENB9rukEeEXirzPraxh4Ssi14RnPDCgNGtm4o/neE12W8O8Qs11U7lek1sB6eeU7to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103345; c=relaxed/simple;
	bh=WRYgwQMfqCYU0K6m4EwPNLQnO4AWTkhY1uflBfJet5E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gBWr0CqxF2w5HS6LyPl0CVHDzODgncQhzaUi8tPdgZZboLQ208Tjd23d99GHgsS42bGMck2B5sMa8tPrtX9B++o3v711KNi3uAvCGznRkSqhJPG6c9ePW2wyk/LefBP0XW4wLUEh4c+o9Ii5sTlQ73aQACWSOS8OuB6KfiodjEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwp2KsqP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwp2KsqP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 458221F000FF;
	Fri, 11 Sep 2026 05:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789103343;
	bh=ke7USti3ZaZHtSIZTVxqar1/iRiuOuen0t6yr19i5TM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mwp2KsqP2yOTlhmaW1fmlpUzt4an7lSFyrTspgYfey0X1MH6MgkjPNub5RQfVKLpg
	 a7Jsn9x1BBDnXvwVwiiS8faYIbTAISFynwfX5mqy/wZOVBjxKhFTtqH8YegjVnSJDk
	 cOhQvOAqiiqT+kwaqWLbsNOH8fgAJA9FwbcAkTEdR75m2bpCg/YngBK07+MVi5AaLR
	 JUyijoxc3r1ipUzm/j8/8G/94TJFdV7NS3mHcU8hM9DiqSVEkyvQycFdPqHKljLcAC
	 +zuAApQ88kYLuisr79J5OM+s5fYnmUBDzq7Vhzkb6RRYfrikOfovleGLr0FxORtden
	 PoZeI5doz+/Zg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] remoteproc: qcom_q6v5_pas: Add QMI TMD cooling
 support for Shikra
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dipa Ramesh Mantre" <dipa.mantre@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260911-shikra_qmi_tmd-v1-1-96c1cca82f30@oss.qualcomm.com>
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-1-96c1cca82f30@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 05:09:02 +0000
Message-Id: <20260911050903.458221F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Compilation errors due to missing fields in `struct qcom_pas_data` =
and undeclared identifiers for TMD names.
--

commit b0cce49cb204b7f4f532f2034375d026df2ba65c
Author: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

remoteproc: qcom_q6v5_pas: Add QMI TMD cooling support for Shikra

This commit adds QMI TMD instance IDs and cooling device name arrays for
CDSP and MPSS subsystems on Shikra to enable thermal mitigation support.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index a005546c265d0..3daaed6ca5963 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1660,6 +1660,9 @@ static const struct qcom_pas_data shikra_cdsp_resou=
rce =3D {
>  	.sysmon_name =3D "cdsp",
>  	.ssctl_id =3D 0x17,
>  	.smem_host_id =3D 5,
> +	.tmd_instance_id =3D 0x43,
> +	.tmd_name =3D cdsp_tmd_name,
> +	.num_tmd =3D ARRAY_SIZE(cdsp_tmd_name),

[Severity: Low]
Is this patch missing a prerequisite dependency? It appears the
tmd_instance_id, tmd_name, and num_tmd fields do not exist in the local
definition of struct qcom_pas_data, and cdsp_tmd_name is undeclared. This
currently results in a build regression.

[ ... ]

> @@ -1688,6 +1691,9 @@ static const struct qcom_pas_data shikra_mpss_resou=
rce =3D {
>  	.ssr_name =3D "mpss",
>  	.sysmon_name =3D "modem",
>  	.ssctl_id =3D 0x12,
> +	.tmd_instance_id =3D 0x0,
> +	.tmd_name =3D modem_tmd_name,
> +	.num_tmd =3D ARRAY_SIZE(modem_tmd_name),

[Severity: Low]
Similarly, does this rely on an unmerged patch? The modem_tmd_name array
is undeclared here as well.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-shikra_qmi=
_tmd-v1-0-96c1cca82f30@oss.qualcomm.com?part=3D1
