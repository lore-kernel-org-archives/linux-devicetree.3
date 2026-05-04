Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A905399356;
	Mon,  4 May 2026 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889925; cv=none; b=RGhEtWKbRi5BYKk116g21/ZRDgLNqJMnL+pS63K5Yov/9gsyQgH5hASc7aOp2nSEOysy/bR25y4gkwhdbhq4KxU5rrmUXaGEZbAczO4DzqzUZ4JLmD62MksgJAGQhl/+bNWXH6T1P4EO+9kqMeUrnEOtX4qa7Qcl779ceSsNpkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889925; c=relaxed/simple;
	bh=iTf7A919EfkWk9helc4UbhGI96LKBoYsGAAsbdPvufk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HO/gRwcIJI6/cy03SrstGO1uIepi/EFS+U8NIHsSC+N37vy0f9kaaJDE8MOS+SFnS3FpI5NMg+HyybscfEUWsEljU7SoPu10tcWKMuPXUOB0b2ISjdjUtvseOJyLASlg7WczHNDgyeFgauWMuC8LBeoh77Tp/ENT1QzPQwQiow4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzpCTpPr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzpCTpPr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A7EC2BCF4;
	Mon,  4 May 2026 10:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777889924;
	bh=iTf7A919EfkWk9helc4UbhGI96LKBoYsGAAsbdPvufk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzpCTpPrKoPtROZOxYw1Sod9uFtmO0Yksc8O6pQu34LkM/bGgA9+XXXO28FZONZLz
	 ZPv1Fcw7nMZSbuVOwmPfko6YGunADHOKmE10yfUMajffgLYPxslMN1cfTIFqktCSbg
	 KT/ymIG2BtyEg/MytZyhjOK3jAhfs2Uyy+gMnWb+1OoziIGlgT0ltgaCv7vOTQ6vR5
	 OM1bXaJZIH13gAxoNUQoJBx+ZOH0sLGEhdDoxtMSn2PjjrZlGODJJ+WOuAypAeXobY
	 Jww5gmFniwFIMtwX8m++d4lW7RXeO9ewtXXlSPC99MP8oni5K+Hi7iqAyf5i4i/XjN
	 y2to9bucxnWcw==
Date: Mon, 4 May 2026 12:18:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Devarsh Thakkar <devarsht@ti.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	praneeth@ti.com, vigneshr@ti.com, s-jain1@ti.com, s-wang12@ti.com, 
	r-donadkar@ti.com, r-sharma3@ti.com, afd@ti.com
Subject: Re: [PATCH 1/6] dt-bindings: vendor-prefixes: Add Dalian Good
 Display Co., Ltd.
Message-ID: <20260504-imported-bullfinch-of-drama-4bc7b1@quoll>
References: <20260430183311.2978142-1-devarsht@ti.com>
 <20260430183311.2978142-2-devarsht@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260430183311.2978142-2-devarsht@ti.com>

On Fri, May 01, 2026 at 12:03:06AM +0530, Devarsh Thakkar wrote:
> Add vendor prefix 'gooddisplay' for Dalian Good Display Co., Ltd., a
> manufacturer of e-paper display panels and modules.
> 
> This prefix will be used for the GDEY042T81 e-paper display panel in
> the solomon,ssd16xx binding.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

