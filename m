Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795157928;
	b=JvFOb5j7/kvVMf1o/0/imaxy4oEKFkfyT0/YmI17iv5pF1pLXHSVjezo/kFhZfdSEH8V
	 K+JNeg7EeFOoNeZoqw0/pmqs59WlkVcVYgGPo4XOf3l/JB1Nzhcbv6SUS6tCMbqC5BWQL
	 rFch5CbwrbPnVLTh1eWKDUWVekEeS4CKNi8PWGEjPFkFPC7jzvyhldqTW/IfDfvw5Ocet
	 hhGBuLCA1AxGogbMN9dQKNTgJiR0yC3tJ4zZT5keY5KS6WIMbeEzy4zA5ZSYLHPaAIBjo
	 yAkpAdiJjlHpaQpWC6sKRz3kIKRh1pkEHqD5L5QdlUswGOJ1ngqykRJpadWM3y5UqyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795157928;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=D7mHdJTvEsH8KV6HnKZGTk0iLCumja+GPMGSkHUssA0=;
	b=0FvkOqzVrOhXUbUDfTJP+lORpVTalkV538TBerTCDGRxcjMrNBFw+EFXmMjsZpeDSVKk
	 egPhBIQEo+7lDl/9FHd9ZtJAOhUdmoMR+VLA/XpjE4ueo7HeT2gJUOBGs/2y+ZgZU4pVr
	 5Ij1ItIiYHfT2ScFCWqesgmI+wctf5R+SqXJToU2azgN3N0o9at1rZmLIneepkqw8ubVY
	 kmUoMHPh2A2/aCNyvC7i4XQ5AOmEBPusUjNyYTfTl988+T5wObjdXeL6ivzM/vukl3UQX
	 50yOsY0Y5nIucEqgxUxtL/Hs07/X0kw/G/Vp8ede9Ev2ucT+lDMAI7YZYpde3vSeGQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lh4XfjGQ;
	arc=none smtp.remote-ip=91.218.175.125
Received: from mta0.migadu.com (out-125.mta0.migadu.com [91.218.175.125])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DA2606A320
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 06:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31DA2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lh4XfjGQ
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pDDU+0D383chdCIpoFHHlcrvgVEBH5dnlyFCoSq0GdY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795157926; v=1; x=1795762726;
 b=lh4XfjGQOQ8KMCLQjOs7mTV5ZcQaPIktvZSmmRvqnPqKmooZxOV1brSWODCWw2wpLg3kuEWx
 6i37+ADOHVinvpcFkXW5JzJmg08TpTxxayH6HI427LR2/+5tjQsDQGnMeZrpArmBKXTuM0aO/NI
 mzee2lYCqqbcDeg7WyT7njE4=
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id b614ed43f9ab845e;
	Fri, 20 Nov 2026 06:58:45 +0000
X-Mizu-Trace-ID: b614ed43f9ab845e
X-Migadu-Flow: FLOW_OUT
Message-ID: <4472929f-04ec-4a00-a872-f4a537b3ca53@linux.dev>
Date: Fri, 20 Nov 2026 07:58:44 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 14/24] net: dsa: rzn1-a5psw: Make use
 dev_err_probe()
To: Prabhakar <prabhakar.csengg@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Simon Horman <horms@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Ralph Siemsen <ralph.siemsen@linaro.org>, linux-renesas-soc@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 Prabhakar <prabhakar.csengg+renesas@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20261120002549.1908299-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Language: en-US
From: Clement Leger <clement.leger@linux.dev>
In-Reply-To: <20261120002549.1908299-15-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/20/26 01:25, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Replace dev_err() with dev_err_probe() when reporting failures from
> devm_clk_get_enabled(). Clock retrieval may legitimately return
> -EPROBE_DEFER, and the current use of dev_err() incorrectly reports
> such cases as hard errors.
> 
> Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v4->v5:
> - No change
> 
> v3->v4:
> - No change
> 
> v2->v3:
> - No change
> 
> v1->v2:
> - New patch
> ---
>   drivers/net/dsa/rzn1_a5psw.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
> index 4b31a1d331e1..bccfadc1d5e6 100644
> --- a/drivers/net/dsa/rzn1_a5psw.c
> +++ b/drivers/net/dsa/rzn1_a5psw.c
> @@ -1240,15 +1240,15 @@ static int a5psw_probe(struct platform_device *pdev)
>   
>   	a5psw->hclk = devm_clk_get_enabled(dev, "hclk");
>   	if (IS_ERR(a5psw->hclk)) {
> -		dev_err(dev, "failed get hclk clock\n");
>   		ret = PTR_ERR(a5psw->hclk);
> +		dev_err_probe(dev, ret, "failed get hclk clock\n");
>   		goto free_pcs;
>   	}
>   
>   	a5psw->clk = devm_clk_get_enabled(dev, "clk");
>   	if (IS_ERR(a5psw->clk)) {
> -		dev_err(dev, "failed get clk_switch clock\n");
>   		ret = PTR_ERR(a5psw->clk);
> +		dev_err_probe(dev, ret, "failed get clk_switch clock\n");
>   		goto free_pcs;
>   	}
>   

Hi Prabhakar,

LGTM,

Reviewed-by: Clément Léger <clement.leger@linux.dev>

Thanks,

Clément
