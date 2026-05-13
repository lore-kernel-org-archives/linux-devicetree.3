Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DBB3D7D79
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660666; cv=pass; b=ci9SmipT51389iFFqGq2JeMbqozSqlwQWKJL6w4JhPnojS+4fyuPeNKSBXZc/ladZQgpn9kHNpD4/1QzO5GBXyRvx1gRfIQ7woys5lwyDtT8vCk6x0Wawa6X50DrNH74siVweCmNsbfcHjqBP6JoWTZ16MLbokbIcEXkM6Ay3oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660666; c=relaxed/simple;
	bh=kw3dfO5olbdQ/dpmQt0wjjo7jSfh7MCCGfQwYXwybf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qT5dM5Kgr8Maod+UZU/b8XHQa9flT/EtrsrkwSwvm9gyVWiahQdWwW7gqG4OwXBTCYhbK8jPGCOVWJj6D5uXB73EVi4juoeSWEMWJAMGa7/VOjoe6Gnk17Re9fGK9yQ37hPXd4E8bZktETcTIH3d8sRSB52l1qa5rnllwmSxVQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EK2gvQff; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EK2gvQff"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-67e24b8ef55so9186463a12.1
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 01:24:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778660661; cv=none;
        d=google.com; s=arc-20240605;
        b=k3s5o7jCAlT1drDjVtYIwt3RS9MTNnNSYvOiYi/Zd5vNC6TcH1dr24KjIetuOORKcd
         v6ZF2t5FaxxvNxm2/zlT3LOjOvLLw1a1/h/BzTWp58RC5UnDSfyER07LLQlUU0+YwlSk
         F5APfPWMk0fXYzO+8Hv+15EybbWzKNV6L10mFuDYxDTR6dKZWX+gTSWnQoxcHOYqV1nU
         FNn/vWG/D28dx4Z7yagtcL9psTdn/96mJjJEAOBrTrQaz39wVCNSd0tVdurWwnzmIrbP
         OZEueLVjjrAf/zujUjgClXRH1GYi0ugFIm3kAiPTQj/w1chNd5NJQAPsRhX3PkhBglp0
         /Z1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nYSyg8L9M5z+qBtwq1ZJJwTOzPdHBSzFb44dE30H8ek=;
        fh=fS7OccFGA2OoRLH3uABvE2Gs3QFrR/7qPeLmp5K/L2g=;
        b=fMInnILjyZwMFELTchu96SDTDEcrE1osC8nK9tePRC1IHYtf/hhFEF7PPT2aCmqd4x
         Fszexc5AcBBVsRXbao4fkyqkNXiYwwJ+j45BOaiS9BUUQJKKMau5DpyuWRksKmunifWE
         YnbzEVaQeylwN6K6T9HzDdyULkV3u8ZFjkoz6BQyM44iR33FOLK9TyNSPfr5YAVNucao
         gmvyviiFkr7bPIPf4YaWdcTGub7NB+fQzEy5w4DVVSlC5q3SkhLhGodU3RyG0oEE2fp2
         F7bCbKoYbxrEI7FUMLyWZNnXtmb0hw+uJTOepomTmKT4hwYEclIem9ncxRtDw8sDWzjR
         xm4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778660661; x=1779265461; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nYSyg8L9M5z+qBtwq1ZJJwTOzPdHBSzFb44dE30H8ek=;
        b=EK2gvQff8z9Z6Nkp1w7VA0H3njHJGj7ZAugSQ1tGi0UmSWkQrq6cKB2pAIFFLvMto1
         ccNo6a8A6WoC1rlAyrQrdEvrS9ZGfy+8MAKw23ntGlIddIXMTOMIdxWYLwl4CNs/jFgE
         YzZ4hFeg6dSSMYFkxeqrX7CTrUYJTrrx6HxhNkLEsZPuaCpLudaRVldrOEHwWenikXRo
         RJurfGWtJT1l63kco9yDXWj2IIrXwIdaeYYsNNKotvzmDvsH5hBvQEY1mBBk50ZFI6+G
         SEn7W45IBHihJPMLm8iqs+m7La+rCl2y54YfIZmw3NbUlhddcseMOJKKPuVv3oYTHpom
         EvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778660661; x=1779265461;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYSyg8L9M5z+qBtwq1ZJJwTOzPdHBSzFb44dE30H8ek=;
        b=lvbAEqh/tkR3iPwr5gpOsuHYsfrn3q4qtSwWbMxwKwza/yKe6upWa8wGYDF7C6VVxY
         R8Ys/WjrDbmn0QlKQGKqygXaGnvubAl3uUt0YxWFIYz0k6IOToskXpJWh816k1wFfhA4
         Gso9aevIIa6vyIYH9jRWknMeYWi9cvUNtwEJ+r+E6dT17DevXtm07QJSFgjbTkbEzTha
         kgathb7QVGFe4+tOPYXkCZpYfTEEYKXZjic0cUV4nB2NyVRzTNRCux42zYBk7d1sEX97
         UWR3iRql1xatEGaKH4FpcKHy+OdYvPTIKemYiIV9uQkhyxj12LiBifpfG0z/8+QbE819
         AoPw==
