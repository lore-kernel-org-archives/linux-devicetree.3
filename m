Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DDD27A92D;
	Mon,  3 Aug 2026 22:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785797259; cv=none; b=gaaRBQqaJ1s300JWdt9+aG1N9wbSxMMa7jY+gMkAPJQCAhUxORq2DRI9lbtwShZ/5UTUuCC5u1FX8CVuI2WoUjEM/1Fvzizh5uIGf+ceHSdcgQI5yvNzLiz8lYzg/tor3moC8oKSfJAz5vbMLiSzyK1fJI6EBi33YhvwXuK6A9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785797259; c=relaxed/simple;
	bh=fDQYzsGzKED1TvVkqu8tNjtP8CgpC1ekDTeq+eAg7XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lwE7i4lnlsh0NGBEm1FK+K5oULwmJyn3DikNNZycWVMTJNZz9XWNNwtU5bK9bRgVaAAw3chKEHO6foCV+lgnFCoHKg6gC++5J27BB+cd8Qxt1N7cdsEcZ5yXyL+R+woaJvwNn0EaYEmA0yPlFbY3Yp18f8NlUOmmKQBh19dX7H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVrxHUmi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVrxHUmi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1FBC1F000E9;
	Mon,  3 Aug 2026 22:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785797258;
	bh=z0xsVf26D4rjp6NrdABnqivO7F51ApbXczBq4IWR7t4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eVrxHUmiK2Rj/mod7K4hbAi/lIwrwxWfVwz2MxxvXCHo5G/ergr9Lmo41K7/HwMJc
	 EI76M0uJEGu867oNeY5s8WeheeEV9Q86kjgB+5lZ21yBJ9WwcT5BJq3GvYSz9yMGxH
	 p/hJo3ZCe3o7iWp5oNHwi/on7s3ssS0cge/1XYa/eHEud/QGcs3i1a6azI7P0uVlRj
	 HCFG/FmAI4aCKCGAUQVOIErp3qIERpBTNrw6Y8ZriFB86VM5L+B2sFg3bKsvrEs7YL
	 KWYk+l0A+wpqrb1y2LkmGxsDKXz/NcI8wy+I2Ef6ifZxscuA64XJ5d4AhSygYsYKSz
	 umkTCJJclExxw==
Date: Mon, 3 Aug 2026 17:47:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: dt: submitting-patches: Mention expectation about
 dt-check-style
Message-ID: <178579725668.789162.405464743288920430.robh@kernel.org>
References: <20260803091758.232633-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803091758.232633-2-krzysztof.kozlowski@oss.qualcomm.com>


On Mon, 03 Aug 2026 11:17:59 +0200, Krzysztof Kozlowski wrote:
> Any new DTS example in the binding should pass dt-check-style 'strict'
> mode without warnings, although scripts does report some false positives.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/submitting-patches.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 

Applied, thanks!

