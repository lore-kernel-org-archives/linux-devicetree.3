Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795304932;
	b=4EfhKMNtH2K1nFM1UDgLC6JxJclXRTwn8KuJxV1PxDeFm5g2AiLXnYDL6ULYY2T+Lflm
	 QrvFBGG7dGsT03n4FA6aOcDCW+ByNdXNCUGYNM7lbLS3DHI7PEBosnBvl6pbOwRkZK2x7
	 tNoc1sigWt4yAs9hg+wN3yJ44b4HXkWH3q3G/19X4PvZGlA0yBm/ZOF7C4+lxO6rI1Qpa
	 SziHK77bPm2BhlInaWhQtPnhtBMMSFqfbHWPqPpAWZc3S34ompkreH1y+90u2cOnYRAz4
	 u56J0EYiUBTQOc6OkpeWgQ1CTHp0mNv4+N2ii4XC6voLO0XzfU9PmEEh6MdU1NYdzzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795304932;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
	b=3e4eYRgzS5vluBwFpLkGliy2KN0GdHDaIYXBT0Uy+siU96/u8bpR5cqhu3DYu2YVz551
	 p+RKx3+umLpJYd8uKnf24Qy4yAaP8BlqGaU0jok4wtAf30PYFC45TDpLAo9wv7HWtZaME
	 r+2DfkUvE3VmmIaB7a9iXdxjMQZzbvnGgNVLhU1GhG951fYLxR8oOcSUk4/H+uibAPano
	 4Au87KKh30ZaNZx8jyxuSzCGd/oBEI2wDBIg7UgNjND8nOl/LBVnGz/YwUYHkWRBC5QwU
	 2LqLORCDY86rxpp+Rm0u15rvrWulxkmYqTWmjdD6hMl05FZ6qEfI1ojWesE+b3Ub81w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AEi1dkvd;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9460606A32C
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 23:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9460606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AEi1dkvd
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so1811676a91.3
        for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 15:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795304931; x=1795909731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
        b=AEi1dkvd1iAbx9IB0IMCR3UE9iO988yBfhfkjx2i9mjncbiEHVVBFfXZ55Siz7OLad
         hKHygBI5EWiua/IGIhAo+QKpeDXT8b53qhFXdt7p7s7V/9J9qP7c1BMuZ39aeIz1bNMp
         Q5phb+V2Pyo6/7Ai2Xa9ooMuCCFBEHhUaBnFWlAxify3gS+UOZTiTfDYlkdkCkW0uCf3
         AJwvk0btxPHVDq4GCveTblWNKSY5m7900GqJulzpo8SuxUWx2gSZMhJIgY+ZzmGhwTtT
         p5XgjLG4heBRdLTVV1CR3Ksn4UjSIq4gBcvaBrwjndr8vwfNdrxDo95yzhO04Xvct/wG
         lvAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795304931; x=1795909731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wM708HwhUcKpDxEYjydx9KDWixNA1iE81j9OUZhkFbw=;
        b=rhFsaibBG32AiQvKQHg7znSh3P+o4gltSZGd1f5o7KPpkU6QymMwbiS0xC8pyEX0VT
         ryD0nBGzsqeFsDH8tqR5ncbUwXWUaSzesyytrTxu7tvsH+q0XdERJEP17p99iFOMEgxO
         W37DfOB8r2pGJ8eQSuwvKZi6IQoh73/L9iJVB7FljWzzmQMDGXlCfS9Gx4pnwOJivoZm
         Yn3aPAhwnOX0lJ+wc/6SUXOwCGDSPONyEI766a6F1djGLKI5WVhmQNi1wTSGXurhzo5Q
         L8NjIHXWPKud6CQAARi4Odo6vwnpbpMCseVNS+0vgKG1s6bmeP+bPoYgMaAJDtPYbgXK
         O4Ew==
X-Forwarded-Encrypted: i=1; AL+hErHQDL5w3oRUOC+blIyl99SahsggY+75rANK0OwSocLXOePPrTHQtwdzAxGJkDGCDASBlHXQfaaHDqjX@vger.kernel.org
X-Gm-Message-State: APuU4Z8lrgd7gSNIE0SKRYrYaKiLX0eStC61DhfiGOjELPRJ7Ch7wR5N
	ZeHvWfCp68W55KDw0I7yADMH+/2QV5RdkULamqjTVmYADp5gyYieNa4X
