Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73FC43DA23;
	Wed, 15 Jul 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110861; cv=none; b=nyLO2Y1Sa4wn8hiLMSM0W0qVUaZvQOBHeBGVVTBBk/Mqy94E12aFki04Yzcz+4FV5kj09an6tQq/Y+m2GJNSx9ffgd1ywvhwdj1cwqeejyQhX2rSJfpmir3SJNU3ODS/OfU9rdv/vLvmgIZJiHFbKe/Ynjt/ANaFOzoSIMSC8rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110861; c=relaxed/simple;
	bh=3FwLa5zsloA6Hhg4Nl9W7+NaqnQkEcA6Piv/oWChUT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lFFGKD+8Au/0OrRKTcTP3xEDGhMU80MpWmlC2Qk89Bt7+k8ojwN4V2xH12ltTbSyfixa36nYAoM27DAkm838vysq9dbI6s5tXgWYCd0uNJcApJDNiAXB/N5M0E19AXyJAqC2wFksv9hIWcvLkMkbHwjImQtztIXCQ+sTLuQbSzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=K3bpOxnx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="K3bpOxnx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784110858;
	bh=3FwLa5zsloA6Hhg4Nl9W7+NaqnQkEcA6Piv/oWChUT8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K3bpOxnxiKgkkCAT4J7iPHccJYDPBV6/9YZo2rzUbBxutVbg35tXvA4J+tjmfnk9e
	 rtUYlBAh6HxombKRnoeSMWvjnuYJxJvM/2X5J6KSlI8ojgjLfAMNqAL1Msr8ifGEiD
	 qKYegtq79xHXz42qT0LwBuE6WyEnPOS0Ciy7VeOTOJzds8G7ODXTLQ3LA9kgJny+Py
	 UZxigipC83j+hMPNLo2YVHXdQrpcM5HJXevez6Oz8D5wC6HPlJa6ODJqmuFkQ4oFOz
	 B8LP/tK42uS6aMXaBexFPztiT0UDEhQ2NJXpcmzO2VyE5IaZtpKO1snQwmIWa7PEk2
	 3zCwhaZInVvEg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9ADF117E019E;
	Wed, 15 Jul 2026 12:20:57 +0200 (CEST)
Message-ID: <e882211e-0bcc-4dc4-8168-9eee30444ca9@collabora.com>
Date: Wed, 15 Jul 2026 12:20:57 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: soc: mediatek: pwrap: add mt6572
To: rva333@protonmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
 <20260714-6572-pwrap-v1-1-d8e5a39cf7ef@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260714-6572-pwrap-v1-1-d8e5a39cf7ef@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/26 14:42, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6572 SoC.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> index e7c4a3984c60..a3cf11153fba 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
> @@ -31,6 +31,7 @@ properties:
>         - items:
>             - enum:
>                 - mediatek,mt2701-pwrap
> +              - mediatek,mt6572-pwrap
>                 - mediatek,mt6765-pwrap
>                 - mediatek,mt6779-pwrap
>                 - mediatek,mt6795-pwrap
> 


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718
