Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B30F3B42C7;
	Wed,  1 Jul 2026 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889628; cv=none; b=ERHuvM0o6y4TUoH6lmT0U49lFIn+8hJUWH4lv6BrTpAQTR70ctjoZroaTGbRF0Tw7EcuUNu8PAqWfV8cT2Jhl/+6YBXV+1D8S+NwgUixbpLSGnq3rPWCPA19jgqh57D4c6HY73yMZA6+3FlKsOCtK84twsFwyQZdq7lxn09XFeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889628; c=relaxed/simple;
	bh=KRQoGY8+aJrSioL1g7vIgFhzaE+vfRg4vZReWkGvOXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyCGSp+SHhKoXEurrxqI/Z+4XK9EwxGv3Un+tmEqY0ngigYdlld0CZNwvTQ16RAqDIjPlfAlzzDuQWlmp3NMpldfl0IIB80ewdHJfw+ZaDWRRxk1Rn++hcG9qTmZru+y9fcU1ApDZj4AQTMjPI8tIopwzanF4+LaD1v4DVT/asw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuOkEZJ5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuOkEZJ5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346CA1F000E9;
	Wed,  1 Jul 2026 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889627;
	bh=R9rGDcSq067221QCN99w9QSFJcWyHWa6jMw8d0od3e4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TuOkEZJ5C9xO1JPYnvSJY7ZTyznvCrjAV1j4SsHttiRWbPIySz7mOONco5crA1kGH
	 3hrdci7+IHLT3QfzsDqa8BRpYNKbTpwyTyWhxAzFlNV3nCV66HvU4+mJT8hU7DSDIG
	 +OMD85eqhDrrW9et2Vo3TXeEuBQU02paEpv+HUqh1EafYirsPLmFATfQ4+HcTVDwof
	 nj0wvt6peB1GklPWUwVJxLQj+a9VUr8p5gLYYokAVCt3Gv9JdLffpDVJGc/6erSovB
	 rxR6nbn+O5QHHhGgk4ke8nrjblUDD4EvTgqSRYrQILbbFXWU71yjLQ1gRHnMMkuzpI
	 B31G0aQH0xmmg==
Date: Wed, 1 Jul 2026 09:07:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>, 
	Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: rockchip: Add Graperain G3568
 series
Message-ID: <20260701-reliable-dodo-of-tolerance-63cc8e@quoll>
References: <20260630153810.3574714-2-coiaprant@gmail.com>
 <20260630153810.3574714-6-coiaprant@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630153810.3574714-6-coiaprant@gmail.com>

On Tue, Jun 30, 2026 at 11:38:11PM +0800, Coia Prant wrote:
> Document Graperain G3568 v2
>  which is a development board based on RK3568 SoC.

Broken wrapping.

Best regards,
Krzysztof

