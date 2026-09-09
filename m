Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974B053FD30
	for <devicetree@vger.kernel.org>; Wed,  9 Sep 2026 18:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979913; cv=none; b=SIZ6f/G54uCY1imsCCr75tWZ+WpcsdSZ8sowyAjKRhBunslbn98gLKJ7nBsg1LPiQ2tKsgDjQSJXqxme5XyWwxPlWVHyBI+UOQXEtTBALuio0jghcxkBquznA6NQAEtvIiif9I6nqU2b6nuNknVyWUwW4U3ZmIv9Lkp70wJGHNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979913; c=relaxed/simple;
	bh=WYM63RP/6qIs4Sb9Jj4o5ZhHuFQddVi5q4PJ8caVcwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gysZRbRv9w0e1YgbLrjgFKmO8T5dZ5qlNlMfkI++71u7RMwDEmIC1k8HixjlgtidMqkJWxt4KMZqZrSbpvAYfaissbP+9Vc2BqwqHgwIgzXq1uUetbeJxxlPJ8j2B+IxUce9G5Vsh/+QpqNffCipLyK8wdRV3ns7+HU1kuXFlpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78a6c77d255so605969137.2
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979910; x=1789584710;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HGn4boZ5W+dK4Lr50YdWTU0/URer8oxrazbRXftF9gU=;
        b=KJbOdmbR/c43r/9miuxdaJs1K5r+1CwvnKO1GG+SQbNNSGyHXXwZ/YdvRQnmhwqC3b
         /sOfxlG+zO79h9OzKw55X2G77ulg2al6Auzyp8kkXFraSkv3xPWLhhB5ogkd5V2Dd0B5
         ScVOSBvhUywUM3ydN0wCWKK/gvKjsj3M8jwvQ8GSINJZ8MtOLeeW6yHM+NmpeZ87C5JM
         u0xwzOi1WVAxiO3NHAyk70zEv31M9upWU3rBJb4QCgcNZB0HHOZtdR3WaWv4a0u3je0z
         +Zh1ZdSH+FkxNEnHNoUwG9FDeYZbtA3IkvOzR48Rhk9bISZYpTEhXlE5mI2ZrLNB4I9o
         KiEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwQxI8+uQyUAG5oFAwn6h51IjZ1/Yc+OHy1qB33mEmBrFZt2sfn/2P+h1LpPT8+vViT98L3VwiVZMm2@vger.kernel.org
X-Gm-Message-State: AFuF++knp8uAKvB8WKU9P0yD6in1q8NNi1sumrASFlNVE3pgiEXQsMpR
	Ch3IVH3MIVucB9PVwf4E0CLRgkAnChuqm+R3vWLOvQTzJKiUsDZv05MF8sRywSuIgME=
X-Gm-Gg: AYBFou2dnlhdZETLfDuLdFMsFay7/SKYzTUjZ2XzyjJmFZQsjJZxBVyy8Jdwcw11Kh4
	qvaXXA1DTfKhkTm9upUPtV5jgSacWjSGGsogOHvDVA1sYlfcKmRbn0Dg5zqsrgcKsJNpNEDW+SS
	AUugVrHOb7lZ7TM1MBuDor4EkvEmKVoIsNnO7eOwEdr3AKjzre4k+uQ8J5PandRph1FMjLumxvN
	3UKbhouNDeUBN2PfKvLWJzTATb0GiJbomEiXRaEoJvnHnkkmW6udKJwRmZIUIeig1SVdwPTtRME
	HJhYKrGTUcaf7g9KqFs/cA8XQZk9l47Zhd5OcaFmTVs3H8bVtohcY6djYXLCacbE4MlgkMnnF+v
	3XHBU9M1lvjUpLA+T9HMu9j+sV5MrIwV7Jp61ZxpNlSUUsjYn7U/vg3ZB3naz5UpS10bFlpbv/+
	u5/phMOmH89H+mgBjxHQ1andODedXSEtvzmmv8Nkv+XksYIlmD79Zf53dRMBwKiy+pGPooQMQda
	/rh9brkx1GHB/2DCfjvBFfbrPkg8RHqUuLurw==
X-Received: by 2002:a05:6102:5789:b0:785:d308:cc0c with SMTP id ada2fe7eead31-78f7423f6b2mr3129507137.5.1788979910224;
        Wed, 09 Sep 2026 11:51:50 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a47ae8dd2sm12080855137.8.2026.09.09.11.51.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 11:51:49 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e9af41731so466233241.3
        for <devicetree@vger.kernel.org>; Wed, 09 Sep 2026 11:51:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwrzegmRJfllUng2q3TeRSLtStrMT9Cf05rlBovZQL71EzPve8HrHHE/dGlcXU5B9uM7Kftge609nk0@vger.kernel.org
X-Received: by 2002:a05:6102:5789:b0:785:d308:cc0c with SMTP id
 ada2fe7eead31-78f7423f6b2mr3129457137.5.1788979908893; Wed, 09 Sep 2026
 11:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909184200.3319-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260909184200.3319-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 20:51:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW585F3vRqpKxgCM2EAG=H-y18o-6uOVU2ff4qAdS5+SA@mail.gmail.com>
X-Gm-Features: AcwNN1UDLjSSsn8pxc82wy-nfmiOus1jbwsmbeQd2feYUj1SY0-1MOOdJjYeqTE
Message-ID: <CAMuHMdW585F3vRqpKxgCM2EAG=H-y18o-6uOVU2ff4qAdS5+SA@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: i2c: renesas,rcar-i2c: allow 6 DMA channels
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 20:42, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> R-Car Gen5 can make use of it.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2:
>
> - dropped extra limits for Gen3/4 based on a discussion with Geert[1].
>   I dropped Conor's ack because of this being a bigger change. If
>   Sashiko complains again, we will ignore it
>
> - not a a change, but after an internal discussion with Geert, we
>   concluded that his suggestion of raising to 8 is not fully backed
>   with current documentation and we keep it 6 (for now)
>
> [1] https://lore.kernel.org/r/CAMuHMdXj04QoxituCF3wRcyzN7qZrVBn7-ukNkKDd0OfhB8zOQ@mail.gmail.com

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
