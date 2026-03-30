Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948493EBF14
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 22:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774910275; cv=none; b=ugUtR8v51vvWgBiLYK8/RO2lRjAGL+powDbTkCw4T2GtIVzDjkLyKQvOgVVRk0gk+p8RK09OfYiayOFsKK0mO3Z2c0+GGHhoMV1NjoiaVdcgeJAnH7cx978zxugda/xdQJs77txWsqj4/RZHSCIDLXQdS2c3qJj8DQJWpgZcDIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774910275; c=relaxed/simple;
	bh=EQimx+QysHLjjgSi9/ePA+PjBK6gGiEFjWC4RPJeIv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ee7YHj6ER5nuDdeJZ9PPpDKPBo1zC9B9NiAdzUk+sQhZHgky3zRuy2hy8Fnqk75+k0gAe9+QOvGn98ug9i+Hi9OwLFASoOHJPFqDAtaGvvHLbf3/O/2+vJsGyJhvc2LR1xy4wpQYySYfvRjx7Hxah89R02/MttDqxp9mf8T5nIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UE7cC5U5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UE7cC5U5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-485358f43e7so5565155e9.2
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 15:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774910265; x=1775515065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3jfJJje0KBtM9hz5w5lHt1nnYJf3r1NFmOVPbBE39ug=;
        b=UE7cC5U5fTRYpE7ImKu2qQHK2s4yHX1nWr9iiSS5gZpGBZpsFvzNLPJ/v+yhJ5L8VQ
         JnF/MHhy3pcy4X49sNnJG8oUtLJuao+wVd6l4x5uc91fk+hafx0vYe7ZE3KB5l/1lb56
         Xjxt1IpJus9WOylHD52QflZ6mawaFG++EoWAWOaRxo9o1+LdOOxVBXVq1P3FKozDMnqd
         osvCcBgcX1HUbFuLpAQPfhxS45UWG4rvyw8fk0seCxgiNU/tSbTEBbu9PptKjgkSwseX
         1A2qwYx8GTVpjiMKT+wUmUDY2Ka1BhVVrZO5zXik0wL2C5XwIAZgHDhJWB0GTxyI9eqL
         q0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774910265; x=1775515065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3jfJJje0KBtM9hz5w5lHt1nnYJf3r1NFmOVPbBE39ug=;
        b=cL9EtdeLSw4iW1P52Pn2se9HjriLeGvFOZfPuyP5HaY/6OH/Irv2iPRelbMdGCK+oq
         Ors4JrPCv0sLtdWZ/4zPjwBGD1in5bAAsDXBDBG+AMeiskbdPETrB/3e/LQjJqper0BI
         8T/Vb9jRpOfh3wqQxjORqDcUAmPkgVgdlvsaV+skhrnoHJvfhhyvFCsPyz+OrAolAoW9
         EkIy7trRLkgKTPqvx2K6Kdf71QyHCOC6lGMxVmqOzxk/9ISoW+3x2pEYOv4S2TmbtP4n
         T9ruLmppUHnRr1Am6TZj1zgK47yMIdZcaEYXsxE7OznJQU5rDHCTtEtgHw0t3BuWCQ30
         qY/g==
X-Forwarded-Encrypted: i=1; AJvYcCUxxd3EnzNDMjZ6NV+DkLpdgw/Jfhl9cYYCmD6EnxiWE1vfeqWHLwIyTBm+3WAdTiSZ3wzDofAJA4P6@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv7dZjUIyV21BnM6IIglVPJ7uwxF5i5sg4BlgXPK52DcbPGb9U
	vDha9eXcZnOnVblqeUrTApPmbQ0qil04gWVptfm6LXTcdZfVoAeSrkaT
