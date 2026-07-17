Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD8C382F1F;
	Fri, 17 Jul 2026 09:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279325; cv=none; b=udqHxQjBZgHvFN4c08EPcPrFEw9LmwGeLPI6tPtWHMfh1U59KOBidNvF7ez9LKt+AqlHR0nbVy/do2M1dFv+bt1+YjkZPwLdUTk3samIqzwanpJ0n8Aa9BfXANw7a34TwMTlQLxpYDPpBaxJ4meJ3DkZiNB8ajoVnY2SwIAYXv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279325; c=relaxed/simple;
	bh=GDWRXrZEknRkuvCqP6RLWC28QBZDKqdzMSDQ1PtIVRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fn6a34QPYeV3ZHzINmSnuX3+XMEGCQpaE+88IV3odDeFyfLcvS0uc6i2nqsBb5aa+uoGsaYOXRNjvzd5dm9sw7/LDS8Q4epOVKTkQctdt863p6LFzFtrYZETbHm/X7Gr+9xSVsKEhw8b/eHSMekBKekzeYpkgiLvRwVZUZQAgO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgNOYqeX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgNOYqeX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE8F1F000E9;
	Fri, 17 Jul 2026 09:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279316;
	bh=k+FHj5qRGfDWAK/ise/mUZ9KdtU3ALPXsehLKlWvtc4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MgNOYqeXf60WzTNbLayt0BexSXJ/JIhPIhol2kwXVZE5AzG29edYO68juEXE72gIq
	 Xvp99sNAFUqlSrD36xVJ4inDvH0Oy9Cw+ZQ/UHm3dc0f/rfR631Q4NboQ/1bJ4vtjm
	 8zGnBrHThYrX7K92Y0LG70RQfu4N2u4BW+CZz0aIiL+Ta3EeLcYxBNeRuHuQ9edte7
	 SMQyVGmVr9mGHmeeFBnStWzmvzLuPF5l8epyJHuAPHDD9AB3oofiYZzVTY+Gw+EuxO
	 Z4sqXDr0GqxY10U2oWeh6LdIXV1+v2drwb6M3OPWpJjpKjNDpCwsyiUgs3Jl29v9Fb
	 sqEPc13klVrBg==
Date: Fri, 17 Jul 2026 11:08:32 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Victor Krawiec <victor.krawiec@arturia.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] regulator: dt-bindings: Add Silergy SYR82X allowed
 modes
Message-ID: <20260717-nostalgic-raptor-of-sunshine-1aba9a@quoll>
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
 <20260715155141.128601-2-victor.krawiec@arturia.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260715155141.128601-2-victor.krawiec@arturia.com>

On Wed, Jul 15, 2026 at 05:51:38PM +0200, Victor Krawiec wrote:
> Make the PWM mode configurable from devicetree. Some boards require forced
> PWM mode to keep the supply ripple within acceptable limits under light
> load conditions
> 
> Indexes are starting from 1 to keep backward compatibility with existing
> device trees
> 
> Signed-off-by: Victor Krawiec <victor.krawiec@arturia.com>
> ---
>  .../dt-bindings/regulator/silergy,syr82x.h    | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 include/dt-bindings/regulator/silergy,syr82x.h
>

This header should be mentioned in the binding in property description.

> diff --git a/include/dt-bindings/regulator/silergy,syr82x.h b/include/dt-bindings/regulator/silergy,syr82x.h
> new file mode 100644
> index 000000000000..6d4aa86bb5c1
> --- /dev/null
> +++ b/include/dt-bindings/regulator/silergy,syr82x.h

Some confusing name. How is your binding file called? This must be the
same.

Best regards,
Krzysztof

