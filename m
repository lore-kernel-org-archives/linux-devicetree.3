Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22C43E5A03
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 12:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339457; cv=none; b=rCt34fhnNMqC/L2jlgeYEx7f2AioFIPN4BT2/Z0ujaCn44LZBzwi/x2kNd0lytHUoNgVqJr5HmICJqQopBKNJKmisbPKynLRDRKTVS+0zQ2aU/ta+VJWHrbt4DxaBKIOzn+UNuycVlfkAaCZPf+ch2gaNrziliBOCoSRjtNM2Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339457; c=relaxed/simple;
	bh=umDnx4wLlEXWbHBkxxptngPDNrEzTcPPTc0sZDSz+UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nPHe5DbS0gqNv92nu8Bl2F0pA6BArm5cr7v6fHFiqbHWdIu5VtDnsSxDWIWsBu/8gBMk9uRoygvJHJkINes6nrAbjMHFoWUyia5eTQWt963Wfd+vt1kjy7n2SCP3PId/v+cP1W7ijfdTYbSJzWU+QZgm8YlgfbzfKLmuph69lq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOugo/xs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOugo/xs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408321F000FF;
	Fri, 25 Sep 2026 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790339456;
	bh=f1wkjUAJ6a32H/DZDitGVNd21IhCL485bJ83WiTx4Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eOugo/xsQISJsvHT3Y8QYzdtdSKE2XO5BUK/EeruX2DxiSTHELjtUAzyby8WVJpL+
	 cMG6VLOZe1Axw/ywbqTLiN8pV9wZol56K1GQQRKnjpJXc4YuwTRx5I4aHPPRA+SRAu
	 57qyQzmmPaBQeoCi23hTnKwklXIykSLQ6W8EWHAcVfTdh5pC79i8V/WzjGvQbmuUwG
	 LBVS02XF7LnVQcLJeL1qBsJFafJWSwIdzWEM51zy9iwcVH+3ZnWeGl6rrwryyLVxpv
	 8yqgzFkESb6WrmOyaI1DhvI2afx1VhdIOb6Eg1MnTckp5yMMvXQv8d+LlEieXOkBSM
	 4MBAbyreql0Xw==
Date: Fri, 25 Sep 2026 14:30:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Leander Kieweg <kieweg.leander@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v5 1/2] dt-bindings: display: Add GlandaGPU binding
Message-ID: <20260925-fabulous-wren-of-action-89d266@quoll>
References: <20260920193944.110983-1-kieweg.leander@gmail.com>
 <20260920193944.110983-2-kieweg.leander@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260920193944.110983-2-kieweg.leander@gmail.com>

On Sun, Sep 20, 2026 at 09:39:43PM +0200, Leander Kieweg wrote:
> Add Device Tree binding documentation for GlandaGPU, a custom
> FPGA-based 2D display controller.
> 
> For hardware designs and RTL sources, see:
> https://github.com/stiangglanda/GlandaGPU
> 
> Signed-off-by: Leander Kieweg <kieweg.leander@gmail.com>
> ---
>  .../bindings/display/kieweg,gpu.yaml          | 56 +++++++++++++++++++
>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>  2 files changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/kieweg,gpu.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

