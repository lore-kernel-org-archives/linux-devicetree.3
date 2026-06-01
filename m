Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C955337DE83
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 19:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780342002; cv=pass; b=TuwYOGQwJXXc/UfP/D8LYzRUE+rLBqmgv4bUweExsMNhEgrKPdkCij9FwIFGGz4cvjS7LVGGqofAK/B8F1gTsdZvdpoeGoPTQhviqU0EOtjzGrgXTpMfotEgDzq1KPSH0ZssGNkSe4bj2VrSEto8iQv3GnnH0jqtNzvkAJUmWRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780342002; c=relaxed/simple;
	bh=c8pwixbD+P1YmgOGPp/si7WLAUf62AkCA7zLS95MCP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPWL6y1KqmVgl57W79DtugXp8DYiVoB2NmT3NgI4OzdVFt+4zTRGBuXI2EvXV2DllJvNIsh13zMLIgwx7V4pciWyKNTIGn3ZLpf6lJk1D1LbSiGyv2cKHJssXou6LPiR1veGWNNT9YdxEbpeb0ARYeXqD1obrfFnFO+xq2dwLf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N/ZivhdL; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N/ZivhdL"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-68d2342c5e6so2501301a12.3
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 12:26:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780341999; cv=none;
        d=google.com; s=arc-20240605;
        b=Ln11bsBaP2lnb1CW8PBIfUUA0tZ0lFwWQBSHAy7Y7mz4Kh3E3wKvlnRyZdiglv+Ouh
         KcT403A0OVlPjmhMD4TSwzR/RDExVkR8jEJZlIfaRoVofqgvV78Ej9Nyc9KH3bdpIivQ
         cREagZJRnTm9p9a2aS0CZkhoWPnkXsKlKgLqsKnOxvdllkUwzMyYw4NMX/8iTS4QgF++
         BmVf7CoSJ3PI+xHe2D4mrneCAW/zZnuQnFghCcRuR+JDdC0seu0BhGOEI3rS2EXiMhRv
         eRZA9cR3akyhQb6mQ/vWn/3dqciVvYUJItYrsLxXjmGlQqJ4l7qlI0nfMDNeQaQ1AmhN
         7TXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        fh=9erw8ZITJdSsu6n+oeavrdmCyI5wt3mA+vhraYFbSSw=;
        b=YIza6BYjkeox7H1Ru9s8L7axdXOjtWK2vS4UqpdieLyNONrSXolWJqXdWcYPEzOFWe
         ugBa5saIsN8Vi5h2X4nXuuU+r6a53uj+ZoWPK0PqGbEK5lbSk1SB/WXKASyEXoIxcQOk
         jLIgL1o/m6JW88svwwcZ4eDBkXekROTLMq2TjH2+upd6xK0SAglpghXWeUa09JPlqG2U
         sWyZihYPjslQAx0iw404yBtHUEwBAiR9SHBqHL3RCyH6O7toAZz36ImNZ5BvAW/ms504
         dVF2zJ+KqyQDVosc5D2z0hf2mAumU5+uh8ifWIBk8bzLPYuaxDrDXRBrjbjArWQ9aViZ
         1cdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780341999; x=1780946799; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        b=N/ZivhdLvhAYF0abe9gLGWFZOR0iKULLfAJCG9n2pls+a/G3kD2GE1thEQEcH91HUE
         Cmf2GwnD5pukUWq1Ks3RXfFrXwZfScJBwB8c9ZI0H8XOFWcW5kiaz3+JxfEea287fy5H
         epH9LUM+Vu4nZNWfb4Ur4DvZ3ShF3VGu9So7bRDwNVyvkLP+UwKzgcNkTFRnh11R+2AN
         x78rHjH4OH+wq1UkD+uLs4ETjaK0DHoZiny4uC+1rP7Byb+2WjO5uIgnY926uQhPFbma
         RiUcEg2lFBlbOj+4KDvLLu0AmqUSRh3nCK5IjQJBvIlC5e1YrLuu+LaIadHXW57SJJC8
         eSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780341999; x=1780946799;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4hUHaRW2pF8Vn/XBhJ1vzt2YBnt21syoEVUODaCftU=;
        b=pRQCNy87E7L7vwyX5xmGYHWRPMU5Lty8v1xpRxbIdG2xC0EKrnAtxM6qaBnIf6DDxW
         1FTFN3k8QczzvtpyoAP5rgMxGi5Bqpb9fjOccbBPpQROOdyNJ2wQuN8D4GieBwbTsgRz
         pKV/bAfNDFmC40sovzDyXOsYEFjxmj2Tlf9HHvgavWW1hSW1sVaQ0Lf4xN4uyVHYdnQm
         TXaMUENx5w9Cc94ptD2AmoRULBZd0+eiWSl3PjG2/3PTxctzCurVhSHaDEoeVUUtelOA
         ihQIO8IJNS3zLuCDtlYEvn2DEDD3wJrtg5nxbPCDDqOuvLRWLqESNzNf4wxJDfbb9+O6
         8CqA==
