Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B72E23EEAC2
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781779072; cv=pass; b=EBAW2b5f/NIT06FH7ozqbv7Ms9nlHXQfxfV6alGTU+z+5KgqW+OPli8itM2ZxqyekwbwOdvnFaEb5ow8gIxsP4znMhk1IMO/2/ZhF5FBlewpnGuH2uX+dBA18ri41g/dPm8dD/ssvSyPfcu0FoN/Xu5Fqj1WWcusiVAbH+ii75Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781779072; c=relaxed/simple;
	bh=TuPYQkya6tmZ/l8MKVs8GX5qhrHA3EFBkCVctB9px04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eucCE7o1/DUKbBHBno9fhweOuVr6I4DoK1s1BrB+Swp3KGM8lE0d+55JI+debNwgc+XSXdnhyQ/x8G5UcmZ3wuaciF6n/EQwCFXMPwg6VuiF3qh6Quaz0KIpEq4FJiC04EQfnmO1wNSfhsq/mBn4i6drLOa7ttnCq2q75jIWrS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEu4gm7q; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEu4gm7q"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4629d80fa08so792283f8f.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 03:37:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779067; cv=none;
        d=google.com; s=arc-20240605;
        b=UVzq9BzTYAPMVcTYYIpOiT3/ruC/Dzu7zcZVxwHqyqH6FnTSyWym1JRy9smMoKT3Ii
         Une8UieAFZrFnS8T67TFjGaHUhTn0MnQOdJF3n21+9xAiziagp13EFflnWjvu+PNm8/h
         5VzfjZ8Z+yACLgMr2ZYLyYCurjdjtq/+htfCSAUUeg4MIxiirzTRuwFf9/pc59RD49Us
         qxGbITOQgKwJzysX/Lcb6f/5vQpaAB/pEeTjgyeqnMC9Nd8BDnvH+61/mtFIpvusvXnb
         6e/fgsmSteRyuqC2tBB9ew2y2rqcBQyWOTQ51LsSe8GZzOfts2NJJnxpKLNOm5sKcEeT
         jiEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TuPYQkya6tmZ/l8MKVs8GX5qhrHA3EFBkCVctB9px04=;
        fh=xxgltwc2taPKDeZ06YWY5saBrs0F0RrTKJ0celAiUPg=;
        b=T8kNfSBAhbdeCEc47RIt/yyrfTgTm2xUu9oYYglcK6COUOLoIXxaQvYpuPdSU6y4UU
         2W+m++jqWeoPCIxF/y3V5vtQXfxihcT803NEIPb0GwTC5tGS73JThKzgf3HKX7Dye0TV
         Th+0eFLTB9kcsC3jWuggy4fFnAQQKjKXy+ZitiFC7DKMSP4CgRWwUBtIGlLWv1Ud7v5d
         tjRX/il0N8hsIvsVHhEYdZ529HrShN7nHiBqIBNjm7kWr/GsteP5pbOaLF2zWe0ric7B
         EApr0zRUvn0lDLrG18J/bwYpnO0a8HeOfh6xWYEvCKat5wV/77OBbqsAWyZiFANqRaUv
         fm1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779067; x=1782383867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TuPYQkya6tmZ/l8MKVs8GX5qhrHA3EFBkCVctB9px04=;
        b=tEu4gm7qVnEnUNpLwGXRBpmUObM+sYQh5LQv3qZjptgI+HsyTJ/Gl3AMmCn+50hPiw
         vZgTbMsKMfMFRgWqNlhGbn0hr5tNItEoRdJfN/JvJb0GyKUXHgq6z+8it0wkDI8nqBA6
         lJhuzIQQCzvmCBcOqIOI8c9DZs3PnA4xXUxkFKls5JV26Q+ygzgylG4hEnzyRGYWvDJY
         tnNiYS6V5GtaxIE7TtJVKck12IH2xch5zleHsXBmIkzPXHQFARmZAWUK+rDX8bsqpIHY
         wloagToibDodLWsD0vOtPsZZde9+3ou2oWjS3l1OQq8hD6HPYs+w30TIPEpsN7hynYbT
         38ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779067; x=1782383867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TuPYQkya6tmZ/l8MKVs8GX5qhrHA3EFBkCVctB9px04=;
        b=mLGX+s/aJkqw2jj1up79tP/i2iPEMY0nc8mRX2fC+5h7TNPIkXZS/9EWX3tJfg8jbI
         C2hbkdht5mbP6LDWlg3acZ9jqVTzGPU7YKjKN0KEq1Yem7WDSDRnygJFVysh26I6lpdL
         KvkAjqOWVxn+N//jmDFY/lTtcmyMD8IjmxS/lS+whLOnp/bRbx53OXtxzrEiquV4tEuo
         uUayezHjFM4kQDLoEwyLpCEsHd5/D3rAXM0oBBuZWSvi0KqRbxP6nbEQeai7qn8BW/tf
         e5hCDS2xLPU7WzkdrbZoGu4L3YJCmfhGVfUVXJxQfELjCEeOxMEoihyM36kfFTMy5xNe
         0uOA==
