Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83ACAB67E
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786279557; cv=none; b=mG93AmEbrfRNjx52Ot1EnWM74dkXE/mRBixFG/kUsftFumsJ36GVtWy75xWy6yFh5NRsPdapOusH9d5+figqiIwel95zU5fEUFjhLjWNiJM+lahIOldd1CGfcXEOFTgY7eB8Pd/dPCdwaeKFPGWFz+QVF91rv0/ZTydPVTQM4MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786279557; c=relaxed/simple;
	bh=SXftExrylawxGdiAH/DyJxRkuV6bg36U+ScCDEQgXFg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i+OH7Z8cK80mmUpuPGrTQjnK6afc9dUOAeNmR+hRcBybdUfNeXhXF1DhHw99cYdubU97MNGWuUAF2mcxGVDHd/2I0T5K8s3jEFm3NejITeNx36a8puBxP48ELSyJXXZHqUiaGROzuUfLvDLwSFAvMM7vzX9qGCOCdp9qjTZAGcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loq/Q8zc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loq/Q8zc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11851F000E9;
	Sun,  9 Aug 2026 12:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786279556;
	bh=QHZp+qe0BBSZhEJSN7uk40v4KKkC88VTdH12yjrF0zg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=loq/Q8zcIP3Cedw02/zX4WnUq5PzxM7GMhEtxt4wjZuoZXUkJD42xguqkYyZuDsI0
	 0e7CywA1tgiILX/O/zhizzNj64IojMeocO8ZiO85JZVrFKjGfGkRoKFZlomp05V2lK
	 9FXTJNFpT2i3WYLUdE9sdOcs16NfKiY3GXU08VBzN9aVdOZlZA0m5RgAarcJlCUYWg
	 QBWx/pqJhioSzdi/CiR/ASWb1ogzOX46U/bAWzfqRngAXVvf+1UuYZCUhwHqIGkprg
	 82iXS9ltix+7gaCctYW85sHjmnaDxDkWlrk6HAY+y0yeSw0+gjaTFvhiN5GVsOeObJ
	 ZnIIaeZe+nYqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 3/9] remoteproc: qcom: pas: add support for TMD
 thermal cooling devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260809-b4-qmi-tmd-v8-3-b15d47adc379@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-3-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 12:45:55 +0000
Message-Id: <20260809124555.C11851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Building `QCOM_Q6V5_PAS` as built-in (`=3Dy`) when `NET` is a modul=
e (`=3Dm`) causes a linkage error due to `QCOM_QMI_TMD` being selected as a=
 module.
--

--- Patch [3]: [PATCH v8 3/9] remoteproc: qcom: pas: add support for TMD th=
ermal cooling devices ---
commit f374931389bff4c40d7d760a4a7f08dbd2d99fe0
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

remoteproc: qcom: pas: add support for TMD thermal cooling devices

Register Thermal Mitigation Devices (TMDs) for PAS-managed remote processors
to enable thermal throttling through QMI. This allows the thermal framework
to request mitigation when remote subsystems such as modem and CDSP
contribute to thermal pressure.

> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
> index 5b56b2dcc725f..8501bb108c739 100644
> --- a/drivers/remoteproc/Kconfig
> +++ b/drivers/remoteproc/Kconfig
> @@ -238,6 +238,7 @@ config QCOM_Q6V5_PAS
>  	select QCOM_PIL_INFO
>  	select QCOM_MDT_LOADER
>  	select QCOM_Q6V5_COMMON
> +	select QCOM_QMI_TMD if NET

[Severity: Low]
Could this selection cause a linker error when CONFIG_QCOM_Q6V5_PAS is
built-in (=3Dy) and CONFIG_NET is a module (=3Dm)?

If configured this way, QCOM_QMI_TMD will be selected as a module. Because
IS_ENABLED(CONFIG_QCOM_QMI_TMD) evaluates to true for modules, the header
provides function declarations rather than static inline stubs. The built-in
driver will then attempt to link against the qmi_tmd_init symbol located in
a module, resulting in a build failure.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-b4-qmi-tmd=
-v8-0-b15d47adc379@oss.qualcomm.com?part=3D3
