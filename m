Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4B74119F4
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 10:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785494953; cv=none; b=BrM2sx8HGXSB8v0wju0RT1DsNttc3FiLMiMwM5CjcKOL+U20xSYCfhA6mnXBihbSOTM7hRvnct8Hpa/A8LRt18z/3Q5A2IXb1C2HpOkyOkoib4qOD/+tZUdDGb3U1uEISMblZvR8Qtk7QPHiFDgSTrX+SB6CsPhskm2kS5GmWak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785494953; c=relaxed/simple;
	bh=jIwUgujFOLxiUPExPARVN//gOzynpnYFjr1JQeEBRQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AeTk8arHc10Cudzf4aXMIEK4aLeuInUUtFH444SYw8mfnEPm6cVAEPuSHBCc4teMVxzRmBeprUQLYJE+2QERV7idUeInN5y0GclM9X6U5pwdl+wWC5BbxMmtWAYQ1BsfqSUzhWC48vfxyqon6b7aQaFJ6ZohvVdvqh0gwnMt2Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAbB2ou/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAbB2ou/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098D11F000E9;
	Fri, 31 Jul 2026 10:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785494943;
	bh=yZBFbHq/UJhnvBqMciznh3+YDSK75R5gU7J7Wppfqds=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZAbB2ou/sf3Fz6iHdbcvCmMy7eTiZ2jQqUU0f05NYT13+bvEntNaZ1nBw/UkmGjXG
	 d/fM0P1w2F2vbxGR+T66VLtzrdM/ATodC3Gu8FOGEm15zEGTGMfY5oK6vwEHTRQ4mr
	 X0p8X4JFynT2g0BtY935saEn735WIsbGJNpcCsvpiKeaRknHQgrHWOjQVq/FwwJYkT
	 Cy68DQmXW18HDKPC0jCl/nbT+Q/lLwAzW2ZZsI0/0yRgvRJt2J9bt+Qim4twNuQTvo
	 7BzvzAOtxvGE+E4K9QWtAvVA11yq/UZgCLMy9LXTfHX1nB7lBPeGHvAlcsXEdO5GKv
	 8YD+nUQskCH/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/9] remoteproc: qcom: pas: add support for TMD
 thermal cooling devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260731-b4-qmi-tmd-v7-3-3befd44403d5@oss.qualcomm.com>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-3-3befd44403d5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 10:49:02 +0000
Message-Id: <20260731104903.098D11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] TOCTOU race in qmi_tmd_register and disconnected state desynchroni=
zation.
--

--- Patch [3]: [PATCH v7 3/9] remoteproc: qcom: pas: add support for TMD th=
ermal cooling devices ---
commit 89eed46353741313ceea667539ac871767ff067e
Author: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>

remoteproc: qcom: pas: add support for TMD thermal cooling devices

This commit registers Thermal Mitigation Devices (TMDs) for PAS-managed
remote processors to enable thermal throttling through QMI. It allows the
thermal framework to request mitigation when remote subsystems such as modem
and CDSP contribute to thermal pressure.

> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom=
_q6v5_pas.c
> index 25599d7282083..b9c01ce5024ed 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
[ ... ]
> @@ -798,6 +817,64 @@ static void qcom_pas_unassign_memory_region(struct q=
com_pas *pas)
>  	}
>  }
> =20
> +static int qcom_pas_setup_tmd(struct qcom_pas *pas, const struct qcom_pa=
s_data *desc)
> +{
[ ... ]
> +	tmd_inst =3D qmi_tmd_init(pas->dev, desc->tmd_instance_id, tmd_names,
> +				desc->num_tmd);

[Severity: High]
Does this expose a TOCTOU race condition and state desynchronization in the
underlying QMI TMD driver?

Looking at qmi_tmd_register() in drivers/soc/qcom/qmi_tmd.c, tmd->cur_state
is read locklessly before invoking qmi_tmd_send_state_request():

drivers/soc/qcom/qmi_tmd.c:qmi_tmd_register() {
	...
	if (tmd->cdev)
		return qmi_tmd_send_state_request(tmd, tmd->cur_state);
	...
}

A concurrent call to qmi_tmd_set_cur_state() by the thermal core can execute
between this read and the QMI request, meaning the workqueue could send the
old state to the hardware and overwrite the thermal core's newly requested
state.

Additionally, when qmi_tmd_send_state_request() is called while the
connection is not active (e.g., during a remote subsystem restart), it
returns 0 without updating the state:

drivers/soc/qcom/qmi_tmd.c:qmi_tmd_send_state_request() {
	guard(mutex)(&qmi_tmd_cli->mutex);

	if (!qmi_tmd_cli->connection_active)
		return 0;
	...
}

The thermal core assumes the update was successful, but the old state is
retained. When the connection is restored, qmi_tmd_register() restores the
old state, permanently dropping the thermal core's requested state.

Can this cause the thermal core and the remote hardware mitigation state to
become permanently desynchronized?

> +	if (IS_ERR(tmd_inst)) {
> +		ret =3D PTR_ERR(tmd_inst);
> +		if (ret =3D=3D -ENODEV)
> +			return 0;
> +
> +		return ret;
> +	}
> +
> +	pas->tmd_inst =3D tmd_inst;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-b4-qmi-tmd=
-v7-0-3befd44403d5@oss.qualcomm.com?part=3D3
