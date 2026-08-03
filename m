Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2524A33BBD9;
	Mon,  3 Aug 2026 09:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785749706; cv=none; b=LN5PK1i6AXQCpDvP0CkMwyRSW6D4u7ZA1O8RG/DdgBGudi7lpMRvahByjUcKDoppqkco+QASo51j/f3DDqAczC6e74QEug2zHAuLOiOyMK3yqbgW2/PrkF0i3xeKKPmI9o3s/e5DaGtJrQroK+PIjruxYK3U+v0oNaUhQevr1C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785749706; c=relaxed/simple;
	bh=klANR4sDz8uSrs2CSr3UeaeVnoFF0sYsjPeectDrbm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdhvEb2cs6U6T1dUYj0gONLbo5UvCMfAXThcyzzv8sL+MuQSe5F74tGFMea3hyA4zdsTw45puqYIQBvEEpXU5xr+DZsLxjFAh1oH5G0W+snpPvoqAWMuqzGtygJTOXHypoFULnoczUfAspPmzz+5et+AVM+v3kGLl+UfDlrykQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kALLZ06U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kALLZ06U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED8C11F000E9;
	Mon,  3 Aug 2026 09:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785749701;
	bh=eDfo9eKyzT0l+RmH5CjS8vrTJvuTqzIw9lkamyHG674=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kALLZ06UVNda9t0bDcd6uyMs7lEZh8yy04oW5oYTXAi/jJXliuy8VPkQf3sTPe2I5
	 KTBNJ/ffKMafuE938wVcQlPB8c/rylf5I4MVy519VsajqFxLS75Cj9ySe1pYGOXyYA
	 TErg+o08hB13kA7aF+srogvZIxD4UIG+GHt1vm8EeKyRbO2TTudacRdj1eRUOyCuZg
	 9xVzYAMXBawN8qynz57qsLff4Hmk7YK30nfm0ISaH7KewEzewg4BJpoX/eE1q6S9vl
	 FoYK1zHxgWRw+tvKjwaTvLhLiLBurmt+PJbK3yFD6glUCEZT9Njip2hghUMxpbODcL
	 +GSM4qrzoPITw==
Date: Mon, 3 Aug 2026 11:34:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add MangoPi M28K
Message-ID: <20260803-fractal-sly-earthworm-2fe241@quoll>
References: <20260801080018.3220034-1-amadeus@jmu.edu.cn>
 <20260801080018.3220034-2-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260801080018.3220034-2-amadeus@jmu.edu.cn>

On Sat, Aug 01, 2026 at 04:00:17PM +0800, Chukun Pan wrote:
> The MangoPi M28K is a dual-gigabit SBC developed by Widora based
> on the RK3528 SoC. Add devicetree binding documentation for it.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

How did you resolve my comments from v1? You split patches instead of
squashing and removed any explanation I asked for.

Best regards,
Krzysztof

