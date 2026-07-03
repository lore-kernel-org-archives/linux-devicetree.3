Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900EB2EEE9E
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 05:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055869; cv=none; b=XsImwyJy8+DA7LP5qluFdsFw/LZP72z6SKF9b6RVzXIH2bMfrlUc0PmVlWR+YHJIdpL6SLVKg2fbPJDX/UZajBepkwZveqySaq5QujNqrn5Bguw3aQINshK0VBu9EAYvi1tzlfQkPcMGkctrss157YWKUMiw2SDQlcbvTDFKetE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055869; c=relaxed/simple;
	bh=TA5sKNW/hIcoF0tNyQI0NN0pqggzFgP4tvrxh1efEvc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nqtJpnKbFFH+Af+LRQ7SeLdtgWZ978Rju27F3oMKj1KchZQDUqxdjkKhXhZChVGFSPQM8+syOla+uVtBbKVfPS6vCZbsnizktAcJPszcR8siJe3RM4RZMi9V1+/XE3Vjx865rUa5epwAIS9oDQdNEIYgSn9zwH1BXRfPBapF/AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K0GSA79z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K0GSA79z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28901F000E9;
	Fri,  3 Jul 2026 05:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783055863;
	bh=wLmk3C/BBwNAIj5lU+rNhvS6Um/mdE5rXBz9qxbH9Kc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K0GSA79zj6eZe7jnkA1YDVsWC1/TQ0h3Ye5QZCe8IWqI0Z+BjkgLlqAhsPzpq68F+
	 0UeYrPTCAHHRJYIhxTqgG4LdkZm6haxv/DzF5+1fBiMHAEQLW1CaKxfu20V4DvffyK
	 2nt/5fZoVmx6KQCFMFbOYTU9rdQYYyyFpg6qU96A1YHODMccBm+q+57bnR5I6UUIdI
	 WPGl7Ykp6wwRgRxst/viRKVnRKOe/Gx5+YlEe4HIFvP7GaddYsqNNtU4Z0iTG+Eo9N
	 qU/ucwgi/RUYpSVw0aGDmmtkqZXNLdAfCQiiBvpa3MVTdfp+VlwE8kFTQ5kfgXJBwf
	 sZdDd+FZ2bJxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/10] soc: qcom: Add QMI TMD support for remote
 thermal mitigation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 05:17:42 +0000
Message-Id: <20260703051742.A28901F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Improper teardown sequence in qmi_tmd_exit() creates multiple Use-=
After-Free vulnerabilities.
- [High] Failure to clear tmd->cdev on registration error causes a kernel p=
anic during unregistration.
- [Medium] Time-Of-Check to Time-Of-Use race in qmi_tmd_register() silently=
 drops requested thermal mitigation state.
- [Medium] Size mismatch between mitigation_device_list_len field and QMI e=
lement descriptor causes incorrect decoding on big-endian systems.
- [Low] Missing NET dependency inheritance in Kconfig causes unmet dependen=
cy warnings and potential build failures.
- [Low] Mixing goto-based error handling with __free() and scoped_guard() c=
leanup helpers violates strict cleanup rules.
--

commit f78be8814546ffe0023b5b8c2d56a90a684efe2d
Author: Casey Connolly <casey.connolly@linaro.org>

soc: qcom: Add QMI TMD support for remote thermal mitigation
   =20
Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
Device (TMD) cooling devices provided by remote subsystems.

> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 2caadbbcf8307..44c2b533b494f 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
[ ... ]
> @@ -128,6 +128,16 @@ config QCOM_QMI_HELPERS
>  	tristate
>  	depends on NET
> =20
> +config QCOM_QMI_TMD
> +	bool "Qualcomm remote subsystem TMD" if COMPILE_TEST
> +	depends on ARCH_QCOM
> +	select QCOM_QMI_HELPERS

[Severity: Low]
Does this config need to inherit the NET dependency?

QCOM_QMI_HELPERS depends on NET, so selecting it without a NET dependency c=
an
cause unmet dependency warnings and build failures if COMPILE_TEST is set a=
nd
NET is disabled.

> +	help
> +	  This enables Qualcomm Messaging Interface (QMI) based Thermal Mitigat=
ion
> +	  Device (TMD) support for Qualcomm remote subsystems. It manages

> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_tmd.c
[ ... ]
> +struct tmd_get_dev_list_resp {
> +	struct qmi_response_type_v01 resp;
> +	u8 mitigation_device_list_valid;
> +	u32 mitigation_device_list_len;
> +	struct tmd_dev_list
> +		mitigation_device_list[QMI_TMD_DEV_LIST_MAX];
> +};
> +
> +static const struct qmi_elem_info tmd_get_dev_list_resp_ei[] =3D {
[ ... ]
> +	{
> +		.data_type =3D QMI_DATA_LEN,
> +		.elem_len =3D 1,
> +		.elem_size =3D sizeof(uint8_t),
> +		.array_type =3D NO_ARRAY,
> +		.tlv_type =3D 0x10,
> +		.offset =3D offsetof(struct tmd_get_dev_list_resp,
> +				   mitigation_device_list_len),
> +	},

[Severity: Medium]
Is this element size correct for the target field?

The struct defines mitigation_device_list_len as a u32, but the QMI definit=
ion
specifies sizeof(uint8_t).

On big-endian systems, writing 1 byte to the start of a u32 field populates
the most significant byte, resulting in a massively inflated length value. =
The
loop in qmi_tmd_svc_arrive() would then read out of bounds.

[ ... ]
> +static int qmi_tmd_register(struct qmi_tmd_client *qmi_tmd_cli,
> +			    const char *label, u8 max_state)
> +{
[ ... ]
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
Can this race with qmi_tmd_set_cur_state() and send a stale state to the DS=
P?

qmi_tmd_register() locklessly reads tmd->cur_state here. If a thermal
governor concurrently calls qmi_tmd_set_cur_state() which updates the
requested state, qmi_tmd_register() might read the old state before acquiri=
ng
the mutex in qmi_tmd_send_state_request().

This could result in sending the stale state to the DSP, overriding the
active mitigation.

> +
> +	tmd->cdev =3D thermal_of_cooling_device_register(dev->of_node, index,
> +						       label, tmd, &qmi_tmd_cooling_ops);
> +	if (IS_ERR(tmd->cdev))
> +		return PTR_ERR(tmd->cdev);

[Severity: High]
Should tmd->cdev be set to NULL here on failure?

If thermal_of_cooling_device_register() fails, it returns an ERR_PTR.
Leaving the error pointer in tmd->cdev causes issues during teardown.

> +
> +	return 0;
> +}
> +
> +static void qmi_tmd_unregister(struct qmi_tmd_client *qmi_tmd_cli)
> +{
> +	struct qmi_tmd *tmd;
> +	int index;
> +
> +	for (index =3D 0; index < qmi_tmd_cli->num_tmds; index++) {
> +		tmd =3D &qmi_tmd_cli->tmds[index];
> +
> +		if (!tmd->cdev)
> +			continue;
> +
> +		thermal_cooling_device_unregister(tmd->cdev);

[Severity: High]
Can this dereference an error pointer and crash?

Because qmi_tmd_register() leaves an ERR_PTR in tmd->cdev on failure, the
if (!tmd->cdev) check evaluates to false. thermal_cooling_device_unregister=
()
will then attempt to dereference the error pointer.

> +		tmd->cdev =3D NULL;
> +	}
> +}
> +
> +static void qmi_tmd_svc_arrive(struct work_struct *work)
> +{
> +	struct qmi_tmd_client *qmi_tmd_cli =3D
> +		container_of(work, struct qmi_tmd_client, svc_arrive_work);
> +
> +	struct tmd_get_dev_list_req req =3D { 0 };
> +	struct tmd_get_dev_list_resp *resp __free(kfree) =3D NULL;
> +	int ret, i;
> +	struct qmi_txn txn;
> +
> +	resp =3D kzalloc_obj(*resp, GFP_KERNEL);
> +	if (!resp) {
> +		ret =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	scoped_guard(mutex, &qmi_tmd_cli->mutex) {
> +		ret =3D qmi_txn_init(&qmi_tmd_cli->handle, &txn,
> +				   tmd_get_dev_list_resp_ei, resp);
> +		if (ret < 0)
> +			goto out;

[Severity: Low]
This isn't a bug, but does this function mix goto-based error handling with
__free() and scoped_guard() cleanup helpers?

According to the cleanup guidelines in include/linux/cleanup.h, mixing goto
and cleanup helpers in the same function can create confusing ownership
semantics. It is recommended to convert all resources to scope-based
cleanup, or convert none of them.

[ ... ]
> +void qmi_tmd_exit(struct qmi_tmd_client *qmi_tmd_cli)
> +{
> +	if (!qmi_tmd_cli)
> +		return;
> +
> +	cancel_work_sync(&qmi_tmd_cli->svc_arrive_work);
> +	qmi_handle_release(&qmi_tmd_cli->handle);
> +	qmi_tmd_unregister(qmi_tmd_cli);
> +
> +	scoped_guard(mutex, &qmi_tmd_cli->mutex)
> +		qmi_tmd_cli->connection_active =3D false;
> +}

[Severity: High]
Does this teardown sequence create multiple use-after-free conditions?

First, if svc_arrive_work is cancelled before qmi_handle_release() is calle=
d,
an incoming server event can immediately re-queue the work via
qmi_tmd_new_server() since the QMI socket is still active. When the device
unbinds, qmi_tmd_cli is freed, and the workqueue will execute on the freed
structure.

Second, qmi_handle_release() destroys the QMI handle (including the txns ID=
R)
before the thermal cooling devices are unregistered and before
connection_active is set to false. During this window, a concurrent sysfs
write could invoke qmi_tmd_send_state_request(), see
connection_active =3D=3D true, and attempt to use the destroyed IDR:

Sysfs thread:
qmi_tmd_send_state_request()
   if (!qmi_tmd_cli->connection_active) // Still true!
   ret =3D qmi_txn_init(&qmi_tmd_cli->handle, ...) // UAF on txns IDR

Should this sequence clear connection_active and unregister the thermal
devices first, then release the QMI handle, and finally cancel the workqueu=
e?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-qmi-tmd-v4=
-0-3882189c1f83@oss.qualcomm.com?part=3D3
