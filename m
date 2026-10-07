Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD44413799
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362059; cv=none; b=jKGDRRYwcWqCMO+O0yK4HQzTawZJ47hmw3TKbyIxyKElDwhIYpewTEPcgEgozIovDuO226/tdHlHGyS/ZFr2QwuZwcooEkOcsasVEYuxir8yEIN0Q2gD+vw6Yihcs/SQIw71/Jyh9V2d0M130n4pE1T5o2oCd5ozEWjgyCl/Q5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362059; c=relaxed/simple;
	bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VyNwv/5zLs1CEROgOjw6sSHMIz3m8hSyswUXZNqlKH5jgI7N2AW1sfHtMTFOhbbLf+wfKJ8gAX6xhO0ji2UGZp+NUCmuxDYvjYdJ/7iTr1zoFP1MWAledRTZV9fZo9YiPUXvfHpcr4TICLvXoUlJIoTuKmZqYuwhnf8PJ8+/DpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=YuRYmcJB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="YuRYmcJB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so23481925e9.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791362055; x=1791966855; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
        b=YuRYmcJBr7bRkIHW5cS3rRVHhMcU6eQfGY3vA4mJPU/9owTwr85YhgGKF+5JAu5HpS
         xbuTq9lDL+M2NNPwbBk555eHYcgF1GoYK6Kj9vHyCRh+LioCEHbs4yHXsXrHxREIr8Qp
         iVo7ACndj6rnzfKagReUmKm66RSfYp3ne5w5S7qEfGVRk1DQZC3JlIIpEXVXQL1BHQDR
         K04RGFGdPRijH8kio7I7NmBHvOrWDINDmmexWQ9O0SqdfLoy8cG/mK/ccnfrOz47VC93
         M18VY7Xz0Mde9r2oGW+C5MLlCif6wezSfBHjGIgSu/dTa4r0nqhs1LF03Y15Rz0rmWwS
         Z6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791362055; x=1791966855;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k2LWVlEbO4mtlO7zkAsTCCHDAZ0eNseSbBPcM0qvM7c=;
        b=PLcdW+E8JxjXFKFpoZC0tL0snvxCJyrD/mvFKJEXX0DtwSIv3P9vZaFVlGhFTmCL7f
         1fODffnp88ZTkZcNYo7/N7yrJmQkngPZ4v0mTzlfqpuLewt8LSj+7Z1faiK5xe2t2c8T
         yScoocehE2YpHljrdleQ2y3Hxvlfj+Fnt/pDndpg0Cx/bVzOQEqI73t1LFb3E7KFW3YB
         Hxsd2IroOvClbUWtU1uA6EybHuVcNkEbudTtN6ZOijefNPMp//gvcPUufx77LC9jlRHF
         qwVZbPNOLT53TA6bWFt62MykiTcdG+p2C8SAl0t3YryD1RQjNVLHGDYn1Fa89+qev0my
         HMig==
X-Forwarded-Encrypted: i=1; AKwUvBychtpMSemCeEUQ9uv+Op4hOOXgj33GzloJJA2zH4i2L827OTEDvdKWw8avp2i5mV64xG+TiH3xT2iY@vger.kernel.org
X-Gm-Message-State: AFuF++k3+vUXSD8VvNB9RMJIVLf8SmIGOA8S7cvTkgLcKtivYZT2503Z
	KEIx2iKYyJvBl6pylRcwHtkYHyiYLUhhUUZErZ550aON8N9GTSxO+XPdqosBUSdQ/Ac=
X-Gm-Gg: AYBFou2VN7lp+S7lXOtxfjzBUr0CQab2yBOZwNXKFed33YP9Xlr+rYmkTSCmELiDGPD
	PsWX9W/0MEiyKKjb4Jx1vlLEuS5dwVmIv7d14VYXcvvYarheysg+DsvDRP+Bru0fj+Q5uJHcgWM
	M+FX790gRyYpjUQYnTCpZoLbapvYHAF4T1bE5hh+yYItIE6ZvkokXjTia0ObzfpCkGinen0BCTv
	hLE/SSUi3CEK6ALs7aRShfsN+YedJql6CMZFru0IONrJ8Xat4KoyCpdJtTfxLqBGGvpUkO323u0
	jZ9IYfR1lXz6MNGQzAPFoeNzJh3mxaZhXX/+A/6zovP/XDKqvwxBAA51aestWxKmBGvQwwIUJn5
	mB1HfJpwOim0CoVWrglzuzPU8qnOJpCF1ARToMifiGJqe7zzpVYsL5oWTuT3AAYy0pxU0EKu4dv
	UIKAUJK59G/85gpTWnrDQrO5ZVrDhuiUP0+e8HOxhHCDcc9nHiA5YQ7SiIHH3u/xL/eCOBtUjiT
	xTx35BcAOSozFH16dmiUgh/2A==
X-Received: by 2002:a05:600c:5254:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a180679d9dmr19886705e9.33.1791362055220;
        Wed, 07 Oct 2026 01:34:15 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f493761sm79454375e9.2.2026.10.07.01.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:34:14 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin
 Hilman <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v4 2/7] ASoC: meson: build gx-formatter as a separate
 module
In-Reply-To: <20261001-audin-v4-2-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
 <20261001-audin-v4-2-2476646118b5@baylibre.com>
Date: Wed, 07 Oct 2026 10:34:14 +0200
Message-ID: <1j8q49zz7d.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 01 Oct 2026 at 18:06, Valerio Setti <vsetti@baylibre.com> wrote:

> Instead of including it in 'snd-soc-meson-aiu', create a separate module
> for it. This way it can be independently selected by either AIU or the
> (upcoming) AUDIN.
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
