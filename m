Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702DC3B19CF;
	Mon,  8 Jun 2026 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780910958; cv=none; b=eKOqc4qtMBMHssSMi5/JnJ6KsaNv09opRDlJyqF7DWnimYspOvaMLmWg0jjBGBWG2fH/uAYxogOVkl8L9UOajEuVlFr3eeMGluKdUipupEWMNTGBKfz6kAH9sxv8ilQH3m+DDrrUdohBnl3ojrzRZLD4mCBUftQUtztdplgExSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780910958; c=relaxed/simple;
	bh=ZA6JMJo523NT2YgUlq0gebNajMvFIWfCAXYFl9xRnRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXEDTqw5vIk0tyXzq+GOpVzl1pzXnyHOp9DX7TQ47+k490dKmZu3P4td+YByVuHY6hUMwJTnMQChahmlG5UfIzbFlxeA3KBpab6FlMI77OZbdn08FkgiyaJlh2+D4XibNCrC45NXntaFAGAt5FVZ1Kb0t5TdKzWAXckDZchaKwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Af5Tp8iL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Af5Tp8iL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 394A11F00893;
	Mon,  8 Jun 2026 09:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780910957;
	bh=45n2A6qyQl1Jvq/S527jcZdIuZO0U+HcYCRAYqjGBug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Af5Tp8iLuShsxL/rs/yDAjsQxog9in6RrGpw/flyw9wcDoMmJJEp0JSMcXm1MRRD8
	 HthcoC8QkmVQsqTj1Nix5LD8fjEjWLxHci+FyrmT3Dj+DAFy0ibOPJqAa7ckGe/kug
	 Sy+shmKuIxbJ2rGKuM4Q/lW4ZRS2TkcU0p70SyXxlK0UIXdhY7EiIZ/j7gxQj7RDMw
	 ntrY8R0BZcI5S3roVUyCsPTbtGZOvYM+Gy63vOGaD8yAayVKcTgNdSKKP6UJrucEYx
	 3GNArdyh3TdjxbHYAYVm1agYNlbe1XZjnroJmB+JoM9SjlIXTSlQpZVvrXTJ4+XBi5
	 rflrNM41LA+3w==
Date: Mon, 8 Jun 2026 11:29:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: Document Raydium
 RM69220 DDIC
Message-ID: <20260608-strict-flashy-peccary-b2c5da@quoll>
References: <20260605-asteroids-panel-support-v2-0-44b96c6eca91@pm.me>
 <20260605-asteroids-panel-support-v2-1-44b96c6eca91@pm.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260605-asteroids-panel-support-v2-1-44b96c6eca91@pm.me>

On Fri, Jun 05, 2026 at 06:27:28PM +0000, Alexander Koskovich wrote:
> +
> +  dvdd-supply:
> +    description: Digital voltage rail
> +
> +  vci-supply:
> +    description: Analog voltage rail
> +
> +  vddio-supply:
> +    description: I/O voltage rail
> +
> +required:
> +  - compatible
> +  - dvdd-supply
> +  - port
> +  - reg
> +  - reset-gpios

Keep the same order as in properties.

> +  - vci-supply
> +  - vddio-supply

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

