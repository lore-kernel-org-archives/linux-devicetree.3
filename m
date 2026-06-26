Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A45C344D92;
	Fri, 26 Jun 2026 10:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782469181; cv=none; b=Nwlhjmmpas8qF1P21n3C/VqyajPNO8oJGXJ2+Rot6xR5tOO+RFYUK/qA7iSR7J7KSj0H+mKJkJVIeQvgSln4fL+UmjoLFYplfKpf7G/WBC1QOmQQrY1e1A9SglVggLkgT/cuTTkWp9WpSSSaDLq/YnOBPEjJc6aZ7SXK6AE2N+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782469181; c=relaxed/simple;
	bh=Jbk3HWrGGpdUjoH1UM0aydC5i2DOaANuHsjOX2kLW2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYufnniW6cLqctf1A5hGicsmNX5Ln31bKL+tQNWjT1Mi+85LpeVxrnXLbXIcJr7TzAqwRUGVc/oTBuD40I0EDY6/6NfKhzt1TEaLXIphpoDMK0THufV1v+Jtd0UxUgMoVFHdn/JUlk0HfVpodkaOapYSYhrCHuMcvA7ecVTkQJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mRDkviyq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mRDkviyq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8881A1F000E9;
	Fri, 26 Jun 2026 10:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782469179;
	bh=F3BjGiEAkth6q6Fx2GBn/GSj1++9jJaZj/fjW/HdRMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mRDkviyq4yn7NjXe0RjnMQvLo0EwuDzu2v6DgIL9bAtjQIQ0o0Yt2UvmM+pn7kogf
	 /YC1KQ9cWeX7VJ3VDz1KlMHpX01RKZE45AW4t9yq/sfuQkEdGFrI/OpE2BMsfRMR4p
	 C4IHaK1LhldZk7lOvEE0/LdysTYqCfCspAweKunX7P05g7kHvgDkekJcVo6+LH3qex
	 YcuQPGVn9lZAn6sOGyI5IoaMLj3M02h+vC9PF9xalIHUQwsiGmzwrXbeeugNOt3jfB
	 pTzIkIxzMMt4E2ZlsD4qS1CNDHk1uOEkZQtVqXQuHU/9xEiDKnfW4T9woWi5WOCNBi
	 KYnwGUQ04eCMw==
Date: Fri, 26 Jun 2026 12:19:36 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: cy_huang@richtek.com
Cc: Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Yoon Dong Min <dm.youn@telechips.com>, edward_kim@richtek.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] regulator: dt-bindings: rtq2208: Label
 mtp-sel-high property as deprecated
Message-ID: <20260626-zebu-of-uncanny-serendipity-a9fc85@quoll>
References: <cover.1782444299.git.cy_huang@richtek.com>
 <594ebe167b33ca885c040984624e4b5d1382c0e2.1782444299.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <594ebe167b33ca885c040984624e4b5d1382c0e2.1782444299.git.cy_huang@richtek.com>

On Fri, Jun 26, 2026 at 11:38:52AM +0800, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Since it can be identified by hardware register, label the unnecessary
> property 'richtek,mtp-sel-high' as deprecated.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