X-Gm-Gg: ATEYQzw94PKtjcvAcQrDY50xxoUbvA/rLbsLNa65EXc4mzLjZd/SIe5lGiLf+gRReHv
	fWVZERNx01/hsQyZZvAZFEGVMdqMZXu1/DWtmVV698BAIIrOvLYsANs5s3RYn8Tfv3dl/epmk/7
	5kx0WS2SM5H13UOzd0GngycjCQKJsddA38DTAMbmVmISlE472Ku24TlL4qGovImr4i3qeuAf74R
	F6Uyp218pUf6BeZfNB+eCsVnXU8F/tMGjYkTNo7oljYYH9kePlQt+OpSjWN2+J0Vmspy8JzcogW
	3yoMBFFYGanDcjOE22eJcB13rMpOJrKe5R4hfJv0YWRnKNxZSdXHWG9aRVkRWgJ0QQAQ7bx6SS2
	8fXGIpZhLDn/I6BRPMtJIdbgzM6CmXEeg+i9RctBhvdyeMPTPBWCpdu8GamgQCOKrshCPHD7LOl
	5B9V006SzdleOXulzZYwd0/h5SBw==
X-Received: by 2002:a05:6000:4014:b0:43c:fd96:2b8a with SMTP id ffacd0b85a97d-43cfd963552mr5568854f8f.2.1774910265013;
        Mon, 30 Mar 2026 15:37:45 -0700 (PDT)
Received: from skbuf ([2a02:2f04:d50a:b400:fc92:d05b:3301:b722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm23222604f8f.30.2026.03.30.15.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 15:37:44 -0700 (PDT)
Date: Tue, 31 Mar 2026 01:37:41 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH v2 5/7] phy: ti: gmii-sel: add support for J722S SoC
 family
Message-ID: <20260330223741.pmrx25cslrlpbcea@skbuf>
References: <cover.1774354734.git.nora.schiffer@ew.tq-group.com>
 <5d00697f133cd33a1df62ac7ebf73e507e49ed2f.1774354734.git.nora.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d00697f133cd33a1df62ac7ebf73e507e49ed2f.1774354734.git.nora.schiffer@ew.tq-group.com>

Hi Nora,

On Tue, Mar 24, 2026 at 01:29:41PM +0100, Nora Schiffer wrote:
> The J722S gmii-sel is mostly identical to the AM64's, but additionally
> supports SGMII.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  drivers/phy/ti/phy-gmii-sel.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/phy/ti/phy-gmii-sel.c b/drivers/phy/ti/phy-gmii-sel.c
> index 6213c2b6005a5..4e242b1892334 100644
> --- a/drivers/phy/ti/phy-gmii-sel.c
> +++ b/drivers/phy/ti/phy-gmii-sel.c
> @@ -251,6 +251,13 @@ struct phy_gmii_sel_soc_data phy_gmii_sel_soc_am654 = {
>  	.regfields = phy_gmii_sel_fields_am654,
>  };
>  
> +static const
> +struct phy_gmii_sel_soc_data phy_gmii_sel_soc_j722s = {
> +	.use_of_data = true,
> +	.regfields = phy_gmii_sel_fields_am654,
> +	.extra_modes = BIT(PHY_INTERFACE_MODE_SGMII),

I'm not familiar with the hardware, but "mostly identical to AM64, but
additionally supports SGMII" does not explain why j722s does not inherit
the features that am654 has (PHY_GMII_SEL_RGMII_ID_MODE and
BIT(PHY_GMII_SEL_FIXED_TX_DELAY).

The phy-gmii-sel from j722s does support RGMII, right? Because in lack
of the PHY_GMII_SEL_RGMII_ID_MODE feature, phy_gmii_sel_mode() will just
silently skip the regmap_field_write(regfield, rgmii_id) call, and
return successfully despite an incomplete configuration.

We have the phy_validate() call and phy_ops::validate() through which
the PHY can report to the Ethernet controller which phy_interface_t it
supports and which it doesn't. If the j722s doesn't support RGMII, maybe
it should implement this method.

> +};
> +
