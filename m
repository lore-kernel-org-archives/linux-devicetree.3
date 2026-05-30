Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6D83537D0;
	Sat, 30 May 2026 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780131361; cv=none; b=PwQ90kd5q5XKk79YsK2fTdO8UaEDb153uFTsY0u83Yc4TaOSLtIeAwDlOLhLm7SmLkxgIChud8tVxWmeM/fM3o9BJU1RwpEDj2vEf27TGVrVHMQ01uyUQAmFr7dwjHp3Lp7jF0O0F/gnftTMc7R4UhJWnIiNfX46TMgjfNR7u54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780131361; c=relaxed/simple;
	bh=v/BsEuYiepGoajvicEJMXVqnkQZrHC//OIxCW+Cd2IY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=arZer13ctrJDobIvv8IW+lysrpiQmgR+Kph4sB8IXhEzrr75Xhl0c2YmYlPGXDGS9dfIMjQN+MFGz4zVRblG4hHIm+sxVT8Bi5Vsbih0WPQqTevmijVAF+DUzMX1ma+gLnKxdD06hXBHwSABRsnpf3A34UVhZhG0tC1iN8C9sz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaibxtZz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaibxtZz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66DF01F00893;
	Sat, 30 May 2026 08:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780131360;
	bh=gCbea2ijODrO6sWfTgmHFJeUbJdsnvpmfjDFt87l/DA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KaibxtZz8iwYzltdaad6YmQE9wlQ56wgEGZvkdkNzysLW0D6l8V7t14XNKhNluyD7
	 uGID3zLI2DI/G+EHuyivOzfx+sZUgpqWtFd1ZV2ouESpbr4PE+QJtqwQ3DDK5NUrnW
	 tXSKAqT9NpLrc4KRDIE/3frQYTtcHvdtM0XE+69OaqmeZhwDMnhqpWDj+oQUcz1zXY
	 tpJnZl8ZDMrqlnugMv6l9buOgBO5pVxMKIAFfgOrUF+PsIESTSkzuYclyaZOr731CF
	 x7WN4Laj2FAXGiyjj2VhJorhHtqaeSuPNVgVVXcox2OA65FvIISPeLD2P7eDWhK7Ha
	 d9WEBXdfCzKOQ==
Date: Sat, 30 May 2026 10:55:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Aradhya Bhatia <aradhya.bhatia@linux.dev>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Swamil Jain <s-jain1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Louis Chauvet <louis.chauvet@bootlin.com>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 03/15] dt-bindings: display: ti,am625-oldi: Add
 optional power-domain for OLDI
Message-ID: <20260530-axolotl-of-normal-vigor-efaee1@quoll>
References: <20260529-beagley-ai-display-v3-0-7fefdc5d1adf@ideasonboard.com>
 <20260529-beagley-ai-display-v3-3-7fefdc5d1adf@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260529-beagley-ai-display-v3-3-7fefdc5d1adf@ideasonboard.com>

On Fri, May 29, 2026 at 11:45:33AM +0300, Tomi Valkeinen wrote:
> On some SoCs the OLDI blocks belong to the same power-domain as the main
> DSS block, but on some more recent SoCs the OLDI blocks have a
> controllable power-domain.
> 
> Add the power-domain to the DT binding.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  Documentation/devicetree/bindings/display/ti/ti,am625-oldi.yaml | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

