Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CA3419FC7;
	Mon, 20 Jul 2026 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551718; cv=none; b=aEXPsYL0BWmTHJzGaTiTIlqisA8VXjHW8Z1TYVztDiiezovmVmeakB6HmEpczHB/uubrJCGSZYu6nduAfinUSZMXCOlhHcLvIotsTvflRwvE51daMwpW4SNLGGu7fFpP/uhEH8M38fEC8DLqJM5GN0Nzn4TzPZAtpNLV1Jt8yG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551718; c=relaxed/simple;
	bh=PhW6ciGW0bqaX04kRmzCYiEg29y3CA9pNavpAO2grds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/jUhWnGDA3ER6BNyphBOAwYFwG73pHfCYSth/gmfAIHjv8fwB+gLz7Tz4pLMtTsmZLDTYXk7Mlj7j9XOIz5FI+aKr8+/sO+epWSaW+kI13Hk41oOlQj8gNEfJ//pvLy/m0OhqPIWQiO8py1sntw06WlFAzyCVge+mZU+QYXayA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Vm7/TEUN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Vm7/TEUN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784551715;
	bh=PhW6ciGW0bqaX04kRmzCYiEg29y3CA9pNavpAO2grds=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vm7/TEUNmXuqq7tDoOK0zKO6C1VZj8rnMZPw4M71gNDIownpmzTak6WRlcsCXYmOC
	 F4Gx9nWsY2I4xWslTvj81014NU2z6b6rcmxR5FXjOsbwW+qpvArs3RawCN9gD8HHyx
	 S2363yCEs20kM6jCdZ9SV7/jFuhiv+cVEa40MI3lf/9q2Cn5HMQB0gg26K1A+2CdVn
	 V5QfalOQeTiJBp/5xyz4FEQ+QoLkuNy+AlWzVZ/Z7hW7yVhnB4J2K8AKAiuntKE7lm
	 k+QnzH3+5dP67PQV+o+dTPIxJstkfR4CEaYMzAAs2bsuf5B+GP8oPsPROwSi55p0iX
	 gFXrNjQt2Os2w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29B2B17E0D87;
	Mon, 20 Jul 2026 14:48:35 +0200 (CEST)
Message-ID: <28c74091-f455-4bae-aefe-a35e66e88850@collabora.com>
Date: Mon, 20 Jul 2026 14:48:35 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: nvmem: mediatek: efuse: add mt6572
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
 <20260715-6572-nvmem-v1-1-9c13be99d077@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715-6572-nvmem-v1-1-9c13be99d077@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 16:27, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6572 SoC efuse controller.
> 

Please, avoid adding this to the list of compatibles that need you do specify

"mediatek,mt6572-efuse", "mediatek,efuse";

The "generic" compatible should disappear.. and plus, the MT6572 SoC seems to
be pretty special, as you had to implement aligned read just for that.

This won't be the only SoC as well, as probably all of the legacy one from the
same era will be affected... so please, add it as a const so that you can have
a devicetree with an efuse node declaring

compatible = "mediatek,mt6572-efuse";

Cheers,
Angelo

> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index f9323b3ecfc8..269e2b09f5c8 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -44,6 +44,7 @@ properties:
>   
>         - items:
>             - enum:
> +              - mediatek,mt6572-efuse
>                 - mediatek,mt7622-efuse
>                 - mediatek,mt7623-efuse
>                 - mediatek,mt7981-efuse
> 

