Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3696A51AFEE
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419353; cv=none; b=clQNeWyFo8BUkgx5GYjDHiqmwYs6Qj3sXjRavroiC9HN87kpG5rTGQD2yT/+4BVNJ66pyZNEzKyTgboE5TxZxLSYNhzdFBEMVQD7jtKE3Q73KXP/6hwMTnHF5HVNrCQqTGu2080UgbB/cGIufbe34I4zk9mhSJ7oZI7csWwO3YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419353; c=relaxed/simple;
	bh=Bw5159SWZK0MfXRnp1tl8h36EKMSwk4lSrReIomW8O8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MdaldW/skHZCsye8U8Lr7913/d0LFtuEjMrrexF2j0vbc1Zp9zsOBpSdjYrFNj/GOxmywhDRZBFFP7qougC+btgyqLGTA3OHRn3XRmq84XNJww1kObIhdk9d6DaHLCgvhTf2ORfgIFjn0VsE+Avtg2Loz61SjcNcXsW+KFmCx1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5ead9f60e26so88543e0c.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419351; x=1793024151;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gTsMBv+BX/aLxxsbc3oBL3K2Qt4xiXtXHE4nz5I9X0E=;
        b=eWuXJCiNmMTtx/hGXvUMFNmqEurIVLXQkFEQ9AL4vXVe4JNLpTLXrqYEh+TV+0CXrg
         esHDc45ohYDpBV3TdCJcNUZafgqiCjskeNoky6Yu8FAHnvR9WwP/fcQps9468VBTmLf2
         ZlHi121nZaDvrwWMzIEZFXXeLeiIDELLS/UWbnU244MFYsGjmhfvD/ahuQ7iWe/oiA3L
         WGKLqvQqnFvBv6RHQxdatqyVtIs3hdm25Cml2nUCLSWk94DGTbyykyBNdAQ9RQ1ygWOk
         3n+nU+iP1RzAmcaAJPuX+OAzuPOMris8xQaULBdJ4BgH6vrnBzGjbVAglx2SDVaYSsOz
         KmTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwj651pzM8P8mIOTsrMyBrbpHgKElGdmuPOXvWgr1LoGI7uoKKwfV37oftBsy944soZzcEayoD4OXE7@vger.kernel.org
X-Gm-Message-State: AFq9FYLcAOMOZBUGuw6pmfnnrhWERzK04iUH0gf2nS6nnMtlBZXETx3U
	G35cr6DSmCQjnYbnpf+mKDrsemO+YdzR2E18k28K1y4+cQjXQbDW4Cc35I4Kod4yb70=
X-Gm-Gg: AYBFou2kGGB/X3kSMvVK0CzSuQUFKIRYBRR4mPcI/ZyHzE3P1t3cHDETp3nPnHsRhgO
	6uC56GM2HP53nvsEGnokN/qFOcYzbyghhiceGHoZNlHHh5C1E8Yg+8IjQ7rfnch7C/7+dXPA7xo
	HbVftXQpkA4f7Izi5emIJeknk8wx15e5IyELWUNo0/EMfw7em5hUMgi5r9NIQoKRHZDc0CI5P1p
	xxkH7Js0RDWmybhsqNOiDB9AknJ5CXCx0dfHpgwz1mrvL7K5keWk1/CBaoAN89LTBv62GzGqwB3
	+nX+ZkY83Qa1hJmOpLNKRC4H98ycvMeLpZhejmNWAXNdNSxymSmupRlE2UxAiSs7JB28tZFfi4w
	d+gJVeL7rKMPxONDbEBqi2OWZNtQojyq71pdxf4X6eMjKEEEegAPYODE3Y6Co1XyUW5LmVRrNF+
	/hvptohRbHtzNBDVY8CRMRPt48R8sxDF/af523YkDZT+PsoNbAquPfRSb36WMZu49kMPV/Q3mLe
	l0Vm1ZtMdRV3QEiCAUfgnJNC/AJy8kwHpkg
X-Received: by 2002:a05:6122:698d:b0:5ea:cb6c:6513 with SMTP id 71dfb90a1353d-5eacb6c6821mr570097e0c.1.1792419351029;
        Mon, 19 Oct 2026 07:15:51 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b4776b5sm9590567e0c.3.2026.10.19.07.15.48
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:15:48 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-78fb1fb9508so476625137.1
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBySAVqcf8AmPCeymdSQZSf/oTMq2x3Ved+JN16JBeBxk3KV0ycNoDgezpEpm5F9d8LHxIGg0IJc+ZRn@vger.kernel.org
X-Received: by 2002:a05:6102:75a:b0:7ba:7a64:5946 with SMTP id
 ada2fe7eead31-7cc1823be8bmr2159864137.35.1792419347856; Mon, 19 Oct 2026
 07:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001082225.125956-1-herve.codina@bootlin.com> <20261001082225.125956-4-herve.codina@bootlin.com>
In-Reply-To: <20261001082225.125956-4-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:15:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXbeTU9ROjHQKje_+-hUCgtBOXEUpvnpRMh_dyJTo+Ew@mail.gmail.com>
X-Gm-Features: AclHuK91kcP9qOZ_DEuR872u-j2nw4CzwPaKsUs5BANpggKtpgKKO3z0eBpg8xs
Message-ID: <CAMuHMdUXbeTU9ROjHQKje_+-hUCgtBOXEUpvnpRMh_dyJTo+Ew@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] ARM: dts: r9a06g032: Add support for timers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 10:22, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> In the Renesas RZ/N1 SoCs family, two timers block are available. Each
> block contains 8 timers composed of 6 16-bits timers and 2 32-bits
> timers. Each timer has its own interrupt line.
>
> Describe those timers blocks.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
