Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180E38A71B
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781259042; cv=none; b=LTyy8bXU2oT7g3r4ZiDl7/3MvCqhXpZGlYG0QGvBFd70MREYEsAnzsWg35IcKdKguBu1wf+255o2OJqThBjdDl8L3sCoLXjd5xodUWIZndUNPeZKyncjzpffr3ZY3XJxIWE1aoEJhCenEccUEz8V9y0l7WP0/ewnz2/teGX6TKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781259042; c=relaxed/simple;
	bh=VfOBVwW66cmgqEpPpdTVfIk63d6iMSbC90a3mU+fYhI=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PI2c6fvpiykcN+T+vtLclm26kOCr+95DCjZl6JLLVaKHuAJ3Xhn6dsYdu3DoGb9PIbEupBvr2kQ7RnqVokmIJ9iVe2P3PKRQ/SlLtOAiHYHAUJ/ZeQCkdOMxVz8s94c/C0k71qXaTnjFvF691BP1TPOO5S4JnuRMxMxXp+V/ai8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lL+AmzC5; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lL+AmzC5"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso1920755e9.2
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 03:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781259039; x=1781863839; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C9wZyoU1v8zpuY6BFJ/ACEsATO/OwOtgF75ffj8qI+Q=;
        b=lL+AmzC53BTqQFdAW21zPigq/dUnUvY0Gj+3sQzhRp06HSOBDf4yOGSSyWET+Z1rIR
         LON+2tOd74QLCOrRofUQHluvGUqasRJCq4BZn7hHz4Ss/+CHHrIjuXJymcLiHl58wAXd
         WCDTOD6jfbWOqGvizrXovJ4yT3BHsjpVBu40emdlyPuBck+ZVAZ9znZq5zFzqRcubnzM
         JatLsxH4LyaXD3F8DGKWoq7clHjwIb1JrjZxd1qpe4RneWZs13dZ6RnsABRkFFjNZDgv
         jxtlyatCN+i3DfurIBkvAFSjoyuK8xH4nN2mqu5SVnukdLiCHQhspb/MACc2rLn4ZD+E
         95/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781259039; x=1781863839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9wZyoU1v8zpuY6BFJ/ACEsATO/OwOtgF75ffj8qI+Q=;
        b=GkKAPkSu5Pz1HzaNSMA3r8X/rI1l0Tko6hXP7nDTXGFbX4f2IV7fAn7hIfxMD4q3qS
         z1X3rhlK7eB7gjMbbZJjTwTw8hJLqLW2XHy2Qc883kyyfVDe+6KN2a64lJjbx0aTxTfP
         0i6N3bUu7KoIc8HujtO/zDPuf4OsitR7sjuQluJQuhIOqRkhiU96BBOTfVrsiGkKjprE
         W+9ux1it2M5P/tslU5pxdvTicvegLOx/6zsvtnkhu8xnAAj/LHjcXCsv05JAwfQ3ZlQ7
         1kNJaps3pm41BHVuL+OUEJcT3R2bc3RHstdE6DaGqmxOy1WxinhMk4p1kLKjPA69P8GK
         B3Xw==
X-Gm-Message-State: AOJu0YyIRMsGAjj81oqq7dsPhodZIjmHSe7EhVImS9ztjI8NY5OspXb6
	ab2TKiMX0P0HzoY7V8a+Xr6wBwX6usx/RqQ/Ya2aOPFsI1mTULacbbx/vfqIHw==
X-Gm-Gg: Acq92OHUUkbrWcnr5hvEJO1KmTeXZ1VV5hixZS66P6x433srUC/+unScfI9bliOmaSK
	J3Zj0G84fw+8RNrr6Ra1H9jLhhiZqXVMCoIPD7sinC8DWSl5v6AjTJMhjLQt/gphRXAFdBXzuuG
	R9BHLvdRsKL3RlX4BfJvLgGChYPkhoqFeB+CHUCuyxC9QM7Q9iu38un+oN2Pr5ujSBQwyUXOVmK
	8NXCIdLVWbwND1E+L7XiX/Po+Kz2N7XOI0EvYYmOcFuMOfkFhhUdrL3KHCnhzZRvNpsvg7HsMVc
	Jr63rfpDhYswUTDhk+BgbITAEqLKRz9SWIAiheMlOIgp/+opFBwXUTBTGsaStcgdBpnWgaZG/vw
	uqtQy81FRemF6Nfs0sk5hb3e4iL5FzT626Y8n432xvH1zllJH8ovJYRjAetK7DFIeT10f/ka0IE
	BDcdXsivW4233jg4H4qXMGWQ==
