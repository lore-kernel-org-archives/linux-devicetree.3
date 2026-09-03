Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC0D38C2BF
	for <devicetree@vger.kernel.org>; Thu,  3 Sep 2026 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439326; cv=none; b=oJo6Gw5ezFnwFa7MzZv0fiC1Rtdeuk0kTwhZ2u24uoYk1EGrD9CmZJ6MQ6GpSbqNnf9wc9MyXlGm3AIjF+2DQrhBt3RE5qqG3pGz9xtQBxOkOU3GhsJXCUKg0k7wROB+pIPLB+nG/P+sCGUxKI2SrCVrkLXEKe/BjKQ64xzwlLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439326; c=relaxed/simple;
	bh=52IhV1NlD8VpIKm2oG40lSwrnp/KluZG7LbmqWFL7xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J4Fje8joyLVj+dcTsfTx5pEhn/mC0SBFQNppbXlX74k17R+Bg1MwmTa1MKDYdJmupBOuh8P/8HNwkhOygSJHi0ZyXM1p7IqAjDe/U84/qLcHxtSr4hxSVJJsdUwpb9bzB2Y42m29BtXdVotnaMgbJ8qXfo3qPrDfp5N9LgGKITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5c652293bcdso2454699e0c.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 05:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439322; x=1789044122;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4aThBV/MKXRTLxxMP9NP7CiDSYoBXBhVSup6n2UINuQ=;
        b=HUU9i+TG3ebG4dwKwdhNgHTIzYQ6O/pT5DZWjxWhiXwNwDQ7moKlqkb2jzMfxM9w3Q
         up7hy1+i1J0M0WzFkUdU7vbtWP0JTXd1ot4TMoi8NEpS6ppMT3O+trSZpSceyZoWsqZN
         guWnQBruzKb/0PdbcWltuw9DAtsxZCe79NNyP4UQd4Q6FRRnbdEp59YNA4CSYnD/JpY+
         Tyntn3TAzGYyCCrAHbi22AWyzcSkj+uTCjt9yfEA8NGi66locrxywAFpBLqkg0YArsZ6
         11vrJD/o21bAkCFKNjVjv3yOLJ8aSMLfXQvcjKlR4ezNnTCHem/JQlgT0STLGMn7fsnJ
         de6w==
X-Forwarded-Encrypted: i=1; AKwUvBwpalbWS7XDcXUdaMP1hwyjx4UqZClnIbK2c2vuUFo9IFh6piKvxWK4fvOUsc5svZnZW/fYPPIMw4YP@vger.kernel.org
X-Gm-Message-State: AFuF++kOvgFKeP2G20Bc+tGxsKMEj0gGotijGLDaHuj87/mMXNxH7S3g
	xXopNBlOFZLzXJbXQ4efKkfjnb5ezA32bva+Mw5mt46BQq0hX/Hyje8Cow8XvVEp820=
X-Gm-Gg: AYBFou3R2gFfHIj+OC7G7YOXfk5Ta3Hk0DUUAEU1IVnkNDhRO5ZF9RHLe8k05vDhL0g
	qS4qc346hQy1koY4D9yCPdrd8TFRH9JMFdhcpdtFXqxjeZDAOuJqzzOF8XJ82OGL/tbljN5hVof
	H5as/iYMYwsAf8dYpmpiFlfZVjrqoRHwev6HcyfojVRXYzbR5Qa0qGyYzYfCDBM+iSdgMosXUH+
	HrlMVgf0pwHXTNbXXPTyjN/40jf3pgNioa+nRAP8wopgxI8gtPbzIZkx4I0yL6QWgMgnNFVfs1Y
	b78mRliUsEygS//Z4+tIgTI6O9jEOssp5AHLFgcxfMXq7fRA19BSUgGSEAssp5CdSBPCKfqyB0x
	mfT0uoDVp7oOMcds/4tHS/48XwGS+kgF80/IAkT2JJHZMc1RWW92G41Zj+UgGqc1ldjrzwJXjX5
	aDIL8VLh+hhuIFsjXYksES486+8WxjzxOWj1DJAlY5csa0mWnm9aqMercWVYFl2MLbRzScZYK3u
	CMqVnOxtct13XtD/eEO6BOaVdeOZ29ikZ89Og==
X-Received: by 2002:a05:6123:2c5:b0:5c7:a844:48a with SMTP id 71dfb90a1353d-5c7d2801fd4mr5498159e0c.8.1788439322322;
        Thu, 03 Sep 2026 05:42:02 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd94646csm4513118e0c.18.2026.09.03.05.42.01
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:42:01 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-785073ad5ccso1532382137.1
        for <devicetree@vger.kernel.org>; Thu, 03 Sep 2026 05:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxyxq9C2vEQ7itHYZMXaRJRsq+Nw25P9K+oOPAZIaoLRkV6Xinf7VQbBloWQqUfVDhy7jUSL5wJwSr+@vger.kernel.org
X-Received: by 2002:a05:6102:330c:b0:786:fb19:d5d6 with SMTP id
 ada2fe7eead31-78a1f19f88fmr5114359137.1.1788439321117; Thu, 03 Sep 2026
 05:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com> <20260825095047.9971-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260825095047.9971-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 14:41:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+ejFSGv-gTfvgk8ZSxX+QWns_kyteYr-KQkLnio8PJA@mail.gmail.com>
X-Gm-Features: AcwNN1Uzwrt2F_57qLud1MQRI-EP0blNweC_SW2rpdknAoyXWxcnxu0jErknhrc
Message-ID: <CAMuHMdW+ejFSGv-gTfvgk8ZSxX+QWns_kyteYr-KQkLnio8PJA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document
 RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 25 Aug 2026 at 11:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> controller to include support for the RZ/G3L (renesas,r9a08g046-pcie)
> PCIe controller. The RZ/G3L PCIe controller is similar to RZ/G3S but has
> some key differences:
>      - Has 3 clocks compared to 2 on other SoCs.
>      - Has a different set of reset signals
>
> Add device tree bindings for renesas,r9a08g046-pcie compatible IPs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml

> @@ -87,14 +88,18 @@ properties:
>    interrupt-controller: true
>
>    clocks:
> +    minItems: 2
>      items:
>        - description: System clock
>        - description: PM control clock or clock for L1 substate handling
> +      - description: PM control clock or clock for L1 substate handling

As pointed out by Krzysztof, the "or ..." part should be dropped...

>
>    clock-names:
> +    minItems: 2
>      items:
>        - const: aclk
>        - enum: [pm, pmu]
> +      - enum: [pm, pmu]

... this can only be "pmu".

>
>    resets:
>      minItems: 1

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
