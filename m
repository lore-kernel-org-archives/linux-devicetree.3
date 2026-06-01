Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0F7386576
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305398; cv=none; b=shwOnt7Wkx0j3tDbLYRAO36RhtmVjbXLK/7tZfc74OI8hiGw/uKMsWpnTr0LbEsWuX6NTP2f33+7zVm3Lum9lAMNBp1pFFZ0lNCTgApEJutLzzYJdqMr/iBOkIe9SZz0jSFN33YvVmePyFo62Q37Bz3diIYjtJNvZt3egg+vkiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305398; c=relaxed/simple;
	bh=MAv2G3iNIINHmtBP17XT2WWmP/ezoDjjO/TPWJIsdX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyHVrijTmnByFPkCONzyPdRZaK0mWM3QRBPW66R11qpI0UIJZpft9+TYODh+67L/PAumIU7ecnDkZtTp7YPB0aloGb22iSZujc/mUqO7OXIac14f/7DgEq/88vYw0HrOT1xHvAvJXaVHdHxEkZMwt54oMbUo+2RIQc/wF56qNqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtgKpihU; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtgKpihU"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4909e3fa4b2so27331435e9.0
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 02:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780305396; x=1780910196; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVfLkZhdjxtyOU1OcAKjYEFf7E85v5J9aWNUt/TDql4=;
        b=TtgKpihU+YKQ5DRtFlrIH9TP8b8ZFcqj0pYrTLdN8BXmdSGl9WEguhxSog3fjMky8b
         NJcMIUfUJKjOu0k9OO6cDiLyIzB1XLLaeS8J9RWnnzOECNDHyhFdJRhYIhuak7dekJrq
         +Ot5+vmjWgVqG/OpCupUnw7trEj+OmZgYGE7UTk6th9Dyg/Dy9YmCSZ61E6I9R/p0GLK
         U+Skcy5DWpDEAfZYwvmSftdjFNMB7ZOEKwwtO9uyaUGQ5hu9AkACRJ1QmpRpX8EIlvZD
         aJMRw1V0HCF4Cgx6LKj9NDdTdjSEvYcrrJu8+FzIwQTzvzLagS06LIi2Pe2BE0E4+h20
         v4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780305396; x=1780910196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVfLkZhdjxtyOU1OcAKjYEFf7E85v5J9aWNUt/TDql4=;
        b=LEzgkL7OT44TeUMteXOJNnTw2vTQt2z8DLHD4MlEZ/fPP239kK4ahx/0DL7CyA49uS
         pXc9oYdXHjPazCjJDmSUwYj+GF40nPih4iCUJgK102125or5ZtCNn4liP7paSt2i6CoW
         +dcngSCMDQg7Xnp2g0Lwuu2q71ZZz3zrZg34lTtugGch48T/bn9g94sp4PefoJCMoMAs
         qXvOn2GvBt4zhUtp9RQCxYp1TdVBSuXHZ9VufhkKQlrAQ7KepLuVHfAcoy1WBp4QQVxB
         jL2zZwr9ky21isejAiSLJtqGpz+kkVLjrK11xu4QqVuQvnQRl0A93b7Udo2bh+XFG8DB
         IK5A==
X-Forwarded-Encrypted: i=1; AFNElJ8etDtXaWIL25PMJFYS4jefOZWxYuBHrgRz8yyj0z/rD/Smaf48f/dP+M/i69bbX6wI5ce2YCk6dIaZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyWlob9oJvM7lyOjTUvoUMaWKZznJcrhTLssvmj8RanC7f22kOi
	Su1PCygsE7ATUMbYMLP/gneSm5ORHVkWWXv/h+ZAe27ApjXQT296eaTV
