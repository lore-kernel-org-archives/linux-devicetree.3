Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792941873;
	b=rhmkORBYFRWWJpLr6os2Y34XiqhfyCU1iKjW5O5IqpapreSigQBVE7pVsb9fw3YF4lxC
	 JXxLeuT4xYusiC+4bNkg4KkFOpfCdjPiVSWfJ+23MC9WsAx+wKtIZ1Ai0Q6b3IGujQrf+
	 iVitDuk020HPxF6YiBa45X8zq675WIYZ0AzX2swz9Hi2s7jm8bjTQOq+F3Y8rs4yI+8KA
	 FHkklVVk7Exg6pgJ1JcoWhnYe2UA71GHqvpzfxmAj/fcNnIp7iqeH77Q6kgJvf9r3JruS
	 +J7TZKvhfKu9OhbiSbuPLy+sNJ1SZ1IsUGDxg6cQ6ArCOOBJ0zJnzjbQPdOCPBkZbLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792941873;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
	b=PJBw27uemPRWupT5gjyGZWhzTxmhcAymQuu2cw1kYxeY/MR7g6KMidKHAFKJ+WbCC6tw
	 SQ65wFnb9FSmOPaaUA1NjbB+mPiitkbjQpWcVaJUfEXjzzsXG1EMmLdUsY13zTt/OrFSW
	 8jmcyN4vG1tu04eTTAPonnB8gGHCaIdBCIKIFdKFotp+r+oO+Eb8G+QFi7XihAvdy1vnc
	 V+DvROZDB9xLh3gLSkxPpaNfQSAQKeEcDIWlsGkR7bMsNeqHYMGhu3pfDx0SA6pTkTava
	 /kjYkucM7vXFRK3iXlb6E54zsrOeewoywjdCZw2UhTphdE2U+fod0ELUJcAvjHQ+eug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gMlUYdFd;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB989606A320
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 15:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB989606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gMlUYdFd
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso21055055e9.1
        for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792941871; x=1793546671; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
        b=gMlUYdFdvAQETuA6YIj5DvJs0A0nnjA5nYRIngOybGCA28mWCGlOgRHYWq/eHR6/jL
         /BX0jAZW8kKRXsVlSCPoKzQI5HJt/+J5Y4/PB4qPVxPUbKjwXe6y5ULZish6et3YJreS
         nWMllquRXTaLm5UYgmioTZRM3JANKyWQ2DIkNCndkZDU3p0kGz0ZqVM2fslDVE5ORPUX
         H8DHzt4j4t9QNMRQTqJlPNwRLMSwGvEJZbDQDhcHbrWQ+h8CJzIlbfUTvsw7paI8ucvn
         SiV5e5bo/kImdaoFmZg2omjIeG7q9pudAUZvKxU0TvOx1Oamj0LgGwsM5ahUjas9x0RP
         Z+CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792941871; x=1793546671;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IPyxHxI8QCk7tgMR65iE29Aq0L2SmeJ7DzhvVjt4aIA=;
        b=RPuD4byuA2aveqdjtboUjEuX52q22d7zNc6gLK2dPKXPICa9hu8zXO0toO46Fm3WSN
         xo0gIbsjfb78tP5bzwSNAva4GlP3n3pWwFGBpWvEaH7dO1eCyW3tlP1JcBTWT6iT5oJ4
         qebqLCFdklYRIk7MXJrO1mMDtK1XhFl3GpbUApO74YC5GLXmuuPU6WMpFYJVe4+tISxl
         xfHpZYdjwPJA0lKtfXdmZqpUF09WNBBJt5E9yHWPZLwzW9lC/KqXRfsCtGyZStcao2Jv
         gUWNmozOoKYvq6at6bzJCr8C2nwUgDl49sPFHdq3W5PUKHgAUEugVYXPrNn3syohPzGt
         awlQ==
