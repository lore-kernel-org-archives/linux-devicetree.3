Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116A3371053
	for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782079935; cv=none; b=U2/e6dtxDQOdC9r9zno2SAEXxOyQoSTfvzc6yEmao12aHAmwFPZs95XPD8n6NnW/sE63WsNYOxttoJhLUCcv3WNvpMx+4TGYv82DYkqbUX/OsPQGBZYaMY/Yydn6KNfi6zCeDkm+e/2Ogy9duadV3blNdJsWuFsnHhbrbsoaMos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782079935; c=relaxed/simple;
	bh=pRqEZo/jVAgqejstxN/UwBgCjSpApW9UxkJ0EoPl6Yw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YKQICAhdFXEUJ9pt/i114w3F9HDN20W8xMk4hPQ4LCmx5Biss3N38cnHo5r3V9wyC6VLOIDpaJPguTjEOjSlWd43wAbhpWXOOPlxjmQI2xbMfwrjghqZrT1yZDN3AyUIn0JjigkUqbzZCT8jQgu2yaw6TSfjBx2MTZlpKEJqxaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dEmhp7Im; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dEmhp7Im"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-6c28cd29891so2143185137.1
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 15:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782079933; x=1782684733; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRqEZo/jVAgqejstxN/UwBgCjSpApW9UxkJ0EoPl6Yw=;
        b=dEmhp7ImfilT45/1oXAZwYfSkTI+GaWxZALp7yyCWysiAyHHvmKglfHYHRAitexYDD
         TshbhZ+V3IY36te28QSh//myB0lE3jZ7zaIfVj4816n5G7b2o4kRJqBCf/ZIVjp5BuUr
         oY+rrNixeXeSzZUCLzvRXEKxET9LCkk/bW/f8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782079933; x=1782684733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pRqEZo/jVAgqejstxN/UwBgCjSpApW9UxkJ0EoPl6Yw=;
        b=SUQx9wJOFE+0QeNW6SUf0qwesK7r1joCFu0InB3bELsHiUKLcqhgtwbXqfLsVjGqyn
         ieeCGNjEcOBIGduqZQJh2w/Rr1BszNNjvcg8qImdktQMb+cPz28JVpWLKT23pAl7RIzN
         HefQLr4Gj+EOyNvOpDKoPVXDNioNkP+tFkeHE/uHz4CLOvMACmPuAxHZGQplKtDwfHwq
         6fNUX5Olk4Px7tKLx2w8jYjUEeJins3Wecrb8BaN+YxgKsa3UcAXsAkaYd6/3qgPjTjB
         r0+iXyuyL4u4N5jcs8746QwVfsv/wbKovO8Cav2HV7KVy5Gf3r5jEqO8/2DdMyoP6htk
         4jzw==
X-Forwarded-Encrypted: i=1; AFNElJ+lMrcrRgaYU8pdtjspSqkb/cE0rwZnhJ8HDVXtrhDtYszGB+bVGsaJ3QOHhCEm1eVixFjriZsMIXeA@vger.kernel.org
X-Gm-Message-State: AOJu0YyXA2ag9ueVn/QjzvjixjzfuyjG8UoHuipHoWQbDhqVLvu+JUIg
	UBiwrYS2k3d5SrkWjjA3+CeJO0EB3MVjWV3nTNTftzSBA1qUpSRWyWHVMSQnN7h/YbcWtHOLq12
	P8Ao=
X-Gm-Gg: AfdE7clvYMg0kO3Zi0XcjzoxCsghBPVZtx8CIBPgbtM/NgF2Dfd0h6uCyJF3dH4I3vD
	Qx1KaDGLNLxYDrBZJigvslXm+K3+7nfDOm33HcNQpGWpEpNr/ByncVoCsDqdWe7LDXeiL7nTZ3T
	CnYmpVInxAoOhPsedrjbFWmgxc9epBJH3kH+b1/winwOc4jQLi9YxIdp5wM+kRxtMzQrjhnzqX8
	OA3uMdfBj4GWWvL9IyBJ2sF5NRmJ9M0+GZor0aC16y1Dqd3fxpurlDxCM1wlxRW9FaSdStbhWcz
	zvwmbBrlfas+L1q+OEBT9EPSOGolRPeOrLI2B0soEn5qW3Xo8Y5uRrhj8Hj1vfvInB7VbA53z47
	LqSbfaRUzWQ98C+wKlhCZbmtBVNdfnr33HwqZeRT+enp2CzkvPaV341inN3wVf/j6IAycum6Zfc
	fU6Fa01q8U9y3llpSvqqwpIszpuM0/x246bJNC2VZnflHfFBMEPZU=
