Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207D322CBE6
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437066; cv=pass; b=g5WZibGpZzgA+/kiJj7vXkhl8vn8yCInFOJjviKSRwN9h3IMAasBz5ITojaIcv2RQKto99sNKWa3GgcMXvSkV08eGI7vp98rKWLNFq+jtnZmRUZXQYZaX4FqsNOFhG3843OA4KoUXNaXVhkic1V67777mviSyrKDZa6DrT1QsIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437066; c=relaxed/simple;
	bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8NxnrG5pz/CrHsQgNGHDY0+ZikBspArooKl6gjn0SvWSCe4OZyeevty+iHdocOK7wLxW9HVVTGSBY6BR9fIepIeqNugcWl6Wv+r3pWZ6RU8w5pThff3qQnP81ezF5tNB+Vi+YyRqPUn9jm0jouxjDjkZMtgWBaFpMUfeYZ1X5A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gyiof/KM; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gyiof/KM"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c795a47186bso353204a12.0
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 07:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776437064; cv=none;
        d=google.com; s=arc-20240605;
        b=TsnhN7WfL/fAR/0bp/q9059MfLTThDGYXxLlarOHZ9iPStdBeppQpmkB3uWwxF9bXi
         hxm/N2NCQ7BQYA6FFk+D/fIPcSlkFoTXu/XWy7EDCdojaYtacH49uAWQo/ePoZPhlesJ
         8GlJqt0aCAOmu0fY9pEQ/S/GGR5tHjaUEEsSd3OReYTdlxsvLB83gMJoxUR+oBr5f/sO
         8EchkIJS2QnW2zaITYJkoPFZnzd4dm+nhamrQdrlEDoZtyNFMl7pt++z5EZe0HfWB85V
         sARQ3N8oNgUyJa2cUzDMqmzf/3LzQus0x3oUTnBd+ZUKDiY+h5O4z3QY76aBlRA8BB25
         Onfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
        fh=mgnbKk1xK6dv9152DL2EHPMyhFJuvPfDhkkJENz3yZI=;
        b=HHqfyUbP+e0WCapPRZPJ4pH3AVG0nmT4w+SMMVLcepC49KWgk2h/NVI0SAjPCtMZo+
         hSsJ4CaId20WgqD4+yfD/lPvFTL31teSW7ERFbSDb7vyu8NuwP2JFvsrMr4YftuuHdlT
         thTkM/iZHel9Idn4AXNrFVdkiutBHTLr7jZIJjrn1fglAUlFkUpCVfyKeP3JSsfpjH4L
         VFfj3KuPVfZ5Qx+chQr5I1DB64iGxkfaQBPntPibbSNeYAd8/7ncSncffviTkCoGFoSF
         P/fFGBZrphejlEo9/mFnZhxYcNZfM82BBsf+nSVjSnAeEP0xNx6S/3W0eE3x7JOJMPXh
         XfUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776437064; x=1777041864; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
        b=gyiof/KMfniQ+vBTz4M+I+0symhU8LwM3NyiRxFYpTOz3jWQjiibj8RNFT/fIjVJRO
         dxLERqkg0xfqe06ESeiA16riFfZhoD553zUfNTdhsR7S51NE8FyDMlstdMLZQSsWo2kY
         XVfDRkCFLKfPLHiqUQiYFS6vDmnujQky8/vKBp0Ht49KAfediXRWRDHcdcYPfPh932xo
         2knFi3L2jWxPpK2N2V4V3UOxejzlcC3J0y+zmFtxCaKYQGtibndllI0MzT58Scs3dDEr
         Mzr/do4PGuSLZj7G4CrCnBc9xmR3iHQA3JL/QKikp5DOBobQTpbF1KAVbeTkt+7ad1oO
         yHEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776437064; x=1777041864;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvZjgleGuZmwgvhgJ8Vxd86Xkc62XC508140/KU6t+c=;
        b=BDEi4678uuGn2h0nWPeSpKFA3uh6l8l8dqHgYQDVZpk4HYoQcUZ5+gnJFq120zDAjN
         7+4qGwSx6Vk4o9XvHGYmpUyoroYD7FigI4AelNwEwU9ka6rpXxYbVFtQ4a9GPso8DKbq
         6JN8ysbDEIuw6RUKFCm315R+w3IAyDOqVJQRhr5kurSyCFo+f0zTetcC1H+cxJjiemn8
         H3p0fVLvRsV0dSW1xg5biBeSJRcGqMRXuHcHrh3AIS2WnuDWmlzPB53/jkuJW58d90KG
         /+FXrvQsB7F//Wh01v6zOXeqnIZy5vX+eVqa0sZnRLv5cYWRxFjyfZqXwPYLQnpz7iwE
         xn8Q==