X-Forwarded-Encrypted: i=1; AKwUvBykpG43tK6ybFWze5zb3Gm2OPNzY+pjQbCd1Z5n9LfkBPVTzlaZgR2jv1R0gelw4wr1oeowoNZ+YB03@vger.kernel.org
X-Gm-Message-State: AFq9FYL7sI5VsDiIrRRT4NYVMwKr68BjoAtLhYVhjHuabSPjDhOJ2TX3
	i8G6xELfLTY25lgbbrw3svkGHmQSaRodWtTrnf/vgMD9hqijo6op9N+H
X-Gm-Gg: AYBFou2x4qJCMztlwITFRNOyhhhLGEMB/V+tBItmVZRZ5IIDG3w843UAC/lMzAE45+L
	CVlihIZDinJ/DKXLw62JxFgHqOnIZCP7K2jQ60imbplZABwMIyiHsf8gGOCdBbYP4bqQQX5Q5kE
	T65FvMfa8spRJ7EyK65uCk3YWS0+ZDRVsclYUrYxim9DU3NBtfkWItmmt++qxc3IrGd/4fgqznR
	6Np0AJt16WA+ubtYDAjn18s0GD65Psemr4w3PSgrC+Wx/XHOwlGxgNC4uUNqOxeHMW8gVLApJgD
	sr81DT5uYivIdMtsEVrlLNAPp68a2h8cb8ot3KVC7ttTYmAUrJdC+7VU8uKdyZzu5Ih+JLIMBP2
	obqypB0d5XomkKmTXAZewExZMZIFzR/FNXts/mWmIhoLVrumyrQMOEK/UzEFgxsOAPuvDQDQBgb
	drCWZLbZDJh0klvLgjaLoytnYM5X4tGAC+SZqVq8jfvipAy/0zVz7rM8BfgPEGSl2Io6TmofEyj
	vZ6TGjfn94sBgelSlKynA+mZTnM7MisgxmKPSRE9ChNxbOtWNlGucQDk+7NI855CmpFgyDSCjLs
	cBnlL7yRbB5ahUCbIbzCnZAR2vzCheR6/wt+U78tr01M
X-Received: by 2002:a05:600c:5248:b0:4a1:83f0:7c8a with SMTP id 5b1f17b1804b1-4a35ac3cb66mr82142695e9.1.1792941871149;
        Sun, 25 Oct 2026 08:24:31 -0700 (PDT)
Received: from [127.0.1.1] ([2001:861:39c2:e340:4c3:3a00:d533:9d50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ae28sm132982575e9.2.2026.10.25.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:24:30 -0700 (PDT)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Oder Chiou <oder_chiou@realtek.com>,
 Animesh Agarwal <animeshagarwal28@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: codecs: rt5631: Enable the optional MCLK
Date: Sun, 25 Oct 2026 16:24:30 +0100
Message-ID: <179294187050.4141843.1375662350308483762@gmail.com>
In-Reply-To: <sashiko-outbox-184258@kernel.org>
References: <20261025145354.3476371-1-romain.tisserand@gmail.com>
 <20261025145354.3476371-3-romain.tisserand@gmail.com>
 <sashiko-outbox-184258@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sun, 25 Oct 2026 15:12:00 +0000, sashiko-bot@kernel.org wrote:
> Should devm_clk_get_optional() be called in rt5631_i2c_probe() in
> sound/soc/codecs/rt5631.c instead of the ASoC component probe callback
> rt5631_probe() (similar to how rt5616_i2c_probe() in
> sound/soc/codecs/rt5616.c acquires its mclk)?

Right: in the component probe a deferral is lost and a rebind leaks the
clock reference. rt5616 moved it to the I2C probe in commit b5c9df40ca56
("ASoC: codecs: rt5616: Move mclk acquisition to the i2c probe"); v2 will
do the same in rt5631_i2c_probe(). Please don't apply v1.

I'll send v2 in about a week.

Romain
