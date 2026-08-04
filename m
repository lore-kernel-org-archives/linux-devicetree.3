Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F36841F34B;
	Tue,  4 Aug 2026 06:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785826530; cv=none; b=A9Ouwe40YK03G+QiM6/j06dXJKC2CNgM5a+MkTaoJ6XgHYlVRlM1P3wj4b6dIYa1JKOmYIIZyefq09m7Pp9EZZH6VEOUr8kUmM+2ZURKHxl9zi9KA8mpAwk6J50IWjg+Zi5OQ0ayDamdhjBEWL8kpMFCP3VQuwqwYD0NWQQRe0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785826530; c=relaxed/simple;
	bh=shQ3h5M0Rl7PZYhA2FKDzN+e6Pbz2cJYVtwNF7geqHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Diz4SM2CDq6ilXXe5R9CnKzFLi0zZEsF7NYF59SNgYsnNwAcV6t6HU7DdDOwkZ6Yfoh09f3Q1j48eZ0mlqy4BWNPegyGxvgyQkeJ4USqY/ScKPiLCuE37OAbMtnkSxsVFazTGQ7ufSxiCghalsBqbxJp3wrI+8qG82rsncVroZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oQKrgxrH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oQKrgxrH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F37A1F000E9;
	Tue,  4 Aug 2026 06:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785826529;
	bh=wq1FlBG/lmdz66O0zMM3OsUFUL0A2mg6NpdxD4ZZDek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oQKrgxrHMigV6DuOp2o4WRqi5lpTPCF8jZ/FtoRGBEvWrN2slXQDigfeIvpjCVS0N
	 iFvi44VURJvsuMAN3oMNokVPsVm2QyIy1nZLpFwSRjkky/KmRCu1wac7o/AiUTb3SC
	 ju2kPCQ6C3rnMPy7Q+OPA/kczwol0x94IcIXMk3i2jk1vymkyKKbQQ4Q2yxzJ1RmAP
	 idDDD6NkW0nxCeeZ6fGUL+nP8jQDfOjUwNe2MPFxG9wLxwQauYvMpHkiPBbnD2uole
	 nMeD++ByDvmrvLlOh1YWNzj1ZWfhSLlGq5VOGn2b3kyWnwJihrnEUXdDadtQxs8ri5
	 To0ZUN4+6zt7A==
Date: Tue, 4 Aug 2026 08:55:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, 
	Fabio Estevam <festevam@nabladev.com>, linux-rockchip@lists.infradead.org, 
	Jonas Karlman <jonas@kwiboo.se>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Albert Aribaud <albert.u.boot@aribaud.net>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Conor Dooley <conor+dt@kernel.org>, FUKAUMI Naoki <naoki@radxa.com>, 
	Jeffy Chen <jeffy.chen@rock-chips.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Opdenacker <michael.opdenacker@rootcommit.com>, Rob Herring <robh@kernel.org>, huang lin <hl@rock-chips.com>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/6] dt-bindings: arm: rockchip: Add Luckfox Pico Mini
 B
Message-ID: <20260804-precise-mutant-termite-c0c876@quoll>
References: <20260729133609.3465563-1-sjg@chromium.org>
 <20260729133609.3465563-6-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260729133609.3465563-6-sjg@chromium.org>

On Wed, Jul 29, 2026 at 07:35:52AM -0600, Simon Glass wrote:
> Add the compatible for the Luckfox Pico Mini B, a small board using
> the Rockchip RV1103 with 64MB of in-package DDR2 and a 128MB SPI NAND.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

