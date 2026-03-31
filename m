Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E4C2F549C;
	Tue, 31 Mar 2026 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774946415; cv=none; b=hPk/1DZ+kI1IrkNLL7sBZQyd2qb/MKK1iJEBA5QxCohm8OQt5wX/WvlPngksJ2sRQcv3o06qySe61N7WDnsG8w64h70b/dQYcGaBb6fQ/pi1HEM+/SpTPyLBfH5mBeu7yqzrNizbF50xedO0A0ok2SUQmqxETxOyfbvyphmK0zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774946415; c=relaxed/simple;
	bh=9V9QYvvuD/aPzwd53OUxWY5RcMaQAmjjaBQNnIgKiCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8wNsfVUu5BVOLQvjwf/Lng7NZdO8R55FZGeTO92dC1MweOPcYX3mpM2p4UkouiAIy1DcvnJu5B1GrODahcCJcYddZLKbYqPL8XvDIrgGbVZ9sXYvfHPS2Hvj/JrPjbTEWLk5gYrn75GxGCsrymHb+7CzimfvvY5B8N9qOGSYPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aMUfkGT/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aMUfkGT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A818C19423;
	Tue, 31 Mar 2026 08:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774946414;
	bh=9V9QYvvuD/aPzwd53OUxWY5RcMaQAmjjaBQNnIgKiCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aMUfkGT/pA4g/AgiZb71azlf6IW9onIeJ4Xs594ikAJnw/eB0HR4/fx8Rr/y+lhcm
	 8K0UkIrOeotP0c7J8e57i0lh9R5XyVOZuMf8mJ1J4aKWMYmcOcbqo4KX7UFn3nFqa6
	 uL5YDAVXKgQkiANuk4X7B7puFnUpjgkSElif8JJH7NQ7POB3X+OlGU8Uv24A5xkp2L
	 5euLbR62pz5ke7Cue1TEj/TkOcnUU424aUi18w1mN/7zlvkOL0igS0/UMLKq4VF5z6
	 y4LNWrlEk7cE/g2y8lLncxmKiOyJDBfkQvRs3NZjUjFPNakyi9Zc8uDcIu9MfAJ/3k
	 h6G0UFMK+lwIQ==
Date: Tue, 31 Mar 2026 10:40:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Joseph Guo <qijian.guo@nxp.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: waveshare,dsp2dpi: describe
 DSI2LVDS setup
Message-ID: <20260331-roaring-carrot-stork-edaef8@quoll>
References: <20260330-ws-lcd-v1-0-309834a435c0@oss.qualcomm.com>
 <20260330-ws-lcd-v1-1-309834a435c0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260330-ws-lcd-v1-1-309834a435c0@oss.qualcomm.com>

On Mon, Mar 30, 2026 at 04:25:50PM +0300, Dmitry Baryshkov wrote:
> Several the Waveshare DSI LCD panel kits use DSI2LVDS ICN6202 bridge

If you know the hardware bridge used, should not it be the front
compatible (with waveshare,dsi2lvds fallback)? Or even alone? Can the
waveshare kits come with different bridges? I guess yes, they could.

> together with the LVDS panels. Define new compatible for the on-kit
> bridge setup (it is not defailed and it uses Waveshare prefix since the

typo: detailed

> rest of the integration details are not known).
> 

Please also update at least description:
"...converts DSI to DPI or LVDS."
or similar.

Best regards,
Krzysztof

