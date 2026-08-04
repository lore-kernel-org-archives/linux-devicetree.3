Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3603D34B3;
	Tue,  4 Aug 2026 08:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785830949; cv=none; b=JdqdwPRKEcZFhtRmhLo3/1wIH7eIpbIdABWGGugU+RcimFfeigPJmMlWOEGMQTsNUWVz2ASyw5dG//+j2W7qM7E/RS2AvelWYnP7aN+UpBQRdJBqgzHCxjO5nVOq9tgPVO04iIDBcOpfSvyJM+kaXm3ExJwwDYBuFeIfuQUHCn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785830949; c=relaxed/simple;
	bh=Pr1zkjtmGVeYMCzOD9OuEqHxVGED9g30BEXyrhuHQKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tl84bCrCj1D2pqWOdZu0cZG3bko2QtkvT9mlMCZjD7Bw/MwrY3O4KMcMPviMsPHsa+cUjN/6vcrhxmsuFrzT2c24b2r1lfzjQu19IcXroREACkhbgm+WrK00DFZcu8yzENhJFtfxOnzdHksRwEL45nx81PX6mjebsBOupAfLlAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T3vD6cnz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T3vD6cnz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F761F00A3A;
	Tue,  4 Aug 2026 08:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785830948;
	bh=W7AAQbposZIKDJtq5ddWLtSA1Emr6N+cxGRFQALOZWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T3vD6cnzbm+FCl5WjX6S8NsHl2BU45cQp88pj3+KQVatvOkAq9SGmL7XxdvDFtD5h
	 5ei2SKQ5nn7gUYLV6yybA0+ehJTuTEmB1Lzx6HYZ6+Tumt9DA6mC/9Jd1G0gIQ7RqW
	 dSWlc+vkxsH06K7kLHItmoW8PD1sf5VteR4HMfapEz7zKePdklS2y44eLQfAzm2yTO
	 q7Qb2fHPCPCgjArjesUtErWe7+MQB7GPE76oOkARCG/BqGq9f8iWdhOuSuJhe2jaKf
	 +A5J0PQ4egcATk4eNLYM/RtKwhw9g8eCmYofOEYDwDPhx4Hjc7VlMmQ4NBDPYVhZnu
	 DmGmJHzQFLc/A==
Date: Tue, 4 Aug 2026 10:09:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add Vicharak Axon Lite
 board
Message-ID: <20260804-pumpkin-termite-of-exercise-a0603a@quoll>
References: <20260730134815.434654-1-hrushirajg23@gmail.com>
 <20260730134815.434654-2-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730134815.434654-2-hrushirajg23@gmail.com>

On Thu, Jul 30, 2026 at 07:18:14PM +0530, Hrushiraj Gandhi wrote:
> Document the compatible string for the Vicharak Axon Lite, an RK3576-based
> single-board computer.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

