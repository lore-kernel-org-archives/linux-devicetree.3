Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98E821CA03;
	Thu, 25 Jun 2026 07:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372764; cv=none; b=IB7k2Xp/2BSTCXUEbVM6DwgQFqJ89pKHT5DSjXab10suxonYa09dIZbSbO7PCbT3T8ieSdh6LAONAy176YLRKQ43TwYzSauEUQVzalz8erVEC/mPuv6F/AHO6xe1iovX/cJv9rX9pKVHp6lzdIJew02ojcNswnD+9NVaicEgkck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372764; c=relaxed/simple;
	bh=2PDUFJY+QkYuzeyqufzPcDKr537ip/E8/10wMnMLTxE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZURMijVoSRhhgnjY90NsfErZxbFBVewDRqk4WWO3y26RO/740DZsr63juuxyo06VHIQQ5gkTmNnYhMvXx9uBESyC41TplwNMtqyQzQv6ABW5+Oxd6fcOiFMr+wHlJFvz4iLWA18xQTsSUOZT+lh1DWJXSh3TTh6OU5aUnVAso64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGaWB+TE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGaWB+TE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC211F000E9;
	Thu, 25 Jun 2026 07:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782372763;
	bh=2PDUFJY+QkYuzeyqufzPcDKr537ip/E8/10wMnMLTxE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WGaWB+TEKRegrwE1IO45sU7ItXBXq1Gn8JBMf3AFDiuAUUxqN5hLyJATlw1ESZnjb
	 BAC9dyP0NBKiPsSQN6fAEA4x9GFVRwK5jTjNiLXPKzBbINOa2iYIMli00DBp80O/LX
	 Ahm+4gGtwPoNgV0plQ31PRByta3/AXwMCSsfoJI9ioOslrnivR9cwpa5rvZlTUbJyh
	 qkMM68IshjixlGLMOUUMWdUFiXbQJ3Kyc9K29Wm7UbZIPGkvQXqQ6hlFKrn3wHJR4z
	 9Z0Fi4Mb1+2yx/KwiwCb4Gnqyt138YqtMpcdjwFU7qBD9+lXdphxasHVDMYzOpXMzc
	 dnalbqRSsBwfQ==
Date: Thu, 25 Jun 2026 09:32:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: mediatek: cec: Correct the compatibles
 for mt7623-mt8167
Message-ID: <20260625-likable-aboriginal-ostrich-d717dd@quoll>
References: <20260624173627.19785-1-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624173627.19785-1-l.scorcia@gmail.com>

On Wed, Jun 24, 2026 at 07:36:15PM +0200, Luca Leonardo Scorcia wrote:
> The HDMI CEC driver for both mt7623 and mt8167 is actually the same as
> mt8173-cec and the mt7623n.dtsi board include file already uses mt8173-cec
> compatible as a fallback, but the documentation lists them as separate
> entries. Correct the binding by adding the correct fallback.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

