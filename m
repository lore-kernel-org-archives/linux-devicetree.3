Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5812D35CB66
	for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 23:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777419355; cv=pass; b=YrPbS1nuqLkGYS54V5J8cImYcjv3DLujy3cMOqr2yKQaIg3F/q12F1Z9gR9D5EhQHjqA5v6vbwQ1DpURRrw+vopFD/xP7Ouh+IGr5k6gYJo7cMJ5+yImjpRV4m3v0FKrDOSJQMS0bPGa3RMRBlKqB8P+/hgJsW9TbBXMM2DeLN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777419355; c=relaxed/simple;
	bh=p24DGe2ChYsLvCmBXf6Kp5TWFFLOr7i+/3Xsm2m1l9M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VinKe5e3Tvs0Vzp7qomozAOVuokyUTE1WTx33Vdsnw2jpbUGEk9IrzI/OgYkpUgVFY1i62L77BTDk79keAILUYm+hsOz/EEYU4APXtrpbAxl8WoTuQeYaiVn/iC8aEVjqmZ1kNQpHNVm9Eiz2aJ6NrpXHxqAthimpda3JJzv2yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqhu2+sG; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqhu2+sG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ad9516a653so60839105ad.0
        for <devicetree@vger.kernel.org>; Tue, 28 Apr 2026 16:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777419354; cv=none;
        d=google.com; s=arc-20240605;
        b=HaitsWGyBazoa3j5/CrO3FDVy2GPDREfSBhrQ8lnrlebh0VvvjVGIUCCA9QelG1ozt
         SXVRmZzgtfMxGpBD2cNiB3i1oDOCh9XmGIyDYNAu19fDFKuC0gFesNrrDiLh080jemVq
         7zt/4epmJi0mjpDWETLOAMpTuCZdE4I/9tQJ7SvyOQWYURTMy4n9XiKyQ2bvkn97/qnK
         GRSIqYn8H/aoiZKvrfKFrnZffvEPh3ZFRAsAaqQXs9hZRR+erQpKKZqkcfCsBcAWnOb+
         YOm4IKp4/Ai1+YZZLa1MYjbMDxi9+WjF1MeZzeHm2PVI55211hpxL3pV/NkbfFDD915O
         FR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0db33wYSB/VKxNPenizKPNWOjqB/3saiIIrw++PQlmA=;
        fh=q2wP/SQSI3YPDsd6+p3UQYD3Gp+QIkmDln6ZGaRUGr4=;
        b=lIAF5tkGVN0x5iuAP4ROMZ8GTUmiXUjbreeypipvr4iw6J3l/NDBVwCiHnrfmFaiUp
         o1qWEpAhbb3yAjhXSB+Mnh50B4qg2FyVg8SBY5kyZHa55iVkQpJMG5CBjtY/p1rBXTuz
         fvSTCji9g05nkF5wipSbXorc2bHnUyrYnquBPvdfJLq4ZQSp3vwaddN3S6DhSsNmeRua
         IskzcBb80x3JXIlsm+QzL22M/a0gAdbDR/60SKdvmD5DkiofAJjNdcu1wZPkODGDhh6s
         USnpZl0OZBhKcFy6lxZNZvhtMnaiCszDcKJDjWjlH4wY6Qibi1g62jXzJGzazEouzXAF
         zLTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777419354; x=1778024154; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0db33wYSB/VKxNPenizKPNWOjqB/3saiIIrw++PQlmA=;
        b=lqhu2+sGzhBTsyZRRos2jZ387BvKCfAcc1fKf1A/JtGEisIHLLncDhhkhhRlvdUIMJ
         Dlg3Jve5tuMahEqtI8RpjhflyeAMzsEIi3hfFO6jBbs2PLnQBwAKxE8w8h5rWhIu/b7h
         i+1ggRanMO3AgRtgI6tcLrx4Anl5NaM4VL1nKJ7UaCeVYW34Bh8SvOqkrjGoFf+B4m3z
         XwhrlcC7MepsVB3dW4Sa6QjGUZJZW5ERxk8/PwiX1ZKWInGa07LASTJi254vjO4TYUf8
         KsgPXB1etH51a2Ky1hoCINE5EHN+oYpO5Ep8rRjv2b9Dl1aRPtQdeWinaMksZwxTenym
         bY2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777419354; x=1778024154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0db33wYSB/VKxNPenizKPNWOjqB/3saiIIrw++PQlmA=;
        b=qmnTa5KOl0tDuGEnSumfbXAfW1yfGoQ43oGbBL5vyyryVRZh4YbmJ5aVPN5YBiMvqk
         V9xNzJYYH9s92RaaE8lMRIhLWF3+pMuEjzCv4pWYNaAvAeygjuOMBsuleT+1MgE0Tk6Q
         HSdEWFg6g7P0A6Sw3VAtsj4pSF3iRp3h3kO5NuMCqGEDqc7zAmAQ5aI0ITMZxaPEsOrQ
         0MoBJ5ARod0G0stEHi3D+Y+BsC8ljOuYpwMa350cFvN05q7bSDY5Ne2r8md1vzgxgu91
         VbzJD9khM45j4PheHwCJy9007OaG7K2yOICKqwQzGlHXHSboRjubTP/sD58jh+riB9cc
         wo0w==