X-Forwarded-Encrypted: i=1; AFNElJ/6T8ZWcv6H7sm3aeOJs5DKJ11IFi58/4RYRTyo2ikw9R22s9IX1+cA/qy6Kt4DCJs7up8Gcrqqqpl2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyml8u57FtQdmaPhkSy1HEDQ2vyPCiYB4MSU5jfkVnCWCESwiam
	XP9U4PfP4Nbs+Vi8exOvX9oZ9UzyxvlS5VVg+VCBFbNoiXQJUp9pYSgNHKBOZaZnJOIZpV77nxh
	E4Bat9GxBeEFoWSx0oeBy7oYX70AsfZQ=
X-Gm-Gg: Acq92OGzhUQwiBplVkDptZxbXLKJo253Bj6GLFLQCiov8tu3yGkScMIf0K/3LBnae0P
	RulIJck1M65CfEry//DBd2OAV04vgWfIM0wAd2YMDt4bMjiXIFJsB67admmfl7dVmPgpiSWBBWg
	Ff7l6+NPrKvn5QqFl+aI83mmT62jkPU2c+UvOqJGdw1pBdDwb+z2B1bVEPy5K6mzBidenNZZ7jp
	WnDjwVZpgwZp4njgh5LBuRmsM9LJcazWhD1EJ5BjDP1dMPZ62FQYQjG47Jwsb0d/DkD3N/2+bG+
	8GP8Dg==
X-Received: by 2002:a05:6402:3112:b0:680:c7b7:25bf with SMTP id
 4fb4d7f45d1cf-682558f0800mr886488a12.6.1778660661158; Wed, 13 May 2026
 01:24:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org>
In-Reply-To: <20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 13 May 2026 13:54:05 +0530
X-Gm-Features: AVHnY4LhB6N7LiGPVl7TNwMFIk5YuvTL8zITcPKn8T3qoq1cfBO8XJO_5-DoyFc
Message-ID: <CANAwSgQvGy9LMmHczxUSYDAq+fCFHctR=wbNr1=f+sLTts-9uA@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: spacemit: drop unnecessary power supply from PCIe
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chukun Pan <amadeus@jmu.edu.cn>, Andre Heider <a.heider@gmail.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Yixun,

On Wed, 13 May 2026 at 09:06, Yixun Lan <dlan@kernel.org> wrote:
>
> The PCIe Root Complex found on the SpacemiT K1 SoC does not require
> external power supply, this match with the dt-binding documentation[1],
> Instead it's the sub node of PCIe ports which should add vpcie3v3 power
> supply. So, explicitly remove "vpcie3v3-supply" property from the PCIe
> controller.
>
> Link: https://lore.kernel.org/all/20251113214540.2623070-4-elder@riscstar.com/ [1]
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> The problem was introduced at the time of PCIe DTS first committed to
> kernel, the vpcie3v3-supply should be added to PCIe ports instead of PCIe
> RC node.
>
> Refer the example dts of Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>
> I'm not adding the Fixes tag, as this doesn't cause any severe bug, thus
> not necessary to do the back port..

The vpcie3v3-supply is required for PCIe operation.

However, according to the device tree binding, vpcie3v3-supply is defined
as a required property of the PHY. To align with this binding, the supply should
be moved to the PHY node, and the PHY driver should be updated to handle
enabling and disabling of vpcie3v3-supply.

Thanks
-Anand
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 2 --
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 --
>  2 files changed, 4 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index e20daa50a152..c70081856606 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -316,7 +316,6 @@ &pcie1_port {
>  };
>
>  &pcie1 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
> @@ -332,7 +331,6 @@ &pcie2_port {
>  };
>
>  &pcie2 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index afaad59e6bce..7e5915023eaa 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -313,7 +313,6 @@ &pcie1_port {
>  };
>
>  &pcie1 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
> @@ -329,7 +328,6 @@ &pcie2_port {
>  };
>
>  &pcie2 {
> -       vpcie3v3-supply = <&pcie_vcc_3v3>;
>         status = "okay";
>  };
>
>
> ---
> base-commit: f068b204555ad62d6a841a49feb4ea8c4f45b25c
> change-id: 20260512-k1-pcie-fix-supply-d12f6d50d8d4
>
> Best regards,
> --
> Yixun Lan <dlan@kernel.org>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
