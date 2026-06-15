Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C053F7888
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781532628; cv=none; b=nuOCa6fD/2/NJ/cy/j8Kxt9F/sGJynp+zeoaZidoxNEw6pk8g2Sz76BGzfdudNvM1bi3cwIww2E1fk5FM0zRb1M+kUY3gNyILhuVdqQ8P/KAf5nS8T/dhFGY7vieg45v97yzoJxZV8uR1Wq2NwdAlqe2p/vGTz5mZ7mntR24kUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781532628; c=relaxed/simple;
	bh=ojL5AP8L6WG+T+j3AGHlDG/e4NEUksF2lsjngZpxUA4=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBWAHt2Ba95jZZ6b8bCU66lgANy7GCB+SRQ73JKCcVYhQkIwPElEOkFpg7S3hl0W3KudFBXN7r3VjArjC/Wf9QOHwG8jmy7S1Lq+5k5P3fjKM3Q1jWw/I5hkLxiJWWGoxl64q88ulAc0PzlGTbZ6kf+ORSh2OvUXEEfHWZKrkXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hoXGpswi; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hoXGpswi"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b3e03939so25360435e9.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781532623; x=1782137423; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F/bfZlkIthONZwal+BuFPrR21tTmL0QJZVmWIFcUsNk=;
        b=hoXGpswizDp9LdjJ4b60adwIq1atMp0r3uIG6tQk/L2MQ/Aevw7kUYudKkqShH9ERO
         YvE4EkDtvboasGDFn6dr9vA31bZYNGdbI+Tvwgn7ntnqhfojDkOoSoNvjvmMfzFkA0mx
         c+aNbSWhkr+1VtBFdiJHts8gePM0fUJuzsLe/jiGJrLhKzQraci4EtjCC+3rapmuUTpU
         9t9FG2HsUqBrvKd6TTF06vEkI88puyb7mbO4rs69Ay5hJnjZmoLHNY84isOFWiAc+jht
         I/Zsq1MTwIPOCAkwcJSdDkJsh0ZnaD31pQvlmZlUnFPydRCk03sFLX9dAUSKDPpsecct
         ZAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781532623; x=1782137423;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F/bfZlkIthONZwal+BuFPrR21tTmL0QJZVmWIFcUsNk=;
        b=lKVI8VnTE2vMQHL6A8FM3i4LvFnS9uOFar9ZNCenf+nhku+up8yWDw9VDVYW1ZEuHY
         0V9ALmFASzgEU4suy69o7hK1yByYgPfrdu2JClZY4FhCiG57JgWpv3CseLCWcx8gV5aD
         DAacDs5xI5i9Lglog7KkAVqDraccbnNHpT9f2vAKolGSXDz1KwU0kWsxI/uA6pArKqQy
         0NKImQCou9yyliuWvFwjhyMj9YY6DrAt3RCDYJElYj3RPzmeKuMgPglGKqXwb9D08EaJ
         TFGupoEHLFYR3dQGCreeYsRSdrNk+g5K/HRknMp4WPHmfeBUWIku8sWgF1nOt+RUT9hE
         wggQ==
X-Forwarded-Encrypted: i=1; AFNElJ82NOzuduDvAVNTKWrZUyIEVi8lj0j7gAcbkJzByTU/WD38lpV5+mL79XPuXSZMxtl7XzRWwrlhI6qm@vger.kernel.org
X-Gm-Message-State: AOJu0YyS0RgHeyZKEnA0G7KmMIsYaKV9D2/ziZQoXBLAvwql3XxCMUd6
	6PVI1QSBo9fLMjUsYOGmunn4raW3/iOfpgNEF5B1eB/ggsSty1sgI0Rr