X-Received: by 2002:a05:6102:5121:b0:631:d586:893e with SMTP id ada2fe7eead31-72a1d205a0fmr6451583137.5.1782079933003;
        Sun, 21 Jun 2026 15:12:13 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba22997ccsm4772231137.3.2026.06.21.15.12.10
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 15:12:11 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-966d70b9e1cso2047131241.2
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 15:12:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/pdfuJu8eCy0Fl9NGoD/FTQIqGHcSOqX6mwWly5GQwsAu7+psW0wb8BximBUOjaNx+MYcLbiGBZx98@vger.kernel.org
X-Received: by 2002:a05:6102:3710:b0:6f0:3999:b378 with SMTP id
 ada2fe7eead31-72a1f0bbe0fmr6441389137.13.1782079929560; Sun, 21 Jun 2026
 15:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <ag_QL5DIo7MxsdYU@baldur> <84ed2c32-16d0-4c29-a06a-9242eeb8e86e@oss.qualcomm.com>
In-Reply-To: <84ed2c32-16d0-4c29-a06a-9242eeb8e86e@oss.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 21 Jun 2026 15:11:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XQH3kng7MV=Jr=HmZQc4TEUCq+V3TsLNChr5vUHUtXAg@mail.gmail.com>
X-Gm-Features: AVVi8CdsJ9dr4hnltaNTYTTF0jzeSz-qJJrPJ-GY5G_cdzHr7Jfp7FT56KvCLXo
Message-ID: <CAD=FV=XQH3kng7MV=Jr=HmZQc4TEUCq+V3TsLNChr5vUHUtXAg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: kodiak: Enable 4-lane DP via QMP
 Combo PHY
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mahadevan P <mahadevan.p@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mahadevan P <mahap@qti.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jun 19, 2026 at 8:34=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/22/26 5:41 AM, Bjorn Andersson wrote:
> > On Wed, Apr 29, 2026 at 12:10:39PM +0530, Mahadevan P wrote:
> >> This series enables full 4-lane DisplayPort operation on SC7280/kodiak
> >> platforms by wiring up the QMP Combo PHY correctly and consolidating
> >> the DP endpoint configuration in the SoC dtsi.
> >>
> >> Patch 1 adds mode-switch to the QMP Combo PHY node in kodiak.dtsi,
> >> which is required for the PHY to respond to USB-C Alternate Mode
> >> negotiation and switch into 4-lane DP configuration.
> >>
> >> Patch 2 moves the data-lanes property from individual board files into
> >> kodiak.dtsi since the PHY-to-controller wiring is fixed in silicon.
> >> It also removes redundant remote-endpoint and orientation-switch
> >> overrides from qcs6490-rb3gen2 and qcs6490-thundercomm-rubikpi3 that
> >> are already covered by the SoC dtsi.
> >>
> >> Patch 3 updates data-lanes from <0 1> to <0 1 2 3> in kodiak.dtsi now
> >> that mode-switch is in place, enabling the full 4-lane DP link.
> >
> > Are you sure that herobrine has 4 lanes routed on the PCB?
>
> +Doug any chance you still have schematics for that old boy?
>
> Bjorn, perhaps we could switch to a model where we define the max
> capabilities (i.e. 4-lane 8.1 GHz link) in the SoC DTs and only limit
> them as necessary? Not meeting these is borderline a board defect anyway

Bleh, I'd forgotten what a pain it was to look at herobrine schematics
with the whole qcard "abstraction".

My memory and a quick glance at schematics makes me say that herobrine
only has 2 lanes of DP. The problem is that this SoC really wasn't
designed with a laptop in mind. I seem to remember there only being
one USB 3 port and it is muxed with two of the DP lanes (since the SoC
is designed to drive a single Type-C port). In order to support all of
the ports that a laptop should have, you pretty much need to feed that
one USB 3 port into a USB hub and hardcode the DP to always use two
lanes.

The two DP lanes then go to a mux where they can be routed either
towards the left Type C port or the right Type C port.

In terms of whether we can support the 8.1 GHz link speed, I remember
much debate during the project, but I don't recall all the details. I
think the discussion was that we were supposed to support the higher
speeds, but we had to disable them because they weren't working. From
my fuzzy memory, it was unclear whether the problem was known to be
hardware or software related. I can try to dig deeper if it's
relevant.

-Doug
