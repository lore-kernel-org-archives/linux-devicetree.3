Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795759896;
	b=rM3f9pxfwo6Ig4WnLGBqXdAC2IMFS9kHgerCaoFkBaS6XkcG25Pn0TmNmASh9xQ/K0sE
	 Rm5VKYE1g0yMHDM1vbJDnhmRKzusEUEbfThHLpdSYQKPPIr/y9x14c71xWUm88vdmmqha
	 f5OnVn0itqZgkHy0pRZRZTFrVtHkzZ8j7nuAJl4DwpHtLV6YVot+F7ODqG5OyPuMfESTx
	 AWsYoOOE+Ri4Xc1A+zba6+cH8kKXlM/3GxvKV4V15sTvAVEK+XOrqrNDxP87N5CRk23/2
	 0coSuk3YLda+xN3RPjy4nrdmjBPQpKQ2HH3obP6AvuS6Yz/o64PSJnbjG+bhLuF4Dwg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759896;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=5vKFfwX22kLU+bDkkntkUc0V0wt+jMool0fJOroPxrE=;
	b=u96RJzOsy+d49CoiWkeafr7vOJXLqo2JnWtE1oUhyWag1IMfZNoMEDtkr0L79coU/eKV
	 S7VRza64+vd5kaaQ4heLOweN3tEzx8UxsuR4ny6EYGbxevVI2kijOgurMq0DWOKruIZDa
	 lHSNExG81O8LBUGNQWvJrl0jbvDJyc5RyJynI+P4t3H6MKDELDDl2y81HRUfSKGTtCrbf
	 ieeH3F7kBzVsVqrkpst9sGcCI20gfc1C7XpMEvRQSwcHxZ2YAKKH91CcZOG3+ILdlFCzp
	 SZVOIxXhMsf0eclONuWKUygmTHsaLJcMZ2Au16BONFaBC6Ude+ga2jTDPhltfrR1Eng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=jms.id.au;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ir2EQjig;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9509E606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9509E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=ir2EQjig
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4c2da74c0so50109767b3.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 22:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795759894; cv=none;
        d=google.com; s=arc-20260327;
        b=bENUT95yZAwY3ZMmrYwwpqJyATJuii23fiZDcCacXLDm54HoHwoBO9m+vI9ZeGawEA
         8KfQv7zIgkwOJ8WvJY6EKE87auo9VF904ySMkukUgHghLaBKZ3E7njdMjQZ7vppQidCC
         uTIaKyaYeA9zlKpsv1yWMPq7MyfPIcwsmPygoe2wUwbQxgPqhpdA54KN3gBtwFxV7J/n
         yi7kJDv3cXrxfOfoRzdLAK6/cnsF0WQoP8NF1XYbpBJZimW+l4kQvv4esqquARJQ+jcz
         vDKCWsmqDjcH/9Bfb5q6HM1IyFGQpIqjT4OAaU9I5Y7Ae+M7rhDa/l2D3PGKi9W1Rgzj
         RITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5vKFfwX22kLU+bDkkntkUc0V0wt+jMool0fJOroPxrE=;
        fh=kcQa1ov/fnsd0WEpu8SQxracb7Wz7IZn6R6dlMs35dM=;
        b=TqPH5UL24X6FO32Sff2hugynQ4/Qrb7cn1xkiDQp6S/+x5OpztSXAqdGRaCarQ6mpl
         mBgOBAAvyDrsdF67CXJzcVhKEJgaMnFl+vpD6Q5Zlxii9+NpWSA8L2zjOM1fszoiAU3K
         VhKPL57KyYM3HaSvO4YPDVEgYSCNweMYeDBvF7p2rPi8QE0ZS5YW4M73YvVQGHJizMA6
         Iotdfan8Sp9Qk9dCVf68msppv3RPsvHh3thYzmPl+3jxHCLFQVBpuWM0KvayhrYL3b7B
         3I4KR0LWZ5uGAt6+jGHLUwJ/KY50oxP4kv/BWsVVdaR0m8bjRCmS5MqKuVZr38tvvtAe
         +JfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1795759894; x=1796364694; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vKFfwX22kLU+bDkkntkUc0V0wt+jMool0fJOroPxrE=;
        b=ir2EQjigFggO+kY0QpjWye27/g2JeSxqZdQpRTjlOVpirKoK4+iYAUkEOmxADY5ZWQ
         MKoTMFuLwKkgN8V8s+8y6sHNGiRPuzPd2CQe3fCQZ6QTcj8ebOzW0UnvrTiGzhWPtkA3
         DgGcyYSaoTbJGKZUqnjuD4U7j5RyjilLlvlYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759894; x=1796364694;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5vKFfwX22kLU+bDkkntkUc0V0wt+jMool0fJOroPxrE=;
        b=lY8qCEJQCbVgQtmBfBuUgglvBf/+Vfbfx1sAt6P5+xzppeVciidhd7NstJNRpgmXaB
         hgWoUgNmX3XQ/D/dbuS3XfgaAG0yuM4+N32b9o+2JodMMfI/gykXThSk7ctBcfqXNioB
         8UwsNlh/9bKJN3KyVLS5fAsFWCEcSRTZqh/1NrixEm4BGyucdGpANseUXIYFREEMvF6w
         z5OfQku6byZDVekxoTmdTX4HXwboaJ3T76PPmNbOP7PHXy1Ci89hS0yM6RDEhPeDbwIt
         Of2cgY35t5sqTHKopcgQkvjSeYpDdXQgwcsQYLBPG3JDWukTe5ylzULla0QkqcMgrs0V
         E9Ew==
