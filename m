Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162CD36E477
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 01:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789607565; cv=none; b=QL5B7G7SfJT6/HFknslYBcVqaO1Qe6nsbpCxG4VCjMyl69vVxcbYt2H26hF7QU14SwTEOzyr7nU/aTH8hd8mH696fTcSBmTZvWwd17ATpyXnTrYz23b0OmGUc+9hTBq3ZkSYkQnJG30Rghi11ha/W2HFBDsZrPveIWpEqHuwl+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789607565; c=relaxed/simple;
	bh=0sgrUmuLux8uqAjTw4R5acvawZAe98RyRfcyeOWTiE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZtgO9ue+q5btI3Oj/Pjhcxy6TAMaMGkvK+9s1171Ll7kGtAMl+BRJLK2gI0yDykjxaL0JJ0nF0d8e94Z+UerernkZAJ1F9o+8F0y3vTSZV4p4jx5xlh4/LoNd6vu6JNGz5eqm6Rq4rEX86PzeQrxZCIkXX9w0LoEWVdkxHgSJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrhIRjYy; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrhIRjYy"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccb1a98dso215668a91.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 18:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789607553; x=1790212353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gc9KJ4Es/WQkdtrMV7rs5Raq2WwCB0243UqBQVk7iok=;
        b=qrhIRjYySn7zRD69FKEBoOmk7KIEjglnQKT63Uae09qyLVAe8UqMRiZOeV4tudS443
         q5nDHk/RGmgsj3b0dmx3/sKgwAlgNbLkzePjq1rKoUMWfHhyClOU5ltgdHzDXgECPDLC
         A+2Gi8lhYEzMZQso+AakTZkOU7ZPQo+O39BN/ZTsgOiWjYYwVnqC6AfxgsmJgym8AVnu
         GQqDtI3huOWapN2+J8TMI7ZTXPzZeeh+PXNCzmcmEuN/q/SJMrDWUTu1FfK4lY6u2qnB
         4ivLyrjt8yjUFKXio9YSOBkIH6XTFLBQ0CNQmNadtQZl7JuRNBAnutR1PQlOfzmmAyGj
         ETfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607553; x=1790212353;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gc9KJ4Es/WQkdtrMV7rs5Raq2WwCB0243UqBQVk7iok=;
        b=ESpSNEAMU7VP2n0Q7VaDrvYKcIfHQjAg4Iey9lJcUWYLfe5FW1SRBtJVftGok91Uz2
         wP8r6HGL9PzReq/Zzke6xqk4b6PAsdfEcfht4H+KDfJpc59n52vggkLyEVTlLSsOMq4Q
         jgNStoQdZ0ktsPWTV48kgyKq1hhKxPqgFiamh6Ewj1Gy/WoJuMU2ZLztPpO99aeEfI4b
         a6da60hcwjZdtDgtDFcBLWfKwbkgygDn7A03HLhgII52cXvgGOm0OcN2uPNydI3XI9OI
         2WpQ+3acaCOmT3efQAa6eBeA29VuJQ6UOXvz9D0XNC+K3AJn9NX8evEH5e7UrbgOvLrg
         2jVg==
X-Forwarded-Encrypted: i=1; AKwUvByC8UrbqVgrv1HR9TjdJ6XKDT7U/SeEeTlTPG0GZ1gUt85Fg2ApnUo7WsO93dJQDmhuTOwTY+3peQhm@vger.kernel.org
X-Gm-Message-State: AFuF++kflJp8wbbc4QTSVh5SFc1ZkBvNuD9DULBWpYQHP4mrcKHhaG79
	xpUS/RMHaYE6kWcvFzE12b+EkRzEspJsghyXE030gnnIHawKQNXfC8F2
X-Gm-Gg: AYBFou0jqvSeg0EUPKmVDozx11fzm+/wtdCnp670fT0aF9ub/lULOGgj/ohYKOPKFMa
	656lDOI6j3mO+FIcz3vbX2izAP57Ig3ao9FYpn+RyQy5OEO6jeJzRl5nr7koU/yV7GaLpSyVWIQ
	fEa6wnYBr1HCOQrOBtR96XXYxA4ZxEejjvYoSSBqLRkUQsUr0NbcuiDwX0fA5ZYsfycezg3ayIU
	4k3rwpohOb1Xk6FhB+tNL/bkOse71ho3kIZHYn9UkcM0l/ppWK4l9bNoyZCKm8/fJIdvafCF2+1
	ZYUdid/rah8E1rt2CZ8Rqyw9oPiqEeO27oeJy0R5iFCif/UJqJlSdT9dp97yoPlr0fDVczRIH9b
	herO9kKoM0ibbMJHXt1g8DYNa3ARkoeG3E/8b70JecSDgt3BAlqUFn1qSKEeekkgJT59wWJ9xMJ
	B+RQIpXxfIJ4Kzf3kj8TVei5b+9byff9qj+cVkHoYiSH5ZonO/8O3UfaACYauqDajmTwPG+yTJP
	UDVrfphPzzi
X-Received: by 2002:a17:90b:50c7:b0:39e:b15:7950 with SMTP id 98e67ed59e1d1-39e1e4eaeacmr11330851a91.23.1789607552672;
        Wed, 16 Sep 2026 18:12:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e361b7266sm1836383a91.13.2026.09.16.18.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:12:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 18:12:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 5/7] watchdog: rzv2h: Add syscon support for WDTDCR
Message-ID: <87577cdb-7f1d-4a9f-8a61-ff1f272234d9@roeck-us.net>
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi,

