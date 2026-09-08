Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA9F5476FB
	for <devicetree@vger.kernel.org>; Tue,  8 Sep 2026 13:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872709; cv=none; b=P31Ij8aO/lC+2UZsTf3D5UNQhHe1cHEz8uIzXQ2kbvrQjH7Fx4mYIrlgRweXa7WRqiMMuI1iIoxf6oeETTnhZLlXwY1St2kaJOsVo2+gPmlGdPhNwUB9dPBSvV1+NBH8qfV6hCu6pVpVLL36TGHRmssSinqOoj4sKUz7Qq+2+Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872709; c=relaxed/simple;
	bh=eGwYIsCScQ1MoY5AdqzWz6Y6GCZJqDlAiO/vY66STK0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HlC7Wehz/YN7HXw6tnJACNpRpm5eKIS+l+ZrygeY6KRPSpqftSJ6V7JLP6ZQxbgDV2bheAfS1ttwGcghCKp72XWVtytn9isZv8K6aZIInPB/b68t6ULGBzgoKXwmSE1e3QPf7J1UFR0EVlqPu4adfK/eyN23A0LLQfeCnJZzIvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c2ae02f69eso4015022e0c.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:05:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872707; x=1789477507;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7OUHgNmhkRIilkfVPL7PZ1sjvxPEaa5xqUS0CzXrrac=;
        b=dS+hLbtAZcVz6PLmXjpipfro6hwqj4td3QTJP44bmbxK+7Ia3YDBiUmNyrx708MqDq
         gIzHo3uLIeFj2IRPIrIDHuTf/MU9aMTH+3ojfTf8FMGu/frA452/IY2op3rHsmPxiSl9
         1rCHAiR9TPr9PnTmP9OzLy4+dC82pwFD2iKjrIyl3lRmemfKaguCV6G2AIFKgm1d2vqh
         MHsY0+4OjzzBfurWVvCsMzuqzze4b27V6EJj5RZY8tDEgEKkNRCBkdgDxlc2jeGLWZt2
         KMvhK10/Ot0pRBf0ary56RyGOCKraRYJmD6ke56jkaqJZdB/5LK7MamCQo2RJyQLFFPi
         H58A==
X-Forwarded-Encrypted: i=1; AKwUvBywi/pZGbtyvJSfgZw8z9RWrREzbSedIN05+0QBRJdPRyoaIS+Qc2vfMWoGlFCcFq4giorGQp4fpwrg@vger.kernel.org
X-Gm-Message-State: AFuF++noqguZ8KQnq5Tf/2p2m3RhM6aNmk0nFEhkaeBbRKiJ/6ouha4c
	MVt8BNH4gCkGqR72CuboPSR5u7jjHLGQNZTy1Bru2nCfE/raTkyNaRsh2gwRECln
X-Gm-Gg: AYBFou2H8oBQWaIYUWtEHi2SEz4VKRkpDX9c2bjnSAQWS4+KI4ioi9YFAm9eFQy76B/
	1berMKuepp8d8mn7/HFoXl4d4koG1UW5l/StDtXHoi9xX+KUetpowhgk1LsgRCqN2rJACOnv1Wx
	tb5NzakcKqJjPbfRtGKtuO0/G7e7ZvAwcu/p+iieuuROhV9uhAmjaJZ366zIEfRbLkpyxuQ8aKk
	cAkxg1AH8tCXotO5arfQfxPsvlC2DI2ZxCOwauisPQR+al6HxWhkP5rRUiurbiJgY+aRA3yUGuS
	PFz3wgqajqKNOCxt2Fl7gDt4vR7m3VZ18Dv4jLZcW4QZ5HQfA5oPPD3C4kYN4uHbgAmOELh6wWQ
	9pzrIJ2MTxc0ypOfWdrZI8Tusymc8HnJ6yzR0KXRIw3ScJK2UBH04PeYVoLWvujebxc+Rgahn9A
	GHtfAJXf/kZPLrmBuLzYXUwazPTpemyWHW4Ri/RKrmCirHGE/oUw9y5cTbiC1X1cDjYsH+BugQG
	4w95lweTviGXACuQH3hMfILz2fyqAsrXIDayQ==
X-Received: by 2002:a05:6123:4e:b0:5c6:599d:8730 with SMTP id 71dfb90a1353d-5c7ed723952mr14593775e0c.3.1788872707173;
        Tue, 08 Sep 2026 06:05:07 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3b2cb1sm9657425e0c.16.2026.09.08.06.05.06
        for <devicetree@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 06:05:06 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7866d924eaaso3264935137.2
        for <devicetree@vger.kernel.org>; Tue, 08 Sep 2026 06:05:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzoeVHbubjJhdID7m3xy9ZX/wN1Kf9WiWP3ptaMa6ykJOEhbp9N8d7ghmfs3gWHdgRAIAInhqT80jEI@vger.kernel.org
X-Received: by 2002:a05:6102:644a:b0:785:d308:cc2e with SMTP id
 ada2fe7eead31-78a4a91b269mr11781521137.9.1788872706596; Tue, 08 Sep 2026
 06:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826174854.199139-1-biju.das.jz@bp.renesas.com>
 <20260826174854.199139-11-biju.das.jz@bp.renesas.com> <apA0d2tBBJJ9FMnJ@tom-desktop>
In-Reply-To: <apA0d2tBBJJ9FMnJ@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 15:04:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXzDhSQ3Mor6ANhUPoghGNtVQPRbvc+F2iz9Mx5cm_YSA@mail.gmail.com>
X-Gm-Features: AcwNN1XSNu81MBsTxUenVVeLwj2EDvtMps-yBFlHKAFoTCMXmjHGUl9yLsJu0Gk
Message-ID: <CAMuHMdXzDhSQ3Mor6ANhUPoghGNtVQPRbvc+F2iz9Mx5cm_YSA@mail.gmail.com>
Subject: Re: [PATCH v3 10/13] arm64: dts: renesas: r9a08g046: Add DU and DSI nodes
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 27 Aug 2026 at 14:58, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Wed, Aug 26, 2026 at 06:48:44PM +0100, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add DU and DSI nodes to RZ/G3L SoC DTSI.
>
> Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4 with DSI resets moved.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
