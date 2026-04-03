Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37431D5160
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 09:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208286; cv=none; b=hB0LIGlEgiAUOGlpC5VL4WILEQO0nD78bMFFOmBk1lhoDZjef2YmrH5asdAswGFF0z1/b6mjzOV0nK5xXeng2N+UNF5FpRJCoLEIU4KHY6SEZIUv26OmoXyXERocKYmNz9rJF4XclVECUfqHuo37YMLfLeNQZqsEr4qjalovjxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208286; c=relaxed/simple;
	bh=fLdFcRFTuaQzK9ctusblMFlkcfRxlRR1aaxYuKPajQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s8JDEbG/gr71irM5ghM0DQsFLLQM2QGQ0tUc+dRyANUxLPDOtRXXYUt6MUdukMyAUnxoEaqFjSYYC8m3rVoDXu4SeyqYeBHBm8Vr3YvL5xm6qL/4k/lmsb0wBZ7y67Wowhne3fQbwIpcqv39jX1fzRuAtvdE6o8AmiCLd4ZZlZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56daad0fdbaso204279e0c.3
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775208283; x=1775813083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGwkV+UjFh3ES3arE17ExSNnkFY3YqomwgIxcqNhunY=;
        b=PggpitzvG+SNOSpupMc9+F2NHRd4ODt8BmbMjxrvumciECZsTBdqiO++KPslxdRPne
         tCHL2AvRjXSGCUYzgQiVI3j6+ImnxXAQ0b31tQNgZ/BPGS0erJMqhuhKIp4a4jp9Rp32
         tSoGsIN95v2oEPzObvNkOtwHm5YleI4DBtmb9QT8FElAv9F9IPmYEb16WIUaqC0xbCQk
         1gQKzrwpBCaWysB2nSzeaDfDy432YzB3MjvomhK8oMmu8/WaEgmPB1W2OBQrWsI70Np4
         NWXdcIto+QdZ4iAqJjaA2BJKbIy8m/dXHJREyCsYBqS+YpSBYEk1mLLUBETzBFsKDyJo
         0Qxw==
X-Forwarded-Encrypted: i=1; AJvYcCWNdFe6kKzh5zjUfOsLHUvb1VzxxjHOc5CKkwTwodordLFlleZzmz8Kk+rPWhE+rD30+5wNpsy9HvTl@vger.kernel.org
X-Gm-Message-State: AOJu0YzMe+8/IZJgZSNn1YNwNe5lCIM59r/xbjcnue1eChaz+oSTxRnR
	Gn4b4tiD+5htTRatAGx9JlzjWJtkBn723hEYpKe9952lu9EgtYEGPcmtc7+52K6+
X-Gm-Gg: AeBDiet1yAjMxgl7Vv4KwOaUFaLSA3RjmmqCo18IHbYkZLumBeqownJlXw/fopj3hN9
	Nr0am86AB40r6v5GnTAMcKrZi/bhdSdEZ88POppt/jfyVrazbwbMtoCewtngqORURDpV07y5pwt
	c/EpPlET3SddJMXy7geChByM11d9ixmBzMTjcZJWNveGvn5BQ6KlDJls2sRqrbhoP7QZjLXRSg+
	OkO7IxvR/HwqDbANnJ1IWsXgjBSarFKRiHRVOX2ixrWE5LAO9KSDnPjfd2ktFqXsCph8dnxDEd7
	NqW+7e6BPPhxEPSr+f7a4OEVyLBR7PjnjvYNyiCSF/I7cKSFZ2Vfoz9Z8mue3lzcSR+tNYmTYaL
	OKdJ/CN2t44llVNPf0x9ep/97MPXqIWgsfcCb+yfgBkJU8k3N1gF0+oJj1zNuqu6EzhrTUoMjYV
	rGSaBeCn2j3TNQ1ud7D0MwfBF4qCjvomF3agAADZSplzSLixNPodtdjltvjL+iJMtZ
X-Received: by 2002:a05:6122:6504:b0:56a:f979:a9d1 with SMTP id 71dfb90a1353d-56dab828570mr416327e0c.1.1775208282933;
        Fri, 03 Apr 2026 02:24:42 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9bce02f3sm6223283e0c.14.2026.04.03.02.24.41
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:24:42 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56ce54c8c82so646966e0c.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 02:24:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcxQDpu5XTznDoh9n/spR9psKm6oo5i/45+Kmbelvih4/yPFjDdsNC7ob701FQInPeDGyWVQF/yCnY@vger.kernel.org
X-Received: by 2002:a05:6122:4d19:b0:56d:9479:edbe with SMTP id
 71dfb90a1353d-56dab828397mr717575e0c.2.1775208281444; Fri, 03 Apr 2026
 02:24:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327234244.91707-1-marek.vasut+renesas@mailbox.org> <20260327234244.91707-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260327234244.91707-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Apr 2026 11:24:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTMoGsv-7O_FvUd1pudKc5aPE9ZMUsh=WJVVEk2PwP5Q@mail.gmail.com>
X-Gm-Features: AQROBzA_E4MRqEH0wurp8MczanbrSi-ukqv2OYZut5h7OMTTpNrF8PdeZIFzPjU
Message-ID: <CAMuHMdVTMoGsv-7O_FvUd1pudKc5aPE9ZMUsh=WJVVEk2PwP5Q@mail.gmail.com>
Subject: Re: [PATCH 6/6] ARM: dts: renesas: rskrza1: Drop superfluous cells
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 28 Mar 2026 at 00:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Drop superfluous address-cells and size-cells to fix DTC warning:
> "
> arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts:32.17-72.4: Warning (avoid_unnecessary_addr_size): /flash@18000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
> "
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

My bad...
Fixes: 98537eb77d3ef185 ("ARM: dts: renesas: rskrza1: Add FLASH nodes")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
