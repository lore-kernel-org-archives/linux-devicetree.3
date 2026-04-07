Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19D0379981
	for <devicetree@vger.kernel.org>; Tue,  7 Apr 2026 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775591902; cv=none; b=szbw/muP75OPy2d9X4T/pkU0CtVFfWj2WWIZKuZvnERMO04dpP/11dHVzpcw7NAN6nab31k/SzJx7LeVrXALxOMAwSJMQhIqIaQeeh9tLGqJEMTG2FhstILOcWBortWhsCegVN/cAjxrOIpIf1r1QCQaCCK2ez7AvILDtHkNsjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775591902; c=relaxed/simple;
	bh=y4dVmADXE1jrgnpP8JxM8NIiyhlZTgiZlr2F7Lxkn1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4KzVTwKaOpp5BNENoXxm5hXAiBaEOZ5Homs6YIZonq5HhayF7ED+lBBD1rePrL9bzna7Qbg2ezJErbTcpuDN2xnrh+NmTNPaKYa3YtwEen336BNQT5+gLdoA1cqzdN4bLDLyMIR83Qz4jRI1g5gXwg5U8JqLYxSNkyThRh02nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PCl+0Qft; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RyA++f8I; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PCl+0Qft";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RyA++f8I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775591899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1lyCZReF7n3h9ZzIFPxE3qqalSIjCxvP1fRMXtPh+/M=;
	b=PCl+0QftAHAk4m+3BX4t2/KeXAQEw+Vn5GBy+UoTUcBWluvK8cWPqRG/KoqC1/mWOVP/NW
	UwVfWesSCGnqOqMUrZJ2jxu2Uwp/cbTWG5eFv88GVI9aJgUtvPfD3aUGpWVLT/fA9OdgtC
	ay/kW+VGk+rGkazfFgWH+TnUAz5fqBg=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-241-llg5LagQP9KZiiaG7kVKdQ-1; Tue, 07 Apr 2026 15:58:16 -0400
X-MC-Unique: llg5LagQP9KZiiaG7kVKdQ-1
X-Mimecast-MFC-AGG-ID: llg5LagQP9KZiiaG7kVKdQ_1775591896
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cfd0a23243so1968424085a.2
        for <devicetree@vger.kernel.org>; Tue, 07 Apr 2026 12:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775591896; x=1776196696; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lyCZReF7n3h9ZzIFPxE3qqalSIjCxvP1fRMXtPh+/M=;
        b=RyA++f8Ih12FK15i7ABmKwIM+6g6yAijIcCVkmWSpH6uzCYH6Wy7PGrF78VX41wadG
         0Vkoj8tlGPCl8ZQwXYlqdOsh7VJaufUSBK2Q+TsOjcgFTn/FufjmqHr7v84XoE2TjPI2
         eZOmzgcOCrlMLnt9AoaxELh/Oy9uWcaTYEZitDrSXyb+Fpd723fvdJMNTF3W9bPtJ5HR
         ePr3DJPkpxGWIW//Toe+/lZLsh4+2OgqTsJLYHOy63mR6kIULcklAe7tLrR9EimZToC2
         QeO4I9qQJkVLvOX7/ZWfm3TxnfOcsWg7h7zrrmyTbPQBv7BY+01UwdLLKujhjNxTKQ6H
         gzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775591896; x=1776196696;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1lyCZReF7n3h9ZzIFPxE3qqalSIjCxvP1fRMXtPh+/M=;
        b=db9TYJBz6WnNUIoSjjyVR6KuWSqKtrA0c/JGu+geymizE1v02+80GhvQNmO5kKKfTh
         3qiUk/d116bhrkxeBI/LmO7A87texNYPSZurBwth6bBaxqif2Lv4AhOIZEAnjWwdajg7
         YcxxTiT9VyJYttMTUkCyn0+8Yhx/CN6tkiJidO87vVtN/gsRAc+ss0cGToRdjKW5mccC
         GT9W0JADT5slcXlDT7Iu3I7FmnUjanj/Aly0FHyQ3H+Y/b0iI/4Z56uLy2wLKtRXCSSz
         nf0G8zamkOeuzYOsay/tglkDt76J9GfTi+FVX9a9CLwXx3zyFnRu61Ox8kat/cUGM0mZ
         W39Q==
X-Forwarded-Encrypted: i=1; AJvYcCWd+flWglicIvaGtB1uCOW5RuGfwIwBBqFxamSEC5YEgA5FRHOXfuPS1GbpbjCO0aV6y+rpiCzgJrjg@vger.kernel.org
X-Gm-Message-State: AOJu0YyHlscXMNyF+f13E8sAUYr2qLKSPZfKvwFYRRglqqhUkgVTKE5U
	Nu40gvXT3dV5DxevPeDMtsCP9H46VMT4kyHqutE1zwnsK1ZZIORg4rYo5oFnPs+8ZZ7Uk4Fzgku
	mYRpg7g/ro3+FxqkXca4x11B4qJQTaq8heEZ1X8vnLjxpW2L+cqvLyPqABBb6hVI=
