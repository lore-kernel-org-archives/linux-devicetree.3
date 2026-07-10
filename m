Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BCAA3B2FE6
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 21:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783718069; cv=none; b=lpDPQo3lhdPZAHoxzyz8eG9J4kOItxUEYXsO71Zw+ntvBCE56iPLxJsQ1dYMpUv+T4w4B0wHyP4UsUQZ6btW1HpGE1cgIaMw7jW9jk/5cZjK1QPWSLd1i4CHVtq2ptF9cOXcJnBl5hqCqmDDXqs8HB3e4X4Kfimiac5ACIhEmbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783718069; c=relaxed/simple;
	bh=/MHLEQNMWxLpfWTWwhvlzLz4+MIMJenat62fWPKTec8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAaRI7k2eS/0C+u6DztcwrwYBUwo027O7ecSUSQjcQamlQQy4KeQHUOT9ssET8gReOxV8mfn7kxr+fCbNKtPtcwrx+jieEqlFtsotckjJ83PPLqmAE7ho4YjJvoNjjsmKuNL9+/5UhErzvzhymNvg8i7Iwn4ZcNDh6IZtPBjW20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sXkbxj2n; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sXkbxj2n"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81dfdbd86d1so14354687b3.1
        for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718067; x=1784322867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ito17Ylev/a9CxopzLHejL/a08tEt9HCGC3Am4P7UkE=;
        b=sXkbxj2n/ObHQcCcJCCA1tfoItqTuWw65cdLixSsv5Gyiml3rHI6f4e8Mi5d2T1uE4
         5Hk90FaVMs5XPte6l6JRwaLW8ULOZ5gfIdze5VbZL/58DYgcvZfKD/9m0oDqfAh3YNZw
         SJ7MYCToxqfvO0GIVe8b/oYy2Ng4NrxkfOwbWYPR/ewYDvOItqgsRUNhutpfgADnV0DF
         0IYeAAU3ve2R1u2q4tIcgAeDl0QvCrQQFDBUO7qnl07fISE5UOHcRRiAEBQxfkbLS9si
         cEDIcDRvTeJYVUg7lt6BXh32o0ezkc7c8poJzAUtjfkaO0lj9c1qkYqLIEyXv9bbvV+M
         jGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718067; x=1784322867;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ito17Ylev/a9CxopzLHejL/a08tEt9HCGC3Am4P7UkE=;
        b=IQdFoTcsHkrgFNVpCymekMuj+Jotf9KktLVjc1W5HkpuaGVxnwO+Qv2nTRLlEfINzR
         l2wQjpuJowx/5m9KGbH7LQoddSB9szXKqoWhrmkt2WKDx9famAQEfxpRDipxE/goNfkl
         X5aJa8SMDNGfbig3jfiq36glMvYT+vtw0i+m0wW8M1lixJA2n0psuvzxNYfb31wpB0Gl
         PGUDO/5z8FqgJAv0x/SeGXaLK1nJHy85puegzudgwG3pidBxst+Nl2l8/Yxd9OZsw/hD
         gF3JrFJwltsQvySNoqfiRLnx6/+Fn+ThEFOsNbIA0ckTV8R5QZ+uMpvtz0lYitfMPiC4
         3KEw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2ktfOkQEhW1nUrlp024FETfK1Qft8YYDSKlL1aLuy3VJxOY6B7NLNR80/AQMmowIDVUHCdjcOGTAB@vger.kernel.org
X-Gm-Message-State: AOJu0YyCwzp+Y+390D8nv4tMS87HXSmy8PuPBAbwUJgWvr7YyJMt9qzM
	gN98YlrPFEsSCn9/VWeU1yIxKfU3SeStNQFqoyuXSOPwiEb5P385+nbD
X-Gm-Gg: AfdE7clS+6kGUTUrWqRR15XaU1mr/drCYDV3r8TPGkYvld5m8NqmUhs7gWh/9W9WVQV
	kSnffDES9Ls0jlTUhF/OeBhZ9uaNPAGkv0QL7zUCzL5TvSZZf3ctWUMQdM/89rDVFempBw9+0Le
	sv6U62CNPz72YKo8a9mfxFZC5OfXAS0lc9hyFufimYO63jEGHIJdsKYMowheb2l5Yt1hgaTcg1R
	TeuB8Pba8La1ibOYK9uGFzw78hjmD+cdqBnl4YwtFh1Ay/J0z55XhLmsQmgkqpZ0WV9gJDPDoXW
	eXk+QGKIJ0cKLfg1Lz7hru70vM7vaVKFRAqFLPMjTf8Pbo+FkIPsBUkrizt8DPKMuwqIcooeB5u
	+xM1oo7tn/oXXNRp8bESMEn13M5kAHBz8Kb6FEgGnUsf93Yszw9UQTqmztOxX+aYjDk2A9oYyet
	qK8mx0faGEiv6amEnR0fGS3A==
