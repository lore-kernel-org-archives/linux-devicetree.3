Received: from mail-ed2-f22.google.com (mail-ed2-f22.google.com [74.125.228.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D714C6815
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951573; cv=pass; b=ucEw1K0qlh6wQ3WpBsuPq2aNpdFaeA/O8HKI309aMNPIqBs7MVvQTXufRliK/5ZuP+UuO6KH/RW/1vVsklNKAwBZAjatHRmLlqiKd4KXap8DldNi2vhPNLB2r42FDF46D9kbmcTc7ZxDP6Ei6xPTHLXCCfmjMRbGX1xht/LrP7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951573; c=relaxed/simple;
	bh=bZmAl6ztxWgtImD9IPg8gArzLJy06elWJ/9P6bULdpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q4uWWX+o7AJzV1duEp7lyHdBCU44+wjy38YqzsDp6KFzcfEvonsbOCihJOyIu5tG1xbk3CGqWeF0VuPV9T21zfxMj/MaZuaiDzmeH4Tb8O8e7LsMZQP1pmAPznIQL+gIREIWiDCk7CCNjfE+XjX9EsxeH1GMC/2YuiJ1jjZRqL4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ql6oXgmJ; arc=pass smtp.client-ip=74.125.228.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ql6oXgmJ"
Received: by mail-ed2-f22.google.com with SMTP id 4fb4d7f45d1cf-6af7d702c76so2974344a12.1
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 07:32:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790951569; cv=none;
        d=google.com; s=arc-20260327;
        b=CYkIczYlheOGX65hZ5omzptATiYiiAA1N7zYje/PO+/dDe9L/Nmgc2n1CPiwI6cqBi
         U7kL0241eSE385u9lnsos9aByIQbvPFVe3jiLvswnSANN9uNtWi52usS2noDce5E18nP
         7koe7RVyx1EtQ3N0rht+9cKHMIlmI1InLPt8/nIhBbNZOfjR2WphgpQ/fOtcYYFsQnE0
         wNq2xlXuinVkOpcq7K236ZzVfTSs9GKOYRwAAPb+lj0HgNZuAxxT0Vu8XyqkrnZp0jwv
         Cg/gSbA0Oup5QsgaextffteXdWnI00IBD5Ehj3mP+gJ8cF4kEGBBBcGKu+9YwzVSrXPV
         uAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        fh=bGblEhltlxKFa1GevhAjJYbR1790HrDBrxhe39KD7O4=;
        b=knvdxIlu2A5PAKd9GU/+/OXI+K4CKElaxQTvpRoOxne/NDoSp7BD51qNst0YuJ6sPJ
         fZzkGHKY7qYVd5d1DvK8keJ95YNRfrLcQSKtBOkixwSWszOrfjAXMVduLutqx7aZ0stU
         ++bxnxz1NZilMzhQiGxL/17P9AwIJJ7O6+sddKDDw71bM4FiG9q7wDw1vZ7F7o2WIAC+
         gkSGwM3RD/aaSmU/dydipXBbYvdPQ27EKS3G7LGaU0xax5q+PqmuYivpTOunDAvcYidZ
         m9B/ISm6WDtCsWtCcEmQVy3iG4yCA9W1z4X2JhjRxp1CQFQnPwtCKCc4q+Ou7jNyhKh1
         7y3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790951569; x=1791556369; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        b=ql6oXgmJM9iQfN4Vl6JClWkyeDmHrS99BDRebg3wSUSBZ/4Icllt0SjezxKw9fEXP8
         i7rYiI9wU06tpHB1bSFmznJUzwjUir5yHQGypE0QOWL+SPF0x4aulwQh76qe2MyVCFlb
         Zq4c6VcWPj2RRIqMCVDkcnQjKN8suo3g2TlWoVt2GgukMCkh0/JHJqcvzw6rNIoaXcO7
         zYYMf+8pwFF2WTrZPxYCHogXKW42s0mb8FX5FtPN0VkbP71r91+c3MaDYhAVbtNAWP5d
         9vmUYNTz1jlgAsyEKZ/uM/g9IbN/5sgElzuk4zUwFv4F4Ebh/GYLHPeuKDfv8i6Y/3Jn
         ZSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790951569; x=1791556369;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WVZnneXo79e+eMoEqif/HgEGGF2FDvOfyTIiKbvv9fg=;
        b=QL/C6FPT4Zx9RRk7rJMs/gF7hY371asMPayxbhyWFwcv3xf4r+XNwdBN5R8PDQ+b2X
         nppXibJG5zCHcJaQ4TWR+Iqu4jj0hGEhy7FnPuKdG1wXl+z/cOa/RGTB+kq2ca/dKbXQ
         D3RCtkEEnIuADn1UZui4hZiaHKAAyYBjF6kT2EiQW7m2bx4Hah7t555m+ecvp8jhOgay
         zcYqmPxKr2NpC9OT1y4FfjZdIqrNVGDst9a7/Pv6YWgeXEVLkLz49UT7slFhUFLMhza9
         VXJs3EZlZsGGAfrHEM/p04DtQnW0KyljlwQJOB8fpxGHVDCKypcveaKGACSieZI6AIE7
         /6BA==
X-Forwarded-Encrypted: i=1; AKwUvBzoaZhK3nBlY26yYIYS/xSOoOmgesJYnV/cGbjqqX2HQa/TYfscvnUHzjvyLl1Iew3D4OibGAtPM7Xc@vger.kernel.org
X-Gm-Message-State: AFq9FYKG2qfWqYi2cuVkKHOb/1ysGpK0+5Q9IOjN3RVf8ZxNV+Ct5+Xh
	KL4vsyS9pC2IKvvlIHANEUsXMa+3f0R9eqKB+mebVg2xXGysoN9yPMpu8p9zusysLjvaTfT/dFq
	9aYRC8cvPpGo4f/O6zxJ0GuNMd/ljMv0REwsD8SInWQ==
X-Gm-Gg: AYBFou2p5/ejVvEw8BRfDeuiHlomIFipfDAMPxacTKiFzhoUD/h7vsoQvBlhztjyPiM
	euRK8LCrrV8UlCFMqdhTUhq4IDgUdxVi8sYcsCin97UrDcaBAtUgtlfMTZb2P8C3PnLkMNmsHFN
	5aTaQDBYlCgg60yIuN+QchGpz1bE0QDTI+QU6vGTSA7icvxMY4jzLLcS+ffI3+8vUNSL8PgNJ96
	1Y2EQWW1eXw3p/EDp+PMCIiAwUP+fhguh53+ESBmLsH3ixFlmwa3TLKAE8+ibKR7zdTFc/4xNYA
	f9B7WA4YdTXTqPsbNSfM2Ij/82xa921aBDEwTYI6/4wVkopVKM06Il01zuTz+IDNTkTkxoFAI9s
	S0ptuBId7gd/i9A==
X-Received: by 2002:a05:6402:27c9:b0:6af:9dd5:f524 with SMTP id
 4fb4d7f45d1cf-6af9e312059mr1764408a12.37.1790951569540; Fri, 02 Oct 2026
 07:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001-exynos850_adc-v1-0-791b3516bb9d@linaro.org> <20261001-exynos850_adc-v1-3-791b3516bb9d@linaro.org>
In-Reply-To: <20261001-exynos850_adc-v1-3-791b3516bb9d@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 2 Oct 2026 15:32:38 +0100
X-Gm-Features: AclHuK8RgbuTKFPwHvZ2diSbOtgklcZExTKeCVUevkgRzFlX0CzGjFVcTRb15lQ
Message-ID: <CADrjBPpOcpgLeRBYaf=RtLecjBEWK32icf8DcY5d1F4GQJ=WVg@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: exynos850: add ADC node
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 04:09, Alexey Klimov <alexey.klimov@linaro.org> wrote:
>
> Exynos850 SoC has the ADC controller within CMGP (common GPIO) block.
> Add DT node that describes it.
>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> index 8a4771899a8e..eb87225a756b 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -355,6 +355,16 @@ cmu_cmgp: clock-controller@11c00000 {
>                         clock-names = "oscclk", "gout_clkcmu_cmgp_bus";
>                 };
>
> +               exynos_adc: adc@11c40000 {
> +                       compatible = "samsung,exynos850-adc";
> +                       reg = <0x11c40000 0x100>;
> +                       interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
> +                       #io-channel-cells = <1>;
> +                       clocks = <&cmu_cmgp CLK_GOUT_CMGP_ADC_S0_PCLK>;
> +                       clock-names = "adc";
> +                       status = "disabled";
> +               };
> +
>                 cmu_core: clock-controller@12000000 {
>                         compatible = "samsung,exynos850-cmu-core";
>                         reg = <0x12000000 0x8000>;
>
> --
> 2.51.0
>
