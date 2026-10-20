Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792480479;
	b=Yep2EkUC22cbC6CgHYklQPuYoW8PC4ooNHbg3H0RaUqmLkwuAD043ppK8C0jtyRhlQ/C
	 lT7VCPedmsoRtj4ipLty81vQa1e8cpjkg5whDEpqd0KwnOaBMAazdq0Kjq8EpWxc5NRzN
	 p7R5uNnmAFTNdnHbYpDFofKviB+WtIvtRET6RrDJ+KMIRXjouglCRdDOEzRHoGK0+H79L
	 ZunESIjMyD0LaAdK3BzeYBkvtg50TtpMnA+hYBfL9Fpzgij3GsAjDderPNyfBmM0FUGVR
	 HSxS4oxGRJPIcmmInlzG/cP/cgZ5QGCvZzudNq/zfwu490bazCN6Ne9OXEMArVx60Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792480479;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PPF5Lg+md+ScchRlISc/5Y7zr+t9DzuuY8wGaLIwWl4=;
	b=vaIVywrxbMZK1VhPRtI9HxaHlB8/pFaKrxLCDgVzDKxnxWGa6OAr/qiCI0Nh6Ew/p4ow
	 xRCgOMpo2ImwqOMo/Zg+YPI3bqk0Y5244ZKMxYcW0cTOFwOa2btCA4ZcFyDKB19dqLg5n
	 p8jmcQhxtYM9HwnoaQ9ACi08lRnSM+Ldx3h/o2Ol4HPNx9mQP4AXNMzpiyJDy8caT7Nsm
	 g7wLsTaaR5nL3bn1y+pnhs10/zzPo3fMC9h0TNIcTbybTXyUFXP+GejyOToLUZ5Ak3uRu
	 Up/ntry/ZnsiYFRKz54lVi97Illwdqvku2N/AXqFaJjOVwqwszq3D6l2YFlSstMMJQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B003606A319
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 07:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B003606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-9178510f3bdso33993726d6.2
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792480478; x=1793085278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PPF5Lg+md+ScchRlISc/5Y7zr+t9DzuuY8wGaLIwWl4=;
        b=L7lKIb68I78+iYoCcFdLAIyuG636xWh5s6+fk9ZDjZSNHausFEH/pdFw0OEKlZ9cEb
         ybGZoVpJlsqMGeCBy4kD7d+cFG96h/4ruP5qm9sqoc2tp0+oFgQwzAdPKIqae8yTnEuN
         hbWjg6L7J/vWu1C5fOpyKMlxD2bfXXzLlULp3CbYqKKOn2/eWD7MLr5gNDPUwUy1cxH/
         3Zz6zEPkz5qYJ4zqC0Cby7aKtdXrwtYryWSZqwTOTjHpriS/9B4sVVzZWyWg3ZDDbuR2
         Mh8uL3+ma5OscwWN1CzrkxXqRMHwTaOKD7l4b98bk5JdeCOBaWs4KaFO6Jaz3uUSn+pc
         16Eg==
X-Forwarded-Encrypted: i=1; AKwUvByybnrkwr13R9xaiJiJTvDdNBq8WbFeXRu2PP7R032QbFn2rZdivahrGExxukamuPcBzeDNDCvxFhH5@vger.kernel.org
X-Gm-Message-State: AFq9FYK5B+soqqUy+NB/XA1LIT/aYWk5Brba4v2ViC1Nu0rUR2ENuf6+
	J4C9P9cqHU4dCU/3mQeSAh60cs/yhsB3GJ0fUk9e0uwI8QPOoFadcbhRQ8Uu1DNNsgM=
X-Gm-Gg: AYBFou2Sq1II12dOPabJw9AZ8sqz7N9krt/pjRRv52uZWTG/B1aUkKeJud0SaF5gCJH
	t8a+SEhclUMaGvOi7GQ65+ZFNgyS1i+NQqC44szCH7nqhgzK7iDS3fzzPJaGYcebpbfqw8zw8rd
	CKz4t+MQXR/eW0fvKf2W/O3KpZG2MBcESmbmvk8DrmxYVkgKfQgHIFwRmrce8uk04eSsRO+YN4U
	CnlgSw/K2lel0qp+sR+meyboOWzejgyu8eW0of+U7K6DuTnmHgjkJhgm88PV+vHV0N1DxxQWwBU
	xMK30sSu0SvSjsyeU7eVC+HKIyxAaJHyCcKHt/m+azUoTaykrKIV19+WfjY4kVk99nkwGgkKUdI
	vAs7ndzKMcf7oFF7nThQ3caWw3CuWse/bS/ztLNdGfyU9UNuzcGYc68gnGu8pgZ7CUER+nLS6nk
	Yqky9GyGntvDV3wyt/bbAbyYP9D53uGHDyHxf+A4C8ZCJQt1wAKJ1POCglkqDP7fS2FM9VpCvvG
	qNOTrLpKXsFHLcq67twdwsPAPs6rWsYaXJUuzF+
X-Received: by 2002:a05:6214:2389:b0:917:9f37:fefe with SMTP id 6a1803df08f44-91bdf01c33emr164307826d6.10.1792480477994;
        Tue, 20 Oct 2026 00:14:37 -0700 (PDT)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com. [209.85.160.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c03da5b4asm19572676d6.0.2026.10.20.00.14.37
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:14:37 -0700 (PDT)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5365f9a04c5so26857581cf.1
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 00:14:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwloDpGfNPE5/PZ9sgIiFZnZLAicZTcPFIXC80q6mtypmeIJzQZKrsb7knSJDVd4s41IwzSbCKu4IXz@vger.kernel.org
X-Received: by 2002:a05:6102:3753:b0:7cc:1ace:fd0b with SMTP id
 ada2fe7eead31-7cc368f6decmr2272570137.8.1792480154006; Tue, 20 Oct 2026
 00:09:14 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792163045.git.geert+renesas@glider.be> <4524363679c1f2163aca3b3dda2bfbde170d095a.1792163045.git.geert+renesas@glider.be>
 <20261019160545.GC3705@killaraus.ideasonboard.com> <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
In-Reply-To: <CAMuHMdUTz3BR48_Y8_UR9PEjLuavHtN-4uaEKURtqRXFBO0uUA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 09:09:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWqgRL+rzQ7xEzn88Guy+KLUHmHyMwAdhfHhC8Xopc7uQ@mail.gmail.com>
X-Gm-Features: AclHuK-xW82aBw8g83Y0vnua8_TBb23MC_WawHBUIyGh3Twhft0MuZERm0ITiqw
Message-ID: <CAMuHMdWqgRL+rzQ7xEzn88Guy+KLUHmHyMwAdhfHhC8Xopc7uQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/8] pmdomain: Make genpd_get_from_provider() return -EPROBE_DEFER
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 19 Oct 2026 at 18:32, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, 19 Oct 2026 at 18:05, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Fri, Oct 16, 2026 at 05:55:44PM +0200, Geert Uytterhoeven wrote:
> > > Unlike provider-based look-up functions in other subsystems[1],
> > > genpd_get_from_provider() returns -ENOENT instead of -EPROBE_DEFER when
> > > the provider is not found, thus not supporting probe deferral.
> > > Currently this is worked around in of_genpd_add_subdomain() by remapping
> > > -ENOENT[2].
> >
> > But not in the other functions calling genpd_get_from_provider() and
> > propagating the error up. Have you validated that no existing call
> > stacks will break ?

Sorry for failing to provide the answer I intended to provide:
IMO all of the callsites should be fine.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
