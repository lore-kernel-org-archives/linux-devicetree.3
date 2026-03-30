Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD753A0B31
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 21:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774906801; cv=none; b=aQpd6vL+oLZc9yT8/B0nTNpiqZrkwQ4LqJBI3v+XR5RkjuA1PZLVvlqgTk0I4Pp26qaZOh9cHJlazgj74Tw/tep6d5ZFN2ZwufWZ9HuJNyZbSfvblUtc172pu7RCvjOYhplD67RaKhfs48j/LkzF9DQsJVZ2XvXS3bK1sPGPhfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774906801; c=relaxed/simple;
	bh=XY9jit3pZOf+Twz44fwhuoEV8eoKm9RmuY7BNFtSxvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aOmAz69OkFx5V0BQvnQxZwSphvhdRCr81klk9Y6SmNEUYa1YuIoSgdzISFD+399/7E3i0gpRV1FHDCoksuRbXNs+4LwppwIa8cQqBa6PMn1w1WY5t9CiQ1eXsr+v9yr5xUlVDp4va8davinsILEk1cCHBWJxK5P+ODrCJgpbOSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dop6O1dK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dop6O1dK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4836d9d54f6so6494045e9.1
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 14:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774906798; x=1775511598; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CZq16Vvm2OcalCR/KaecqgDhE8kt3cyv+A0i59T0APc=;
        b=Dop6O1dKvNvt00zZMndz78kie4OVbc1xZpYDbbyQBquPcGPNbZS2S5wV3za+VVnqBP
         281sezdgMbFxQJem9rTGeUfTpEUnWsH+J1Hbyk7/oDsNpfeuJFD/ayBujK7MrY5T9rjh
         4xz8v4Pfn96Ksr/l8qxPejEvJSMOadjtjgU3TXMupIIyK5VYhF/Jbk7COsWvIGFsHz9u
         Db03VT1dpj4sosCPQRB/Rm57gV018taGuMlktn7J8B/P/o87fiez7w7EnGJIIHBW8aUO
         ffO4tEN9DaubkmUWVZOIbEVN/GQsPLmU7rCIsCCPondjm1Ibnped/Do6yrSsVzwSegYh
         E4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774906798; x=1775511598;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZq16Vvm2OcalCR/KaecqgDhE8kt3cyv+A0i59T0APc=;
        b=bS6sE7I5AK8MHIBv3WuKsJ0QXxzkApzZpn62APlpRuudP4TNOWRDJgyjIUdp85JHLV
         U96Ye9dSwAYiepwGTc4BZauoYiZg/T5agHyF+bJw6odAbVFm51C2T5mQcyZXRQsmUM92
         fAySCI/g7AFXV95g5E9p6kOBgMplx4Bia9JS6jj8cpCrTwt3wmNG4lpf17CwBPPb46dG
         8N48u867x/WUOqnKr7QQp4kg3mWUhiepehQcESNEEvAYLSfJRP6/D9kB10JqM8Ir7HWP
         A7J6J7UkslDDx6RDPhKKZ+2hlt+oSf06wiZt3Huiqz6fe5dupBI+tJn4UBTLR8buLZng
         GnpA==
X-Forwarded-Encrypted: i=1; AJvYcCUlxQ188lfCurF9/nqQ8AomDFDjhFnnJvJfqZsUPxzQt01Y/nU+gKl3YSEyC+XvluoCQ+/g9uU0Fk++@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6se/mWZ8AWJr7ic/zUpyi0mf4O8MkG6GEFCh0BzngV9mcuUM6
	EhESprIccKOjkDFE3/sLfZghpNrXQXqbnq2bJu71saWOtkodyMlolLJD
X-Gm-Gg: ATEYQzyee+JRtmHWKKSd5k0cPRRG5bO7eIhFrVA5nyZbAgi06tb+qmbL0VnzHaE9sp5
	QZslu0gG31U3PgSknINgrjV6CvwVw37NLr7BSQlUbuM9jstGdgXi9ATABR1Hj//OLsINczQBHfO
	IoWYHhfP9HWfmvL1EARsHYphSMPgr72Is2xGTcO6tUCZfGU4bg7nOvlBBS1D/pitQwVPaZHmPEF
	d6PtWJE3VuCMhB9rJz1XwVvyXNE+onOl6pwnzA9cUgleRBhwVIsQ8OquWJ4uYRt/pSG9fHR/+yn
	2aYKZXdLhwzL9zh2XYDsyF9AXftMZIEWvonMoEkC6VlC+gvY/R+JqCnSGZqiZEBJ/ZhwT3xzUv0
	gBDVlg2gkoNCYzQgRTiKgZf30bPn+K8MxKdUVrgFuPA7s6At0HAqtIn9/kFC8ZW8mCCunXAKG5Z
	Bqc+JqLvGd9Bhx8J0=
