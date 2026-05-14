Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5408367298
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778754230; cv=none; b=AZHEj7BIlkhKoyuQ/s3N2IDI9zD+IzwWHjYKHBcLjfIsRBw/FWsl4n9uvMMTd4C6YiUC91xHb8D2U7SiozCZVlIlVb/Z8aOFiN+CM+mnVbw6mcMN6vHIrPVc5h+5CDGcbEOQvbhufSdD5K5je3S1l9LD30VXWmdVmMx4Jmw91ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778754230; c=relaxed/simple;
	bh=9cheypkFJR+lJvVCn6GMF2jLh/IbkEUYi0vKOJeEEJg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jrFQZGy1br7GohlaGRP+5VoEq7O1piAGmy0dxmNpG87+2hYaOACPoOcSYHeAZU9KdhA52Yfff6w7QuNms1XxXdMqxeNwz+ynBtJkpNyaQfOFHlG1EkYFW3qx8VXSg+xUPdCXLjNLHsp4GNyQaq7jCRQtAUiId2Cj3m2zG4auja4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIv4Iu3V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIv4Iu3V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4505DC2BCB3;
	Thu, 14 May 2026 10:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778754229;
	bh=9cheypkFJR+lJvVCn6GMF2jLh/IbkEUYi0vKOJeEEJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GIv4Iu3VTy8cnmy/6uMjXqOjfXcsBQ/Iwo2gDQ/htRTLyOmQh/h8ELD9CnIC+owwy
	 MGJ5TZ/FrRvWEoXUTM0DQt0ky6XuF26SRYOhB06Jbm9qpEyRpOMSP8YBJ31M2921/W
	 VxvU+2uOGP/sPIXe2mNpVd54Gh1he0opLaisLRgXlpPTPo1+wskiXPi+PUD36O5CPL
	 pE325dSrGngMJ4k3C6UBTPXMQ8Ne5CxbuuObPNYfVQSSOog6tRkzZXICAxKAxEyoZE
	 5/UzE99KXhAtxA8AEfFoWrE5Ix4LeyLEAZkvTQOVeZMPUQdtxA36YRujuyerCjCmlO
	 meogrepf8ApqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Add Shikra remoteproc
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
References: <20260514-shikra-rproc-v1-2-9afdedeee002@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:23:48 +0000
Message-Id: <20260514102349.4505DC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `region_assign_idx` and `region_assign_count` for Shikra C=
DSP and MPSS resources.
--

commit bfe1ee5022ed8cfda954819b500c3d0c3c26c986
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

remoteproc: qcom: pas: Add Shikra remoteproc support

This commit adds support for the CDSP, LPAICP, and MPSS Peripheral
Authentication Service on the Qualcomm Shikra SoC.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index da27d1d3c9da6..4d43201b9ada7 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> +static const struct qcom_pas_data shikra_cdsp_resource =3D {
> +	.crash_reason_smem =3D 601,
> +	.firmware_name =3D "cdsp.mbn",
> +	.pas_id =3D 18,
> +	.minidump_id =3D 7,
> +	.auto_boot =3D false,
> +	.proxy_pd_names =3D (char *[]){
> +		"cx",
> +		NULL
> +	},
> +	.load_state =3D "cdsp",
> +	.ssr_name =3D "cdsp",
> +	.sysmon_name =3D "cdsp",
> +	.ssctl_id =3D 0x17,
> +	.smem_host_id =3D 5,
> +	.region_assign_vmid =3D QCOM_SCM_VMID_CDSP,
> +};

Are the region_assign_idx and region_assign_count fields intentionally omit=
ted
here?=20

Since they default to 0, qcom_pas_assign_memory_region() will return early
when checking if (!pas->region_assign_idx). This bypasses the TrustZone SCM
memory assignment routine entirely, making the explicitly defined
region_assign_vmid configuration ineffective.

Could this lead to an XPU access control violation if the platform requires
these memory regions to be reassigned to the DSP VM to boot?

[ ... ]
> +static const struct qcom_pas_data shikra_mpss_resource =3D {
> +	.crash_reason_smem =3D 421,
> +	.firmware_name =3D "qdsp6sw.mbn",
> +	.pas_id =3D 4,
> +	.minidump_id =3D 3,
> +	.auto_boot =3D false,
> +	.decrypt_shutdown =3D true,
> +	.proxy_pd_names =3D (char *[]){
> +		"cx",
> +		NULL
> +	},
> +	.load_state =3D "modem",
> +	.ssr_name =3D "mpss",
> +	.sysmon_name =3D "modem",
> +	.ssctl_id =3D 0x12,
> +	.region_assign_vmid =3D QCOM_SCM_VMID_MSS_MSA,
> +};

Similarly, this structure also defines region_assign_vmid but omits the
index and count fields. Will the MPSS resource face the same memory
assignment bypass issue?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514-shikra-rpr=
oc-v1-0-9afdedeee002@oss.qualcomm.com?part=3D2
