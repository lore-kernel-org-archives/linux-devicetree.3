Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929413B4432
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883329; cv=none; b=NyFgouyi8SrcoJBhTrQDSbi1Y5JbeBA78HwZD8hFK8qNmoDF+sltFfewjZQV0djfirwCLwBgiCBOVuc2wcOdwS7ZK2IwEg3OW0llttsenznPTeR4mHJsfDgIQdKkaY2LkZvfGjOqfZnk7YUx2ElXyr8YEDkhT9u7tSkgCauRioo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883329; c=relaxed/simple;
	bh=JSDUVykXzVbxnycwI3C1qMFTLzKRsxkEgv5d//DJYC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l1uFE9o9PyNqI2XNQJLFBGg9Ab2kojJHVVuk5sanedkUZ2DH1p9KUbDPH3YRLasDjqyXH7fIV1vxbwcxGOq3NZ1AMUvLVsR6GgDXzeQ6a2TLd0o/98pMlm1T4dbELg5C1qYw28Z6lKFHwhDitlLzU24Hx+09kxfAiKbnZaf9uIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o0vqAKnk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o0vqAKnk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D31BC1F000E9;
	Fri, 24 Jul 2026 08:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883328;
	bh=MIFNjin2lNLQfF0hYWqvrr6ubqoLouP8w5yluyvD7OM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o0vqAKnk1JWLAqjT5GaBZPpgIiJNMcQJ65n0qBg8Nxzf4VsJEQ/gHJRBJ6uDo4dhd
	 JmjScuE9wnNQSy+xm2KCXdztcDii8Y/ucj0c2Ubsfi0HRxCiWPas+2JmhJSzT5iknE
	 WpRi5cLygkzv/4JFFBqlW+XvWDbIMi3CaN1p/v7QwHJzpyr8Qe4adcsxPo02bLO5NS
	 iq5I5tn5Nkwc/luDDaJcitjOmGtcnAKvAX6KQBtfzjNcCsxEhH58mzTfFhSazP8F2e
	 tjHtxa11uOkZbxagDiNuiZGqIpLRiZpzjtAnZQSPa4FExmRnm2VwpGLioOr0exlweV
	 H+uBBzSzsBgdA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 5/5] clocksource: dw_apb_timer: Use reset array API
 to handle all resets
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260724084437.1850-1-dongxuyang@eswincomputing.com>
References: <20260724084153.1473-1-dongxuyang@eswincomputing.com>
 <20260724084437.1850-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 08:55:27 +0000
Message-Id: <20260724085527.D31BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch dynamically allocates an exclusive reset control array u=
sing the unmanaged `of_` API but fails to free it, permanently locking shar=
ed APB resets and deadlocking other devices.
--

--- Patch [5]: [PATCH v13 5/5] clocksource: dw_apb_timer: Use reset array A=
PI to handle all resets ---
commit 015418d722b66a454000fd7a9c2606bea3f7e18b
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

clocksource: dw_apb_timer: Use reset array API to handle all resets

This patch updates the timer initialization to fetch and pulse all reset li=
nes
specified in the device tree by switching to the reset array API.

> Replace it with devm_reset_control_array_get_optional_exclusive() to
> fetch and control all reset lines listed in the device tree, ensuring
> every line is properly asserted and deasserted rather than only the first.

[Severity: Low]
This isn't a bug, but the commit message mentions using the managed
devm_reset_control_array_get_optional_exclusive function, while the code
below actually uses the unmanaged of_reset_control_array_get_optional_exclu=
sive
function.

> diff --git a/drivers/clocksource/dw_apb_timer_of.c b/drivers/clocksource/=
dw_apb_timer_of.c
> --- a/drivers/clocksource/dw_apb_timer_of.c
> +++ b/drivers/clocksource/dw_apb_timer_of.c
[ ... ]
> @@ -29,9 +29,11 @@ static int __init timer_get_base_and_rate(struct devic=
e_node *np,
>  	/*
>  	 * Reset the timer if the reset control is available, wiping
> -	 * out the state the firmware may have left it
> +	 * out the state the firmware may have left it.
> +	 * Use array variant to handle multiple resets (e.g., timer
> +	 * and APB interface resets) if specified in the device tree.
>  	 */
> -	rstc =3D of_reset_control_get(np, NULL);
> +	rstc =3D of_reset_control_array_get_optional_exclusive(np);
>  	if (!IS_ERR(rstc)) {
>  		reset_control_assert(rstc);
>  		reset_control_deassert(rstc);
>  	}

[Severity: High]
Does this code leak the exclusive reset control array?

Since of_reset_control_array_get_optional_exclusive is used instead of the
managed devm variant, the returned rstc needs to be manually freed.

Because this API acquires exclusive references to the resets (which the
comment notes might include shared APB interface resets), exiting
timer_get_base_and_rate without calling reset_control_put(rstc) leaves
these resets permanently locked.

Could this prevent other devices on the bus from acquiring their shared
resets during probe by returning -EBUSY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724084153.1473=
-1-dongxuyang@eswincomputing.com?part=3D5
