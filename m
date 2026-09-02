Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DB0472790
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 12:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788351040; cv=none; b=lV17vd7NltjSux7SrHSIRsQ3M2YUIFTFKp2jLRaeoI15nvamK5SN7+WJeFEyjhRst+yXwcItvGGWBsrLrF6YT9aQ4XpVGQHW16xdQkWpI0XVY7VCbLBmknAufhdlSF3bWeHYWisIOnmuYTDTD4iIIY7gLIOdWPfTaIYL3PWvn6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788351040; c=relaxed/simple;
	bh=tr31uKUtQ3Z8RhiaqjBbUOGdtk+hYASwtD2Lm3w6q98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evIO75Cby5UT80hGl6WmZX4BMgpskz7gU4VkRxeAkX/bkbdyxJ/kiQ0RhKmuKgMEus02VGloemZlXZApjWYkbK6OvlCKhf/2buVfSr2LqutO1aY5EiPGKR/Uj0Gbq41S9ACDRzuU9KaEvmo75UzteW9F+st943nLj+gn84Pz1ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97cad2f51edso248091241.1
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 05:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788351034; x=1788955834;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bRRLwoLH7HDZ5nE0R4fk8oKFU/q16k7ThQy7FIH11/g=;
        b=PYh2D/oqHpOc/S/c4Y+eU2LEvgj/5fj2jEXVbEVwIp7ZZt7Dv5bv2CYuFwJL4XreuB
         +1QQYM482fO5ZvOI8de6tTEy0uOSUmsoRtEWwbebFjgiw3i7hSC2+c83jSBDV29gXPKd
         JX4Z8hi4TE4lgWHRLwWP7NEKmtb83eHLRrhBi8huzLIy6/pf3LTwb1oAmZ+sj5ONFKWl
         ILupLT2NmjvHGV54UelmRo8Pcji3njxtUvUhg/eq7XA+cqV8hMnRmsSJMabr+w92vN3A
         jDcbo0ozaIqapQ6BI8rbI7KeY2cUEGaJj8cOUzsvsjUBarW4DFQfrDCEhGSIjVW2+4mx
         RIQg==
X-Forwarded-Encrypted: i=1; AKwUvBz8e9sJanGTKFLkjSFiyZUiZuT4LqpdebayeQjZjwTg923NOLBQlukJSOJKxOA/Yo7qS0ZCq3rSey51@vger.kernel.org
X-Gm-Message-State: AFuF++lzGStElHxKM7JA5uiC8sDgVS4Q0bdB4zjehIBR4qMrb9+ODIK7
	faK0hdjklVzjwZyYGEpMzZr7AqllQRUILl+9gFJgG/OMgjjO+hVKQTAOHfoB7Vib
X-Gm-Gg: AYBFou1k9GlgcD/fUS2SKKlNmXqCSSJzhztrAHwU3y9hYJfXKkr364Ox0o03wxc3OE7
	LSK/J0sEvQOvZkSHb1IlCF3vdbr/XI6eYIL9LB4Z7oV1xqEbK//sBXeLpex2eudPMJxzjJcGg1c
	pN+fgCA7EYWHhPUZl/5b/auahLH53AvJ0MyNh/ycs/o7vbt7GdbPMISsrQEQikOWNZ1X+LIk4hO
	wV+SGl//hYCEs0K60elFDHbIi067Uu0jLMIzhbpIbspw1ek6OecVXSS5MIQw3QfcEWPs5YAHgwS
	niBH0yLIKurIrWoHfgf1MYXC7eXTwxwG0g2VtEzA6hz8u9wRXuL4Ymye4pFMLWkcKRRnFJ4aGNT
	S3vW0N3md2f2/EmRdOltlIKpT/dO/K/Ho5A/ZTPJvFKy8HKOPBX+rqZiD09dwmaRwMen3xi9dFv
	S/7/85kenCDM8rY1fdzI8Say8fFxSwmgn3O10lqO9Yex60mfEjoy6lbnQAPk2vkPr4+YWDFIMmk
	PenIN5iu5azCY0/rGVCxUX4yg==
X-Received: by 2002:a05:6102:fa0:b0:785:d308:cc0a with SMTP id ada2fe7eead31-78a1f3220a3mr1394998137.9.1788351034241;
        Wed, 02 Sep 2026 05:10:34 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a25c2e1sm1865541137.6.2026.09.02.05.10.33
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 05:10:33 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-745497ac8fcso324633137.0
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 05:10:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwPhp5fFcdCwpfaUN+iqdOGH+bUx87O0du8KDEhHj+96S5WTDgcxwHB4b7Y++GmknCPTX9pUGu6V91i@vger.kernel.org
X-Received: by 2002:a05:6102:a4b:b0:778:9033:e337 with SMTP id
 ada2fe7eead31-78a1f285d17mr1164872137.7.1788351033274; Wed, 02 Sep 2026
 05:10:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817103255.49565-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260817103255.49565-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 14:10:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXHhJHCph23S5LXUKWrhbVYvFr7K-z4nwqSz-9UmU1iGA@mail.gmail.com>
X-Gm-Features: AcwNN1XEL97nkjOEL6Wuq63EyKHR6MsJn3DWoZDk6yLd5TZrGhV4MMk1_1ayGho
Message-ID: <CAMuHMdXHhJHCph23S5LXUKWrhbVYvFr7K-z4nwqSz-9UmU1iGA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-eb: enable GPIOs
 on CN12
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 12:33, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> CN12 offers some GPIOs independently of switch settings. Add the nodes.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v2:
> * dropped patch 1 because Geert already queued it
> * renamed pin node to 'cn12'
> * rely on default pin-bias and drive-strength

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
