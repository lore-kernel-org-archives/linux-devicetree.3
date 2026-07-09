Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65772E9ED6;
	Thu,  9 Jul 2026 13:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783605508; cv=none; b=OMaqOlSz/bBk6CHbVFhsTbT5LyBXGgofZKpQwUS5KdeE9J5TzaqogJOweIvwq65totjnVROh1ujDtmSQ5rDWeUS2JYOGAXU8g8EV/ygwhjW71Iik0WEPIRlVuqWd1ssKruPi6nCUDEQ+PTLNrwUU+En1pdPzKVL6sDZ2S4WAm2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783605508; c=relaxed/simple;
	bh=DjWIojAzSpqrury6RVuc3AKXDQ21nXDPRrnz5nALTGA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F8sLY3dqr2KVhRhqVAz6sLsshggpvgtZboNU+ppQxFZNcr9r9vFWZTMNUUiJ2cCLG/qDpRkwxrQkqQxtLrqTKEmiAXz7JoFSHDdSxlQEaoybEc/Xzb3G2C9G6y+tsSBS0r1NSXJhSeFIp2CzvEYJYhLhN+QUlfMgT1aqhY8kf/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Uk9k61Ti; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Uk9k61Ti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783605505;
	bh=DjWIojAzSpqrury6RVuc3AKXDQ21nXDPRrnz5nALTGA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uk9k61TiU5kLuxeWd3yKSlAqlof2xEMCyZ91YUH3EfsxlKkfbd0J9XbYPF2Ozvnx2
	 znsCEGFc0wsenIpMQNl9u8fUGgAEXMNXikFccXqUNWwyipJ6b4k7hwQdB+28KHNYgV
	 DhGM+/SdJbKXOTVW8bKfuCRp6qIndc4Bicdywmrx8J4xx3lLAWIOOTO1Uui4dEFIlM
	 njnJBYlIgqMZkMzTUVIyiAa4RtLla1XMF/0vUPccM7sSh2aOyGfsAHSchAmSGL9UJx
	 GMq1i7dDU2zbAh61mKNXgcrr/LfUmlxvBwforDJ3gRoQAAgG63SBV3U7NlObDn0Baf
	 +WVSbE+qB6gzg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08BAF17E071A;
	Thu, 09 Jul 2026 15:58:23 +0200 (CEST)
Message-ID: <fba4f7d6-d480-4f1a-8d80-3dd0a797b61e@collabora.com>
Date: Thu, 9 Jul 2026 15:58:23 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: soc: mediatek: mutex: Allow
 #trigger-source-cells
To: krzk+dt@kernel.org
Cc: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, matthias.bgg@gmail.com, andi.shyti@kernel.org,
 djakov@kernel.org, broonie@kernel.org, jitao.shi@mediatek.com,
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com,
 jason-jh.lin@mediatek.com, kernel@collabora.com, chunkuang.hu@kernel.org
References: <20260701122043.19612-1-angelogioacchino.delregno@collabora.com>
 <20260701122043.19612-3-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701122043.19612-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/26 14:20, AngeloGioacchino Del Regno wrote:
> This hardware controls trigger sources, and there's even a generic
> binding just for that: allow #trigger-source-cells in MuteX, so
> that this is allowed to provide triggers to external HW.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Hey Krzysztof, I noticed you gave your A-b/R-b on the other two bindings commits
but you skipped this.

Did you have any doubts on this one that I may clarify for you, or was it just
that this one slipped through while reviewing?

Cheers,
Angelo

> ---
>   .../devicetree/bindings/soc/mediatek/mediatek,mutex.yaml      | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> index 1ba086ad749d..429ea149068e 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mutex.yaml
> @@ -57,6 +57,9 @@ properties:
>       items:
>         - description: MUTEX Clock
>   
> +  '#trigger-source-cells':
> +    const: 1
> +
>     mediatek,gce-events:
>       description:
>         The event id which is mapping to the specific hardware event signal
> @@ -119,6 +122,7 @@ examples:
>               interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
>               power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>               clocks = <&mmsys CLK_MM_MUTEX_32K>;
> +            #trigger-source-cells = <1>;
>               mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
>                                     <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>           };


