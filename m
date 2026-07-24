Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2611F192E
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784878292; cv=none; b=rKJdOKONpBy8P6Zz6q3wGGY+sU6aWwfTs1x4id1Ltm+kLpvCY5IfY+ech6/q2iSXURS39kBU9XwyxghI77do+LM9liM8C7gEMLMk0BtqMfyDXmr0CUuu1k9gfebLIbQkgG74k8jpgkiAhynCDODYtxYhwBf3hcO2MK+k+2rI1bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784878292; c=relaxed/simple;
	bh=Ggqwh/qXVUfqEhVcxtOz+d8qmprV13EUQJqPGtZJuZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ntqSQolJxzQNm3RLQZvwL4s/QX9VMjVL71qMlSlY+SH8anAigwCvwelZ83iP7UruVquj9+Z+QuabgnVegUxvB24arY2CPyLJ4jMm31NE2ssmYZ/8juDvTfZTmGMHLlgQTYtevI1ScE8b7AtI8nVokHP3uIjkiD4nxPt8e1/Fz2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MV4EFzym; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MV4EFzym"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12F331F000E9;
	Fri, 24 Jul 2026 07:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784878291;
	bh=htc4RcBPVBcvVLPb2MEf3+fXIMq1z9omwmKptybx3ac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MV4EFzymuUPSXcRTmQ3ZulQZNebqqoGOY4C5rkX7EQS/TPjL1R+4dcLt81NqcdApO
	 7DwqfqmQ18m/cwLw4rU3wUuIF6KFuctdThMjAQuMm6lyqDPgWMCvO46RhZNljUre9t
	 TdKwrTcFxC6lijxewRIijt7t7l3PATInq+5mgxpXQ+kzFa8bGrCIVsg7whciu3H19G
	 9jCZ034QJueDl7ZXYC8O+LBpzLqxyggxoBPqAtKp80Mr8iyYMnMBPhjmf1a1p/82re
	 W4HURD2qeSShQbQuI5Ar6CdmBeyctP4U3PmSTORy122V8+/66txf1lbw+By8m3Ezg+
	 DpYyvIgE5XYmw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 05/10] PM / devfreq: Add new track_remote flag for
 governors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-5-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-rfc_v8_scmi_memlat-v1-5-cb732bcff1f4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:31:30 +0000
Message-Id: <20260724073131.12F331F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Skipping `profile->target()` for `TRACK_REMOTE` bypasses OPP frequ=
ency rounding, causing state desynchronization and permanently failing `dev=
freq_update_status()` on QoS-clamped frequencies.
--

--- Patch [5]: [PATCH RFC 05/10] PM / devfreq: Add new track_remote flag fo=
r governors ---
commit 3b4a905187566fcb4b261840b1355a57916fec6b
Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

PM / devfreq: Add new track_remote flag for governors

Some devfreq governors need to track frequency changes performed on remote
devices rather than driving the frequency updates themselves. Add a new
DEVFREQ_GOV_FLAG_TRACK_REMOTE governor flag to skip the local target() call
and just keep its transition statistics and notifiers in sync.

> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index 2f27a239e34a6..71c6ced9e4e1d 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -348,6 +348,26 @@ static int devfreq_set_target(struct devfreq *devfre=
q, unsigned long new_freq,
>  	unsigned long cur_freq;
>  	int err =3D 0;
> =20
> +	/*
> +	 * When a remote agent (e.g. firmware) owns the frequency, skip the
> +	 * local profile->target() call. Still emit the PRECHANGE/POSTCHANGE
> +	 * pair and the trace event so that transition-notifier subscribers
> +	 * (passive governor, devfreq cooling, etc.) and tracing observe the
> +	 * frequency change exactly as they would on the normal path.
> +	 */
> +	if (devfreq->governor &&
> +	    IS_SUPPORTED_FLAG(devfreq->governor->flags, TRACK_REMOTE)) {
> +		freqs.old =3D devfreq->previous_freq;
> +		freqs.new =3D new_freq;
> +		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_PRECHANGE);
> +
> +		if (trace_devfreq_frequency_enabled() && new_freq !=3D freqs.old)
> +			trace_devfreq_frequency(devfreq, new_freq, freqs.old);
> +
> +		devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
> +		goto update_status;

[Severity: High]
Does skipping profile->target() here cause issues with unrounded frequencie=
s?

When a frequency update occurs, devfreq_update_target() can clamp the
requested frequency to a PM QoS limit (e.g., min_freq) that might not be an
exact valid OPP frequency.

By skipping profile->target() (which normally rounds the frequency to a val=
id
OPP), this unrounded frequency is passed directly to devfreq_update_status()
via the goto.

Inside devfreq_update_status(), devfreq_get_freq_level() requires an exact
match in the freq_table. If the unrounded frequency is not found, it fails
and returns < 0, preventing stats updates and leaving previous_freq as an
invalid OPP.

> +	}
> +
>  	if (devfreq->profile->get_cur_freq)
>  		devfreq->profile->get_cur_freq(devfreq->dev.parent, &cur_freq);
>  	else

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-rfc_v8_scm=
i_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com?part=3D5
