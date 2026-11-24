Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533102;
	b=VcZ6b7MXWHsG33AMSDkaEo8fSa7L4mClGhPnQMzRZFKpBrnETcORRudKIM0m8dtbhK7m
	 43/Wr00BDPrVbgZYwvAoagrdVecr47hGKdTjTD9BX2AgoNunVOQT7k+Oebtzzhv6KgeCn
	 3D5Ou4lE+eJNXZU8OlED0O7wkfOVwzirl9aWW6hQJldByDaB436zeCwcvYpvC8A+BuF+e
	 EAgci1pcCXYgS0pzsJMxFyLW7JkpPNMai6AKU3hWIF4Li8nLcX/xdFvmKzPLpb/mb/RhM
	 fhIFZnLQc6g3XycdKU0KQaYGOiSSkVGK4CLsWr6tpnR5TeUR/1idHJok534l49Nzeuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533102;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/P1Weu2PiwuX7ixUHU+bDOjpA+nCOolYU9ZGOscj7cY=;
	b=YEiYIUJNAqca3BtowEzzRd5no7FStNlWPi5DKgRum/lhiPsdqtt0F5/7gcUpdgc5pzIf
	 yV8KpliC5RPvYwTNvZZJXF9SwC3FgzoJT/t5MD8soOac2lmCnaW4Qfdo/NaPjcKG+Biik
	 iJmUDhf8wzSDf4Um3jlwmIAKotM0LpRlAyRNWgg2pcXI3lHIivjdR1Ct17OSjHpA3SrQo
	 E+TURTk8XAyHhXCFMLUz4aACUR54CY21QfpXpFjv9ERU53Tk0MfRX8eMaXPUc4OXMNQ8i
	 SQwvu89mrN9G1pd5WjHTg8kk7U8Jpc70uAyrEYyzDg/6tH6dagslUt1u45eb19jHN6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q63onYis;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E43606A321;
	Tue, 24 Nov 2026 15:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q63onYis
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B841F000D4;
	Tue, 24 Nov 2026 15:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795533102;
	bh=/P1Weu2PiwuX7ixUHU+bDOjpA+nCOolYU9ZGOscj7cY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q63onYis4GcqymyPW+s4d1Gic0Vl1Bg289N1RTm74Bb3nNaAHPDyX+EgSfz5vf2RV
	 EXBJxXAIt2krBCFDIAcmUBi6JOzozTs/RWsPl3oMWxHHahbtLRCv8tYS135yql945a
	 xnGdDhyhv9HMQDIFBRTfyDEpynz+nvw/6bROlibLawuLj8YhUNP8+ZxW9HXNh64yPz
	 AigljJUyO2fnQ0/6RhdXEJsDO5K5wAobXC571Sm8CcPYZtIcRVuZbwgL3SyHhgSPem
	 lHiEDoeYLux28PzNfSGaJrzb3t2S7gA/GCxp+5bAmz6QTp6Wz07RgI9+DKxnShVlXw
	 8kjBEXB7hjb4w==
Date: Tue, 24 Nov 2026 16:11:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	Gary.Yang@cixtech.com, fugang.duan@cixtech.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: Add CIX Sky1 USB3 PHY
Message-ID: <20261124-affable-durable-hare-6566fb@quoll>
References: <20261117022858.2210212-1-hongliang.yang@cixtech.com>
 <20261117022858.2210212-2-hongliang.yang@cixtech.com>
 <20261121-friendly-slim-jackal-fecccb@quoll>
 <20261122033600.25806-1-hongliang.yang@cixtech.com>
 <20261122034004.27137-1-hongliang.yang@cixtech.com>
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
In-Reply-To: <20261122034004.27137-1-hongliang.yang@cixtech.com>

On Sun, Nov 22, 2026 at 11:40:04AM +0800, Hongliang Yang wrote:
> To make the last point explicit: there is one instance of the PHY IP. The
> two lanes share the same APB clock, the same reference clock and the same
> reset pair; they have no separate clock or reset control of their own, so
> they cannot be enabled, reset or powered independently. The per-lane
> register windows only describe the two PMAs inside that instance.

One block and one control set (clocks/resets) does not necessarily
exclude two phys. You insist on programming the lanes together, which I
am not sure is actually required, but I don't mind - it's your device.
The ABI will stay, though, even if you decide to change it in the
future.

Best regards,
Krzysztof

