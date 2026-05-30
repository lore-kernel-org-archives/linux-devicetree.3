Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F00C1E5201;
	Sat, 30 May 2026 11:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780141175; cv=none; b=XwNNPJcuNEfbFNMTAX3rjXH0Lq5MM5bg7iNykZ7B6z2AMROBVreZlHk46sToA/vjvn/oZ4YYrdykuVa+rMKji2UDJCq0bQHI2W12Hj9Xu9S7LhN9EuruM5qPKWQQe4Q1Vb1z6dMCRSzErGKrGNDqrrmOante0XkzjF+9ZIrti4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780141175; c=relaxed/simple;
	bh=NLGejAO0gT+X0Tk/bo1I2nCHa0yRurAcFZckDPMD/Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=US1a+LmwkmurHlpRzBfG7zgM0TUDE7p9l8RIVBGuQbx1T1E56H/XVh2VEgG7A2zKScCu08LHBUjUhIISGik3Ya3FmrN1leG8APvujVAPCbETWPryeAu2KqAuoDHQNHSfWcP3SVNoFXao3oFHju6VnvurwuHON1TelOcoI7/ibHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KHqC6UlA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KHqC6UlA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B263B1F00893;
	Sat, 30 May 2026 11:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780141174;
	bh=OJCH52YP9rP8RG0j3oZeKH0UGauR2RT4AzqFBNpn10o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KHqC6UlAMU+pNd2HcPpAKDkmbEOolghV3O/WPbhgq/seoqoAxWFYDG+U5HmOo/zQ1
	 GSMUeHwXXKhggzcy1tUoeE5lQB45+TF5IvxmKGxOxiBdnOupvBhRU6Qke0BONGodeK
	 CzfLVUx3JeAxKWdQqZonRd6TEvWcBDdu7fBC/QW6NUdu06mDTI5ieefiEpGWNMfipb
	 nKMabN/mo6qNNI5J4rvLunOiq8vLx5ktQvR+2YqrMFwsR+nv/FyeULPZ5BwAJHsgIi
	 ewBbcdk1TYsE1GMM7psna8NNNvmvyjJwX4tJX1t4bihpLBhrA2IyPKMfXP4gWIgzmM
	 rNAnUemuXITrg==
Date: Sat, 30 May 2026 13:39:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abraham I <kishon@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
	Devarsh Thakkar <devarsht@ti.com>, Swamil Jain <s-jain1@ti.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: soc: ti: ti,j721e-system-controller:
 Add more compatibles
Message-ID: <20260530-rare-spicy-catfish-657b1f@quoll>
References: <20260528-ti-main-conf-v1-0-a54ac5c8d081@ideasonboard.com>
 <20260528-ti-main-conf-v1-5-a54ac5c8d081@ideasonboard.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528-ti-main-conf-v1-5-a54ac5c8d081@ideasonboard.com>

On Thu, May 28, 2026 at 03:53:46PM +0300, Tomi Valkeinen wrote:
> Add the following to the list of accepted compatibles so that we can use
> the same binding on these SoCs too:
> 
> ti,am62-system-controller
> ti,am62a-system-controller
> ti,am62p-system-controller
> ti,j784s4-system-controller

You just copied diff - that's pointless. We can read the diff. Explain
why - what are these? Why there is 62 and 62a? Are these different SoCs?

Your commit must say WHY you are doing this, not what you are doing.

Best regards,
Krzysztof

