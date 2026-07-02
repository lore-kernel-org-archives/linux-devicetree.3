Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8104930C359;
	Thu,  2 Jul 2026 16:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008400; cv=none; b=AUvNwssG58R0PAAVH8JuI9IXi6Ims2sPs1NK2uaJ3sG+/M6wOGTVsRaDlfX7iqjQmGkGcBSsSgY7EJOcSn+8svIkLGfbmF/m368rT2ppzbD+awsdtKwd1UciY8XSHTaXGblUa3q1tjabQtuGUjNjhKOfQdXll7GaaGjiiq3brDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008400; c=relaxed/simple;
	bh=HxFGEd5oBP6JKncOU4pn8rCecsfso55AEi4OHPOkd4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnZ7s6dGaKXu/K+f5OgSRWYtdFAMz9IVb4uwWYF80/W3PGMqM46+9xjAG08Zbx1xPb763rNsuHNYrg1wiipKyAaEjyFAAsqG8y6SmApzcjziASze3jWPhW6CcXho0W5VXvOosoushn7NwYy2LArXnCixIfAj7YPZbIRa/LXM8rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHQTcIT7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHQTcIT7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05A8C1F000E9;
	Thu,  2 Jul 2026 16:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783008399;
	bh=FdiEJFtT0kqS3cyVxjbGZsrY1s23jlTrmELtXFowl7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DHQTcIT7fff9Y6gIRWfR8XGoRaEQoNmsp/gCoyqVpVxNWNlAUuADER8JPHn4G5dOo
	 lnTqZPnGHPlLrWTgKwflradkQqaucyM+KJxRNV8FkXIIHLIz/DP1y0neOSHFWKXk4W
	 LTd3x8UVK0E9HZVMCUPH07frmttXxv2Dm54UlG9ca9xuQ4u2MCFPsKTi38zmfIF3+H
	 xdRrnKDFMAQ3oG6m9RTPs4DYqbT8FnsKyGuMSPfjvkQjrRky/dXibnk6FnS+SDzg0H
	 D5pPflShQOzyh1vNOYxNNpE3AI5TRNRqlg/zAhVKNNN93jK80OVqbGikeRLCDcPW07
	 66YGdHgpmV8KQ==
Date: Thu, 2 Jul 2026 11:06:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: devicetree@vger.kernel.org, Joey Lu <a0987203069@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor.dooley@microchip.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2] dt-bindings: display: verisilicon,dc: make resets
 non-optional
Message-ID: <178300839743.195775.5904192106959239550.robh@kernel.org>
References: <20260702054804.164820-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702054804.164820-1-zhengxingda@iscas.ac.cn>


On Thu, 02 Jul 2026 13:48:04 +0800, Icenowy Zheng wrote:
> The only variant supported by the binding now, the DC8200 controller on
> T-Head TH1520, requires three reset lines.
> 
> Add the reset properties to the required list to clarify this. The
> in-tree th1520.dtsi file isn't affected by this change because the reset
> lines are already populated there.
> 
> The driver still considers the resets optional, so if another variant
> with no reset line appears, only the binding needs tweaking.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes in v2:
> - Fixed wrong reset line count of TH1520 in the commit message (Thanks
>   to Sashiko).
> - Added Conor's R-b.
> 
>  Documentation/devicetree/bindings/display/verisilicon,dc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!

