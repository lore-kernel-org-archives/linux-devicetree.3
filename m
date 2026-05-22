Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BABD3A960A
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456152; cv=none; b=Snm9WVXGBYvpN9bMlratKu0MMicAEby5wbXWv0Pkl/NgaJwmLcsX3QvzFwUcFv0sy9cL5+VexfLB9URfzxa1MNTImAK//cab2gkdGcqd5eRU8TIeZHbQcK9EcUJSIAeRntOy8dfJuaNkTJzwNYY9+vWaIOs35ncKECmavAJIgDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456152; c=relaxed/simple;
	bh=0PK4bMqXimU9iNRWNX/eX952I3s/oyh75Caj0sz7gdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BbB13ezAXF9gjSZheYuVsJ0CphjOQftG/++1RX1R1um1cLnAAx8VkadkDwP4Pm5l5UFgF7jx/8MeEvdC0yMexvQ1Ng5TSMjCUSvme2DXntZRTQAgS6Z6ewrnKHXYrikbbZz1M2DyqLUPO6tci+oDlGpwG27WFJPeMgUxBYZc3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-bd4f8260e4eso1375862766b.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456150; x=1780060950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8+hN45m6EcBjSVmc7/E001s4aXOZE0CXpfrpaEBAfw=;
        b=l8yOVwgdae/nEww2xbu3ZQMtxjFdJsbi4C3kc3cE4vb0qf20mbCq+HDqc0RDj/KwN+
         gAp4MNAwHUP0uFNIlhME6fvPjbzLpdA+ZYQqtJCmzUm2yoTx8Dpfn66KrHfPoS4iy4ys
         9nRZ+DcqltHVCQxGxnxqwjVDav90o5u6rEjOqq7n9cHRuAqWd95oAd3vpQECy8y4LO6S
         CsEHi5XDn66Kb9LW4A9hjwzkUiBR769ObNUmfUTIGyDzy2Fs43uwhL2yNiDsTdXRLm0a
         EzzaAWUol2U5ObGnbKJIrFSun9TbgAY1aD/yFzFmmbaEtdFHKOgOUtkLeTTXu0fk/gKi
         zQgw==
X-Forwarded-Encrypted: i=1; AFNElJ8xY5sfnm73Km+k3oN+CRuqa/lW5/ugzvClcpE6eVAHyveO31BYtC+ILtuGGht41Cwcu9v36ysEswpB@vger.kernel.org
X-Gm-Message-State: AOJu0YzooFjUxhSHnCJ7fIT0xt0ixhZ8G03Rwm75VVtzUoumZR+NAtnb
	ktA+pVlM93ogAIJVqfXsIJWjwXhOgU7VM53mDDsRVYnOsxTgFv8ealVErrxo1fB/Mlw=
X-Gm-Gg: Acq92OHuY34My7DovOvkSqr41vcyRi0SU2CS31eT0crboCYH8L4xfEPDWAvFy73nQgY
	vwJoMfBLBZTqKpnhwEqjGf8s8gC3QOWNq73XHCJtjajaTY3ug9O75eNaVzE4UbURBQp/gtXdpel
	ZvZbLPL/YTcCWiRpBZvKtbMvTRn8m5o9+HB0zXPANFZhAeLGQVqDWQgmVe6Z916C3qbop7rbpmc
	KJ2Kq3BWAEKocHGvq+z5k4NI72RpH4OqQebVv0y/PBVdcwLYsyfBhtQ+2bhcFZrR3xUOrOjgW4H
	UfVVp0BCFPkdJPV5lnYZ6K8RftbEM/aOVn1BZV9BMaPXO0LxSmu4aqs7ZvCCUbhWLDLB6PlRLvz
	Qybqal6oSgK2Q//Zv/Jd8JWSJ0E2clE+ftoadCnb9+0zns4jqT2ha443kNSHpqiktsQxVApI95s
	s6czTFbhLphCpaj+DjRbtAyZq1tl0F8kxLleCXJhdg8j2sQ8ZZ5Eo8oGuIq3zu
X-Received: by 2002:a17:907:9729:b0:bd0:df77:98bb with SMTP id a640c23a62f3a-bdd22a3c8b4mr232149766b.9.1779456149655;
        Fri, 22 May 2026 06:22:29 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc68e0ad1sm52349366b.60.2026.05.22.06.22.29
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:22:29 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68707d88626so7002512a12.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:22:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/BaWpoUkDmM5hx9kGJlCye4M5PsJDfQqkVTbj7DVXZgSDO+DjA8Hf45UrmHRORqaeZtQs5I/ms6mpK@vger.kernel.org
X-Received: by 2002:a05:6402:11d3:b0:679:223c:d191 with SMTP id
 4fb4d7f45d1cf-6889cc37577mr2016938a12.13.1779456148995; Fri, 22 May 2026
 06:22:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505034325.167797-1-marek.vasut+renesas@mailbox.org> <20260505034325.167797-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260505034325.167797-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 May 2026 15:22:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxyCZTP7xL_LM-Cv9-Sck1xzqZOHZ=N5kDX9hPudG3+A@mail.gmail.com>
X-Gm-Features: AVHnY4K2SM3Go6ojXmLuCDRf56eRUek3q7fWhfqLX5InhJaDiWPYyWgu3SlfzNg
Message-ID: <CAMuHMdUxyCZTP7xL_LM-Cv9-Sck1xzqZOHZ=N5kDX9hPudG3+A@mail.gmail.com>
Subject: Re: [PATCH 06/11] arm64: dts: renesas: v3hsk: Specify ethernet PHY
 reset timings
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 May 2026 at 05:43, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The KSZ9031RNX reference manual [1] DS00002096H page 60 FIGURE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING Note 2 states, that after the
> de-assertion of reset, wait a minimum of 100 us before starting
> programming on the MIIM (MDC/MDIO) interface. Set DT property
> reset-deassert-us to three times that, 300 us, to provide ample
> time between reset deassertion and MDIO access.
>
> The KSZ9031RNX reference manual [1] DS00002096H page 60 TABLE 7-7:
> POWER-UP/POWER-DOWN/RESET TIMING PARAMETERS row tSR Stable supply
> voltages to de-assertion of reset is at minimum 10 ms. Set DT
> property reset-assert-us to 10ms because the KSZ9031RNX RM does
> not explicitly spell out how long the reset has to be asserted,
> but this at least covers the worst case scenario.
>
> [1] https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/KSZ9031MNX-Data-Sheet-DS00002096.pdf
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Modulo the document references:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
