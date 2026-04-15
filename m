Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292033914FC;
	Wed, 15 Apr 2026 06:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776236256; cv=none; b=ckwLCONx2a3Z7KrJKGKQN/TZpqVj7BPzU4nQOjIB515vyPXx3ihyP8dXj/EBXjyXdKm/68t2FA64xDouyPRcEe7SVLLPzicnsBAmSIkBc/a3wmzc9u1Wqea256heYw1CYq102i3Zd4Izt05eCezAHlOSAYwxwT9MVTufcrYbLOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776236256; c=relaxed/simple;
	bh=kGxHkwuajsqPzKzACuGpkIM3KPBsa1RsKd1WBe82kfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msV8CHkIwVg5IozTGA7aso+dum5KBgekhOtzu0sQ1w+hLaxi5OKh+WxttL9pUoRtQpfIY83D1AntSEfuJZBXb4S3PguvtxcPeUIeoTp8lfE70XjA97pM6LevZf36JtjzF79ZIV5seEkllbXwJ1ZtrVaS2LQU9Vn9SGX/f17EGXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q7aXrrG4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q7aXrrG4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC51C19424;
	Wed, 15 Apr 2026 06:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776236255;
	bh=kGxHkwuajsqPzKzACuGpkIM3KPBsa1RsKd1WBe82kfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7aXrrG434LMA8+2kL8zkHyOvd5zpxEeqxkMECeA0tBGBbG66MJX5Yc0dXjAczDTy
	 05zQJ5j7KqoU/TfYgGicBsUlr+PJ4gtKwbov0BWe6IcZbzTP9LJY47XO1P3KqeXMpt
	 phV/EvwVib5ztbxmy4SHZHF4nxNp2FAxA6VGJleKy/OSEpgNyaWSvwrBGHtPCy2hhQ
	 Krsx8rqneQhtEmR6Lyf/sEyvIQqMC5nUwc8HbsH9Dd7CqaXSnR10xR0PuEmFWcw9OC
	 QLAoNsHFCMMTukZtVvmwZU1ECWf457mv1x5gU1HxtiEQjakQx6eGES70U8FG5vpXmG
	 de5ZceN/I36DQ==
Date: Wed, 15 Apr 2026 08:57:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dennis Gilmore <dennis@ausil.us>
Cc: Alexey Charkov <alchark@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, FUKAUMI Naoki <naoki@radxa.com>, 
	Heiko Stuebner <heiko@sntech.de>, Hsun Lai <i@chainsx.cn>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>, 
	John Clark <inindev@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, Michael Riesch <michael.riesch@collabora.com>, 
	Mykola Kvach <xakep.amatop@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Robinson <pbrobinson@gmail.com>, Quentin Schulz <quentin.schulz@cherry.de>, 
	Robert Foss <rfoss@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v7 2/6] dt-bindings: display: bridge: simple: document
 the Lontium LT8711UXD DP-to-HDMI bridge
Message-ID: <20260415-wondrous-premium-hamster-f8eccf@quoll>
References: <20260414214104.1363987-1-dennis@ausil.us>
 <20260414214104.1363987-3-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260414214104.1363987-3-dennis@ausil.us>

On Tue, Apr 14, 2026 at 04:40:53PM -0500, Dennis Gilmore wrote:
> The Lontium LT8711UXD is a high performance two lane Type-C/DP1.4
> to HDMI2.0 converter, designed to connect a USB Type-C source or
> a DP1.4 source to an HDMI2.0 sink.
> 
> Signed-off-by: Dennis Gilmore <dennis@ausil.us>
> ---
>  .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

