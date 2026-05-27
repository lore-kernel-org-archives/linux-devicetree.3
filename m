Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAF822370A
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 07:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865755; cv=none; b=h3j0ZzQh6f18DbjD9A4DxvzQDAuMJyHLU3WG/LBvI3PeIrMoPbIeiTxtX7T+GRuN4IYoKD6U5/PgAd7Icpsfq+u8HLewr0HsHueBooinwiCr9MaAc872PmpFv/jSaLN6Q23kwJjVa/2YKsYJ/Beye5zdtBzGlLk9p8Y8tVdlUF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865755; c=relaxed/simple;
	bh=ngrbmOnXC5lBjdRyD4GqxUFWufQt4vLkSjmsYEIayIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G8dOq7Gz1BE7FkN3QL5SL6lP8y/4k5TyqREYL2C6wbWHIhlnlKxO0ZSbNLgeQVNvYQ/nMaUWHUyVi4scRKgi6d86B7NITvILHNrtfzK1Bd9N+CuECowqlFDaMIe8tjIZQeckEJCJy/sFmp5SAuf81+RbLeCV24OvMxwlwfeifZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-95cc96eac66so7864573241.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 00:09:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779865753; x=1780470553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOmm8R3Cq+WYMZhLsp0nlZk+GIal/aJfbZcGuqrg9gM=;
        b=axwI14B0/BvOuGVIOdc9rj96TPOT0bZPp0ToMOC+y1ScCTHou7GNolu4Rj6FBAAiC/
         ET9TAJ0N18UX/dDqdwR3qSQ3uy4k39wzkD3R3nrRVLrwzMZ7msxwhvj2m46IUJrTRQRh
         bsuGOYhx6AtTuet6o0n83Nl+5QV58CteA64miLLE/8cikpmBjD5a3xW127plhmC3IZCM
         ckGawCyT2TLxjxfDfY7bMHV8joS+E6jtm8PEpkHLEhLk2UrsOAlYVUfrtRc5+NSZMTHd
         tcgZjUF+YfSGAt504N/4Uv8wq0b8huqx9AI8toaeUZqYP7sVvXd/a58AnqWeIJ7Jke02
         j7RA==
X-Forwarded-Encrypted: i=1; AFNElJ9Igk8WCJclrn+FWdEdf9LOd4V5OLbcsyVBSPfPTEzqAnaqTlfin4zEP5olIv7bVW4oJ1looT2rSI0d@vger.kernel.org
X-Gm-Message-State: AOJu0YzrfMkPqP+k0sTTXB0EQsmTuqeMdbEvGNXe+ZIKgTc7E0dTZc/J
	fRlqN+gsnpmPBh8t/BVBfrv3DeUqPXf0vVMMxoBUF7BLaxcSHvYZUhGnSdDvyzjBcK4=
X-Gm-Gg: Acq92OESp2vampSJ+Or1brlUAXZPdjP0Or00/aAxXcCTzmT5zIevt6RfMnqH++ECS8d
	GzNH5ElbhYoIn4drvS9iTiZU5Kt2K1yK09RgD4fyAlBFLOPq1qxDWR2EPLpLGFGU7wEgO+bL2wL
	QUmLZBQtuzRYKmlocssRVc3YrlBpvNsrdjYhxNotqBdMbS35NdqUdwMiVxKyy2TxwfiwS1/h19f
	/9Xv00NYU0DUoLA/miib33CdU2zWQAT9sRIyJjZfYR+I8Z4LgiN2yGEW7tahTweXskpT/9v7dne
	oZIeUywGy4b983vonZZM70UavCO1DjEtQSUHQiTRr9hKaojhQ7IVSsV0XEFE56iClrojglE4njt
	14ulVu5mbb0ps1h8l8Mf59ufujEpyyOetovkrL7tB5YKjpHwWABh8Hg6T97LYO/Il+W4QPsR3Qy
	XlJs6b7R62mLb3rKLsK13ulJ0+1OYtk8RAdl6Jaq4q4Mq3YNJjmYps9G22bajI9NZF336c1UQ=
X-Received: by 2002:a05:6122:32c5:b0:575:2ac3:4166 with SMTP id 71dfb90a1353d-5865fdf6488mr11390557e0c.6.1779865753331;
        Wed, 27 May 2026 00:09:13 -0700 (PDT)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-586f23ee48esm19066189e0c.3.2026.05.27.00.09.13
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:09:13 -0700 (PDT)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95cc96eac66so7864567241.1
        for <devicetree@vger.kernel.org>; Wed, 27 May 2026 00:09:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8o+aD+Yt/RyAzc+9WlH8+TitXWhlfrmpx6G09fZQQAslqtqvlMWAuNaJ2Yiep4cXLQPGHbLezXapaX@vger.kernel.org
X-Received: by 2002:a05:6102:8009:b0:632:137d:3ab with SMTP id
 ada2fe7eead31-67c8e2c996emr10450851137.31.1779865752913; Wed, 27 May 2026
 00:09:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513225037.49803-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260513225037.49803-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 27 May 2026 09:09:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWy4HDUDCT=UeKLJt5S6gYW4Mgtkx13zpyQgSych7ByZg@mail.gmail.com>
X-Gm-Features: AVHnY4I0JbQSZqWOxsG_K3k-o_DCUSP-T9m5VNAB8LF4AI_MR_0R3ag34vx9oc8
Message-ID: <CAMuHMdWy4HDUDCT=UeKLJt5S6gYW4Mgtkx13zpyQgSych7ByZg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a78000: Add PSCI node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2026 at 00:50, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Describe SMC based PSCI access in SoC DT. The system can interact
> with TFA BL31 PSCI provider running on the Cortex-A cores via SMC
> calls.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
