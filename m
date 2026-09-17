Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6220650EBFF
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789655266; cv=none; b=KyxsKZBnrGdrXadpUqDpp+MNZBvWtq/6LVut5xnTVsTu9fD3mN6LhdilBII4f2vOGiF8dvbXCz7a2IvE3A/AISiJo/NIHKwiZYUK9/jYEsRBKSqNsiCeqgT/rvqFE58Un1jwWcRSi+dsNcYTdlmWV3jYFUzHinSAgcw4M1PjSCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789655266; c=relaxed/simple;
	bh=tR4az/LXX1uPEVPqZly1MWtWJFRe2M+C1Rbz7GqFq7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bVZ3r6iEHW3ey444AadHOTjvRZTO8EacdZZdSS2QKo9+PsB1RRuwjyrnTcMbX8oTx+xdbhNY9/FCL5LwUlgQT2rnfN9dCKXi2ZRtPOHggB0GIzTQOTPNDYgBQ1tqdA2Czzft05OVaQoZbBuBU0B23qopIOTi5P65iuxoy48HXws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78565a41a19so283865137.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 07:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789655263; x=1790260063;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2PUKRWOpjzB1uTEg8aunaQFp5fJugA1o1ujUfXk8Z4Y=;
        b=1zBq0MN3H+NhkSiK6Gq11YonoSv+Ce4tYWz9mRYtBfJLBZyB7J5MTGx08oK5boK1jR
         bMA/kM8vpG2KDp0tuxLACrjYONfJHoMCbHE8Oo1dtibK8X+wpjht8gf1PCJHRTZDmZ1t
         VqYpwlB/jb1teadflXMV54oghssSeU+TAQyztAdY2arfci9qomy+tNi33nRq6ZO5M33n
         tdbJi5iafCQCCIHqBGzaTnn82Xe6JBkP0bg5k0zRXGy3xau4OQ045UtIBAvFnvvQpVXm
         Ybz2CRfj5NdgraR+CIXFHYrCrgHYp3wZweKLUiMxKV0iV8rh2YVOxKho1pQHJ58LOTnh
         ORaQ==
X-Gm-Message-State: AFuF++ny3i2kYogEO9yQEmJMGGpEfqNMSB9sr7lYtAMPUvLiBWqg8qHz
	Guj4AeBeHtg+eE//dCH+i/m7ff+IH3omcNtxU28/wA6CZsMAQA7QKbg1nwNKemrv
X-Gm-Gg: AYBFou3pDGkn1gIkWmZ0Czb+hiA/LAB+c/84dnF3FacEsqSCTGsyg62B4X3aFrX0y+E
	rZeEj9UmI0O1Lrr/Hu/xn+vPKmE9YQUTuEIxfJch7NTrUxjn9oQgNnB8PNGiEioNyG4Vc6O0MOZ
	EuYEt11VYN8ouoMpsriugWcHsEmVgFkM5Lv4P6Yuo2oSqe5+57nAVfY0Rtd7O90/Gdvc3OuWGJK
	ibD8K6X1fTmAttLkZr5bwcQbcXiEqv3M/j/llYzXz/lfIWMZURoUQufk1X/pLJyJsO5jFS/1PBO
	vgXY9yNUIHJQz9CAQpRTU4vbGlohvMpfqXaTUiEenCvED1/me7b2l0asclOvowR6m5EgBOp1ya1
	jBpFH62KUsxUf+IfkiU/+rSJfYeYhi6fFV5iGehYkZmVgkjubGKaj5LmjO/240zypDVm5K5URuH
	eqy04vT072i2jM3dKoH2ITcaY456K+jly0TzYuhswjl6NduL72TAL83gosPzSv6lcKHp2Ezqidg
	bGUCSFYIq8RWhmxqjGbsTVNFOI0wj5Ufv+q
X-Received: by 2002:a05:6102:a46:b0:7a1:f951:f2fd with SMTP id ada2fe7eead31-7a1f951f50cmr1892230137.16.1789655263152;
        Thu, 17 Sep 2026 07:27:43 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9832354a8aasm3086176241.10.2026.09.17.07.27.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 07:27:43 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-78565a41a19so283856137.1
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 07:27:42 -0700 (PDT)
X-Received: by 2002:a05:6102:3f06:b0:79d:e3a3:4ec7 with SMTP id
 ada2fe7eead31-7a028d64e77mr6733201137.8.1789655262508; Thu, 17 Sep 2026
 07:27:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4d6e5ac045af387dde8ef3810ce08c7cb079fc29.1789653872.git.geert@linux-m68k.org>
 <20260917141443.B68B91F000FF@smtp.kernel.org>
In-Reply-To: <20260917141443.B68B91F000FF@smtp.kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 16:27:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVgJkwkoF0-ptQ9g_8E5j1Oa8G41nBiiOfY+KF_p7XAxQ@mail.gmail.com>
X-Gm-Features: AcwNN1Ush8QJQXkRhAfTq-tWcBhQ0EMlNvr04HXsZawb41gsyRT18-MJVn4i_LQ
Message-ID: <CAMuHMdVgJkwkoF0-ptQ9g_8E5j1Oa8G41nBiiOfY+KF_p7XAxQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: serial: renesas,scif: Increase number of DMA
 channels to 6
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, 
	conor+dt@kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"

Hi Sashiko,

On Thu, 17 Sept 2026 at 16:14, <sashiko-bot@kernel.org> wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: schema allows 6 DMAs for older SCIF hardware
> --
>
> commit ca96f7e40234020713acb3baf706d0b07d5dcc48
> Author: Geert Uytterhoeven <geert@linux-m68k.org>
>
> dt-bindings: serial: renesas,scif: Increase number of DMA channels to 6
>
> This commit updates the renesas,scif device tree binding to allow up to 6
> DMA channels. This supports the R-Car X5H hardware where SCIF serial
> interfaces are connected to three DMACs.

I wouldn't bother adding further restrictions, as these are not related
to the actual I2C block, but to on-SoC wiring.  DMARQ is just a single
signal going from the serial block to one or more DMAC instances.
The number may also differs among serial instances on an SoC.

See also my similar reply for rcar-i2c:
https://lore.kernel.org/all/CAMuHMdXj04QoxituCF3wRcyzN7qZrVBn7-ukNkKDd0OfhB8zOQ@mail.gmail.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
