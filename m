Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB73F9F5C
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781089700; cv=none; b=KXFS71gQbEjz6PHEbk3IYd0GNkSpGGRczU1whQSRNFSNKkCsATU8Pc0C7xXhqlYCHntdYXXOriXKK483USxXAW3HgDEF6BJq8sv1IqKE+YbYxcrNkiNhH70EULe897A0T04txWO7JKr9N0z8CP5z4h4ieRhIxG6VxkFpOr8eWMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781089700; c=relaxed/simple;
	bh=ekrDcWoe4r1NVCcDM0wNmn0Id/mcuLXFUB5tQx+Qofc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AuBGgGJdYmd5kPY8V8PVSt/l2J10/dCcLKmPq4b6iIv3yS06CPqE0LXBZ/lmou3FKVRBZTm/sIe7P0LypbfQ0SU1exmeUrlE42xkQsbRQiH2FE5QagRP6+PeI0zg6i4jpFCCNU8wyor9HM0UL27nMo/xq3PkSoxw9OCqa6v1Qc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEJmIZ4Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEJmIZ4Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D37E71F00893;
	Wed, 10 Jun 2026 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781089693;
	bh=1MllshQWLpZii3U6fESOxl0bY7vf2XUXsljUjggJQ9k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OEJmIZ4ZniFEAODsGkl2IRsm+pEPklUvCBEcF/oOK0G8PB3N0FhwYi7HqJqQEj/kR
	 5VZKX/KtW8KgzkQ6DYMZBtc+jPXIHcQ+EIlSD1mbQdCljzKrUN8mo73yUpRNBGY2A/
	 6CH8ihCCAnPtuYKxkMeBpmmG/okjWhUTp1cSu9zApU7Lx+WyY94TjlYJ2z/P1idEZg
	 ffQHYYCJIJVsbD8ixs01HtfEOGAfCZ30oOrhlAq/fX+fdipGVQUUuq31DD7qjfRquX
	 JqXiLCu+x+bbEA7jsurq6eWdeyKqTC+/o0WOaoag17Zp+wLBbqliuhYXchdKd7hff8
	 qn8wny+Xs6+ZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v7 6/9] PM / devfreq: Add a governor for tracking
 remote device frequencies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-6-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-6-f3f68c608f25@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 11:08:12 +0000
Message-Id: <20260610110812.D37E71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] DEVFREQ_GOV_FLAG_TRACK_REMOTE inappropriately clamps the tracked f=
requency to local PM QoS limits and bypasses OPP rounding, breaking statist=
ics and tracepoints.
- [High] Unloading an `IMMUTABLE` governor bypasses the immutable restricti=
on, allowing incompatible governors to bind and crash the kernel via a miss=
ing `.target` callback check.
- [Medium] Missing validation of `get_cur_freq` during governor start cause=
s unbounded dmesg log spam.

Pre-existing issues:
- [High] Time-of-Check to Time-of-Use (TOCTOU) race conditions and unprotec=
ted reads during governor removal lead to NULL pointer dereferences or Use-=
After-Free crashes.
--

commit a561d57fcfe231ac7e70741f77838221fbcf0815
Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

PM / devfreq: Add a governor for tracking remote device frequencies

This commit adds a new "remote" devfreq governor that uses the track_remote
flag to expose a remote device's frequency to userspace. It deliberately
does not advertise the target frequency attribute since the kernel cannot
set it on a remote-managed device.

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
> +		break;

[Severity: Medium]
Will this cause unbounded dmesg log spam if a device fails to provide the
get_cur_freq callback?

If a device registers with the remote governor but lacks the
devfreq->profile->get_cur_freq callback, the governor successfully starts.

On every polling interval, devfreq_monitor() calls update_devfreq(), which
invokes devfreq_remote_track_func(). This returns -ENXIO, causing
update_devfreq() to log 'dvfs failed with (-6) error' to the console.

Since the delayed work is re-queued unconditionally, this will spam the log.
Should DEVFREQ_GOV_START validate the presence of get_cur_freq and return
-EINVAL if it is missing?

[ ... ]

> +static struct devfreq_governor devfreq_remote_track =3D {
> +	.name =3D DEVFREQ_GOV_REMOTE,
> +	.attrs =3D DEVFREQ_GOV_ATTR_POLLING_INTERVAL
> +		| DEVFREQ_GOV_ATTR_TIMER,
> +	.flags =3D DEVFREQ_GOV_FLAG_IMMUTABLE
> +		| DEVFREQ_GOV_FLAG_TRACK_REMOTE,

[Severity: High]
Does the use of DEVFREQ_GOV_FLAG_TRACK_REMOTE here cause the tracked
frequency to be clamped and bypass OPP rounding?

When the remote governor returns the actual frequency via get_target_freq(),
devfreq_update_target() incorrectly clamps this observed frequency against =
the
local PM QoS min_freq and max_freq bounds.

The clamped frequency is then passed to devfreq_set_target(). Because
DEVFREQ_GOV_FLAG_TRACK_REMOTE is set, devfreq_set_target() bypasses the
profile->target() callback and the frequency is never rounded to a valid
discrete OPP.

This clamped, unrounded frequency is recorded into trans_stat, time_in_stat=
e,
and tracepoints, causing them to report false data if the remote device
operates outside local bounds.

Furthermore, because the frequency typically doesn't match a discrete
freq_table entry, devfreq_update_status() returns -EINVAL, spamming the
log with 'Couldn't update frequency transition information'.

[ ... ]

> +static void __exit devfreq_remote_track_exit(void)
> +{
> +	int ret;
> +
> +	ret =3D devfreq_remove_governor(&devfreq_remote_track);

[Severity: High]
Can unloading this module bypass the DEVFREQ_GOV_FLAG_IMMUTABLE restriction
and lead to a NULL pointer dereference?

Devices using the remote governor omit the .target callback because
frequencies are managed externally. The governor uses
DEVFREQ_GOV_FLAG_IMMUTABLE to prevent users from switching to a governor th=
at
would invoke the missing callback.

When this module is unloaded, devfreq_remove_governor() forcefully stops it
and clears devfreq->governor. The core forgets the device was immutable,
allowing a user to bind a non-remote governor via sysfs.

When the new governor calls devfreq_update_target(), it eventually invokes
devfreq_set_target().

Since devfreq_set_target() unconditionally calls devfreq->profile->target()
without checking if it is NULL, would this result in a kernel panic?

[Severity: High]
This isn't a bug introduced by this patch, but does calling
devfreq_remove_governor() here expose a race condition leading to a
use-after-free or NULL pointer dereference?

Devfreq governor modules are not pinned with try_module_get() as the
devfreq_governor struct lacks an owner field, meaning they can be unloaded
while devices are actively using them.

devfreq_remove_governor() sets devfreq->governor =3D NULL while holding
devfreq_list_lock but without acquiring devfreq->lock.

Concurrently, execution paths like devfreq_update_target() read or check
devfreq->governor while holding only devfreq->lock.

If a concurrent PM QoS notifier or sysfs write passes the
if (!devfreq->governor) check, and the governor module is removed immediate=
ly
after, the subsequent call to devfreq->governor->get_target_freq() will
dereference a NULL pointer or execute unmapped module text.

> +	if (ret)
> +		pr_err("%s: failed to remove governor %d\n", __func__, ret);
> +}
> +module_exit(devfreq_remote_track_exit);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610-rfc_v7_scm=
i_memlat-v7-0-f3f68c608f25@oss.qualcomm.com?part=3D6
