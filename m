Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46080419307
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 06:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616508; cv=none; b=brOV+ur9WsztkNfvgrdSAOBQv9pcIATP00f1xo4xPg1D0FyRsflDfuy6/Gfr1/j359yTfL0pWwt8O2EWVqtNelPRcMLRLpiW82lrahq5/nxgwSjkb5czFa/1q0cgzchZq1LS5tUoQcAgmLHm2/ClNsIKSFMuHeQaeFRczYOliYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616508; c=relaxed/simple;
	bh=kgGrDnaxEbMP0zxg48qWDncJXD8ea/5g79Tt/JFvUrk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TPI6PFxde9A8p90Mubbf36M08+Wh9vaZwkMPfHHWob9DX0nVBCMMJXoh1gcspH6rncVwYMvtpHNf54kp+4u30cLA4asbTgTlydPzF3Xa1GEaeRAM19B8cQoJTYqD5DGSSO31BlhH90rfzmlme2eH5CfFL8i5yMEMGT6/q1h5zXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dn8kRg05; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dn8kRg05"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903A91F000E9;
	Tue, 21 Jul 2026 06:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616506;
	bh=z1rnoX3TMLLJQr/wMkXe4AJPTg8uq+jA3RGY1T5czAw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dn8kRg05Zfr7W1r0EJmDPzOzJinDi+Yf5en0DRoNNCupqgrDyo3K7RpgnV61sGGwP
	 7YSW8oi0Ue9i5RGG9Ods5qN16mxxJ65Pmo/tiqLxoC9rNkUsmquYVErUt9IoWo2Dzi
	 4nGxbC12lI1q2SKspx5A3g2ARU7j7k+o98qh/mIUTfhydUMW53xk1ZvjMI4swaPSNh
	 GdJUcbHwGgQFPrI2hhfqAcLcvUFPULwJZ/6Qj4lTZDvYhpInVknlEVwgD28zlR482b
	 zPxsHJdxv9mlE+YzsPYYU/B4kHebFYRc94OooEx6AEYcrc4fnBgKyIDqpVc6zJm5QJ
	 z/yXWFgo55phA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/9] soc: qcom: Add QMI TMD support for remote
 thermal mitigation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-b4-qmi-tmd-v5-2-99620e07f505@oss.qualcomm.com>
References: <20260721-b4-qmi-tmd-v5-0-99620e07f505@oss.qualcomm.com>
 <20260721-b4-qmi-tmd-v5-2-99620e07f505@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:48:26 +0000
Message-Id: <20260721064826.903A91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Data race on `tmd->cur_state` between `qmi_tmd_register()` and `qm=
i_tmd_set_cur_state()` causes thermal mitigation state desynchronization.
- [High] The `mitigation_device_list_len` field in `struct tmd_get_dev_list=
_resp` is defined as a `u8`, causing a 3-byte out-of-bounds write when deco=
ded by the QMI framework.
- [Medium] Current state is not capped to the new maximum state during firm=
ware restart synchronization.
- [Medium] Improper dependencies prevent COMPILE_TEST coverage and force de=
pendencies to become built-in.
- [Low] Building with CONFIG_THERMAL=3Dm and CONFIG_QCOM_QMI_TMD=3Dy causes=
 a linker error.
--

--- Patch [2]: [PATCH v5 2/9] soc: qcom: Add QMI TMD support for remote the=
rmal mitigation ---
commit 977e2b6f2dd6931cec0ac743a4bead6a6e561872
Author: Casey Connolly <casey.connolly@linaro.org>

soc: qcom: Add QMI TMD support for remote thermal mitigation

This commit adds support for QMI-based Thermal Mitigation Device (TMD)
cooling devices provided by remote subsystems. It introduces a driver
that discovers the TMD service via QMI, registers cooling devices for
available mitigation endpoints, and forwards state updates.

> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index fd4d4ecd2df0f..5c38d598e4864 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -319,6 +319,17 @@ config QCOM_QMI_HELPERS
>  	tristate
>  	depends on NET
> =20
> +config QCOM_QMI_TMD
> +	bool "Qualcomm remote subsystem TMD" if COMPILE_TEST
> +	depends on ARCH_QCOM && NET
> +	select QRTR
> +	select QCOM_QMI_HELPERS

