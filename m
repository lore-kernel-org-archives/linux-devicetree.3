Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FCD199D8
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781001623; cv=none; b=ldNDus6HxTANJVmHDDAD9FnYkOzrlaetRu1zYeMRaWQmiwKfcSYqlL2YtP0dJaTVzSwwsYCq0fj+wN9nQv3qAqyDKb2Ig/aybT89r8EzFXp968dTmmcZydHUhjIJkN46B7+cUeblEwQ5/5FtR+667wDhuaOr8R6xT/3xM/UYbQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781001623; c=relaxed/simple;
	bh=J0P+r0W/rT0B0Li+qHEKy0+ZG/QFYTLDFVmcxch6cX0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SeQOmQ4TKS62JGaScmOlrpsLNXFofVU4ZbJetqMyQnTEqmDIjjf9toAQaSKRwrDecbxU8THh5RfL2JTSG4/rUSeIvlC2F4bxObxsnx57sliYMyjit/89HEIHk+wuHGUNj/E0jupGyL1SGTgC3TZ7EyUee9MioJ6xZtG79M2kdQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3AeEayu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3AeEayu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44E61F00899;
	Tue,  9 Jun 2026 10:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781001622;
	bh=x9BV4wZwz7f1OFq7Dhwp0jVpIUzdQArxarbzz6vLzRg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C3AeEayuTuBsUGuNIAO83JEW1bJV1whvE1ogaPT2/QLh3NGWtc++0UwhA9YPb3kIR
	 PQZwm4OIj/ZkrQDRQg9ZP/Y0b6g46zJzB2gPzSmC9kiF6/UQ2XJ+KZ38dyvGWNVsw6
	 i+mJs+rRqFoyuiLo7T1xJ05BFhkwYH4qDSNnrpcDt07ssTOxRhlwogJh0zgcN+1SuO
	 hMc2E6pQsq3oe+VWbwUSgvKRgoxkhSV4biBkIucDFQo4vcXQgczRrfkNbpDsg9nDQO
	 2nB4K4H1mRW/EhDIWkKgKujJYVr+e1iUjqfWWFXDv8k0lnszdo0HOUnaqVUqfcEq57
	 qTnV8gaEPye6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal
 cooling devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:40:21 +0000
Message-Id: <20260609104021.D44E61F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Config QCOM_Q6V5_PAS and QCOM_QMI_TMD select QCOM_QMI_HELPERS with=
out inheriting its dependency on NET, leading to Kconfig unmet dependency w=
arnings and build failures.
- [High] In qmi_tmd_exit(), the QMI handle is released before unregistering=
 the thermal cooling devices, exposing a race condition that leads to a Use=
-After-Free.
- [High] If thermal_of_cooling_device_register() fails, tmd->cdev holds an =
ERR_PTR which causes a kernel panic when passed to thermal_cooling_device_u=
nregister().
--

commit 054962d4a1d3642bf94b2a883fba802967d5e58a
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

remoteproc: qcom: pas: register TMD thermal cooling devices

Add support for Thermal Mitigation Devices (TMDs) to enable thermal
throttling of remote processors through QMI. This enables the thermal
framework to request mitigation when remote subsystems contribute to thermal
issues.

> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 2caadbbcf8307..a292ce57fd4a4 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -128,6 +128,16 @@ config QCOM_QMI_HELPERS
>  	tristate
>  	depends on NET
> =20
> +config QCOM_QMI_TMD
> +	bool "Qualcomm QMI TMD library" if COMPILE_TEST
> +	depends on ARCH_QCOM
> +	select QCOM_QMI_HELPERS

[Severity: High]
Does this code need to inherit the dependency on NET?

Looking at QCOM_QMI_HELPERS, it strictly depends on NET. If QCOM_QMI_TMD is
enabled while NET is disabled, Kconfig will forcefully enable
QCOM_QMI_HELPERS with unsatisfied dependencies. This could trigger unmet
direct dependencies warnings and link-time errors due to missing socket
APIs.

> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
> new file mode 100644
> index 0000000000000..9d88ae48c8647
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_tmd.c
[ ... ]
> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
> +			    const char *label, u8 max_state)
> +{
[ ... ]
> +	tmd->cdev =3D thermal_of_cooling_device_register(dev->of_node, index,
> +						       label, tmd, &qmi_tmd_cooling_ops);
> +	if (IS_ERR(tmd->cdev))
> +		return PTR_ERR(tmd->cdev);

[Severity: High]
Could this leave tmd->cdev containing an ERR_PTR if registration fails?

If thermal_of_cooling_device_register() returns an error, tmd->cdev will
hold that ERR_PTR. Later, when qmi_tmd_unregister() runs, the
if (!tmd->cdev) check won't catch the error pointer, causing
thermal_cooling_device_unregister() to dereference it and panic the kernel.

[ ... ]
> +void qmi_tmd_exit(struct qmi_tmd_client *qmi_tmd_cli)
> +{
> +	if (!qmi_tmd_cli)
> +		return;
> +
> +	cancel_work_sync(&qmi_tmd_cli->svc_arrive_work);
> +	qmi_handle_release(&qmi_tmd_cli->handle);
> +	qmi_tmd_unregister(qmi_tmd_cli);

[Severity: High]
Does releasing the QMI handle before unregistering the thermal devices
create a race condition?

If the thermal core invokes qmi_tmd_set_cur_state() asynchronously between
qmi_handle_release() and qmi_tmd_unregister(), qmi_tmd_send_state_request()
will try to use the already destroyed QMI handle, which could result in a
use-after-free.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-qmi-tmd-v3=
-0-291a2ff4c634@oss.qualcomm.com?part=3D3
