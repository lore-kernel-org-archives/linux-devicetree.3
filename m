Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2D43DDB04
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 13:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367452; cv=none; b=m32lq9HUBAdet14W3eqOCjKC7HqskAGdTMOcrFlPFfrr5IAjjaQQuDEvBK5/EmLeJqI1K8zdynoa5WZMilv4YjYHGl7mkyyTPaUQu6mwRf2wz+22OOIsV5q2PTIvS3BzrGet6eFwa2LRJzIM7yJ2Xt4w+UMpEnxW2yJ3PN+yzqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367452; c=relaxed/simple;
	bh=2r7bq6KL02axoZE6CT8IKT3dwmXpJ4hSMNS66xkXyNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDqMyLhWl7aGAEUMAvdJky/MYjjc/miIXcTMJsojCfEV80cd7rP+KjImCsAFYUkdU1usC1L9PwKwXt0Yr/+OwawFCvds8C/w6CjvO6pTw3NabAsJi41ZpGj/F8nDUt8CJUUySpps1sb48hz8wkCDn9R8RRD2ob4VkkVUiT1uNm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c38568d9e1so762021e0c.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:10:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367449; x=1786972249;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8/+iWq3CnWCpUvZjLzYfFVfgHXscPUpSCMFbxB55MUg=;
        b=dPWu8c2lQBN7zwJ1oPPXrt90KPnvQzzda6gWMcVz7KtU9G+5HYYats34Mtx5BceSZt
         RNzpX+dG3C70crqeUgHkAFe9kyAJ0A39dOBzMoz2pK6255jsy2CmzDe5KfFVijUPm4gM
         hg6lNZiatW8dXHWXN5LmFFyFNsAuaO4aIZJpmgMnIUm6nF8ZVEMzh+/+UXCsTzL/Zoj4
         oFDh51b920W3r6YROyJd5D6r68UvXtpgHfTTxiJjQ/RxtD67sY0K0JOJh7IdthOvCrGt
         G5JOySwlx6z1pEFd+aE3OV37TDY5o4y0q1H1okQD3js5Kl6nJv5vDKpOFk4jJ+tAHnrA
         cAwA==
X-Forwarded-Encrypted: i=1; AHgh+RrStUaPKfYYUesIDa2TeXaz7hb3KPLcXkKDWCUEEQ+1raRxkOUeFbPnvCCMDhKpUFIGLt4elKZCD6Dd@vger.kernel.org
X-Gm-Message-State: AOJu0Yz66si49PMQVXhV6nv2KpFJClz+Pfxd0zJIG69t6BAN0ILQIqLZ
	y6JaPmvHYu4UWBVHbIWk+yZkJto5LTeQH5Er5zy8h8KjQGuNSjslgyiPev45Dg2w
X-Gm-Gg: AR+sD10orBZSD9QWsyjlQEJ9elPB7lmtDZ4LpWo0k7ZUc2NPZNM22tZRZ6wnIyGS6aE
	spH/E0r+uv1iB1FFMX0bzOo7TnFv1c1AYBDrzQHrkC50eMhW63Ti+pof6EP3ri2Lbd1CRuGQ9CS
	7LZgYaM4d5T0ExnYD7GyAQqscARyT6iww+rW3NGkZ+6ybZoqAf2ABq9/LO1U5+t434UWnX1yuen
	3bAiQb4C6tLkqoOOeziv4NT22AKI214EY/s1LfwitDFzTbLnsuJuv5dLuF0PFHuq2jTIzoK+han
	+R6CZ2KV3NtgVpx/7N2+ODC1ENWAlf9Jp/XiF8WZBDoRAQeOerTzGegHzg8hhPzMkkeZAZ3PLn3
	URnRhhjesLU+bWYD5MHAokBKcmTYAJk/TV1dlzCoa51Qns/46T47eWEmpsSp8J9NI56JDMXJHG8
	rE13anBXKB6QynHsgxRA1QSR2C2usHnf7VIvwXdsU2NfdtOfqRJEj2SsOIC+bwLjkk/Yk6pz5Zc
	VtnsuJYix3T0bHD58TC/pPDdw==
X-Received: by 2002:a05:6102:3f0d:b0:738:84c:6b3 with SMTP id ada2fe7eead31-768e5d22ae9mr310787137.3.1786367449404;
        Mon, 10 Aug 2026 06:10:49 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-979f2e7af1asm3429466241.5.2026.08.10.06.10.49
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:10:49 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-74aa416ebb1so282241137.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 06:10:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrxy5YDEg3dPCBk18yJ4YHdMZtnm5ZB+606GiblwCiT7HtV6js6e5oXB59agzPXBM3uYzL068Q3yns3@vger.kernel.org
X-Received: by 2002:a05:6102:4426:b0:738:cdc6:f59a with SMTP id
 ada2fe7eead31-768e8119a58mr269915137.9.1786367448880; Mon, 10 Aug 2026
 06:10:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260715105306.25147-4-wsa+renesas@sang-engineering.com> <20260715105306.25147-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20260715105306.25147-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 15:10:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEn1GAOdvPRDmE2ggKMTzVc6ev68AsLtVf+=in3oG0Xw@mail.gmail.com>
X-Gm-Features: AUfX_mxn_8ZKs3vTmsJga6rdas_YJzmUEfjEtxmDZON3NmbE2TI0KK5PUwUGLsQ
Message-ID: <CAMuHMdXEn1GAOdvPRDmE2ggKMTzVc6ev68AsLtVf+=in3oG0Xw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: renesas: lager: specify correct connector
 for i2cexio0 bus
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 15 Jul 2026 at 12:53, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> It is located on EXIO connector C, not A.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
