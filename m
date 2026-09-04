Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6696A33F589
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 14:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533276; cv=none; b=bQTItOJSgTMori8XYI0UsGQCn9Wnx9HpKNFIJ6UQ+ytEvFzwf79IGdCTs7JnUhkeVtQvp0LBL0bx8ndzpPSUK+iv88ZsPMju4GjRX02dVgDplUTobgcvgnaqg7gDkCixWWKcZk0NM10VEBqaP23U+b0c248C5yL4CeedWrnsgRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533276; c=relaxed/simple;
	bh=TcGIo92RiATa8vkGJVdjHgxt9WlzbewL1KtAW6cGFCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyRW62vFQqJpKY6LOVtfkPLH5jNof4K5vxO3VxCgAinmt1ZYfEehaUkkGQEqKGS+qIAMZcd0VmopB1RicwJ2EvuG0wUsVzfuDjcBweTsxAtRco9+lDT69D70x5gIvPRsk+vnUQ5epWsaAQIpZOypI/M5wufEoDsev3xmZQwNLgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7f4e596e393so1272332a34.1
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 07:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533273; x=1789138073;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iy22q1YzKGiQPGN9B1bpmbrGTjC/sYmYXe5uXN4aXJo=;
        b=O26Nq+dS55uanFxCBCgP/v/6jCEmHT+HZeCb4Z5O51KG/2IZq7N0aRWUB+RhSjLceV
         i+zqZUv7TfoVz58u5Z/v6Xi0gu5mTBHwfq43H+AdaoAIOwVAElQA3gqiN/acRSygVjM4
         4QeI5/+sKT2BGepDAtOEUCo4muYfluVHg7YM5op2pqaSAhcSP44uBxp/w1pI4/S93ErS
         wAaljeW/eQXMF+zYU7JGkT1pmkf24rB3X1OThtoh0QvmlQxd1lNZ0bZgNKn658fb2FhO
         0RGHr0aKOHUHBgGA3vZyTQm3warfi525tPssFMCjqZJWOCTLmUTKjYpIyI0/n1zE0D20
         oP6g==
X-Forwarded-Encrypted: i=1; AKwUvBxDTspZOBAFTHhrMlQMl4cDTryDyse3QzuJoNDP96/6sCyX0qc4pdXXU+wLoQH9RyJXc+IGi/nN8PMW@vger.kernel.org
X-Gm-Message-State: AFuF++litCaH+Xy0d7UkvWPNeNoEWcCB7uyMxbeiZvNbmMCaxlBAALrD
	HudEhU0MtPJvaOboKEOGNNKx1nQ5Ad/6SH35PwzQF4I9f/LEUz/i0WMfKdAy/r8r
X-Gm-Gg: AYBFou3vkSkytxFQxTWPwWzhqYPs4e41qPebW+0kATh4JQ812/cxplRSm3SVfogBMhb
	C/miuAUCNTaW7IPP8j+oca2fue2mdKPB8Upotqq+hn4LHEjPiXFaacIwLatotnl8cxWiIGjXcdc
	T/Q1BUGwsKWquukOvpI4fUq+o54PfeIQTSh8cITI3ypYKvpJJRGOHgccAA0JALs7jNXh6kc6Wrf
	DEaJKbUAKjaB3v45ngLEWc2m/WJRJ8LQ5waE57gAKubEKu/rZuzrvZ/2evKmqZR91hIUCbXFdZB
	XFz60jsic+1YsDvRIz8aRJHPMdlt6uhnr0OiF9VYelcvTApQAu2VSqhhY2YvhLwhOg8t18QhhQT
	B4CZuhzQQtacyjY3EYAAG7HjErFFSSAnJ+2PRak4yww7OomS6TlL33h8ZGrXb5ZkdRd8IygaOh7
	wO4FKnlCeEB1F/XvOYhFwFvEx4FEYOSEQykYotYgDLQeNmZTJ9ppYoBgI6F6lOYswsVsv1joNIm
	3s4z1bDjNH4wU8oQW7fvSsKVQ==
X-Received: by 2002:a05:6830:3893:b0:7fa:ac4f:79f with SMTP id 46e09a7af769-7faac4f0e17mr2623405a34.27.1788533272847;
        Fri, 04 Sep 2026 07:47:52 -0700 (PDT)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com. [209.85.160.51])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6794e22sm2875290a34.7.2026.09.04.07.47.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:47:52 -0700 (PDT)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-4563ac048f4so1085769fac.0
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 07:47:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxKweCdr3HFcxLS8FNscpTSWvBwmpqY+mtLIgv1P4kcbEjt7E6eYODnVTFqt6aeZ35n1j4QI8aYDc19@vger.kernel.org
X-Received: by 2002:a05:6102:2d04:b0:785:eb33:87a8 with SMTP id
 ada2fe7eead31-78a4a883885mr1900429137.4.1788532960799; Fri, 04 Sep 2026
 07:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <2cf42d7ef9b452efbab3007ec2c2340cf87adbbf.1788338320.git.geert+renesas@glider.be>
 <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
In-Reply-To: <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 16:42:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
X-Gm-Features: AcwNN1WAkp69Or55f6uh4v6WhdtMEG7Qz9QclhM1mQOZ0FBl4cYNnC9KwnYi2zM
Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r8a78000-cpg: Add
 renesas,scmi-firmware property
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

On Fri, 4 Sept 2026 at 16:03, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:17PM +0200, Geert Uytterhoeven wrote:
> > On systems using the ARM System Control and Management Interface (SCMI),
> > the Clock Pulse Generator hardware registers must not be accessed
> > directly.  Instead, the SCMI message protocol must be used for inquiry,
> > configuration, and control of clocks.
>
> Why is this node needed in the devicetree at all or why is it not disabled
> so that any driver in the OSPM is not probed at all.

The node is needed so the corresponding driver can bind against it.
The driver takes care of remapping DT hardware descriptions to the
abstractions offered by the SCMI firmware when SCMI must be used.

> > Add a "renesas,scmi-firmware" property to distinguish between systems
> > with and without SCMI, and to indicate which SCMI firmware interface
> > provider to communicate with.
> >
>
> I still don't see the need for this if you disable the node, so still

The node is not disabled.

> NACK. Sorry if I have missed some discussions, please present the information
> as part of this patch in the commit log if not the actual binding itself.

That's why we have cover letter, with links to previous versions and
discussions.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
