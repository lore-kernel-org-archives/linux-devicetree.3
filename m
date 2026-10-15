Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FDA36E489
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792032435; cv=pass; b=hw/E4u/UjozXm+xjmtk/RfW50qJl7ubX/7sayRcKl5iu6ovHm1Bpz7OXqL2JDhbYkoBNkkSxAfUEfM7UqvIvVlRM7Tlh3b/zQ4L458aCmgf/BNYbtXZrnq47nRzwfH43tzk8zUKTqhCeCtANVureZEki9zU2nyek3QBlcRAVSQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792032435; c=relaxed/simple;
	bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D5WuIPjmW23IOGnzBlWtVhWAbn0b1Pa8OqMQQiZZB0HMSSwLMfEuEQsL/3d4FvsFlY9k4mW05JO1Rcy5WNhYsWd/UjDV0EXNRAaoQOgwwgTJmGyLdOxuJFjBJysc3IvLIba3F+gzjmjAuhYa7AlllN+zJWuNclJU8MBIbUbSN90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9zBFT4g; arc=pass smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9zBFT4g"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so726987e0c.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 19:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792032432; cv=none;
        d=google.com; s=arc-20260327;
        b=dpHUm1JOaNlXyvP14RTAMGenlCF4+Gf72Djmj+WNvxFcpLVs87K3XMUDNc/yjEG8lJ
         vcZy9H5ANDaLuoAFjhwS1zy7voRNw+BwicsxD7dWyUN2ZIXRsXRpXSJqopnBKDsWt17Q
         0wZbZi5wH7O7LnWa8YZ0JgI8JJBhYOxcxYWbI+tAUnFXDvPRMms23jaTDAI86fvYcrH2
         xJVFocl6Fwicln7gSYGEo05H2L489NNZlQgFdqOtke8dGJJZ8oGnXW2jv7SBYO6W3yOc
         f7c1cucPHyjudgdlcBepj+3cZOXYFWniLO0xDh5zmfSOu+EKrVzPIjNTiLBUQhr86QHT
         uukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        fh=QjOybxkcR+wG2iIjAoAXDjJbeEtpEut7nxLHFRVLLCw=;
        b=TrF5E2xKrfs3ByELv1X1A49ZvK36t2qRQtGzxpVsA823R3TwFJ0N88jy9UMOFciFIX
         7CkcgEPDrCD/NlpKUYX3a1TaD9iwxVDhxIdffyHMQ9OOV9w0DMQi10LeXWBnCMi74Hgo
         UnPGF0jxBHOtybH97/r53j1Jbf+T3ehmHq3TP50ZpzgygjQBUdxsg4XMws2TE5S6Kv/E
         KiDa9cvlf8qyPDFIoU8EvdpKujp4yogDKryO4v2hrhXejHF/3J+OABOds2DknDb4jx4c
         fEVoAux4KjY/KW3rYSA9xZrSDdgKHAO559EE75s7nQZeK8Nek1MYhpR9ZeDRRcEFKu/m
         yc7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032432; x=1792637232; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        b=b9zBFT4gV60ABLnctWyzzCBBtfC0buozh2D43daZBmRKfRwgGXt6IOFI5Ept0ZVKAg
         BVjCk73hML56dFXbOMWeC0839/alJYTdEc8BiEaEzZryvW0u7UFhIp5bumMaBMeAhJL7
         ulqNk/Ikzp65yx01NJ/4jHv/YS87Zha6YpTiR9sCNrpR63XZhwq+irLetuIRMYJsr6hx
         xyfpx8JjjmMg416JP9Jr15rfYGbWhnCeS1gZeuvZsOLSmq6hNiwRDzbKYIMOn1J7EIF7
         4WRuiuq5c7WmWKGHQIQFlp7tKjolB6HIs1a8zQGC9hcLAHjCDjwKc1HyjlTn+iwkMaVe
         FZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032432; x=1792637232;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=16GbWlEqbR86iNc8/Kds0QNYGdsCxKka1B+rvUYPHwU=;
        b=a9M2+6Ie6a+jy+2Nz0VdAxsHUfvS7vr8o24Z3wvecvdjQ+qFTSmZNZxxngM7GIyjJ9
         wMi4Cok13Qb2TTsoIXv1S1Xdicq4PDNu5r6DAjmSkY4dmh5zihbVTtjik6/Lbz8YIJnN
         sdFReZSLUALIP5jnv6bcrK6PKkSJ58uOpFmUdnFU5sC/Z7dM36wZFDZu2ciVcC1CNkbE
         caiaGJ/iQ3bNwJRZMFpMeIcTMWYwqEWDZwIxsrf4jlhnZBwGKVuo/LzwP8QRI/NBFC5W
         HQTEQxDr9i7SGM0G9AXmYkZd0y6i30SaNwz9einDLaWnwskKoG5LEcCSLur+aFEuL5BT
         frfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAe0Ny1AuAdgL3lBeZXdvUWbgmew1REN33HqauA4IEZWl+APQtP77ognlsMgVXHCtgU+jMJMc7Aw+5@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ5ZOIfxFOXE26WLvrzOMxeRezcZmRAQ3o4oubyeADUDmpc0IL
	yrkCauaribpqHb0aFItUY8Ay0NUtXRwUl8E1iRuujIUcOS16pugBSZs1zM5I/4JsOP5yidok9ms
	bWvf0Ag6815XOFvUlQg6FvbzLBzNv4r4=
