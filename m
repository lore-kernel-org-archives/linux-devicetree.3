Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6503905E4
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 07:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435444; cv=pass; b=okVx8QUlA5aZce4jYUNwz/eDFJ26jx3Oy8qhJ1vIR68aBW+Rnz+Ai87DZTJi4PoO5ypqlXPZi78giDDRjU8ECOz5Tvl0srd2f/7dxpTDb0zR9hBUqLcoKIacgan4n3Eh6GWcppFd471HHGkxwzMXGuKHonNapE1AzvzRvJ3PZg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435444; c=relaxed/simple;
	bh=u73be74yIOdobqNyGKTScnkafJc1cB/CNX2zNp7XSnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ha7swgk2wJnU8QoO5/1nVip5L3ax9dx8dIoAp+fx8UDYMw2zhkrgX+HytP8GJVw/yZ8gMRlb8q6cO331Y+EMwyDBcHs6qiuMhAwSCHp8EQaA69ks4q2d+7lfoP4DwuagHgDOaOyZjXrOUUxYaM1awU/3n1OIzRUED5kWg0l8JkE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=by2hbN1K; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="by2hbN1K"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so1216515f8f.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 00:37:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779435440; cv=none;
        d=google.com; s=arc-20240605;
        b=dco8C3hSVYcw/tQdgMlU1nqzgq7V3U1S/UjWZclOxNI4kf7siZQ3eCSj/0bRsPRemr
         WlZQdfqStpwJBS6IjCsTecq6Xeb5GMSFmzhbSikEYM8rM9TI4U2Kx1+EidfKDDnBEZzf
         sCbVoM3uWhUIkNJ+J8t/sNo/B0Mga5owd4M6e1p+oGLZ4dwgx/ehCqWMg9f4HkmThC4G
         74OTr7H4991LlfOefek31J35DLThqyaF44pr2QOumvkU00MCvxs47lP+Z5JaDq6LJu4A
         UNAUQYc2XQqAqZhu/5HQME/IUMlFPsfYlTsbw2yez0MCQxe10gR7ASwXc+JLo59mmCJS
         ACcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XT8tHMWexZpv+xCe1ZROIGgg7ftHFJ+LVIyp2FJ49AY=;
        fh=yCO+vjZjkceUsmggwVFUwhw3E6vxv3Oi46xlsn3mlAA=;
        b=X9kLzeUu3GH4XHCJtIWW3Nx6FP88mVIzdSpwM/CNcg7Sm+36TJn5k7CpF8kJdGcOku
         skK6FlbEDBdNldDGaItJ9HNH8U2+jmuHpWWFJfPqA6FtSKOmhTnzMdQhIZj/ZkX96fB+
         eICLRvAraRrHn1pgqxzQ51xV74RM4OrEX0yBEkdpw/zxokRy03fxIcb7C5YurrWgczdv
         EvN8od1xYHq3G2+zS1Q37a3Ngsig+CYbTZiMEe/1cPmWiWXodWv7u4OxzNu+C6zBw67o
         fZEErPJjr9aIFgEcjjk/zNjBmmM2aKAkLT4ufu2e141yjwHNwVZ6xFh7Y/VFSnqIVXXp
         b7xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779435440; x=1780040240; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XT8tHMWexZpv+xCe1ZROIGgg7ftHFJ+LVIyp2FJ49AY=;
        b=by2hbN1KkwkmG3V8u6i6TNd9ihkpK4HTGD8lWGWJLNDAGmnTqR6drIS3qGVA1MlKb/
         tlesRWeVKSIbuwSrEg+9e3Q3ckqDBCwZXhs2D34J5rpokxa8t5z2L6DTT51gqtYmYXhx
         vqXmK/kH88VI7NrfMziHXNrLDdy40W5UEWy8unKJI67Uq9DnjzDsH4vJJo1H9aLz9PPd
         JvKfrQsbe7OZQDqRgiQADW4tfvtpMCmxyQjA/+/utHGGqDHvIMwDmHxF19oZ4lnyXvCg
         X86aPvotKIbIKsnh7YgeCn1mViRYxBDUVrgrA/OOh7nJUGSi/lHvMIKIRFbtSmTPC3kv
         8Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779435440; x=1780040240;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT8tHMWexZpv+xCe1ZROIGgg7ftHFJ+LVIyp2FJ49AY=;
        b=F7QU3HlCjhZa1F1gAz4jFRJ/OhdxHPAhcwqTqzkYs24uZL/XeV0dWerQz6vZ7p5KKe
         mgnGuPgEuh5gYjlrLz6WgJ/kcEFKPUf8uq7HvjTpA2Z+kdIEpNOGFJp+/YrDqg7LxxWt
         fiXczBbB5QRXi185SP5y2UokzKjpIAd59IsdRMpxzoA7JspPQdQqPZ11UjiCLqygwF4Q
         q2mtOKdZ7J3nU8Xy0iulvu+HW+dFbSuRR98Zz9tW1d//qTktdNxWE1N+EDRXJhJoBRhL
         OuiAhUA+MS5tSMeVJM8KASdEJpRjNXPGH1axqXCh6CgJ2OHrdd1A6RrzK0OVOYEPkEKM
         SB+Q==
