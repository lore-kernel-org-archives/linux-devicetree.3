Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DF5317173
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082532; cv=none; b=ebmCoeGWr1q3e6lhWDnRgosgSO5kpomBuufRbw/hEFO4ByPM3HkEQaony7pm1MtcfnLjJeNPODbKI12p63ntGjOu6VzIGDNYHR49OtpQsKw27BG+faSSX1G5tDFZg/JCaARWQDxd4/LAUhVv1t5oz8FUo3B7c58K0AS6KEb74h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082532; c=relaxed/simple;
	bh=lXsNc0ZO0I9AiX4VP8wTGHyNt3KQNR5k5yJiXBpynnA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AsuveVV6awYk+xEuzQ8X9a3BsFUsnUQWVlc881OLi3yxC60WgZ8myCbkMGGNAwgPUofHDgzza2lUhOb5I80EewAT5etgYEDruPsOwwPp0CWnu5vqINWo9K6KVrxYWHJje1ASbubcE1TdSc6BOQ3dEqKBx8UWWcJWHq8wfYAohFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LV9j5+bf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LV9j5+bf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367391F000E9;
	Fri,  3 Jul 2026 12:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783082531;
	bh=PAvcvkANJpAFk89Z3DbsPziFVS9L/ys0yI8iaXQ7W+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LV9j5+bfflwt8vwGXhFhKJYDJqbU7auNzJm6AQp80lmWmIehNhOg4m29xot6YLjhS
	 lylVmf3wqvTsiYcFTE27WblXeDPhC6SZPwzzoaNHbItMmdS7NMLHvJ74R7wDzWL2Ks
	 XSuV7Vr7iLb9pFUocdbdWB05ZusW9durm7+DTVYY/xcGtK4XO0wxzHL55j1y7apMtm
	 p7GdCgbZ7WcodL/K/4hUWTaE1XCDI61mX1iUNvqVgMok5+mG23qHehMG2jlbOVFbTD
	 BgVWYRH8jc3Efk61MD7RCp17swP+TtKfIXC1mVKH2tsJ6xGzNzMWe0qh/rKE/+S7P7
	 ++isyA2f+IfqQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] remoteproc: qcom: pas: add needs_tzmem flag to
 force shmbridge creation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ananthu C V" <ananthu.cv@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260703-glymur-soccp-v4-1-b706c4c9b3e2@oss.qualcomm.com>
References: <20260703-glymur-soccp-v4-0-b706c4c9b3e2@oss.qualcomm.com>
 <20260703-glymur-soccp-v4-1-b706c4c9b3e2@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 12:42:10 +0000
Message-Id: <20260703124211.367391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The `kaanapali_soccp_resource` lacks the newly introduced `.needs_=
tzmem =3D true` flag, causing SHM bridge setup failures or SMMU faults for =
the Kaanapali SoCCP remoteproc.
--

commit 1e9c4b8af0b2474dac8304d92f260e1af8817ef5
Author: Ananthu C V <ananthu.cv@oss.qualcomm.com>

remoteproc: qcom: pas: add needs_tzmem flag to force shmbridge creation

This commit adds a needs_tzmem flag to ensure tzmem and SHM bridge setup is
performed independently of the iommu property. This is intended to prevent
SMMU faults for remoteprocs that are already running, like SoCCP.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 60a4337d9e516..cd7273fbcf981 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c

[ ... ]

> @@ -1657,8 +1658,27 @@ static const struct qcom_pas_data kaanapali_soccp_=
resource =3D {
>  	.early_boot =3D true,
>  };

[Severity: High]
Should kaanapali_soccp_resource also set .needs_tzmem =3D true?

The commit message explicitly states that for remoteprocs that are already
running like SoCCP, the OS must use needs_tzmem to configure tzmem
independently of the iommus property to avoid SMMU faults.=20

Since kaanapali_soccp_resource is also a SoCCP remoteproc, will omitting
this flag here cause SMMU faults or fail to perform the required SHM bridge
setup when probing the qcom,kaanapali-soccp-pas device?

> +static const struct qcom_pas_data glymur_soccp_resource =3D {
> +	.crash_reason_smem =3D 656,
> +	.firmware_name =3D "soccp.mbn",
> +	.dtb_firmware_name =3D "soccp_dtb.mbn",
> +	.pas_id =3D 51,
> +	.dtb_pas_id =3D 0x41,
> +	.proxy_pd_names =3D (char*[]){
> +		"cx",
> +		"mx",
> +		NULL
> +	},
> +	.ssr_name =3D "soccp",
> +	.sysmon_name =3D "soccp",
> +	.auto_boot =3D true,
> +	.early_boot =3D true,
> +	.needs_tzmem =3D true,
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-glymur-soc=
cp-v4-0-b706c4c9b3e2@oss.qualcomm.com?part=3D1