X-Forwarded-Encrypted: i=1; AL+hErEsN8N1gw6WpBxmpKSBd4BXYiPcS3u2Gn29V9SLJZTU3EoGBjiG4UhNSsVawz4/KGVublE/fjE6GWJx@vger.kernel.org
X-Gm-Message-State: APuU4Z/XJIBvOImhi8GDvaDUaYefDUULEfwkl84Qq2jJfksCkkEdC78Q
	u8GQ2xrNO6+1Kti3t3lC0xVbLUIfNwXQGpyAHT63leOQ83fYy0BaikgYuQ66IBwNeHOOjhCUHbf
	Qqtj2qfroVUrl15n3nP2w1tshEJWkEVQ=
X-Gm-Gg: AZFdTZfPt4451h5RLWtMMYUm82A2IbOeNlTrJsVpe0AccxxbMQJ28BWuUSH7zwPs/ny
	jkEVS3oYAd6QwPatEKky0tKMidx8esuPSIrnLgEHDGUYLSn5O3wPE/yifL58eX9QdV1eJsjJTQZ
	j66eqwoRTq4OiB4LquQPksE2XA8W/zqb6CaaGL9Nu2KGHBY9uQzQEZ4LgomDnXS8WDZ8H8LnOCW
	tps9yrWfO3BFe4r2x317Z+OtXfmIQW7sq8Uekg/cObThNqj3nEKjUuEfivzzC+BFiDl1s+yIOmZ
	IAptCtykcXL2tvhLUUe3zmvp4uS6xiFRt87YwcJ3AygRCUbCIwpNBclaW07ORy3PsOE1VofykLG
	NGwBDW2WRWrbfCizAqWgq+G0k1c8/b7ZgjcKM1NB0eHqK9NZ4mkl9SkQgtz+4gLTP7cKltACR0A
	Z4gA1KhnJ926vYuXo+rsCw1+XtGJ0UtILw21gT1OE7npMveKEnSpqmVQQPMOYxy+OZXU2CX5xGn
	5DClmysd16X7g==
X-Received: by 2002:a05:690c:990:b0:8b5:6a83:5e0b with SMTP id
 00721157ae682-8b56a835f62mr24337447b3.13.1795759894475; Thu, 26 Nov 2026
 22:11:34 -0800 (PST)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109051050.105623-1-joel@jms.id.au> <20261109051050.105623-8-joel@jms.id.au>
 <CAJM55Z_zrUjaWrxSqZ=8VWEJqbh_Oa6gTHf=UJZyR2__MCVueQ@mail.gmail.com>
In-Reply-To: <CAJM55Z_zrUjaWrxSqZ=8VWEJqbh_Oa6gTHf=UJZyR2__MCVueQ@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 27 Nov 2026 16:41:22 +1030
X-Gm-Features: Aa3M54oFZihiIV36Dcy6W1EGQUXnzGceYVdcHza3Im8kbnWUM1Yjw7rBqcfA4gE
Message-ID: <CACPK8Xc2oCDV9jeN08mrsGoS222JL3KphheOAp-pOP9_3ee=CA@mail.gmail.com>
Subject: Re: [PATCH v3 7/7] riscv: dts: tenstorrent: Add Atlantis platform
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@kernel.org>, Drew Fustini <fustini@kernel.org>, 
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Nov 2026 at 06:02, Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
>
> Quoting Joel Stanley (2026-11-09 06:10:47)
> > Add initial support for the Tenstorrent Atlantis platform, based on the
> > Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.
> >
> > The evb machine represents an internal bringup vehicle with just the
> > interrupt controllers and a UART. This will be updated in time with a
> > full featured machine once details are available.
> >
> > The chosen node sets bootargs to earlycon=sbi to aid debugging early
> > boot, as the platform may not have a bootloader to fill out the chosen
> > node.
>
> Does this mean OpenSBI uses a different uart from uart1?

If you boot OpenSBI and Linux with this device tree, no, they are
using the same one.

> If not that means both Linux in S-mode and OpenSBI in M-mode will
> both try to use uart1 at the same time. It might work by chance,
> but a much better solution would be to just use "earlycon".

Your suggestion will configure the early console to use the UART
registers directly, instead of through OpenSBI's driver via the DBCN
extension. With earlycon=sbi only OpenSBI touches the UART until the
kernel's serial driver takes over, so the two are not writing at the
same time. If there's a problem with both writing to the registers,
plain earlycon makes it happen sooner, but I don't think it changes
the outcome.

OpenSBI doesn't normally print anything at runtime (unless it panics,
at which point all bets are off), so no corruption occurs. Was this
your concern?

We will keep using earlycon=sbi as this has the highest chance of
getting characters out the serial port when debugging. If we go with
the UART directly, you can't tell the difference between crashing
early in the kernel and kernel UART being misconfigured, which can be
annoying to debug.

Cheers,

Joel
