Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D5A345EA1
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784878439; cv=none; b=i2PUFNpicRNkrQ68HsYVoBjaPASZFH5L3/cTeESDnjOBo5gxxdGg5IL3fcKkAPwzyJAMf5EX1A4u71seQjKhEtapipXDCbvD4TquL2+kJQ3FRCejnDRu0pNK1MV2f6ayqybSgJNvpDvEYVOO/MkZuYH6Wp9tWRfgn2VWpOQamDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784878439; c=relaxed/simple;
	bh=zraYvd4owQhyCCMIhUiQgCmyoz85i0Qb/R2ViJhqi6o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EztN+mYeepa5Q98A0gVkmo7tLFVKgiGm5hDLQunOW7ENOIy6tZDwOQpS6jXJlOyM1jtxiyqjbUAvHPY7HtGphio6AYvYuwlz352x8lZ/WXByJ/r235LTCYLcbEbLpyDGwJdY/mO+EOFdPrxvj/Yisc+ano5rQkNohy3cov1BxZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XB6qC54Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XB6qC54Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A051F000E9;
	Fri, 24 Jul 2026 07:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784878438;
	bh=AQKINsOC+4jRzIbKkvyKZyOqz7S23SFtG01/zKN9Oyc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XB6qC54QkHR0BF6LOutnBFDJlv8NGo2gC8kG+GCuPmWEEGtLN15zbzVExZ0PD9gir
	 rWFEyObbeJVVL4ME2sjzgk5YLZJGMQm5sFrtpXGxe2rZmkdD56TlekogyUdAMX0Abx
	 mgCczmuOT+G5/CvhfuOGc4xap0n83B3rvCzpNcsozpeLbAnJLSvRnywW9XRbsxS0k4
	 JPitJJDU93rdD36LcpMHz/1P6RbOjPcKpL1JlBPfJu9PG6FKILTmgLpJc57xBH2mCY
	 kRw0SlPO0g2hQ3UIH2O8UpdvCwlDKmDrxBVcLndCF6OhHswsXCMQ3Ed2NTL7QLKjJa
	 qjToWuIYau0cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 06/10] PM / devfreq: Add a governor for tracking
 remote device frequencies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-6-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-rfc_v8_scmi_memlat-v1-6-cb732bcff1f4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:33:57 +0000
Message-Id: <20260724073357.C2A051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The remote tracking governor corrupts observed frequencies and cau=
ses continuous log spam due to core PM QoS clamping and exact OPP matching.
- [Medium] Missing validation of `get_cur_freq` during `DEVFREQ_GOV_START` =
causes infinite error log flooding.

Pre-existing issues:
- [High] Bypassing the IMMUTABLE governor restriction allows a local attack=
er (root) to trigger a NULL pointer dereference by switching a TRACK_REMOTE=
 device to a mutable governor.
--

--- Patch [6]: [PATCH RFC 06/10] PM / devfreq: Add a governor for tracking =
remote device frequencies ---
commit dc71eb5d4b37ce705f4a10bb03bda903dcd75d0b
Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

PM / devfreq: Add a governor for tracking remote device frequencies

This commit adds a new "remote" devfreq governor that uses the track_remote
flag to expose a remote device's frequency to userspace via trans_stat. The
governor avoids advertising DEVFREQ_GOV_ATTR_TARGET_FREQ and acts strictly =
as
an observer.

> diff --git a/drivers/devfreq/governor_remote.c b/drivers/devfreq/governor=
_remote.c
> new file mode 100644
> index 0000000000000..df3819757e56f
> --- /dev/null
> +++ b/drivers/devfreq/governor_remote.c
> @@ -0,0 +1,73 @@

[ ... ]

> +static int devfreq_remote_track_handler(struct devfreq *devfreq, unsigne=
d int event, void *data)
> +{
> +	switch (event) {
> +	case DEVFREQ_GOV_START:
> +		devfreq_monitor_start(devfreq);

[Severity: Medium]
Should the governor validate the presence of get_cur_freq before starting
the monitor?

If a device profile is missing the get_cur_freq callback,
devfreq_remote_track_func() returns -ENXIO. This error is intercepted by the
core devfreq_monitor() function, which logs 'dvfs failed with (-6) error' a=
nd
reschedules the delayed work, leading to an infinite flood in the system
logs.

Could we check for get_cur_freq during governor initialization or before
calling devfreq_monitor_start() to fail gracefully?

> +		break;

[ ... ]

> +static struct devfreq_governor devfreq_remote_track =3D {
> +	.name =3D DEVFREQ_GOV_REMOTE,
> +	.attrs =3D DEVFREQ_GOV_ATTR_POLLING_INTERVAL
> +		| DEVFREQ_GOV_ATTR_TIMER,
> +	.flags =3D DEVFREQ_GOV_FLAG_IMMUTABLE

[Severity: High]
This is a pre-existing issue, but I wanted to point out a potential
vulnerability when using DEVFREQ_GOV_FLAG_IMMUTABLE.

If the governor_remote module is unloaded, devfreq_remove_governor() stops
it and sets df->governor to NULL. A privileged user could then write a new
mutable governor name (like simpleondemand) to the device's governor sysfs
node.

In the core governor_store() function, the IMMUTABLE security check is
entirely bypassed if !df->governor is true:

drivers/devfreq/devfreq.c:governor_store() {
    if (!df->governor)
        goto start_new_governor;

    if (df->governor =3D=3D governor) {
        ...
    } else if (IS_SUPPORTED_FLAG(df->governor->flags, IMMUTABLE)
        ...
}

When the new mutable governor runs devfreq_set_target() without the
TRACK_REMOTE flag, it will blindly call devfreq->profile->target(). Since
TRACK_REMOTE devices intentionally omit the .target callback, this leads to=
 a
NULL pointer dereference.

> +		| DEVFREQ_GOV_FLAG_TRACK_REMOTE,

[Severity: High]
Does the use of DEVFREQ_GOV_FLAG_TRACK_REMOTE interact correctly with PM QoS
clamping?

The devfreq_remote_track_func() provides the raw observed frequency. Howeve=
r,
the core devfreq_update_target() applies local PM QoS constraints to this
tracked frequency.

Because DEVFREQ_GOV_FLAG_TRACK_REMOTE bypasses the driver's .target callbac=
k,
the frequency is never rounded to a valid OPP:

drivers/devfreq/devfreq.c:devfreq_set_target() {
    if (devfreq->governor &&
        IS_SUPPORTED_FLAG(devfreq->governor->flags, TRACK_REMOTE)) {
        freqs.old =3D devfreq->previous_freq;
        freqs.new =3D new_freq;
        ...
        goto update_status;
    }
}

When this clamped, unrounded frequency is passed directly to
devfreq_update_status(), it will fail to find an exact match in the
freq_table and return -EINVAL. This causes a continuous log spam of
'Couldn't update frequency transition information' on every polling interval
and breaks trans_stat metrics.

> +	.get_target_freq =3D devfreq_remote_track_func,
> +	.event_handler =3D devfreq_remote_track_handler,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-rfc_v8_scm=
i_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com?part=3D6
