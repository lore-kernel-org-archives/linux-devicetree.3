Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395803;
	b=OJA4yCL3eyccfqJ99BKq03p/BZ7Jsl7/hJTzx+3o49+0KFdjxrSCja7b3jtWGQYiwlCv
	 YWoop7qIeVXnLGvrFByDSk0JAVPDHmg1sCvIKfDYVf/EvhyLaKkokGWvYzlwWEzDGDT3r
	 55KxgPXQCwDHYTwQrP+VoxZHc2iAKxgCOz5d+5OWiPtCBjiYYcncuHV1zehmbR9lIPDgF
	 6hNGoCh84YO4iQAxSJbvSjRazYetKauhvz3hLYXgVX1HelxC0ucREmpG/pRD3fkBHE1oQ
	 7M6aOFhwnVcuqkCOgj+9FEx+OgkXL+eHEqzhsbF+lswuUtKWuGr5UxJ1/L0NbwvV/Pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395803;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=lnDCWDQWS7lnvEMZecQHmZbDoApXTQBDAtdlF1srqGU=;
	b=WY840djuw0CfztnMFlcX2NHsbznv+t6bZeK8dHhBAPz2XaJmzLsR3wSQYVrR984ZEQcl
	 HYjVJ7vhbnUXHv/H+sQsot5Ca93I7A9FYc9DCK6zeFQXL6pcbbnIctJW/JLCZawwyNay2
	 /lcPzinBOFauWTbFBNzbIfiI9wO3B+ycSom3AGxryiJ5J7MqRHl/fRiq/mWWpQOiigZuq
	 xfSzt3JMO1qA88XCi76NnWRbjWO9pdi9LefnWUD0PR9tLwfZXJvMrRTo5SEbjDUvvrKKJ
	 L0YNYbTSKnIqD6Cza0csnqw0BWCeenfb/7kpQMEIMX+nmKjB2l6V6NwW7YkPAO3m+Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="j/bKAVJr";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFDD3606A324
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j/bKAVJr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6225A1F00A06;
	Wed, 11 Nov 2026 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794395803;
	bh=lnDCWDQWS7lnvEMZecQHmZbDoApXTQBDAtdlF1srqGU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j/bKAVJrtZwDofw24ex418Jp2+gu3PnPe30TpfHOwVcYjUhGjWJd9Xjw6PluHQvE6
	 EpRzF8mQTjZ9OyiEpB+ZwB1eG+8ArTSr5Ahf5KjPQquN6klAR9jhDmd+3M9JrPRZXI
	 qNFN+JTLKWto+SP0sHWnUfGCynsBOGz/5lMJ1cn9C07bn4AzFfTrsxDGbKpN1rdgnB
	 BiQpmWw3iu6FcMa4SdDSgP9aY3/WTym2C3FxjVcklOkEYs5FL1K8Keg2yQZO18Og3/
	 EKbjTjm5K8KuC4fHXbK88S1U8sbXFduvsf6OS3EJQ6txDOgF5hJ+mAFmL4kETKuBk/
	 SgGtRvGAR10EA==
Date: Wed, 11 Nov 2026 12:16:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Artem Novak <artem122novak@gmail.com>
Cc: andrew@lunn.ch, robh@kernel.org, gregory.clement@bootlin.com, 
	sebastian.hesselbarth@gmail.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	klightspeed@killerwolves.net, jason@lakedaemon.net, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: marvell: Remove duplicate DS212
 compatible
Message-ID: <20261111-efficient-magenta-jellyfish-90cfde@quoll>
References: <20261110093120.179318-1-artem122novak@gmail.com>
 <20261110093120.179318-2-artem122novak@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110093120.179318-2-artem122novak@gmail.com>

On Tue, Nov 10, 2026 at 03:31:19AM -0600, Artem Novak wrote:
> The Kirkwood Device Tree binding lists "synology,ds212pv10"
> twice in the compatible sequence for the Synology DS212.
> 
> Remove the duplicate so that the documented compatible
> sequence contains only unique identifiers.
> 
> Fixes: 1c5f2ea8ce7f ("dt-bindings: arm: marvell: Convert marvell,kirkwood boards to DT schema")
> Signed-off-by: Artem Novak <artem122novak@gmail.com>
> ---
>  .../devicetree/bindings/arm/marvell/marvell,kirkwood.yaml        | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

