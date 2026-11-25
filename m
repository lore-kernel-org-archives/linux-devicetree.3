Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600204;
	b=xSRCsvt4wiVApKap6E8JughmuHYAENj7s9BqO/MqFkXUQWVW1uJS49yB3+6IIEXHqoYz
	 PxNufXMUO4SSJQUwIqjtlwL9NV5EVyK5EDg81gXofTAaA8HMcWyvtfxMLBOVwBCu+Pmky
	 c8fnEkd46QuwMQBvB0/mZDwJDSDkthIDNFS347vq3e/gIdFqhMGpgKlEuz7L9TaroOMuP
	 eriuH1vxFcoa7iLWAr6jlmBv2dYFXrLfcsUxEc7D5dK9ZtrJ+1FpP8/j9vFYnqUPxjDpK
	 jfiAZa3mh2hzkFMcPoyOIMD7dxfNNe3K061rUeL7l7cfMmcMFeqXxrO3hsy/JnOwDsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600204;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=/a3VIv4ZFChd5kfdkP0Njkg9UeMRh1Bzcl+P/hsLLVk=;
	b=yyEPNh9n1ekw/E7IBrUbqQMh0b6GMntsHPPH4aO/Pg+duG6xqqTL17XgSpCXF+wW8F5D
	 RFG/S2sdd47h16eI4MI4G7QviVsKHhsD031lvjwtGhJ8Hf4+vNZgHiJ/77gDCZ0PwKcZD
	 qT6OyMnfYGzx0ryRUA0VYIJeSc1QcK+AAKWYGWlRbgbFj9kN6FxuFw5KCI1EoefcB4R4u
	 kn3egt/CKpG0omVGXRlpucw8CLM2sCvwIrxwSVxhKg4TnueG1OQsagIN9iGWjhJHLPcEk
	 c+/3CpYMPoYWrPs0BWXJ9SvXB8DhoginuiFC4Z+H3bmEt4+SJBHuZPygWx0uKpN0Obw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZiFsYBw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CB7606A321;
	Wed, 25 Nov 2026 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oZiFsYBw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2B991F000C0;
	Wed, 25 Nov 2026 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600203;
	bh=/a3VIv4ZFChd5kfdkP0Njkg9UeMRh1Bzcl+P/hsLLVk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=oZiFsYBwIAITHNx9qYWcwD79bQsidds9woKsGWfyGltnnsGKOOnWJLrcZ0u+Sahwi
	 QJHMPEFiA22BW+xRoMgcF6nwZI6YA1W1731lW1ambRMnF0c2VoFLb0Kyjr0hrKsabk
	 TBcK6GMeBuZQkgBH4X3GIX7ttsE7p203zUDaEOrZVO4/U1UxEnxdG3ohk+bHDG/v9M
	 VOehlZSSx/OkYFdSHw0vD1RDmIE5zDctBEXQin41poY4M5q6HRxDOlt8RycX/CW09a
	 uCmij/R50qmVjoUOrcy28sMY7mbXHdWqjg2gNgyhSw+gLs4nEIG1glEb3BE5DTnE4f
	 Njo2EdpASSwwQ==
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 7/8] dt-bindings: arm: rockchip: Add Luckfox Lyra
 Zero W
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261122060114.773624-8-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-8-jonas@kwiboo.se>
Date: Wed, 25 Nov 2026 10:50:00 +0100
Message-Id: <179560020032.14607.12958715929059549043.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 06:01 +0000, Jonas Karlman wrote:
> Luckfox Lyra Zero W is a compact wireless development board powered by
> the Rockchip RK3506B SoC. It includes 512 MB of DDR3 memory, 256 MB of
> SPI NAND flash, 2.4 GHz Wi-Fi 6, Bluetooth 5.2, and BLE connectivity.
> MIPI DSI, USB OTG, USB Host, and RM_IO interfaces are available for
> peripheral expansion.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---

Same commit, squash.

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