X-Received: by 2002:a05:690c:638a:b0:81e:6a3a:a562 with SMTP id 00721157ae682-81e9003dde0mr4858867b3.17.1783718067290;
        Fri, 10 Jul 2026 14:14:27 -0700 (PDT)
Received: from localhost ([2804:30c:1f09:b400:47f8:7933:2105:dd41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c212f14sm56630587b3.42.2026.07.10.14.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:14:26 -0700 (PDT)
Date: Fri, 10 Jul 2026 18:15:21 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v6 3/4] iio: adc: ltc2378: Enable high-speed data capture
Message-ID: <alFg6RVbM4ohZLsi@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1783629101.git.marcelo.schmitt@analog.com>
 <4d4b5cac52b6f4a341d97bd41562a451e8e757f7.1783629101.git.marcelo.schmitt@analog.com>
 <20260709232444.40EE11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260709232444.40EE11F000E9@smtp.kernel.org>

On 07/09, sashiko-bot@kernel.org wrote:
> > +	/*
> > +	 * Configure SPI offload PWM trigger.
> > +	 * The trigger should fire after tBUSYLH + tCONV + tDSDOBUSYL.
> > +	 * Minimum time needed: TBUSYLH (13ns) + TCONV (part-specific) + TDSDOBUSYL (5ns)
> > +	 *
> > +	 * Use the same period as CNV PWM to avoid timing issues.
> > +	 * Convert back from period to frequency for the SPI offload API.
> > +	 */
> > +	offload_period_ns = cnv_wf.period_length_ns;
> > +	config->periodic.frequency_hz = DIV_ROUND_UP(HZ_PER_GHZ, offload_period_ns);
> > +	min_read_offset = LTC2378_TBUSYLH_NS + st->info->tconv_ns + LTC2378_TDSDOBUSYL_NS;
> > +	offload_offset_ns = min_read_offset;
> > +	count = 100;
> > +	do {
> > +		config->periodic.offset_ns = offload_offset_ns;
> > +		ret = spi_offload_trigger_validate(st->offload_trigger, config);
> > +		if (ret)
> > +			return ret;
> 
> [Severity: High]
> Does modifying config directly leave the device state out of sync if
> validation fails?
> 
> Here config aliases to &st->offload_trigger_config, and its frequency_hz and
> offset_ns fields are mutated. If spi_offload_trigger_validate() returns an
> error, the function returns without restoring the old configuration.
> 
> However, st->cnv_wf is only updated at the end of the function. If the
> buffer is later enabled, could this result in the PWM running with the old
> frequency while the SPI offload engine tries to use the new, rejected
> frequency?
> 
Ok, v7 will come with a local variable to hold offload trigger configuration
until all checks pass and both st->offload_trigger_config and st->cnv_wf can
be updated.

> > +		offload_offset_ns += 10;
> > +	} while (count-- && config->periodic.offset_ns < min_read_offset);
> > +
> > +	/* Check the minimum CNV to SCLK delay is met */
> > +	if (config->periodic.offset_ns < min_read_offset)
> > +		return -EDOM;
> > +
> > +	/* Check the PWM periods remain the same */
> > +	offload_period_ns = div64_u64(HZ_PER_GHZ, config->periodic.frequency_hz);
> > +	if (cnv_wf.period_length_ns != offload_period_ns)
> > +		return -EDOM;
> 
> [Severity: Medium]
> Could this strict equality check unintentionally reject valid sample
> frequencies due to integer math rounding?
> 
> If a requested frequency produces a period (cnv_wf.period_length_ns) that
> does not perfectly divide 1,000,000,000, DIV_ROUND_UP() might round the
> frequency up. Converting that frequency back to a period via div64_u64()
> would yield a slightly smaller period.
> 
> For example, 133,333 Hz yields a 7500 ns period. 10^9 / 7500 = 133333.33,
> which rounds up to 133334. Then 10^9 / 133334 = 7499 ns. Since 7500 != 7499,
> this check would fail and return -EDOM.

The setup for SPI offload support uses two PWM sources. One PWM drives CNV to
periodically start new conversions, the other signals to the SPI controller when
it can start fetching data. CNV and trigger PWMs must be offset by some ns. In
addition to that, the PWM sources must be synchronized such that the PWM
connected to the controller doesn't fire too early nor too late. And, finally,
the user might want to run the data capture for an arbitrarily long period of
time, requiring the PWM sources to remain synchronized to be able to
consistently read valid samples.

Those requirements pretty much imply the PWM sources to have the same period.
Though, our peripheral device driver only knows about the SPI controller
PWM through the offload_trigger abstraction. After spi_offload_trigger_validate(),
the client driver has no way to know whether the new frequency value is a result
of integer rounding or PWM hardware not supporting the requested period/frequency.
Even though the divergence in the provided example seems to be caused by integer
rounding, it might not always be the case.

> 
> > +
> > +	st->cnv_wf = cnv_wf;
> > +	st->cnv_Hz = DIV_ROUND_CLOSEST_ULL(HZ_PER_GHZ, cnv_wf.period_length_ns);
> > +
> > +	return 0;
> > +}
The other comments seem to make sense.