X-Gm-Gg: Acq92OHxaM7iuVA4K3hW5c1opQ/+YEkZcjLNpShoAHqCYEpMKkudE4CqllMP9yNa++7
	fFh7K4dKt4CPrGf24907L3HRB++peK18Kv6nrushI9ISzxTbJ8Pf2Mzz16vs05J7gkmCgmHfu09
	jVnA0Ck/pBoMRUTdKAG6/wMMv5dE9+GvwKnylTM1+ERnqbV6CaoTUcrZnhtz685ou5SkB9eN7Ro
	fxCdhoEIZD9CrZqPdWuvUWTMzfxj0oWZKu2hDKQ5XbmDCDAJBc4HU8VL5KuvwwYOZQdewSVrIee
	GN19QmYqpqgn05ncGKMPS5NyCGIbCzFLedfbupVV1K2HhhxTJmVj8MyNEx3qQDdwzE41wo/0ekc
	rnu9Py34YjvAvPJ49A0GpiGEo319j2CHI4CJGJnm5+Vvg098LkEB2L9qgVG6zV59tORN5Vmh5fC
	Vn0Zvu6xWfMYtBf+lAvjGxfGOM7qpP6LemoI+QEdrt11F8JGIrWK3f2w==
X-Received: by 2002:a05:600c:1912:b0:490:bbc1:c9be with SMTP id 5b1f17b1804b1-490ec30f6aamr146216505e9.0.1781532623124;
        Mon, 15 Jun 2026 07:10:23 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-88-103.ip49.fastwebnet.it. [93.34.88.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea9563b8sm223213855e9.2.2026.06.15.07.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:10:22 -0700 (PDT)
Message-ID: <6a3007ce.73de60af.3a056d.d903@mx.google.com>
X-Google-Original-Message-ID: <ajAHynRJ1jnbycam@Ansuel-XPS.>
Date: Mon, 15 Jun 2026 16:10:18 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v7 05/12] net: phylink: support late PCS
 provider attach
References: <20260615122950.22281-1-ansuelsmth@gmail.com>
 <20260615122950.22281-6-ansuelsmth@gmail.com>
 <867a39de-ccc2-4dcf-be24-ab2542d20ab6@bootlin.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <867a39de-ccc2-4dcf-be24-ab2542d20ab6@bootlin.com>

On Mon, Jun 15, 2026 at 04:07:03PM +0200, Maxime Chevallier wrote:
> Hi Christian,
> 
> On 6/15/26 14:29, Christian Marangi wrote:
> > Add support for late PCS provider attachment to a phylink instance.
> > This works by creating a global notifier for the PCS provider and
> > making each phylink instance that makes use of fwnode subscribe to
> > this notifier.
> > 
> > The PCS notifier will emit the event FWNODE_PCS_PROVIDER_ADD every time
> > a new PCS provider is added.
> > 
> > phylink will then react to this event and will call the new function
> > fwnode_phylink_pcs_get_from_fwnode() that will check if the PCS fwnode
> > provided by the event is present in the pcs-handle property of the
> > phylink instance.
> > 
> > If a related PCS is found, then such PCS is added to the phylink
> > instance PCS list.
> > 
> > Then we link the PCS to the phylink instance and we refresh the supported
> > interfaces of the phylink instance.
> > 
> > Finally we check if we are in a major_config_failed scenario and trigger
> > an interface reconfiguration in the next phylink resolve.
> > 
> > In the example scenario where the link was previously torn down due to
> > removal of PCS, the link will be established again as the PCS came back
> > and is now available to phylink.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> 
> [...]
> 
> > @@ -2151,6 +2204,10 @@ void phylink_destroy(struct phylink *pl)
> >  	if (pl->link_gpio)
> >  		gpiod_put(pl->link_gpio);
> >  
> > +	/* Unregister notifier for late PCS attach */
> > +	if (pl->fwnode_pcs_nb.notifier_call)
> > +		unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
> 
> I wanted to try this out, but I get :
> 
> drivers/net/phy/phylink.c:2218:17: error: implicit declaration of function ‘unregister_fwnode_pcs_notifier’; did you mean ‘register_fwnode_pcs_notifier’? [-Werror=implicit-function-declaration]
>  2218 |                 unregister_fwnode_pcs_notifier(&pl->fwnode_pcs_nb);
>       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                 register_fwnode_pcs_notifier
> 
> I guess you either need to stub this, or there's a missing Kconfig
> dependency somewhere
>

Hi yes if you want toi test just enable CONFIG_FWNODE_PCS. I forgot to add
the static declaration for unregister_fwnode_pcs_notifier. 

-- 
	Ansuel
