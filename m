Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F392FFDFC
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 04:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787287388; cv=pass; b=UuGz+w+tsZ64nqGOiwxhcFIbH/YGOx5mdhqNNGDDsCMvRJIDwwwbgP+BqtP3of4MDJcXaASUhNQSAyu7DWRMmNh/dk0qgwUuRndwxxMc+BoJIbKqwbnFf4zd5I9Bzag1jFou7WgXsGfIwosglgItK71yfDaun/YSB9DHB/K6THk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787287388; c=relaxed/simple;
	bh=IWrtzlK9+m6CsprOG7cYz4IHxZYiNRb4WbjXdKwQPSo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qB9yDhBKGfam/qZf7rr9y8fFe6rXLNNqzcML2Z7HlkLB3ZtV+A0h1Ap1zpxH0O/oOke/bFnKOaa9E2xHP9KArtDAQUiYskOEyQPxIrv45HbpobNATx7ov8KGT95COmmh8uW8//fgY0lI3DO7q9/FkQAh2104FVBhY6gvdBeIavw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com; spf=pass smtp.mailfrom=asseily.com; dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b=JaXDlXM/; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=asseily.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asseily.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asseily.com header.i=@asseily.com header.b="JaXDlXM/"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-81dfdbd86d1so9387267b3.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 21:43:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787287386; cv=none;
        d=google.com; s=arc-20260327;
        b=ZgcchlCKxGwOVvGBdYbsy+kEklUwJLA9xaK1xJ38i/qlm1JtYDs4Mf+5K+akVHaSpF
         tQ1PtofcrgkdIiaay4JOjGcmZepLPccPj7r6b4bodkmRnECzIArK3cG+/hpgUeQl422l
         Z8GruA+WK042/kDNuesnpFGBGsYt8X1xxl2/AX2YzDJBC03+ZbxEQkv97iMHgYani7/g
         w+0x1cTmyoR0cpmbiwT22xOML0Y+rlpI2b260ZcCd9uRDx4t50sfgWdnYsTNPEyUksY/
         8MoyJJJT5c8SQvzRMnGTLkufDCIwqebhwpvCqEOXBMAW+eVj6LEU3CziC/9HxgqrFYJZ
         5F6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FETm0h70P5hMYOSgzVLQJCmMzyH1hkq8Vh3JEXc8Xk0=;
        fh=PkWIqQWDlihyDAV1XikX6IuXPCwN+Gkw2ryRKJdQndE=;
        b=ki5IOnT2mz5k2T/xowqunRdHtpXbL+2dk1Yy2XSlDHmMdlR9nyrHuSXXtMGkubSUzF
         rs3bbbVYVtAl62Bp3zQ12sTWEc1dqIoxyKbNoWJcimd94MEqIgLmFwEmOIoa9P7n4vp7
         F9hhKTlVpCoOrtRMK4QATJqBrOspnLUXwvu7rUCur/93W0SBwlxuRcfYmvqDOCPGwOE7
         t890qmTkU4lfFOmaQftwNR6zjcx5i38AK0gqKCw07jrzDUFVCF6vOYtCaK5n8ZxtKVuf
         HWX/yzDBy0USlgi3F2JdAqbwtLZeXGyJ+d5NrBVOaKjP5OPoA+rsdc6sEv994bG0/lV1
         pC7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asseily.com; s=google; t=1787287386; x=1787892186; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FETm0h70P5hMYOSgzVLQJCmMzyH1hkq8Vh3JEXc8Xk0=;
        b=JaXDlXM/oQ4Z0Q3TCDwvLPgecoLL3qYyYcXhv4hBsbDUxH7hzmh5CGSTWgVCY8fabs
         tOmPHZc/X7jL+ujQp5pxiw5o/Yfe/RanxWiFMB2g+u+gh8vLHa6o4HM/uCgfbnc3miSH
         IajCfdbHFwTJd5W0Tw6OGjyLFAWiQ+u06YVyKvjzjPoDA/Jn5W9DYEDksevAnhcVXS35
         WP2q1CHtkFFvQIg66fED4GTdbiAiLjDglNe8OeQa7EyeJn+DCKQt7gMKc9RjxWx+fth+
         5zuDfFaEDIEAemhzFvyvI5NqarG1Uzr8Y0sYLrLYzWSTT2LXmhitYuba9fVauTvuRoVL
         Ga4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787287386; x=1787892186;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FETm0h70P5hMYOSgzVLQJCmMzyH1hkq8Vh3JEXc8Xk0=;
        b=OZogSYcAulz5EzpVUezB92UPZV+oqu/xlTDR9KZrrHRRZ1Uu63DzsajHGVam/rF+t/
         3yJBQfbWZRhJ2qHTaozLY1IulvMwfyeQR7qlckDq3/0eqLMujDKK5UNrDDE+dTk67CD1
         itsqZth/Vcx18XpnBw+U+kC8Zfqc3CQjhxRBEdSspDFuMQc06vSxqTZAenhPwNaH69O4
         +XLDphnEEoC3QdDPmA1cqzggbpokBQcXIA9Sxa62RIpCW9l9FEZiEbHZ0//QJre52S17
         Y/h/1mT816PNr9snS0utMIPwNn/9mLGHljHD/ZP5Eekh22JJ7slETd+rAZaWfiv9BDOM
         658w==
