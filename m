Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F48D379C2A
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 11:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785412350; cv=none; b=iORqTtIp9wONKBeE+BNXcZ5DR7fXl+hPcwNn9ejENkU/O6xhNtBL0B0wa3HbKEiP9bNQ1BXrWcRg5lJE2Qk5+fbaonw0ufO5UJfDHKT2rQ7V2mjfes+U1roPjrJjMDp2p+1n3PexQVE6yHGMPFRCejvj7tDOLo42F6eJE9otCmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785412350; c=relaxed/simple;
	bh=vNCEXxMJi83DVyaNH3OB9K0a5+xaxjyt+qpLgxkeLXM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GqyxL4EXaYULOOHyX0g+PcRaGwsUGry8dFYst5JEYy0z2jXDaFI/LpEYI+mpCyFAapwyqByuaZrXipE07Rtsp+W9HZkskLD3RtRW4Rbwwl7gLntTPUGGAYc2y4Fc/ZW1hc7t8qPymeu7KoJOW7J+/TSoEpIK0nguciLNrD0UJ3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBQebuQG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBQebuQG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 145411F000E9;
	Thu, 30 Jul 2026 11:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785412349;
	bh=vUutGb6boGJUvNztm0BTwA9Rp3FdAi/JFT+Bq51nGJY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NBQebuQGRb5SjkmuK/2NnJNLnmVAnNPbgQ55mNsFf9BX2/dGex5VWY61zQF5ogLfK
	 gdw6umup6v48t0OHPohv3iWlkC3S48ApD4ioxZb4n7CyKUsgPls3+oduK6IgkO8RQn
	 p+yiXTQiKsLhnMdaLUtXo9SJlyxRUM15FQsAHJK5MrHnm+du0V3KExmpNubOUXO7D6
	 2FNM2gn1qGzzGVdMKQc8Wsq5hr1GNSsJvjDYNBhuJBbCy/jhcOH6pnIPs5+tkl+spo
	 a4Abma4t4vcDt5KJQA1TE5so/fgdW9IGt0EV6MgM5NIrmWVviIQe5iWGL2cMCb3/Zz
	 JrYWB8WUToRoA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v14 5/5] clocksource: dw_apb_timer: Use reset array API
 to handle all resets
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260730111628.1990-1-dongxuyang@eswincomputing.com>
References: <20260730111425.1680-1-dongxuyang@eswincomputing.com>
 <20260730111628.1990-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 11:52:28 +0000
Message-Id: <20260730115229.145411F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Exclusive acquisition of a shared bus reset blocks other devices o=
n the bus from probing and may inadvertently reset the entire bus.
--

--- Patch [5]: [PATCH v14 5/5] clocksource: dw_apb_timer: Use reset array A=
PI to handle all resets ---
commit 66ef3e54cc1daa673ec2f6b658e0a17fb7f358ab
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

clocksource: dw_apb_timer: Use reset array API to handle all resets

This commit updates the timer initialization to fetch and trigger all
reset lines listed in the device tree using the array variant of the
reset API. It intentionally holds exclusive references to these lines
to keep them deasserted while the timer runs.

> diff --git a/drivers/clocksource/dw_apb_timer_of.c b/drivers/clocksource/=
dw_apb_timer_of.c
> --- a/drivers/clocksource/dw_apb_timer_of.c
> +++ b/drivers/clocksource/dw_apb_timer_of.c
> @@ -29,9 +29,14 @@ static int __init timer_get_base_and_rate(struct devic=
e_node *np,
> =20
>  	/*
>  	 * Reset the timer if the reset control is available, wiping
> -	 * out the state the firmware may have left it
> +	 * out the state the firmware may have left it.
> +	 * Use the array variant to fetch and trigger all reset lines
> +	 * (e.g., timer and APB interface resets) together, without
> +	 * ordering requirements.
> +	 * The exclusive references are intentionally held to keep the
> +	 * resets deasserted while the timer is running.
>  	 */
> -	rstc =3D of_reset_control_get(np, NULL);
> +	rstc =3D of_reset_control_array_get_optional_exclusive(np);

[Severity: High]
If any of these reset lines are shared bus resets, does acquiring them
exclusively lock out other devices that share the same reset line?

The commit message mentions APB interface resets, which are typically shared
across multiple peripherals. If this driver holds a shared reset line
exclusively, subsequent reset_control_get() calls from other drivers sharing
the bus will fail with -EBUSY, preventing them from probing.

Furthermore, unconditionally asserting a shared bus reset here in
timer_get_base_and_rate() might inadvertently reset other peripherals on the
same bus that are already initialized. Does the timer driver need to use a
shared reset API to avoid disrupting other devices on the bus?

>  	if (!IS_ERR(rstc)) {
>  		reset_control_assert(rstc);
>  		reset_control_deassert(rstc);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730111425.1680=
-1-dongxuyang@eswincomputing.com?part=3D5
