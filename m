Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F3239021C
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 07:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784878556; cv=none; b=h1zh60pLOxWb6qTwFmItroHkBqnOpH67V/z7EUT0i8GFD0y374xWD2nGuiIbaI7g77ZRwqrtL9Ew0a5Kt2WPf9Aqxcj5pXM1qOBBrrAFHjdfNcLaNSJZSL0EWgTJhR/XCC2X0bHe4NfEgUd4R+EtPtM4jeveB3ecRcQGQvMBh+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784878556; c=relaxed/simple;
	bh=aZnClPxxC840fW9EhiW2LBDRUEVyljuqDqWJAzZ8kKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jm++W3R/5xml5eKHX+rXvyVd7TeLaGBSn0Z4BxcUs4MyDxQz7gHTMSqW1+PR2UYyWcWNoDLZbppww+jQ69nLLJADVTRGWje54LVBwBcHojCAx2sLzyzW+j4qkerimi0FBvEtWOfCCn77U+qA57GqfEppc2KtGzQ7nFd+zD+52rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoIUGyvd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoIUGyvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B307C1F000E9;
	Fri, 24 Jul 2026 07:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784878555;
	bh=qR6uqqNPfG+nvioRThBjXyLOOBGt8C2eLpS0WeGRJhU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VoIUGyvdVcYGkR33lJPkywZRjo+BZPW2sXWj8q6Iszesr62qsjclbPRV8qDVt3zq5
	 fm9HeMlUmhmDwa5ofNlJoGe0Wb52LScfUDLcKCtjcCGL9U7HL+vpVOlOsvSuA+cKwG
	 cK3r7ZbpWSwMvn58CK0gJnUmHrBzIDqIzYA+fzwo9dXZ63IfxBnMyHx3r58fP1yr6H
	 n0AibBkABV4DHH5g4/l1FryX/hLbkd9rjSbykqKHWihE+zE8BpCpHQOYi24xBR5kLq
	 zKj0Cec4WnOgE+mTR8wcZ6q/U9FVsKForh4AvRKr48nL/cej9yF3vo7cAWN/FGk42l
	 d0uMhJot0p9Ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 04/10] PM / devfreq: Add new target_freq attribute
 flag for governors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pragnesh Papaniya" <pragnesh.papaniya@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-4-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-rfc_v8_scmi_memlat-v1-4-cb732bcff1f4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 07:35:54 +0000
Message-Id: <20260724073554.B307C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] An ABBA deadlock between kernfs active references and `devfreq_lis=
t_lock` can occur when a sysfs attribute in `gov_attr_group` is accessed co=
ncurrently with a governor switch.
- [High] Reading the `governor` sysfs attribute can cause a Use-After-Free =
due to a missing lock.
--

--- Patch [4]: [PATCH RFC 04/10] PM / devfreq: Add new target_freq attribut=
e flag for governors ---
commit 270fe8b349c3594b09be3beb4f4386f10ac713aa
Author: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

PM / devfreq: Add new target_freq attribute flag for governors

This commit adds a new DEVFREQ_GOV_ATTR_TARGET_FREQ flag for devfreq govern=
ors.
It gates the existing target_freq sysfs read on this flag, returning -EINVAL
if the active governor does not advertise it.

> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index f08fc6966eaee..2f27a239e34a6 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -1530,6 +1530,12 @@ static ssize_t target_freq_show(struct device *dev,
>  {
>  	struct devfreq *df =3D to_devfreq(dev);
> =20
> +	guard(mutex)(&devfreq_list_lock);
> +

[Severity: High]
This isn't a bug introduced by this patch, but since we are modifying the
devfreq sysfs locking here, could there be an ABBA deadlock between kernfs
active references and devfreq_list_lock involving the governor attributes?

If a userspace process writes to the governor sysfs file, governor_store()
takes devfreq_list_lock and calls sysfs_update_group():

drivers/devfreq/devfreq.c:governor_store() {
    ...
    ret =3D sysfs_update_group(&df->dev.kobj, &gov_attr_group);
    ...
}

This causes create_files() to unconditionally remove the group's attributes
(like timer) via kernfs_remove_by_name(), which waits for all active
references to drain:

fs/sysfs/group.c:create_files() {
    ...
    kernfs_remove_by_name(parent, (*attr)->name);
    ...
}

Concurrently, if another userspace process reads the timer sysfs file:

drivers/devfreq/devfreq.c:timer_show() {
    ...
    guard(mutex)(&devfreq_list_lock);
    ...
}

The sysfs core holds the active reference to the timer node and calls
timer_show(), which blocks trying to acquire devfreq_list_lock, completing
the ABBA deadlock.

[Severity: High]
This is a pre-existing issue, but while we are adding devfreq_list_lock here
to safely access the governor, does governor_show() have a Use-After-Free
risk because it lacks this lock?

If governor_show() accesses df->governor without holding devfreq_list_lock:

drivers/devfreq/devfreq.c:governor_show() {
    ...
    return sprintf(buf, "%s\n", df->governor->name);
}

Concurrently, if a governor module is unloaded, devfreq_remove_governor()
acquires devfreq_list_lock, stops the governor, and clears df->governor.
After it returns, the module memory is freed. If governor_show() evaluates
df->governor as non-NULL before it's cleared, gets preempted, and then
resumes after the module is freed, could the dereference of
df->governor->name access freed memory?

> +	if (!df->profile || !df->governor ||
> +	    !IS_SUPPORTED_ATTR(df->governor->attrs, TARGET_FREQ))
> +		return -EINVAL;
> +
>  	return sprintf(buf, "%lu\n", df->previous_freq);
>  }

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-rfc_v8_scm=
i_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com?part=3D4
