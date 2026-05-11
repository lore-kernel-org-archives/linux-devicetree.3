Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571AA286D7D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512923; cv=none; b=QNCvDZ08329bTUnGV13NM3/owtjRXoa2wkBm6KitmjZ+ltV4VL2pkGAt+FQDNtP2eG87JEgtP7dMcxLvIH/5ocKJYPLg92ae1+hyrEIPcxtJHZKPZIv1JurWcwgARKepvLojFjDtaNzDYzFON3kMfi2W8UxlSaRFlZz9TC3RDu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512923; c=relaxed/simple;
	bh=JcObBeha8Q7lx5nQxRfs8PB5PmhguEGDFefL6Zg9qz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ut6WTkkIjiOQaCyw99nAqghqx6CDWURW+RwE6CWLBvCJbkLIsnaGYuO6xkOT1hzl8Mb00pOoi7ub9uslWq9qyZ6qNjSynS7p4nPg6DyD5tDjfnV7SyYCua6zMkbfkbtgWqmHjCVKp+WedbIgpAMf/KSjLJzP0xwDjgyCn6vpTpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Cs4Q7JZH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sMNBW9Bp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Cs4Q7JZH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sMNBW9Bp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778512921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XYpKAqWBddZNFYdvjfGx2qHtXBFJg7fbXWnk9+t0U8A=;
	b=Cs4Q7JZH8uqPgnNJrVI55Dk1K3iG6zMfv7L05tkQRDq9Djm6VyWhcZ61JpddAgbK8IX9bh
	rcGTLOx5NKSrFHw1raFtrJOjcmYGVhw/M/zND43jgKvd7R9YPEMO0xTh8x9p7PRjVdzeVI
	TGl+7JRUED9p3/xdfAgiDG7z0RqWYXE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-493-9Xld3bEIPkaJEQ3zrgTHdA-1; Mon, 11 May 2026 11:22:00 -0400
X-MC-Unique: 9Xld3bEIPkaJEQ3zrgTHdA-1
X-Mimecast-MFC-AGG-ID: 9Xld3bEIPkaJEQ3zrgTHdA_1778512920
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-514ae0e3ad6so44001031cf.0
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 08:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778512920; x=1779117720; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYpKAqWBddZNFYdvjfGx2qHtXBFJg7fbXWnk9+t0U8A=;
        b=sMNBW9BpT80NoOTrbJupTFuxhZMcMgT94ZGDUEzSZ762JCKCqCEUxqNSfUvAdh/yCu
         RHX+j+UqU5fG/WckGI6IvS/5gLCFhCnY2EJnKevWXt5B/Ozaez7hdKpc7YntK9+doV94
         Ykfq4Vg+qoBftm11F1KkRB0GbZG/gKVT10UMZxxPKmWgHk3QYeHzO3hQnuAFdlp1TIia
         VLI88G0sGtvYWKyMyy3M3eLybeAsDtY7xExWrGMyPTjwQcrzFIOzOIm6EfQMWCnclgF+
         PbGVFkBSB4AIfUnbRgLJNW4fUqrKVz0d1+LPYwzGjThykPjS+sEVXb4kPgKRDv1Cj95r
         m2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778512920; x=1779117720;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XYpKAqWBddZNFYdvjfGx2qHtXBFJg7fbXWnk9+t0U8A=;
        b=KgHY8uVb9glcCmOB/itxIEegVJm2Ol61M0rJnhHoFm9tRWzdoYJXrYBK4Gwx13VFy2
         HHGjE51vfXMw5XUMW6zQ17s8rlIiImDIm90rz2fiypK5T6PAuiV8XDHcUGhRLqEQSIFo
         LoeoWQDigCIXDl1BDJ4ZHkcIKc+3J7UcyuVG3brSPh1/iU+scm2A3jJGRQ7hRXn6V/JP
         1dztorO8kybuvtswtipCrDB4cB6JSWzaVf6kJOSKInzxdMBMwmQdJFtN3cIj3fGct41m
         E+uPtWOmHjAVN/dS/emRruTkjFqY5dxnwVUWvwdb5gRcd91DZtQy9VN9P1dvlsmdE64P
         LOnw==
X-Forwarded-Encrypted: i=1; AFNElJ+NGn2Y5sg9TDYseBmxzfDAebKXsI8FtknQ2fvqgeVgG1LFPlic8uVwqwNN9PMj4b5xmf7yrYUUeN7W@vger.kernel.org
X-Gm-Message-State: AOJu0YwWD1ApWNvJpmp7WX82uYd2NQoKrRry/HQoHgRR/853gNIqsLr6
	o+uiMRObtKTgpjw0bid9BgXPNL6QahiOy3bVsKzNkIAbwnJJAJDd91hqtKEeykgFi39DIDRi7nJ
	k4pLgznW4wba0zPqKRHTYo10VdBE/8tiFIgW6UHFkYlGkoZmW2VkdPupELH26ZRU=