X-Gm-Gg: AYBFou3PxqvH3j6uml1W9wjJOS1SLS5mDv23DPLiNIrfurozTBzFnhV6owJg1NT6Lpg
	TmgBrCbVXjannmzKp0YSJCVs/YuvH3GnCEhxobkv+Ds2JI/UsbmUHNZFM3IbGpZEXC1qa3HPGXf
	p3hGuQs0YORuT/fE7EyFY1MYfsv6gwuHzlU3d4d4pW3kD+7DotWQQQ6/NnwxFLqD6g7O4JCpz44
	tcthEu/C6FjJBKs4mulrzoext6qEB4bMrgXHnHJAsLTJ5ivxQ/645LK08sAc+6f1DzF9dYafJUA
	oQo4PCKDq+hVu6FGn6BdYQj4UrImGivytUzT0p+kua1QJXhoctbKF+SBkhSL2/jeB08bX9hHaIr
	4RLAiYtWpXywsMKC2sPNATYimui2j/QK80d1yZ2p8287Eluraei7Cjc/7dJSHzWPfEbxWavSb//
	+LFSZuy5kL9h1RIMfOaz0z0HZo9XqPqO9mkNTgKqLq63bC
X-Received: by 2002:a05:6102:418b:b0:7c3:2f13:d905 with SMTP id
 ada2fe7eead31-7cb3668b831mr6416805137.3.1792032432146; Wed, 14 Oct 2026
 19:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-submit-sunxi-nand-vendor-oob-layout-v1-v6-0-2fb084fe0751@gmail.com>
 <871p9v4a1x.fsf@bootlin.com>
In-Reply-To: <871p9v4a1x.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 20:47:00 -0600
X-Gm-Features: AclHuK8WjfPBl-snALh8yjK0sT9hEMdsL68lGw63Y8O6sDBZaP8Ds_BfAoAdcJg
Message-ID: <CADvTj4oCVOBiY-55OJt3xFaOiBrFVixmK=AmTRt40iEisDSO2g@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] mtd: rawnand: sunxi: support the Allwinner
 randomized OOB format
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:06=E2=80=AFAM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> Hi James,
>
> On 14/09/2026 at 15:09:46 -06, James Hilliard <james.hilliard1@gmail.com>=
 wrote:
>
> > Allwinner NAND firmware leaves the bad-block marker in the randomizer
> > data stream. On H6/H616 it also places all protected user data before t=
he
> > first ECC step. These choices differ from the mainline format, which
> > keeps the physical marker plain and maximizes the H6/H616 user-data are=
a.
>
> [...]
>
> > Assisted-by: Codex:gpt-6-astra
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
>
> I am sorry but I do not want to proceed further with this series.
>
> Even though I am not capable of finger pointing what is wrong in the
> diffs nor in the commit logs, I do not understand most of it. I cannot
> clearly explain why, but I have had a hard time trying to understand
> what the commits were doing.

I think I may have identified a substantial part of what made v6
difficult to follow. Format-specific handling was interspersed with the
PIO and DMA transfer paths, which also implemented similar ECC-result,
OOB retrieval and erased-chunk handling separately. Reviewing a change
required following those interactions across several functions.

v7 01/16, "mtd: rawnand: sunxi: centralize OOB handling" [0], separates
those responsibilities without changing behavior. The transfer functions
retain command sequencing, DMA ownership and randomizer control.
Per-chip OOB operations handle layout setup, marker transformation and
interpretation of completed reads. The existing formats share their
read-interpretation logic.

The Allwinner addition in v7 16/16, "mtd: rawnand: sunxi: support the
Allwinner randomized OOB format" [1], now has a clear boundary: its
layout and page-classification rules live in dedicated callbacks,
selected through the opt-in attach path. Its erased-page and bad-page
policy is separate from the existing formats' interpretation.

Common hardware helpers remain shared, but adding this format no longer
requires scattering format-specific branches through the PIO and DMA
sequencing. That should make both its behavior and the preservation of
existing behavior easier to review.

[0] https://lore.kernel.org/r/20261014-submit-sunxi-nand-vendor-oob-layout-=
v1-v7-1-5d3fc6ad2da1@gmail.com/
[1] https://lore.kernel.org/r/20261014-submit-sunxi-nand-vendor-oob-layout-=
v1-v7-16-5d3fc6ad2da1@gmail.com/

> The risk is that nobody would then be able
> to further maintain this driver and I am not willing to take that
> option. The kernel policy so far has been to ensure readability and
> maintainability, and my gut feeling is that this series is going
> sideways wrt this major constraint.
>
> Also, from a Linux kernel point of view, we generally just do not
> support vendor specific layouts. I already told so Richard Genoud back
> when he was working on H616.
>
> With this added to the pile, I prefer not to merge the entire series. I
> can still take some of the fixes if you feel like they would be relevant
> anyway. In which case I invite you to send a v7 with just the few fixes
> you think are actually relevant outside of the randomized layout
> support.

In v7 the behavior-preserving refactor comes first, followed by separate fi=
xes
and optimizations. Patches 1-14 do not depend on the binding and Allwinner
format in patches 15-16, so they can be considered independently.

>
> Thank you for your understanding,
> Miqu=C3=A8l
