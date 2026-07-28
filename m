Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4A941B8ED
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 22:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785276912; cv=none; b=uJ01zk/2/lM/YXZGh2ueUDA2NoKkXVDOMDPZ23nwOStzootD/XnXC4hFfCvIa8opt/xCLMC3Cc5wbBSlNGbVVUEmiNK5L2UjGUf2uluepOKFyaxDvm0vLOK3TmVmZ0pXXG/RACOpU6qPBjMGFBBTt3JsPKyP0TEATBGOvW/Y+5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785276912; c=relaxed/simple;
	bh=qyGMjhTOnnZPm6V71sYf9uJH6BivSGNSOmxkf0a+A/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ffMxN05S4Ax1S0JcRTIhEcACppc+eaoMUraQa21ar8dYOP0F55cE9qEJVy70QKD2JLLipmglK58HMX2GchhCPPvs73yEIHPzUuFZ4PBoXdc+kq89ma2H0mgZ9v32AW92xNTzJhcCJdD03gqP8b492lNZAx+4sTPqErhux7iWY38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jK8MP/aR; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jK8MP/aR"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc73e322dbso4468485ad.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785276910; x=1785881710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HUzpeU8PWsaIt3wcpet0Z2+r1iwdbUXIMb1YKO4g2Uk=;
        b=jK8MP/aR7HBVA0wgyQ/nMIXUUSnOg+sz+hhYDyv/lM43ltYcI3thYQnmFBbrYjXblo
         63dfZRTdoWtFlm8KSNj67sJXkagXcNUg9SyOAhVdnna38HbMLvIQsEYqodh7xjxyHNaW
         763/uHAByU4yy7rEJODBvK5/ATWfTaYG9K9uKVN1+skbTon+ggx6+a/nIMIXfQ2I5w8O
         2c06MO41EtacIFhwqyCWcilgdQXA/8HIfUxJ3rkOyIQzlFT8FNA6WqCwN9ub/Cp8YUCN
         /JdExVVv7nNkIcqw+dycCYb8xPM5MdA1U+4aX5Q06JLjEZdHcu20GSBWCiaZWKQehiE0
         ayoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785276910; x=1785881710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUzpeU8PWsaIt3wcpet0Z2+r1iwdbUXIMb1YKO4g2Uk=;
        b=ioWxs4rt16KHPPIz8PFsRC9Uq2BjOjQ0iZSizKzZLoBtXFl4qcn2iYCm55wpVm8wFa
         SgM446vcfdJA6auu+KTdMr+oJT0geNsDYLU6onN7XsWsUwXxhrN3UOIiN0XnxRgmAiwJ
         3uv1eL6LFToImXVfoG80vfmU0c+9bZY9q+zV1wsGIc3q5ILqPIwd0aGQIn36jhY0ATiC
         VV3HB2rBezWKcGuZ0hhYN8nVW87sGFrNkzGkNmaw3MlaRp6JrQnUrc/B7XSB6hXEa2Rz
         p6CB7+O344E9I+Nz3QS7XglLQ/lHgvBMGzRj1a5VBDK6WySPvc0vVC6OnnNTGP31FylR
         NvKA==
X-Forwarded-Encrypted: i=1; AHgh+RoBFKEOQgfTJZlLmmMXw1/zXIkXYsTt/tlN6g54S327zZupUB4ypx+uu07rKQa44a0yUmYyEIsWbWT5@vger.kernel.org
X-Gm-Message-State: AOJu0YzIKexXifj4r99NrRXGi9nKo/yyU5Pr3bdurMtO8qei6CVVDaCZ
	whLZHSw8UCJDtUOO1rUyK+BEVdD6TjExZZjqyT93p44qJ77gzGqGuNOl
X-Gm-Gg: AR+sD10VXUo9HeAiCa8CGZMVpnzRo3pkMWor9+qzN+RWyigYK4CIqmCe5JzK0WwyESF
	MXmLSVNVHx5KPxU6AqlzMZj3EM5aZAPlUBYm2J5OdkIw9CPyiHZj5urKf7hWVeCT4BvDnod7+NR
	Ald5ZVY2qwZpLZJpAGv65CkHHJTD7/HjCfprRSLAc1DefV/LJvIL0qXKWfftpo23f9ZzwalSWwn
	vbjC9HpHX0xtJfo8TuDrJHxA1HJlAppr6QzcZJRkhuxJJ/MXC4sHUPxIVxZpoQsGHmV0/IWI31d
	4rgKqtwufIPaO47xYe43SXeSy3HZKvOv3aOcAkZGPpOtWUjc/gJncls1RU6KhyVx5PTNEbTqDkH
	Udh4bCqONBYPbaGGwqoruvg6IEeFvJDqqYmhU2pqsH3nXw6M3gntFyEybyhNKwY2/Pu+teRl/yO
	XpcctPh2vHwd0fLDRR7ERcsDO4xDHENXbt5sDFIfXnKijKgPO389CGkZIAhXg=
X-Received: by 2002:a17:903:4b46:b0:2cc:a853:1311 with SMTP id d9443c01a7336-2d015eddc78mr55167005ad.47.1785276910228;
        Tue, 28 Jul 2026 15:15:10 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a18abasm2246025ad.5.2026.07.28.15.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 15:15:09 -0700 (PDT)
Date: Wed, 29 Jul 2026 06:14:59 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Guodong Xu <guodong@riscstar.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH RFC 5/7] irqchip/aclint-sswi: Add generic
 riscv,aclint-sswi match
Message-ID: <amkprTVtjkRVEo7G@inochi.infowork>
References: <20260729-k3-aclint-v1-0-aef88614d3a5@pigmoral.tech>
 <20260729-k3-aclint-v1-5-aef88614d3a5@pigmoral.tech>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729-k3-aclint-v1-5-aef88614d3a5@pigmoral.tech>

On Wed, Jul 29, 2026 at 12:36:31AM +0800, Junhui Liu wrote:
> Add match entry for the generic "riscv,aclint-sswi" compatible string.
> This allows future SoCs with standard ACLINT SSWI implementations to
> directly reuse the driver via the generic fallback compatible (at least
> until hardware-specific quirks are identified).
> 
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  drivers/irqchip/irq-aclint-sswi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
> index ca06efd86fa1..2bd40c3ea288 100644
> --- a/drivers/irqchip/irq-aclint-sswi.c
> +++ b/drivers/irqchip/irq-aclint-sswi.c
> @@ -179,6 +179,7 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
>  }
>  IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
>  IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
> +IRQCHIP_DECLARE(riscv_sswi, "riscv,aclint-sswi", generic_aclint_sswi_early_probe);
>  

Again, use vendor specific name for irqchip declaration.

>  /* THEAD variant */
>  #define THEAD_C9XX_CSR_SXSTATUS			0x5c0
> 
> -- 
> 2.55.0
> 

Reagrds,
Inochi
