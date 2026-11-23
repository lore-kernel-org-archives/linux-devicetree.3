Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795427531;
	b=rA31dCaRuK52GZFTqKzCoP7KNMiYNuYTWMhI5fK7EwjnpyoAIUT4uwHORg5cJUyxqPNC
	 WZn+ORKWa7M6oM++8KbGEyaln3asiyDbbxnGwK/gOBdP7d+QB+ZHROcbHY1auhJSLaRbg
	 igYmjf2Bc5OtzTU1MqT/3d65TC3TYk93Lz0wX0mq/5r0M35Tmg2icEauyOr8eJOwM+cJ5
	 zZ8hjO57ZGi5mI/xTwFuMRiryEefYX1TmL3NLCHVWnpsjIRIvaFZ1xuxuf2kKQZ6SHbK1
	 h49Zce59XwIaba/fLp18OjNCB3DPpzAvbDtsSFoyw/okUaPMgILqyiST4zSGNWPAA3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427531;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+hv+LurwSsAKD/1hgBOH2qR+bFYvs4hVZUytMI+WIKQ=;
	b=hwTT6sSXOZ1h18FUKXxyaRCr9OXZevJx1wzdDS1y104QpXBFXVNk6wJSUsYlrjycNVKz
	 vRLauEeG3FRYHPZbmCCO+qvlndTM8VGKQ0Dez+79DTQlRduDAhS4La8oB02i3NNOswbDP
	 ikh2wTuZoFOOW1H86ynEHRkQ+ibMJV1U7FxiCEQDacDAeBkJRwhfDp9XCGm52/ezwf9PD
	 p7spCrW7ElnF08vflh3+btrETwicz4VKZk7gk+FFGQwDFJw6HIKeBum2sLKFuaPglM8EI
	 UTfPQVNnJNAbnA5ReGGVn2ca1ExnHS8YunkDUJv/4AGPG4HB7nI4VHgA6JbUXi/u2Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lJBOw5y4;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F503606A31F;
	Mon, 23 Nov 2026 09:52:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F503606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=lJBOw5y4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427529;
	bh=Xkw/D1TF0uOO7465Srp/1BFoL/lm3YZD34LfqM34Yl0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lJBOw5y4IYTMTiPJX2XHz2/WDEVdkIiOiIpDZ5bjkoQ0lHjGzQzejtBQOcZab0vmu
	 LqTlYUucKXq2dTUa09cY74RC153/xk2prktRMGbJVS6z6Jlj0rbcXgH67DIrT+ih2/
	 RXoT2dNc8kgThWFTl//O6ERt10TQisQRa0Jv4QQOD822kSIZTm1f0r8zo8WV0DlUG0
	 4IXzHr2m6EccGyPk7pDXjr7FYrKZCUzKGy/mKftWyH1NqR68mMFiOeRdpluISjujWk
	 rS1U74e7wSo8CEVugNcD9Y4BnHqfIf4aLoOxwJrBCcg+4UnS3YSdGsUSTSM7XvhoHf
	 c7zctaqvDSlNQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E661F17E007F;
	Mon, 23 Nov 2026 10:52:08 +0100 (CET)
Message-ID: <75c71ea0-e2e7-4709-abf1-e2b99a537c2c@collabora.com>
Date: Mon, 23 Nov 2026 10:52:08 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8167: Add DRM nodes for
 primary display path
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20261123085840.8687-1-l.scorcia@gmail.com>
 <20261123085840.8687-3-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261123085840.8687-3-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 09:57, Luca Leonardo Scorcia wrote:
> Add all the DRM nodes required to get DSI and DPI0 to work on MT8167 SoC.
> 
> The primary display pipeline is defined using an OF graph identical to the
> fixed fallback implemented in driver code to maintain compatibility with
> existing boards. Its block sequence is as follows:
> 
> OVL -> COLOR -> CCORR -> AAL -> GAMMA -> DITHER -> RDMA0 -> DSI
> 
> If a board wants to use the DPI0 display output the last connection should
> be overridden in the board DTS. As far as I know however there are no
> devices using the DPI0 display output.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