X-Received: by 2002:a05:600c:46cf:b0:485:3bc7:a224 with SMTP id 5b1f17b1804b1-487283d261bmr117767505e9.6.1774906798095;
        Mon, 30 Mar 2026 14:39:58 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d50a:b400:fc92:d05b:3301:b722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9506dsm293281905e9.7.2026.03.30.14.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 14:39:57 -0700 (PDT)
Date: Tue, 31 Mar 2026 00:39:55 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rustam Adilov <adilov@disroot.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stanley Chang <stanley_chang@realtek.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Zavertkin <misha.zavertkin@mail.ru>
Subject: Re: [PATCH v2 4/6] phy: realtek: usb2: introduce reset controller
 struct
Message-ID: <20260330213955.udqpa77ek7n4arsq@skbuf>
References: <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-1-adilov@disroot.org>
 <20260327160638.15134-5-adilov@disroot.org>
 <20260327160638.15134-5-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327160638.15134-5-adilov@disroot.org>
 <20260327160638.15134-5-adilov@disroot.org>

On Fri, Mar 27, 2026 at 09:06:36PM +0500, Rustam Adilov wrote:
> In RTL9607C, there is so called "IP Enable Controller" which resemble
> reset controller with reset lines and is used for various things like
> USB, PCIE, GMAC and such.
> 
> Introduce the reset_control struct to this driver to handle deasserting
> usb2 phy reset line.
> 
> Make use of the function devm_reset_control_array_get_optional_exclusive()
> function to get the reset controller and since existing RTD SoCs don't
> specify the resets we can have a cleaner code.
> 
> Co-developed-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>
> ---
>  drivers/phy/realtek/phy-rtk-usb2.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/phy/realtek/phy-rtk-usb2.c b/drivers/phy/realtek/phy-rtk-usb2.c
> index e65b8525b88b..070cba1e0e0a 100644
> --- a/drivers/phy/realtek/phy-rtk-usb2.c
> +++ b/drivers/phy/realtek/phy-rtk-usb2.c
> @@ -17,6 +17,7 @@
>  #include <linux/sys_soc.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/phy/phy.h>
> +#include <linux/reset.h>
>  #include <linux/usb.h>
>  
>  /* GUSB2PHYACCn register */
> @@ -130,6 +131,7 @@ struct rtk_phy {
>  	struct phy_cfg *phy_cfg;
>  	int num_phy;
>  	struct phy_parameter *phy_parameter;
> +	struct reset_control *phy_rst;
>  
>  	struct dentry *debug_dir;
>  };
> @@ -602,6 +604,10 @@ static int do_rtk_phy_init(struct rtk_phy *rtk_phy, int index)
>  	phy_parameter = &((struct phy_parameter *)rtk_phy->phy_parameter)[index];
>  	phy_reg = &phy_parameter->phy_reg;
>  
> +	reset_control_deassert(rtk_phy->phy_rst);

LLM review says:

(less important)
Can reset_control_deassert() fail here? If there is a hardware communication
error with the reset controller, should this check the return value and
propagate the error up instead of proceeding to configure the PHY?
Additionally, since the exclusive reset line is deasserted here, does this
code need a corresponding reset_control_assert() in the driver's teardown
or exit path? Leaving the IP block permanently enabled after shutdown could
lead to power leaks and prevent proper hardware re-initialization.

> +
> +	mdelay(5);

(more important)
This code unnecessarily penalizes existing platforms. If rtk_phy->phy_rst
is NULL (as on older platforms where the optional reset is not defined), the
delay still executes.

Also, since PHY initialization callbacks run in a sleepable context, would it
be better to use a sleep-based delay like usleep_range(5000, 6000) to yield
the CPU instead of busy-waiting with mdelay(5)?

> +
>  	if (phy_cfg->use_default_parameter) {
>  		dev_dbg(rtk_phy->dev, "%s phy#%d use default parameter\n",
>  			__func__, index);
> @@ -1069,6 +1075,12 @@ static int rtk_usb2phy_probe(struct platform_device *pdev)
>  
>  	rtk_phy->num_phy = phy_cfg->num_phy;
>  
> +	rtk_phy->phy_rst = devm_reset_control_array_get_optional_exclusive(dev);
> +	if (IS_ERR(rtk_phy->phy_rst)) {
> +		dev_err(dev, "usb2 phy resets are not working\n");
> +		return PTR_ERR(rtk_phy->phy_rst);
> +	}
> +

(still LLM review)
If the reset controller driver is not yet ready, this will return
-EPROBE_DEFER and print an error message to the kernel log.
Should this use dev_err_probe() to silently handle probe deferral while
correctly logging actual errors?

>  	ret = parse_phy_data(rtk_phy);
>  	if (ret)
>  		goto err;
> -- 
> 2.53.0
> 
> 

