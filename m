Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E94D3D7D93
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 07:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779175820; cv=none; b=rUv55OHmNqBvtOnw2muAmGsrB3ZHRBgnJY13O1Db/dzztG6u+a+R9TU4LuHnlyWrn8zzQ0bXvAJiRsr3VkWed5m2Iv+sFAnyThdsGL+efC/IcbD26D6GRQxv5PWK9fwGuoOvVV+AEvT9rtaJoDOOlhgp9mBj1GqFYcjWPjroN+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779175820; c=relaxed/simple;
	bh=EP+l3Xsf/02TI72QB7nqXNUQUPtcxewjH2cpp+hAG40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NbdbuyGaOcNbEZosZVvxUcVkgbryBs7h4qdFH6uVpwMi0FB2Au/B+Mz5PlCHlRr68kD6SQ6yi+5tAAFoWuyqE1KyngrK+y74an6vnTPvhNY4HqxjTImmc3Zjk058TTImd4E8u5I0KVKmGF1gLD8eqtZC5TG7pnYQONyRkXV6fIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6314adf187fso902830137.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779175818; x=1779780618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1Ydpi64imhfiW3BOCP/037yrb9bXbwCDPHAO9TSn2c=;
        b=X1jgg0SHvpWke5PqQW4pxEvHQ+6eD3Ud88j4qU3VlveOapfxZbedrL807GrB7vJWxd
         gfe3I6yRGnt11LPKFQgHEqugEu8RaFa6Sh5Ou3YsVGgJFWLZkDinxb8NBRBzSP9F3l8c
         OaDEKKVP51EnRsStLhZwr/0VidBdElhlCjDKUgCvnMTb5T3iptl8gLPTGXg5jR1V6J7K
         8UNxkSUpTeoTUfw2y8UxbFLDVRxOynQs/RK77E9d/bHeZUlt2pxsCeP8CWe23X05fauU
         JXoe3ngM7EXL/mnzALLaSrWFjwMdjXsxiepbV+5SKjUxggJmLoCSUzDBTSc5eqvVJ94G
         VwYg==
X-Forwarded-Encrypted: i=1; AFNElJ+97T3QdCVV+pFqBt8U1Z0sVNKMdZg/PxloLR9Av96fn53SuIY+WgthmiknUk+Wk5xmWbJ5xzAHOtp7@vger.kernel.org
X-Gm-Message-State: AOJu0YwZEof5YuQzywUj5d9PSBuzmDxTvHYyn3+dMIrDxtRvwjaR1msN
	u3e/aNzCdUR5JrBoQi1N0j3uGQ9u4oWIo4uDQqDa12yKFF3jLuYXWJU+DMVtszn9
X-Gm-Gg: Acq92OFcOVH2VLLgKDbn09ONieev2vZLfOCa0vwWzQo/Q2OIVfr2yQc9fhIjkm77jxT
	8u8ra4gWleUnNdYsobmmK1P1Xk74cWaXsMXZO5pnqpoYffeuoeunlnOW18neSW+7ufXojnQhGh0
	czLoDjmrB68h5xVq1up5q7rh8+xUxRTC5v0MmaDXSEH7YnE/Ob39ijfTb8AqnaRfNpxZA/oXYrJ
	O/qjKfOagxjVfx6rte35MnYgsqI4aUKttpdVcF+gfVebHMTEs1vEQa8GeO/DuXdb3L17MxOvzRg
	tyq0Ra+bwuguRHf8b9FLEkBQIFwVug1DNqrnKgQgqIE/KFdubEwcDACf7BEdxaybIGE84tgGxef
	CulhcDJUWNyLU4P66nCoadfoaFMCaulk5SJ/Uakh8LVqaspUobnvXKf/nmJm1hthiK6RWx8N357
	kkHJEPSe2AXSYK2aWSLgssS5i0luqAo1g7W+VRCHhUj51B51C0ubCzQ+GNbgKI62ssolP8M/T1r
	pSTIDEhSA==
X-Received: by 2002:a05:6102:cc8:b0:636:46ee:2f0b with SMTP id ada2fe7eead31-63a3cf2201cmr8276969137.12.1779175817997;
        Tue, 19 May 2026 00:30:17 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-63cb23b0d19sm6172351137.0.2026.05.19.00.30.16
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:30:17 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-95699e8e26aso867468241.0
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 00:30:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8mvk9K+E+xfR4bjf0sMWAApliByxhmUVWBkxteVUyQQgt+DVc1KZA4nrn7jiUL4D9PuuQIRfTB7JYQ@vger.kernel.org
X-Received: by 2002:a05:6102:598d:b0:5ff:cee8:660c with SMTP id
 ada2fe7eead31-63a3fc94452mr8770872137.31.1779175816720; Tue, 19 May 2026
 00:30:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
 <20260512033750.3393050-2-linlin.zhang@oss.qualcomm.com> <20260514-clever-apricot-goose-acc827@quoll>
In-Reply-To: <20260514-clever-apricot-goose-acc827@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 09:30:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzraGnOxRU=9bsxBBBFtVqudMGisfcAegUzk+_OS2+eQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lg6L73kxFzoZy6C0Wkwm0pix0KrxlB1EVn8QM9gs7VsfrBk977OYQBtOQ
Message-ID: <CAMuHMdUzraGnOxRU=9bsxBBBFtVqudMGisfcAegUzk+_OS2+eQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: crypto: qcom,ice: Add sa8255p support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linlin Zhang <linlin.zhang@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2026 at 14:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, May 11, 2026 at 08:37:48PM -0700, Linlin Zhang wrote:
> > On sa8255p, resources such as PHY, clocks, regulators, and resets are
> > managed by remote firmware via the SCMI power protocol. As a result, the
> > ICE driver cannot directly access clocks and must instead use power-domains
> > to request resource configuration.
>
> Then how can it be compatible with qcom,inline-crypto-engine?

It is a pity there are such big differences between the SoC-integration
"hardware" description in DT of systems with and without SCMI.

For R-Car X5H, we proposed a difference approach[1].
Linlin: do you think this would be a viable solution for your platform?

[1] "[PATCH/RFC 00/14] R-Car X5H Ironhide SCMI CPG/MDLC remapping"
    https://lore.kernel.org/all/cover.1776793163.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
