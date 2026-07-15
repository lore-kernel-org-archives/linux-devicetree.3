Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B443DA25;
	Wed, 15 Jul 2026 10:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110861; cv=none; b=EfpnCopWbIqtKK5rtSgndbN8MyEIm2PkkexRdoDfNNYF2TVRDEgBOv39eepNyJTJU0xjJShUqRYM/KaulF/YSyRjl8yuCH1hxd6Ccb55RP22eyBKdBZ4EobCKuJwERJyBtgIN+8j+45SebfAd+lp3vDzbsuFvT/lK18wwS1LXgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110861; c=relaxed/simple;
	bh=y+ynGkCaYoXRDmgB014d4Ad6Wj5i1LOY4L9jyC5DNh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRBu6RAxYTwk6N02nqRSZDqG38pL6I6ZvXEcgpVoG2QLQqol68HLDSDYNbP/l1l1AO5SF+ZHeSyiCcZvo6fkNFJCCodwB1YfFoi72WbhnzMoFyq9Sld5RKKG7CLQrN4efryVlEuoWc5UUPwyAmlRQ/VKGyyQ78jVuYGR4W9Ef00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YJfVJDzN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YJfVJDzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784110858;
	bh=y+ynGkCaYoXRDmgB014d4Ad6Wj5i1LOY4L9jyC5DNh0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YJfVJDzNldvpTUS5ABBvAnFhP6Vnzwp+yH2e3DTFWYOwgB0Q3VP1YHf6rvLm1lHwj
	 /3J/fXZAoEC8Kf1shil5y3lnP/tFvantshMIHagW6+zcctJ99IYkVKfjWm/LfWwsHt
	 ke1tXGJu1eANIyj2XclkQ+6be8j3POLtQI7cQFmTQ9kCL2HqbC/k3Q8lmtS5mvgo1t
	 qeHjH10VKhMROLXBvov2e2lbL4Qz6m3hNj32fptiBdq2Syrd/GTAtz2cFSLed1L/z/
	 HQolHnFHd/YWOR5y25nxtbr7x0G4n/EZlwzTwsz6eRA10QZjnFKUySHY26UfQTHmgX
	 sBzYr8njRAE8g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D15117E0720;
	Wed, 15 Jul 2026 12:20:58 +0200 (CEST)
Message-ID: <f9e34c90-5f9f-4a51-9968-0fb3467a782b@collabora.com>
Date: Wed, 15 Jul 2026 12:20:58 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: mediatek: pwrap: use correct log level
To: rva333@protonmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
 <20260714-6572-pwrap-v1-2-d8e5a39cf7ef@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260714-6572-pwrap-v1-2-d8e5a39cf7ef@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/26 14:42, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Errors paths should be dev_err, not dev_dbg. Replace all dev_dbg in error
> branches to have the correct log level. Also simplify dev_err and return
> with dev_err_probe.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>


Yeah.... I agree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 45 ++++++++++++++----------------------
>   1 file changed, 17 insertions(+), 28 deletions(-)
> 
