Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E572331EB4
	for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781946228; cv=none; b=em5+huyrA9jcIEjHi5LNjbb6WSBvApA/YTzuSYIntsZ0kjFV5mR40C0KZEbCOefY7V6xMXPQ5VHbea272/oKkWmALrlT666mmm4KvuLv4Tmi9zxkWYnuwr29phd9zp8+C+TqvsAHBJNxQ1or5PTYxizokHEh1Q7YtB2U+erSJr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781946228; c=relaxed/simple;
	bh=s2B3Es+EqU2cD4MTpv6p/BPR1jeYHzBxcUAjQLNDi/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDrged/mAauAyztxWU4PKwo0qG+30Tovy8y6SDzoQ4hN9FyLZbfn8R95eUXug9jFKKdnrgjuhJsfP3zL+T+3+5eh+wOAQ8byFYsqgcZohOgnF/NbS0JIUzAj946m9WJwY3YldMoLvG7SN+uWlyunCeUTQiWD5rM/PD3ZyZ31/7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A7Ine9cf; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A7Ine9cf"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8454160043aso2145658b3a.3
        for <devicetree@vger.kernel.org>; Sat, 20 Jun 2026 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781946225; x=1782551025; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vnaC9u5H2wJSRqMHidcxYwZxkhPyhVvcFpavNr1emCs=;
        b=A7Ine9cfV8DfGu+Lp9qQuSxB4SD9FiK0ftnO7cmIY+rvl8VZELABvCAQpVtHVIQhVA
         OjEeDciNLFgXL9/9hzO2RWbzac8La57ywjQe3M1eoj7fqC2Vy9rgOIl4236rY8EmdPy8
         jpoGVTU856BMY111bp9tQJLz93dOw4yBBC04Bd5cYAHZJ9aLd1atd+wQZUSQlYeBwMlW
         IuQua+qxvBiX5LmDbCJs+Brk7B4irEo81W7yAzFiUNjYS8oQMPpqfYNt+XYaNPFyphia
         685tsnP+KrQMDyHn4LYdIhzokbTxfEj4+Cn45XmgNBds/xBCNMJ0Qh4EIdNiI8ooaC9Y
         +oGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781946225; x=1782551025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vnaC9u5H2wJSRqMHidcxYwZxkhPyhVvcFpavNr1emCs=;
        b=kKr0BDBSNqfALs+SkC+DbBOZ8ilbMGbCXW64Fun2Ok90j9oPxk8Y17c4zaomxesN5/
         OO7pnmTEX080qCcJtJW9o6H7CmcxiQMyPPnfJ4JFJ4O4cOy0v27IfblwVgttx4BNwQZ/
         G4sZon6scIqXxpngOdFhE/fZeB+wQjT9U4FSl1scV/5fNVB8jfj8h/9UaBfvvj5NRT7p
         GIhRKGvNOlIWBGhVEUjd9kHc2Db7Q39xse2i+C0iCqpYwVOEB5heGMZhpx2pv6/aHSy0
         7K/9hj+cKZJoeqO7DjKxfP2ABM3bM9CJTMXehpKvZxiEER5wz2HHqCa4EiBppcYmuAjQ
         4Ncg==
X-Forwarded-Encrypted: i=1; AFNElJ8OEkp0RgM54PwcIogEDWYFA2irtWqidliobWSFA5UwH3F5S0U4iBlck5CEQCfdVy9wFiOpeYPPlXeV@vger.kernel.org
X-Gm-Message-State: AOJu0YyQYYd7RxoeP8PLX3yoAx224RPxuF8LxPlIsylrskQx0UWw/Q0Z
	+qPX6LiLqLqvbzHXC5yK1AZ+TnH5uEJ26cjYoHv5PSZW3EhtjFbx0lVW
X-Gm-Gg: AfdE7ck8u1oaV1dGCQRvOskO1tjRAFKs5jnXc95TzUm6NhIvWDH407yIw4cRm0PNDIL
	6aDoaTSFhSFX3J0ayijD5hG92Obk9TM8OdhopWjHPejG3YJZUJrUR+r69kB9TUZo2tz+dtpVr3H
	zTHZtNuhK5ma/ZXGFmwT4tEj8jcYuPixvI7JtLg3qbGytS+KJM/pz/6ulDZ9T5Sf/DDCoDNvTeE
	HHf3Vpn1ZmDX6tUvVnJ5CddHWfojgZ5DOZ6B9uxn3VHipN5WdHazpUhMtnmnPc01f/WHl9PQc8w
	LaBWFe6Tda9n5t/tjZowdoSmkl37w8adv5N4bi/jp3r1/quVYefT6HP5IjF4tUjM3c0dFHO+RGO
	1mDh/hS3Gx/qSTpZwhNy8ncK+lfzTnxogDXBpC38Ankd2ux+pRWgkHaTczFXn
X-Received: by 2002:a05:6a20:431a:b0:3b4:640e:f6b1 with SMTP id adf61e73a8af0-3bb32914066mr7723228637.10.1781946224670;
        Sat, 20 Jun 2026 02:03:44 -0700 (PDT)
Received: from localhost ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8bc374375csm1885419a12.13.2026.06.20.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 02:03:44 -0700 (PDT)
Date: Sat, 20 Jun 2026 05:03:36 -0400
From: Guodong Xu <docular.xu@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Guodong Xu <guodong@riscstar.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 1/5] riscv: dts: spacemit: set console baud rate on K3
 Pico-ITX board
Message-ID: <oktm3eodc7xk3cdvxtjudycofa2rgddczh77zz5neef5w2mzzd@sh46luoxt2ln>
References: <20260620062238.3199108-1-aurelien@aurel32.net>
 <20260620062238.3199108-2-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260620062238.3199108-2-aurelien@aurel32.net>

Hi Aurelien,

On 2026-06-20 08:22, Aurelien Jarno wrote:
>Because the default console's baud rate is not set, defconfig kernels do
>not have any serial output on this platform. Set the baud rate to
>115200, matching what is used by U-Boot etc on this platform.
>
>Fixes: 7a6131804986 ("riscv: dts: spacemit: add K3 Pico-ITX board support")
>Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks for the patch.

Reviewed-by: Guodong Xu <docular.xu@gmail.com>

>---
> arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>index b89c1521e6649..509cebc0c9568 100644
>--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
>@@ -18,7 +18,7 @@ aliases {
> 	};
>
> 	chosen {
>-		stdout-path = "serial0";
>+		stdout-path = "serial0:115200n8";
> 	};
>
> 	memory@100000000 {
>-- 
>2.53.0
>
>
>_______________________________________________
>linux-riscv mailing list
>linux-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-riscv
