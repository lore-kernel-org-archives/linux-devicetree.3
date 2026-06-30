Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665E33FBEC1
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782824531; cv=none; b=dWwKkzisEIPRqqLX/C9kVU0PUMbwMma7+xp8Svqnp/cX2GrY61TiVz76Gx3EcsoqqDFHZu1t2Axf3d5l2h8KqCszGHNCVWYem8ZK/lR9QWT7bE1ihL0kH0ccTxzX0lAk0l29nI6y8Cpi1vETzkQmDzIRafSJoAoVTX2VsEwNt+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782824531; c=relaxed/simple;
	bh=uMN1ESj/MlyzpIPTLVeun2E0c5bkn7n0DyR/zru4KcU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R7jGJZ7uqQkOJU91/EvM+Galtzpbg6SILGxbJSgHn0oidFc75kv2ks488QrLOLa6oovh3kewvG6dCsBHl+jqoIsWd282IOO7P82y990QaK1aToYqcU2dJy4cN09aKa1Kvl1Vevt1ojlMT6nOzF5YsvWS4hxPya3z+/sFc7uPMpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgtrNFP9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgtrNFP9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F81C1F000E9;
	Tue, 30 Jun 2026 13:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782824530;
	bh=mfg8wTDTUODHNuSmJQGZ7ilzHr5LBTIRyugrF5kbbgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HgtrNFP9+hGEEHTDtDXe7CYGmdVcXJevGKsyVfEWpk57F5ICBlv9GFgE3fg8m9GPx
	 3OLSaM/I/SiJPizwC4nz9EKKkCknvX3v5NA0WRvsn8tG/Xa7p4CV3PPiX1jiUlq5p5
	 gNf56OBTLB3lX6Hl/TIJ/B4kro9OXNxsmm3q9WkIjua2kEQl1RythoLBQLWZNvOe8W
	 9CTuj4DxfHuiPvM8rn+ojZT06tcqHGre4z7S+Y0uJWmB47WxPxdN2B6XgW5gStSVwj
	 nvwITdcpWWD1dkQOOIyPqLMM6ptOcGMy5g7tY4oYyJTgdMPMgCRPHWj2mGk3Xb22Pn
	 Vin84fBFz3I3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260629-ipq5018-bluetooth-v2-3-02770f03b6bb@outlook.com>
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-3-02770f03b6bb@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 13:02:08 +0000
Message-Id: <20260630130209.0F81C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Command ID collision causing false positive availability check and=
 potential TrustZone memory corruption.
--

commit ad188a38cad8a7f123b53d24cb2303340d519071
Author: George Moussalem <george.moussalem@outlook.com>

firmware: qcom: scm: Add support for setting Bluetooth power modes

This commit adds support for configuring the Bluetooth subsystem power
optimization mode on the IPQ5018 SoC. It introduces a new SCM call to
TrustZone and checks for the call's availability before invoking it.

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c

[ ... ]

> +static int __qcom_scm_pas_set_bluetooth_power_mode(u32 pas_id, u32 val)
> +{
> +	struct qcom_scm_desc desc =3D {
> +		.svc =3D QCOM_SCM_SVC_PIL,
> +		.cmd =3D QCOM_SCM_PIL_PAS_BT_PWR_MODE,
> +		.arginfo =3D QCOM_SCM_ARGS(2),

[ ... ]

> +int qcom_scm_pas_set_bluetooth_power_mode(u32 pas_id, u32 val)
> +{
> +	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
> +					  QCOM_SCM_PIL_PAS_BT_PWR_MODE))
> +		return -EOPNOTSUPP;

[ ... ]

> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qco=
m_scm.h
> --- a/drivers/firmware/qcom/qcom_scm.h
> +++ b/drivers/firmware/qcom/qcom_scm.h
> @@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev=
);
>  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
>  #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
>  #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
> +#define QCOM_SCM_PIL_PAS_BT_PWR_MODE	0x21
>  #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21

[Severity: High]
Could this command ID overlap cause a false positive in the availability ch=
eck
and trigger unintended behavior in TrustZone?

Because QCOM_SCM_PIL_PAS_BT_PWR_MODE and QCOM_SCM_PIL_PAS_GET_RSCTABLE are
both defined as 0x21 under the same service (QCOM_SCM_SVC_PIL), the call
to __qcom_scm_is_call_available() in qcom_scm_pas_set_bluetooth_power_mode()
will return true on any platform that supports getting the resource table,
even if it does not actually support the Bluetooth power mode command.

If the function proceeds, it will invoke command 0x21 with only 2 arguments
instead of the 5 expected by the GET_RSCTABLE handler. Since the unprovided
arguments default to 0, might this cause TrustZone to read or write at
physical address 0x0, potentially resulting in a Secure World crash or
memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-ipq5018-bl=
uetooth-v2-0-02770f03b6bb@outlook.com?part=3D3
