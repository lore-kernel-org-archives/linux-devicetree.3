Received: from mail-ed2-f31.google.com (mail-ed2-f31.google.com [74.125.228.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879231B6D1A
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 12:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790944916; cv=pass; b=l/QRypXuv21LiNc3Hao2TGp7vOySBGmrtxGby4aO3gaoBeYlfNsYOmhMwB0fK/TuEVCbePt2OcfqPE8cjLtD62if9p21VlnKvVc2ugtP2UnxX0r1EMk62l6QOhA+ntqNke04tqUgFNVd+bvEsmPqZfnYZByKAb6h0H1lWOgqQ/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790944916; c=relaxed/simple;
	bh=ReEVztyiOkfCn3qjc+8FH6TucXrc4+FPvzJFCPedxsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nsV/doWT1vc3xxfnE9/v/R2yp0/36V55JRUpE73uFMNDFH5OVocmHJ08P95eWwGmwcpv2RWWEaH1GO94sGIFjlhixvkixQ6Cfc7++9PicYK4uj7jV6e0gQk/Km14so6nr3BFJrV7gxEI2BgLCr9+uD3G4un//ZU9E6M/n/hdEGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vjlpyWRk; arc=pass smtp.client-ip=74.125.228.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjlpyWRk"
Received: by mail-ed2-f31.google.com with SMTP id 4fb4d7f45d1cf-6ae7aa02cb6so2784270a12.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 05:41:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790944913; cv=none;
        d=google.com; s=arc-20260327;
        b=JuZDBRTrL9H6A7QHGIpYoqn6T03/Hj45sbQdsYuj7kofFkwguvCY9azdfI4R31et4k
         VrUwfDHlOs6UIlqmtgxQnpc076m/2puD0WXSDIihvf7QBvfU7/cL5FpUf9pPZrLy8K/a
         vLMphWDARbAgFGUxICz/HFKlnL0NLdaBq8pcVj6bR8WeT1R7zA+CY71rSGpvY3Hbhl3Q
         gsHis4im95UMdYiqgzCVpuooYnC/NOQLATPlRpb+Z7gBdXXQGQy5R8bFrUgt3a3QjPca
         iyUw+gpXKLqXI9SsLQOq11FZxxUx77Ud7YJsD/UhUHfcEgx/xhcY/t2TBOe3MfxFtsfS
         IpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        fh=+8he6qrh2G8esShaveojTrg9Cn61mOEdIjb3F8+7Bls=;
        b=e4NqwGTwC3lPXJEQEC6rvj/PhTG0oBdKeeB7cLowE+J7tHJlIi9q8CdTIlUjay6KuK
         +5zQRG1oWUFOXDqO3BuCY91M4lkw258/YO0p5yrM8b31EyuXfx0n/ZtGMCENWlCTEbLS
         ZojXpzozOiQ3Np9pHfR+f04R+ii50M8cyGnlQZiRhwNdsbVaysQXrX8dOESiEJjWJ595
         FdBxmUjWCGzcneLr+HsmF9UjAn2CzxdAeb8jOBdnUmqtuSFmmzDIHYNGxQSvDo53OTMT
         Tax3WlrfBs7ahAKIyf3fBkgU474pIVjLjojLjYFvjNPnRqDmNZNWP+htoE/X12l2mNav
         btcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790944913; x=1791549713; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        b=vjlpyWRkZCPBNxjAqMUuYusyAC6TId2L+XvQXhfT2MkCFw+e9pyd0tamIyAax8t7xX
         C4MUcG728fTJmuEagPY+cGH1qKOHh0ZFd4JApdus+7cJOPwQbuzhLy0A8m9e1JFX6ngw
         URErfVHA5TP1nPDVE8QLTrl0HhAiVRwnYedXrmgBifNxUPD7D1/0Lrth4PyIzRwSu6Vy
         Ft6lU+oKpzugzc0Rx6rFXXPt9spBPjRl59pTSWc8uJGszWFHGrtou/g3rBYVd4Pzn2QV
         bN5E6NDbVnNF2h6DNbSwgEq/mNHJHx22OO59/09F26+B2E3dovzXKMoVALH7Ds3bJyEG
         dBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790944913; x=1791549713;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=plQYNgLxbF2e7nZsCy1YGDViTw7GlGDjjOk8UAdqcgQ=;
        b=vh6Q7BUWFsd25rmET/wsULL83WoqWLm8TNiwWypM+9eghmOh30CUemK3SoA6NHXCSj
         jEFSq5XK4EE31UaDX7mBu3kkMcJF8i4ijcQltC1Sxi7SwKk82g6Kz+vS3b80msEo30f0
         cj5NsPNSIFJ1uAXZApmEuVQS/um2WBH+NVDONw9+eQB3zxZJP+qioXCWterGNrKwBHQU
         m1hJhodt7Xmfu6G8c9ewDWqKZyhIYhWRnw5XMFGfaW516TXRgzHk51PpIoYKsaDWT3cx
         BU7YLmLJiNl8mfWwrt/seLc1kiEZvVOUUbdG+8swp6BWWqGZP7j0udX60EDxOWMwfqmB
         vzHg==
X-Forwarded-Encrypted: i=1; AKwUvBxPtCGxdt6b/ZlgASRJWl+wx+iTmEj0a+c/j3ldvSw9K5xcdJBBTeFctslVE1dthm98gC52nP5t/1UR@vger.kernel.org
X-Gm-Message-State: AFq9FYKlgHZ7hX2oTHWRCEaGjjod64MCLpvdrm9fAzSItbAhjYjOdnGT
	EcUZc5/XqqwGKWhDBRYSBBYsCi6wDcEq1lCbhNT7b+hfZFd0vSR47sHHS3s1cmhhkEh/umW76ni
	YZvZrZQJ/NiVaF9oAM0tPiq5/fLOCgkOUu8PU+ui7+A==
X-Gm-Gg: AYBFou17jVGjZObag8LSnHraZEtH/HcYzQn87OSuD3KBRm5XfDEZ2Dhj9GG6p8LG/cL
	Joskw1Tb0CNf1t2FF2FVlTUiB/qfmBBbCPETXC//CvZqO0XALcZwek7A5TEmpSgdgXZfdH1DY8W
	4IRQWH8SmGrSvoWjhUdbXi4224Kfnt5uZ+6u5H/eMxH1QqFQlVF+oZLGCGtGsAa2Qjj01QrJFzO
	4Jt5YwCTLl70qek/yhWoQ/0xbjxHc1sgEvTwCW/2ZYYEb+E/DIjwqN64jxlpOlq00hzSY5WDVNQ
	jIqyLnHEHPtXAsX6PUY4is9KXgP+h3UwKt698JPNHTlJ8d1BeLC4Q0urFFvvi5uC+IK+cJoN/zt
	DFDLkYrTI1r7edg==
X-Received: by 2002:a05:6402:5113:b0:6aa:f1d2:ddbf with SMTP id
 4fb4d7f45d1cf-6af9e335ebemr1728168a12.35.1790944912779; Fri, 02 Oct 2026
 05:41:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org> <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 13:41:41 +0100
X-Gm-Features: AclHuK_QyQlit6GQkvv90porbL6_8NAwZ9GwGxUXMwJD_qPCIZbSMtNOl5zyftM
Message-ID: <CADrjBPrm0o5scen0vk2ZiCzGW6kdTWsciPvA9K7JW_yb+Mp8PA@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] arm64: dts: exynos850: add PMU interrupt
 generation node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Henrik Grimler <henrik@grimler.se>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Alexey,

On Wed, 30 Sept 2026 at 01:13, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Add pmu_intr_gen node for Exynos850. This hw block is required
> for different power management routines like CPU hotplug and
> different sleep and idle states.
> Also reference this node from main PMU node.
>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..803fc127d895 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -231,6 +231,7 @@ gic: interrupt-controller@12a01000 {
>                 pmu_system_controller: system-controller@11860000 {
>                         compatible = "samsung,exynos850-pmu", "syscon";
>                         reg = <0x11860000 0x10000>;
> +                       google,pmu-intr-gen-syscon = <&pmu_intr_gen>;
>
>                         poweroff: syscon-poweroff {
>                                 compatible = "syscon-poweroff";
> @@ -248,6 +249,11 @@ reboot: syscon-reboot {
>                         };
>                 };
>
> +               pmu_intr_gen: syscon@11870000 {
> +                       compatible = "samsung,exynos850-pmu-intr-gen", "syscon";
> +                       reg = <0x11870000 0x10000>;
> +               };
> +

Since you are now creating your own custom regmap in exynos-pmu you
should drop the syscon compatible here. That should avoid syscon.c
ever creating an MMIO regmap (with the wrong spinlock). I've copied
some of the commit text from my commit
a21d38b5e209c60e73f81e467cc53ad57b5d4080 below for the rationale
behind this.

   arm64: dts: exynos: gs101: remove syscon compatible from pmu node

    Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
    "syscon" compatible") it is possible to register a regmap without the
    syscon compatible in the node.

    As mentioned in that commit, it's not correct to claim we are compatible
    with syscon, as a MMIO regmap created by syscon won't work. Removing the
    syscon compatible means syscon driver won't ever create a mmio regmap.

    Note this isn't usually an issue today as exynos-pmu runs at an early
    initcall so the custom regmap will have been registered first. However
    changes proposed in [1] will bring -EPROBE_DEFER support to syscon allowing
    this mechanism to be more robust, especially in highly modularized systems.

    Technically this is a ABI break but no other platforms are
    affected. Additionally (with the benefit of hindsight) a MMIO syscon has
    never worked for PMU register writes, thus the ABI break is justified.

    Link: https://lore.kernel.org/lkml/aQdHmrchkmOr34r3@stanley.mountain/ [1]

Thanks,

Peter
