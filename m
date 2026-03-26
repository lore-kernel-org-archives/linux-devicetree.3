Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D3C30B501
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518139; cv=none; b=LxeweKwG3HkJ2ZvrpoyPE8rpHZVIPvQs5QXdHZmE34dzPPxt9CB9NkKMuz61pGfkyN6ouLTnUHVJHMgxs6URg8UPZ2IKr2q7NMspJR+8NpJEvc6OWsBAtg1O9ln2Yzvlu1Y0+s170frEYRJWmzChUpYytuvB4XgHoiILaHnw91k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518139; c=relaxed/simple;
	bh=zWYr+qztsci4xUDGsyVLLiu2KnsGt694wGsFHwa6Opg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qiQoROqzFo9HSK8M6kwUnJ+6anQc68MYGvGtyn4FeU8I9BrCW/CbQ+RmMjz1Sd+0rSX+YPxOJZU7hy3fKBfvU3fIUolQxCUAHdJuln2ZFNRAsZV2yAFFs/dUVNeRq5rZjzPUUcS/32UriGPwLZ/xFnhzjG/b1HzkcF7EsMxxdoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=piMiAPR+; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="piMiAPR+"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43a03284a08so39871f8f.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774518136; x=1775122936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9S62wraGGWuFLRViippcyE9BcofvCghK7ZcArgqLNk=;
        b=piMiAPR+i/MtUreI5lcRQhNR1sxSQxR0s8BunWlNE63YHIzodoGBtYe8Cq+uGkHciE
         81ZIp37W461krMciGMN7KKy3cSsyEBYmR+7rjziPzpv0lBp2HulPjrBNEh7LzNtrvtv1
         h/OR3EREDU1r1NzvpG2571WyLQsR9q1QCAuHymvF2JwR4/dkzrF6WXhyzYWMwR9H1L4V
         eoiv+n1krHcKb6AJ+1K4RO+gWQQbH3ONFL5PPfzJrgb7wZO7wsGnZoQk+5cd8/tg8uIo
         w2+8B/+41FTYXzV8dtK4siu1rI2OCSFOABe5t9DiOZKHaC6/XWvdaJvYW4WX0iK+8DSq
         YLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518136; x=1775122936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9S62wraGGWuFLRViippcyE9BcofvCghK7ZcArgqLNk=;
        b=a6vmxyqE5Y4fEmKalh2aamPXMK4fXEHfDPZDquTo8XxwBRbRPN372hXGZcLQbiPDJx
         pNmFEKgRm7qtTmRbZ2zK/P1XWYKDFiPYUH6vIT+GQzKV8oW/3RSwj2enhZXnpte3SVYX
         YS1OGKF4Yo7JPA6fq+2M/8TNHvbkpe64+TCa3ofYuTns8Vm5OQUNmpLlSTM1HdzvUMt1
         EMdrmM96QSGlctUgkKBaqnTZat5hsfkSO6J6rui14GcRpv9ClF0S6B2EvmF1E8a/DMds
         g6FuQXLv4gOdxPISWgx1c7jXFM005lMF6r88nnyzGDV2jQOi29s8wCRclNUlVcfNZrGW
         j0qQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3eS/2ORnuABoQ6XOx8V9mur5ygDlbdCn11upTZGuedDpS9o0CqK400NZjJRv3gZIpgsvgsrCG4e8e@vger.kernel.org
X-Gm-Message-State: AOJu0YygC2wVr+8rxu4MhXKFX/SNW30MBroSrjWeFJ7KeXf29QYM31gc
	Sq0zkbywF6QVJjaEvuCtTKxQcNV2v6JfB7q0e6/ySXDvs0QBDkHBhxLu
X-Gm-Gg: ATEYQzxP4BRIw49cxRHZMVtTqdu2tGJv10cKFZ6wDpplqUNAdpeu8aw98ZMEFwX1qrX
	Uw4ladTtV72JrrXNh8VNbMse4esvytR6eUkIghxW/MnCpD36fnB1vxnla96wgCDyKU9RcZT3VP3
	0/ZmZD0VK7SYTQoub2BrSpnlxWVHvq6BhmRt637ga58dpX+79gZhXryjqlt5EYgBwRQR+fRqnKs
	5l0TQ4eJn3DkQdVH/ZTojJmI7BNhdZ+VD1zWa8A6ZAbeA4RQQII9ZBiUO82cwr7Q+U7WkAa3bDP
	TFSEUcw36S+AC6L2HLLPVuuXPjeEAIrzBh63UaIriW+i+uc1WiwYqBJTEHtULOwzrb6dG1w/bY9
	6zHRklimHonIu+wjJ8HoLSPYQLEcngmH5oHDLQGyhWm8WM/ng8Kbrl+vzAronZkaRDRQTGtr3c5
	YoS4sd9OkXEIAhgYs=
X-Received: by 2002:a05:600c:4f95:b0:486:fcf9:5ba with SMTP id 5b1f17b1804b1-4871609da81mr58564565e9.7.1774518135734;
        Thu, 26 Mar 2026 02:42:15 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d50a:b400:cf79:b8bb:14ce:d80f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c9f0afsm33134005e9.10.2026.03.26.02.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:42:14 -0700 (PDT)
Date: Thu, 26 Mar 2026 11:42:11 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Fidelio Lawson <lawson.fidelio@gmail.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fidelio Lawson <fidelio.lawson@exotec.com>
Subject: Re: [PATCH 3/3] net: dsa: microchip: implement KSZ87xx Module 3
 low-loss cable errata
