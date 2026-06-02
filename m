Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867EC3438BA
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394542; cv=pass; b=OsxeGa/vI1KI8jt0eeTIwn/9LyJY+mpk9gwngmXHz5LEBcJ0HEyl/8Aq/IWuJ9f/rlRkU+zsHMK7sN4MwqCHKlVWEgcQrYBeSyYIiROGmvn+JwYuAD7LzUNDxdypj/d/N3U9crB/WCRL6DBRUncmCMAj9q3qr96ZdnYX3x4NvnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394542; c=relaxed/simple;
	bh=0gvLGFThv2lHT+nyPjifExNtH/ts5i70ONfWfPnWqh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BPQY5qpcxYlqAucfBjOzDZaT1sbN/gAAXJIAXSm/XKuUBWLPQX56v7GwQW4ug6Iv1B5z4enrePJybwq55DKXNLs8r7V9Oe5moqlSwpBfEV2Gf1EXx4S3GArMatXWvAWAv3ftwWGuBZwiRChZbhK6ECfAvAuxY691pp7y9gH5Kd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfOlSLaA; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfOlSLaA"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bf20f6be6bso23677795ad.3
        for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 03:02:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780394541; cv=none;
        d=google.com; s=arc-20240605;
        b=O1romf9pLUiDejVMUxV0Z+Ja+THwdNHFChCnZ30stHn/vVdZWDrG52TnzL/8umz6iv
         JNgQGNRinohdL1KJPc93YemxGn1zboFjzbU0tBT8XoQ/t7898+U+q0oAWeoWnqS3wZYW
         KvwARJUWNQTblvLiMpbSuLzFq/ZrnkXIMFXrmT0hTdJLub36pSA7X8RKzLC45YgSllY9
         YsxlFRxwFlagNNJR9Dx08IFdfeMQ/Sert0AGQfiufFM1eXEtA3uJVWLTXWszTS4weE5R
         foIExkW1vQPFO+tF//+woM5w/LcuMcVbWP9GJ9ZsKyPm33sUq14ZQE2s3GDghmXOM5aO
         nD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0gvLGFThv2lHT+nyPjifExNtH/ts5i70ONfWfPnWqh4=;
        fh=+Kn94FVzl6rE7mDhn4pFvEHlRshbQ57dQ5o19v04Oyg=;
        b=ADu4YZQqbZjNXb0L8zdk9LeBmB4+mhKyddKkTLipIM6Lu22dLRBplueusDB9bNVUap
         /y5Ep2/fMgmBPoeM2A5BbAlHFrDjvbEqKz/ag20HSI8Gq6uiJvYsB7M+7UC5BHG1xc2m
         FeyRDXDJof7jvV+zWtOkLZCZKfOc4OkrQT7J2nXNLix/sMq5mOTBmiC3fmN+7SjYLcHI
         dNLChVguOBUEIw5O06pV4cFsxUMxVorDvc7QgSpYPQLCyOYuIE3SklfdQ4r8B6Ffmqwm
         t6gxnGUeASk8kl285zWtD0GylgD5/ybuWygtyYkgzE863sRd6399boyXwid7B7rAMRkn
         YuWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780394541; x=1780999341; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0gvLGFThv2lHT+nyPjifExNtH/ts5i70ONfWfPnWqh4=;
        b=MfOlSLaAx1rH7WZs2AdXNTNItSL5qWS16AM0RybIUmHkafOqFIRJMA8gKHR0p0bi6I
         bs/cTiO6Yb0gHX7MH9aICgG0GB6Htz0CUJK1+4vqF17rPYCqYAWq0SVEhsCSivYMrrRb
         5jttTHseUdiptc77em74SzHR413PocIzUcx8pJEt7KnCl8p2SK7b9opL+d0sa6TCMOol
         YJARD9vwuIxq0m5yaFBeQdlnkh+T3/2TfCM4iCeSDCP4WUCqEo/EaCahHUDksx2tPTo+
         JWt3uXmjLnDgF3JutyFzBR1yzn5IeJbpf+9o2F7I019poxjj6PUHBop+Y0HwsYYPoIL7
         E8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780394541; x=1780999341;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gvLGFThv2lHT+nyPjifExNtH/ts5i70ONfWfPnWqh4=;
        b=YRE+7eo1ko2k6B1oFO8J3eZXmuf2ak3ljmpIfEqKOs2gyojA5Nx185OKliFQXTk80f
         JaqcqvjeUFR5izUAz0uUMFTtpux7X9q798RbHHupZk3pBc0vv5K28D7Nou6r78Pow4wy
         +vr1qgxOvdo795xihoS8BBhj2/ZJeV0bCCH8cjjJ8F5EBBulXGr+ifvhbK816od4fmGj
         b8c6N9vz26N62lVAysm7B4FeEqz+WvSShH/Q6kapi9q/qU7LOHEfLGdKbl/Y4DzMsCO9
         RLLJ/ZAJ//nmcfeR191rFGKYdKUqmYnYJ6qFk245nNCSVk27ewfpPXFQDFQhQnoWMofh
         vOcQ==