X-Forwarded-Encrypted: i=1; AFNElJ8qEw6sa+0KK8pL58/IKDZKzgiRktX+gzzNOrWZ1axjf4Bk5dYIxLCQFbHD2lQE/URh61kQ4LhPWUUp@vger.kernel.org
X-Gm-Message-State: AOJu0YxPPqq11uotxTjPY+M0Go337V3VI33JXGarumohqWYt9MmGsYlj
	sFYzRoIsXZZAavu57j2MeH+nwleoWYjQfy9qI3mH3glAVZ3Qnd4b7J6pr+EwUwL5Dl7u8nb4ADF
	zh+AIklk9qk06xMyszD+b6pZzrfc12XI=
X-Gm-Gg: AeBDiet5Ljks3CB9OeYiKWDh8pSy6RNNZGaygf4lmWgXTtVx3vHY9IAsHz/hd2t6lpF
	NzmxbnfpNk5vuZ168OwJaxXTvX8yP//ZC+LjcZlr7dEwVYw124QFtksKFnCY6fRROZNk+qhiVOa
	7NA7Yt7j6qH9UJQfbCisCppwS96DCVaqTcnDyuULB4plFBiTZl/DOAcve6egb5auwu+TpWY6iK8
	XEQ5giP3F2vFuuM+vHMz2XmXrGUY2JACGQqz417t3IM0q0sDCPQ6QLBMKehzC9LWmgvUWrjmylp
	d2RABQDwIt6CzaUij9wr8/8dIAoQ2iVsqAfaCUljTF63e4ARflxUDwO3ujgsXPCSD001dCKtbsV
	tt/MA4D9mnmVEOiVmsA==
X-Received: by 2002:a05:6a21:3285:b0:398:7796:7823 with SMTP id
 adf61e73a8af0-3a08c85a42fmr2848043637.6.1776437064234; Fri, 17 Apr 2026
 07:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-7-phucduc.bui@gmail.com>
 <20260414-funky-sincere-polecat-20b0bf@quoll> <CAABR9nEKGSRNp=eK=ZHf6-MNsj=6cDCy1YdbzSPrHyuc3Ux0Ow@mail.gmail.com>
 <CAMuHMdVPbcz4rF8ojEcvxp1NaM2mbQ2o+HZLwnnjNnX8uHf4HA@mail.gmail.com>
 <CAABR9nF131G3K3-vUdaDwHuQ7MCCLd-VO5syLApE_qsn+J49kA@mail.gmail.com> <CAMuHMdXie1HR6XzkHXAtonh2oemNxH2UZE3uSUjW3xoOmhRjYQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXie1HR6XzkHXAtonh2oemNxH2UZE3uSUjW3xoOmhRjYQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 17 Apr 2026 21:44:11 +0700
X-Gm-Features: AQROBzAQoWeu6BUfwIVhLLCWyt7hmvErfzqvAfs0Xeg-5QUpm0Ag_AdFXLu6Y0g
Message-ID: <CAABR9nE73CcehRNpoZgT4mEL3SAzpK7s+syoBxcCMgdToEWXoQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] ASoC: dt-bindings: renesas,fsi: add support for
 multiple clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, kuninori.morimoto.gx@renesas.com, broonie@kernel.org, 
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	geert+renesas@glider.be, magnus.damm@gmail.com, perex@perex.cz, 
	tiwai@suse.com, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

> It is the main clock that needs to be enabled to make the device
> function. This is independent from the notion of it being a
> "Module Stop Clock" or not, and became sort of a convention.

> Correct. On most (all?) Renesas SoCs, devices are part of a clock
> domain, and their functional clocks are managed by Runtime PM.

> It is not strictly needed to be the first clock, and mostly a relic of the past,
> when clocks weren't accessed by name, but by index.
> Also, many devices have only a single clock, so don't need a name.

Thank you for the clarification. It was very helpful and cleared up my
confusion about the clock naming and ordering.
I really appreciate your support.

Best regards,
Phuc
