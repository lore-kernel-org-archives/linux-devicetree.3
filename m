Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B4737CD20
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779265339; cv=pass; b=a2BZshucRyXmGZ3XbrAmnGPfC6V+e18u+nJnAeSV/IM/CZCdziHVtQAp4azRkDN/FKxEL8hzbjg3SxpvnNPESivkcYbRyBq7hnxpNRwOwHPbu6pkiyO5BiAtYlSp4XCFSYjAQx5kGxfimehAHlBeD8mdp5jNK2bRQBTT5Rd7ED4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779265339; c=relaxed/simple;
	bh=JjHd0TwiMebpAy1GZrj+M2r42NPc3hgjjB3SrBSH1Os=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QgrsqTb4Lv9VqDRILM42y6TY8vdQne+/y320WQeweeyIcQQfRgqed8iR5ORYc33SD+qj0qTenjz5bR8raoJC9HBM/t01CPlivtjo6Ext75pYhVqhpdQ7rLTI3SrZ0egGGOwmwWenUouHk+mzPeUYWIyyfgEl99nHdHKNAuSvDhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sY/TLtcD; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sY/TLtcD"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44ccbd3290aso4254509f8f.2
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 01:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779265337; cv=none;
        d=google.com; s=arc-20240605;
        b=DJDsenClAK6aD5DJymqm4UCjYOmpIJ9AOvPvJxVznzTlaThFhpQUfeLFMorEWP/2wH
         ikbxdeUxSlkhRLxb5Z6euw4q7jD6VOPSQxEFqr0AD6+F8CHUHiHXtf7y5AjcE2uCQ0oZ
         wsCsUu3ByZS4I3jRDGBbE5nDWmprhsbzdHCgMUxflsU5WSSUCbfq50Zu3fdbd56H2p2g
         FP6VKCTIa+sWXyzEfQKynLQB06sCFU8hoMWjEzJ2nLXqc1TAkfT3I61TJP/O8GO2KOfZ
         rVmdlUymjuGexV9TF4PSw75vkvYeKtbJPKntDGfUigLsr2GinUEa2N8izbj8r/JN4Mwe
         J0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WgIjU8CJSlZaMjnikCuz4+bLiozhwEDERaN26ONQb6Y=;
        fh=QGXosYq97yMWkc6Z6T+/F96TMvolOj3nzGt8KSqAzGs=;
        b=E7Z6zza0TzETDE0dA9dQwUTwc4Y1lQERdRFzp9k/GLlGhrAqsOB6rFoFHF32bSukYT
         LKgQHZVeU5ajnfomi8C7uvfPAbUXAkwQkIPZpBfsWfqZ28GQb/Y7rAaVdRNYnCsc1c9+
         XhZlUQfPZKe+pQ3lpevExMABwnRMKL0r7CL1axp7ClsI5ilsTvAUsRdlOG/WbROnipKm
         rGqAnvLs2HylFp8QNekhFUbi4lpH0LYM9+lyUjiJkPE/zPsMSme2F7JzcK/damMxzo/U
         fF2tDT8efatNfxvHb8AvcQk5fJ772xb9HtJdSOVn51Y+8ppL4iGBAgXmrYTnL4zBq1TF
         660Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779265337; x=1779870137; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WgIjU8CJSlZaMjnikCuz4+bLiozhwEDERaN26ONQb6Y=;
        b=sY/TLtcDXJpX0KK+3KQkdY9LkVtg4RQy4e4LrDlzb8a+0erTlaK923Iowfb4CnJp0N
         bcfBexMwTo5fmwSSMERuuB4zgsCThw8yn+TIHqB3LTatKuu49f6xNpkSgrKA9vnn1MD/
         T9IZ700dLzhwXFDaTKkuhmbj+QK4eGNFsoMA/E2YiJIN9HNWtd81NTzzGIYWdSNNVL9A
         SsJBCcsmZUubF0oTUT1qU5qz2PvGrv6QeYE9G65HbjIaoMCip/hU1mUPErnRg9rr4jzt
         8gVEC2Bm5+5Pyh5jaGGRLXAP7qBmRFvfGk1cqmSptCY7IKihChebkfOMHmj/Orgg+fN/
         Plpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265337; x=1779870137;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WgIjU8CJSlZaMjnikCuz4+bLiozhwEDERaN26ONQb6Y=;
        b=ZLBrcB81EOm5GL6eOWA3qhEwmxdwafzImjRDU1zfP7SmsFjZyGGERcUUHnmAf2IjG9
         Z8nssCVtUhEOzqn4pzpdSKTGxHVtbenNZKvFqzsvm6yjE+BUKuBiK7/y3yO6FKSgzwIZ
         whEJhBzPBW/9otUKfqGJVkvmJScTFd6lnN28MrW9q1SLIxwV9+vtiKaktM+1YsA1GlSZ
         7rq2eoNnUVHPWXTn7WoA1cKPBlByRcJTRiaxa8EeXcGE/QYWAsvudbGgCTepaHeeYCWb
         F7Bz303eakax5+HTjXEWTScGo5bgtIBh+ui+Yxdy6/N7nGxh8GlvAmmHeGpI2Mex09Hn
         GvaA==
