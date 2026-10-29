Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267395;
	b=2Hw8B7hKUIbTyjrzjwPG3p9xJbq1iP4h0ekcwZcjoylNbUASl0y2z3U4pzVOU1mKVaQO
	 Mvj6kOEc6YqNM5XFGX649Dj4V0OyNp5pU0YaCnx0mhvP4tNoUEQRBi+E54H8OH8P7YrQY
	 LBzJ6FVjUj7zcH/usbH3jn/SLf8CzqO44Ej0D4OywoKO5xqILp22g103zJBILzoSzlgX4
	 QR9BvNPGN0aTBK09eVfudxgp/0VV/m8cIKgqshFNlEEOboBNEuyKbIrxzTKPWqlw0XjCz
	 bfvGjqnL6KYYcBEuq3KJExGPoImc2sxDGG/loHz/rTdMYiR2+rryVFiCVFvJoSjk9JQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267395;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=f5wVeAcdts4v03FIKJ/JOAEQfcFu0V9y5FXGBERX1Fw=;
	b=SOC3hpSWx+ZAOI2lR0W/UrpqfwWQ3ykiIH4BxMx+x1jqHtgb7nR7Zd6oFJfjJycgZwxh
	 LXhuOu6lsc8pVP2UidJpmK7QBdMlz3rjPozLkKlS9ydpwm3c8GrElLQW7OKe+I+IvrC72
	 HWUnximfAwhUwwMorL5YXhOFUL/xfGBi6nnMi4dmLyn5irij8yEA3AghwoOG6brmHUm8t
	 8VV3nJNogVWMYSE5qVYH6CaH1sZmR+zSNocUvJw6Y8RX9ydXyC2Qephz071rmEdE4F6VY
	 c+pjV+Q1RGeDkAOvht3J4K1wOEVh/koS0+KatML5iIN/bKzpOBF1LYWNVIbFMayxeIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NlG35jxV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCB1606A31A;
	Thu, 29 Oct 2026 09:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NlG35jxV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E53B1F01825;
	Thu, 29 Oct 2026 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793267395;
	bh=f5wVeAcdts4v03FIKJ/JOAEQfcFu0V9y5FXGBERX1Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NlG35jxV24Z1YixSeCYzFE3xFG+HNtJK13nn+Ycyx9xJlAOucFuA/+KyKql9//itR
	 piKf0GUZxb5qfLhw9ewcnJ81lVksGPJpIdC/IFnaVkQ5jn34zDqk15ECcuFxFBhRkx
	 k0yy6RP/HkVb78tRMXKKM5d08T9SoOLsHHbHWLTCM3Jo5ZUfwnG6V0akNiP5LIAOsc
	 l0D9um68z0c6D9snkZAulc1qCyBCt6v/T7gXwwMoth+wi1XgpHfZ4RmiFNdrxcvBpL
	 3IJ+syhvaQlZxOW4XMezuEm6cb/a6hY9TrZnWFn/l5dcqFNyWs6tLe3iMYG4aXaGXd
	 CxbR9rCboLzpw==
Date: Thu, 29 Oct 2026 10:49:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Ritesh Kumar <quic_riteshk@quicinc.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: display: panel: novatek,nt36672e:
 Document the reset GPIO polarity
Message-ID: <20261029-calculating-imaginary-wolf-ccb2a2@quoll>
References: <20261028095151.1682096-1-vz@kernel.org>
 <20261028095151.1682096-2-vz@kernel.org>
 <20261028-seagull-of-illegal-prestige-6cbbfa@quoll>
 <07c2c10c-f442-480d-b545-666069c06e91@kernel.org>
 <61e36fb1-6959-4c69-9afb-53264ff9331d@kernel.org>
 <cb1b7f4e-f03d-4422-b4ae-4228fe9f86ab@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb1b7f4e-f03d-4422-b4ae-4228fe9f86ab@kernel.org>

On Wed, Oct 28, 2026 at 10:27:35PM +0200, Vladimir Zapolskiy wrote:
> On 10/28/26 16:59, Krzysztof Kozlowski wrote:
> > On 28/10/2026 15:56, Vladimir Zapolskiy wrote:
> > > > We might fix it at some point, so not sure if it is worth documenting in
> > > > the binding. And what about usage of this binding in other projects
> > > > which implement it correctly?
> > > > 
> > > 
> > > In the upstream there is only one user qcm6490-idp.dts, and changing
> > > the polarity will be an ABI breaking change, unfortunately.
> > 
> > And all other projects?
> > 
> 
> It might be a challenging task to check usage of "novatek,nt36672e"
> compatible display panels in all other projects. I've asked about it:
> 
> * https://chatgpt.com/uc/6ae25571-2ef0-83ea-81e5-2522e70c4a93
> 
> The check gives this info:
> 
> 1. Linux kernel - invalid GPIO polarity in the driver and qcm6490-idp.dts,
> 2. Android - invalid GPIO polarity in the copied driver and qcm6490-idp.dts,
> 3. FreeBSD - invalid GPIO polarity in the copied qcm6490-idp.dts, no driver.
> 
> Please let me know, if there are other projects to check. To my
> understanding the RESET_N polarity cannot be corrected anymore,
> and the best option is to clearly document a difference between
> the device and its dt-binding documentation.

It can be correct, just with impact so we choose not to, but
nevertheless hardware wants different polarity, so you should not state
in the binding the incorrect one.

This property corresponds to the hardware, not chosen SW implementation.

Best regards,
Krzysztof

