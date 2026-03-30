Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95743A75AB
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774907533; cv=none; b=P5j8h7sFm6/8O5kAviVbI3xD7z+7namZUdbgla7ZImKhL7jQfI5UTDo905PkjA23wfsJ19fqFWynyzxt04X5JZRE+n33Bg6hUMgR+5z2bTw/T7kRgjbvCc0g9HY2Ixu8IBM5dj/Wyc23p94NlvGyE7iklpJLOY/kPodMW1aZSLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774907533; c=relaxed/simple;
	bh=zXRnSa3wZNgCdun5zEFhGnhl0i/tF5ePM3IfvpJgix4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqFW/bj1ePcsbhbdIm4gyNtOqZ+RUogQbw32lqVNFJQ8q1qN4PYejweKhJh7NvpL3NpRFxHshpz/CBSe5Cmyq+nMOotNfqIiXwRsEiWWIqvHwieVqBIMH3xPsg7Z+QyxWVPln6lYxomIO5j4FqQWdOT3Zn9u6M3Iy43Gyxfp32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZla6/Jg; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZla6/Jg"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-483ad568d68so7121995e9.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774907530; x=1775512330; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i9VtVxRJozztTdXG3B3HhY7EDhQNxzzr8H6rdGSXE0o=;
        b=TZla6/JgnwAYvc8u1HrMNZXmiIwlfgmUib2ABSaYcDzWjsbBVeMLTCRGs12TYJr8O2
         4owFmphj41QggvLaKIhb2oqxSdqAUuH/SDyO3GQPICvq+oDFAo2zcQGHwMNW548ykWrq
         FLNC954pcjUECYFf/J+IIEAhiuavfIIWrbdrVkcKxkmfAdEiyPVio1o3wQwugsHl8nSI
         p0NZSXyu0agDesLr6bT/Cs7H3HBIVGrl2z+1N4mKXj3tHhYwnmwBBDH/rajly6UrUo9K
         JX5qIy9LWd2Xjp7L3la3vYZfwxzDGkpe33T4A0G103beRwjDGdFqO0FpBBEA6jHdeEC8
         Z9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774907530; x=1775512330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9VtVxRJozztTdXG3B3HhY7EDhQNxzzr8H6rdGSXE0o=;
        b=HmmF3qwxhXcNyPILaAj5pgta/DjUyOeQWU0rCgW6Uravsd85K2gKYsG20LkUj62ilO
         qmKOwZBrP7DgveIgQGCyWuBXlOb2ppBTBlxumFe/ZHHwwDa5XDT7seatkZnQi+pltMZV
         n8mLurF6xbRBku536Q/8vIhobPlAnRlOhJce0pKZ8eO006TJMmyV1cPH5mC3ActiMIYT
         jK5AxnKLXf9k04fozLLvu5AObcGeAGU5as+5afkbmEpVpCERZ+K/V2dSy/JpyHBxRXwH
         fh7MN3MRGwm98rpz3e5XTpyLLODO0AbSFNnfkBk4cDEZAIgIopYH71k46S3se6GzVhrJ
         hYHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNzoay+v7ImWFLjBbauuSS7pIJtP7tav9Nltu9u+IMS7+toQftxQbD+oYVU5lbHdBGNWWiglluAGYT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1RsPhqd1E0CTmfpY+Gs7Nu8MJIvnaShd9KyK9LB3r/6InsgzL
	NPQueyfutS/cbwVBAzC1CqVha4lpgvYKYV6bJWln/iufMYnOTHo7teIE
X-Gm-Gg: ATEYQzyhvtYVcDFmh+7wxH2gk1OWsyoeFFKrbxEqOrB6qm77ZscxNdcqdar1FF8GEfD
	TGFIbHDGUmTrFB05gpCcN9a6v+BJ6Ts7a7ai132mWYHzGrFXGuAAqbqDFXbe3DCO55qJ/DT8GY0
	ElxDtwO7D8TU885R3NqIPzSs2Y+wWXT2YsCqjlzQM9qvAAxlxDjTOPdzjpyzShsOBWk83ZtXXfS
	CRoGpkL5LWMJXOx/Un2ZpUO4zLWm4oOUEHNXuu8+RMm/m0yQsSkgA0GgYqfObf++JQFZprlu6KE
	c41aKg90YzBXNgAvbYvpALl8DeIIXK23FPVXJVGq3NtHmyuP5brklVeoMj6JCANemzsg5epI6wN
	3UP5E+LHw7sJy7fhy9yUe06/+C+FYQXPh20ylHrB+cPY1QnRSKhlQRxetL230HqzafgClczUy4S
	g+X2iNYNI+WKo1getugn3vDoRauQ==
X-Received: by 2002:a05:600c:1d1e:b0:485:385f:674d with SMTP id 5b1f17b1804b1-48727f0e5acmr122902805e9.8.1774907529964;
        Mon, 30 Mar 2026 14:52:09 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d50a:b400:fc92:d05b:3301:b722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887ad2b379sm3209085e9.4.2026.03.30.14.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:52:09 -0700 (PDT)
Date: Tue, 31 Mar 2026 00:52:07 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] phy: realtek: usb2: Make configs available for
 MACH_REALTEK_RTL
Message-ID: <20260330215207.stx6qbjr7kctm4xt@skbuf>
References: <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-7-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327160638.15134-7-adilov@disroot.org>

On Fri, Mar 27, 2026 at 09:06:38PM +0500, Rustam Adilov wrote:
> Add the MACH_REALTEK_RTL to the if statement to make the config
> options available for Realtek RTL SoCs as well.
> 
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---
>  drivers/phy/realtek/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/realtek/Kconfig b/drivers/phy/realtek/Kconfig
> index 75ac7e7c31ae..f9eadffacd18 100644
> --- a/drivers/phy/realtek/Kconfig
> +++ b/drivers/phy/realtek/Kconfig
> @@ -3,7 +3,7 @@
>  # Phy drivers for Realtek platforms
>  #
>  
> -if ARCH_REALTEK || COMPILE_TEST
> +if ARCH_REALTEK || MACH_REALTEK_RTL || COMPILE_TEST
>  
>  config PHY_RTK_RTD_USB2PHY
>  	tristate "Realtek RTD USB2 PHY Transceiver Driver"
> -- 
> 2.53.0
> 
> 

The file now reads:

if ARCH_REALTEK || MACH_REALTEK_RTL || COMPILE_TEST

...

endif # ARCH_REALTEK || COMPILE_TEST

Please update the end comment as well.
