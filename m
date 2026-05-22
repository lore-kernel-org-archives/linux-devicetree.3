Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6E03A2576
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779455937; cv=none; b=HmxolPrvnaIKBu8ProEERrgFsfEkhkvHtm6GKsdF17L+9UO9i5Yq4W3Qb4s//zoPoKTNCKIv3XvDHZQs0tDQFAb4w169f4IGpJwa894UpY+E+eiVDvghXI/+KG5F/rzfE+S1G3DTxuexDnjNC+I7ngPPyy+XNGRYUeZRmN+ZlVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779455937; c=relaxed/simple;
	bh=f/oq+Pmek9pWpvzHueumQVSjskt7sQj7Cnj/0sWZKug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e7c6I3vSdBmp5XRnE8LpK4OK8TCljkcddtyu2SVGvpcDvms3NNUpQrO5dR3se68DCL9Jn8oSv119iv2NtvzLiP+7lXDq/sS+rGWTs/VUjOGGZVzyKZIxDxfWBMNVHk7TPbusxPepXyKySFSl270DuG7YCxUNRar4MabDIBTi06I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bd56d108454so1387804666b.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779455934; x=1780060734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAlUGw/HNtzbgT6oAPTSPOgW3T+XEEHWpdGiqyY+DBc=;
        b=T3Y2H91GqOXiOxnOwljnlsR+T6fWOe00phKxv/YQB0MJMxDomU1nCw6biDr23/smYV
         foAvEcNspPLpBMscc9M9PtSBixirKwbjrOUcmL3BPkljc6O8yC0mlFSRcTS7IW01OSeu
         zMfqZQkaW+OR/pbwcbECRGzBm92HN3WeqBaBH2TPz+OBN7gSL1sCzXO6YjRzLGbX/KKI
         smuwI/VcnQon92K6a2/z6qCeO/R3CJadOqsETWmuh5UWclgLvH3Axjc2TChFtXstRZyF
         uHzYs1XaaP7J+MQKM+fNItbxWPj+h2CEYHGP9sBaxAK3pgrba5RRpLYbxFB9XRDFmC5/
         /QUA==
X-Forwarded-Encrypted: i=1; AFNElJ+y8x5txydr0kJOa9EOr63dBOsXkxfU/8gGep3PqSbXMDBZJJ5i6ka6ioJEgFlMql2atEwtMA2b+NGZ@vger.kernel.org
X-Gm-Message-State: AOJu0YysZw4qmCb98DnjXRQh74f/lEQwTu9sftfIr4g0M1mgwRgNEkzN
	wTqI/7xNMXpQJcu8DrdLMDX67GLnrtS72BZUWBnLX+tdRyN5b7uDqQcVyrscmUL+AtM=
X-Gm-Gg: Acq92OHpAREdXhJhbpeFSq+zD00LT8ipDeA+tA+cpOqg2nDWe0L0NOw+RLcJdZMDVoZ
	eEo8M79MidDqWG2GfzvH9IrCOdhjr6Y0BpdB9aNtRoUGRFpOBgKq/Ib+NL2l1MEjoNU6DKwStkc
	jS1TS9/o6c8mFjCGvKxKNswPtzdd78n/wBHFQ4tqx5bi/p5FPAdRQeLzrEh2qmi4FMWGg9keAX6
	YSE6CQpxMuqlmgR8Wzy3cihXlT299rtugzE2+CsBd6wHlYQCwlq62tJmIyp0/Xw85uENe8MvHS5
	Pic0oO1sg41nbdP/OM3BkhJ8tPrDy3VsdSMCcArYw0vvk+A+SgC7MPbZshsgzUUMIYvlp4S3PO5
	bpqnO8s7MN96GISoBPbuxdmCsGq9hI61G2x+uG9zwWHvDBiq3qJzJcVtqoUXRdI6PmBRzPeqbWr
	uEoAyRSROBrQqLHZsWNu7v8cjh5iBTyi1wIbepLYAqmaUj2NubNaC+ygbN6xXNQcdBptNJvWI=
X-Received: by 2002:a17:907:60cb:b0:bd7:bbae:2002 with SMTP id a640c23a62f3a-bdd22a3d558mr240689066b.7.1779455933947;
        Fri, 22 May 2026 06:18:53 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688bb62b6dfsm659852a12.30.2026.05.22.06.18.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:18:52 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-68707d88626so6995964a12.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:18:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+7vBVMdfDZTVkg0BDeJgIrfGbZDt7AHF48yhTmSjd09G5vRv/bCsQOM4VnUtzOTlDmjAjKAIE2CBRP@vger.kernel.org
X-Received: by 2002:a05:6402:42cc:b0:683:75ec:c17c with SMTP id
 4fb4d7f45d1cf-6889c4464afmr2034627a12.10.1779455931829; Fri, 22 May 2026
 06:18:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:18:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoRBA-A8e=R8A4QOwdhVf2Xvca+PCD=UaKEjgFZU7RdA@mail.gmail.com>
X-Gm-Features: AVHnY4I_gegiQNXLEYR8j1H8kUfrINmIpRVRu3Rg4C4CjWJrdAfVaY1saWPkdfg
Message-ID: <CAMuHMdXoRBA-A8e=R8A4QOwdhVf2Xvca+PCD=UaKEjgFZU7RdA@mail.gmail.com>
Subject: Re: [PATCH 00/11] arm64: dts: renesas: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This is the same patch for various boards, details are below.
> The discussion that prompted this patchset is at [0].

Thanks for your series!

> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:

DS00002117K page 62 FIGURE 7-5

(and page 74 on the older document I had ;-)

> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply

page 62 TABLE 7-4

> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> The Gray Hawk patch in this series depends on [2].
>
> [0] https://lore.kernel.org/all/CAMuHMdXJvrsXitGagqZJ_STdTTh_s1cBAKf6+esihaVWjfn40g@mail.gmail.com/
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf

This link leads to the KSZ9031MNX part. Correct link is:

https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031RNX-Data-Sheet-DS00002117.pdf

> [2] https://lore.kernel.org/all/20260504225428.114959-1-marek.vasut+renesas@mailbox.org/

Shall I do the big search-and-replace while applying?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