X-Gm-Gg: AeBDieueP/fuz97am01EUO1wC00PPzR5SiWWtyBqHXtDzWoLKVCT2Ghda4FjLkfjoTo
	CQznZD4gn+Wyf/PvSd4T02qyJUN8MaU7sd8ErZ/6t+X4n4lroHUJxCkDgqK29oLCj+twXHduGpE
	VbikZwi2ehThGA4uvqxgwmECd6EyQxt40LwTUfpgOo3EXW2h/CL4IBMxp+NtitjC29uAFVz2HXO
	JiSlrXAtfxQrCoKn2VYVr1YQk3lWL5xSz74K1OEmKGfXplGQgh4OcBUWOk0G9XRJaDCrzhErOUf
	WBDuBbkIEjCqr0xy5bgKXDtC+/F7x+ZFRBAMxoXek6zy0Z4jtHt4ICWMfB3sEqZf1V4yHjg2KRI
	yy8Uyb4O+qOLy058/Lns=
X-Received: by 2002:a05:620a:2844:b0:8cd:9653:61de with SMTP id af79cd13be357-8d41e1427e7mr2498364485a.50.1775591895841;
        Tue, 07 Apr 2026 12:58:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2844:b0:8cd:9653:61de with SMTP id af79cd13be357-8d41e1427e7mr2498360685a.50.1775591895273;
        Tue, 07 Apr 2026 12:58:15 -0700 (PDT)
Received: from redhat.com ([2600:382:772d:3619:ed0:4a9c:acd6:3fc9])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8648c17sm1388436585a.33.2026.04.07.12.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 12:58:14 -0700 (PDT)
Date: Tue, 7 Apr 2026 15:58:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/6] clk: fsl-sai: Add i.MX8M support with 8 byte
 register offset
Message-ID: <adVh1JLI-qfXLdMt@redhat.com>
References: <20260406215150.176599-1-marex@nabladev.com>
 <20260406215150.176599-2-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406215150.176599-2-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Marek,

On Mon, Apr 06, 2026 at 11:49:42PM +0200, Marek Vasut wrote:
> The i.MX8M/Mini/Nano/Plus variant of the SAI IP has control registers
> shifted by +8 bytes and requires additional bus clock. Add support for
> the i.MX8M variant of the IP with this register shift and additional
> clock.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Brian Masney <bmasney@redhat.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: Update commit message, align it with the bindings one
> V3: - Rebase on current next, update mail address
>     - Pick ancient RB from Peng, although this may be outdated
>       https://patchwork.kernel.org/project/alsa-devel/patch/20241226162234.40141-2-marex@denx.de/
>     - Optionally enable "bus" clock, which are needed on MX8M to operate
>       register file
> V4: Add RB from Brian
> ---
>  drivers/clk/Kconfig       |  2 +-
>  drivers/clk/clk-fsl-sai.c | 27 +++++++++++++++++++++++----
>  2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index cc8743b11bb1f..9f7f391a5615a 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -255,7 +255,7 @@ config COMMON_CLK_FSL_FLEXSPI
>  
>  config COMMON_CLK_FSL_SAI
>  	bool "Clock driver for BCLK of Freescale SAI cores"
> -	depends on ARCH_LAYERSCAPE || COMPILE_TEST
> +	depends on ARCH_LAYERSCAPE || ARCH_MXC || COMPILE_TEST
>  	help
>  	  This driver supports the Freescale SAI (Synchronous Audio Interface)
>  	  to be used as a generic clock output. Some SoCs have restrictions
> diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
> index cba45e07562da..336aa8477d0ea 100644
> --- a/drivers/clk/clk-fsl-sai.c
> +++ b/drivers/clk/clk-fsl-sai.c
> @@ -26,11 +26,17 @@ struct fsl_sai_clk {
>  	spinlock_t lock;
>  };
>  
> +struct fsl_sai_data {
> +	unsigned int	offset;	/* Register offset */
> +};
> +
>  static int fsl_sai_clk_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	const struct fsl_sai_data *data = device_get_match_data(dev);
>  	struct fsl_sai_clk *sai_clk;
>  	struct clk_parent_data pdata = { .index = 0 };
> +	struct clk *clk_bus;
>  	void __iomem *base;
>  	struct clk_hw *hw;
>  
> @@ -42,19 +48,23 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> +	clk_bus = devm_clk_get_optional_enabled(dev, "bus");

This patch needs to include <linux/clk.h> and drop it from patch 6 to
keep bisectability.

Brian