X-Forwarded-Encrypted: i=1; AFNElJ9yARrSPQuePQy7hn58VZj/gO2/gGNUA+XV4StaPWY7zRTOdbjhjJbDMlydkJr4kqS9zxIpVgstKUGy@vger.kernel.org
X-Gm-Message-State: AOJu0YzPwruvGgfsc7fcpPbEEFCYVgwIIKbksokDT8jmzPz59GmEtwyz
	C6X118vc4JtDJidy8rfyMBtS4bEXveP0+NYabyPdk2e0FZmNS+sUDfPf67QEdqoHh9YLWL/SSzt
	ekRpHNF3qKtHaeBWQl1gYOgKRH1O1fr8=
X-Gm-Gg: Acq92OFkp9dPBp1/Cg4UPan18GKO6/uyg6VtGulXLlb8T/Dh9QbUX5oRh8X77qzvRYr
	3sLZI8EFdMpbU5Ds+h4P+u5jmMS3vwcVQZSJuu51Iy9aiVlxjq/W3C4KEQzGlyEwkK9zkIOjgHd
	pEwXlRbR25fzJegFX+Z9HM1GQDBh/kw8wNwF1WEHzFuIKuxx2Mzt2809xb4t88Pex8WbmrXAV43
	//oGgaalLoBluNxqqMTYJQjQvExazr9vOHkdSkcfK1/FVT+h3t+d3+Qlj56cDVsoBx1YCfFsgNu
	sP8Q1yJDeXhZH2xOiiLsrXbxleDd/dIa0Qyo/dvJlqxb0goFMlixcOwVAgFTx+XEnrVElyrcWFa
	ASbUiXm1d7yjSU5+giN65VYigdtNjQ9nCpTdw2a7OYm3N52A51UsWJFBFbczzfAh9Dfh2XjZ6I4
	IPKxMrtw==
X-Received: by 2002:a05:6000:4617:b0:45e:9433:f301 with SMTP id
 ffacd0b85a97d-45e9433f325mr2645215f8f.41.1779265336961; Wed, 20 May 2026
 01:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520072843.3593-1-kimjinseob88@gmail.com> <20260520072843.3593-4-kimjinseob88@gmail.com>
 <CALoEA-xOGAGb=-uXBv+Q2QC=viPCGUESGZw=rfoBHdEJFCkEAQ@mail.gmail.com>
 <CALMSewJinjbnHT_sOgWmHVeThv3su_E6fioyAjEWKzf7uROc2Q@mail.gmail.com> <CALMSewL560vBTut2=_x3KVvdoqMo3Lmg3WF9jr-EdncCFNW71w@mail.gmail.com>
In-Reply-To: <CALMSewL560vBTut2=_x3KVvdoqMo3Lmg3WF9jr-EdncCFNW71w@mail.gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Wed, 20 May 2026 10:22:05 +0200
X-Gm-Features: AVHnY4LOJ3rWWK2LrZxLVelyRkqyD5nwy3RQlfmXKc4pkk8Oqtwt0d7ncv9s0GU
Message-ID: <CALoEA-zx4pwxoz_a5X6yBMtNsf_Kp_Bip83HOVCWsk_3GePcDQ@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] MAINTAINERS: add Open Sensor Fusion IIO driver entry
To: j k <kimjinseob88@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 May 2026 at 10:14, j k <kimjinseob88@gmail.com> wrote:
>
> Sorry, resending in plain text.
>
> Thanks, that makes sense.
>
> I will fold the binding-related MAINTAINERS entry into the dt-bindings patch
>
> and add the driver path entry in the driver patch in the next revision.
>
> Thanks again
>
> Jinseob

No worries, also please don't top post, just inline your comments like my
previous reply. Check the mailing list on lore.kernel.org to see how to
reply to messages etc.

-- 
Kind regards

CJD
