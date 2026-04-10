Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB2226CE05;
	Fri, 10 Apr 2026 14:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831524; cv=none; b=hkgzd/RHpLTj/8IE75D89fgyAXiAjfNGKBUqhIINtHfh/NoSpXMxYqrzdImsDB57DRycrGB0hPMKkIdgG0X6bVXoQMFJ9zOcJHCaPN6Rk5CXzquUARUmJ0UE2gIAmEAVatibU3or9/dzWV/jpBmEhCcQ5Z60/52vAlM0xOlC8rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831524; c=relaxed/simple;
	bh=25xPWzxiGr4LHVrhwE7A6wdqd8RHpKmiF28MPO0r6nE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tf7RAHH/UhKHOtnoEom3tTQbY3IVIdgNJGjkXQRdvwxMBMdfeV5d74guGH/1ChiA+4aSs0UBXYSeeNDDXyIt0bMGRJtCpR/qa8GQaCd1A9aZXlZESWEGg1rieA9xDEbRkImEGIG2DUprzJGkNSEsoSBKqdDUWMKpLMlPFpBIyuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tqGN2qeP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tqGN2qeP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA419C2BC87;
	Fri, 10 Apr 2026 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775831523;
	bh=25xPWzxiGr4LHVrhwE7A6wdqd8RHpKmiF28MPO0r6nE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tqGN2qePD9xAh3Pj3AGoPKMZhuIq5LHCILZITbTkgSeoYaOubddRaNn55X/LJ11lk
	 QmJAx0/SG/k9UE2DrIOYC+Na+Y3k7QmSpEo5zLExPRO0OOE6czkClBkwwlcRjYOOB1
	 AK8cK+rg6AKZt+Hh223VAYbYopaIbHmtt7oeDNoU3OH9tRh4ixIM698eT5PcPx6m9A
	 EIq5SQkX26V9rxhPipdu5CctuRM195kmo29QW8uwqLnmSAyAfjxxBg9+z3WUZ2qWsd
	 MpfbWAGNzKcTm+H313Ah+ogX/bDyCwHC5MZUtAAalRhf6Kn3x9SZzWXyXwOL+XLCLa
	 58hOvhP84Xt3g==
From: Thomas Gleixner <tglx@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Ley Foon Tan
 <leyfoon.tan@starfivetech.com>, Changhuang Liang
 <changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v1 3/5] irqchip: starfive: Use devm_ interfaces to
 simplify resource release
In-Reply-To: <20260410090106.622781-4-changhuang.liang@starfivetech.com>
References: <20260410090106.622781-1-changhuang.liang@starfivetech.com>
 <20260410090106.622781-4-changhuang.liang@starfivetech.com>
Date: Fri, 10 Apr 2026 16:32:00 +0200
Message-ID: <87a4va28f3.ffs@tglx>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Apr 10 2026 at 02:01, Changhuang Liang wrote:
> -	irqc->base = of_iomap(intc, 0);
> +	irqc->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (!irqc->base) {
> -		pr_err("Unable to map registers\n");
> +		dev_err(&pdev->dev, "unable to map registers\n");
>  		ret = -ENXIO;
>  		goto err_free;

You can eliminate err_free as well by doing:

    struct startfive_irq_chip *irqc __free(kfree) = kzalloc_obj(*irqc);

    ....
    dev_info(..);

    retain_and_null_ptr(irqc);
    return 0;

Thanks,

        tglx
