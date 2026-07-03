Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77302357CF3;
	Fri,  3 Jul 2026 09:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072353; cv=none; b=Xwx+MUuSx3pAyqG/HpUDCM4NwU3pVS/K55HixhRJhekqNk4fWPtNMbUF/QT8/8HOjW//+hgHa8gWd6NMmFRbF7HRqlXHuA5QqlZ18cxlYkgit7Jg26eITOauDs/gM6yRhJrcw5PfZmIJrkAM6SSj0pdAKuiB5jjM1XpZeJLrs6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072353; c=relaxed/simple;
	bh=In9mHBJL5kcrpADTCBfoelxuVGzVNFiPc0OoZMq5eL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxMt93ucSIRbWpJq0C95YXsHfLiGyBIN2iiEZUvujOKIp0R/c9qrSWRhm8InfELL5UzpGgW72zBadPvqFdF/eb6asXo5AmjpgxqUmSalN7RuVgxiSck8uOmAfAplBkHuaefp8p0bq7hHz+CDQlUJTrII56Jey7Ac/7e2rJuWLqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xcv7NoB9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xcv7NoB9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E3F1F000E9;
	Fri,  3 Jul 2026 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783072352;
	bh=GKEsNOedviw9g/4cQlmclfv8VVYF3FHxpuZoJOIlKeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xcv7NoB9dWDICdJH7Zmx1qdxndTSrCEdI5rFcOUWYAeyLCTvqi7Bh2XZLgBb7VAqs
	 loylffvgv5wbLH/csdbg/lZ2dLeOWGi1MnY/p6y6PEuboKaEifao0IaXfkpE36seh4
	 4l/CkYblQwGC6PyXsvXHVqn0rnYWIsgnbDQ0UZYwxKqP9CsQQMBs5bDG+WXMF6rVrx
	 S6hcecZD8fgXaBOy/ahwWrorBeYT8SwOA+svrqIwlUE01VSIqPwaDyPQWjZtIxw2Iz
	 qVEgZbXZ9WaN7UHXq+AeCOS1VJe9jCe/A05VA92F1b7uA5vF0NXNBzSytOzbjMm/yr
	 p+5knsIq9hJkA==
Date: Fri, 3 Jul 2026 11:52:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: aspeed: Add NVIDIA VR-NVL BMC
Message-ID: <20260703-prodigious-coyote-of-culture-11ddcb@quoll>
References: <20260702165524.2168091-1-jackyhuang@nvidia.com>
 <20260702165524.2168091-2-jackyhuang@nvidia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702165524.2168091-2-jackyhuang@nvidia.com>

On Fri, Jul 03, 2026 at 01:55:23AM +0900, Jacky Huang wrote:
> Add NVIDIA's VR-NVL BMC board compatible.
> 
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

