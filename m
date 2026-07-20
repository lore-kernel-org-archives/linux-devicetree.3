Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F749419FCD;
	Mon, 20 Jul 2026 12:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551718; cv=none; b=T/IzBlktWpvWuQzqHQSSadDcppggUYO4OzaXzg287am+Ky9a9EfKM1sUGT3UJMceskVEDcR8J93IZjkP276tU4T5BgCiA7R27helceRR4ohJTeMLl0ttDlpkRUbIc39Yf0vQVUH6UIDJ04wJgofipp2l4KOk2tq1iBlG+W8wXK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551718; c=relaxed/simple;
	bh=2hDfOrYJlktV5w2l5biEDgpe6XsMNDJBGUXjbbiQxFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JAUv2f7N/jbvnzCFM1KJg6wZTSmMXmp/wUCvQCT8J6BFUhavnw9y9ssRQnM8sP63I7iErKROd5E4SpZTH2W2SQvpzrkePfhhNNeS64VxnaeII9TSHRtvWMr1d1LAuF2n+3qcz60DqlalOrGWSDReDyynGwtP8c4IblYjsNpbacc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ESIDM0rv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ESIDM0rv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784551714;
	bh=2hDfOrYJlktV5w2l5biEDgpe6XsMNDJBGUXjbbiQxFM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ESIDM0rvHDDcwAxDcCbpsXoPCq0+/q0wjWcJXYsQ4KL443DgtNGZNEWxL6h7AOFtt
	 7cmaNaaImDhIvTuZTalqlUE1zebrSYgZVw8exdYkiEIOz2p243HzVQb/7j/4EBAtAR
	 wpdBNJRPDPlcg1U4HGsGGiaB7fVYH+60xmsO4Ih6+JVUNRi5NVlVYsz0CTGkZ8hmO+
	 zTXDLoEmpLHViO5KZPkdflzESneuJrQ2wIuT0vMB5mmE7QbFKyxX382woxYygYZhvn
	 zJxO0INrk+R5zzfY8qoBlfjs3UAUbrvg3TylnNorvqoLixjG/pDrXj4kCS5bXtSrkq
	 x+a5xE3Y/RNPA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BD2617E0D53;
	Mon, 20 Jul 2026 14:48:34 +0200 (CEST)
Message-ID: <2aa16ed7-5d36-4e78-929e-84b9d6befe77@collabora.com>
Date: Mon, 20 Jul 2026 14:48:33 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] nvmem: mtk-efuse: add mt6572 support
To: rva333@protonmail.com, Srinivas Kandagatla <srini@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com>
 <20260715-6572-nvmem-v1-3-9c13be99d077@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260715-6572-nvmem-v1-3-9c13be99d077@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/26 16:27, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a platform data struct for the efuse controller.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>   drivers/nvmem/mtk-efuse.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> index 1462f2760818..a79434608465 100644
> --- a/drivers/nvmem/mtk-efuse.c
> +++ b/drivers/nvmem/mtk-efuse.c
> @@ -124,6 +124,11 @@ static int mtk_efuse_probe(struct platform_device *pdev)
>   	return 0;
>   }
>   
> +static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata = {
> +	.uses_post_processing = false,

Are you sure this SoC (or any other compatible with it) doesn't have any GPU speed
binning?

If you're really sure

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> +	.needs_aligned_read = true,
> +};
> +
>   static const struct mtk_efuse_pdata mtk_mt8186_efuse_pdata = {
>   	.uses_post_processing = true,
>   	.needs_aligned_read = false,
> @@ -135,6 +140,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
>   };
>   
>   static const struct of_device_id mtk_efuse_of_match[] = {
> +	{ .compatible = "mediatek,mt6572-efuse", .data = &mtk_mt6572_efuse_pdata },
>   	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
>   	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
>   	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
> 
