Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795616253;
	b=yC8xFoWKp+LTnbmo9qjlGttHm/TLD54wjGMSxkEiSDKaRTvm2ozDhl+vNyV99L5tsvYk
	 9mDZCQIRPuDi/DftMyxNG9zb16mbwk8G+wkOZYYc0bkjxiyoUW3X3rVgwKZBXQKjRpHFG
	 iH2ELuG2hBSmaSjcunNaZoou1fMBhJORaQuMEpibxmrIvsYWZurw4C/8WRhxJRfwORhZl
	 o7zNYlyUvhJG2l6NDHKNwZSkjl73hWrsLKVJgXFzv3wj1ENJI8/Kh9bkZL4l/bc56O0Du
	 InGXP77kuY/MWCRjvjBU4XQLMa2AnR9uBxsxsuBn2CovtyDuMe1zd8ykbvkfa7EQQQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616253;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vBumzuwbB1cqhsQzbzZed9p920xHeV1nGuMIbxgs7y8=;
	b=yeJFrG+DakZBESb6MT9o1JqaJqRiCMFh14iQEZ0UfaPuxh9BkrYNECCkcmJTbXk0y9LM
	 sgswsk1sOanakBMio/OG+5Q8/0WXo8KyrQqCRMEh3E2Nq9rN+2BgyGQur8CVKZi87FcEJ
	 yfZBPJywYIxnA89Hv+eT+2DKaRaAyN50XnjVsNtPPS0B0a55JCtbYoMb/4D/XrQIDOdEu
	 bwE/gH2ix622YKUoR3lgZweRpJieU5AxNfYRlksWni46cX4OWcLTgDqpat1yK9ku7Q7gr
	 mkiqVjTm6fIq1RGLvX02xWU46cqbatO+JI0b28Yt48cyOQ0jP4WALNWCw2H+SNAOo2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuLop20A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D77606A331
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 14:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D77606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SuLop20A
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso60373825e9.0
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 06:17:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795616252; cv=none;
        d=google.com; s=arc-20260327;
        b=MEDOxGouAsfC8FUpAPlxPfG/HgCbhwkDL7n3eaavwltjfAPv3cfyVZ6RXIv/qN53tL
         a46BoBmKkNJ9zdwIVgahEkP8aI5G35UFe/OME6i7NBT4MzaDhBKbFIDBoVbiohQfibSy
         BQz+OVEPbEdvlNiF3DkAfBKBG5X4TKyRwoXFvREKdx7TqfuAeb0frAn2PmM6JV7CUIuz
         sS1vmBOn28hjAtBLyDwc2zeaWY8EySBmvYdkCIUtJTzrYHcCIdNyu5tr0HiFPA/BTrTL
         UwWByaMAB1PBgqRckAXf0jd17kB80x2wRDRTvOte8mdf1sK439twA1W8q2dGv3daqQJK
         i4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vBumzuwbB1cqhsQzbzZed9p920xHeV1nGuMIbxgs7y8=;
        fh=DHabHZpm8U6FvA1TUCUnj/hhXHh6JOeG/w7TNgyiGOY=;
        b=I7u0NT0TBmP82m6c6WA8CzuPCja0Dd8NyNU9Ursb0IfQhMyyXsLBFtDov7qja9cmuV
         pn7lIBeN2ZAtG+6FqLmrNBrrpXHjvXo5Q4Nx25ouvJrO+e/XxEtI3UHXbmTS9RhhTcCc
         w2eSwpDN039ykZezCwGebtXvghiClYircsZVlx2PRRKBjhPasebJeodt5hOqdRJz2seQ
         cPk6cuN3JvF6l+fLdZn1LJX1FE472AfIzYiiWzBIdGZL1W42ovQ2tm1RHuCq9yOMQn5W
         IGQynMSC4lzkhQEXQpiV151XI3jQ9tUm4EJV6MxMVi2UVNNJedDQEJq3pXEWYoMEjqWO
         IRcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795616252; x=1796221052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vBumzuwbB1cqhsQzbzZed9p920xHeV1nGuMIbxgs7y8=;
        b=SuLop20AtXs0SDBgt8vawU80+Q6++rBN/s+hXDNwjHmIM3v+7EufKW0sNNEkMTxOig
         cjFOF6wmLLjYawJ9lqU2a0wlmr1WHVnQ38g0sMYYY0ochblYmHoRvdhyCltNJXj0yBMh
         VkrtUlrXRFjM6OJ4HaaTo5NP0dUOByxLVhehmOwVFOKZieyxqnIBr5Zr9E/3JDmzZWPV
         EEL3n0F+tDmPy/GOYkX2RZb4meq/lK8lfuhrjfpZXl3Nz4z/2wmhUR5oZ5ZG2M6P5p+w
         2jrcDb6wKY299NKOzGHF0p52AUW4WfJKSP+1p1Abk5Sf3zAGT4VmBufIugIKdchBOR+w
         JuCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616252; x=1796221052;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vBumzuwbB1cqhsQzbzZed9p920xHeV1nGuMIbxgs7y8=;
        b=fTdnemyrpdlMo/ikJkg9QQ2yOyHeHssKqHZCtW4+kM2cIHpTipD0Rf6E0fRrwr+5Y7
         ACR9nd3FHaQ65pTflTYGtxCP4T7zYOgqEgbO9PJKhMHwzo7GSqrCGkv7/R414YOaCNSH
         Bc1JE6/emuQlvlvtknwG6GMW+xa+FqP6cRa0bGQ9T/LWzwuwis3GcZVgeHLVPNGv1V7u
         LFN3dK9oc31f7HSe0wmqVWgcwWIF/igcpzyuebyh2yOpoMr19Z8Y2Ud3kE8HgaU8G3WO
         ll9YaIiIpzw47JT05tfIBq9mOyFore+Ly8C7gejIZikQFxWI8lLAxEyZkW/XQcUbsyd/
         73dQ==
