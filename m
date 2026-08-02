Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BD1345EC8
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 15:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785684276; cv=none; b=c9W6OSzG//eDj9vR/BFGwiwvvEHhcbVfRx7w3Runv+VftK7ODTEEjjO1buoxqPRVxvMKZBhYs/CFXdgfyVHAm3RvCuteZoCpXg8pz6/4seiEpu+dtx+fdfczM5Ew0BySnSrBHIG33zRaONU69XziKe7jkGX5TwVcNM6sOqf8OAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785684276; c=relaxed/simple;
	bh=I3UgxVcwvhGVd0HTYTSEfKEsUIGC5xDKAhalzAq0A+A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gfTHnqnQTFqr7FIsLqa50M8l+CFXDzxneZFdF1uRUGCtr2+IUpW3jW8TzfN+F1qBHi85O8x8Sx9nbVRTcuH7/7+2a8Ys0XUXqSUcEVIaKxsWq0qnScCzP6PLlfeoJYschbmGi+8fuUeJIxyj1bozzIm/ILNVMfeIk395l4E6HBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ai+ilIpN; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ai+ilIpN"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f7872abb6so1668785f8f.3
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 08:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785684270; x=1786289070; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZIAs7BonL5OHtmcJK5pQoVXNAcT4bPKRZJcULhZO5Is=;
        b=ai+ilIpNN0peNP9NGNzpO9J8wZ3oAYf7jnfnSZ1vXypcOku9hB2QJJAllzZplZNVgf
         F2az1ZLp6FmY+wNm0h9J63FyUZi9s9cGZ/hJ0ZNPbidqcsBPgAgsixod2hAeaSWgUbPB
         xQfiiRNGB6VPfR78EIIWnDFH3VqwIgksJy34KIvz3QGb36xl4PPMUMlNWbU1HqA2Ft7O
         iZA/I+Gd2fTHd9az98E+klX0ZcTx1WUamh+ieAfEiRwEmCZy+hmHXkJoN5XjOT31boao
         smRnUxKIN96Fu3gVldcxnFKLcKQR8l3wLLtY9TVcUN7qMXiXmOGkmKCPHBiqyCpf8bjK
         Co9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785684270; x=1786289070;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIAs7BonL5OHtmcJK5pQoVXNAcT4bPKRZJcULhZO5Is=;
        b=jPaM9XODH+Lg7kNzq/lRbdSV5oLW0BuntP59LWFMe8tu2DYBg7ytnDZo44NnoCqCeg
         FfkNIsIwOA8QU9uKyyR3uYkGXRczYt6u0qDeZJzpr3nHoDjUw2lHY6j16gy2NZyR1qWI
         oe2N8Ch9c+bfU74cVE75LPOGOZ6F0hnpRMhfqaWWgcXy/nniCNBY3me9oVej8asIwUXf
         D2y+KZ3moZDuyVQvpjl/zH4AXhvmmIAG4nk7O4mUwNg0t23ZkWlNqNmnVSoRwFskWS0j
         a8TEq3y+GRGImo4Gy0wSx6QnKtewB0nAAJu18hglmvuqzy4lNqcWb2g/dNdTVlO1qYIv
         LzcQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlNTMigRe88oUoSB+H70aG1CDBwCLFxFCAJcqzmxvg0tTr0Pe/5ny1nc3Fl36tOqcIv/24KjpK8E61@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6R4cqJg8ZztfLwel6/0oLp5WdlwHmt7XoWoCATxRg9aPYAiJH
	CFitphR+QJiJQz50JvE9ww1fN3hl6r68Tl+LOTcJh0aE4iRXS0PqJ3uIj8/E/CRhOaI85dpJG7u
	5sP4g
X-Gm-Gg: AR+sD11QrbmCPMhUYXalnOkjsLD8y/rSxc5EuLuRIuhftGCSMY/D61alZXRgJ0kvB/W
	q6IFgfn48BA9kh9u+3lfUt/RI7a8y7VkB92bS8DXhdrs+qESppHY3Ue0HsagiF8DXOeyjiLf4Xx
	FqfkR4Ep9L0bjd1mi1kARmGYYIs7stMzTuRA+2b+/zkVQDnqmns1+ziyGwM2JoMAphbv7XnUn5G
	rZLTTTdclIraB7NswS0JOJ5e5ZvsqwFrK+XO0IUo4CF9vd6eqgHojDR1wfD9kbBcosljV7Zzc24
	XGIDerDA6a9AiQ3vD2THLTFmt3nbOtAwPaXqJY0xsbiwf5gEGdtAMBbVypITe58hhViFwz1nl1L
	/I5VEGKPmJA5hQDzGBgyPv6Kpux0UWMpX1iX73wuKbOpgkPPbM3+0Nfp9Au7N2XAR74yd98XUAV
	Cb8vHcyJ31B+1I6BKhWHO4iR8DXS/XfUJ7WdVUrB4tG+r0Fzgc/jvwmx5zHBE=
