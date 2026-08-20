Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [71.19.156.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F3730EF63;
	Thu, 20 Aug 2026 06:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.19.156.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208991; cv=none; b=ub2lKoSRpgUMKRkn/7LWLqJQ7YI04QsH2f0ufRr792znMchJdNk+vP36wzl7HwAlhqplb5UVkdCUr24LIyQ6MD0lDlQGTOozTqGF7EYB23semiyEf7SaoMqdkJS/zYLrp+HB/ky0NQ0t6bxpGkXgbV5ZndNsu6hgGnmXFab41EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208991; c=relaxed/simple;
	bh=I74YV/Xs1pfjL3V9TczIEk6MvDZlUesCUofNYEE2VhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pqNu3zYobrDLjXOjU6rGYp0lY7pOHcw9RHdp9kv3TvimqLMuBiu7o8zETsZb9xKDMTNxjOvw95phEVK8a/O+1zotbLVrwSCqCFF1vBbpz3+bGaSTqnIRkGkpBtJ6I2ap8kOEkBoA4HEC3jWsQHuO1tS9Kodfu8NpbQd/mvAlt9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net; spf=pass smtp.mailfrom=bewilderbeest.net; dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b=HPqWC3k/; arc=none smtp.client-ip=71.19.156.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bewilderbeest.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bewilderbeest.net header.i=@bewilderbeest.net header.b="HPqWC3k/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
	s=thorn; t=1787208981;
	bh=I74YV/Xs1pfjL3V9TczIEk6MvDZlUesCUofNYEE2VhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HPqWC3k/NUJ4eKfZGmfOlQIUzNo1DZ3fzyENBJpQpVyh0bFNQPUqY9nqiazcyQohs
	 u+b9hnzxRuDqXlLUrUBI0XYImuAFtjNhBO+QBI0xJkjx/XVO/MFsfFV+hpCbdfUohg
	 Uh5yQ3TTQV0pZz4bMIZh87dIqB/4y/1qN0T1/qaE=
Received: from hatter.bewilderbeest.net (unknown [IPv6:2602:61:71d1:5c00::171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: zev)
	by thorn.bewilderbeest.net (Postfix) with ESMTPSA id 78B814C;
	Wed, 19 Aug 2026 23:56:21 -0700 (PDT)
Date: Wed, 19 Aug 2026 23:56:20 -0700
From: Zev Weiss <zev@bewilderbeest.net>
To: Tan Siewert <tan@siewert.io>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] ARM: dts: aspeed: ASRock Rack X470D4U BMC support
Message-ID: <34c111a5-657f-46e2-b963-9876e123f43e@hatter.bewilderbeest.net>
References: <20260816-ts-x470d4u-v4-0-cd08e78287ec@siewert.io>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260816-ts-x470d4u-v4-0-cd08e78287ec@siewert.io>

On Sun, Aug 16, 2026 at 04:05:48AM PDT, Tan Siewert wrote:
>This series adds support for the BMC of the ASRock Rack X470D4U mainboard,
>which uses an ASPEED AST2500.
>
>The mainboard exists in three known flavors, the "normal" X470D4U, the
>X470D4U2-2T (with 2x10G RJ45) and the X470D4U2/1N1 (an ODM version with
>2x1G RJ45 that is now available in retail). The 1N1 version also has a 64MB
>BMC SPI by default, but they are all swappable.
>
>There are two device trees, one that has all the config and uses a 32MB
>flash layout, and another one called "data64" (similar to facebook-fuji)
>that uses the 64MB flash layout.
>
>Please note that this board has been fully reverse-engineered.
>
>Thanks,
>Tan
>
>Signed-off-by: Tan Siewert <tan@siewert.io>

Reviewed-by: Zev Weiss <zev@bewilderbeest.net>


Zev

