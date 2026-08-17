Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911BA2F8E9E;
	Mon, 17 Aug 2026 07:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786951026; cv=none; b=gYQgo5CZ5Cr+lPWme7EQOawYAzd638pUfNXl4ykLr6gS4+Wdn4mIdCvfcXbExcQXECqXKehrqiDbQ0H1pGATmmqaHAq1cxm9CyfRPCXC2Kk6Mz/wvXYEpWeWn4osmn7IG5DR6INri/K/TuQ4GuYUod7CN3rNQYbkgqXEkEtFG7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786951026; c=relaxed/simple;
	bh=nP+IKbE8ADaaxIAZ9M3+vMTaX8zxkTFaI9UHKUWzbOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8pq27LqVnsaiVrXxqi6+PqCneI52pVc7JjqudmNZzov6Vv/VUjoPWPIyTLbYxbqFERd3BpTgQqF6dVGMQQ64fh97utRd1jVAJLdArzaa5HB6Up5SkYaYac+HVMz8ZpkOY+vx4yC+gUnGH+OLwj8qSPlrKfttPg1i2SPZrhY3Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dcPIl2uh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dcPIl2uh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E6B1F000E9;
	Mon, 17 Aug 2026 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786951025;
	bh=nHaiYM/y/snjrD+pBdi2eiWOhp1MMx3lZzj8PlHwRPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dcPIl2uhgtsnkT79J9hFbkIy7Mwr63n7Und+fNsaJpQpPcO/OnUn/GA64X6FzwknS
	 r0TubGF/Wi7V1cB/Q7S0glps0hlBdTd08JwkZ3tLgZ7LQuMbqf+IP5Xh92wfROU3Xc
	 cKTOxuuT7MEns7rO3QJ1H0xtOQJjoq/H5QFZb9v91YqX7q8xVUvHX7IQDD6s9UkzHs
	 2kMzCcR2EfN/sJQXl4shY/+mMRbt7IfpDsm2e23eJzOaadhzzgzK5OnGP/LjsdDZl7
	 hGaOUkxr5o4tyeirOAeBw++yZc7k/E7d2uNeejBlaHCuHIjm5nmP8C+lMKEzjEu2dx
	 pHHxhlLvbxHmQ==
Date: Mon, 17 Aug 2026 09:16:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Che Hsieh <yc_hsieh@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Chia-Wei Wang <chiawei_wang@aspeedtech.com>, Corey Minyard <corey@minyard.net>, 
	Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, jammy_huang@aspeedtech.com
Subject: Re: [PATCH v2 2/2] ipmi: kcs_bmc_aspeed: Support multiple LPC
 controller instances
Message-ID: <20260817-hissing-beaver-of-potency-994d0f@quoll>
References: <20260813-upstream_kcs_multiple_lpc-v2-0-775b1db3fe95@aspeedtech.com>
 <20260813-upstream_kcs_multiple_lpc-v2-2-775b1db3fe95@aspeedtech.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260813-upstream_kcs_multiple_lpc-v2-2-775b1db3fe95@aspeedtech.com>

On Thu, Aug 13, 2026 at 02:42:32PM +0800, Yu-Che Hsieh wrote:
> @@ -526,6 +528,17 @@ static int aspeed_kcs_of_get_channel(struct platform_device *pdev)
>  	return -EINVAL;
>  }
>  
> +static int aspeed_kcs_of_get_bank(struct device_node *lpc_np)
> +{
> +	int id;
> +
> +	id = of_alias_get_id(lpc_np, "lpc");

NAK

You do not get custom aliases.

Best regards,
Krzysztof

