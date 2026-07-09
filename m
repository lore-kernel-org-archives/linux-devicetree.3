Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07303DEAFB
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783589244; cv=none; b=ioOQCEPdChFKMuEWV0pCKWEdYCKAQTpCAswWPshQ76+G++2rsbnMTgsySmUAZ477qFJwqMc/IQlWZ4CwzNkr4ox96sX+POfLs2wYHIJjO/lCp2ktGpOGDKC6mCC9CUeqHT10aY3IeVSfdI5cEQ+oNfsmS/czw1xNYwTiVmzsq4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783589244; c=relaxed/simple;
	bh=L1+E3ntx/K/7EqYrxs7frsb9FsAns/CRtYPMbY649Rc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t7JEbrL+DGpkS6rH55T5ZlC/YVHFbABFkwaNkqWXGFxGJnxw9aqsulvg7J6JZh38VNgHYo7EwEZ4qS1xqKCAvpibB70jnLTcPiKWc+ylsK93pQINu13yiFS4kQVhfhbXBmSaRPX4EZiOmsfD6fTYSVDYUCoYoUkNCvtJ9WintBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nyr+WA7o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nyr+WA7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973B21F000E9;
	Thu,  9 Jul 2026 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783589240;
	bh=DHK2A37QR8eRy673+qFYhWEJzSFOddPPeMHG6DE+z0c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nyr+WA7odn0BI+AlH0hA0a0ZGA1Nc7U6Aimj+3oEqUfwwA/FsnSV9gc8E2sZeqGnQ
	 nwd1QtVo97Fkye954fFfJYNCnyOiPv+pdoSX2JjjMETgE6W3cP+JaTjWcu5bKAXApk
	 8p32Nu/iZBOvk1dEuXuCz78O4jnVi9VJ9s2Mil21cJGaFz85zt8DRFAm57QwmYstkW
	 I06fD0a+eeW0ZNUCThlbNSSIJ15GK++t4HZi8PenRpNZymmHGW57U4TCx6IPC5dwZ7
	 6zHRoYY7EkNvWhYixArJrfMQrwZQcSPqmBiqbBKwcNgTbd8F+HckH9DnuMU/eZtLy4
	 p5lxGQsZWW3oQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/6] firmware: qcom: scm: Add support for setting
 Bluetooth power modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem" <george.moussalem@outlook.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709-ipq5018-bluetooth-v5-3-e476c41f03b8@outlook.com>
References: <20260709-ipq5018-bluetooth-v5-0-e476c41f03b8@outlook.com>
 <20260709-ipq5018-bluetooth-v5-3-e476c41f03b8@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:27:20 +0000
Message-Id: <20260709092720.973B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The new `QCOM_SCM_PIL_PAS_BT_PWR_MODE` macro uses the exact same c=
ommand ID (`0x21`) as the existing `QCOM_SCM_PIL_PAS_GET_RSCTABLE` macro wi=
thin the `QCOM_SCM_SVC_PIL` service.
--

--- Patch [3]: [PATCH v5 3/6] firmware: qcom: scm: Add support for setting =
Bluetooth power modes ---
commit 7001f29bdf69c1e84287e5d8734b48feda414e41
Author: George Moussalem <george.moussalem@outlook.com>

firmware: qcom: scm: Add support for setting Bluetooth power modes

The Bluetooth subsystem (BTSS) on the IPQ5018 SoC supports setting power
modes which are configured through a Secure Channel Manager (SCM) call to
TrustZone. This commit adds a function to perform this call after checking
if the feature is supported by the QSEE image.

> diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qco=
m_scm.h
> index caab80a73e17f..5579df5a2aca7 100644
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
Is it intended for QCOM_SCM_PIL_PAS_BT_PWR_MODE to use the exact same
command ID (0x21) as QCOM_SCM_PIL_PAS_GET_RSCTABLE?

Because both definitions share 0x21 within the QCOM_SCM_SVC_PIL service,
when __qcom_scm_is_call_available() queries the firmware for
QCOM_SCM_PIL_PAS_BT_PWR_MODE, it will falsely return true on any SoC that
already supports GET_RSCTABLE.

This would allow qcom_scm_pas_set_bluetooth_power_mode() to incorrectly
proceed and execute a 2-argument SCM call to TrustZone. Could this cause
the firmware to route the call to the GET_RSCTABLE handler (which expects
5 arguments, including physical addresses for DMA), potentially leading
to a Secure World memory fault?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ipq5018-bl=
uetooth-v5-0-e476c41f03b8@outlook.com?part=3D3
