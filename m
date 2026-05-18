Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFF43EFFCB
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 11:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779102286; cv=none; b=ro2zO1z9kkEhE0TjY0G5GF2Twp+huhMsE92WvRmFMXvN2XJjMhc8QLRMJxIPhw2boVPeDZHL5/3UtbinhX1rWdCunWvmDTFx4VGPTeL5VbRiF7JELT+YPFvwyadVL2v5XhcFWzh70lc4Hm9UB0mj99SfqGQZgMvNNF0FWO2FUAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779102286; c=relaxed/simple;
	bh=lSgAgfsm+ifdU5GgoJvsBiZptAzOBTrHgO6WCViTs/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/ElXlQeWVKcs7TpwtmIkXXHP0nogOe19PBeWIO8Kr5ul7IOTkseuFjC95H4n8KMpZH4inEMarNKb2fzPg4JfU2lkB4FkCSH1A4ou0BYhu3HMzbgo9f+I3u7sOXMouvCFO1mQHUFeZYvHlXlibt4EHIum/cuOvb0eAYD8KKgzYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o15OkzeX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o15OkzeX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C2DC2BCB7;
	Mon, 18 May 2026 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779102285;
	bh=lSgAgfsm+ifdU5GgoJvsBiZptAzOBTrHgO6WCViTs/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o15OkzeXAMQyrt7tiEPJ65DlvmbL8phtOJn9IPU5pL+uOlFp32TPiANe7dMjcDY3C
	 X8OT8/6vDQ2B4s1pquHUUebOgqeQZFHxu7XmP4/CmfRTDMGSI5v+U5sw2FoOgZ1AZl
	 Wb96/DXLgdS5lXpF28Vyx/AQWraU+lF+qWrg41yLBsokeorerGal0MBVKW7Ks788Lg
	 29oQXGKGu4h5FMqSVw33S9v7JMppMK8hjaakI+IQRHEb+L5/UMu7B1xjGFVv+U/sUs
	 +2wj5tHa8qs7CNQzt4Qn8IKoobsm5yERVVMUnObUuGCf4h3nPbigTV0kMMn07pomlX
	 WHUR5zHOqFUaw==
Date: Mon, 18 May 2026 13:04:42 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	xsf@rock-chips.com, sre@kernel.org, simona@ffwll.ch, airlied@gmail.com, 
	tzimmermann@suse.de, mripard@kernel.org, maarten.lankhorst@linux.intel.com, 
	jesszhan0024@gmail.com, neil.armstrong@linaro.org, heiko@sntech.de, conor+dt@kernel.org, 
	krzk+dt@kernel.org, robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V2 3/6] dt-bindings: display: panel: document Anbernic
 TD4310 panel
Message-ID: <20260518-fat-bouncy-capybara-f1be7c@quoll>
References: <20260515221947.299229-1-macroalpha82@gmail.com>
 <20260515221947.299229-4-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515221947.299229-4-macroalpha82@gmail.com>

On Fri, May 15, 2026 at 05:19:44PM -0500, Chris Morgan wrote:
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: anbernic,panel-vita-pro

You should have fallback compatible for the IC, at least that is the
review I was consistently giving to others recently. Apologies if
someone gave you opposite comment...

> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Panel power supply
> +
> +required:
> +  - compatible
> +  - port
> +  - reg
> +  - reset-gpios
> +  - vdd-supply

I guess this could go to panel-simple (after using power-supply instead
of vdd), but it's fine as well.

> +
> +unevaluatedProperties: false

Best regards,
Krzysztof