X-Forwarded-Encrypted: i=1; AFNElJ+Md7jIjQiPsH7Lddsn4d3mo4a5qjCmiH03u7kGa0nwl0O2GFG9LswcKspAuws+n8Es12+KUWN9AKpO@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5WGjstPnyFip40+W0PLwIdhCPdn4zBGYg/j782BtIIv2syQ6H
	ibhG/uPbKVWsLT5/l4R7O2MJ7LdxyvrBxgXSfOnRMPsUilZ+XNoaVO1K0aoWhUAK+5cTiYagg1f
	o6SjCJbnMsC5o+04ihkBmNCXy6MLKN+A=
X-Gm-Gg: Acq92OGXauD1obZKf40BqyMDe5C1wKlsFzpCdJKQrMrLNonM8uKbd3uY4+GSyIPcLBi
	bGr197yoVAavwuurIQrBlJ1jsRvNsQl4/1kAt0krsYgwGuq+vT8vf/f1ptfI+HHNzgYiYYL28jm
	xaiHjc9QDg4FRZ4VZYz8NKMk4uhmoyDzXb+Ugb9BQ4NpOrrvhx3piSSPTFWDc7aujdJX/dWQM9H
	EPswy4lUIgEvhtuojhgZTYh74KgPxI2FZ/mB+BmDwnTygq7NaBqSjMMC9RY8lCIrhHmwwzbUpE7
	a4kXWJcDyw6gCpsHKk2fKihMt771KZRQbDgvKYlxH9hDAMs=
X-Received: by 2002:a17:907:3c8a:b0:bed:9a4f:a42e with SMTP id
 a640c23a62f3a-bed9a4fb3fcmr364036566b.17.1780341998944; Mon, 01 Jun 2026
 12:26:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601152707.29039-1-l.scorcia@gmail.com> <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
In-Reply-To: <CAD++jL=oF_43jwV830p42yOke_tZb-MKomp9fVoQ5EtnQHGzNA@mail.gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 1 Jun 2026 21:26:26 +0200
X-Gm-Features: AVHnY4JJrihr8pVvcJ1S75wZnre1x-GIaJ8orYAbpycsIER2tWpRasMInT2GVKk
Message-ID: <CAORyz2+YG4WsS1ay2UA_S-w1UGMe=yEbiz-FUnRPYR03xaikng@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: mediatek: mt6795: document the
 slew-rate property
To: Linus Walleij <linusw@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi!

> Do you know that value for the SoC to you can express it like
> this and translate it in the driver?

Unfortunately the data sheet I have doesn't say anything more - just
"Normal slew" or "Slower slew", and I don't have a scope to measure
it. All I know is that it flips a single bit in a configuration
register.

I found this missing property while working on the Xiaomi Mi Smart
Clock x04g (mt8167). I ported the current pinctrl driver for
mt8516/mt8167 to the paris platform driver (adding support for slew
rate and r1r0 pullups in the process) but the stock device tree sets a
slower slew rate for the speaker amp. Without this patch it would
trigger a dts error.

Thanks!
-- 
Luca
