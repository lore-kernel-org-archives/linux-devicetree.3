Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3AE21D00A;
	Sat, 11 Apr 2026 14:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775916020; cv=none; b=JVNJOIbr5tETTXPhnBOvp32qZXlz5HX7u+bnWaFKYx2u5gZ3qVBzTg00FT76YaXH1SWZ2I02OTDKz4f13IhCefFXVYEAq+SaKnys7YxuPX9OR637icGFySStMq6x64T5PuflmgSYQ4lTpWLZPdTqYEYUbc0tZ6HeIgczQ+w85K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775916020; c=relaxed/simple;
	bh=eqFeAHxrEYN3OzWoPOqqSDvpIsKjCesHynxNPsz0T1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohnbEon07klb+RCddP5ZkXEcQD5KSW0804sGpcodooYP17jkBb+c0MKctc2mnGIWc8m8go4qIWL1+SioaW1WmTYYITL+LvpKiDd3YqH7zj5AmpSprca2YGMRstb0fSXL7O9vvw/5EA8TZfDHgM4mbEYE1/VjSQr7oYcNN9Sx758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHbCmAR0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHbCmAR0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4003EC4CEF7;
	Sat, 11 Apr 2026 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775916019;
	bh=eqFeAHxrEYN3OzWoPOqqSDvpIsKjCesHynxNPsz0T1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sHbCmAR0mSzuOuplVT3pe0uLj4gp/ucoiZJBSWBkwRvajoSeRS7ASF6z8QKhid820
	 oRGZ/K+j+PNibwdt9eNpO820S8PxNPLqPhXrzWE8BL08Op2VK8q524hHyBUUuAEd4i
	 puvjdvvVkdDuGVMDaOp3bDc8K6sR0NnjfPVPO9/2v1RAY+zNRhSQduQA0TWRabdBDj
	 zsMFF+MovczVfM5GkwfzJniipZ3hZg6p834Dy0hAqMFd8j9hmX2fx+hHzu9oF/C2rr
	 oCcVnSoViSbszisjWykFxRnBP49TPIDkeWuffznAoFFcDiQE2bqvDJPADxDxtovTtE
	 uH8FhIuk6wSLQ==
Date: Sat, 11 Apr 2026 16:00:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski@oss.qualcomm.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12
 board DTS
Message-ID: <20260411-condor-of-algebraic-realization-b2e0be@quoll>
References: <20260410171611.2547255-1-nick.hawkins@hpe.com>
 <20260410171611.2547255-4-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260410171611.2547255-4-nick.hawkins@hpe.com>

On Fri, Apr 10, 2026 at 05:16:10PM +0000, nick.hawkins@hpe.com wrote:
> +		uarte: serial@c00003e0 {
> +			compatible = "ns16550a";
> +			reg = <0xc00003e0 0x8>;
> +			clock-frequency = <1846153>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <0>;
> +		};
> +
> +		gic: gic@ce000000 {

Nodename should be interrupt-controller@

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