X-Received: by 2002:a05:600c:3b16:b0:491:e3be:1363 with SMTP id 5b1f17b1804b1-491e3be13b3mr3289185e9.0.1781259038325;
        Fri, 12 Jun 2026 03:10:38 -0700 (PDT)
Received: from Ansuel-XPS. ([176.200.123.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea83d8dasm70261225e9.11.2026.06.12.03.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 03:10:37 -0700 (PDT)
Message-ID: <6a2bdb1d.dc59d6a3.e1f11.8388@mx.google.com>
X-Google-Original-Message-ID: <aivbG2gNq60N68uc@Ansuel-XPS.>
Date: Fri, 12 Jun 2026 12:10:35 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH net-next v6 01/12] net: phylink: keep and use MAC
 supported_interfaces in phylink struct
References: <20260609151212.29469-2-ansuelsmth@gmail.com>
 <20260610161620.99C121F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610161620.99C121F00893@smtp.kernel.org>

On Wed, Jun 10, 2026 at 04:16:20PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] Late modification to `config->supported_interfaces` by drivers is silently ignored due to by-value copying in `phylink_create()`, breaking support for devices like MTK GMAC2.
> --
> 
> commit eaea53b185dbdc4c75406c542c97543c4c451c9d
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> net: phylink: keep and use MAC supported_interfaces in phylink struct
> 
> This patch copies supported_interfaces from phylink_config into the phylink
> structure to prepare for internal PCS handling. The internal copy is then
> used in place of the config structure's bitmap.
> 
> > diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> > index 087ac63f9193d..4d59c0dd78dbf 100644
> > --- a/drivers/net/phy/phylink.c
> > +++ b/drivers/net/phy/phylink.c
> [ ... ]
> > @@ -1868,6 +1873,9 @@ struct phylink *phylink_create(struct phylink_config *config,
> >  	mutex_init(&pl->state_mutex);
> >  	INIT_WORK(&pl->resolve, phylink_resolve);
> >  
> > +	phy_interface_copy(pl->supported_interfaces,
> > +			   config->supported_interfaces);
> > +
> 
> [Severity: High]
> Will this by-value copy break drivers that modify supported_interfaces after
> calling phylink_create()?
> 
> For example, looking at the mtk_eth_soc driver in mtk_add_mac(), the
> supported_interfaces bitmap is modified after phylink_create() returns:
> 
> drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_add_mac() {
>         ...
>         mac->phylink = phylink_create(&mac->phylink_config, ...);
>         ...
>         if (MTK_HAS_CAPS(mac->hw->soc->caps, MTK_2P5GPHY) &&
>             id == MTK_GMAC2_ID)
>                 __set_bit(PHY_INTERFACE_MODE_INTERNAL,
>                           mac->phylink_config.supported_interfaces);
>         ...
> }
> 
> Since phylink_create() has already taken a snapshot of the interfaces,
> this late addition of PHY_INTERFACE_MODE_INTERNAL will be dropped. 
> Could this cause phylink_validate() to incorrectly reject the internal PHY
> capability for the MTK GMAC2?
> 
> >  	pl->config = config;
> >  	if (config->type == PHYLINK_NETDEV) {
> >  		pl->netdev = to_net_dev(config->dev);
>

I was with the idea that value of phylink_config should be used only for
phylink_create and then in theory they should not be changed.

Isn't this a bug in MTK code to modify the phylink_config AFTER
phylink_create?

It was never a problem since it's it's INTERNAL interface mode and a PCS is
not needed for it but still I feel this should be fixed and this change
doesn't introduce some kind of regression.
 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260609151212.29469-1-ansuelsmth@gmail.com?part=1

-- 
	Ansuel
