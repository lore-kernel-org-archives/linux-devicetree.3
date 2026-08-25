Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CAB425867
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660570; cv=none; b=DkNAUywe8g8BdJmThoIn1Gmvmrx3mJQ9igP3HLQ5HtxJNK3k2oKT0t1427/TOE6rZ66t6vUKe0P7pq3ruHk3RZE/tMkVMVcT8zI0FiepOwv9/dlPPpuPklpKB1nDDGSdwnvcIdPV1x/mH2g5eWqIcRekCXbAoiRr0KGnPhpp8p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660570; c=relaxed/simple;
	bh=OUYygWY7aQGmv+jfkKR1zFDlp2pOpiZEhWzRuVbqreA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmRF5+9NyDZLVRRScagYScUzr+Bdui/h8L5tFpAB0Yc8aPmNNaAtBGTgV21KFMvGiEPIOzdNXkYRh8hv63NGZJwUOauxmLOOuqHr839Rn0mEcZYB5e6Th++Q2iOT/zeAporDKqWWEoWG/n7EyMHq7OzEcuWezGF9d0lyERVElYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bf959b820cso3630240e0c.3
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:22:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660567; x=1788265367;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CZpygpxN73GFJ3Yc0UcEb9bbZeeC/y4ziSdhkJEluzY=;
        b=Jg/xjwmf/79K9sJrSlL8YPUdCnoD9B3mnARGPLOUq7+y26xbZoVCneRJ2BU5v8aQ7R
         WPxSV/lENbUwohpJ0QCH3cEVn/yl12H4mTi8htDgh4r+pHq/GuqI2UxE+mYrb9puCIkg
         kzi4Mf7YLOXTIKRXAp9BMtwSi5ukqzHwnayK1fMDqg5HtZZS6cSynaN37HzOE8fxopfT
         ISBBycUnrGOWLve3C2IRfAKszAgi7uLF9YXjnuaHyFkUhYY5MQ5jcLEdLl4f2V4JfhdQ
         gi0fuZAtkMjgVD5LB1MJ75jdrZJcKLN8JZSqSiqI5UQft6JfJQPkR9f1rIZTl0hqGiLl
         5KTw==
X-Forwarded-Encrypted: i=1; AHgh+Ro26MJGXOqJ8AY2eMeklKfrVfKO7MTynQshhfaKe1MxXoMuLkX62yO/NL8tN3uNZay9mJjZYiZPi/p5@vger.kernel.org
X-Gm-Message-State: AFuF++mdjJIVcnh6OCBS/fUMpDlTxQxtV9mfkSd+az/OnD+O8147HJX6
	V1njIDNMyQveyybRSQuFBYMqigupDApY2luACLzo1MKrOukL9Jqm+zIeZtnrWMRNnvE=
X-Gm-Gg: AR+sD12srzenGCb3Te7HltZ2Kpa7r+BWZ15/dypIqAyPSTYyI27i3+3mA4WWcLvi5Vx
	wJsYIKckRYLLrQlQULPowZsN/vNF2ir1wFpsdLYmU/zSTAcOXOx8UpHJ91KfbOCRjNKHBBs479e
	aqtGtYXl+CCDtl688mSHrXwkBk397IIp0GvbuWtKPvrsEJObUHVV4/hJnRAXm7wHtbw4l7Bo7j4
	2uMP8KpiQvE2N4dOfK53TjXpIKLWr8WqVknp6tVrIj+NrBB3UrkqvagulfhHgGeWDwTgDDyck5X
	kl2PQgFZ5ljEOOUKU/dlYMwqriBauCSbjuvWflcHal8KlvRTBJf6Wi7n7hxer9PLL3iXwSAZxJM
	KKKZH33nnRTXv5/OJuqb4L8AKMZRXlBxVTmpCCux1KRQUeu/VGhgCPC3XLwbQzzhD5OgEhXom4x
	D5mlBnNMAFwzAbHBZ3oJJ15DZCyqpfF5Z+RnfaGdLFp9PfKtDNKoAI/6VlaQCwWhIwjs3yIYJhq
	DMoNwgZ9EvGRetUHbmHLnwSRPhGRQ==
X-Received: by 2002:a05:6122:32d0:b0:5c5:ad20:1fc3 with SMTP id 71dfb90a1353d-5c642f13285mr2580976e0c.5.1787660566935;
        Tue, 25 Aug 2026 05:22:46 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c623eb64b2sm5878267e0c.11.2026.08.25.05.22.46
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:22:46 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5bf8e1edc3aso3060484e0c.0
        for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 05:22:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq+bxXOksht8Nkj9z3lfiLFkF7oHCh7bU6jHxEU0JIKAyNwHyrSSiv6lQNFD2Zb/EZXaEl+C6P1qnBh@vger.kernel.org
X-Received: by 2002:a05:6122:1354:b0:5c2:c0b2:9880 with SMTP id
 71dfb90a1353d-5c642bdb0eamr2454179e0c.1.1787660566483; Tue, 25 Aug 2026
 05:22:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824075936.2904336-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260824075936.2904336-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260824075936.2904336-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 Aug 2026 14:22:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWc5NXsNcc0AHQdpTFJUsNEpQ=aFrGAjAL1KSq6S2UCvQ@mail.gmail.com>
X-Gm-Features: AcwNN1VrcsnJDq8cs0fem2pESjSMtykAAddgNrgS-0md2cMIcsry0z-8mFdrvHE
Message-ID: <CAMuHMdWc5NXsNcc0AHQdpTFJUsNEpQ=aFrGAjAL1KSq6S2UCvQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r9a09g087: Add RTC node
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 10:00, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add Real Time Clock (RTC) node to SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
