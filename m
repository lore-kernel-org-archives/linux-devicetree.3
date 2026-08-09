Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3012FBE
	for <devicetree@vger.kernel.org>; Sun,  9 Aug 2026 12:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786279639; cv=none; b=fiJRWmE/APzlwgxQViIvNGFrSGuRjEyYVGo2AZjzEBWoTwp5RVY8iLfrhZq48WeDm9M4/VEmYxCrnrQOyPDhs7tuoZ9wXtbiDQe9ZT7Sb+IzA1SedzG26fWie4RIYzHI7sQO8Ai2KpVa/qb02gmMsagZxPfKfso/Ba0pwtObCRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786279639; c=relaxed/simple;
	bh=cbEqo0J3sgV0Y9r0GjnP+mbaeuSCQM97YlkhyXzn6w4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NVLPdLdO4EaO7Pt+noB99iADot0W2dmrPSKCiHuKpuIhDSdPcAS4dYx0h+v7947YYoPs7JOCOsJ6arkbgxLq1tQTW0gZf4ccFw2qsgrjs043zqW4802RtJMDSuiWx19c+ZozlQbLIOcqEJMwf4xvg5ituh7AKRFx0qa5VYwE7Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SK6gsIMc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SK6gsIMc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97E61F000E9;
	Sun,  9 Aug 2026 12:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786279638;
	bh=yE1zKTmpxjGsOXiF5iaro3ipv20jVdzy8uN9ukC6eG8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SK6gsIMcpfBUrjpT/kQWGIULcqsvhBSFVwI3TstHhS0MqNyQKBGRkbiukZlgbAvYv
	 /AQ81VV4v/Bs3VBexF4Hvg1M+xltKH7smpAyhOq3MHYoKQ3AjNCb0Yc6A0MzwXcmpB
	 KSXg+6iFgbdthtjnIYQ9yAMH+7vMkvePtEYoUfjr9Zf1OmSN0tFN3vC3w7YZQwLc/D
	 DOaET30+SFJYrRtYl4oe6G/C9YxSrr2s3bAgDocwycFS9s5QGA5vLThT7l68tBR4en
	 tdpAeZv+lelqa7+QOgVv8UOak2d19jAF1QxKoOJzG3xnZFYDn7nUI8Xb35oBMneoid
	 xEizigbf/9lDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/9] soc: qcom: Add QMI TMD support for remote
 thermal mitigation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-2-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 09 Aug 2026 12:47:17 +0000
Message-Id: <20260809124717.E97E61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Subsystem guideline violation: Mixing `goto`-based error handlin=
g with scope-based `__free()` and `scoped_guard()` declarations.
- [Medium] Data races on `tmd->max_state` and `tmd->cur_state` violating do=
cumented thermal lock semantics during QMI server restarts.
- [Medium] Out-of-bounds read in `qmi_tmd_register` due to unverified strin=
g null-termination from the remote QMI subsystem.
--

--- Patch [2]: [PATCH v8 2/9] soc: qcom: Add QMI TMD support for remote the=
rmal mitigation ---
commit 3146a8e00a4c8c2a3c39c7e5a390154a8fbfd945
Author: Casey Connolly <casey.connolly@linaro.org>

soc: qcom: Add QMI TMD support for remote thermal mitigation

Add support for Qualcomm Messaging Interface (QMI) based Thermal Mitigation
Device (TMD) cooling devices provided by remote subsystems.

> diff --git a/drivers/soc/qcom/qmi_tmd.c b/drivers/soc/qcom/qmi_tmd.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/soc/qcom/qmi_tmd.c
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

[Severity: Medium]
If the remote processor sends a mitigation_dev_id that exactly fills the
33-byte array without a null terminator, will this dev_dbg() statement read
past the end of the buffer when printing the string?

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
> +	if (tmd->cdev) {
> +		guard(mutex)(&qmi_tmd_cli->mutex);
> +
> +		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
> +	}

[Severity: Medium]
Can this result in a data race on tmd->max_state and tmd->cur_state?

The code in qmi_tmd_get_cur_state() documents that cur_state is protected
by the thermal core's cdev->lock. However, max_state is updated here without
holding any lock, and the call to qmi_tmd_send_state_request() updates
cur_state while holding only qmi_tmd_cli->mutex.

Will concurrent readers executing thermal framework callbacks see torn or
stale values?

[ ... ]
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
> +		if (qmi_tmd_cli->exiting)
> +			return;
> +
> +		ret =3D qmi_txn_init(&qmi_tmd_cli->handle, &txn,
> +				   tmd_get_dev_list_resp_ei, resp);
> +		if (ret < 0)
> +			goto out;

[Severity: Medium]
Is it safe to mix goto error handling with __free() and scoped_guard() in
this function?

The cleanup subsystem guidelines document that functions should either use
goto-based cleanups or scope-based cleanups, but never mix them.

Additionally, using a goto label to escape a scoped_guard() block violates
the expected scope lifetime, and defining variables with split
initialization like __free(kfree) =3D NULL before later assignment is stron=
gly
discouraged.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260809-b4-qmi-tmd=
-v8-0-b15d47adc379@oss.qualcomm.com?part=3D2
