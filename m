Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188023F6C48
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 09:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780564911; cv=none; b=ETO1i2uzHs0FuN6YKRZLLb7zCXvfLPabw0UuJXfpcczKAxnTU7YENcfkMEzGxxiiY3ouA+l6u0j332UqyM2LoHfBcrXPiG/x+pLkH5gnmomGEw1jNHHknalNLqzZUrTzZAp3VkqLDXLTedPtg5TX2vpIEd+agO5rzCvzF/3K9m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780564911; c=relaxed/simple;
	bh=5pP+Mhk8279qkIOdLGflEyG8YfEu5sdvMxMifNU8e8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JvJPNkKOcZZK7bcaP+W2yAsUQ6yGWvxSi2YBQx1RCCBLXJUaUT/dpQu72O6Gjq649iDX0c2I8/bUpiHMv05WjlpKLN/yAhTA7sUIl6J96CuYERT0mJZH5337wdFhFfe7dR8CDnIxOqKAf057LxezcRzYKQ7g8b60xR8AvyLCgGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bebac79fff8so43901966b.0
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780564908; x=1781169708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUPD5OwKoUPxOlrUbBDtLNbSGHGp+GOIie5YrA6VRnQ=;
        b=F4Tm7rlORvaLqUTg14xH2sDfbQSN2xjLnlMWrOzFGas3BNjGRhBp8oYAhg+Ua1MCN2
         Fm6BqUzkY6BdJt6G7P+v35Gi1E/nnsIv6gQK/a5bI446ulXy00+Nwknp9QbZZISo05qK
         dvHQpDqoDcyLCSFq3wKhPe3pWyn/MW7P6ddveQ0i/FbVmCUVGJNyJ2bqTXMr2Tzp0v5t
         1NCD8IfZf9bkolS1UalSUhz1N/ytGJElzztbP5EDbCgm9M1cuV83P+WpIqzrNT65qIY8
         UUfzL9I09fHraSfBg7uC1JH/QkNWS/cHtm1VWry7b3ompd0CT+Y7IWPLZXswHJ3nijg+
         J26Q==
X-Forwarded-Encrypted: i=1; AFNElJ8k56DAWmqYIYC8QF3e2TH7qJ6+fWGBD9rVhtjuSCbGRmzIvyj+oStv0n1eNvtVTg4fPSkBJAQw86Jr@vger.kernel.org
X-Gm-Message-State: AOJu0YwR9gFW3x7cu91jbnHHGWimUrMZy9l+XoyADYaHCOk7reH+/4Bk
	xhd+efQUJQ6e1UUHcAUgzmTzg8CjFvwPcXx8rtmI/maNcWAhzIPRBABJwKWZ1/cE9nQ=
X-Gm-Gg: Acq92OFfwFSBfuYnbfurpC+FQE7+vG5bytBO0acCb6yHPf/zXquNI6EWyxNOjqXj6um
	pKjOHx+Vjmup1RKN2b9C9bcK3co2lFUHdPSKGzfU66+EpQeHU//zo4eZnvAGatKMDE7g7NdytJ7
	rUpGm1AYrElK8NyDfbhkwdcRISvF5QPqGQycBcH2hkHMICgVFyMuVBfKXj8XkRmmlfMq31bcKDv
	83Qb8v1GTaOBEUaMDfAO/joBbpzblrhagVUXQIq35jBPuUqx42Z5VEToWGYVk4v6mW4BejzUBHD
	VCe/7JimBk0CWsLFK1TjuA0pUpF/UUHQAqXPuf6vvxoxHw1tVlXks7AkMHr48Pfl3rNJKhw0SnJ
	t7zgYfcbDu+MH7Cow5FjqE+n8NiNr55EkFlmF/CyFygUqVrFKe9DQaXD5QH9OPg0QNB3ZSf2DmV
	yRB4kw+C37Ka8mgC2x9KuykyJSwqkRXcDdLFnf1X9PA60wVqKt09/WTvXX1bn1FSlTCwYKrcc=
X-Received: by 2002:a17:907:94cc:b0:bb8:b593:edba with SMTP id a640c23a62f3a-bf0aed0fb30mr330436566b.38.1780564908285;
        Thu, 04 Jun 2026 02:21:48 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051e9aa33sm277240066b.24.2026.06.04.02.21.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2026 02:21:46 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-68d2342c5e6so713690a12.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 02:21:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8T4TutzZjN3AuodhbrZlIOZGqO6bQ5NqbpcYRqFy1QutJH85vq7yyIyuJq1svZcii7zXtWAQBDOOnd@vger.kernel.org
X-Received: by 2002:a05:6402:5412:b0:687:7fa4:faa0 with SMTP id
 4fb4d7f45d1cf-68e7293d4dfmr3216975a12.23.1780564905953; Thu, 04 Jun 2026
 02:21:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260602182157.304964-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260602182157.304964-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jun 2026 11:21:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQY+Oe425SPwR1jvX3ut4Na6P8a+=4asz565Pk_wK8eg@mail.gmail.com>
X-Gm-Features: AVHnY4LbTi3uuwMEymEapl6w64Pb01ZaxDgzGzs7rTFgzCAq2HPVxYV4oXAMHf8
Message-ID: <CAMuHMdXQY+Oe425SPwR1jvX3ut4Na6P8a+=4asz565Pk_wK8eg@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: renesas: r8a779g0: add MFIS node
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 20:22, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Describe the MFIS core which is used for various tasks including
> inter-processor communication. Interrupt numbers look irregular but they
> all work as expected on a Renesas R-Car V4H SparrowHawk board.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v3:
> * fixed ordering again (Sashiko)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
