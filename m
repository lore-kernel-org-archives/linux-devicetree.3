Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9700C388E4D;
	Fri, 15 May 2026 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778827893; cv=none; b=jXf0BJLTh56aPKfqlWUB3RwDTYJnNoSXRx/B4/nahZEHAlagQougKDBtBK266s1sy6DlH01hSN2yaHfXd19/Fth+/kMZn2s5A8+PIdpAAWE6vFypvfEerEnKNKgNHe7VNaeEqaP4aqt+NyTAUOZVhyazDBPVUtY1gL9Sil4Q220=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778827893; c=relaxed/simple;
	bh=pYzVa5nM9Ddh1bPK5+yxiL/X4VA1ysn4pX2lUE9O3i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlD4lxK5Q8tTbfmfWWGKJxTCTC7gyWvKXENaNC+CsoreRODO7pAdlMIE0bIxbeGj4OH1ge6kvMbdlVdU0qkMeP97+JSg+FyTS37tP8ik5aGa40rxNpwNh/KNyMUGaKRsHk834m10SUdZYGuapebUzZN01UnQeKDWKxiSoL9+Wus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9DMQ8ml; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9DMQ8ml"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5B0C2BCB0;
	Fri, 15 May 2026 06:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778827893;
	bh=pYzVa5nM9Ddh1bPK5+yxiL/X4VA1ysn4pX2lUE9O3i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b9DMQ8mlte1O6488J8Gt6MJ/XatOpSBgRIchxwq2lA7KqXBVuRl7m75uaKhLeMZuX
	 hw0fb62gEou6iU9tE0YmgwoEJYsgoG6cfhzTc3T+jKrDfEJTqu4T8F9wxT9pDWx/e4
	 CUykAC3bjdX02GXKAnXSZph0ki4rYGZN48ghOLKfGOKRd7n55kExvvv069JmInJ+ha
	 OFHPH67Em7+zFpeNib9EUVxkB6WMFxO1nAHHBSc55VguzwaBf7wZHoVsiW459LsqPn
	 xaZyll6Z2i7VroKVhGRndhkLGJThR0+rwAh3bupAZniupnJ944IIqpkABP7VoXCOlG
	 7gI1BHCwVKd8g==
Date: Fri, 15 May 2026 08:51:30 +0200
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
Subject: Re: [PATCH v2 01/16] dt-bindings: display: ti: Move ti,am62l-dss
 binding to a new binding file
Message-ID: <20260515-mahogany-snake-from-atlantis-c2d1e9@quoll>
References: <20260513-beagley-ai-display-v2-0-9e9bcefde6bc@ideasonboard.com>
 <20260513-beagley-ai-display-v2-1-9e9bcefde6bc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260513-beagley-ai-display-v2-1-9e9bcefde6bc@ideasonboard.com>

On Wed, May 13, 2026 at 04:17:23PM +0300, Tomi Valkeinen wrote:
> We currently have two binding files for different TI K3 DSS versions:
> ti,j721e-dss.yaml which contains bindings for the "full" DSS version,
> with four planes and outputs, and ti,am65x-dss.yaml which used to
> contain bindings for the "lite" DSS version, with two planes and
> outputs.
> 
> ti,am62l-dss binding was added recently to the ti,am65x-dss.yaml file,
> which only has a single plane and a single output. To keep with the
> above "binding file per DSS model" style, and to simplify the
> ti,am65x-dss.yaml file, let's move the ti,am62l-dss to a separate, new
> file.
> 
> Reviewed-by: "Rob Herring (Arm)" <robh@kernel.org>

Drop quotes

> Tested-by: Swamil Jain <s-jain1@ti.com>

Drop

Best regards,
Krzysztof