On Mon, Aug 17, 2026 at 08:25:38PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) resides
> in the second register region of the CPG/MSSR block. Since this
> multi-function block is shared with other peripherals, it is exposed via a
> syscon regmap interface.
> 
> Look up the SYSC regmap using the optional "renesas,sysc" property and
> derive the WDTDCR offset from the watchdog instance index.
> 
> Retain the existing MMIO-based access method when the "renesas,sysc"
> property is absent to preserve compatibility with existing DT's.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Can I apply this patch without the other patches of the series ?

Thanks,
Guenter

> ---
> v3->v4:
> - No change
> 
> v2->v3:
> - Made use of the new "renesas,sysc" phandle-array property to access the
>   WDTDCR register via the CPG/MSSR syscon node.
> - Updated commit message
> 
> v1->v2:
> - No change.
> ---
>  drivers/watchdog/Kconfig     |  1 +
>  drivers/watchdog/rzv2h_wdt.c | 56 +++++++++++++++++++++++++++++-------
>  2 files changed, 46 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index f7d0a0c2c0ef..3c4fc9916d8c 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -1046,6 +1046,7 @@ config RENESAS_RZV2HWDT
>  	depends on ARCH_RENESAS || COMPILE_TEST
>  	depends on PM || COMPILE_TEST
>  	select WATCHDOG_CORE
> +	select MFD_SYSCON
>  	help
>  	  This driver adds watchdog support for the integrated watchdogs in the
>  	  Renesas RZ/{G3E,V2H(P)} SoCs. These watchdogs can be used to reset a
> diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
> index 8af2f33b5680..04ea962da837 100644
> --- a/drivers/watchdog/rzv2h_wdt.c
> +++ b/drivers/watchdog/rzv2h_wdt.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> @@ -44,6 +45,11 @@
>  
>  #define WDT_DEFAULT_TIMEOUT	60U
>  
> +#define RZT2H_WDT_MAX_INSTANCES	6
> +
> +#define RZT2H_SYS_BLOCK1(n)	(BIT(16) | (0x5100 + (n) * 4))
> +#define RZT2H_WDTDCR_OFFSET(n)	RZT2H_SYS_BLOCK1(n)
> +
>  static bool nowayout = WATCHDOG_NOWAYOUT;
>  module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
> @@ -64,14 +70,19 @@ struct rzv2h_of_data {
>  	bool wdtdcr;
>  };
>  
> +struct rzv2h_sysc_wdtdcr {
> +	struct regmap *regmap;
> +	unsigned int offset;
> +};
> +
>  struct rzv2h_wdt_priv {
>  	void __iomem *base;
> -	struct regmap *wdtdcr_regmap;
>  	struct clk *pclk;
>  	struct clk *oscclk;
>  	struct reset_control *rstc;
>  	struct watchdog_device wdev;
>  	const struct rzv2h_of_data *of_data;
> +	struct rzv2h_sysc_wdtdcr sysc;
>  };
>  
>  static int rzv2h_wdt_ping(struct watchdog_device *wdev)
> @@ -90,12 +101,16 @@ static int rzv2h_wdt_ping(struct watchdog_device *wdev)
>  
>  static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
>  {
> -	return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
> +	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
> +
> +	return regmap_set_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
>  }
>  
>  static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
>  {
> -	return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTOPCTRL);
> +	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
> +
> +	return regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOPCTRL);
>  }
>  
>  static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
> @@ -284,17 +299,36 @@ static const struct regmap_config rzv2h_wdtdcr_regmap_config = {
>  static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
>  				 struct rzv2h_wdt_priv *priv)
>  {
> -	void __iomem *wdtdcr;
> +	struct device_node *np = pdev->dev.of_node;
> +	bool syscon_present = of_property_present(np, "renesas,sysc");
> +	struct rzv2h_sysc_wdtdcr *sysc = &priv->sysc;
>  	int ret;
>  
> -	wdtdcr = devm_platform_ioremap_resource(pdev, 1);
> -	if (IS_ERR(wdtdcr))
> -		return PTR_ERR(wdtdcr);
> +	if (syscon_present) {
> +		unsigned int wdt_index;
>  
> -	priv->wdtdcr_regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
> -						    &rzv2h_wdtdcr_regmap_config);
> -	if (IS_ERR(priv->wdtdcr_regmap))
> -		return PTR_ERR(priv->wdtdcr_regmap);
> +		sysc->regmap = syscon_regmap_lookup_by_phandle_args(np, "renesas,sysc",
> +								    1, &wdt_index);
> +		if (IS_ERR(sysc->regmap))
> +			return PTR_ERR(sysc->regmap);
> +
> +		if (wdt_index >= RZT2H_WDT_MAX_INSTANCES)
> +			return -EINVAL;
> +
> +		sysc->offset = RZT2H_WDTDCR_OFFSET(wdt_index);
> +	} else {
> +		void __iomem *wdtdcr;
> +
> +		wdtdcr = devm_platform_ioremap_resource(pdev, 1);
> +		if (IS_ERR(wdtdcr))
> +			return PTR_ERR(wdtdcr);
> +
> +		sysc->regmap = devm_regmap_init_mmio(&pdev->dev, wdtdcr,
> +						     &rzv2h_wdtdcr_regmap_config);
> +		if (IS_ERR(sysc->regmap))
> +			return PTR_ERR(sysc->regmap);
> +		sysc->offset = WDTDCR;
> +	}
>  
>  	ret = pm_runtime_resume_and_get(&pdev->dev);
>  	if (ret)
