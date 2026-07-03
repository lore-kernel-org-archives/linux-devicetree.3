Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCEB261B8A;
	Fri,  3 Jul 2026 06:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783060855; cv=none; b=FaSKBFbfD66f3Clu2hc+LzA0AyDVWixFRltyX4q2SecP3kvH8gizlFMHnYue6swT0eVLtHVQdW/Cu6l08bJ88ZtWLNYEW2ErPf5ZFigAGH5Lxgu/dYJtvTEA4qoPPrEDKSDNuiZ2CyK7c3EhUUQugv+J5Hj9o/85PUqwsO9QLao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783060855; c=relaxed/simple;
	bh=TIqzdA7a2xvhZh1ZKXpTzCCagVZnj6YidoND4Ba1q60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ExbuN1Jm6B6ewdJU3CSksGoUNGKmo26Ows6zyvP3iIk/lXMr4lcrgxM5el7jXBnFQIEEZdMA2vqbxEgFUkXrjE4SVoZWrLA2mmX/mcLW9VKgwU6HGkz5yzi0gnlz/SlXWEmuLJgCkgf6xGWKLRVdpU3hrWgM0vT75jiyX4tte9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1idrGgm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1idrGgm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 329CB1F000E9;
	Fri,  3 Jul 2026 06:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783060854;
	bh=RE/Kuucppmu6ZKHFdvsbExbpc1QcN98NPkF1GrMK0D4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T1idrGgm58wjTAIKrIcbREvT3NBa4YEVKUiYT8tQSwQRZci6ffg192RdY42Zww9XH
	 DjtauAZrR2VlAgDP1CVDDR9GEE+vsWvvj8CA0OezQrQBKkbX8Qxp1N4scsvRGxoA3M
	 tDnSSZvdN4f9M90iJvx84Y41tMm68+V51qzJNqA/W8iqmS/i+O6odNtMHcmnRoWDcH
	 x6Xu6Dv76oSNatqdl4UHmXC5qpL+9XjkaiX7cu0Fy4Z2hIY7/yq02YPq1kU5Uy/5xU
	 KsT2jC3W3wzR4g2c6qXCWgLXaodza45xTK2JY+TG3RPc7z6v5IjFek2YRxyK//vUGp
	 fHHqQbpSzEXSg==
Date: Fri, 3 Jul 2026 08:40:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mailbox: qcom: Add IPQ5210 APCS
 compatible
Message-ID: <20260703-unbreakable-awesome-quail-ecfcac@quoll>
References: <20260701-mailbox-v2-1-5e6ebc874e4e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260701-mailbox-v2-1-5e6ebc874e4e@oss.qualcomm.com>

On Wed, Jul 01, 2026 at 01:35:14PM +0530, Varadarajan Narayanan wrote:
> Add the APCS mailbox compatible for the IPQ5210 SoC. It uses the IPQ6018
> APCS mailbox compatible as a fallback, so document the valid compatible
> string combination in the binding.
> 
> Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

