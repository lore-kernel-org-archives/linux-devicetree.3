Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B62F41B8CC
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 14:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163208; cv=none; b=kgawsCXODNK8VPZ2iqMcwXe+iFQcZKP6l5H4ph0QjgccMCFqjZuDUEOJdl3mtKgoQ9g5LfVcgJn25Wss9iUWcRQlnSR3tmCuwtBvUQhWcBwwUs9BefSSoA8LHBYusw33GwfQk8zmRQDkKfzvwz+om+M/VO+xHpHx0v1QSZPIvfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163208; c=relaxed/simple;
	bh=Mb/OywHRRxJFzoPVYpcYCJ6nlcjVRaXVXR4wMKAXY1E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TpRu8JvOE2/73X50YiBugNp6CXrV5rk1JA2G645uyCdkL7F4MgTjAiPScnFOfb1OhgfS1FxaAhoSLkEZAOfXFsT8WFw4iXis1EL8fSxqD9pe8om/8G6lsaPzPVYFn9nBTOsb6YHiEX4K+1jxnU6MeBASpXTIC7tg5Kk+4MR0wiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9Bf7PcN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9Bf7PcN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28421F000E9;
	Mon, 27 Jul 2026 14:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785163206;
	bh=T8po+dRBArq3fCWJzo7VUTplD4n19YbbuKLOOj2GM+U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C9Bf7PcNUNaXO3tADSzhQNGJxcBSkbR82LFIJbF4q9Q3M/tN2hShMOLswHNgjK86L
	 8JxFuP5r2jsz/cFG0bA5AhQG37CJ1lq33hCNKSlSVMsM7SV9l0ASPHltlcfVtyRcog
	 XGWWBv6QxcKK9pIS+aDLXJ9FPM0M3eddq7u8rkiia0pXuETxZ67DySjQpM9RVqI8Ux
	 1kzlLPp6NcAvKseUuzKyws/L4jv5y4LWP4UpkI86mzAwKZRLdI8G5HTjMNv0c1PA+1
	 Ly1zWcW5GwgmzI4wtGcm+1vOxI2yGTQ0navfBvk95J18X2xg7KVarAjP8KF6xMfstP
	 PnPgmFICbXB5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/9] soc: qcom: Add QMI TMD support for remote
 thermal mitigation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260727-b4-qmi-tmd-v6-2-973cd3a226af@oss.qualcomm.com>
References: <20260727-b4-qmi-tmd-v6-0-973cd3a226af@oss.qualcomm.com>
 <20260727-b4-qmi-tmd-v6-2-973cd3a226af@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 14:40:05 +0000
Message-Id: <20260727144005.F28421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unprotected read of `tmd->cur_state` during QMI reconnect can caus=
e the remote mitigation state to permanently desynchronize from the thermal=
 core.
- [Medium] Data race on `tmd->max_state` between the QMI worker and thermal=
 core callbacks.
--

--- Patch [2]: [PATCH v6 2/9] soc: qcom: Add QMI TMD support for remote the=
rmal mitigation ---
commit 8a125ac63b99f7508e9f1e7c025b0c0da679cac6
Author: Casey Connolly <casey.connolly@linaro.org>

soc: qcom: Add QMI TMD support for remote thermal mitigation

Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
Device (TMD) cooling devices provided by remote subsystems.

> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
> new file mode 100644
> index 0000000000000..555f2aff1ac0f
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_tmd.c

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

[Severity: High]
Can the remote mitigation state permanently desynchronize from the thermal
core here?

If a remote QMI subsystem restarts, it triggers qmi_tmd_svc_arrive() and
qmi_tmd_register(). Concurrently, the thermal core might update the cooling
state via qmi_tmd_set_cur_state().

In qmi_tmd_set_cur_state(), the request is sent first, and tmd->cur_state is
updated afterwards without holding qmi_tmd_cli->mutex. This creates a window
where the state has been updated on the remote device, but tmd->cur_state
does not yet reflect the new state.

Could the following sequence occur?

CPU A (thermal core)
qmi_tmd_set_cur_state()
    qmi_tmd_send_state_request()
        // acquires and releases mutex, sends new state
    <preempted before updating tmd->cur_state>

CPU B (reconnect work)
qmi_tmd_register()
    reads tmd->cur_state (which is still the old state)
    qmi_tmd_send_state_request()
        // acquires mutex, sends old state

CPU A (resumes)
    tmd->cur_state =3D state;

If this happens, the remote device would be left running with the old state,
while the local thermal core tracks the new state. Should tmd->cur_state be
read and updated under the protection of a lock?

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

[Severity: Medium]
Could this write to tmd->max_state cause a data race?

This assignment in qmi_tmd_register() is executed from a workqueue when
the QMI service arrives, but it does not hold a lock. Concurrently, the
thermal core can invoke qmi_tmd_get_max_state() or qmi_tmd_set_cur_state(),
which both read tmd->max_state without holding shared locks.

While tearing might be unlikely on most architectures, could this
unsynchronized read and write trigger KCSAN warnings or lead to undefined
behavior?

> +
> +	/*
> +	 * If the cooling device already exists then the QMI service went away =
and
> +	 * came back. So just make sure the current cooling device state is
> +	 * reflected on the remote side and then return.
> +	 */
> +	if (tmd->cdev)
> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
> +
> +	tmd->cdev =3D thermal_of_cooling_device_register(dev->of_node, index,
> +						       label, tmd, &qmi_tmd_cooling_ops);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-b4-qmi-tmd=
-v6-0-973cd3a226af@oss.qualcomm.com?part=3D2