Message-ID: <20260326094211.hdaf4tz7lbjyjznn@skbuf>
References: <20260326-ksz87xx_errata_low_loss_connections-v1-0-79a698f43626@exotec.com>
 <20260326-ksz87xx_errata_low_loss_connections-v1-0-79a698f43626@exotec.com>
 <20260326-ksz87xx_errata_low_loss_connections-v1-3-79a698f43626@exotec.com>
 <20260326-ksz87xx_errata_low_loss_connections-v1-3-79a698f43626@exotec.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326-ksz87xx_errata_low_loss_connections-v1-3-79a698f43626@exotec.com>
 <20260326-ksz87xx_errata_low_loss_connections-v1-3-79a698f43626@exotec.com>

On Thu, Mar 26, 2026 at 10:10:23AM +0100, Fidelio Lawson wrote:
> Implement the "Module 3: Equalizer fix for short cables" erratum from
> Microchip document DS80000687C for KSZ87xx switches.
> 
> The issue affects short or low-loss cable links (e.g. CAT5e/CAT6),
> where the PHY receiver equalizer may amplify high-amplitude signals
> excessively, resulting in internal distortion and link establishment
> failures.
> 
> Depending on the selected workaround (1 or 2), the driver writes a
> specific value to the indirect PHY register
> using the 6E/6F/A0 indirect access mechanism.
> 
> The errata fix is applied during global switch initialization when
> enabled via device tree.
> 
> Signed-off-by: Fidelio Lawson <fidelio.lawson@exotec.com>
> ---
>  drivers/net/dsa/microchip/ksz8.c | 46 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip/ksz8.c
> index 78b42cf50ce2..b6f3a1ce85fc 100644
> --- a/drivers/net/dsa/microchip/ksz8.c
> +++ b/drivers/net/dsa/microchip/ksz8.c
> @@ -1901,6 +1901,41 @@ void ksz8_phylink_mac_link_up(struct phylink_config *config,
>  		ksz8_phy_port_link_up(dev, port, duplex, tx_pause, rx_pause);
>  }
>  
> +static int ksz8_handle_module3_errata(struct ksz_device *dev)
> +{
> +	int ret = 0;

"ret" does not need to be zero-initialized. It is unconditionally
overwritten by ksz_write8().

And please sort lines with variable declarations in decreasing line
length order. Netdev calls this "reverse Christmas tree" ordering and is
the preferred coding style.

> +	const u16 *regs = dev->info->regs;
> +	u16 indir_reg = 0x0000;
> +	u8 indir_val = 0x00;
> +
> +	switch (dev->low_loss_wa_mode) {
> +	case KSZ_LOW_LOSS_WA_1:
> +		indir_reg = 0x3C;
> +		indir_val = 0x15;
> +		break;
> +	case KSZ_LOW_LOSS_WA_2:
> +		indir_reg = 0x4C;
> +		indir_val = 0x40;

Do the 3c and 4c registers have any associated documentation? Do we know
what they are or what they do? We should have some macros for them,
instead of magic numbers.

> +		break;
> +	default:
> +		break;

Is it expected that in the default case (no workaround), the code flow
writes indir_val = 0x00 to indir_reg = 0x0000? Or would it be better to
just exit early without making any change?

> +	}
> +
> +	mutex_lock(&dev->alu_mutex);
> +
> +	ret = ksz_write8(dev, regs[REG_IND_CTRL_0], 0xA0);
> +
> +	if (!ret)
> +		ret = ksz_write8(dev, 0x6F, indir_reg);
> +
> +	if (!ret)
> +		ret = ksz_write8(dev, regs[REG_IND_BYTE], indir_val);

Is this sequence better suited for ksz8_ind_write8()? Perhaps wrapped in
another layer similar to ksz8_pme_write8(), once we know what the magic
numbers represent in terms of indirect table?

> +
> +	mutex_unlock(&dev->alu_mutex);
> +
> +	return ret;
> +}
> +
>  static int ksz8_handle_global_errata(struct dsa_switch *ds)
>  {
>  	struct ksz_device *dev = ds->priv;
> @@ -1915,6 +1950,17 @@ static int ksz8_handle_global_errata(struct dsa_switch *ds)
>  	if (dev->info->ksz87xx_eee_link_erratum)
>  		ret = ksz8_ind_write8(dev, TABLE_EEE, REG_IND_EEE_GLOB2_HI, 0);
>  
> +	/* KSZ87xx Errata DS80000687C.
> +	 * Module 3: Equalizer fix for short cables
> +	 * The receiver of the embedded PHYs is tuned by default
> +	 * to support long cable length applications.
> +	 * Because of this, the equalizer in the PHY may amplify
> +	 * high amplitude receiver signals to the point that
> +	 * the signal is distorted internally
> +	 */
> +	if (!ret && dev->low_loss_wa_enable && ksz_is_ksz87xx(dev))
> +		ret = ksz8_handle_module3_errata(dev);
> +
>  	return ret;
>  }
>  
> 
> -- 
> 2.53.0
> 

FYI, the driver is in a restructuring process. The ksz88xx_switch_ops
will be split out of the common ksz_switch_ops. This will conflict with
your series, so you should rebase on top of that much larger set.
You can coordinate with Bastien Curutchet to see what is the status:
https://lore.kernel.org/netdev/20260313153849.qkfzv5c2u6fepjku@skbuf
