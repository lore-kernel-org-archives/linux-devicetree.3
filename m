Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B333FFAB0
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 12:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785758984; cv=none; b=fVhw0nNmAjMj1Zkc9/nMELtNYXLaavlTnea7ZNFelb7huNkGJOHEv83vwHpP4/40mvopgpAutEsLjQuWbo9BYT9O2mEXdJBAd+D0+0Pdz6DdKdt8O7O1e/k1EEgoe2egCTpqmYRLB1FrqARsvLhEZZfv2rxx0yj+EqLlO9ohpVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785758984; c=relaxed/simple;
	bh=okWIOwpaAfBMcyH50oSVfKzplqlhnVTdVosRYGHHdGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/ACv05uhDfkOj+5X/gG3ZP1Hndix3mz83uWU8VLu9cCEjThiqiIUNlQfWC6EeLC83hscCxx9WY5Od3eyPknZOLsjYE07k+sepq39Ibuaa6SQR7I91TAr6WauHgtA9blkGxfplC7xgKNkK/6n86K6LL8faMCUW/1IAy66AHZyd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7eb64371a2aso1832026a34.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785758981; x=1786363781;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/3F2htAaSgkkxvZ/5MPPccMC2gln25kjMNeYIdiRBb0=;
        b=RxzyGar/951aUisMtfCEqZUgtTjg1rwbjw1gYfv31Qpv4HZXf5XQwdMpH3kNFpSeEk
         d950cd9rKHTej7Rsd2ZBhw30bvNd/+Ma1ca383+GORTUDIQ2m+jxMNl/+Seo/BFOzsjd
         tkjBoqZsgNg1sdQjjxwEYV7Q5Cr5ZtgQZFHHk4vl/BrTWi1CMiS2vR6wFkvRbJGb8Do7
         pZ1r0VnPJepXxWCOPXjDDU+7zlExbpn2Q7qkoKIIJQHl+4BaoWMMdJWGgtg/Ip7NOxLh
         p3aaU31y5YU3AwIRqoawG4vCHp5Bl5nv2/3J5UqOyxcm2ewQjHkQA6zLHVijZkc1V2PQ
         5whg==
X-Forwarded-Encrypted: i=1; AHgh+Rrs5JRQK3eB/eBNuJgICLmAP20xIWX4zykaPZbv6h9DGjlc0f7IcIMcRszYJR3FFaPgPUNh6LJOAFnq@vger.kernel.org
X-Gm-Message-State: AOJu0YzErP9qpaSAQ9xizV9RwcxPT0A2hNUP90gZDYmMUI5iZUnADe52
	RkP+ofH6Gty9tjHzTmlj1YUBAWk/Z/d1DdhRsw8OH0Jrd2PoO6Wb8GePq21K+R4Y
X-Gm-Gg: AR+sD12qK8vaCGbYQ404XW4lviHGs/Kwn1WG0odzl4rkNGvLLlqzpwkPEKKrtb5hzYR
	FHtppR83copXRqmeIlKXOjQ8xn3HydHFF6FXKTA7Zg3N5jbY0DrIV0wHJXHttDoQS5lbdQrSkfi
	+Z9FHgIgRxSDpuYsyT+BNVzXYaxMWXFCyWHur4/ISFbaT8pdqgLJRj0Re6qKZc70mDhhoodqrzO
	VqynrstYX8QeTuNzpaqeJpDGae2EqjlmqvkvR1TvMIsrrc+ytZXrlBn8IYhAAuA4ZS5szT+r2se
	6unCc9NS82Y2qo7UPY+akeIcGEzZitRC90dqvBf8HYASM5tqvomUoky/vtPZ7UyzarIwHCfrU++
	PCk3eeLxoI9cVsAdQrHIWg3nX+Dhae4uSYsiKTw+VG7cSfMXBpxT1tvHmQ8RCpiSSoLYgTst/Ge
	bFCruvt1V4iDxx6ILpUJZynDmtMjVeKLRvLwpOrnfaRSVz6o48bMwR/aux3INw6wVSeXE+dt8bf
	pP3hs2Ymm1k1SHmrd9dh1qXQQ==
X-Received: by 2002:a05:6830:6d17:b0:7eb:d848:c856 with SMTP id 46e09a7af769-7f196bb81e2mr15640483a34.4.1785758981197;
        Mon, 03 Aug 2026 05:09:41 -0700 (PDT)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com. [209.85.161.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f18f0da967sm7972611a34.23.2026.08.03.05.09.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 05:09:41 -0700 (PDT)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6ae409c13d5so1356913eaf.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 05:09:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqp40HWtpwUFIMSgO1joSWSKj6uDDvg/i7XnPUZLwInTE9ulNZJQGzB36FGAUGLTeBf6mntRpwn4Ju8@vger.kernel.org
X-Received: by 2002:a05:6122:c94:b0:5a0:370:f12c with SMTP id
 71dfb90a1353d-5c3877ee9a2mr2551587e0c.11.1785758489767; Mon, 03 Aug 2026
 05:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll> <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
 <20260716214924.GA1477674-robh@kernel.org>
In-Reply-To: <20260716214924.GA1477674-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 3 Aug 2026 14:01:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
X-Gm-Features: AUfX_mxcGqdlDliYxmfdCYiKuiCZlBR4i5y6ZczTyLGv0wHHqfKRM8R7C8jMMeU
Message-ID: <CAMuHMdU0ss6wUEdjC+OYa3iQS439aJ8b_d9M2ws7Ayn4_kOyMQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 16 Jul 2026 at 23:49, Rob Herring <robh@kernel.org> wrote:
> On Fri, Jul 10, 2026 at 01:02:39PM +0200, Geert Uytterhoeven wrote:
> > On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > > > Add a firmware property, for systems where SCMI must be used instead of
> > > > direct hardware access.
> > > >
> > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > ---
> > > > v2:
> > > >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> > > >     Pulse Generator".
> > > > ---
> > > >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> > > >  1 file changed, 7 insertions(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > > > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > > > @@ -35,6 +35,12 @@ properties:
> > > >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> > > >      const: 1
> > > >
> > > > +  firmware:
> > >
> > > RPi is doing similar, but I have doubts. It looks way too close to
> > > generic "syscon" which is disallowed.
> > >
> > > I think this should be vendor+purpose specific, e.g.:
> > > "renesas,scmi-transport" or "renesas,scmi-firmware"
>
> If you can tell me the resource that a 'firmware' provider provides then
> it is fine, but you can't.

It provides a firmware API, which is not available until the firmware
provider is initialized.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
