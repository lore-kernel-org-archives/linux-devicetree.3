Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F9B3A9879;
	Wed, 13 May 2026 19:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778698988; cv=none; b=CtfZOSM/a6YwMI3t31A5YfIu5M9lLVV8j80ox2mbzlXriPCrYg/q82LS6pa/11IdCrqOVKJm9FY6n8Tc4erusEYjlQo9nykxmXUI1wJX1wP+1ZLkHkAgNvjEGlpSQzlZtwzV83L41E45NtYoIMxVxc0kA4fqtOnONqGQuCtc62Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778698988; c=relaxed/simple;
	bh=EFHyCV5Fzy8lGU/TCEK6Y6BJe4DrIl8NrL1B869ZVsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idR/96iMs3KBj+WHA5A8i6KzoESYA8j0yhup7QKiXGoia6xO1mraTU+I4QdtrB61zEVH4HlWERZIpUDib/0nSlRrPGKzfkhYZV4fWmetMUNNMCmIJVKL2K2LivdLcLl4Ik/KepgU5CRFz/ecB7pNAULUlux5OlkqLQFNqLqUfkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ctcRFAXl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ctcRFAXl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EAC4C2BCB7;
	Wed, 13 May 2026 19:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778698987;
	bh=EFHyCV5Fzy8lGU/TCEK6Y6BJe4DrIl8NrL1B869ZVsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctcRFAXlqMutmFA6F/+gFzVfl4BL8HfCR1MZmVwUsvKfoeiFexzmU7e1ULgorBHya
	 vOLibPt5AAjx/H/IiEvnLBN4/MRP6qEXdju7mbASCoQG2VFpTzbQPodE9xSeO4Ibmi
	 OjSh0jm8fpxd27hlo7GYc/70GZoq4kHyvTQSvICc6OecO//a3aFKpRj0zRtuKUfltq
	 icI3GYe1TuVDTqSHtBAXEYbn5X8IqgboNkbpxwfBK6R/JVsIjQrK4mp/48wJ4KaC/e
	 nF4op8QaKdOdjN2NfAFFTEolmxUzGFTRbN76BNpSboJthpTYkOr/YllfGpNZtDD0bK
	 5OnkVEJXgJ2Ig==
Date: Wed, 13 May 2026 14:03:04 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2] media: dt-bindings: mediatek: Constrain iommus
Message-ID: <20260513190304.GA1677938-robh@kernel.org>
References: <20250821065900.17430-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821065900.17430-2-krzysztof.kozlowski@linaro.org>

On Thu, Aug 21, 2025 at 08:59:01AM +0200, Krzysztof Kozlowski wrote:
> Lists should have fixed constraints, because binding must be specific in
> respect to hardware.  Add missing constraints to number of iommus in
> Mediatek media devices and remove completely redundant and obvious
> description.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Ack
> 2. Mention dropping description
> ---
>  .../bindings/display/mediatek/mediatek,ovl-2l.yaml           | 5 ++---
>  .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 ++---
>  .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 4 +---
>  .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 4 +---
>  4 files changed, 6 insertions(+), 12 deletions(-)

Applied, thanks.

Rob