X-Forwarded-Encrypted: i=1; AFNElJ+s88NeUApKkrXS3DyuCKed9/fKCDf1jLzvA40rnFjHFq5eOohEF2r6NhChYc3IcDd0guM/2qptYw3R@vger.kernel.org
X-Gm-Message-State: AOJu0YxfyD/qtKll71ScfEFRfiM3Wrd44mzGXTwVkjbSICSS85XieRwq
	EHtsQtz83zmWm4Vp74Tn3B4/B79uDwiGZZjTQyXs5R4YRYSI4lzCeDVYoMgc+/6T2Brm7c9y6nP
	hr9UvI2L3qDtryIjveFpVawsjUIMP20o=
X-Gm-Gg: AeBDietGAfpWPEg5Gz3VQR5ivbaaHeK81V6qhhmXoCDUxnf7gzV4bIJxlR2DDvfuXvH
	qVXHptvxf9jNCcr5Hxfx2gX3DpJPlVFNlS4JktDPxweOiqUUOAWA1tU+n14r7NWJKSP6sX1JPuc
	+Wj8mXlnB/l89LBSsmEti/m6F9EGv8C9C+v41QzWyz4NryRxkQx8dCPYd/Pxpjb7heiRaWkU2Y1
	A5cdxwdWGxwmXTcv12MIlDc+IybJujpGY2oSqkJXj/H5OYsAHx3UBiqfL1uZmEN886sgLumEYyH
	KMD/Dl/K/UKyBb7hXUUPhzoCeKkQr/RRW5c4QbHJqIS5LlZc0dY=
X-Received: by 2002:a17:903:1c5:b0:2b2:4b4e:e4d8 with SMTP id
 d9443c01a7336-2b98730ca87mr13536075ad.4.1777419353607; Tue, 28 Apr 2026
 16:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-0-0caade5fdb32@linaro.org>
 <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-2-0caade5fdb32@linaro.org>
In-Reply-To: <20260428-topic-sm8650-ayaneo-pocket-s2-sy7758-v1-2-0caade5fdb32@linaro.org>
From: Gyeyoung Baek <gye976@gmail.com>
Date: Wed, 29 Apr 2026 08:35:41 +0900
X-Gm-Features: AVHnY4IUG0aEhSqiUeS0javv0LFZ7gitoer-tm54oLakxbwVeIPwDa7HUcbCYTI
Message-ID: <CAKbEznvPAYFUt-ykH7rCQwMFUq6N68B9x7Dd97WRDm3Mvj34fw@mail.gmail.com>
Subject: Re: [PATCH 2/2] backlight: Add SY7758 6-channel High Efficiency LED
 Driver support
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

> +
> +static int sy7758_probe(struct i2c_client *client)
> +{

> +
> +       /* try read and check device id */
> +       ret = regmap_read(sydev->regmap, REG_DEV_ID, &dev_id);
> +       if (ret < 0)
> +               return dev_err_probe(dev, -EPROBE_DEFER,
> +                                    "failed to read device id\n");

regmap_read() seems it can return errors other than -EPROBE_DEFER
(like -EINVAL,), and hardcoding -EPROBE_DEFER here might drop the
actual error.
And maybe would keep retrying probe forever

How about this?
> +               return dev_err_probe(dev, ret, "failed to read device id\n");


-- 
Thanks,
Gyeyoung
