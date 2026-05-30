Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EF136894B
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 22:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780178574; cv=none; b=PCC/pPFVqCW14Ig54blT2hRMFwlgU70wAM8+Zx9pnj9hCSK69xfPx8zyKqHAxvwZZo8XYkqyjMvXowb+IKLcJAai303/XrI/T1SHkgNDEpM4yyV483OxuHVWhgUJuJKHViBsIveTtTKtHY9MSgE3Oi+DCNOoR+r6tGfGsyIIciY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780178574; c=relaxed/simple;
	bh=+kFVi5e+KrpIAnBeeaL5fnu0witbNMz2wmBVM/PoMKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTENHwcF42lqtHkQPx4TkA5BVcMviFlaboAVMarU3dmH3lV6ZEQ/TdA6SVFOnTsJ9NtdOZhbu6Jlt/98Oh1N1e5o5mnl5pb4e02HYwOVvd1Qm+mm3zuCbZ6OmsOCHURMeL7fGfLsDaUDDB1ID8+Cf3e8sPz3vM9+ip5aWbBH3sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pd/Oz5ZK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pd/Oz5ZK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-36b8e1760ccso1718720a91.0
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 15:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780178571; x=1780783371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jULRM7QTG3bd40X4f9y14bjufv7DH+YwiBBgZzfKYuo=;
        b=Pd/Oz5ZK8kllBzXhnT/Ir4z9NEbPh3lkh1YTMaVgyOafu7xxuH00bZkpgkmui6bIY+
         hADDHt/LMBNgUClsLfOmXlfvzWbkcKnfNRemy575d1RQO+klXcwCipwP8Ow2tGTj9kAT
         f22iQIhpjYLHPs7RxrdJaZVCmv4OE1EKJSiBj6kLSmznUGkqHXR1oaiVZndb7kryILMe
         UTgUl0DhHRIfK+9a7zGpRPP20KdmgzuGObdo+GQ4zOz3dUPrVZhfb/B8ea8eXvBysQWB
         ik4jwxwS+om4Nnv7jIS66I8axXhVzdXNpuiwPCdm0amOregkynLTebHUx7aHvtzCE93S
         GJBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780178571; x=1780783371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jULRM7QTG3bd40X4f9y14bjufv7DH+YwiBBgZzfKYuo=;
        b=tBnDUaQMpAUbuwhrkUOLRD3XKo2qV3bDDwpcpUVZZhgVq/pIyBmx1TcwEi1GHT/CCA
         KPgtvVU/v5ya0ASUCSHN5a2YHo29sdc3B0yxCZtAs+aoMnIHXYy1r5Jbul8bBLNenURK
         WCWFh4bOFZ/kBWzataNdIi7PiuDMOefiqqxDaAR345H/yQx59EGWKXEME+h9B7ORmKCf
         diLpdZdYJ0Q7vHmcIGE6NoAA39SemizTY3Vs8uWWK59Pd8jpPVENdsFTa9R6SRyeZw5X
         OcDdDdFSvx1ncOXncysQPWatK5t5AXuUwcvilKiLUUpIv9mSk0fdQMDAY8jrUKVkx+kl
         pOBA==
X-Forwarded-Encrypted: i=1; AFNElJ/+T9CxQDZfCyj5kIqPY84Tdj/z2GoJmfe+UZ86sZt5k3t1s2ikR8In9fGt8TTjFXdRBYT9F9S6xp1w@vger.kernel.org
X-Gm-Message-State: AOJu0YxMkfR7O+PTLFTjEhqRfI5WkwLOpbTYlIjDqp3F3Q5uNndosIAZ
	bTgwl2zC4C9u/7XmY4znRjMtbJgfSHxiqpVQssNTka7Veg4ZxqjEun+wzwMuBjgA
X-Gm-Gg: Acq92OGllYXlWUdrbc9vsyfybQ37PxuLK+KSHFA5ZV9V3uoYEZSJlU/SmyvIPonOwZd
	WuzqgnTgaA6VfK6zQv4nZcWrM/eyYI8KtQ0LWWFUCE7ouP0oz5b5pJxnvTZG0gwEFwRVudSrN1K
	2Htt705i4lRxbuBc7E7hBJQwxzza6SaepU6kwUq/sUCeinpWVf8lJjvMPQTWTtdI/ngHt735Nrs
	a/9uYi5cZZW46rYhlBJvSoo+4zbs/ilYmNGWovDkk744ncyy/500o+gjHYPXroMn/8h+lgV0Uvd
	2PnrbcEbHC/VqAmOJwUuhhi/PW9MZbdMLefvRt8hUaQJ69kZvdjxfEd9t31B7mJhyA42Iajmjel
	0MfGWspDUEOM2r437SI2LrlCvBu6pvNYaAloBYLXevgr+Ftji/9wYY8KnAZ2qnIuUT3+oc3WLMm
	ePR++FkQVulIaD5s94neYuHmLexqkjrNpJJQ==
