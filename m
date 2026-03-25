Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E41931A072;
	Wed, 25 Mar 2026 21:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774474478; cv=none; b=qIrAMNOJw+gXGol1HuN3a1GoONS1T9zV4EAhViWLbjSF/1mcrl0HZrP+WIynIB3dAuLgPBqCzSxxQmn3KxXBeljO4goV3zGyAtjbESC7LM1Gw/SsX9PeDqg2t2EOMotAMPtq6G8dEoJVSk1DpnOSSQO7r5/jumqOVDJyf9HRjvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774474478; c=relaxed/simple;
	bh=h5PQt8p/yxquAUwPbpbYrT2NXIJf9oAgbbhuwKf/o6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d3ps56AJu2mJEYURK07Wia8dzVKwL5tRD/6otAuAaZRtrJao+u5Ucu0++HRpkpyYb6bEtN7Vwf3CaKiu9EFp8fzyYludr7la5dJAQlYIDUj27IRWKOs80CGD/vTmgl2uCHHlRqCza3gfxwGl/ORziSkFflmimsA+BmwCSWbBq64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qPCbvz/U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qPCbvz/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3182C4CEF7;
	Wed, 25 Mar 2026 21:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774474478;
	bh=h5PQt8p/yxquAUwPbpbYrT2NXIJf9oAgbbhuwKf/o6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qPCbvz/UNypttFd6ULgtJFnr09wkA1QKODTctLZ5Qq6zHMBmJ4Pey0OIbHdbOduV+
	 xcNsbR9Zff+menLwfg66rlbkF4X1LzdmsEFxgqnJvt5qkLFcVceKDf7ozkB4PXicpe
	 5AH9SNkv7ffkK50HQc/yEbxVPDfix4nUvGdw2DltWLVWyHWVih9pe03TuKit6/6lNb
	 b+jY8A7IvXEg78zj7xwSWw59VHMYolRLPdJgkvP2wzpNpAf8Jsmqcnyh05Xh725esv
	 dKAeowEsr5qkweTrIvWTo65xmnZgQx+F4Dd6cIWYTuQ6OwAZ9wKybnnOqTCOWlxMrc
	 RufHR23wqhAGg==
Date: Wed, 25 Mar 2026 16:34:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Venkata Gopi Nagaraju Botlagunta <venkata.botlagunta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
	Nilesh Laad <nilesh.laad@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	jessica.zhang@oss.qualcomm.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	venkata.valluru@oss.qualcomm.com,
	Yi Zhang <zhanyi@qti.qualcomm.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 1/2] dt-bindings: display: bridge: lontium,lt9211: Add
 lt9211c support
Message-ID: <177447447542.4149755.9655940024257618231.robh@kernel.org>
References: <20260323-add-lt9211c-bridge-v5-0-9c63bb035c17@oss.qualcomm.com>
 <20260323-add-lt9211c-bridge-v5-1-9c63bb035c17@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323-add-lt9211c-bridge-v5-1-9c63bb035c17@oss.qualcomm.com>


On Mon, 23 Mar 2026 12:38:52 +0530, Venkata Gopi Nagaraju Botlagunta wrote:
> From: Yi Zhang <zhanyi@qti.qualcomm.com>
> 
> Add binding for the Lontium LT9211C bridge chip.
> 
> Signed-off-by: Yi Zhang <zhanyi@qti.qualcomm.com>
> Signed-off-by: Nilesh Laad <nilesh.laad@oss.qualcomm.com>
> Signed-off-by: Gopi Botlagunta <venkata.botlagunta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/lontium,lt9211.yaml | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

