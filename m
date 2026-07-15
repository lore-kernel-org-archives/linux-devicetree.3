Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7D94446EE;
	Wed, 15 Jul 2026 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784116652; cv=none; b=DXTTpOpehIKuHbBRpPmxKP6YDNNKS5XcpiYmRLqHVl55fUKklQRgB27q0uuzM/iJbGToWTWLb9tWYqA0VoUPQerO1avwxOGs8H3EQZAQxD0R03aPgTKc00E/PJFJrxOrjvBO9clPfxo2I+Qc60VJYuwckUByPGUkWIoIiaPPjwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784116652; c=relaxed/simple;
	bh=ygstzEkP+JyZmGcQ7tRnuvfQYRLdyR6bfVZsm5RzxQY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o11YCexFC/Fv2JuBDkwS/AxQW1PUvt2ipiKPpvxUVpI3HlUF/pTsq1fhRyMqlVRR+4hTIdQzTWBNZhw6mpKlk8Bd+cKeb6pPJiN7xW59663FCDHhZJkblRrMh0ast+Jcz7pRsCIevdBAOJFmKqilA7s2eGl66Nshe6gO0jyexys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=BdB3UVJw; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="BdB3UVJw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784116648;
	bh=ygstzEkP+JyZmGcQ7tRnuvfQYRLdyR6bfVZsm5RzxQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BdB3UVJwnodQo8Cy8oL0ZTippxQaEiXCbBb5Lq713EfsjOJylM/LuKN/oL0BNYkSJ
	 ImuP4A1tymrkeOYuDScouAbUrkeUtjT8HEcOs2jW1WlmPsD9AIo6kLpSMrmHqmJl9h
	 RK+XHMJtjK1kuInm4xj9wi+aVnyXoJWGddfVFLcHl/+qclxqDr2QElORH3uzqVOejx
	 prEsPDaPleQ/1fHggJY9FE1Pn2d/Xo0irxR2tFr0sw2ncPJhu7c00YDVaTaIcI224h
	 fUUm2sqVeQJrpVJZtGHREIt8EB9weUkOLXwxjm2SrB2voH+shzOuZ6gkMS5Zvdbm7k
	 3nZHajprWomKQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C09017E0A4E;
	Wed, 15 Jul 2026 13:57:28 +0200 (CEST)
Message-ID: <821ce2b4-2630-4110-b493-b31c5d04556a@collabora.com>
Date: Wed, 15 Jul 2026 13:57:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] phy: mediatek: Add support for MT8196 MIPI DSI PHY
To: Vinod Koul <vkoul@kernel.org>
Cc: chunfeng.yun@mediatek.com, neil.armstrong@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com, justin.yeh@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@collabora.com
References: <20260713103805.23030-1-angelogioacchino.delregno@collabora.com>
 <20260713103805.23030-3-angelogioacchino.delregno@collabora.com>
 <alZm25Ro_WdKigPd@vaman>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <alZm25Ro_WdKigPd@vaman>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/26 18:42, Vinod Koul wrote:
> On 13-07-26, 12:38, AngeloGioacchino Del Regno wrote:
>> Add support for the MIPI DSI PHY found in the MediaTek MT8196 SoC
>> and its variants.
>> This PHY has a different register layout and provides support for
>> more hardware features compared to the previous generation.
>>
>> This initial driver only adds support for basic functionality that
>> is necessary to drive MIPI DSI displays as a D-PHY.
>>
>> Feature additions like lane-swap, DPHY/CPHY switching, dual-port,
>> and others, may be done in the future.
> 
> This seems to fail to build
> 
> https://patchwork.kernel.org/project/linux-phy/patch/20260713103805.23030-2-angelogioacchino.delregno@collabora.com/
> 

The failure in your log is:

make[7]: *** Deleting file 'drivers/gpu/drm/msm/msm_gem.o'
Segmentation fault (core dumped)
make[7]: *** [../scripts/Makefile.build:289: drivers/gpu/drm/msm/msm_gem.o] Error 139
make[6]: *** [../scripts/Makefile.build:549: drivers/gpu/drm/msm] Error 2

...your build server is experiencing some hardware issues maybe? :-)


In any case, I've just rechecked this series, and it builds fine here, with:

ce1b90b20bbc (HEAD) phy: mediatek: Add support for MT8196 MIPI DSI PHY
522a9d162c98 dt-bindings: phy: mediatek,dsi-phy: Add support for MT8196
49362394dad7 (tag: next-20260713, next/master, next/HEAD) Add linux-next specific 
files for 20260713

With CONFIG_PHY_MTK_MIPI_DSI=m :
   AR      drivers/phy/mediatek/built-in.a
   CC [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi.o
   CC [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.o
   CC [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.o
   CC [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.o
   UPD     kernel/config_data
   GZIP    kernel/config_data.gz
   CC      kernel/configs.o
   LD [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi-drv.o
   AR      drivers/phy/built-in.a
   AR      kernel/built-in.a
   AR      drivers/built-in.a
   AR      built-in.a
   AR      built-in-fixup.a
   COPY    vmlinux.a
   LD      vmlinux.o
   MODPOST Module.symvers
   CC      .vmlinux.export.o
   UPD     include/generated/utsversion.h
   CC      init/version-timestamp.o
   KSYMS   .tmp_vmlinux0.kallsyms.S
   AS      .tmp_vmlinux0.kallsyms.o
   LD      .tmp_vmlinux1
   LD [M]  drivers/phy/mediatek/phy-mtk-mipi-dsi-drv.ko
   NM      .tmp_vmlinux1.syms
......[ etc etc ]......


With CONFIG_PHY_MTK_MIPI_DSI=y :

   CC      drivers/phy/mediatek/phy-mtk-mipi-dsi.o
   CC      drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.o
   CC      drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.o
   CC      drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8196.o
   UPD     kernel/config_data
   GZIP    kernel/config_data.gz
   CC      kernel/configs.o
   AR      drivers/phy/mediatek/built-in.a
   AR      drivers/phy/built-in.a
   AR      kernel/built-in.a
   AR      drivers/built-in.a
   AR      built-in.a
   AR      built-in-fixup.a
   COPY    vmlinux.a
   LD      vmlinux.o
   MODPOST Module.symvers
......[ etc etc ]......


Regards,
Angelo
