Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96973386425;
	Thu, 30 Jul 2026 07:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785395176; cv=none; b=FLXARfV9licMze91YaKCSHoPZI0J8EJniu1mGuQ+2YD7eV8b3exnw6ufP5nGHbYIejcFmrLg194fhBWSIc0Y3JYbICmqaUq0sqQm5PzObglcuHHAY4NI0Xy/ASsEcOvaf3rNk2PoSw/ycmWmoutFF9ubeAvq/G0xLR5hjp9YNnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785395176; c=relaxed/simple;
	bh=1/LJLBMa52xIklA0bVlgj9j3gGxT98c7XDHEXVMGDYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fPk6dr0wBABa/wcCtj/YWuh4Cw72YQ+Nuxb+59NvR7yn77/89/QCoKLfxdOXG4OhqjP1/UkStKBC390V4N/yFfljxYW87pRBW0ieRIGBzzLEkEwW/LauJh8QhdcdpC6US8QA0umjx9o3uWMz+oEXXtAMOhg1VH0VfV5QQXtRtcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7zwg3YV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7zwg3YV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C391F000E9;
	Thu, 30 Jul 2026 07:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785395175;
	bh=Zix8LjF5UhuiY4ZYBd5W4c2txY75qw5wnv/OZ7u41fQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c7zwg3YVWW30jGL8GIhjHPJDcsQPZwsgPFLSIKBGXMNbwZuGEuJ2q1po3UpKDAPb4
	 ot8iBuF2EaoD0ND65kgNplGNkFMKcKRulQfdV7qvusUW4ll2Z5gpu0Ysj/5rj1TqVa
	 5NPrDOw1bPbGCdJBF3JrjX+96OpTkczQ4g2aBVwP10wJU00EPHqvP6NY8duPffbpIL
	 UD29pkmwzyi+pU6VVm57OqDioBGzWgBMQajh0s44wecetiTY/iUdH8Ovf++yLFAE7o
	 +0uTUQ850yhUtz27cWm9qLI09SriqWpr4SaOBJS6TCqvab5FRn/dxCwPgnJbnX1bZF
	 Dhv9hVw+Ot0oQ==
Date: Thu, 30 Jul 2026 09:06:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com, 
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, Mika Westerberg <westeri@kernel.org>, 
	Sven Peter <sven@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: qcom,qmp-usb3-dp: Extend X1E
 description for USB4
Message-ID: <20260730-logical-bustard-of-infinity-af2fff@quoll>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
 <20260728-topic-usb4phy-v2-1-5d9dd5149ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-topic-usb4phy-v2-1-5d9dd5149ec7@oss.qualcomm.com>

On Tue, Jul 28, 2026 at 12:10:12PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some instances of the QMP combo PHY (called USB43DP) feature a third
> functional sub-block, responsible for USB4/Thunderbolt 3 communication.
> 
> Compared to the today's state of the binding, one more clock (P2RR2P -
> PHY-to-Router, Router-to-PHY) needs to be enabled for the PHY to be
> able to switch to USB4 mode. Allow that for X1E.
> 
> Also, add a bindings define to let consumers access it.
> 
> Assisted-by: Claude Code:Sonnet 5

This has checkpatch warnings.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

