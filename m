Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5463E3DA2
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106527; cv=none; b=NWGzODBa088dC4ianQCWTdHSHX5qjLnUuMengbAVYSIPhoZ1xRY6pDlKO8nFnlGKnGptGeogFa+WJHQiJhoxQ+mIGBsYSpF6i/fneZWa6Wnq4M3cuUBXbag4HnyzR6+Qg2MCpZ98khtV/x+DFteGXhcOCDDYvvXrXYeSKVWJwPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106527; c=relaxed/simple;
	bh=0RXsWghRInBDk4UyfWlhAOA9h3GcNKFcDQAOzMhwCZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WdVfe8VLM4WXShZMKS+z7Rx3NyBrGy5/qADBNfM2YCPqrTGeHEU2F9ee5E9FwsIh4ExQ8rcgfJg6TFPF00YaLaXfRywozPL1pUEFZo9oiF3XN8mhznQVJSk2uKKe22QMob4kWFL1v3f1r7xHDCUSOy3LYxlgS3Akb1lKLdvl2lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O1c8wJm6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O1c8wJm6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1561F000E9;
	Wed, 15 Jul 2026 09:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784106525;
	bh=F1UsryzJNhgOIwO8WAQz6hw83ITJHzetM231WkAZ9Gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O1c8wJm6IoYGLYq2YnbRxMU3Xk+LG+u6EmCU+uDWejqTyANvDo5I8CQdfPMe6rEfR
	 d5DcXaYOg+Mq6wg4ypwjlVq/DIdkLVTTDsuRkZBGMbQ6T3rJ9Wwy0fNaX9FW9170xE
	 j/PmbOkCq8LuWvYrLDKi0aTgag6z6W4eHewAXxAmx68EYWsniW4D5uC90oc5tRW3xr
	 DXmGEiJl5obgPRBvuRwfPqu64QP+Z+gv4ZXVgGvAtWbDzUZ8V2dwwU4Zao3PKYqw1t
	 KF4GwECVMP0whQ0/cvvHawX/1MwjiIdbUdSarA0bKCz3N/CWnaMRIlhYlXfwHu4XrG
	 3b8x1z/mTU8vQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260715085348.3457359-4-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
 <20260715085348.3457359-4-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 09:08:44 +0000
Message-Id: <20260715090845.3E1561F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The !CONFIG_POWER_SEQUENCING stub for pwrseq_power_is_on() uncon=
ditionally returns -ENOSYS, breaking support for optional descriptors.
- [Medium] Unprotected lockless read of `desc->powered_on` in `pwrseq_power=
_is_on()` constitutes a data race.

Pre-existing issues:
- [High] The stubs for pwrseq_power_on() and pwrseq_power_off() uncondition=
ally return -ENOSYS, breaking optional descriptors when CONFIG_POWER_SEQUEN=
CING is disabled.
- [High] Lockless TOCTOU race on `desc->powered_on` in `pwrseq_power_on()` =
and `pwrseq_power_off()` allows concurrent calls to leak `enable_count` ref=
erences.
--

--- Patch [3]: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()=
 ---
commit 32144de8b3a9da0a0745b35617cfc4d0359911df
Author: Chen-Yu Tsai <wenst@chromium.org>

power: sequencing: Add pwrseq_power_is_on()

This commit introduces pwrseq_power_is_on() to expose the internal power-on
state tracking to consumers, eliminating the need for local tracking. The A=
PI
handles optional descriptors by returning 1 if the descriptor is NULL.

> diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/c=
ore.c
> index 02f42da915985..db8c91be10c95 100644
> --- a/drivers/power/sequencing/core.c
> +++ b/drivers/power/sequencing/core.c
> @@ -968,6 +968,25 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(pwrseq_power_off);

[Severity: High]
This is a pre-existing issue, but could the lockless check of
desc->powered_on in pwrseq_power_on() and pwrseq_power_off() cause a race
condition that leaks enable_count references?

If two threads concurrently invoke pwrseq_power_on() with the same descript=
or,
both could bypass the early check locklessly:

    if (!desc || desc->powered_on)
        return 0;

They then sequentially acquire pwrseq->state_lock, but neither re-validates
the flag inside the critical section. Both execute pwrseq_unit_enable(),
incrementing enable_count twice.

When pwrseq_power_off() is called later, the first invocation decrements the
count and clears desc->powered_on. The second invocation sees
desc->powered_on =3D=3D false locklessly and returns early, leaving enable_=
count
permanently elevated.

> +/**
> + * pwrseq_power_is_on() - Queries the last requested state of the power =
sequencer.
> + * @desc: Descriptor referencing the power sequencer.
> + *
> + * This returns the last requested state of the power sequencer.
> + *
> + * Returns:
> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
> + * negative error number on failure.
> + */
> +int pwrseq_power_is_on(struct pwrseq_desc *desc)
> +{
> +	if (!desc)
> +		return 1;
> +
> +	return desc->powered_on;

[Severity: Medium]
Does this lockless read of desc->powered_on need READ_ONCE() to prevent data
races?

Since desc->powered_on can be concurrently modified by pwrseq_power_on()
and pwrseq_power_off(), reading it without protection might lead to unsafe
compiler optimizations.

> +}
> +EXPORT_SYMBOL_GPL(pwrseq_power_is_on);

[ ... ]

> diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consu=
mer.h
> index 3c907c9e1885d..3c6122bd02057 100644
> --- a/include/linux/pwrseq/consumer.h
> +++ b/include/linux/pwrseq/consumer.h

[ ... ]

> @@ -53,6 +54,11 @@ static inline int pwrseq_power_off(struct pwrseq_desc =
*desc)
>  	return -ENOSYS;
>  }

[Severity: High]
This is a pre-existing issue, but do the stubs for pwrseq_power_on() and
pwrseq_power_off() also break optional descriptors?

If a driver invokes pwrseq_power_on(NULL) on a kernel without power
sequencing enabled, returning -ENOSYS instead of 0 defeats the purpose of
an optional descriptor, as consumers checking for errors will abort their
operations.

> +static inline int pwrseq_power_is_on(struct pwrseq_desc *desc)
> +{
> +	return -ENOSYS;
> +}

[Severity: Medium]
When CONFIG_POWER_SEQUENCING is disabled, does this stub break the contract
for optional descriptors?

The commit message mentions returning 1 if the descriptor is NULL (optional=
),
but this stub unconditionally returns -ENOSYS. This will cause consumers
checking the power state of an optional descriptor to receive a negative
error code instead of the expected 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715085348.3457=
359-1-wenst@chromium.org?part=3D3
