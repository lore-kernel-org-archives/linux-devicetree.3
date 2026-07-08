Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBBD2DEA68
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 22:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783550915; cv=none; b=tsQL95WlPdnaRxQ4GpSbiLgbHzoZxPO1tJJrW3iUy4q/qdgbIkChGkI+SjBvikCJEIf0bf6j6z7BnlZRTFRoSWeWqzrM7kpUr8ahphuBu3u9Qy4ZesYWivY1cut8cd8XP8k7bX4IgmhVtYeKw08fSpSsUKitHSe1d8N86WUY210=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783550915; c=relaxed/simple;
	bh=nVyFtOi4uH+VSQ7OUVzMKnF5E+ydsiXz1DVx2dzuQg4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nxFFocJ/xLt9LqJ9JbpbpbTNYjw4L4Nzg+TRyJZdstmKsw6GwWMDqCcjT7S16f1H1fRc+i3Ul05+eykxQS6Vkn/nw8dKC+ofG5NGLdU95joCiyqNAKiNjaAxLeZh6uy0F8KsgLLMXzmUcK4yGoKaT0YFc8Fy/F3g5a14OtAvcQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BYvL55fb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BYvL55fb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 138FC1F00A3D;
	Wed,  8 Jul 2026 22:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783550914;
	bh=aC8ocwpt1hLYHefowuxDf3SVOxacLSz1hrQbtGQsacs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BYvL55fbt8/avqUSJkFtCyLQrn408hc1/F4M2ulAujFThRscn24gB8TpbLSTApjuA
	 wvT2dtEoWWmJGarjibge/GbRfh5+8a+LHqMgRXuZsKkDd5dmGO8V0Au6DOleTJ0g6T
	 Mud5yvPiRfZHLg74cJJKI6ZW5e79wgg6hE1xJjDGsf5kaF9N6Ror9gjwimoosePTDf
	 xvK76xuR8qth4fyyVmwi8PD4CHxLX+NHZtKWSGEOouSS04pRFhrsCikmWIxH9aMoFl
	 wRxcFmjSVk1YO0fCAy8VrKAC0vT3HtgnwUxByvU8lgBqTx6WfnJk/NHwevCHbJrWLp
	 c+ZQvUvLVKV9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] ARM: decompressor: always set endianess on xscale
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260709-ixp4xx-little-endian-v1-1-e9622d0ba9e4@kernel.org>
References: <20260709-ixp4xx-little-endian-v1-0-e9622d0ba9e4@kernel.org>
 <20260709-ixp4xx-little-endian-v1-1-e9622d0ba9e4@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 22:48:33 +0000
Message-Id: <20260708224834.138FC1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unconditional execution of XScale-specific CP15 cache flush instru=
ctions causes undefined instruction crashes on ARM720T (CLPS711x) CPUs in m=
ultiplatform kernels.
--

--- Patch [1]: [PATCH 1/3] ARM: decompressor: always set endianess on xscal=
e ---
commit 1aecbc0046cda85db7fa4420cfe0c46b23cbc505
Author: Arnd Bergmann <arnd@arndb.de>

ARM: decompressor: always set endianess on xscale

This commit moves the endianness switch code into head-xscale.S to support
booting BE kernels from LE bootloaders, and vice versa. It adds a serializa=
tion
sequence to flip the B bit regardless of its original state. The commit also
notes a potential issue with the existing cache flush code on ARM720T CPUs.

> diff --git a/arch/arm/boot/compressed/head-xscale.S b/arch/arm/boot/compr=
essed/head-xscale.S
> index 20fa44d59f82d..86705c865be6d 100644
> --- a/arch/arm/boot/compressed/head-xscale.S
> +++ b/arch/arm/boot/compressed/head-xscale.S
> @@ -14,6 +14,18 @@ __XScale_start:
> =20
>  		@ Preserve r8/r7 i.e. kernel entry values
> =20
> +		@ set correct endianness for ixp4xx regardless of bootloader
> +		mrc p15, 0, r0, c1, c0, 0
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +		orr	r0, r0, #(1 << 7)       @ enable big endian mode
> +#else
> +		bic	r0, r0, #0x80
> +#endif
> +		mcr	p15, 0, r0, c1, c0, 0
> +		mrc     p15, 0, r0, c2, c0, 0
> +		mov	r0, r0
> +		sub	pc, pc, #4		@ flush instruction pipeline
> +
>  		@ Data cache might be active.
>  		@ Be sure to flush kernel binary out of the cache,
>  		@ whatever state it is, before it is turned off.

[Severity: High]
This isn't a bug introduced by this patch, but does this XScale-specific
cache flush sequence execute unconditionally on all CPUs in a multiplatform
build?

arch/arm/boot/compressed/head-xscale.S:__XScale_start()
    ...
    mcr p15, 0, r0, c7, c10, 4  @ drain WB
    mcr p15, 0, r0, c7, c7, 0   @ flush I & D caches
    ...

When booting a multiplatform kernel configured with both CONFIG_CPU_XSCALE =
and
CONFIG_CPU_ARM720T on an ARM720T CPU (such as CLPS711x), could this cause a
fatal undefined instruction exception during early boot?

Since these CP15 cache flush instructions are undefined on the ARM720T
architecture and execute before the exception vectors are set up, does this
lead to an unconditional system crash?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709-ixp4xx-lit=
tle-endian-v1-0-e9622d0ba9e4@kernel.org?part=3D1
