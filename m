Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA4D2DB7B7;
	Tue, 24 Mar 2026 01:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774314706; cv=none; b=ITow5b+ZBe4ZoERmge03HaWgILJKBrplsT50F3qktZPxelXK7HAPgwittJ27lTAtVV/nLNcgO1x9OqOFK7rfkoAchVgo5OgbxInDU1juAcuxAFrg+mlA16hZE/Sv9lgZWiJ5bmmBJ7AMeb2skZZ3cIMFv8aoGXPkpSu50EA8a/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774314706; c=relaxed/simple;
	bh=E9cCMGjU8K/dZwwXBy/xpq2fkGmeV9HMWGks3FqOKNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sokb6SzoACyWL+MbtArfIXEttex+UJjEeqNOESk4gNn8Kd3TLeDHMPLSaTsWXL1u+tEE18BD885HazzVBuQzqt0TJIsYbyGeeSitHLQC0Z820xk3WCXT4iimev+VP/bfmjJ4ETtYGkuljDraBnYR0lwlN4JsDZdHYN7qivEMDaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gQ1Lq8CX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gQ1Lq8CX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D41BC4CEF7;
	Tue, 24 Mar 2026 01:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774314706;
	bh=E9cCMGjU8K/dZwwXBy/xpq2fkGmeV9HMWGks3FqOKNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQ1Lq8CX51IIxGWUqO11sOlbruLXVao0SZGoZNySK9vJ6XwePjpA4KDCDLAs1j2bp
	 1mFtRYrkIYb2lCfwKFHcla3OkyR30bsASk2+PyJsdJfIHk327coc/tv2E9qhEje9Gl
	 s3c+bB0ftwqgTMkXK6WCbKY5g6E/qsb6Hh0TggtVqC3zxIjTItg1ZlucwLF2WpXYJh
	 CUkdtahcKgWBVNCuN7ImriXsSvrf7fTVm7L4zrAqy/ktbZnIUmdGPTT6fFTwd0BH53
	 XEuakGprR/gt4xf/B10L629e2GjanTSmS661xug+IA/zuAn7c5Q0LPAWKLEnaRwsMk
	 TGlKjOeLjzRdQ==
Date: Mon, 23 Mar 2026 20:11:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: devicetree@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: panel: Add Himax HX83121A
Message-ID: <177431470438.1869567.10359365187485586761.robh@kernel.org>
References: <20260316084040.728106-1-mitltlatltl@gmail.com>
 <20260316084040.728106-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316084040.728106-2-mitltlatltl@gmail.com>


On Mon, 16 Mar 2026 16:40:39 +0800, Pengyu Luo wrote:
> HX83121A is a driver IC used to drive MIPI-DSI panels. It is found
> in HUAWEI Matebook E Go series (Gaokun2/3) with BOE or CSOT panels.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
> v4:
> - use v2 as the base since v3 was using v1 as the base by mistake
> - remove '|' from description (Krzysztof)
> - drop description for reset-gpios (Krzysztof)
> 
> v3:
> - remove '|' from description (Krzysztof)
> - drop description for reset-gpios (Krzysztof)
> ---
>  .../display/panel/himax,hx83121a.yaml         | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx83121a.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

