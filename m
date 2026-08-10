Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6653F9F45
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372913; cv=none; b=L8pVv3lUKK5D8pfwZfGC+kklsHxqIGTwo3N2STyOPI0UBpRX/gt5IQbP7hzqWV2KRghRzEq7Q5LUp3liWn8E52L48atdUWz9xvDaNx1WHXruwl5+zAI41ebkubwDEiVw1bVWEepYFR8Rqr77SMNdyE5Jo8HKIMxr/OgB/lAJYnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372913; c=relaxed/simple;
	bh=NlxQLUaP5Chjm4OrN1FpLC3mO3bI3kH8vyHo6dVucAo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WcvQ/LWoO1CS6U+w1bS5rtgcOU39fo6nAnlCJkwk1UKPQk/hVPS8Dv0hWGTlxKx/aBLSw1nJgPQ6wrJ79E+waTCPMf/va6AZ2wgcqfKeNbn4G3fP+B5LMOpnmKGkYOIBLuG8yCnFTD2qA7lJTRk0CvxcyRMYCIz+o8fE6Rp/PzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-754acc61e10so828698137.2
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786372911; x=1786977711;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=giEldGY175WVS3peHWMV7A1WyTzZJJHYTsaFpkbRHpk=;
        b=KPdKTmG1Jmavfd5dGfOZJt+v6n8r6bhJowDrUq7JpqAgIDQOOgjBklrF8NuCu6RWM5
         ceqgVll4WvP1IdhwwWZLGTKUvJkWBwUzX3+t9FE0C3gDpM9VR9VZp6hPmjyE+WH9Gh4Q
         sThtbTGFy6rgrWkohtZ49f4lf8nF61Uakzzc5ZVgp9BNr7sr6iqKBhzFHZQcIZLCpp2L
         EYdHs2dnX04YxvgFpLawZ74dIkNygubwhwG2VanW0DUMC8fchZpJ9fQRFFdukqGlM7A1
         dLzqhALOKACr+C5u3+bzIjxmP9/ROyHzUhbS0nam72xdEfnI2bqBytsTaWwfeFGsYj9k
         5FrA==
X-Forwarded-Encrypted: i=1; AHgh+RpzCA5LxJ6T4DOroOwF6QJ+rXvUaF8Oxia1hQiPOp1KKQVc0cZtRvh1gCX2s97veZpnz0o392OuRkYx@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxc+MvHTimEQzpADK4OTCb5MY1byIuVaOp4eRkGqCTEDLyLD0v
	VJu33SpaHt7+YcULA3xlM+eq2prNHOh/9iGhKYMPlZ3TOLdYuCgQeLn63EPWsG2Y
X-Gm-Gg: AR+sD11JQvV8uv2Y9p7Yo88dhIJjxbzM/I24DdineBlC3GF5v6ZjEqS4qgLv79e8BIy
	9vmrAYA3vquhePDiYPo2HeTRpvzcJSdTfdqZczDWawZEoOesvelLxMBXG4a7L+EzrEiu3mGQ/1C
	9+/5gOe9ROQTOptF/IhBMO5CAVNfALvV74HvghJbh6fJlREzkEBZCl2/Nn6iXzLOk3KFGKy9VPc
	ZJow9xGNH3CjmhI6kgHvoITqXy7Y58mh/z+x7M2jfsvfoqcIF4SYigBNK8K0WvBYlWEfUPryTOF
	UB89Pg+bIWRvll0IVTP0wS0ymGKod7wtzZEW2M+z05q2iNp8annJu7Ys03+W1kmk4Yhs6jvkNas
	Ontl1cFs6I492a4rUVkgosMGA0xY3HZmn2SW87YW/ggimc96xo9nU6Yr2lLDGFAZF+AqJqey8ci
	b7zLoRWRfwE2OGCTBd2k4HAJ6kX286DY6XTJ73yD+9Pc9g0J8jajKtHOtdQQBuQ0CCcM7w3Y2s/
	zlobOWxaRtUL2txynVyFPEiQQ==
X-Received: by 2002:a05:6102:6a8a:b0:74c:11b2:a944 with SMTP id ada2fe7eead31-764e7de713cmr5247922137.14.1786372910707;
        Mon, 10 Aug 2026 07:41:50 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2eac14fsm3611843241.7.2026.08.10.07.41.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 07:41:50 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-977fca41f52so680741241.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:41:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RopQ4h9OETkVcttFRgbGp86ACRsMZZHICOxmUvByFI5RgTKkZK+NGADWKnyqBdUSXmY5hpOCAydWWIz@vger.kernel.org
X-Received: by 2002:a05:6102:6448:b0:737:783d:1912 with SMTP id
 ada2fe7eead31-764e7be8d9fmr5541460137.12.1786372909447; Mon, 10 Aug 2026
 07:41:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714130539.11287-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260714130539.11287-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 16:41:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWP4O9O4hQ30mz8dL1iw_AgEPuqqZqRQiM=qNGqb2bQvg@mail.gmail.com>
X-Gm-Features: AUfX_mzwLbC_augmoVM0gc4_01wytzxMg7NdumAxkIRznv81wSo99Vl4iox5wsk
Message-ID: <CAMuHMdWP4O9O4hQ30mz8dL1iw_AgEPuqqZqRQiM=qNGqb2bQvg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Specify ethernet PHY reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Jul 2026 at 15:05, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9131RNX reference manual [1] DS00002841D page 131 FIGURE 6-2:
> POWER SEQUENCE TIMING INTERNAL REGULATORS does not indicate how long
> should the system wait after deassertion of the PHY reset and before
> starting communication with the PHY via MDIO. Opt for the same value
> as used for KSZ9031RNX, which is 300 us.
>
> The KSZ9131RNX reference manual [1] DS00002841D page 131 FIGURE 6-2:
> POWER SEQUENCE TIMING INTERNAL REGULATORS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9131RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>


Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