X-Gm-Gg: Acq92OE/nyd/QZpW9sTE/zR1BKey//5vfeEvNiHjlbtQnc17lhQTllE01AVlEiYPcBC
	zZFVNb7ai7UHARn0XpY+TO94YeL+JpbGu1dSmompCMaf0gsUPA+B8KSgtyOk3STsf4NFkAIixvs
	CFHUsJUDG2uEMSaxr2JVmoAgb+ryivY6doTv0s6gNDKpATgVYekzECSlOparLY00z7FiVmJiqBc
	qKQf5/dhuWIKllanSpxffCpDz7dRFp5kyb3lFsx4mKQax8AE9a1p7xY3W7KZPKo2PmzrDQcRoCp
	L/+1MefGpsz8GR63oOh/bLfBFGl00CciKswX4+O+9MBfiZET6pb63hj2AgZmHrg/AN73DAhIykJ
	JYZt2qt9Difxvcac2qpzb914YIGp0JCmk9onaS+nn2CHLePd+MnkokchNMIuKfCr80yw=
X-Received: by 2002:a05:622a:19a2:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-51475b74192mr224792371cf.16.1778512919719;
        Mon, 11 May 2026 08:21:59 -0700 (PDT)
X-Received: by 2002:a05:622a:19a2:b0:50e:2ebc:1cc0 with SMTP id d75a77b69052e-51475b74192mr224791581cf.16.1778512919063;
        Mon, 11 May 2026 08:21:59 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf3a906e25sm96450396d6.14.2026.05.11.08.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:21:58 -0700 (PDT)
Date: Mon, 11 May 2026 11:21:56 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] clk: amlogic: PLL reset signal supports active-low
 configuration
Message-ID: <agH0FMzku3QRlB50@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-6-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Mon, May 11, 2026 at 08:47:28PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> In the A9 design, the PLL reset signal is configured as active-low.
> 
> Add the flag 'CLK_MESON_PLL_RST_N' to indicate that the PLL reset signal
> is active-low.

This flag isn't in the patch. I assume that you mean
CLK_MESON_PLL_RST_ACTIVE_LOW?

Brian

> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 42 +++++++++++++++++++++++++++++++-----------
>  drivers/clk/meson/clk-pll.h |  2 ++
>  2 files changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 5a0bd75f85a9..8568ad6ba7b6 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -295,10 +295,14 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> +	unsigned int rst;
>  
> -	if (MESON_PARM_APPLICABLE(&pll->rst) &&
> -	    meson_parm_read(clk->map, &pll->rst))
> -		return 0;
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		rst = meson_parm_read(clk->map, &pll->rst);
> +		if ((rst && !(pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)) ||
> +		    (!rst && (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)))
> +			return 0;
> +	}
>  
>  	if (!meson_parm_read(clk->map, &pll->en) ||
>  	    !meson_parm_read(clk->map, &pll->l))
> @@ -326,14 +330,22 @@ static int meson_clk_pll_init(struct clk_hw *hw)
>  		return 0;
>  
>  	if (pll->init_count) {
> -		if (MESON_PARM_APPLICABLE(&pll->rst))
> -			meson_parm_write(clk->map, &pll->rst, 1);
> +		if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +				meson_parm_write(clk->map, &pll->rst, 0);
> +			else
> +				meson_parm_write(clk->map, &pll->rst, 1);
> +		}
>  
>  		regmap_multi_reg_write(clk->map, pll->init_regs,
>  				       pll->init_count);
>  
> -		if (MESON_PARM_APPLICABLE(&pll->rst))
> -			meson_parm_write(clk->map, &pll->rst, 0);
> +		if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +			if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +				meson_parm_write(clk->map, &pll->rst, 1);
> +			else
> +				meson_parm_write(clk->map, &pll->rst, 0);
> +		}
>  	}
>  
>  	return 0;
> @@ -363,15 +375,23 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		return 0;
>  
>  	/* Make sure the pll is in reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 1);
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +			meson_parm_write(clk->map, &pll->rst, 0);
> +		else
> +			meson_parm_write(clk->map, &pll->rst, 1);
> +	}
>  
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);
>  
>  	/* Take the pll out reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 0);
> +	if (MESON_PARM_APPLICABLE(&pll->rst)) {
> +		if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
> +			meson_parm_write(clk->map, &pll->rst, 1);
> +		else
> +			meson_parm_write(clk->map, &pll->rst, 0);
> +	}
>  
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
> diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
> index 97b7c70376a3..1be7e6e77631 100644
> --- a/drivers/clk/meson/clk-pll.h
> +++ b/drivers/clk/meson/clk-pll.h
> @@ -31,6 +31,8 @@ struct pll_mult_range {
>  #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
>  /* l_detect signal is active-high */
>  #define CLK_MESON_PLL_L_DETECT_ACTIVE_HIGH	BIT(2)
> +/* rst signal is active-low (Power-on reset) */
> +#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(3)
>  
>  struct meson_clk_pll_data {
>  	struct parm en;
> 
> -- 
> 2.47.1
> 
> 

