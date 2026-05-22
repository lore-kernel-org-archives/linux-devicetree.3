Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6271928F948;
	Fri, 22 May 2026 06:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779432796; cv=none; b=FAItcom12/EHXSiIqWH82qcEN3vTJUSPDQ/u3nBaDCiZJmrxhWd9rWl05km6zRPU2ptyi4mvZgHsn+evLuSLS9a+RgISeCFmxu3mQtcV1inmS6rBa4QHJcunXaVxboGw4hOhm/S1Ypq9NyViYofh9vd9D5oVkzuC5abJkicgQo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779432796; c=relaxed/simple;
	bh=N3+2KASXbGa04r+FF1J0xIyLxscPen4gtrv0EB5ytFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRQ3OnUV1EWbJW8BVer1+vbyZ6RVi46BdYcGa/rIgkj16TBywXF9qQ8D4Wd2IHcGIhipAIOzKpMEnnnv/yn/8ZFMzLTZKTMiJq2vNCCDQ6/yQuADhEpcm+pekhPultDUBe9Ao0hbW7HnMSwXFpj2SajdkoYAC3qd2APCfvip/wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T9fklyXk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T9fklyXk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4ACD1F000E9;
	Fri, 22 May 2026 06:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779432795;
	bh=MCXTW2aOaTue8CGuD3TkPBjG5amIHfOVy3I1QHrr5hw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T9fklyXk++gVyN5MTlOuDtPZAa4x2oK5cbE/aA6ue6o8/47ysIaE/BmTQyrdCYRHF
	 t+F0Em7yVbh1qVURXJJtBg9pshRY5ymwwYt5GFC1EBpak06BfSZh+J8KeIexHpBhEl
	 8tf0padDvBn+uKHXymRV6unqxfNHJcmBWuRm4Bvhg5iSfWjWunNZy20kF/JHpFnmKa
	 mMWDjYJgA49WiTvu92FNdWw2Jdih9uU6fU/FmtBllfmsS5vh+oK63rHhQ63eVx0DGu
	 3jp7Kg4wjHkU3JROyI284uTEz7RdBMBT39uUPBIFQeTqoLHQlbQNU4SDkDEOMMI6wb
	 xG6KGyfyLf08w==
Date: Fri, 22 May 2026 08:53:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Vitor Soares <vitor.soares@toradex.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 14/15] dt-bindings: display: panel-lvds: Add LG
 LP156WF1
Message-ID: <20260522-furious-coua-from-arcadia-b81cba@quoll>
References: <20260521150038.103538-17-ivitro@gmail.com>
 <20260521150038.103538-31-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521150038.103538-31-ivitro@gmail.com>

On Thu, May 21, 2026 at 04:00:50PM +0100, Vitor Soares wrote:
> From: Vitor Soares <vitor.soares@toradex.com>
> 
> Add the compatible string for the LG LP156WF1 15.6" FHD (1920x1080)
> dual-channel TFT LCD LVDS panel.
> 
> Assisted-by: Claude:claude-sonnet-4.6

Really - oneliner for trivial binding needs AI tools to help writing it?

> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