X-Forwarded-Encrypted: i=1; AFNElJ9VeG1uBeYdCDvG/rGRWTutKb6p3rVUmRDs0/L0tweL+02vKXw1/b+JKZrenpii3gC2AUoQz+J/0zTn@vger.kernel.org
X-Gm-Message-State: AOJu0YzudXGgQlTCPfxoCapgiwkypdjsGXXp8g4ygLR0b+Dw0+X7F6hl
	LccCTpe93ty+gxJVaXDSTk4TlZrknpEbRUE4QNzC0wGrFxjdrgihRIMs9FgKx3/9expIk7TDSwQ
	b58RlBoN0NkS4e4EP3LPSOtwB2FNTyaU=
X-Gm-Gg: Acq92OFfVnW5UJwMoshin+kMy5Jil2TOIDzbBPqW/bJJtJdlm0J6tKFtgwhsHor12Eg
	eE8uWx6g7AmxJYQT9MthY1riGCcFovdJqHq/QfXPoDaxw7pjbKebumHKDHrqZpP9ZNK16iRFjPW
	ZPyyaFTTXkNVfQBFmESC7sqEYDq2hc67cy+cQh474mbGGeuRwdOdRv600kwWBBEeTmqwwmsaD8H
	q+7UFmYr3fnr1TjQnW9D339FEoZjhTYSwRVvURpSoUbLzI8af/7wEulpv55OskWvev2h77VJak5
	rvrqLrGJjW5sqfgXU9grDotdfeRCDYmDys19hSWIBABy9OH5q/URqCvkjWsT5+XS3rVpPKyX7B/
	GzfSYlH7UVLpYkTrh6Jtr1VTCXlMMDVc7H4+pJaDIQ1bG1oC32heqX5FWY0B1ibMYl+bqKjrzqA
	+exA6Z/UvMfnScOVCU
X-Received: by 2002:a05:6000:4606:b0:44b:cb31:b767 with SMTP id
 ffacd0b85a97d-45eb38bdf65mr3228502f8f.36.1779435440425; Fri, 22 May 2026
 00:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521164323.770626-1-liviu.stan@analog.com> <20260521164323.770626-3-liviu.stan@analog.com>
In-Reply-To: <20260521164323.770626-3-liviu.stan@analog.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Fri, 22 May 2026 09:37:10 +0200
X-Gm-Features: AVHnY4Ip-_ZGYEwV54TTHL5V2TOhrgQyjVFPodBlztyOzZfkRbYsFMNIXO3g8DM
Message-ID: <CALoEA-zkTDYBUVs1rxFQxEaJio71YmgdowqVGx7toXUpAnj-Aw@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] iio: temperature: ltc2983: Use local device
 pointer consistently
To: Liviu Stan <liviu.stan@analog.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Francesco Lavra <flavra@baylibre.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@analog.com, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 May 2026 at 20:17, Liviu Stan <liviu.stan@analog.com> wrote:
>
> Some functions define a local 'dev' pointer but still use bare
> '&st->spi->dev' in some code paths, and some don't have it at all.
> Replace bare references with the local pointer for consistency.
>
> Signed-off-by: Liviu Stan <liviu.stan@analog.com>
> ---
> Changes in v3:
> - Dropped the Fixes: tag
> - Fixed one remaining dev_dbg() call in __ltc2983_chan_assign_common()
>   that was still using the raw device pointer instead of the dev local
>   variable introduced by this patch
>
>  drivers/iio/temperature/ltc2983.c | 83 +++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 36 deletions(-)

LGTM

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD
