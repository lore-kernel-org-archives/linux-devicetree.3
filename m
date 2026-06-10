Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660CB3B42ED
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 09:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082327; cv=none; b=c+PLOxQcnOpw+n/RLe/RvFSB5Sn1UgUJOr2boK/ByWbkGKbVLrGOsvWA7I57aJmNG7ZWi+umOz0H9X3Yz5tUQDLKoE/E5f6fnn7U4kzxXlznXcFvwmUitaI9GhfPV46Ces16XTkJ7kC9HtiLodaFcP1hEz7neTaviQOgHhNqx5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082327; c=relaxed/simple;
	bh=yAsgKtf3AQPdZJ4vCLm5aMr7ZMI+/zFq2sCZXUMWvqc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DSIPiXWFMCWCZqnWq9GMLazudXQH+OwVCojkZSN0M1SSbrPuBilv925wfrU6gt4pjWkbxCNu0Wd7AGMZRPt4cTXv3KeJhfyAqK19QAepikegti8aGaNbbW0oCDnTBMdIriScF3OSIFBirY696yLjzpblSNCyk5nMRq17j7U1Dp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQM9NoJb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQM9NoJb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1007E1F00898;
	Wed, 10 Jun 2026 09:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082326;
	bh=FrovIqUaFeZNKASHFeDdUhB77vDAAioxaNiO0Dl1DWI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KQM9NoJbNg1liSpT3xSNkUcmDKYcfCsq0dIAIpC4yOLX8zvpEo5G4+K5cnK6VrITG
	 sclD8IlELhrY/jfVWeZRKok3VQ2t+/uTro+6ybodCe2t87DHsp5igOCXBL7uhK/pvX
	 RFYuEdGRgnbXpwsnSfGPs7C2ruxSypgG46prr9qOQurNrxmOHWpukO7C4gxOM4XSm8
	 AjZUiBVtwHm17pvOkI7xRE9jYw3tpXo1f6Toeie/K4NbuiYs4INe3K8eUPF4UWE6ED
	 QFMA3Wn+vAa4dJpb8svyw1Cms6xVu9krpquJUlXJxqpKMkZZnbhAa+dNyiSgRjCx7j
	 BQICVXdYHZZQg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 5/9] PM / devfreq: Add new track_remote flag for
 governors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-5-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-5-f3f68c608f25@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 09:05:25 +0000
Message-Id: <20260610090526.1007E1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Bypassing `profile->target()` for `TRACK_REMOTE` governors leaves =
`new_freq` unaligned to exact OPP frequencies, permanently breaking transit=
ion statistics and causing a warning flood.

Pre-existing issues:
- [High] Unprotected read of `devfreq->governor` can lead to a NULL pointer=
 dereference or use-after-free due to concurrent modification.
- [High] The resume_freq state variable is incorrectly overwritten with sus=
pend_freq during suspend transitions, preventing the device from properly r=
estoring its pre-suspend frequency on resume.
--

commit fa5d93fe675fe1183dc1fbfcc716761f517b7cf0
Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

PM / devfreq: Add new track_remote flag for governors

Some devfreq governors need to track frequency changes performed on remote
devices rather than driving the frequency updates themselves. In such cases,
the device's frequency is already updated by an external entity and devfreq
only needs to keep its transition statistics and notifier subscribers in sy=
nc.

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

[Severity: High]
This is a pre-existing issue, but does this evaluation of devfreq->governor
risk a NULL pointer dereference in drivers/devfreq/devfreq.c?

If governor_store() concurrently sets devfreq->governor to NULL,
devfreq->governor could be evaluated as true for the check, but then become
NULL when dereferencing devfreq->governor->flags in devfreq_set_target().

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
Will bypassing profile->target() cause transition statistics to permanently
break due to unaligned frequencies?

In drivers/devfreq/devfreq.c:devfreq_update_target(), the frequency is
clamped against PM QoS bounds before calling devfreq_set_target():

	if (freq < min_freq) {
		freq =3D min_freq;
		flags &=3D ~DEVFREQ_FLAG_LEAST_UPPER_BOUND; /* Use GLB */
	}
	if (freq > max_freq) {
		freq =3D max_freq;
		flags |=3D DEVFREQ_FLAG_LEAST_UPPER_BOUND; /* Use LUB */
	}

Since we skip profile->target() here, unaligned PM QoS values are passed
directly to devfreq_update_status(). Inside devfreq_update_status(),
devfreq_get_freq_level() attempts to find an exact match in the OPP table:

	lev =3D devfreq_get_freq_level(devfreq, freq);
	if (lev < 0) {
		ret =3D lev;
		goto out;
	}

This mismatch causes devfreq_update_status() to return an error, triggering=
 a
warning flood. Further, previous_freq will be updated to this invalid
frequency, causing all future status updates to fail the prev_lev check.

> +	}
> +
>  	if (devfreq->profile->get_cur_freq)

[ ... ]

> @@ -375,6 +395,7 @@ static int devfreq_set_target(struct devfreq *devfreq=
, unsigned long new_freq,
>  	freqs.new =3D new_freq;
>  	devfreq_notify_transition(devfreq, &freqs, DEVFREQ_POSTCHANGE);
> =20
> +update_status:
>  	if (devfreq_update_status(devfreq, new_freq))
>  		dev_warn(&devfreq->dev,
>  			 "Couldn't update frequency transition information.\n");

[Severity: High]
This isn't a bug introduced by this patch, but does the following code at t=
he
end of devfreq_set_target() incorrectly overwrite the resume frequency duri=
ng
suspend?

	if (devfreq->suspend_freq)
		devfreq->resume_freq =3D new_freq;

When devfreq_suspend_device() in drivers/devfreq/devfreq.c is called, it
explicitly initiates a transition to suspend_freq:

	if (devfreq->suspend_freq) {
		mutex_lock(&devfreq->lock);
		ret =3D devfreq_set_target(devfreq, devfreq->suspend_freq, 0);

This overwrites devfreq->resume_freq with the suspend_freq, which prevents =
the
device from restoring its actual active pre-suspend frequency on resume.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-rfc_v7_scm=
i_memlat-v7-0-f3f68c608f25@oss.qualcomm.com?part=3D5