X-Gm-Message-State: AOJu0YxZfN7tQTOg5I7OaN/SLIZEH6ILa8Uve/ad++1/aTF2NYCDTqwX
	+4JPfwPf24hXjFeJsjGm6Wsjdq9i4pA3jTkQcFunGVb4/XDG81fQs4JXbFa3wB96oUZya3XYZPv
	3UpnkGbJmMrbY3HEHlZbWkCl2MyvAfcOXO7Gb
X-Gm-Gg: Acq92OH8AQYzQbJQbOrAPdbSR7tjb4GcvuAtxugPrp1jireKobZ48EDS8x1wgqRU1y/
	SzihsIBSTZ5r2kAkyVT3FiBjvq2tl3pZVxBB+vmSexVT/5LvsQEY+M5yLvT+wBZX6Fcm9wdwG/r
	qJds/bzqZCLiOL199sgSBakPMGuTUeon8nMtdsS/Eks6Ot2zX+TZtn8HZNTZRUsWDVHBRotahm2
	7Z3Z1qZJoRgBTwXv75piXBn5VhzdLtnDNjnAUeKoY1BtWafObQJOXxtLce0cpQu+qLN/xxuz9uU
	MLyj9xxdOIvUhA0VZi6pueVZv+L64kGfrZzGEjF2LKz+SY6p
X-Received: by 2002:a17:903:1983:b0:2bf:23cf:3e4 with SMTP id
 d9443c01a7336-2bf367d9da0mr163447475ad.17.1780394540758; Tue, 02 Jun 2026
 03:02:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260522100318.73474-4-phucduc.bui@gmail.com> <20260522110302.349421F000E9@smtp.kernel.org>
In-Reply-To: <20260522110302.349421F000E9@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 2 Jun 2026 17:02:09 +0700
X-Gm-Features: AVHnY4IKu4cfANumj7wmqQvDtssDhq3TpxXIjIHmGdj6XFJ_23uSlD1EG9gmtw8
Message-ID: <CAABR9nEHn7Fz2RNz2ttp-3NmHX8pAMtVQPuP+z2Qi1v9FLT9+g@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: rockchip: rockchip_pdm: Reorder clock enable sequence
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> [Severity: High]
> This is a pre-existing issue, but can manually disabling the clocks and PM
> runtime before the devm teardown cause bus faults?
>
> The driver registers the ASoC component using
> devm_snd_soc_register_component() in rockchip_pdm_probe(), which defers
> unregistration until after the remove() callback returns.
>
> If the device is unbound via sysfs while an audio stream is active, ALSA
> will attempt to tear down the stream during the deferred devres
> unregistration. This triggers operations like
> rockchip_pdm_trigger(SNDRV_PCM_TRIGGER_STOP), which writes to the
> hardware registers.
>
> Since the clocks and power domains were already forcibly disabled in
> remove(), this could result in a bus fault and kernel panic.
>
> Should the driver use devm_pm_runtime_enable() with a devres action for
> clock disable, or unregister the component manually before turning off
> resources?
>

Thank you for pointing this out.

I agree that your concern makes sense, and the teardown ordering may
indeed deserve further investigation.
However, addressing it appears to require a relatively significant change
to the driver's resource management and lifecycle handling. Since I do
not have the hardware on hand, I am not able to validate either the reported
scenario or a potential fix.
Given that, I don't feel comfortable submitting a speculative patch that
I cannot test properly. For now, I'll leave this issue to someone with the
hardware or with more familiarity with the expected teardown sequence
in this driver.


>
> [Severity: High]
> This isn't a bug introduced by this patch, but is it safe to ignore the
> return value of pm_runtime_get_sync() here?
>
> If the runtime resume fails (for example, if clock enablement or power
> domain restoration fails), the function ignores the negative error code
> and proceeds to call regmap_update_bits().
>
> Accessing hardware registers when the hardware is powered down or unclocked
> can lead to a synchronous external abort (bus fault) and a kernel panic.
>
> Should pm_runtime_resume_and_get() be used instead, and the error handled?
>

I agree this looks like a valid issue. The proposed fix is relatively
 small and localized, and does not affect the overall resource lifetime
 handling of the driver. I'll prepare a follow-up patch for it, although
I can only perform compile testing since I don't have the hardware
on hand.
