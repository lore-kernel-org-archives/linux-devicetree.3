Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BBB3537F5
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 08:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788512223; cv=none; b=gOMQ4bBqd+SsUcv2gWhKrB7KcSdjntL13wiA90iNHyS9RFzZxScWooaIjhNpd4ootmNx2W1vB3eCAC4N7R6bDx0GkO+DxUR0CY2TGeivWMfWhiiWmFXEURzpuvhive0aucx1v8X/h1E5D6F7WNm0ni6Erk9zT2veElHLFJnF9Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788512223; c=relaxed/simple;
	bh=te6/l1zNdtx4uPXo08X3o5r+tDYR3s2n1MtM6GbanWI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L6YV6DcwqfRzF6aCBAbuZwril4UvfIsxUvExLi3p52yB/pQjxCL19AjM4/EUBv3WEG/BKmz/HZXOdgZDGZ1AdHET514FSIk9ra7pyOIJTJfKQeoEzKpViBW7LQGNZ/HwV7McO7I82/lMuFNwgX+Gjd+49avbW7gkhyxPwYkz5kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LW+64BZR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LW+64BZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FAE1F00A3D;
	Fri,  4 Sep 2026 08:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788512222;
	bh=p8jEoil3AWW9bm9m75q/ULO4Y5r1AIK4A3PcvKLoV/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LW+64BZRnoaaTjfcMs8tQC+YCbBszlOhiq9V7rQvQ6oHbnvgj5zKhoixI8jyi0frT
	 ibgWdkRwqcR/PCSXnYIfSeWlkZda2HzfmEa8z3te7VtniJ3JXhU3Q+qzAVYLnlcjhB
	 aXUB8OqsvRlsrKA/xAEZUxbNRrc8YWGGM6sFVzy3NyRJuldfq3coBDABvYSMsYTPgN
	 t2/uIx1mAj9CtZqT8hd0ANTYYTfLqMuTmN+ndSrv2ZK3sYUMDiX2pG4LsCI06d23+k
	 QbHwHSWnARXSq9LS5sZEgpNG2Q755vuHViXslKMToOaEykW/s6FMDSUsKl68jYCzZ4
	 h/xmaK3ynbtAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 03/16] power: sequencing: Add pwrseq_get_state()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904084158.1341550-4-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
 <20260904084158.1341550-4-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 08:57:01 +0000
Message-Id: <20260904085701.A3FAE1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Data race when reading desc->powered_on locklessly in pwrseq_get_st=
ate()

Pre-existing issues:
- [High] TOCTOU race in pwrseq_enable() and pwrseq_disable() causes permane=
nt resource leak or WARN()
--

commit 5b89b7211c4aa2df354664ebde1b55a332d08712
Author: Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri Sep 4 08:41:42 2026 +0000

    power: sequencing: Add pwrseq_get_state()
   =20
    The power sequencing consumer API already does power on state tracking
    internally. Expose the state to consumers through pwrseq_get_state()
    so that they don't have to reimplement it locally.

> diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/c=
ore.c
> index 721e888b658d1..dbb2bd2f8864e 100644
> --- a/drivers/power/sequencing/core.c
> +++ b/drivers/power/sequencing/core.c
> @@ -968,6 +968,25 @@ int pwrseq_disable(struct pwrseq_desc *desc)

[Severity: High]
This is a pre-existing issue, but could the lockless checks of desc->powere=
d_on
lead to a resource leak or a WARN() due to a TOCTOU race?

If a consumer calls pwrseq_enable() from two threads concurrently, could th=
ey
both bypass the lockless check:

drivers/power/sequencing/core.c:pwrseq_enable() {
    ...
    if (!desc || desc->powered_on)
        return 0;
    ...
}

and then both acquire state_lock and double-increment the provider unit's
enable_count?

A subsequent single pwrseq_disable() would then clear desc->powered_on:

drivers/power/sequencing/core.c:pwrseq_disable() {
    ...
    if (!desc || !desc->powered_on)
        return 0;
    ...
}

causing future disables to return early locklessly. Would this leave the
unit's enable_count permanently elevated?

Additionally, if pwrseq_disable() races with the lockless post_enable() err=
or
rollback path, could it trigger the WARN(1) in pwrseq_unit_disable() due to
underflowing enable_count?

>  }
>  EXPORT_SYMBOL_GPL(pwrseq_disable);
> =20
> +/**
> + * pwrseq_get_state() - Queries the last requested state of the power se=
quencer.
[ ... ]
> +int pwrseq_get_state(struct pwrseq_desc *desc)
> +{
> +	if (!desc)
> +		return -EINVAL;
> +
> +	return desc->powered_on ? PWRSEQ_STATE_ON : PWRSEQ_STATE_OFF;

[Severity: Low]
Does this lockless read of a state variable that is concurrently modified by
writers without READ_ONCE() cause a data race?

Since pwrseq_get_state() can be called concurrently with pwrseq_enable() or
pwrseq_disable(), kernel concurrency rules generally require READ_ONCE() for
lockless reads of shared variables to prevent compiler optimization issues.

> +}
> +EXPORT_SYMBOL_GPL(pwrseq_get_state);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904084158.1341=
550-1-wenst@chromium.org?part=3D3
