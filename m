Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD72F39D7
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 13:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774533277; cv=none; b=QppYOGhH4fTiI+plYheAqGmrk+FpgcTKOGAQKrEWRzSpoN862bGqZ7ZMG9wmOQPpGwfiaf5Dryh+a6Oxp1nYXA3IYtF5mpaXnbb96QpUW6k2cgTnM5BROtZDEdk6S3m5QA0m/718AwLHd+m7NSe/PU9xjTGWpf3Hn1AE3WXJRbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774533277; c=relaxed/simple;
	bh=n+IoVKZyXzfwVRP79foIQWI7Ic4EcTRiVVFSaOF4VAM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dx4bedBePNgDuCNBFuhvfv20dwx+iQNuUcaI5bLZtQMzI9dHRMMzT46kocBXL01OB+M9hIxuLucJH/90m30px4HnZt2cRrTyuxJ2KWAfHPCbSqzYzdAWqgBh/2OVCj7r+U7GEzfE8WL2Ik/7Fp1duGuz9BXtJs//G7R+cwFMqJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5fff18d44fbso628628137.1
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774533275; x=1775138075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxKOWB+sopeCZdrnaDe1kIehHG9U+NV49ggY424fFLY=;
        b=c+lsSNdVQBI/tztsK21+BfWzxW7IW/9n8r2BJFSgfX8MlR5i5ELxKpS1BJldo1X9fB
         Xcw9hOivAzomi8dgMs03J70qQakO3we5Y9qKYFiDZPMGOSIuwBIetd3hlQ2uOXZtqPWo
         jq93qyzO3+HmcMdvZCeFhpuD3WsGPr2UsT56qOucIYHtuz3inwZ3UAkCkqsYh5UcApyb
         mpbTXjK+lVWFVFyHDMrvnE17qK+mBowbMl6O+H8lZ0sFCkwVL7pFSU7CYw/9goE7iXlF
         1K9orzvNR4z6rbeb9rrBrMvl/xwPbcbpYjYVrlJjDCAgMXT2EqUOtiMMYSTbVMv83Yo/
         W49A==
X-Forwarded-Encrypted: i=1; AJvYcCW4kGkp1qH3gzg30ZPCfn4xWYAf2XhF2rVPiF3d1bILbB8einnD9Ct6bk+cHc7rN53KWelHpME801YR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5hdH6Dfh9WAzqvDIXEfgRTBvJvfqfpOKmc/hpNezNN/JZY677
	rvjvTmAxqf96/yPfmalwxNmN642VRfSk1azJSGHYDq6RuLfjpE4vXGZ7Hb9CGt2wAuM=
X-Gm-Gg: ATEYQzycbDaw5yASCkZvwG7raHgawOx4fEvmvHPOZ81FOlS2qmb6wP51I6HeSSrJ4kR
	0C5c/IZK3DpnPnxw6VPnbIMwA4X0jG/vrlWK1TH08JM0p1Jbp0gxYch1huq2iZXsyHixRNbaF18
	4TUWCrW6NktGVOqIDBjizw0ktwrCXAaGO2GWFbxkZWGddk31UWmWxIVYAsXJ8flqg3kiVniGhkm
	M/+G48fui5sgUqMB4w8rNUG9uxhssiEsYhxK1RcVQVE0+izMmTOEKCv6L1rKr9DZP0cdFyoHYOG
	of+dtNxJzqojzIe1QM3Kl7aO3wLM6U746kdpoHOyVE0Ela4O6nffqynZ3INYJyRmsxMSI6Z8SWO
	t9LpGtCkdYAQGImjQkVZzHvuYVf8wXl5e/dwAB0C9stv/gtjvX+J/ldHEux/mSMnqx5PVcoK9WD
	9QQsEgt/2GEjUXb+yOr/LVT+YPHYaUWieF7SW5SpobaTYB+J2Vp6OUpU2Oyp6Y
X-Received: by 2002:a05:6102:5e8c:b0:600:a2:1397 with SMTP id ada2fe7eead31-603872992a1mr3640373137.25.1774533274947;
        Thu, 26 Mar 2026 06:54:34 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-951be56ea40sm3450974241.8.2026.03.26.06.54.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:54:33 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-94dd7178d63so588950241.3
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 06:54:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXjyMyYwHEAmrIOahdyMyLlNH6d57/SSyyczqAh8PkY+r16UqW3Z5O+MhuWwHtXhLxHCB4BgqBjvuDJ@vger.kernel.org
X-Received: by 2002:a05:6102:9d8:b0:5e5:6eee:8adb with SMTP id
 ada2fe7eead31-60378fe5955mr3525533137.4.1774533273108; Thu, 26 Mar 2026
 06:54:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324114329.268249-1-biju.das.jz@bp.renesas.com> <20260324114329.268249-10-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260324114329.268249-10-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 14:54:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUcabM+GJDW==1gJhp7VixhfGcbKmnCk=Xb2nHYeVjFLg@mail.gmail.com>
X-Gm-Features: AQROBzAXSwCW94iRNngRUI5RBxA6slGDmJTH1iirhWeLXC8HmqPrXGLH1JhFPis
Message-ID: <CAMuHMdUcabM+GJDW==1gJhp7VixhfGcbKmnCk=Xb2nHYeVjFLg@mail.gmail.com>
Subject: Re: [PATCH v8 09/11] arm64: dts: renesas: Add initial support for
 RZ/G3L SMARC SoM
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Mar 2026 at 12:43, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add initial support for the RZ/G3L SMARC SoM with 2GB memory and
> extal clk.
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks, will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