X-Forwarded-Encrypted: i=1; AHgh+Roemi+yk06i6tt/EZM/3oxsc21KAcACAHQmJHYqrMUICLbUiNpAAvtDczQEg4f4j3NGR2gKH1G6i3y5@vger.kernel.org
X-Gm-Message-State: AFuF++kEhj4jWd4UudhKYOeXyyAv8pj3hre6N/SMMneFQ5HoI8nE3Mns
	W1/pndFmxo1WxcASOnVuNfeN/ZB0DWofjw6zoGrjmdtJliaDUwzw0ClnLc34vRdFjLTtWKSiv5B
	nABNL2fa4faUkXl5LVRX+lSh4w9xGWUV2+s5yrnSw9xzz+FxMUR7YrMFZ8w==
X-Gm-Gg: AR+sD1041WCmpfSe65iZIeXZb8rAfVvUGi/aB3nLxWY5UPZtnSzEorDb9jtSNfyC/d2
	MW1e3zUAt/mqpRDWIg+evF7Z/hNGt5MA1fNVjEd5E195y15ZaZEh7ZmwKcFdcJpLZYF+MYhOMHM
	QIoNZT/0998drDcLuAhd6uZDF2RdFaMCA87bhrZ7Aqt8ejgqpc1QxO8W7VSw7WW91u2rkrzYedz
	QL72NPfdJRQSHElJXjaiLRkXSZ/YYLQny7ylHfRk3w7MTnH/vOCGpwI5eme3mBR5ctPb5tsedqW
	2Xz+NhmyJH4NGYctUmM22EBVFpXX7pLl+yoH9CJIOxBoGBbT22oL/7p92qdZOdmXWukhLMb59Ne
	ZK24frKb7taE=
X-Received: by 2002:a05:690c:e146:b0:81d:5806:ecc7 with SMTP id
 00721157ae682-849f18a6320mr9895447b3.1.1787287385646; Thu, 20 Aug 2026
 21:43:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820062626.39218-1-karl@asseily.com> <20260820062626.39218-4-karl@asseily.com>
 <7f2e051a-1e77-49e0-bec8-e178855295b0@sirena.org.uk>
In-Reply-To: <7f2e051a-1e77-49e0-bec8-e178855295b0@sirena.org.uk>
From: Karl Asseily <karl@asseily.com>
Date: Fri, 21 Aug 2026 07:42:54 +0300
X-Gm-Features: AcwNN1XgCOQeDiOAB3AUALMp8inueSr4538fLSusILn9jRhYFV7UX-hMyrlRAuA
Message-ID: <CA+gvwbr4gUSU3w3PxDjSeKQ1oyXR_psScTZ1ecHTb7boZsK=2g@mail.gmail.com>
Subject: Re: [PATCH 3/4] ASoC: es9039q2m: add ESS Technology ES9039Q2M codec driver
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 20, 2026 at 07:52:48PM +0100, Mark Brown wrote:

> Please make the entire comment block a C++ one so things look more
> intentional.

Done.

