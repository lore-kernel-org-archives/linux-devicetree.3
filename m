Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E084E3ACA5F;
	Mon, 20 Apr 2026 14:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776695626; cv=none; b=EYNhzkdndYdW0UuZk1uUmsMrt47SWYoG4VPL+SeirRUCJ13gaBeKA0QaMVTHEKFXoIxleXYfCZm7LUHMbkg6XSHVcuvK82ZdXZMd3vgZK9TaW/JUtqdmvPZzfvngvxxvBC70fcAHr88PV0n1itX3yFH6+A1gwUp6056TXF74BMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776695626; c=relaxed/simple;
	bh=P28JjJyeQsLcizRVuelUNaPqYIj5AsoRGrZR1HPwgmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y5aabo8/wGegQs9u/e2tykcJayJPN3xnhN2pBkOSAZCzlK8WAEXr28AlQpgtZ4hzIauBUCXXEQlq1Bze2GxC29OiLDU5m3EqI7muyBSoukbqzKaelXPVyq73G55VoodMPe2OTQ4lhl7IfFm03rq1v1w94FlwNS9UbdBn8+DVEv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lvY87at9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lvY87at9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647AAC2BCB4;
	Mon, 20 Apr 2026 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776695625;
	bh=P28JjJyeQsLcizRVuelUNaPqYIj5AsoRGrZR1HPwgmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lvY87at9iO7B7ik5tLUNmUlPeerAWH+F7UhIHsjnoqJWnlTg5mkGtPu+IBLq32Mtd
	 DRY3YdzoH0ZhiT3wtG9shcI1zHKSSRLlVRcU4yLweYrdfC+NLDZIxjHoGVq0m2ha10
	 SLRFcdhbbel3OPHDn0KyTktjXra95nYAUSFriWFXgHC8B/mBk7oES4d+wSpHm+Si4c
	 YY6gr0oBWsCUtX+GWD2rMiHbcXMNTk69zrXefiakBYCgDCGbJjfsf90GP2z3vTzMm2
	 wXZ4w+DkGzrC0luBd0wcU6EAQuthr8syEMxWZSNliXi22Z45g0T8QoikrxbWLqnKgj
	 uyhHfjO7XC/ag==
Date: Mon, 20 Apr 2026 09:33:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Subject: Re: [PATCH v1 1/1 RESEND] dt-bindings: display: bridge: ssd2825:
 inherit dsi-controller properties
Message-ID: <177669562148.2456487.17336642131288149446.robh@kernel.org>
References: <20260417064657.20293-1-clamor95@gmail.com>
 <20260417064657.20293-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417064657.20293-2-clamor95@gmail.com>


On Fri, 17 Apr 2026 09:46:57 +0300, Svyatoslav Ryhel wrote:
> SSD2825 being RGB-DSI bridge should inherit dsi-controller properties same
> way other DSI controllers and DSI bridges do.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../devicetree/bindings/display/bridge/solomon,ssd2825.yaml    | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Applied, thanks!

