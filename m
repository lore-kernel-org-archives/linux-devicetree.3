Received: from mail-vs2-f24.google.com (mail-vs2-f24.google.com [74.125.227.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F544FECC8
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744176; cv=pass; b=s0hgvSievDjG4Ho2Ai7E4YeISHk0gAhoOXaTrDfjTpEYUmLvDiNyXqXKYcjzGH7QnBWoobqiOw+A/6rSLCKu+3dNYV/NYNKDIHZQysiVPiePj91vFeclinTMBqgpsDX0k607yOOrz9/Hnwef4bmfm43BxVAcp9OpWuGZ3rB7IqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744176; c=relaxed/simple;
	bh=Zy64POVp3cHToa/Y34iX2wiBVKCmqoeRskHAltBrV9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BrlBgNatO23fih4u8w7Xf6UvGPuZXmst7WoyrkwtMq9x7QKQV1YsUFvjFDK3SnkdTOlcJXoSoX9lNR54SuSjO09syWzu9RKilTNL2n25nsDHOmReHfOyj8xMK8x23T7uO55MI9lOoDFb/DjrfoDw8dknu2e+4kASZFESBhl/DPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vSXchQP4; arc=pass smtp.client-ip=74.125.227.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vSXchQP4"
Received: by mail-vs2-f24.google.com with SMTP id 71dfb90a1353d-5c97b28165bso727629e0c.2
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 08:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789744168; cv=none;
        d=google.com; s=arc-20260327;
        b=L7PKRDpIcJOffTem4T8ZWWQBPGLy5IDCbq6Sz9JRiHJpy/e+MsvZmmDvy8sJU3oJJP
         Zxd9P3mIxyTcvvOjwQqMc7P3PSvgpjyjAo84VFc+NGpQyy9oDjHCahzhwGw4N5fO8WIP
         fcCyYIaowvTvIvzSsjx5x/GxEUTA0XFvg5ZL0B+i8NuLqaS/WORY00HDFnGObspPbESk
         tPXELLacTJswZqXz+7EbQRz/09svrqbVdkCvRuSv0MCnr+IYkr4DrJQPDxYqbUYypCRU
         YVs8aPFhL1boiPvy2asllMw/PZ7Vr9zsFLbu/OLwq7svsvD9AvYTZMph4la8CohXqvLE
         HLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        fh=U9iZqYsh2x1PLfzyaJdW9NaNbt7a7uY/bhlpMeiGH6Q=;
        b=Re9ljzz8N6YjK6ZcqjCaWHLLBNYzhViwmVDwatpIYiFF3tIpo5CSiufAd4NiMEuYKU
         8qaxCDFCUZbfYXBfza/KWaGMBo4bmBmRRSejnUlLISF3ip5yO9HHwVo5DPLtvD4psu3Q
         WXQ1GLEi9cmOJIl+jrDJLiiQo76c1Yby4GPm73VyxvG5kIqvNKXYafJglso+8Gv1Hvoj
         mZQRihUJm3LbJtFYA/4UxoPfJRjBT1pH+j0Oj2jfprI1nJpkz8OoHuaPuXQLJ6aMsThl
         crdchOV49QA2mFqFddAwipnhJt0b08GXq3irz+HOEIaXkUupJnBOwsTImZfDpqQjXXTN
         EKhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789744168; x=1790348968; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        b=vSXchQP4kSDNl1xzfV7H8dpr9ng4g/JBcRXwjGNQ5zst+1xWLMkGX1HJdharDV698B
         mM7iKVrFaZJg4qO4ajJHvsVmADHPdFjUCRpczL0XO4vzCTrfba7vkyZ+y4aUUl88ZbUi
         bRAjUUxc31R9glBztAvmfuW+3AyzqUcFNjkOwg845c+//f4CeNwUhyZhqrCBPKoUjuvE
         AeznNSjiloxhU84OfHYKw2tJxWF+6Jf1SHaSl8Ra/vmq7at+FVfC2msrlCpPbICRKAdX
         uSfzlN8cIaqH3GiEOdhaaCkyg1L6F2XG/jXvr98ZGzfHMvR5xwxNwtpU5/TxL+tJRBvR
         +U+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744168; x=1790348968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m9PpjDJTI5A4O9GHsrecsFdQCMZtDm/KhMOyyrkdNv4=;
        b=Ea+uDGn+1JAJjazuEYC55hNxpPuvuHltGdiyL66iJxV4+EJUOqTsz8KAE0slp190FY
         330pDoy+o+lYE7vqD+HwHNOg19GN2+zv+zF8KhoNC4/O+rMAagNxa2MGFOS6ZSE/kXTJ
         UKw5iuGZDuhmtjrXIbkcErHplZKZfOyb8kpkMIpLmbuq/4Y1N5R1eTDlW8IS6gRXlD2H
         iR6Pn2YBiAkTYOyzzvlDN2Pz9Lj4UscBXTn79wntihbQ/21l5ielZyUxsIixxB17pEfC
         ssG47TzcGtUipjQBsW492cu2EMlKjwh9K4bMkPMkguQ3OWHeSJxAtgbx/Q/yLjPb73EA
         KxBg==
X-Forwarded-Encrypted: i=1; AKwUvByalsHF2xrb87CozDBJT28xz4X9vkZT2zjmKys1Y31Hyy0s9U/CMntVCB/vi2j+727sMg+ly2IXj6F6@vger.kernel.org
X-Gm-Message-State: AFuF++kavtPDy5FFl/IBjHbJDpIf0DY1CzOtPG2/dbCe7JyWnJPO+yz4
	4J10yXFs4+ZVbfn9LKUS3lh7IHbdoF80RnzgJuP5iGX+kCAAl3YvGEqgOtKGwi2f2auSg7MpkqA
	fCsqOrvJexw+FmJNs83v5DyMSvW3LBj+/l2hdEBPZxQ==
X-Gm-Gg: AYBFou2ykQNHzNo4DoVTVxoa6oz8ky4DxzLbOLw9Wn75IMoMvpDaTKp9KbwK/zRQi7t
	mb5LO/vcYL2HSaI6nd0TpiPhBmRCODqZ4JOf47JucGCrQNZ1/vbJidQgVimBAN5CtRtT2fVp418
	b8lMORICCIDhC8r8fYGLaVoxR08NuqFwH/wqw7Y7PjKiiE9xCicE/PR8Pk7FaV/wdyf8z6XXGFe
	hhmTlDiC63B3JS7CfETBAPd9TChzy7hXfmPJ3zmg4KCxfzf1KgD6UjoS6MIIUMPFMflOdmIqRJy
	zNW96rziW3G1V3zogFX4coD42vCRwM2rsMnWbNiZ4Q+pXzo3OgOdQxqbYXFKqJZ0hvYee//YBM4
	lbMxrCVgce0qGfAaiReKlLR7G
X-Received: by 2002:a05:6122:d89:b0:5c9:a60b:e5af with SMTP id
 71dfb90a1353d-5c9b59d5fedmr1460675e0c.17.1789744168196; Fri, 18 Sep 2026
 08:09:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6108b9d8ba5e750fc3f104c7c47c765cda12ab0b.1788430197.git.geert+renesas@glider.be>
In-Reply-To: <6108b9d8ba5e750fc3f104c7c47c765cda12ab0b.1788430197.git.geert+renesas@glider.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 18 Sep 2026 16:09:15 +0100
X-Gm-Features: AcwNN1WbCgmZ6KBoleiDGX2IyJqTG4BFE69tG3w6kSQzgb-TPyozGD3DKfdtb2Y
Message-ID: <CADrjBPosa6tyVCrEh9vsUoba9tWBbqa-kG2emcu+L1t48QmjSw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: exynos: gs101: Drop CPU masks from GICv3
 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sept 2026 at 11:11, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Drop the masks.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - All other patches in the series have been applied,
>
> v2:
>   - Rebase on top of commit d0298724f901d45c ("arm64: dts: exynos: Add
>     EL2 virtual timer interrupt") in soc/for-next.
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index bfceea5486f46686..9e17f36e1fbb7ce2 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1928,11 +1928,11 @@ apm_sram: sram@2039000 {
>         timer {
>                 compatible = "arm,armv8-timer";
>                 interrupts =
> -                  <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>,
> -                  <GIC_PPI 12 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW) 0>;
> +                  <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW 0>,
> +                  <GIC_PPI 12 IRQ_TYPE_LEVEL_LOW 0>;
>         };
>  };
>
> --
> 2.43.0
>