X-Gm-Gg: Acq92OG62aVglPmnsdoeHschdSUE2Adt0prOL2r0hbO65mJOWHIVcUT4Xk+nW4Toam5
	bNvJuoFxKlK118QrUVZlNgsgQ1BxXV7ViAHgqSH8hd6ggIespsy65XjIxBPyUC1XZi+aiLnxody
	PgBOElTC1jcqW4fyd0scm0QUv7tTtc7bGHQEM12bs8N6yAcV6V1u6OX8Jwzh9BoT30cSvg8FjXQ
	0C+1x0ZyjKO/i8cSKxhSEuw3yH6K7lqmpA3zGH0NVjybJWRlrCicqO5SWp4JqQsbjhuPe61qM/O
	ve0HGnFURBCfDp4CZRoUgCkmq/1wfAtSldmczKKmqBbBXfEhLXmNLtrbm6r5NNjvTYeWDqSejA7
	ZBuPzyaNKHaCxjyXgGQQz1Lg84aoY1QzO2/SYFdbXPTMLxpJW/XlFzJ2M19QQd/5BJlH1cacmlr
	hHrQt08xF7C6tFCZwAn1rNiAgfHbNwzgYQTcNL
X-Received: by 2002:a05:600c:190b:b0:48f:f64c:c2fe with SMTP id 5b1f17b1804b1-490a298f29amr176335025e9.22.1780305395689;
        Mon, 01 Jun 2026 02:16:35 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb4acsm231582545e9.9.2026.06.01.02.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:16:35 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:17:33 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: ciprian.regus@analog.com, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 10/10] net: ethernet: adi: Add a driver for
 the ADIN1140 MACPHY
Message-ID: <ah1NRk7Xu-ItYbgb@nsa>
References: <20260527-adin1140-driver-v2-0-37e5c8d4e0a0@analog.com>
 <20260527-adin1140-driver-v2-10-37e5c8d4e0a0@analog.com>
 <ahlY8WSRO_HPmGtK@nsa>
 <a272f9ae-1958-456f-b177-7c966694c047@lunn.ch>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a272f9ae-1958-456f-b177-7c966694c047@lunn.ch>

On Fri, May 29, 2026 at 03:03:58PM +0200, Andrew Lunn wrote:
> Hi Nuno
> 
> > > +static void adin1140_stats_work(struct work_struct *work)
> > > +{
> > > +	struct delayed_work *dwork = to_delayed_work(work);
> > > +	u64 stat_buff[ADIN1140_STATS_CNT] = {};
> > > +	struct adin1140_priv *priv;
> > > +	u32 reg_val;
> > > +	int ret;
> > > +	u32 i;
> > > +
> > > +	priv = container_of(dwork, struct adin1140_priv, stats_work);
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(adin1140_stat_regs); i++) {
> > > +		ret = oa_tc6_read_register(priv->tc6, adin1140_stat_regs[i],
> > > +					   &reg_val);
> > > +		if (ret)
> > > +			break;
> > > +
> > > +		stat_buff[i] = reg_val;
> > > +	}
> > > +
> > > +	spin_lock(&priv->stat_lock);
> > 
> > Maybe consider using scoped_guard() and similar for other places?
> > Marginal win though so up to you.
> 
> Please trim the text when replying so just the needed context is
> provided. It is easy to miss comments when you need to repeatedly page
> down, page down, page down to find something.
> 

Sorry, I trimmed a bit but I guess not enough.

> > > +	ret = register_netdev(netdev);
> > > +	if (ret) {
> > > +		dev_err(&spi->dev, "Failed to register netdev (%d)", ret);
> > 
> > If we go to devm, this could be return dev_err_probe().
> 
> dev_err_probe() is not really about devm, but handling EPROBE_DEFFER,
> and not issues an error message when it is not wanted. I don't think

I know. I mixed a bit. I related it to devm because then we don't need
the error handling and then we can just do `return dev_err_probe()`.

> register_netdev() can return EPROBE_DEFFER, so it probably does not
> apply here.
>

And the above is a bit why I still like dev_err_probe() even if
EPROBE_DEFFER is not to be handled. I like that we can just return
rather than:

dev_err()
return ret;

Also it unifies error logs with the same style (for printing error
codes).

- Nuno Sá

>     Andrew
