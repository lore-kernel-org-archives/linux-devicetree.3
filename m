Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E23A416849
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785495207; cv=none; b=RR2UIP/F7mpmaqosD4E6G1wM+8xASsNIsgOCRHHusY+oBWoh4GtS4Qx3+W7/9XDQ8nWFL9kX1+hk4CLMcBBWTTbzesAV8a2CHc+77ZJVsUKB03hZfjfiqnGKHhi7fA226FY67Shj+ej9RImmheXzN6bT8+CGzRzt0jM05N1ZU8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785495207; c=relaxed/simple;
	bh=yog6llT/wNIAzEL1W3tM9BjJE/IJPmSqgKaoFeg7/Dk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EVwTalAkL08bKfoCuXLXXMOYoidT6Zd/t4ycltR7i7xXnJSkFMH8XN2xJKcUGOb0KFuc7P0GN4NrUuNdTXH2G76hOwPEFxpZNBpPkE/ysYBA3oa0FNrm2ukcoP7gEy9zzAU8kvCNJz6kuAfJ3nvAtY+Ot+6FVwvWo1UfmncyGwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hc0jR//w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hc0jR//w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDBA51F000E9;
	Fri, 31 Jul 2026 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785495197;
	bh=8YZs8mHTSFB1o5bGXEc8Blvz/KTWkBxiUoYBHhW7dOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Hc0jR//wkiGiBQOkWqgmnJusCkwOiX8UmdYL3oyW7ERHNs4yfB3GAfvM1w9Cg/y+g
	 cBxvm8oZGnyD7TR4aumc2H97JP0C0BEJp106JAieyf3JtC+ENtNV+75K1+a2uS/dno
	 5DisHfCgCSRMI7CoBq40DdQD+7SZsf1nUC01q24cA7mCPZohYyZ8q6McpwG+uzG+9B
	 o9NV5nUUP6zAwbs/ERC21rl+jw7kWE3mP27fJAvyLh2kRj6PtyugYggAI5xY7Snko8
	 Cwg8xom2LaDMIHuByZptZbivO8+SQBpUk02/OvGrZN0TFg6kb0nu/B8FG+Eap5PxM0
	 ylNSI3bQ1ZlaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/9] soc: qcom: Add QMI TMD support for remote
 thermal mitigation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260731-b4-qmi-tmd-v7-2-3befd44403d5@oss.qualcomm.com>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-2-3befd44403d5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 10:53:16 +0000
Message-Id: <20260731105316.BDBA51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Returning success without saving the requested mitigation state wh=
en QMI is disconnected permanently loses thermal mitigation updates.
- [Medium] TOCTOU race condition when reading `tmd->cur_state` during servi=
ce reconnection causes permanent thermal state desynchronization.
--

--- Patch [2]: [PATCH v7 2/9] soc: qcom: Add QMI TMD support for remote the=
rmal mitigation ---
commit 02c2244c0a2cebd6be4e1bf4e41d51362be19b5f
Author: Casey Connolly <casey.connolly@linaro.org>

soc: qcom: Add QMI TMD support for remote thermal mitigation

This commit adds support for Qualcomm Messaging Interface (QMI) based
Thermal Mitigation Device (TMD) cooling devices provided by remote subsyste=
ms.
It allows client drivers to discover the service and forward cooling state
updates to remote processors.

diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
new file mode 100644
index 0000000000000..37e6ef19a0b34
--- /dev/null
+++ b/drivers/soc/qcom/qmi_tmd.c
[ ... ]
@@ -236,25 +236,54 @@
> +/* Notify the remote subsystem of the requested cooling state */
> +static int qmi_tmd_send_state_request(struct qmi_tmd *tmd, int state)
> +{
> +	struct tmd_set_level_resp resp =3D { 0 };
> +	struct tmd_set_level_req req =3D { 0 };
> +	struct qmi_tmd_client *qmi_tmd_cli =3D tmd->qmi_tmd_cli;
> +	struct qmi_txn txn;
> +	int ret =3D 0;
> +
> +	guard(mutex)(&qmi_tmd_cli->mutex);
> +
> +	if (!qmi_tmd_cli->connection_active)
> +		return 0;

[Severity: High]
Will returning 0 here without saving the new state to tmd->cur_state cause
thermal mitigation updates to be permanently lost?

If the thermal core requests a new state while the remote QMI service is
down, this returns success but drops the state update. When the service
reconnects, qmi_tmd_register() will re-send the old tmd->cur_state to the
hardware.=20

Could this leave the hardware running unmitigated while the thermal framewo=
rk
believes it is actively mitigating?

[ ... ]
@@ -298,34 +327,33 @@
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
Is there a race condition between reading tmd->cur_state here and concurren=
t=20
updates from the thermal core?

When the QMI service reconnects, tmd->cur_state is read outside of the=20
qmi_tmd_cli->mutex. If a thermal trip point is crossed concurrently, could
the following sequence occur:

CPU1: qmi_tmd_register()
  reads tmd->cur_state (e.g., state A) locklessly
 =20
CPU2: qmi_tmd_set_cur_state()
  acquires qmi_tmd_cli->mutex inside qmi_tmd_send_state_request()
  sends state B to hardware
  updates tmd->cur_state =3D B
  releases mutex
 =20
CPU1: qmi_tmd_send_state_request(tmd, state A)
  acquires qmi_tmd_cli->mutex
  sends stale state A to hardware
  reverts tmd->cur_state =3D A

Will this overwrite the new state on the hardware and cause the thermal
framework's view of the mitigation state to become desynchronized?

> +
> +	tmd->cdev =3D thermal_of_cooling_device_register(dev->of_node, index,
> +						       label, tmd, &qmi_tmd_cooling_ops);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-b4-qmi-tmd=
-v7-0-3befd44403d5@oss.qualcomm.com?part=3D2
