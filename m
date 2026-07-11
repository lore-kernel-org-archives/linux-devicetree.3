Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274AB27B353;
	Sat, 11 Jul 2026 15:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783782512; cv=none; b=tofir+P0HMyh+RyP8lmnEQN7nKLaX8Ere1bpM9uiywpN4rVEzEpxEX/JlwjuuZ/RFeKQisa16vFGfM7q9SR1lUOy4DgH7QUICyt2bcbzECAQeptW98fVBkKWAGcTNFnX+WtqX3m5SmtwysDH6vZpz3QU8GJg+ovckD2fjq+g43w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783782512; c=relaxed/simple;
	bh=0j8uuNSy0GDVlayKKr2dvLiwZultScOjriZLY+119Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a8/Gux8p245EQ7jGSgND55bm7C39ykZL5VEyEmwhs9zjQGomre6C42Cl3wbCMtt0CaQ31elNOo/DdeV1wZXTuYpA/kBhH/loFEkSTofbhjiv04UsDhexNhxeMI7Gz7NRQoVKTkRcVgu26VlZrqasf01h3URVj5Zi0eWBUzaTB98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2W6jO7G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2W6jO7G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 050AA1F000E9;
	Sat, 11 Jul 2026 15:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783782510;
	bh=RO0MF0UO52N/BtTir7O87MyPoM0YbxI8BeP9WMXMBa8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l2W6jO7GmyST4ZStZowKVuylMTRzj91JHzDKY1Bw8IYsi5tftBTA9nh7/2B1/Zzby
	 x4cErQwpyvltwy0553zx620THvjKjhoD8PEjb/uxzWchNnBt4CQRD3A8q9Inq+Jyqp
	 bHl9bKksHNU3y3/jBPD79OEgcEKEbI3Wy3f4x6YLKKyav5VszCO+YoswItWCm4H29e
	 pkKd90f/bQCtAvUrYnPLZ5mzgC93SEtGhtwJ5iVkag+vOuvra8Lu32rojl9EWnDG/e
	 ZUukR2eamLdZil3lfBWS3EHnx7Qo5ilnAuyHaVYzOisU9DQgS+iCex3PabUEq1X9Ev
	 GjO+bTlT7weUw==
Date: Sat, 11 Jul 2026 17:08:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, jitao.shi@mediatek.com, granquet@baylibre.com, 
	rex-bc.chen@mediatek.com, dmitry.osipenko@collabora.com, ck.hu@mediatek.com, 
	amergnat@baylibre.com, justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v4 02/12] dt-bindings: display: mediatek: dp: Add
 compatible for MT8196 eDP
Message-ID: <20260711-chital-of-incredible-gaiety-b390c7@quoll>
References: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
 <20260709113148.49090-3-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260709113148.49090-3-angelogioacchino.delregno@collabora.com>

On Thu, Jul 09, 2026 at 01:31:38PM +0200, AngeloGioacchino Del Regno wrote:
> Add a new compatible for the Embedded DisplayPort IP found in the
> MT8196 SoC.
> 
> This IP is compatible with the previous ones, but not fully.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dp.yaml        | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

