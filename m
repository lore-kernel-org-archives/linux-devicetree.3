Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6211E505;
	Sat, 28 Mar 2026 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774706452; cv=none; b=uq+zd4BD8/dlk+x6Ltl3rGmjWeJDkWQNRugTRuusRiKmUcrA4sFYkHqIrJf3gCSNV5B6lUKdOq5/BU08sALcaLhLby10AcHlP8NU3tumbuyjAt7up+2+s8X8i3U3uX1ykjEI/7b2z79YwCUHK5FZjp6bhiMQhGlYJJoIsvIKXT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774706452; c=relaxed/simple;
	bh=Zobnm8Gsre+7Kuc0iSNYsM0HgWB1z4kDfKWLknn5fLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SRmuTzVqmRoC1pcsP3C1LFbSePjvwrDCNy3uZZZtX7XLhs4JcsoaTpi0XraZNd/WwhNCUDs/gMjHvk5d/7NK6AehXuRtxolHwlQqKam76UjN21IegXaGwsmNXEjKB0nEpFG/RovbvCwzV1XpSqGVh8MrWNJutYUYMwpfx03Y5x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HddS3TNe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HddS3TNe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76B0C4CEF7;
	Sat, 28 Mar 2026 14:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774706452;
	bh=Zobnm8Gsre+7Kuc0iSNYsM0HgWB1z4kDfKWLknn5fLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HddS3TNe9Jas0l8WxwWwGbr47IPEkYAMtc9BAKgQVjfR4Gp1qjsJEcZNeLnixauzX
	 22gb8Zx49DDGpHAnVF5AW9MqzyrTuBuWgrA0dP9gNEdgmdFqnA++q/GdA6vWq3zdSG
	 B8eR9o6b1Tumk3ZB/hmeQeqA7lX2ny/cJ4copmQTOoc/64UyBBg0OUTwepnAcJIygF
	 j0BbdE8Ox2iMFJpeL8RCgrFS1KaDFv8z7gGG70SMrYqVyJCD2m1bTITLGNygNzRSFq
	 KZYxGHR7w4vPRYpinDDzoktkbsG4Vxd/Ik27CXBA6+4pfxUqnhKSsY66220iG1cKNK
	 sF/3unpoLkDvw==
Date: Sat, 28 Mar 2026 15:00:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: catalin.marinas@arm.com, will@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] arm64: Kconfig: Add ARCH_HPE platform
Message-ID: <20260328-resolute-tan-waxbill-3e10c4@quoll>
References: <20260327174445.3275835-1-nick.hawkins@hpe.com>
 <20260327174445.3275835-3-nick.hawkins@hpe.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260327174445.3275835-3-nick.hawkins@hpe.com>

On Fri, Mar 27, 2026 at 12:44:44PM -0500, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add the ARCH_HPE config for HPE ARM64 BMC SoCs to Kconfig.platforms.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  arch/arm64/Kconfig.platforms | 11 +++++++++++
>  1 file changed, 11 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

