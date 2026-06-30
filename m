Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C29326B742;
	Tue, 30 Jun 2026 07:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803628; cv=none; b=hKaYV6xampWi5S3lJSFduNhmBbQPi0i5hkxPwwyg0DnBzuR2i2IJ1S7wtD6NyebZ3Z4E+onp3QAV9tIXhmD/xQ7yXY6pNhtGWUwfBn4AHoGpDnzG+SGzwAZGBoREwL/LecbjUXar0i+PFhNamRixkv5Cu3qDY3Kh/NpPnz/DE1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803628; c=relaxed/simple;
	bh=5L+93k4CI+wsF1KrW3IeqHHfe14kZlrwX/NeaQ8biuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=isUTRSBLWitrYhMDcDg7ya6PDy4MxtcXt9YKWVG9P1Qa8BK23Fr2Y1VoceZfJzRvK07t1g00wTlDAvzgnNsrY+WZe2MU8fmWot6oib3pMqTd/ZEy/GtA1BEo2zN/fpAqWQ2Tk2fEzzRPuvk4iS2jf9sIse29/2iMoLZnOzIA/hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LyG9iyet; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LyG9iyet"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721BE1F000E9;
	Tue, 30 Jun 2026 07:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782803626;
	bh=ucBlxQFMsejfE2o4ZdvA+J+aAJrQ+6Hbq8ALAxCJTVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LyG9iyetR45SLIO1J3tit6Xvj2PWjMvaiDer3d6vYqoJRf2LpvEWJpl4GXDZNF9Fa
	 lRrADW0nVSkH3ZKshWkIGiR46CDol2yIeCPm2+x3I2LZEzb5MFHWUyyj71FlzHoSYW
	 6GcPhgTJigzvrzXtkXq6rMhzu4QzjNcsyA8pFxNkmjnzoHL1s1N6AK9wIMtq8SaBTd
	 a9lytv9jd7ETJzN7kBUw1My9F2h+XEuXlEymhZ208fLOA0QD9nmV/8Jt3xai2uASd5
	 zhc0u7scwPjzMWfjAUXWz+v5jAq+FnMudk7JKE5l7ImJ4oKvmlTLdqntMEHfJ9hB0q
	 7Tql/G1Hy2eRA==
Date: Tue, 30 Jun 2026 09:13:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gokul Praveen <g-praveen@ti.com>
Cc: vigneshr@ti.com, kristo@kernel.org, conor+dt@kernel.org, 
	c-vankar@ti.com, s-vadapalli@ti.com, krzk+dt@kernel.org, davem@davemloft.net, 
	andrew+netdev@lunn.ch, pabeni@redhat.com, kuba@kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: ti: Add PLL1 refclk to J784S4 SoC
 SERDES node
Message-ID: <20260630-masked-slug-of-judgment-732aad@quoll>
References: <20260629102308.56616-1-g-praveen@ti.com>
 <20260629102308.56616-2-g-praveen@ti.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629102308.56616-2-g-praveen@ti.com>

On Mon, Jun 29, 2026 at 03:53:06PM +0530, Gokul Praveen wrote:
> Add PLL1 refclk to "clocks" and "clock-names" parameter of SERDES2 node
> as "assigned clocks" parameter has PLL1 and serdes multilink configuration
> fails without PLL1.
> 
> Signed-off-by: Gokul Praveen <g-praveen@ti.com>
> ---

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