> _DECODE_MASK doesn't cover S/PDIF.

Fixed, and it was a real bug rather than a naming one - the mask is what
hw_params() uses to enable one decoder and clear the rest, so the S/PDIF
decoder was being left enabled alongside whichever one was selected.

> Please write normal conditional expressions rather than ternary ones for
> improved legibility.

Done.

> If a stream is already running then the handling in hw_params() won't
> have a chance to kick in - should this return an error in that case, or
> try to do some reconfiguration?

It now returns -EBUSY while a stream is open. Reconfiguring live would mean
redoing the decoder and input selection underneath a running stream, and I
have no way to test that the part tolerates it; refusing is honest and the
control is a setup-time thing in practice.

> Volume controls don't *need* TLV data or dB scales, it's more about
> their intended effect.

Fair - the TLV reasoning was wrong and I have replaced it. I do not think
these are volume controls by intended effect either, though: they are signed
correction coefficients for the second and third harmonic, they cancel
distortion contributed by the analogue stage, and turning one up does not
make anything louder. I have kept the names and fixed the comment to say
that instead. Happy to rename if you still read them as level controls.

> There was a symbolic name for WS_FAIL, and there's TDM_VALID as well.
> It feels like this should be able to use the defines, especially since
> it's a driver local control type.

Agreed, and using the define turned up a bug: the control read
ES9039_IRQ_SOURCES + 1 with BIT(7), which is bit 15 of a 16-bit word and
reserved, so it could never have reported a fault. It now reads
ES9039_SRC_BCK_WS_FAIL from the correct byte. The other status controls use
their defines already.

> This means that if MCLK is specified but syncronous we'll reject things
> that could be supported, that doesn't seem ideal.  We should have some
> mechanism for specifying if the clock is actually async.

> That seems odd - usually an ASRC is a workaround for mismatched clocks,
> not a goal.  It is very common for the CODEC to drive clocks on the
> audio bus from a high quality MCLK.

> As per the above comments on driving the clocks from the CODEC it'd be
> pretty standard to use clk_set_rate() to configure the MCLK to be a
> suitable multiple of the sample rate and get everything nice and
> synchronous.

Taking these three together, because they were one mistake: I had written a
board policy into the driver. v2:

 - accepts SND_SOC_DAIFMT_CBP_CFP and programs PCM_MASTER_MODE, with
   MASTER_BCK_DIV computed from MCLK and the frame size. The part drives
   both clocks or neither, so CBP_CFC and CBC_CFP are still rejected.

 - calls clk_set_rate() for 256 * FS in hw_params() when the clock can be
   retuned, and uses the rate the clock actually settles on.

 - derives synchronous rather than being told it: the part is synchronous
   when it drives the clocks, or when MCLK could be retuned to suit the
   rate. Only a fixed oscillator feeding a consumer-mode part is genuinely
   asynchronous. That is detected at probe by asking clk_round_rate() for a
   different rate and seeing whether the clock offers one.

 - applies the datasheet's two floors rather than one: MCLK >= 128 * FS
   synchronous, >= 130 * FS asynchronous (Table 7, note 1). That difference
   is not academic - with a 24.576 MHz clock, 128 * FS makes 192 kHz exactly
   legal while 130 * FS caps at 189 kHz, so v1 was refusing a rate that
   works.

The startup() constraint now only applies when the clock is genuinely fixed;
with a retunable one hw_params() raises MCLK and fails cleanly if it cannot.

For context rather than argument: the board I wrote this on feeds the part a
fixed 24.576 MHz oscillator and runs it as a clock consumer, which is why I
had the async case in front of me and the synchronous one not. That is a
board choice and it stays in the board's DT, not in the driver.

> This is shared with the user visible mute control, they're going to
> fight and be buggy.  The register needs to be owned by one of them or
> they need to coordinate.

Fixed. Both now record what they want in the driver and the register is
written from the union, so a user unmute cannot unmute a stopped stream and
a stream start cannot override a user mute. The control reports the user's
own setting rather than the register, since the register also carries the
stream mute.

v2 is on the list, with all of the above on hardware:

  https://lore.kernel.org/r/20260821043859.171871-1-karl@asseily.com

Thanks for the review.

Karl
