Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC67A49890B
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789993904; cv=none; b=KQ2fB6pY1HZ0Mny010HCZdEVEjRSce3SP0lz5SoBwavQNNueHtcXuPPcNGqS4qDxcPUUvwjtUqqUp87iWs6wOH6Xa9HuplBNeMRW5p3wp5rh6SVhZFaklrPB1WE7c2lb0M6lAYgcL+n+xtiX90kB3LCO5qo1cavIjJjqGgKFqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789993904; c=relaxed/simple;
	bh=SGvA9NKI3LhkUtgFg259g3mM1LRdIuBdN8zWX5kHUmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1mrhC++a/lej/eRULKiQBxhIdfeGLMcmSoa9p0a0zMmkr6Uvk3MtMyNw6rd2lA1u3jLBNGg9gd0Bxwupc+oYvmo5sDQSqav4xyajO+w4qiYx3055TDYTgssng6QaT+NP4POJKnC0b72QZR8/ght594NNjp2n/cSXcqBuWXc2Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so364148866b.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789993901; x=1790598701;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SIzJLq+3/3KF6yVvXrlV6434jsREi7AOdKjY7WjwTi8=;
        b=U5PCuqBEPhhfY8+owgmmzBOc6j32RgO6YuNf176OgfPKa3tmEMq9pbKiaojtvYNQ9i
         DIvDjShwEJCvZ2MmAGnTU8DY/K7fFqlC50pyA+E8qWYEeoPW/1fbajcYcx+4/tqzfiTK
         nm7yu1GKkUCCJv/P0Jg1yHanxAPiuHTyBiPWCqJy++0481KRAq+i0XXBVAXggS3PG+XY
         xlRr05sqAtG5NT3ULJGjyws6F0zGFTws+3Z7Ez6wua2o5wPBaMX9AlhWT29ATNRkNJ0N
         Vc3XDVZDkWAZF2L3oO5f4dxr20I8rFfUT1X0mKu+xlEPnLk8SBLuGaw2dPSK5L2jeRaP
         yumA==
X-Forwarded-Encrypted: i=1; AKwUvBzHHEQhy/lecNp1cyfQcJU3AJabhEV4zxfhP+2OpOZnAuO0VsCcR8MTTy2ewlukT3USrN3zfWikhS0S@vger.kernel.org
X-Gm-Message-State: AFuF++msX4hk+KPlob4oI7P7CcIpLRP9CO6BCedK2sd4bLUD45hxeq4u
	ttKWZfpJ9vXo35wnhhSHn6ePo2DiKymtl74QsBY+boBFM8y/HCh6Ci7M8+meOucvGyE=
X-Gm-Gg: AYBFou3szu3j//H3YV5ec5FC6Q5ERz3YgpL3FGvVO8LP6fwjOBw36xJ2j4a535QHJXL
	Sz/n8D0eD/Oe6j+pYOQXA7xen2Ct9ofYxdygwTn3is2TedWLjl6ivMDVxztuRlb1yOa3Ol6nWP7
	I49JG1RT7bDcwRoHT/YADfq5zbJbs8tqom1p0iie8nX/rUpJlOiOL5NXmyjtWEeIkKc0hxq3Fvi
	p2ifluP+1BDrN6BzuDcK4m+3q2AWa7pok/a3HEtdGIX0tlQ6Z+KIQIpg2AiqGGxwXKLlcqxPGkQ
	JEhhB3hXACQNLD3WXD+UM8YKz4kYXtmwjnlFcdS9A74iNusMQIojuApOz51XMkuleHnEy3BiUGn
	RmvIIufEIqgGGDMy/G9o+hMmVyAjTPreygJGlDIyA55xy/CTl/H/VmKbsbWw0su8HOF4l5XCAym
	3WnWelj4u9TV+lkGpLepHHdn3wSpcDWMCej3fAPKV6P8BAqCA2tgFdhRX+AS4bLRUfwlY8Zmdfn
	+CH/flKI+7d+DNC3RH0WU75iwYsQH663E9oXxM=
X-Received: by 2002:a17:907:9447:b0:c29:f5d5:5a9d with SMTP id a640c23a62f3a-c2a1584681emr771042566b.39.1789993900964;
        Mon, 21 Sep 2026 05:31:40 -0700 (PDT)
Received: from mail-ej2-f26.google.com (mail-ej2-f26.google.com. [74.125.228.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a355e9002sm301382866b.11.2026.09.21.05.31.40
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 05:31:40 -0700 (PDT)
Received: by mail-ej2-f26.google.com with SMTP id a640c23a62f3a-c2940ef15d3so364145366b.2
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:31:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy9pzvOM6VUqtHJcQ8LVIg25x+8dwUJPCkNY6ua41mgZH+3Ne/JX3uaO4Ue7i+blI+lsvPm06iQR7V+@vger.kernel.org
X-Received: by 2002:a17:907:3e02:b0:c29:f5d5:5a9c with SMTP id
 a640c23a62f3a-c2a1584621cmr808752466b.38.1789993900306; Mon, 21 Sep 2026
 05:31:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <arD_c9iP63WLOI1b@tom-desktop>
In-Reply-To: <arD_c9iP63WLOI1b@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 14:31:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7mgJ74fLHnqG=nryjWMaoYqeOq0BNAbA_XqoH9P8ntw@mail.gmail.com>
X-Gm-Features: AcwNN1X_gHFTAUEKRMyjIGa8lhYNHtyWicHqoXl3HQpq9G7xY0N2gFZj17u90js
Message-ID: <CAMuHMdV7mgJ74fLHnqG=nryjWMaoYqeOq0BNAbA_XqoH9P8ntw@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add USB2.0 support for RZ/G3E
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Tommaso,

On Mon, 21 Sept 2026 at 11:57, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Sep 09, 2026 at 10:54:57AM +0200, Tommaso Merciai wrote:
> > This patch series adds USB2.0 support for the Renesas R9A09G047 SoC and
> > enables it on the RZ/G3E SMARK II board.
> >
> > Kind regards,
> > Tommaso
> >
> > v2->v3:
> >  - No changes just rebased on top of next-20260908.
> >
> > v1->v2:
> >  - Included PATCH v7 7/9 and PATCH v7 6/9 from
> >    v7: https://lore.kernel.org/all/20260812141940.246223-1-biju.das.jz@bp.renesas.com/
> >  - Drop placeholder patch
> >  - PATCH 4/4: Disabled RZ/G3L common nodes from r9a08g046l48-smarc.dts.
> >    Update commit body, and improved usb20_pins, usb21_pins comments.
> >
> > Biju Das (2):
> >   arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
> >   arm64: dts: renesas: r9a08g046: Add USB2.0 function device nodes
> >
> > Tommaso Merciai (2):
> >   arm64: dts: renesas: r9a09g047: Add USB2.0 support
> >   arm64: dts: renesas: r9a09g047e57-smarc: Enable USB2.0 support
>
> RZ/G3L USB2.0 binding patch is not queued.
> Shall I send a new version without RZ/G3L patches ie, using placeholders [1] ?

That might be a good idea, to unblock mainlining of RZ/G3E USB.

However, it looks like the only missing piece is DT bindings for
"renesas,r9a08g046-usbphy-ctrl"? How come we ended up with
a driver in linux-next without bindings?

> [1] https://lore.kernel.org/all/aec1fce5558c6c88725fe710a2f9e4b1eb9e8d64.1787062965.git.tommaso.merciai.xr@bp.renesas.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
