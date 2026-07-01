Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844C0370ACD;
	Wed,  1 Jul 2026 16:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924920; cv=none; b=VLMC3ONh1hKnY/LrzssMMZ5DDnM3OskjVwV41nrQkea3tQV/8LiFX+mwK5uO8g+cNd7Rs77Uce5/Nuo3wdkn+w1/2ZMoi/jlFwghpQXXvx80SsacxxORhF9+pYiN/ITgmqpge2Uwq57w4HGnlp3pceirbfcSiarHSxHN530aekQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924920; c=relaxed/simple;
	bh=cmD1OfhdgkZYg7FYTHmyqOWvRC0DoAw418/B4w7hUhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JcVeeV5yPL3IlRVgnpV8MaklRG1p4U4V7hAGHpz9Ia6Bh+edAvKfFjtUz7gp8RrGBE9f0fUNTGbSj8Klh2OF/7w7oX3SgXyP8QOLq3dFvXebVkmJT0dV9Ce9Xt4ZyQzY1MOxKJi32l4VKS4BMpT9fGxUkpF9VzC+kdWUOSlgXQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=D+AH1r5G; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="D+AH1r5G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782924917;
	bh=cmD1OfhdgkZYg7FYTHmyqOWvRC0DoAw418/B4w7hUhk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=D+AH1r5GH9ujUL8tJqGzluGTZjxMS5fgy+Mx3d5Wu0EpUIXgHUujv9ZVhrFxkM6ZA
	 OyP2X/uPDUMjVzm7v7F/V62Kg8F1/YZxXJgUldYQFPlnin6R8UlmhQjiLNkXFrKBUw
	 aX/lPqElceZtAcp8QH7GXZm97tZMh+MSlyLSX/As7EZ5n4YS19uFtpGRLoYFDRRr52
	 NXZ8t5eawRotF76S4FBDym7zg3EKOfiXPrj9mzfFfY5fp4FUKRCEakEyEh3WWugxTl
	 9k20ZxuPuRnVqca5w4ndppDaXLKXv9R+t3BSFWcmigiQqK4nb3bH8XlNWlpG5cV0SB
	 3Bkths3eO1adQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B9AE17E0521;
	Wed,  1 Jul 2026 18:55:17 +0200 (CEST)
Message-ID: <672ed995-7386-457a-a013-9816ed413057@collabora.com>
Date: Wed, 1 Jul 2026 18:55:16 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: phy: mediatek,tphy: Add support for MT8189
 SoC
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/1/26 17:36, Louis-Alexis Eyraud wrote:
> Add a compatible string for the MediaTek MT8189 SoC, that integrates a
> MediaTek generic T-PHY version 3.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

