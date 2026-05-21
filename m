Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1503D7A15
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 13:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371821; cv=none; b=VWDp9P4l0fF21FLw0Svyo4YDtL//TR+ZGzQhEmdilA7k1TzgJP5Mn874HO89t8KVl6BiFxkaJ1vn4nvSOVOS4rKEk9SGN1lEEEaba1g5zmK7dFecfHv5S7Bk7vM86N3KPloRCsyqZwrLY+Mrz71DHMi165UygHhwSci+fHmKUv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371821; c=relaxed/simple;
	bh=3FKu3rp48Nj0WCU1OMdl7fRUXIEdcbHp6a2ZYHvGPPA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XycF5sbhODDirL/gkJzkLZifU3Xo4EDvXx5D+nQxhIpeSLa8i2S81x0Sg3OOIS5w/n7Vlk3yuEuFRMKJwpwnRBFk/6mdYCA2Dsvq7KVja3sMPJIY5n0zbXn8GMKcmIVUrk9a6R1WsNYFBTEJPS0oVfOZSYtrwDh20gWqnMEtjRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MFyWf6AT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MFyWf6AT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15C11F000E9;
	Thu, 21 May 2026 13:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779371819;
	bh=01DmfOtSOQcl3PS6JVer2odmhv8oRacZZAuQltS+1Dw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MFyWf6ATx9gTUWGHsVhzOjI0bCGCXNoisqlNt8v4zgHl2+JrGWzP/ojQz3SIl9aTt
	 IUrA8CXid+FJwtjitbf1FvMZ6ADprUImmQT+x1S3Svrq2naolb3jExH3R2S4+Cc0Xl
	 DM2tGThgiVmhlztv04h0iJ6k97dM/bJ6A1KPf5EKl3pkGq1qe7FLWQNbewDuMreTL9
	 fxSGyKBPKevtFISvuTb5GeB8EUmwftwziVhyMbmlrfLUx0QjKgZFT9yMTbqtHAxZdT
	 f7imN0M1i0oqmVj0Z9ELzH5dum72OZr0O71zGo/jxcqmZIBwHKLK8LD7nbbto6hTCh
	 YyY7wNt+g18Tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] remoteproc: qcom: pas: Add Shikra remoteproc
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Komal Bajaj" <komal.bajaj@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-shikra-rproc-v3-2-2fca0bbe1ad7@oss.qualcomm.com>
References: <20260521-shikra-rproc-v3-2-2fca0bbe1ad7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 13:56:59 +0000
Message-Id: <20260521135659.A15C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `ssctl_id` initialization for `shikra_lpaicp_resource` cau=
sing graceful shutdown failure.
--

commit de542ab4b48a2146f6973ba793bbbd6328de204c
Author: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

remoteproc: qcom: pas: Add Shikra remoteproc support
   =20
This commit adds the CDSP, LPAICP and MPSS Peripheral Authentication Service
support for the Qualcomm Shikra SoC.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index da27d1d3c9da6..0101f1db6458e 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -1457,6 +1457,51 @@ static const struct qcom_pas_data sc7280_wpss_reso=
urce =3D {
[ ... ]
> +static const struct qcom_pas_data shikra_lpaicp_resource =3D {
> +	.crash_reason_smem =3D 682,
> +	.firmware_name =3D "lpaicp.mbn",
> +	.dtb_firmware_name =3D "lpaicp_dtb.mbn",
> +	.pas_id =3D 0x56,
> +	.dtb_pas_id =3D 0x57,
> +	.minidump_id =3D 0,
> +	.auto_boot =3D true,
> +	.ssr_name =3D "lpaicp",
> +	.sysmon_name =3D "lpaicp",
> +};

[Severity: High]
Does this resource definition need an ssctl_id initialized?

The sysmon subdevice is enabled by setting .sysmon_name =3D "lpaicp", but it
fails to define .ssctl_id. Because .ssctl_id is uninitialized, it defaults
to 0, which means qcom_add_sysmon_subdev() will be passed 0 as the QMI
SSCTL instance ID.

Looking at ssctl_new_server() in drivers/remoteproc/qcom_sysmon.c, the
version 2 QMI service binding requires svc->instance =3D=3D
sysmon->ssctl_instance. Since modern Qualcomm PAS QMI SSCTL services
advertise non-zero instance IDs, could this cause the binding to fail?

If the remoteproc framework never establishes an SSCTL connection to the
LPAICP DSP, sysmon_stop() will explicitly skip waiting for the SSCTL service
connection since ssctl_instance =3D=3D 0.

When the DSP needs to be stopped, will sysmon_stop() bypass
ssctl_request_shutdown() and forcefully power off the DSP instead of
gracefully shutting down?

Forceful shutdowns of active DSPs can lead to hardware state corruption
or SMMU faults, which often cascade into kernel panics on these platforms.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-shikra-rpr=
oc-v3-0-2fca0bbe1ad7@oss.qualcomm.com?part=3D2