[Severity: Medium]
Does defining this as a boolean rather than a tristate force the selected
tristate dependencies (QRTR and QCOM_QMI_HELPERS) to become built-in when
enabled?=20

Also, since the depends line strictly requires ARCH_QCOM, does this prevent
the COMPILE_TEST coverage from working on other architectures?

[Severity: Low]
If the kernel is configured with THERMAL=3Dm and QCOM_QMI_TMD=3Dy, will this
cause a linker error due to the missing THERMAL dependency?

> +	help
> +	  This enables Qualcomm Messaging Interface (QMI) based Thermal Mitigat=
ion

[ ... ]

> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
> new file mode 100644
> index 0000000000000..b31046241af8b
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_tmd.c

[ ... ]

> +struct tmd_get_dev_list_resp {
> +	struct qmi_response_type_v01 resp;
> +	u8 mitigation_device_list_valid;
> +	u8 mitigation_device_list_len;
> +	struct tmd_dev_list
> +		mitigation_device_list[QMI_TMD_DEV_LIST_MAX];
> +};

[Severity: High]
Since the QMI framework decodes QMI_DATA_LEN elements by writing 4 bytes
(sizeof(u32)), does defining this length field as a u8 cause a 3-byte
out-of-bounds write?

Could this memory corruption overwrite the first few bytes of the
mitigation_device_list array during decoding?

[ ... ]

> +static int qmi_tmd_set_cur_state(struct thermal_cooling_device *cdev,
> +				 unsigned long state)
> +{
> +	struct qmi_tmd *tmd =3D cdev->devdata;
> +	int ret;
> +
> +	if (state > tmd->max_state)
> +		return -EINVAL;
> +
> +	/* cur_state is protected by thermal core's cdev->lock */
> +	if (tmd->cur_state =3D=3D state)
> +		return 0;
> +
> +	ret =3D qmi_tmd_send_state_request(tmd, state);
> +	if (!ret)
> +		tmd->cur_state =3D state;
> +
> +	return ret;
> +}

[ ... ]

> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
> +			    const char *label, u8 max_state)
> +{
> +	struct device *dev =3D qmi_tmd_cli->dev;
> +	struct qmi_tmd *tmd;
> +	int index;
> +
> +	for (index =3D 0; index < qmi_tmd_cli->num_tmds; index++) {
> +		tmd =3D &qmi_tmd_cli->tmds[index];
> +
> +		if (!strncasecmp(tmd->name, label,
> +				 QMI_TMD_DEV_ID_LEN_MAX + 1))
> +			goto found;
> +	}
> +
> +	dev_dbg(qmi_tmd_cli->dev,
> +		"TMD '%s' available in firmware but not specified in DT\n",
> +		label);
> +	return 0;
> +
> +found:
> +	tmd->max_state =3D max_state;
> +
> +	/*
> +	 * If the cooling device already exists then the QMI service went away =
and
> +	 * came back. So just make sure the current cooling device state is
> +	 * reflected on the remote side and then return.
> +	 */
> +	if (tmd->cdev)
> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);

[Severity: Medium]
If the remote QMI service restarts and advertises a lower maximum mitigation
level than before, will this send the old uncapped state to the firmware?

Should we clamp the current state to the new maximum state before sending
the request?

[Severity: High]
Can a concurrent thermal state update cause a race condition here?

If qmi_tmd_register() runs in the workqueue context and reads the state wit=
hout
a lock:

qmi_tmd_svc_arrive()->qmi_tmd_register()
    return qmi_tmd_send_state_request(tmd, tmd->cur_state);
   =20
And qmi_tmd_set_cur_state() concurrently updates the state:

qmi_tmd_set_cur_state()
    ret =3D qmi_tmd_send_state_request(tmd, state);
    if (!ret)
        tmd->cur_state =3D state;
       =20
Could qmi_tmd_register() end up sending a stale state to the firmware, caus=
ing
the remote mitigation state to become permanently desynchronized?

> +
> +	tmd->cdev =3D thermal_of_cooling_device_register(dev->of_node, index,
> +						       label, tmd, &qmi_tmd_cooling_ops);
> +	if (IS_ERR(tmd->cdev)) {
> +		int ret =3D PTR_ERR(tmd->cdev);
> +
> +		tmd->cdev =3D NULL;
> +		return ret;
> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-b4-qmi-tmd=
-v5-0-99620e07f505@oss.qualcomm.com?part=3D2