X-Forwarded-Encrypted: i=1; AL+hErHJljiKRJ8x5hRNzPefzGG2qfK2iaVFY9qBdatU6GSPb0Kyfh33cOAvuk9qPJbmQIQOUlwdsovWy1AV@vger.kernel.org
X-Gm-Message-State: APuU4Z8JNRTF/twuG8EIVUMGAS9JH8Qr9uizA8C/Nl4RQ9TV0t9Hk296
	rxuTDwO+LRp8VSkbx6JZENy3tH6wh3TRuTgcZ8iWRKRF6UW0uVqf7pVsKxbRc5DmMHqqZ1tdGLr
	3X9BrV1wm7CVP/tYCgXuNeMEsat94Xj1KdUkeSLKsbQ==
X-Gm-Gg: AZFdTZdRw5FPE27Pqi+TaROSWT+Zbzs2lZ6yeOyndMjHeSTJHqliKTu4kUgIp6Zxf1T
	mNXwj/DRWapWm5XBMLn2e+r/H8xuZKw5iw444rwrgTKdem1x1iVzIhb6x5NpcxDmyvMk55b3VwT
	gc7obSInOC70QdKaEB+c5bC//kQ/ZkvAiVowOuGAZef45QUi3fQghJDCbTUBTwu9E05zQrwrkm4
	5KBLH3+wBncZOrSRBpriOgAReKyXt2eS6PEwXXE43B17bk89/9PHoq0l1Wz6IqpUZB7xaW6KFX5
	FEksRjjVJOInfLdc7hrq9DnVbEk21s3ovXi0L9ZKLpIzf/Ze1kzBGK+hG4fANkU84wpwVXm/lUo
	cY2nQ/v7E1p89P6wiSOc75mT1Y3oFCCYy/Z6ZpyF2U4y6lHqG55c6gd9MQadrzORJlJ5DF7xrZ7
	fSPsKoWdy/AMhJK/X0xR8ik/aJFMeRTy4jA2mIeMs4sbsJQlCWSGlS56xi/mqb3mXTx3sw7zfbv
	ZZisFgzulnFR3HPp2vN5+qDkhOhWRW9OZIvL2VJGQ==
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id
 5b1f17b1804b1-4bb88812a84mr362088125e9.13.1795616251699; Wed, 25 Nov 2026
 06:17:31 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125121448.180847-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261125121448.180847-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <sashiko-outbox-233356@kernel.org>
In-Reply-To: <sashiko-outbox-233356@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 25 Nov 2026 14:17:05 +0000
X-Gm-Features: Aa3M54r8YU1j3ibEMvD5V77dNghGpt-QUE7O5ouYpNUXFMRABVP1zEURrzSkPig
Message-ID: <CA+V-a8vcfrTckn+8e-OW2E6L3+FUgJ222Yz0q_S2rYK-XbF40Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] arm64: dts: renesas: r9a08g046: Drop GBETH filter properties
To: sashiko-reviews@lists.linux.dev
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org, wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 12:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Low] arm64: dts: renesas: r9a08g046: commit message cites dwmac-5.20
>   instead of 5.30a
> --
>
> commit 820f5e22ff857b9ee742d15a64ef6dac9b4c7ea8
> Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> arm64: dts: renesas: r9a08g046: Drop GBETH filter properties
>
> This commit drops the snps,multicast-filter-bins and
> snps,perfect-filter-entries properties from the eth0 and eth1 GBETH
> nodes in r9a08g046.dtsi.
>
> >     Both 'snps,perfect-filter-entries' and 'snps,multicast-filter-bins'=
 are
> >     discoverable from the MAC hardware feature registers. The stmmac dr=
iver
> >     does not parse these properties for "snps,dwmac-5.20", and derives =
the
> >     number of perfect filter entries and hash table bins from the hardw=
are
> >     feature registers instead.
>
> [Severity: Low]
> Should the commit message refer to "snps,dwmac-5.30a" instead of
> "snps,dwmac-5.20"?  Both eth0 and eth1 in r9a08g046.dtsi use
> compatible =3D "renesas,r9a08g046-gbeth", "snps,dwmac-5.30a".
>
Agreed it should have been snps,dwmac-5.30a, I'll fix the commit
message and send a v2.

Cheers,
Prabhakar

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125121448.18=
0847-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D2
