Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FF813B58C
	for <devicetree@vger.kernel.org>; Wed,  6 May 2026 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778088654; cv=none; b=BOoUxHBVxrZBP80U8v53keZWmqCaF88Z6SyXiFIyg2hGKp50+ErFiUiYMwLFh0/vSN5eFWZTOulOk0jtY59nVVkYz/wTbeYsi6tt9F2H+tkRZvM0sQ6VS8jVaYwppUekLdRO83Py210J5M+EIU8QKboaFCGQ4ap8PQsv55gZG3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778088654; c=relaxed/simple;
	bh=4Ykz0ExoUaMMR6EC+daSv9XmEUawcxqmyTTi/73hV1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjQLSOhK7GTO/mDF6X5f2caM6uMOz2rOpU2qYKCA4sofPJtk3kkP3AI3AvzrESLxOQX9cHBQu4UbpkioLetOLux2hW8NGq6TiL71Ak05SL7/XlfYvCl/+RzY95iGSrCMFyydMSeTXTkQMbjcf72gaFVhP1AGIi0jjTjspwO6Wk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnbCDp+r; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnbCDp+r"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so5291351a91.0
        for <devicetree@vger.kernel.org>; Wed, 06 May 2026 10:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778088651; x=1778693451; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q92pYl98bSnKhgO0g+LA6h/wojvjo0EO8G9dXoXq+H4=;
        b=nnbCDp+rRp1fGxgTNajKMfzPf7OM8xFbx0n469NTPtMgvoUbed2DJ9nSNlsEwWf2RB
         OKf1r/oN7uvCSm9fnQ5QLH4x9sRo5DQhHjfiYw9ybguwL6xOFud2xEFlZxRHsA3JHHdb
         qK6yResf6vSXfGcJaxkI/tAtT9LRkgLy0g6e7c8RBtVtg2cCQkYNddJzqcW1QsxQpOya
         UAAkBMOaOpfwk5BL2F7zrNyIbrFgav2qt3O7ze0wOMv/c8t14i8T7FX3u7R3BQBe8PyI
         7i/PsS1lbTwMUh7aPs/PJuaErORTJUpI/ht2v01goWC47wUU44KFxKbAhKCiss12hr2O
         f7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778088651; x=1778693451;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q92pYl98bSnKhgO0g+LA6h/wojvjo0EO8G9dXoXq+H4=;
        b=fPDdEqf9UHvnDjOo9LeWWwc0K3TP2k1VSigG6Ggb9mIdwJTea1VH1cMpfQbC3AlFlM
         Gamm6I3ZkQP0K0an5NEPuX/u4dN4/qvI2Wbbind4DxXgPYwkN5CrvT6o1YgZ1wt8mSHY
         v0ZJA5Azwex09tgCB1ge2FBygIDm3zHJ9SsxNdjjGfMzZ9vUvZzD2fzQa1A+BFbyzuuR
         nMVrX1bSu9aDzRtVJQg232GWmMn/o1e53XCdjFpzDcvsQQiRYJg7hsGSf6zFSRt2LeHZ
         PfeyfnfYPfShiq8qLLvxCxNI+5uYBn75aP8LKMmjARLMUpsQcFksiXoTXkPyPx1hmfRa
         pbow==
X-Forwarded-Encrypted: i=1; AFNElJ/QqD42t6gGXcgFbf4d25kJYC4mk+cCsMprZCLEM6oRa39dKstuigUETLBNwKXS/gbUUHWLEhlWAU0Y@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6ydPxtxU/v/wKqyr+V8p7m6YMwIS11bciRwQ8JxFZshcbBWP
	+f5tmL41oRFZU4WGcPOG4gq0J3YzooEfND5xmqP4AS6SCnNZjzFVie0H+yV5Yg==
X-Gm-Gg: AeBDietFXrPCJdZVVOxAxC7Bh7teLF/tXpi6161og6OWVBe6FzdC+GCi1B/mzKtw2nx
	i+w2VKsoi9zXzqkInZa/EGvSZNj3K7a0EMub3JaJHTpcgtQPrS6Co1SkG9Rfre7aweJHZu6BsnO
	pXwVRb04aIborrHe+415gFeL3xp+6i1r0AdD8ldQm6tMdemIQev+FlQ/CZxvSlOPrlf27bJh/H4
	VJ+52uqgmeeA2l0sEILB+ri1HfGOXyOKFSSQiPTABPH8apVN5VJ3q+tUXwnsKIwfdvdXbWY2jMb
	Vbpn8LujOAm20zRwMV+Uhv1hn9hCbAX1taeqCBaRHLq1RNnbT9i5AzynBwx5A0MWiwF+jCGa//X
	MecaiPENCDnD3zLZBZ/0dF2Qjg99Lq6PoALcMV45WESFrNvVyggd+OGv/CHnIs0QimMI0EwMGzp
	kFXdT9rIF32AHB2rWdL3Ye1akVpoE++UZGatVVRvDebiNb0PW/mCVWaUbdmA==
X-Received: by 2002:a17:90b:264e:b0:35b:e553:9cc2 with SMTP id 98e67ed59e1d1-365ac89cf2cmr4261014a91.26.1778088651264;
        Wed, 06 May 2026 10:30:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-365cad597c3sm1338302a91.4.2026.05.06.10.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:30:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 6 May 2026 10:30:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Heiko Stuebner <heiko@sntech.de>
Cc: wim@linux-watchdog.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, Jonas Karlman <jonas@kwiboo.se>
Subject: Re: [PATCH] dt-bindings: watchdog: Add watchdog compatible for RK3528
Message-ID: <2ee02f9b-56cf-4dbe-9312-e2ba85d44de1@roeck-us.net>
References: <20260506092420.3320031-1-heiko@sntech.de>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506092420.3320031-1-heiko@sntech.de>

On Wed, May 06, 2026 at 11:24:20AM +0200, Heiko Stuebner wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> The RK3528 uses the same watchdog block as all previous Rockchip SoCs.
> So add a compatible for it to the soc-list.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied to my watchdog-next branch.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index 609e98cdaaff..731794dccd4a 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -29,6 +29,7 @@ properties:
>                - rockchip,rk3368-wdt
>                - rockchip,rk3399-wdt
>                - rockchip,rk3506-wdt
> +              - rockchip,rk3528-wdt
>                - rockchip,rk3562-wdt
>                - rockchip,rk3568-wdt
>                - rockchip,rk3576-wdt