X-Received: by 2002:a05:6000:29d7:b0:47f:c3a0:eeb9 with SMTP id ffacd0b85a97d-47fd72a8e96mr11079018f8f.3.1785684269987;
        Sun, 02 Aug 2026 08:24:29 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:8f07:a4d0:36de:3713])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd45a1abfsm24042016f8f.37.2026.08.02.08.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 08:24:29 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev,  conor+dt@kernel.org,
  devicetree@vger.kernel.org,  robh@kernel.org,
  linux-sunxi@lists.linux.dev
Subject: Re: [PATCH RFC/RFT 2/2] net: stmmac: Add support for Allwinner A733
 GMAC210
In-Reply-To: <20260801163100.639F21F00AC4@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Sat, 01 Aug 2026 16:30:59
	+0000")
References: <20260731-allwinner-a733-gmac-support-v1-0-d0a8732bfa82@baylibre.com>
	<20260731-allwinner-a733-gmac-support-v1-2-d0a8732bfa82@baylibre.com>
	<20260801163100.639F21F00AC4@smtp.kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 02 Aug 2026 17:24:27 +0200
Message-ID: <1jv79slf4k.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On sam. 01 ao=C3=BBt 2026 at 16:30, sashiko-bot@kernel.org wrote:
>
>> +	if (!plat->stmmac_rst || !plat->stmmac_ahb_rst) {
>> +		dev_err(dev, "missing required reset controls\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	/*
>> +	 * The configuration registers are inside the controller
>> +	 * reset domain, so the reset must happen before any write to them
>> +	 * and should not be done again by stmmac or the configuration will
>> +	 * be lost.
>> +	 */
>> +	ret =3D reset_control_assert(plat->stmmac_rst);
>> +	if (!ret)
>> +		ret =3D reset_control_deassert(plat->stmmac_rst);
>
> [Severity: High]
> Will this cause a bus hang when writing to the MMIO registers?
>

No it does not. I've checked.
Actually touching the ahb reset here has negative effect. stmmac does
not properly detect the link type then (GMII instead of RGMII)

> The code checks that plat->stmmac_ahb_rst is present earlier in this
> function, but only toggles the main mac reset here.=20
>
> When sun55i_gmac200_setup() later calls regmap_write(), accessing an IP
> block over the AHB bus while its AHB interface is still held in reset
> typically causes a synchronous external abort or bus hang.
>
>> +
>> +	if (ret) {
>> +		dev_err_probe(dev, ret, "device reset failed\n");
>
> [ ... ]
>
>>  static int sun55i_gmac200_setup(struct platform_device *pdev,
>>  				struct plat_stmmacenet_data *plat,
>>  				const struct sun55i_gmac_data *data)
>>  {
>
> [ ... ]
>
>> -	ret =3D regmap_write(regmap, SYSCON_REG, reg);
>> +	ret =3D regmap_write(regmap, data->offset, reg);
>>  	if (ret < 0)
>>  		return dev_err_probe(dev, ret, "Failed to write to syscon\n");
>>=20=20
>> +	plat->flags |=3D data->flags;
>> +	plat->host_dma_width =3D 32;
>> +
>>  	return 0;
>>  }
>
> [Severity: High]
> Are these custom hardware settings lost after a system suspend?
>
> The driver configures critical hardware properties like TX/RX delays and
> PHY interface modes in the MAC's internal glue configuration registers
> here, but does not appear to assign a plat->resume callback to the
> plat_stmmacenet_data structure.
>
> If the MAC loses power during suspend, won't these registers revert to
> their default states on resume, leaving the network broken because the
> generic stmmac_resume() has no way to invoke this glue logic?

Assuming there is an issue here, it would be a pre-existing one for this
driver, same as the sun55i-a523.

Let's not get ahead of ourselves. Support for this chip is still in the
very early phase. I don't think we have the means to test suspend
yet.

--=20
Jerome
