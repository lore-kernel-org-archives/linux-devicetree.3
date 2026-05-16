Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752C2346E43;
	Sat, 16 May 2026 09:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778925338; cv=none; b=GNkip928RQInQhrsG1tf0Hup8F429FwRe+5GYlF5LZaK6vcURUDyB9eLH2Qf/OF63mmrOkN+D9Qk7eBSWI4Jz2u1CzXG3kuxbXxwKP6TysY8wZq81PKd0eSjhWAgC2YcbkI1iZ28OqnCERemTH/gCXNGd9awcJl6JS1SS8hOZgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778925338; c=relaxed/simple;
	bh=ThEE449rYWdZBLplfabPorNZfG5RZ359gcGvT8Bg00o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=scQsFgFHWax0wmA3+yyS71ErmG682DJoncuz6wdII4YW32POk0B2TNVP/kLLfHlKkx2cCOnRk8Mbt1/NFcTXqW471tV58oSDS1UtRF6peUDltwj95hjBTk6jZUGpJAfnes5yqENMyY4YZkTchCYKQSNtwFWl25jS/XlIjNgedJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYXZcXY5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYXZcXY5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC50EC19425;
	Sat, 16 May 2026 09:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778925338;
	bh=ThEE449rYWdZBLplfabPorNZfG5RZ359gcGvT8Bg00o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gYXZcXY5PnAZGaRxGz42XDZ4yrXTFKQiNZOOGXyAp7SxfhbN7VV01rKU9/+JGTqNd
	 Msuq9ELpUUBLqwHSMbRj3DzO1Srk3iOPtRxLM1fpDC4gprP+yfssGgaM512dXzXKN4
	 0ma7yuUtvBr6fXMChA9Y7ibyCgs6SOkpg9wK2Mishe3l4m6f5aiaVRU2wxcASioHp/
	 eMWzv4xnlrnetLUIGRf21HAqZCsJpB8IX8vlW9lKLmWj38qyc50fF98uFdvkYwPXw9
	 S+EIN70onmG9iE27+mvybs5w0fZeBJbyHOom5Ym6j+nvYFSN7utEUbEd435Ux2YlDu
	 CovkoOrr4Oq0g==
Date: Sat, 16 May 2026 11:55:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: qfprom: Add ipq5210 & ipq9650
 compatible
Message-ID: <20260516-hungry-ultraviolet-lemur-ea9aea@quoll>
References: <20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-tsens-v1-1-1755b515777e@oss.qualcomm.com>

On Fri, May 15, 2026 at 02:54:34PM +0530, Varadarajan Narayanan wrote:
> Document compatible string for the QFPROM on ipq5210 & ipq9650 platforms.

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

This applies to all your patches, not only to this one.

Best regards,
Krzysztof

