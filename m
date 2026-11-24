Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795480841;
	b=tPFNhv7JkZYCxV3II3j7idMSjXftalJ88f3grLXEUWwDUWGGLaiPze9JesOfN8oq5jiY
	 bbk+uu8baYWHLLFuegZaCJAvjJxuHqlYvIyxJmOzNBqXhS7vYooir/CvhvCxc38NLduCj
	 QPAkExJ/62BnNWBRHh7qJRJuOvUQIWNPR5FAgcU5tmWTwD7KUSxjrWOer0dFr/NsBzy1l
	 swXH/qCR6IKCMA58ecTERrTJBmXosNRlqk059d0sR/TOtMF03OOcuOfzlmJtuaiy2Snxu
	 Yu8ijdbOB4Gh0fVCaeW0aBoOIHBAngOmJ0sxENlYk1kQ+2d/sXecjAHzd5vDuukJ+ZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795480841;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=WczDa/DdtekPr78ZQiSSWKxGrLszSJ6wbNBUvaiGJIE=;
	b=rRDQ2h4yjE0xzPWIerSJu4lFYSiOG4xvXrhDmK3ds3L6HFcXQB0T0L08EKP3AT077N8M
	 Zuh38ORTIxA1x3xKw1biWa0B/gN2W1XeMmE7UU4bo245Q+evYku2oOTuVa5Gu2UClhSCL
	 6mLoI5KOk+ewXJL7VYeh70lNa+AnvxLMewInIClUmhhmvf73OeypDd72NG0hZrMnaRpdX
	 vtJ6ODX1htFm5pufKPhMToX368p8WWDETC5vaXcvQg7UFXOcm++epD3jJ4CA23sBOMvwR
	 Ue/t/UyI8TwZahTkh8F0CUh8Kxd5nYYPnc8Kb5UukqvR+fb5S3X5qGAeMAA7UlOArOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="oNIF6j/L";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA2B606A331;
	Tue, 24 Nov 2026 00:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oNIF6j/L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 616B11F00A19;
	Tue, 24 Nov 2026 00:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795480841;
	bh=WczDa/DdtekPr78ZQiSSWKxGrLszSJ6wbNBUvaiGJIE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=oNIF6j/Lee/Zcnwk7Sjl9pCHorv2aOJqMT+aUhYBs2TsKEX1Aw57nSyDUYC4l/bLh
	 ReKbufuA7HuXVw3ldkX9n+TwqTm31y8uuK4mqkWVQlcTzZnRKNRenVIpP2RCVLih2w
	 A1Zh3o/J+grtwySfk079x6Whqs5lJMjCpsgPGJwWkVaxAsaC7hk4hxAR/O5JMtKIkG
	 sfu7davvAqFbXdP3ezHF7thm6izLNE+Xt+bmsVlcCNhJ0jj9fhavgbjPdQIeqKQI5d
	 5UtVRaqf+GduTFeezFKBRUZRwcxiXAUzep+oe0YN03ppOkk02Ab9qsQ1QSrGF50DaW
	 tERv3KmBI6G9Q==
Subject: Re: [PATCH net-next v16 05/13] dpll: sit9531x: read DPLL types and
 pin properties from system firmware
From: netdev-bot+sashiko@kernel.org
To: arouhi@sitime.com
Cc: jiri@resnulli.us, vadim.fedorenko@linux.dev,
 arkadiusz.kubalewski@intel.com, ivecera@redhat.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 cjubran@nvidia.com, Oleg.Zadorozhnyi@devoxsoftware.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 24 Nov 2026 00:40:39 +0000
Message-ID: <179548083991.3135.257746872384905150@kernel.org>
In-Reply-To: <20261119225752.41846-6-arouhi@sitime.com>
References: <20261119225752.41846-6-arouhi@sitime.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] At this commit nothing writes ref[].sig_mode, so it stays
  SIT9531X_MODE_SE from devm_kzalloc().
- [Low] When an output has no supported-frequencies-hz,
  sit9531x_pin_props_get() advertises a hard-coded continuous range,…

--

dpll: sit9531x: read DPLL types and pin properties from system firmware

This adds prop.c. It reads the DPLL type from the firmware node, plus
each pin's label, connection type and supported frequencies, and uses
defaults when the node doesn't provide them. An output with no
supported-frequencies-hz is advertised as one continuous frequency
range.

> diff --git a/drivers/dpll/sit9531x/core.h b/drivers/dpll/sit9531x/core.h
> index 0f826313eff8c..7a81c9b14b7fd 100644
> --- a/drivers/dpll/sit9531x/core.h
> +++ b/drivers/dpll/sit9531x/core.h