X-Received: by 2002:a05:6a00:8cb:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-8422543dc0bmr4619329b3a.27.1780178571566;
        Sat, 30 May 2026 15:02:51 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84214ce54b8sm5485197b3a.48.2026.05.30.15.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:02:51 -0700 (PDT)
Date: Sun, 31 May 2026 06:02:38 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, tglx@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, pjw@kernel.org, samuel.holland@sifive.com, 
	unicorn_wang@outlook.com, inochiama@gmail.com, daniel.lezcano@linaro.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, alexander.sverdlin@gmail.com, rabenda.cn@gmail.com, 
	dlan@kernel.org, chao.wei@sophgo.com, anup@brainfault.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, hanguidong02@gmail.com, 
	michael.opdenacker@rootcommit.com
Subject: Re: [PATCH v5 RESEND 0/5] Add initial Milk-V Duo S board support
Message-ID: <ahteTfYC5QMlpjF2@inochi.infowork>
References: <20260530173347.33533-1-josh.milas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260530173347.33533-1-josh.milas@gmail.com>

On Sat, May 30, 2026 at 01:33:42PM -0400, Joshua Milas wrote:
> This adds an initial device tree for the Milk-V Duo S board
> with support for reading from the SD card and network over
> Ethernet. This is continued work from Michael Opdenacker's
> v6 series [1] on the ARM64 and RISCV side. It has been tested
> with ARM64 and RISCV64 to boot from an SD card, have networking,
> and read I2C slave devices over i2c4.
> 
> ---
> 
> v5
> - Fixes spaces at beginning of line in &usb node of DTS
> 
> v4: https://lore.kernel.org/sophgo/20260328173450.219664-2-josh.milas@gmail.com/
> - Rebased to latest sophogo/for-next
> - Added usb node to arm64 and riscv DTS
> - Removed sg200x link in commit messages
> - Added missing change to v3 and removed link from v2
> 
> v3: https://lore.kernel.org/sophgo/20251029001052.36774-1-josh.milas@gmail.com/
> - Added sg2000 interrupt controller and timer to documentation
> - Added sg2000.dtsi for RISCV and moved DTS over to use it
> - remove devices from DTS's to match what is available in the
>   default pinmux config. spi0-2, i2c0-3, uart1-4
> - Added i2c4 and spi3 aliases
> - Removed milkv,duo-s from sophgo,cv1812h in documentation
> 
> v2: https://lore.kernel.org/sophgo/20251011014811.28521-1-josh.milas@gmail.com/
> - Made new entry in docs to avoid DTC error
> - "Milk-V DuoS" -> "Milk-V Duo S"
> - Sorting of aliases
> - Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
>   to device tree matching what is available on the pinout
> - Removal of 'no-mmc' and 'no-sdio' for sdhci0 as it works without
> - Added riscv device tree
> 
> v1: https://lore.kernel.org/sophgo/20250927173619.89768-1-josh.milas@gmail.com/
> 
> Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]
> 
> Joshua Milas (5):
>   dt-bindings: soc: sophgo: add Milk-V Duo S board compatibles
>   arm64: dts: sophgo: add initial Milk-V Duo S board support
>   dt-bindings: soc: sophgo: add sg2000 plic and clint documentation
>   riscv64: dts: sophgo: add SG2000 dtsi
>   riscv64: dts: sophgo: add initial Milk-V Duo S board support
> 
>  .../sifive,plic-1.0.0.yaml                    |  1 +
>  .../bindings/soc/sophgo/sophgo.yaml           |  4 +
>  .../bindings/timer/sifive,clint.yaml          |  1 +
>  arch/arm64/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 85 +++++++++++++++++++
>  arch/riscv/boot/dts/sophgo/sg2000.dtsi        | 53 ++++++++++++
>  8 files changed, 231 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
>  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi
> 
> 
> base-commit: 9aa6068586a9b4cd34cf04f8dee72a7283ab4ae4
> -- 
> 2.53.0
> 

You resend drop all the tags, always send a new version with
all tags applied in this case.

Regards,
Inochi