X-Gm-Gg: AZFdTZfp4Wnc3FJUrn/FowBoDSZJfODEJzWHhLyBVSx+5eopf9WZAARGnmKns6tlozD
	1VTDECs4VGo8IgESCZXPvYkrdAz2pR8qnxdx4j9x3k87FvLwuUg4cGV4ZVU59Pgp1ao1Psg8MQv
	td45/4kIvXwuU9N/YjxT1NjZ0zYWTXN7BdR5GAYud7GU3o3CqT3qlWXBql+UBocDEDQpXYKZ6zR
	Z9Ol/Z00ShHUG4jW+l/0HCwiAtV8nKe7hAjSQiRe/AmVPm/MV/YnUWTHaMZsxvHlSX/w0dS/yvt
	U1JRSJM3GyVz4rd0qKTiI45D4yB0UzKjyNmqTVlW4Suf3lP9bn+8vt4/yEBZmaqcehwxngMzLHo
	DXCMgR6DE/P4Et5Le+Gy/hKQMhxFsvKczSNEpZsFnN1zZyMaXfMBKuiZUSse1qtCPIzzvZZPbl7
	NYmHyWNnm0O6LMsA9wrYS/yoDiuuR+9L6rpZqeKpLRwCsNHk2/pW7Rly91quOl40oyKVNYlXUzq
	f7sRBrtlPoTppWh80G5SevVnrTtHiWRR4tl7Tn2ccLcpVxevYRbPcfy2ja+Z/Ii0KTsH2O6mJXE
	c96Q13bUTn92ZGlxCL5YZHLtzsk=
X-Received: by 2002:a17:90a:d2cf:b0:3b4:1714:5bfc with SMTP id 98e67ed59e1d1-3b41c9b9dc1mr6761492a91.61.1795304931081;
        Sat, 21 Nov 2026 15:48:51 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41abb1b66sm10532985a91.1.2026.11.21.15.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 15:48:50 -0800 (PST)
Date: Sun, 22 Nov 2026 07:48:17 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: gaohan@iscas.ac.cn, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>
Cc: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: sophgo: Keep SG2042 gates listed in
 protected-clocks enabled
Message-ID: <awIs42O_vJN3gB7l@inochi.infowork>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
 <20261122-b4-sg2042-efi-rtc-v2-2-6d087e03e4e8@iscas.ac.cn>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261122-b4-sg2042-efi-rtc-v2-2-6d087e03e4e8@iscas.ac.cn>

On Sun, Nov 22, 2026 at 02:18:05AM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
> 
> On Milk-V Pioneer, EFI runtime services use I2C0 and the serial flash,
> while Linux drives other devices behind the same gates. When those
> devices runtime-suspend, the gates are turned off under the firmware.
> 
> Mark gates listed in protected-clocks as critical. Unlike qcom, still
> register them, since Linux devices use them too.
> 
> Suggested-by: Yao Zi <me@ziyao.cc>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  drivers/clk/sophgo/clk-sg2042-clkgen.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> index 6abc2c973c49..65ab18f701e1 100644
> --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> @@ -840,6 +840,18 @@ static int sg2042_clk_register_divs(struct device *dev,
>  	return ret;
>  }
>  
> +static unsigned long sg2042_gate_flags(struct device *dev,
> +				       const struct sg2042_gate_clock *gate)
> +{
> +	u32 id;
> +
> +	of_property_for_each_u32(dev->of_node, "protected-clocks", id)
> +		if (id == gate->id)
> +			return gate->hw.init->flags | CLK_IS_CRITICAL;
> +
> +	return gate->hw.init->flags;
> +}
> +

I have a question on this: since a procteded clock should not be touched
by a driver. Is this logic necessary? I guess this is a shared clock
topology between the kernel and the firmare?

Regards,
Inochi

>  static int sg2042_clk_register_gates(struct device *dev,
>  				     struct sg2042_clk_data *clk_data,
>  				     const struct sg2042_gate_clock gate_clks[],
> @@ -858,7 +870,7 @@ static int sg2042_clk_register_gates(struct device *dev,
>  			 NULL,
>  			 gate->hw.init->parent_hws[0],
>  			 NULL,
> -			 gate->hw.init->flags,
> +			 sg2042_gate_flags(dev, gate),
>  			 clk_data->iobase + gate->offset_enable,
>  			 gate->bit_idx,
>  			 0,
> @@ -900,7 +912,7 @@ static int sg2042_clk_register_gates_fw(struct device *dev,
>  			(dev,
>  			 gate->hw.init->name,
>  			 gate->hw.init->parent_data,
> -			 gate->hw.init->flags,
> +			 sg2042_gate_flags(dev, gate),
>  			 clk_data->iobase + gate->offset_enable,
>  			 gate->bit_idx,
>  			 0,
> 
> -- 
> 2.55.0
> 
> 
