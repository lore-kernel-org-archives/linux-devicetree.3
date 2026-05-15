Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC833F9290
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 16:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862073; cv=none; b=LjAbxwRhMGHEueI6UGv0AwGs4cQTxoanXkdFiWQy0rvFJfehQtYA+4/HLbmN6V8WPkmMDL7ZTD2pIToODP1/8HXqFpDLI3eqsvRovqmk+j+ZbsgMX295otG+2yoPeF2LX2VNR1fBqAT14yiTOnHhjeUQpgh5upqQpeAy5WSIfYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862073; c=relaxed/simple;
	bh=RQqIhEWugvBThRGcRyaNdNRz5t1DuaSeeUrIqCesg5k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XIXXlQQZrjz5oh3SVDfhkx+Kk7ceZJ4WjYPov9RTtfXt0OV3eBcEF0UGqKxViLGnn3yLYAsaiGDcc8bT/myKUnDawUvb2+cfrRreSrt7tdjgIfOTwSE62iVZn+MQRQYiRprVtjtmG/wG7z4dU+PsMZz+Cw/S7j961joa8NhfOuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQNo/YVD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQNo/YVD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C35AC2BCC7;
	Fri, 15 May 2026 16:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778862073;
	bh=RQqIhEWugvBThRGcRyaNdNRz5t1DuaSeeUrIqCesg5k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SQNo/YVDB2ndEEl8gMoRpnVdT5xpEz/7URjJHWNUEsWLg1vVpgS7ivN2ae83nWe5s
	 oiPCxsja8c29ub3L0O6upteFMb26zZ4AUa4U4GepGMZE+HZtaN1pko8P7v2egXuNL2
	 BDFP52sbOugIHOKhYza5ro0bRiIq1wLL2+t0Cw709wC+5tgBZMqcGpMT4ODnm8gA9e
	 euFMqqlBnruud7U8nLzw/ic5gisbD0bzpq/G0Bnv6HJOwNEkJGMt5Of7X9XwAto6t+
	 tgR7KzmO9dhbEO3P1LkaghkkM5JPdkX/JW8yLmXXAQ4klPLOxBLFdZwwhRGk8kHYbm
	 eJXLcPnQ0oNnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 6/6] docs: iio: adc: ad4691: add driver
 documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau via B4 Relay" <devnull+radu.sabau.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260515-ad4692-multichannel-sar-adc-driver-v11-6-eab27d852ac2@analog.com>
References: <20260515-ad4692-multichannel-sar-adc-driver-v11-6-eab27d852ac2@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 16:21:11 +0000
Message-Id: <20260515162112.5C35AC2BCC7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] IIO ABI violation and architectural anti-pattern regarding per-cha=
nnel attributes implicitly mutating shared global hardware state.
- [Low] Documentation inaccurately attributes the handling of the `reset-gp=
ios` property to the reset controller framework.
--

commit 503be5723d887e52797574aecacc47811e35f4b5
Author: Radu Sabau <radu.sabau@analog.com>

docs: iio: adc: ad4691: add driver documentation

This commit adds RST documentation for the AD4691 family ADC driver,
covering supported devices, IIO channels, operating modes, oversampling,
reference voltage, LDO supply, reset, GP pins, SPI offload support,
and buffer data format.

> diff --git a/Documentation/iio/ad4691.rst b/Documentation/iio/ad4691.rst
> new file mode 100644
> index 0000000000000..84492ef7a5d61
> --- /dev/null
> +++ b/Documentation/iio/ad4691.rst
[ ... ]
> +Oversampling
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +In CNV Burst Mode each channel has an independent hardware accumulator t=
hat
> +averages a configurable number of successive conversions. The result is =
always
> +returned as a 16-bit mean, so ``realbits`` and ``storagebits`` are unaff=
ected
> +by the oversampling ratio. Valid ratios are 1, 2, 4, 8, 16 and 32; the d=
efault
> +is 1 (no averaging). Oversampling is not supported in Manual Mode.
[ ... ]
> +Writing ``oversampling_ratio`` stores the new depth for that channel and
> +snaps the internal oscillator to the largest valid table entry that is b=
oth
> +less than or equal to ``old_effective_rate =C3=97 new_osr`` and evenly d=
ivisible
> +by ``new_osr``. This preserves an integer read-back of
> +``in_voltageN_sampling_frequency`` after the change and keeps the oscill=
ator
> +as close as possible to the previous effective rate.
> +
> +All channels share one internal oscillator. Writing ``sampling_frequency=
`` for
> +any channel updates the oscillator and therefore affects the effective r=
ate
> +read back from all other channels.

Does this break IIO ABI semantics? Attributes that control shared hardware
state must be exposed as shared attributes, such as shared_by_type, rather
than per-channel attributes.

If per-channel attributes implicitly mutate a global clock, could this
break deterministic configuration? Userspace initialization scripts
attempting to configure channels sequentially will experience unpredictable
side-effects, as configuring one channel's OSR or frequency will silently
overwrite the shared oscillator state configured by a previous channel.

[ ... ]
> +Reset
> +=3D=3D=3D=3D=3D
> +
> +The driver supports two reset mechanisms:
> +
> +* **Hardware reset** (``reset-gpios`` in device tree): asserted at probe=
 by
> +  the reset controller framework.

Is this description accurate regarding the reset controller framework?

The reset-gpios property is parsed and handled by the GPIO subsystem, while
the reset controller framework manages the resets property. Could this
conflate the two subsystems and mislead users about which bindings are used?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ad4692-mul=
tichannel-sar-adc-driver-v11-0-eab27d852ac2@analog.com?part=3D6
