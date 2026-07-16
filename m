Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2243D5C32;
	Thu, 16 Jul 2026 08:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784190214; cv=none; b=MY6WJRoxH6bGMHK7a9goSP5EuMKummj67FdVDP9tZPaM7qNBTLqBK+w6gby1EW6CvpEKXgfkropyEgyP5K13kvW8xGUmK482Dwgx0AVNn/Yqa8wkhb3VTlQrHu0kb77HFYFjIJ/LwLD461h9QtHOdye3Dn9BzIwrfEqQbzoUwjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784190214; c=relaxed/simple;
	bh=FXkqGEB/ilG5MnDK2KOwp03ueU6t0bA81MBjQrpyHEY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBtHRfAaGWuJHMyTdzS4++PPrFtQEB0a58IxJ2yUpYs+VuebF/qkvllP3ogRtylHQ33h/eVSEdd1AA6UZiCgbPCGyVEYWNGwjL1Isxy8SHjTJDSormeZX5D0Ft/avZPp5Gbc/qpcImn9bCOG/g2rf9aPtBacfc13TYwl2bAZ+Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjIszk9J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjIszk9J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F951F00A3A;
	Thu, 16 Jul 2026 08:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784190213;
	bh=/7m1JvgzycF3NQ54KraqW0bwlWnQ5KN6rAOdQ8da+hQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BjIszk9JG7cVRGkGeiuy1S+WXOYDRLa0yXFw7uuyGX5HpXIWIj2/k+OUWv73J75Tv
	 maPuTuEBqVPMe7HQtAOKsZkFyuvPZonhrj+lfwOnop9BFxYu/E2zVuDlV9ZsqCL/vR
	 wqZxiZIuVEaILWMgPEy80nUHrThZr18VFuMzi69rELEGmTfFUeL9IUNr5Yy74Mn2r8
	 AmA+7C4Xbhb/m6HYCAWPRd9PVwC8TeAMsQOVZ2Q/Yj9Pdj4YaQXIXvfJp2/jsYNFLp
	 wuvapJnfhuEGnRbuKbDn+Y3W7OwmP62w/USTSlZX/m3ac/RNcq+IreBc0cYBXQw3qT
	 NvfWx2nusXqhQ==
Date: Thu, 16 Jul 2026 10:23:30 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiaxing Hu <huhuvmb88@gmail.com>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
Message-ID: <20260716-artificial-spry-tanuki-1d969e@quoll>
References: <20260716012838.2353939-1-huhuvmb88@gmail.com>
 <20260716012838.2353939-2-huhuvmb88@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716012838.2353939-2-huhuvmb88@gmail.com>

On Thu, Jul 16, 2026 at 01:28:37PM +1200, Jiaxing Hu wrote:
> Add compatibles for the ArmSoM CM5, an RK3576 compute module, and its
> CM5-IO carrier board.
> 
> Signed-off-by: Jiaxing Hu <huhuvmb88@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

