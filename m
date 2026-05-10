Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B50239EF22
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 15:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778426983; cv=none; b=SuoR9aaGTzQcAisimNMu1/F0Q2/9wj3GujRI2hFOeBTKP7TK/kx2rb6d1ge9Fr2yb+EJpjbXreuxjwjkMGkBcK6YO2HIOzJCL269JYkSw8ozgF596NiRhs3rnPp2l1cvxohiL4HrHLD93vxX/dLUXDrU3UykFbavXZ0YZZQRNMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778426983; c=relaxed/simple;
	bh=VGhBlR4i0yiBkTCF4XD51IEzNUwKDosxwd/fQ1UG4tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6pRjmxQV8z0r0vQki57GCt+2LomJUNR4DhH3wtbcGClAXBAtAUizaT43SCK4CfoFQNIzNd1y0wPq0nmm1H5YgZzhnX4QxBLhhahhGbkkGntxbsQe3yph8RejmJskcfVaapyXsYhXS4KparEmMmPBgvFXWs12s5OcGMEgCn/P70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pepBsWGr; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pepBsWGr"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c15849aa2cso4271949eec.0
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778426981; x=1779031781; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qigH8lxO+eZS/TR71vYkcB8nPKNDMGG4EcHQASbQAqg=;
        b=pepBsWGrmAbVKZYsiVfg7DKy0Urzj0tyNGEP339/vLv/GqYzRTbZjOxlilxdsAvVbt
         yIulLNIPlBjBia5gPiUCu9Z+afINU4irsdhjZ2LeBlF3lP02+v74iMg0Rk7DFWd4Om17
         e+/Fzw6mNP0KBmeF1B4Hl2HsIXBieVbnEAEEj3cCUsAueWdhEQR6NtnjVW27O53Nu7ha
         nRRFmiH0+l3X3Ay5yaeH+7DMG6bLMgoXDIgaauUkCgJAXr/ZD/dPDsBT3SixngvgiqfW
         sATdsJQPTf5LcRL4oU5LPihftzRv/AjqvScXfjH0KjD91G5ftojUa2P3mibWMVA7B7IL
         98kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778426981; x=1779031781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qigH8lxO+eZS/TR71vYkcB8nPKNDMGG4EcHQASbQAqg=;
        b=YWP6EE48SpNHOd1tdhmn4/w74Ldn8ZXNzvPYWX7dsDsyRpKDlUUYatQSjcMjlAb8Yd
         ttk+qQRiRgsdqdAtiCi75+Nt5OtLRTDRG92j/aHALMvRA32854KZ/gkU3px+WF6SjwJY
         UPgsNcq6p9tZVjxEBrmweUkdnY1lx1jNWIN9jbYNx/XQex3JsBu+91q25qjnrqaF+5Pt
         GfvoglIp/oDcV0kK5cRwDofshHZod2tzQ1eYtWPut3VDLCvs4wBgJbd+Gfr+mvzCc7bB
         q8N2qLsen2yHHSVwON0gPGuZ05+BqwQpG2L2DucVSqNUiBj/tDJ0MRQXVsQQOrXahXpw
         PPwA==
X-Forwarded-Encrypted: i=1; AFNElJ8+GroH3nOYfgwGAsexgfPFRkY8WorULIXHX2Ws6I59l/RpMETP5PTTOSRMi3sB39q9vncO5ouTnQvH@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+fWn5nYN4+dKMm0dcnIpiNbhlpb2lKLThD/oFj8k3AnBjwH+G
	YhV57OCYJi16ntst4eYhmuowaNFo29+laiWOA7pyPokceUXlhpPXn2Ro
X-Gm-Gg: Acq92OFJcfQZ7UJ24PhsSArBWibE37NSk+4F4HvgmVquMPVAFLX1JanOvBP1UHDKsEK
	3aoQUNuHNbsrPZpIVAMCum0tchVyX/KEtelpuBeM4oPVmwD2CBVJ227cKQOTcW1lpU3hPKfhmxl
	qSzgPTIiZ7mekxHcXwphgWI2hLjS/fCoh7eyCP6q+VNv4hIlCo9FOn9p1jVhOiXvLgi933SoAdI
	Wd62PjPhMKNou5YAS2E64wPxXm6Xty8S9/huuXnNs28XE9Sn1peZDfdjHhLzK9oQrhcG15ddCl4
	Sp4dzpYs8VDXB2WBRS8j9AxyvIayw3NtHXp7/1aieO5uhH487Or8Pp/HWQD6tbEFPp8B/VC6WqK
	XJOY9Y4tBv64ynC9bdoFojeNGWexobidw9DguaB4G+1L02k36TwTLIdzgNYH+kuCdu92fjucGjz
	+4oKEC09/GVvHTzinzSaU1Xkv/VP/tkc6zGF9cUHzW3NaVQ/Y=
X-Received: by 2002:a05:693c:300b:b0:2ea:5057:a2f9 with SMTP id 5a478bee46e88-2f549f7c2aamr9650588eec.16.1778426981133;
        Sun, 10 May 2026 08:29:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm8525864eec.0.2026.05.10.08.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 08:29:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 10 May 2026 08:29:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Janne Grunau <j@jannau.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sasha Finkelstein <k@chaosmail.tech>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org,
	Joshua Peisach <jpeisach@ubuntu.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: watchdog: apple,wdt: Add t8122
 compatible
Message-ID: <85ea46a7-1136-4ea0-9eec-7dfa465df20b@roeck-us.net>
References: <20260507-apple-m3-initial-devicetrees-v3-0-ca07c81b5dc7@jannau.net>
 <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-apple-m3-initial-devicetrees-v3-2-ca07c81b5dc7@jannau.net>

On Thu, May 07, 2026 at 09:33:08AM +0200, Janne Grunau wrote:
> The watchdog on the Apple silicon t8122 (M3) SoC is compatible with the
> existing driver. Add "apple,t8122-wdt" as SoC specific compatible under
> "apple,t8103-wdt" used by the driver.

'"apple,t8103-wdt" used by the driver' is not true. The watchdog driver
only supports "apple,wdt".

> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> index 05602678c070..845b5e8b5abc 100644
> --- a/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
> @@ -16,7 +16,9 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> -          - const: apple,t6020-wdt
> +          - enum:
> +              - apple,t6020-wdt
> +              - apple,t8122-wdt
>            - const: apple,t8103-wdt
>        - items:
>            - enum:

I second Sashiko's findings that the driver will fail to bind because it
only supports "apple,wdt". I would not mind and apply the patch anyway,
but the statement in the description is just plain wrong and thus
misleading. Please fix.

Thanks,
Guenter
