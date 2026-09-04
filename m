Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6882DB7BB
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 13:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527156; cv=none; b=ozOrzv6vx9K6RP6EbET/bahMhedS0IlBG/4OUgEtKX//29biv1eCJyKURL8GEY/vVMgyXQBcLIWLbL+ZWn79+nU1jP2mCk0z5Yl3lenEDJHGXdWowwfxGdy8Sw0S3hVyenPc1JzgFo+cubixodgjvwlbeNssJoYNKSPOxJqN+k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527156; c=relaxed/simple;
	bh=/ypz6zJjPNKfNpTn4drsgfOEfmGR4cl9pbI1Kxi8oLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u9JQKAWQ0zzht2CIlnUyS/qXFVaztYb/vVGEfh1gqbhg+Duck/3/+lobIyQxcjscBZ5+9lpVrA8Kd1gja6HRNAYU9QQzJplKUIaWDuaCmj8NhqYFWVPmpRrBC1g3p0F4KF7Gd6FDs3N31XBXTU9PA/CKYdNWTvWfCAnJIYTVqaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c7d4c663e9so805827e0c.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527154; x=1789131954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8NOF30mvWowB029u1n+aELPP6OhCTftCoi3R2I9gbMk=;
        b=MRhutvMnBKrZuCYUexBaj9/Z026YTQNida+/lfb3FbVWGXETbtysN5GhMSgSWHu0x2
         9gj2Q+EROOqhEfqaIMBBATHakMs1AXsWgrkULEHWQ+vT+8cMaAN7vR4lHA2BGy6MNsqM
         RNClr3wJO6cqXXTUaN/ptCviOpyHvRPHmPL+UsAqjDZv3d8mXHZ2UWecC+Ox4ah6OsgQ
         IryPPwirXcHCXrJWodNaTfZkB1dQlMxHSSHEaOs33cJdGFFGrAsVA4ardyzb9sy2rdw9
         QjqYw07vvyIL8j8LLVg+8St2GDhhWIue9t1LVNekdCWp/u+/CeiOuaoyIXKj9OJ9TeBi
         YLPA==
X-Forwarded-Encrypted: i=1; AKwUvByiglJpOkbdMfEOy0xdl3gbBvWxXj9qvEUWGg21gAmOaWMzXnKoTJ54LHeBeliQJkEfz0FwAi+ssJJp@vger.kernel.org
X-Gm-Message-State: AFuF++ndfcJy8rljmys5FQ2Gk812guIw2t8JhxgRKjWGL4s+TaoToVEl
	GVCnGIAtVuGUQ89jA2Nt4+PSronwv8Mr7ujh3dQpNiBCOFpadb8ukxwuNm9p9Tv1alM=
X-Gm-Gg: AYBFou1HCpQoKoEj0/m4QGuHQMnsncu93Avf6So38G/8K0n2KMRa7JSxg2iBc4cQkUy
	lvaXx7dRE/lHzr9IHsCorUMaR9jodeBzDyrNeYdtygxP9MhIziWW9ergrPVJ+KGSuPXscvsbPwA
	NmLxvtTBinnV6ngYpqjRC7Khm3PK4p6D8zfCPNLrHngNt4u6o9MDDddlkCDnpDDhJPbm1hyPmfe
	n7boLOdGhKIip9R8ePJNxfuFESKOgsV8zF48ebVsEo7h1px3aKBwRP1lh3lh84hdYpYaD1jUq2T
	/he3s0fIj8J65Lkz8AZyk7D/E3E/5qHxf7PBaTXWKbXwbeo2D5LuQpB6BsDy/z2TEtzl1eN3j8n
	FscvHTI5Z2hG6kbEJ2n9iBt9B8KdvH0BxKnmvR4yUW7RPH72ofEA6GDd0y0p129hztqOQ8sIUJ5
	BDkPUZii9vbug56wSTjbbhUaEbgz4xJQV9o8vRRhukFSlwzWiGYdIG/ODZpUz48KqRKeo1VatXm
	NCbure3jeO+Ivzh5T0nv/f25Q==
X-Received: by 2002:a05:6122:2213:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c7ed50c3demr2885895e0c.1.1788527153729;
        Fri, 04 Sep 2026 06:05:53 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1f14asm1463773241.3.2026.09.04.06.05.52
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:05:52 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-783d429d0cfso737422137.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 06:05:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByejSBxlUnu+kSdN+NL3W8XpMSbsES1SE7H6E7Gh9ARQJq8wv/kQt+C2EE2CF9e4VRsmC2HWkeMIlZT@vger.kernel.org
X-Received: by 2002:a05:6102:290a:b0:785:f288:c23 with SMTP id
 ada2fe7eead31-78a4a918bdfmr1975845137.3.1788527151892; Fri, 04 Sep 2026
 06:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-6-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-6-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:05:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2NavSY5K3Em4jTKuiWCZCc+XOWW4nH4HHh76aoiuWEA@mail.gmail.com>
X-Gm-Features: AcwNN1VET22qEnErTI_Nd7aROS6yUTveXM7jVaLpauOVguTdNaHuyqM0FX-8ExU
Message-ID: <CAMuHMdV2NavSY5K3Em4jTKuiWCZCc+XOWW4nH4HHh76aoiuWEA@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S I3C pins can be powered at either 1.8V or 1.2V. The
> pin controller provides a register to select between these two options.
> Update the Renesas RZ/G2L pin controller driver to allow selecting the
> I3C power source on RZ/G3S SoC.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
