Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A32F4071C8
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 10:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593356; cv=none; b=WU+A0QZfz00DCvrxemZFRslO7Vb3xPrI2NOhRojz3cHujHdc/5Ouk0/8woD6+YgNFuq2fS6ASfRZLJpdJHW1kysmEdXJjme5HJiP08pg2Gfkdnt9yyXAsBCRdSIEZy7n4FrYmdP/hxdjtYtjq3Teg17Mn4MXkt59zp9qlzUE6/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593356; c=relaxed/simple;
	bh=0nJt9xkr/N/Mczc2f9gNfDQPW0yWx2vZurcexKRZzzc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GyPIYNVx4uV9Csa9cXBRDUQ4ASWB6SDtlhioFBR9IBCHX/R0gr2GKIPMKg1nZP8PZ9gmMxd4u/hhRd1UC/88qC7enBpC7XHg9vv4ME5akpnavC/lNwyyBaPDzmvv+tzOtfsILZXDNvB5h56nelSSCzvnkNLZu5yu5pGMGvF3YuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LrIjEoij; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LrIjEoij"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A87381F000E9;
	Thu,  9 Jul 2026 10:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783593355;
	bh=oXJelfN07sxFgyajBM7TyhCqy0Upu1z4yNE27y64kkM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LrIjEoijHT1mQ9EdaPkKWPknY4xSOA+pQUEGavv+znDeBY1daGR25eEoWVW9kRuJK
	 ycnHVnNcdQ4PfACS6KM0WFMBu32w6qg3/xA1cVjOk83+i/hfjfUBFf/KVm7mEgk7w4
	 GNMPLaum+9sZJOVQFsBuUjeIetTv6WYvCl/D9HNNmudw5imSA77Ms5C/cV6ElHP4eF
	 KMrgyWJv4cxKGB2XM4J2mLC8UheA8yzSn+CMJ4AOTfO8nyfNx74abXimzlVTlxMHaa
	 zwRmlXeFlFtiNV0/Ddkxv094wbMqkdGsKIqVr7snn67lOnxDfVsewZ/yiOWea+TOgW
	 zeSOpVD3JhKKA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/14] power: sequencing: Add pwrseq_power_is_on()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260709095726.704448-4-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
 <20260709095726.704448-4-wenst@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 10:35:54 +0000
Message-Id: <20260709103554.A87381F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] pwrseq_power_is_on() returns negative error codes for optional des=
criptors and disabled builds, which evaluate to true in boolean contexts an=
d break the optional descriptor pattern.

Pre-existing issues:
- [High] A TOCTOU race condition in the lockless check of desc->powered_on =
causes a reference count leak for unit->enable_count.
--

--- Patch [3]: [PATCH v4 03/14] power: sequencing: Add pwrseq_power_is_on()=
 ---
commit f5ad172d0dbaf149ecc08081af49a9c15c411aa1
Author: Chen-Yu Tsai <wenst@chromium.org>
power: sequencing: Add pwrseq_power_is_on()

This patch introduces pwrseq_power_is_on() to expose the internal power on
state of the power sequencer to consumers. It also adds a fallback stub
for unconfigured builds.

> diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/c=
ore.c
> --- a/drivers/power/sequencing/core.c
> +++ b/drivers/power/sequencing/core.c
> @@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
>  }
>  EXPORT_SYMBOL_GPL(pwrseq_power_off);

[Severity: High]
This is a pre-existing issue, but can the lockless check of desc->powered_on
in pwrseq_power_on() and pwrseq_power_off() cause a reference count leak
for unit->enable_count?

If multiple threads concurrently call pwrseq_power_on() on the same
descriptor, both can bypass the lockless check:

pwrseq_power_on() {
        if (!desc || desc->powered_on)
                return 0;
        // threads proceed and increment unit->enable_count under lock
}

However, when pwrseq_power_off() is called, it will only decrement the count
once, because the first call sets desc->powered_on =3D false. Subsequent
power-off calls return early:

pwrseq_power_off() {
        if (!desc || !desc->powered_on)
                return 0; // early exit
        // ...
        desc->powered_on =3D false;
}

Could this leave the hardware powered on indefinitely and trigger a WARN
on device removal?

> +/**
> + * pwrseq_power_is_on() - Queries the last requested state of the power =
sequencer.
[ ... ]
> + */
> +int pwrseq_power_is_on(struct pwrseq_desc *desc)
> +{
> +	if (!desc)
> +		return -EINVAL;

[Severity: High]
Will this return value break the optional descriptor pattern?

Consumers using optional power sequencers might call this with a NULL
descriptor. Since -EINVAL evaluates to true in a C boolean context,
would this cause the caller to incorrectly assume the power is on?

Could we return 0 here instead, similar to how pwrseq_power_on() gracefully
returns 0 for NULL descriptors?

> +	return desc->powered_on;
> +}
> +EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
> +

[ ... ]

> diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consu=
mer.h
> --- a/include/linux/pwrseq/consumer.h
> +++ b/include/linux/pwrseq/consumer.h

[ ... ]

> @@ -53,6 +54,11 @@ static inline int pwrseq_power_off(struct pwrseq_desc =
*desc)
>  	return -ENOSYS;
>  }
> =20
> +static inline int pwrseq_power_is_on(struct pwrseq_desc *desc)
> +{
> +	return -ENOSYS;
> +}

[Severity: High]
Does this fallback stub cause similar issues for unconfigured builds?

Returning -ENOSYS will also evaluate to true in boolean checks.
Should this return 0 to ensure consistent behavior when POWER_SEQUENCING
is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709095726.7044=
48-1-wenst@chromium.org?part=3D3
