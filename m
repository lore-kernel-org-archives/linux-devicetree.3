Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432925;
	b=1o9Ga/RiFpCDnkugqA4r8Tptx7NEmpi6feQeEmh31wIdHITSKx/Hto57qOVk9myXn7zt
	 wNxAeyC7eLT8pmeUNsCRY9v0B9FGTIsj7G7z2jNZ9hIiZ9V25ylksX4cWY5RB7EWGTBVG
	 4lqQ5i3EL2kPd+BhhFm4bwE2W88zPjtpeJOrP13MlakKjj7EIk55WUk0dTgDm6Fr70/gL
	 SES2Zk6zGmS0+HIIjPpMI34PNqldpbJibmCdPr/LRtVo+NOavpx8tDMgKOtIkNN8ufO3x
	 5Fb6sRLW7vXa1agfdtvSHW+uSmZswClrqiOrsDeP3LH5z/e94QPJxJ5nLH3n8MBgliw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432925;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=vGo5Rr0biOUzRbqTgcdqL0cPEhygXKXc6hTCMqPuRJs=;
	b=gJX4ZVSTPYtnNe7MjsDCwUAZ4FpXVBPIir7IjJvD86HZjot+YEFpJRk2HIULs+zYYSmq
	 I4IVGWKXN8xlC5AKNocCwBoRytRHe4xAMCTTFzyi0Ad8ANg39ubkbkkNs70WUiDKkQ34z
	 +AXwRz6FlxW72Z5dYBvZ9nRnhvDU8dW6xSHtjMwHsS2QjTQBj2jX8HRqT+CybNYICzNk3
	 cqn/Pes0SWQQ5Gok29di3FZu7FUsCUEUo/J7piilrFNDXLZntLk6n6+BYM015bw32aPUQ
	 g5MMla77PpkQuRpIqaG+Wo7sT3XKstm3g0jdMC0ThryLoa95MT4v0xdfcKfn4ZSiWlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TaEAGtfb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC0606A31A;
	Mon, 23 Nov 2026 11:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TaEAGtfb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E6E71F000C0;
	Mon, 23 Nov 2026 11:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795432925;
	bh=vGo5Rr0biOUzRbqTgcdqL0cPEhygXKXc6hTCMqPuRJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TaEAGtfb1D0eMiLppFjMfL2pfXlRlJ3/3z+jlWljMxV/TbpZTKRwWyknjQLNr/AO3
	 OaUwdmfBmImt98xPKAoI4t0TNxr521PoFDPjzDSWD2tJ70wUgLfaHPqKTalEIFn8oj
	 Ij9uvOUdN8jRITkjCClWXYyAN0qJvIJoIB08KH2pDKDtxrfNcOcpfG7BPwUyESRWng
	 uaK4lGcnsta2D3EWdAFhFsldfHRPT3yMWJ+vNbHFblZcw05AC/c4AyOG50REHz1SOw
	 74nmuw1vWsmy0YL9cl5M7XQmjTPHR4WgsSZfnC28cCEZgl+QvML5PHa6OAaSSXIAdp
	 IjeIy4qCkDygw==
Date: Mon, 23 Nov 2026 12:22:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/8] dt-bindings: net: Add Synaptics SL2610 DWMAC
Message-ID: <20261123-aromatic-feathered-whale-bfc874@quoll>
References: <20261116135442.4827-1-jszhang@kernel.org>
 <20261116135442.4827-4-jszhang@kernel.org>
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
In-Reply-To: <20261116135442.4827-4-jszhang@kernel.org>

On Mon, Nov 16, 2026 at 09:54:37PM +0800, Jisheng Zhang wrote:
> +  phy-mode:
> +    enum:
> +      - rmii
> +      - rgmii
> +      - rgmii-id
> +      - rgmii-rxid
> +      - rgmii-txid

Missing constraints for interrupts, clocks, resets, domains and so on.

> +
> +required:
> +  - compatible
> +  - syna,syscon
> +  - phy-mode
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    chip: syscon@f7e10000 {
> +        compatible = "syna,sl2610-soc-syscon", "syscon";
> +        reg = <0xf7e10000 0x10000>;
> +        clocks = <&osc>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };

Not relevant, drop entire node.


Best regards,
Krzysztof

