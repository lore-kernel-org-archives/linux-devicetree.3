Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C2A30214B;
	Wed, 25 Mar 2026 08:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774426739; cv=none; b=qyKL4Bdv9fwoeYpBHLaz1gcFVCgI27gDD4yygEklkRj8BFu/1ghK/xTCjjQecpoa50r778/wjmYgW427nCjtLkDyqOhzPJ8/O77aeTIO8a5TOTA+0Npsuckz+v0LhOfAUKY8bjEjfLaRt3b/ASr5mzH3oQ4sD4vcsswrK559qvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774426739; c=relaxed/simple;
	bh=l5hbhBxK0vQal/zDiyjexDnCisT8vaZyQAqn5AAN1d0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgYtC7+fvmRifCoyhRNQdjCeAosP9B8oqZ0Nyw/O3lYPGHv5QHeiE8YLvpsPjyT253g/0PPY/w03Lvr1qSYnfVCTkwvfhr/K/OpDXshvT+n08wZ4vuvJfdysIc04WNhKpQwoy91TPSxB82k/1HbpI0J7wTpbBXXN9VW2fpwWM04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6WxswBz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6WxswBz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D309C4CEF7;
	Wed, 25 Mar 2026 08:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774426738;
	bh=l5hbhBxK0vQal/zDiyjexDnCisT8vaZyQAqn5AAN1d0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6WxswBz1yLsbEY+xondEzkTMuDm0moXJREF1w7n//W18yp3UzKPmamuortP7Bb2s
	 Lwbw4Zar1SbgCbhaV513HhOQya6II4lAEeN2qqIVbYU89mb8+oY4BO6vHsMsIofAqq
	 aLcksX0bJsdbdiY5HfJChnDmiws+ri4Nsbvm0VwoY1GOMM4DQyRHH8TpWkzqn4K0ZB
	 2ZuH/OsYouMq+RSJEKfZU/Ka+ncgHrTQ1PNA7McshNnYxWjotELQayE9FZ2Oo+SNsh
	 yjJTw+hLvnwsVaKYJMAojm5Tz9uwKraD2YX+o9Ol4hC6MQfv40bSOiYwmRQOHY+hWT
	 xhYIvvqPnfJFg==
Date: Wed, 25 Mar 2026 09:18:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 4/6] dt-bindings: display: mediatek: disp-tdshp: Add
 support for MT8196
Message-ID: <20260325-cautious-giraffe-of-serenity-b55d8f@quoll>
References: <20260324125315.4715-1-jay.liu@mediatek.com>
 <20260324125315.4715-5-jay.liu@mediatek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324125315.4715-5-jay.liu@mediatek.com>

On Tue, Mar 24, 2026 at 08:52:01PM +0800, Jay Liu wrote:
> Add disp-tdshp hardware description for MediaTek MT8196 SoC
> 
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>  .../display/mediatek/mediatek,disp-tdshp.yaml | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,disp-tdshp.yaml

I don't see improvements.

Considering how vague your changelog is and you only implemented coding
style, not review comments, then NAK.

Implement everything I asked for.

Best regards,
Krzysztof