X-Forwarded-Encrypted: i=1; AFNElJ8OKxDxxHGxJfBrzDGZ820Db0w6U5X7ekd3WcSJIM+OkSbnUr8OkLdsm/5Ky4iBoEfN00BNi7E5YjBq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Pr27H93xmZpnG1Abc8aWW3w4gq3103C9Ikeq41WIyrOSislO
	PzrVEiar20tStRx2cFZzNYToTBc9opksskYGZE6wuxq3mbzv6rw90EAzoVMxptk26BWlGEPCmnL
	GSKjGR+cvV7PiXbuDPzQkBHG9vUgN11M=
X-Gm-Gg: AfdE7cmYu+JlrQAZmJWEb5kS1DAsr4IVRPdwrnSKuMAztIIFWhs/lCAIY6hz8B3DsM4
	bPxnSKjWgQ/cVSZPvr7iktiygsgtHzVt+n0RP+0pVVfnF0F3ffm+WRuIJqBOc/kmThzbPZQFVVX
	sG43s1vVThoIY/RfcYD+jwyhsn2bu0ykBh0wGJYdumk8omTueCuWkdtbRk3beuzQFfzzxA2rHuX
	9uVSaPx7z4rWQql93IRjX5jHnYKLwlHJGjZdIOIKNLYrcN93fB1sR8HukpSRVc6xGzqQ63yqQ/5
	oQyWowZ3128/wQVdI06gBq9h9YKbCJYC+9aegpGGcaWKrsFt3roop8EIiKWIOACagAqlRf6Jju2
	Z11+Tw+Mym8FrWCI=
X-Received: by 2002:adf:f691:0:b0:460:3234:293d with SMTP id
 ffacd0b85a97d-4623955c292mr9564839f8f.40.1781779066727; Thu, 18 Jun 2026
 03:37:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ajJwqDt2jUfhSD1x@shikoro> <CA+V-a8uo9sr3m9F_MQYbHVD5wa3LT3n6MWrVpiNiPDumnVHMYQ@mail.gmail.com>
 <ajPJHKut92mAoo-B@shikoro>
In-Reply-To: <ajPJHKut92mAoo-B@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:37:20 +0100
X-Gm-Features: AVVi8Cd18WA81bqmRQKOqLppbTyxhBpMr_k_9brs1kLBCen_Zb_vX_vTX4BhCAQ
Message-ID: <CA+V-a8v1DPFvu0_M_XV+efkJL9UaqnmuuRE2o7w9pyh8geCJ_A@mail.gmail.com>
Subject: Re: [PATCH 05/12] rtc: rzn1: Add system suspend/resume support and
 wakeup capability
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Jun 18, 2026 at 11:31=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > For running s2idle cases with rtcwake > 60sec this feature would be
> > helpful. What do you think?
>
> I think maintaining such a fragile feature is cumbersome. People might
> have different expectations and the maintainers have to handle the delta
> then. So, if we cannot to support to a large degree some feature, I
> think we should just skip it. Until some user really wants (and tests
> and accepts) a half-baked solution.
>
Ok, I will drop this patch from the series in v2.

Cheers,
Prabhakar