[ ... ]

> @@ -41,6 +49,35 @@ struct sit9531x_chip_info {
>  	const u8	*clkout_map;
>  };
>  

[ ... ]

> +/*
> + * struct sit9531x_ref - input reference state
> + * @freq: configured frequency in Hz
> + * @sig_mode: signal mode of the input pair, read from CLKINx_INPUT_MODE at
> + *   probe
> + */
> +struct sit9531x_ref {
> +	u64		freq;
> +	enum sit9531x_signal_mode	sig_mode;
> +};

[Severity: Low]
This isn't a bug, but is this kernel-doc accurate at this point in the
series?

Nothing in this commit writes ref[].sig_mode, so it stays at
SIT9531X_MODE_SE from the zeroed allocation. That means the differential
branch in sit9531x_input_pin_label() can't run yet:

    if (sitdev->ref[id].sig_mode == SIT9531X_MODE_DE)
        snprintf(props->package_label,
                 sizeof(props->package_label), "IN%u", pair);

The binding's pin numbering text ("A pair the loaded configuration runs
differential is one input, described at 2k") also has no effect until
then.

A later patch in the series fixes this. In "dpll: sit9531x: register
DPLL devices and pins", sit9531x_input_mode_fetch() reads
CLKINx_INPUT_MODE for every pair at probe and sets both lanes:

    sitdev->ref[pair * 2].sig_mode = sig_mode;
    sitdev->ref[pair * 2 + 1].sig_mode = sig_mode;

So the per-lane ref[id] lookup here gets the right value. Also, nothing
calls sit9531x_pin_props_get() at this commit, so no wrong label can be
registered in the meantime.

Would it be clearer to add this kernel-doc text in the same patch as
sit9531x_input_mode_fetch()?

> diff --git a/drivers/dpll/sit9531x/prop.c b/drivers/dpll/sit9531x/prop.c
> new file mode 100644
> index 0000000000000..b9405eba49a39
> --- /dev/null
> +++ b/drivers/dpll/sit9531x/prop.c
> @@ -0,0 +1,327 @@

[ ... ]

> +skip_fwnode_props:
> +	if (sync_in || sync_out)
> +		return props;
> +
> +	/*
> +	 * An output with no listed rates gets one wide range, as the setter
> +	 * checks Fvco/N; the XO gets its one rate.
> +	 */
> +	ranges = kcalloc(num_freqs + 1, sizeof(*ranges), GFP_KERNEL);

[ ... ]

> +	if (!num_freqs && dir == DPLL_PIN_DIRECTION_OUTPUT) {
> +		ranges[j].min = 1;
> +		ranges[j].max = 1000000000ULL; /* 1 GHz */
> +		j++;

[Severity: Low]
Where does the 1 GHz upper bound in sit9531x_pin_props_get() come from?
It isn't derived from the part's limits, and it doesn't match the
setter added later in the series.

In "dpll: sit9531x: add support to get and set frequency on pins",
sit9531x_output_freq_set() accepts any exact Fvco/N up to U32_MAX:

    if (frequency > U32_MAX)
        return -EINVAL;
    ...
    if (divo > SIT9531X_DIVO_MAX)
        return -EINVAL;

Fvco is at least 4.9152 GHz, so dividers from 2 to 7 give about 1.1 to
3.9 GHz across the VCO bands. However, dpll_pin_freq_set() in
drivers/dpll/dpll_netlink.c checks the advertised ranges before it calls
the driver:

    if (!dpll_pin_is_freq_supported(pin, freq)) {
        NL_SET_ERR_MSG_ATTR(extack, a, "frequency is not supported by the device");
        return -EINVAL;
    }

On a board with no supported-frequencies-hz in DT, can a DPLL_CMD_PIN_SET
above 1 GHz ever reach sit9531x_output_freq_set()? It looks like the
core would always return -EINVAL for those divider values. The uAPI
would then report a ceiling that doesn't come from the hardware. I
couldn't confirm from the tree whether the output buffers can actually
drive more than 1 GHz.

The 1 Hz lower bound is fine. SIT9531X_DIVO_MAX is GENMASK_ULL(33, 0),
so 1 Hz is an exact Fvco/N.

Also, the comment says "as the setter checks Fvco/N", but that setter
only arrives in the later commit mentioned above.

Could the upper bound come from the VCO and divider limits, or from a
documented output maximum, so the advertised range and the setter
agree?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119225752.41846-1-arouhi%40sitime.com
